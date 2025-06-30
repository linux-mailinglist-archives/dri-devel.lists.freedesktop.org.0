Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF026AEE00B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E670310E21F;
	Mon, 30 Jun 2025 14:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KBmql+Fx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3361A10E21F;
 Mon, 30 Jun 2025 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NsoRSXh/tF63PrYJexdAXdZ1iyK7cA3n0ECT2UqM9gs=; b=KBmql+FxfDgi4UGUkuxAaDOdbz
 ZR1L6ZpXCt3JvvywEu3kqpSxdOD6Iod9ValT7qglwtcVp1pKqgK5N9IDfqt+WkDZkcRvLl8MXxVMK
 sNChfg8iePJMjiPYghqjq6hPdzveEbMypthA3ofnVvDyyr8eutjmPxThBStCz483+b97G3aO0b83t
 U6ZHWyXe4VFj90q3/q/hgaIM4E8EsjDqqX8T5sNLMlz/Qn30Pb0k6S1OaxcUBgXrTI8PUgSY3ZVES
 zI6UrlwS79eBa8aWEzqmkPQFR8Fk3t/J77xTm5dOBYG0L8qR3orgwPYWw/EGzdi5rtGlH0vN9t4mr
 Sw0Z+D4w==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uWF7a-00AVLt-5J; Mon, 30 Jun 2025 16:04:34 +0200
Message-ID: <4487245c-17d0-4e4a-b3fb-209a95c60664@igalia.com>
Date: Mon, 30 Jun 2025 11:04:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/sched: Make timeout KUnit tests faster
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-3-8be5cca2725d@igalia.com>
 <2670247a8982f794a508f4cf3ae43ad7ac66862a.camel@mailbox.org>
 <27c7fef3-ce37-48b9-bf63-3b3417618835@igalia.com>
 <8e727f9644df9ba7d8c5f3966e146e5eb0684121.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <8e727f9644df9ba7d8c5f3966e146e5eb0684121.camel@mailbox.org>
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

Hi Philipp,

On 30/06/25 09:20, Philipp Stanner wrote:
> On Mon, 2025-06-30 at 09:05 -0300, Maíra Canal wrote:
>> Hi Philipp,
>>
>> On 30/06/25 08:53, Philipp Stanner wrote:
>>> On Wed, 2025-06-18 at 11:47 -0300, Maíra Canal wrote:
>>>> As more KUnit tests are introduced to evaluate the basic
>>>> capabilities
>>>> of
>>>> the `timedout_job()` hook, the test suite will continue to
>>>> increase
>>>> in
>>>> duration. To reduce the overall running time of the test suite,
>>>> decrease
>>>> the scheduler's timeout for the timeout tests.
>>>>
>>>> Before this commit:
>>>>
>>>> [15:42:26] Elapsed time: 15.637s total, 0.002s configuring,
>>>> 10.387s
>>>> building, 5.229s running
>>>>
>>>> After this commit:
>>>>
>>>> [15:45:26] Elapsed time: 9.263s total, 0.002s configuring, 5.168s
>>>> building, 4.037s running
>>>
>>> I guess those times were measured with the entire series?
>>
>> No, they were measured without the new test that I introduced in the
>> next patch.
>>
>>>
>>> It's not clear to me whether this patch is independent from the
>>> series.
>>> I suppose it is. We should aim towards having series's narrowly
>>> focused
>>> topic-wise, but I get why you included it here.
>>
>>   From my perspective, this patch is a preparation to the next one. As
>> I'll introduce another timeout-related test in the next patch, I was
>> trying to ensure that we will keep the time-budget reasonable.
>>
>>>
>>> That said, is there a specific reason for you aiming at ~10s
>>> (9.263)?
>>> That's only a bit faster than the 15.637.
>>>
>>
>> Actually, the only thing that this patch affects is the runtime. So,
>> it
>> went from 5.229s to 4.037s (-22.8%). However, as we add more and more
>> timeout tests, the absolute difference would get more significant.
> 
> I understand that. My point is that the decrease of total run time that
> you state in your commit message doesn't sound that significant to me.
> ~10s is still pretty long.
> 
>>
>>> Couldn't it make sense, as you're at it already, to speed this up
>>> to
>>> just a few seconds, like 3-5? Then it should really be quiet IRW
>>> that
>>> topic for a while.
>>
>> I believe that further decreasing the timeout could lead to racy
>> scenarios and flaky tests.
> 
> That doesn't make sense to me. What could race with what? I guess you
> mean the completion's timeout racing with the signaling timer.

I discussed a bit about it with Tvrtko in v1 [1][2].

[1] 
https://lore.kernel.org/all/7cc3cc3d-7f67-4c69-bccb-32133e1d7cba@igalia.com/
[2] 
https://lore.kernel.org/all/146f3943-0a94-4399-9f49-be8228a86828@igalia.com/

Best Regards,
- Maíra

> 
> Anyways, I'm personally not suffering from the tests being too slow. So
> just take this as ideas. I'm fine with it being merged as it is now.
> 
> 
> P.
> 
>>
>> Best Regards,
>> - Maíra
>>
>>>
>>>
>>> P.
>>>


