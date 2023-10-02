Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9CA7B5B40
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 21:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F39210E22F;
	Mon,  2 Oct 2023 19:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553410E22F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 19:28:19 +0000 (UTC)
Received: from [192.168.2.166] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3908266072E6;
 Mon,  2 Oct 2023 20:28:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696274897;
 bh=VncolUacwShJRXUnmRFLyNX7YGgpYmIuNvpYd4udSIs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KEHflzPQ9DpVtLthaJdLTKw7qMODOTSkU18JJqTBWR8Bzlqkad44+s6IeoqGrNGiQ
 ajCXOu4CKtvps3Ld6VgRq6sxQGLKKj/NPVCH9N3uGxUKEHApesimkBjUGHPPEJUhsq
 LJNgObx33Q0INSSrEzKRsLr8CO0yIxzrmrfu+wBBgDQDYulSImwjIwTyEeFMTkOvx4
 GFGLm0i9/KhbWehto8MfIebxXdXcHPda2BwYfjYQgsdh8eyRKsN5A5d5vyaqtQibaa
 NhzvlA/6X5kNDJuOWzG68VOr3ylWFwqLnBcIdo/VJi+Xfb85ZlyiuzMCXLTbMUSgbk
 ymVUxyV8DiR4A==
Message-ID: <d93375df-215a-2325-ba6d-4616dfed0947@collabora.com>
Date: Mon, 2 Oct 2023 22:28:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v17 13/18] drm/shmem-helper: Add memory shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-14-dmitry.osipenko@collabora.com>
 <20230915104633.0d5c3932@collabora.com>
 <454c464e-4534-7ec3-6d38-49b7df83c7be@collabora.com>
 <20230926093517.11a172ad@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230926093517.11a172ad@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/23 10:35, Boris Brezillon wrote:
>> On 9/15/23 11:46, Boris Brezillon wrote:
>>> The naming becomes quite confusing, with drm_gem_shmem_unpin_locked()
>>> and drm_gem_shmem_unpin_pages_locked(). By the look of it, it seems to
>>> do exactly the opposite of drm_gem_shmem_swapin_locked(), except for
>>> the missing ->evicted = true, which we can move here anyway, given
>>> drm_gem_shmem_purge_locked() explicitly set it to false anyway. The
>>> other thing that's missing is the
>>> drm_gem_shmem_update_pages_state_locked(), but it can also be moved
>>> there I think, if the the ->madv update happens before the
>>> drm_gem_shmem_unpin_pages_locked() call in
>>> drm_gem_shmem_purge_locked().
>>>
>>> So, how about renaming this function drm_gem_shmem_swapout_locked()?  
>> The swapout name would be misleading to me because pages aren't moved to
>> swap, but allowed to be moved. I'll rename it to
>> drm_gem_shmem_shrinker_unpin_locked().
> If you go this way, I would argue that drm_gem_shmem_swapin_locked() is
> just as incorrect as drm_gem_shmem_swapout_locked(), in that
> drm_gem_get_pages() might just return pages that were flagged
> reclaimable but never reclaimed/swapped-out. I do think that having
> some symmetry in the naming makes more sense than being 100% accurate.

That function is internal to drm-shmem and is used for both eviction and
purging. Having "swap-out" invoked by the purging also doesn't sound good.

Given that the function in question mainly "unmaps" the pages, what
about drm_gem_shmem_shkinker_unmap_pages_locked()?

>>>>  {
>>>>  	struct drm_gem_object *obj = &shmem->base;
>>>>  	struct drm_device *dev = obj->dev;
>>>>  
>>>>  	dma_resv_assert_held(shmem->base.resv);
>>>>  
>>>> -	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
>>>> +	if (shmem->evicted)
>>>> +		return;
>>>>  
>>>>  	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);  
>>> Are we sure we'll always have sgt != NULL? IIRC, if the GEM is only
>>> mmap-ed in userspace, get_sgt() is not necessarily called by the driver
>>> (needed to map in GPU space), and we have a potential NULL deref here.
>>> Maybe that changed at some point in the series, and sgt is
>>> unconditionally populated when get_pages() is called now.  
>> The sgt is always set in this function because it's part of shrinker and
>> shrinker doesn't touch GEMs without sgt.
> Okay, that's questionable. Why would we not want to reclaim BOs that
> are only mapped in userspace (sgt == NULL && pages_use_count > 0 &&
> pages_pin_count == 0)? I agree that creating such a BO would be
> pointless (why create a buffer through DRM if it's not passed to the
> GPU), but that's still something the API allows...

This is a pre-existing behaviour. There is no driver that uses pages
without sgt, hence there is nobody to test such code paths.

Maybe will worth to explicitly prohibit usage of get_pages() without
having sgt for clarity. But this should be separate to this patchset, IMO.

-- 
Best regards,
Dmitry

