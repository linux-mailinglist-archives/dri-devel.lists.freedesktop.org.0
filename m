Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2728729E2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 22:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5762E112D13;
	Tue,  5 Mar 2024 21:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eK71pGBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCD0112D11;
 Tue,  5 Mar 2024 21:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709675943;
 bh=Pi6T1W5bDFqqI2XXQ+4KYgY88rVQ95Vyl3n/fcXtOEo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eK71pGBZ6Cz51o8qikvWm9K+PhISQRoVeIfPrE1JiwaG7q1A3dZgkjtiTAbgZgp4B
 m69Q9A106Ja++jlIoMXxTtnhwo2cpnaGCPXX+0rOsMd7edcefjvG+OthSgVAm0YG+f
 84likditwTT7tx9UMns7EZBUfNHVdaIggZo1SEbHhX2IVe3jHtEaJO1DB/Xtbr53Hk
 BCF2Q3TBsTYA3Lh7WSssBcx882ZZbaRRWyKc6XKmxYGQjlL0JzyxoACxfQkGzlgTS5
 NfyWcJb5SAZclkjKZJdvPiySMBpD7/0op+jwvAnR0C3GCqBiyzqwaht8c3ZJeFNSQ6
 nfSnf4FKoD2aw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 64017378149B;
 Tue,  5 Mar 2024 21:59:01 +0000 (UTC)
Message-ID: <c844b72e-6c4e-4c99-8e7f-b9c62f63209d@collabora.com>
Date: Wed, 6 Mar 2024 00:58:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and
 console
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-1-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/24 13:14, Thomas Zimmermann wrote:
> Dma-buf locking semantics require the caller of pin and unpin to hold
> the buffer's reservation lock. Fix DRM to adhere to the specs. This
> enables to fix the locking in DRM's console emulation. Similar changes
> for vmap and mmap have been posted at [1][2]
> 
> Most DRM drivers and memory managers acquire the buffer object's
> reservation lock within their GEM pin and unpin callbacks. This
> violates dma-buf locking semantics. We get away with it because PRIME
> does not provide pin/unpin, but attach/detach, for which the locking
> semantics is correct.
> 
> Patches 1 to 8 rework DRM GEM code in various implementations to
> acquire the reservation lock when entering the pin and unpin callbacks.
> This prepares them for the next patch. Drivers that are not affected
> by these patches either don't acquire the reservation lock (amdgpu)
> or don't need preparation (loongson).
> 
> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
> internally it still gets the reservation lock.
> 
> With the updated GEM callbacks, the rest of the patchset fixes the
> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
> GEM buffer object inplace while updating its content. This required
> a implicit pinning and apparently amdgpu didn't do this at all.
> 
> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
> The former function map a GEM buffer into the kernel's address space
> with regular vmap operations, but keeps holding the reservation lock.
> The _vunmap_local() helper undoes the vmap and releases the lock. The
> updated GEM callbacks make this possible. Between the two calls, the
> fbdev emulation can update the buffer content without have the buffer
> moved or evicted. Update fbdev-generic to use vmap_local helpers,
> which fix amdgpu. The idea of adding a "local vmap" has previously been
> attempted at [3] in a different form.
> 
> Patch 11 adds implicit pinning to the DRM client's regular vmap
> helper so that long-term vmap'ed buffers won't be evicted. This only
> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
> there are no practical changes.
> 
> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
> operations in gem-vram and qxl. These pin operations are not supposed
> to be part of vmap code, but were required to keep the buffers in place
> for fbdev emulation. With the conversion o ffbdev-generic to to
> vmap_local helpers, that code can finally be removed.
> 
> Tested with amdgpu, nouveau, radeon, simpledrm and vc4.
> 
> [1] https://patchwork.freedesktop.org/series/106371/
> [2] https://patchwork.freedesktop.org/series/116001/
> [3] https://patchwork.freedesktop.org/series/84732/
> 
> Thomas Zimmermann (13):
>   drm/gem-shmem: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/gem-vram: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/msm: Provide msm_gem_get_pages_locked()
>   drm/msm: Acquire reservation lock in GEM pin/unpin callback
>   drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
>   drm/nouveau: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
>   drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
>   drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()
>   drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()
>   drm/client: Pin vmap'ed GEM buffers
>   drm/gem-vram: Do not pin buffer objects for vmap
>   drm/qxl: Do not pin buffer objects for vmap

The patches look good. I gave them fbtest on virtio-gpu, no problems
spotted.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # virtio-gpu

-- 
Best regards,
Dmitry

