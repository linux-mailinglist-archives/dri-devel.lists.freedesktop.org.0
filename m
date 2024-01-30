Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EED84208D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054BD112EB5;
	Tue, 30 Jan 2024 10:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A1F112EB3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706609102;
 bh=OlF6rYfzSLDc07Nix/XsJE3v1wpI2M+vC30AXD7tPx8=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=wEPrVcL13eYKKd2hTvCFzEW2+o1GszHbxGVTwxTZOH5qLSZuXBT8ah8hb9D/nu4cJ
 28IM6RvvT1owcV6fnNsjvFIV6W+CkGtsQWgHqgT1tg74qA/8d0mvQ99VDi6UndfUa0
 xfME/koSHKPTkTKquOw0vVY1UvhnJOaE7VQJPfk6w+qA77yjmisW0NGf86ajEf3raN
 DnSKCSecrMyHfbrxVXGfiEwPyczs8F9SrX7/lLw78dOi5aHCv9jZ5OOlayHFJaXxrq
 XcPcr8hzDIp3Mt8yV45ZjE9Twxl1tLMmyseedue1uOU5ZgWVMnOvjygPLPf8KS4QkV
 9Pb8olRw/A+/g==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 22FE437809D0;
 Tue, 30 Jan 2024 10:05:01 +0000 (UTC)
Message-ID: <12f365c7-6827-4960-bb6d-11b79c4bb328@collabora.com>
Date: Tue, 30 Jan 2024 13:04:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
 <20240125100703.76d802ad@collabora.com> <Zbi1pzY3CbQxnnBQ@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <Zbi1pzY3CbQxnnBQ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kernel@collabora.com, Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/30/24 11:39, Daniel Vetter wrote:
> On Thu, Jan 25, 2024 at 10:07:03AM +0100, Boris Brezillon wrote:
>> On Fri,  5 Jan 2024 21:46:16 +0300
>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>
>>>   *
>>>   * This function Increases the use count and allocates the backing pages if
>>>   * use-count equals to zero.
>>> + *
>>> + * Note that this function doesn't pin pages in memory. If your driver
>>> + * uses drm-shmem shrinker, then it's free to relocate pages to swap.
>>> + * Getting pages only guarantees that pages are allocated, and not that
>>> + * pages reside in memory. In order to pin pages use drm_gem_shmem_pin().
>>
>> I still find this explanation confusing, if pages are allocated, they
>> reside in memory. The only difference between drm_gem_shmem_get_pages()
>> and drm_gem_shmem_pin_pages() is that the former lets the system
>> reclaim the memory if the buffer is idle (no unsignalled fence attached
>> to the dma_resv).
>>
>> We also need to describe the workflow for GEM validation (that's the
>> TTM term for the swapin process happening when a GPU job is submitted).
>>
>> 1. Prepare the GPU job and initialize its fence
>> 2. Lock the GEM resv
>> 3. Add the GPU job fence to the resv object
>> 4. If the GEM is evicted
>>    a. call drm_gem_shmem_swapin_locked()
>>    b. get the new sgt with drm_gem_shmem_get_pages_sgt_locked()
>>    c. repopulate the MMU table (driver internals)
> 
> Might be good to explain where to call drm_sched_job_arm() here for
> drivers using drm/sched, since that also needs to be at a very specific
> point. Probably best to flesh out the details here by linking to the
> relevant drm/sched and gpuvm functions as examples.
> 
>> 5. Unlock the GEM dma_resv
>> 6. Submit the GPU job
>>
>> With this sequence, the GEM pages are guaranteed to stay around until
>> the GPU job is finished.
> 
> Yeah I think the comment needs to explain how this ties together with
> dma_resv locking and dma_resv fences, otherwise it just doesn't make much
> sense.
> 
> This holds even more so given that some of the earlier drivers derived
> from i915-gem code (and i915-gem itself) use _pin() both for these more
> permanent pinnings, and also to temporarily put the memory in place before
> it all gets fenced and then unpinned&unlocked.
> 
> So would be really good to have the sharpest possible nomeclatura here we
> can get, and link between all the related concepts and functions in the
> kerneldoc.
> 
> Some overview flow like Boris sketched above in a DOC: section would also
> be great.

Thank you all for the feedback! I'll add all this doc in the next version

-- 
Best regards,
Dmitry

