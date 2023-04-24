Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BAE6ECDDE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 15:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0110E4F0;
	Mon, 24 Apr 2023 13:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43FA10E4F0;
 Mon, 24 Apr 2023 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VJ6aqpWgPeGvM1GhnkNKoblslgPvV3JKY89c5BlTEXc=; b=JcP5wLNowUmLPotHeHcX+J9h86
 P80OboDWmzKLDUl079c4UbBnq6vWQAr4ObuR7aJTmtvccUuNBYMsdnxs0sKFCvE/PwznNz2GpLRH7
 p97HeEVbVvZmoTHqs3C3KH9xwTZUQpXHP4JWM9ARwTtgarqGpKeoR36v0V5yC3R/uYdvXUm7W4xUC
 SsneYGeoe6vVjHa6LM5mM8r2/NnW7a7OUfcqtBVWOHT27FpyDbkRvadM8RJomRY1Og0R7V6tBZdf6
 xwucKUMfkGr/kPcq0hsRe2aC5tOSmB3l09GoduUBJd87iobzYzhtcxrc2erJs8XDcGxTX2nbtFG8D
 fK3zo3nA==;
Received: from [152.249.146.45] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pqwDw-00AtVt-PD; Mon, 24 Apr 2023 15:27:20 +0200
Message-ID: <717b333b-7af6-063e-d50d-bb2b3bbcecb4@igalia.com>
Date: Mon, 24 Apr 2023 10:26:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian, thank you for your comments.

Em 24/04/2023 04:03, Christian König escreveu:
> Am 24.04.23 um 03:43 schrieb André Almeida:
>> When a DRM job timeout, the GPU is probably hang and amdgpu have some
>> ways to deal with that, ranging from soft recoveries to full device
>> reset. Anyway, when userspace ask the kernel the state of the context
>> (via AMDGPU_CTX_OP_QUERY_STATE), the kernel reports that the device was
>> reset, regardless if a full reset happened or not.
>>
>> However, amdgpu only marks a context guilty in the ASIC reset path. This
>> makes the userspace report incomplete, given that on soft recovery path
>> the guilty context is not told that it's the guilty one.
>>
>> Fix this by marking the context guilty for every type of reset when a
>> job timeouts.
> 
> The guilty handling is pretty much broken by design and only works 
> because we go through multiple hops of validating the entity after the 
> job has already been pushed to the hw.

I see, thanks.

> 
> I think we should probably just remove that completely and use an 
> approach where we check the in flight submissions in the query state 
> IOCTL.

Like the DRM_IOCTL_I915_GET_RESET_STATS approach?

 > See my other patch on the mailing list regarding that.

Which one, the "[PATCH 1/8] drm/scheduler: properly forward fence 
errors" series?

> 
> Additional to that I currently didn't considered soft-recovered 
> submissions as fatal and continue accepting submissions from that 
> context, but already wanted to talk with Marek about that behavior.
> 

Interesting. I will try to test and validate this approach to see if the 
contexts keep working as expected on soft-resets.

> Regards,
> Christian.
