Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA8ACCB76
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 18:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7865510E972;
	Tue,  3 Jun 2025 16:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nInpFzyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F8210E932;
 Tue,  3 Jun 2025 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o00aR12jwm7c4BkPDVzJqD7kLtjvCsd4KPoJDLs9Mmo=; b=nInpFzySSgY7qAFG2beganEgry
 gNqcbIPbPBOuqOFjxE9PNLdbbxUyrg01v1JiZE1Ie/GSY67g0iqwiOmKDeuG+IfF0jObAsZUQ9qwa
 HSg+hjr6ja3HBSL2oYzoq+Z8K7sOOb31DxfxXYBQaNkNMQ9EmMnOsM/CWMI2YZFUzwCrVsquiglol
 7hdww/SKk3LapUxbS1KM3x0KngwwfkBPjdIe3mHo4GkF7Q9+agNeQlAlimTphzxWuZQN/qBSZ+Be4
 YEGSZPkxE1osfmO32irnUfu313BYL1WUgB+VnRfENNKcfnN7/H+A0S2JZJNgbFeAnsb7t+tkEQCmG
 LZaXJe0Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uMUtV-00GlU8-Lx; Tue, 03 Jun 2025 18:53:45 +0200
Message-ID: <6aa998eb-5991-472e-8e6a-08ebf3fe9876@igalia.com>
Date: Tue, 3 Jun 2025 17:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
 <e969d68a-aff3-4560-be28-de17498d7b6e@igalia.com>
 <d5bbe511-97ab-42aa-97c3-e669849ebc12@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d5bbe511-97ab-42aa-97c3-e669849ebc12@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/06/2025 17:27, Christian König wrote:
> On 6/3/25 17:00, Tvrtko Ursulin wrote:
>>
>> On 03/06/2025 14:13, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Jun 02, 2025 at 04:42:27PM +0200, Christian König wrote:
>>>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>>>> On 15/05/2025 14:15, Christian König wrote:
>>>>>> Hey drm-misc maintainers,
>>>>>>
>>>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>>>
>>>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>>>
>>>>> Looks like the backmerge is still pending?
>>>>
>>>> Yes, @Maarten, @Maxime and @Thomas ping on this.
>>>
>>> It's done
>>
>> Thanks Maxime!
>>
>> Christian, I can merge 2-5 to take some load off you if you want?
> 
> Sure, go ahead.
> 
> Then I can call it a day for today :)

Pushed. Thanks for the reviews once more!

I will aim to respin the rest of the series ASAP but may be delayed a 
few days.

Regards,

Tvrtko

