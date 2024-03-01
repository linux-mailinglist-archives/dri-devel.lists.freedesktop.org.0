Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6986E5EE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 17:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C251610EB8A;
	Fri,  1 Mar 2024 16:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2+MCDChq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A6310EB34;
 Fri,  1 Mar 2024 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709311456;
 bh=g8MDAPa9ELVeta78bCU6vupJUIdfsNOxvkK6Oibr55Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=2+MCDChq+ExP6DxPQSfTJIUDZbCwv3b0vuXu4KLe76ogMlJsjF3Pf7dlykMkroSlx
 AbzWFFQUqsZM5iWgOCDb7NH6MED5S594I/D88HxrPCrtj/LQyXI5I8edwRG3iMW4TD
 kUwXOhQqBznTo/JR0iCccWzlbGt/g5Rm7W80zu/rvUGdwuaWIDI0zANURZWoAWC7Ng
 5sdQXPvmGBLR36YOkV6OYEEGjP85ReLsS+EgdwJFSG1oBR3CWnaYsy3qfMTsp2hhLJ
 6ljD9wX/Rd7FxUuiFQnkvrzP6sia1wSZm1+zEo53G3VKfnmev8SHDG1EOzbKNeH5KE
 y9xxRHtmFddPQ==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA69837813F2;
 Fri,  1 Mar 2024 16:44:13 +0000 (UTC)
Message-ID: <07e10e3f-9e48-4b0d-b320-fffdece23a2c@collabora.com>
Date: Fri, 1 Mar 2024 19:44:13 +0300
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
 <d854f70b-1d62-4da7-bfbd-2184456d1d25@collabora.com>
 <cd01e963-dd4d-4554-9feb-1750f72cc260@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <cd01e963-dd4d-4554-9feb-1750f72cc260@suse.de>
Content-Type: text/plain; charset=UTF-8
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

On 2/28/24 11:19, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.02.24 um 19:14 schrieb Dmitry Osipenko:
>> Hello,
>>
>> Thank you for the patches!
>>
>> On 2/27/24 13:14, Thomas Zimmermann wrote:
>>> Dma-buf locking semantics require the caller of pin and unpin to hold
>>> the buffer's reservation lock. Fix DRM to adhere to the specs. This
>>> enables to fix the locking in DRM's console emulation. Similar changes
>>> for vmap and mmap have been posted at [1][2]
>>>
>>> Most DRM drivers and memory managers acquire the buffer object's
>>> reservation lock within their GEM pin and unpin callbacks. This
>>> violates dma-buf locking semantics. We get away with it because PRIME
>>> does not provide pin/unpin, but attach/detach, for which the locking
>>> semantics is correct.
>>>
>>> Patches 1 to 8 rework DRM GEM code in various implementations to
>>> acquire the reservation lock when entering the pin and unpin callbacks.
>>> This prepares them for the next patch. Drivers that are not affected
>>> by these patches either don't acquire the reservation lock (amdgpu)
>>> or don't need preparation (loongson).
>>>
>>> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
>>> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
>>> internally it still gets the reservation lock.
>>>
>>> With the updated GEM callbacks, the rest of the patchset fixes the
>>> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
>>> GEM buffer object inplace while updating its content. This required
>>> a implicit pinning and apparently amdgpu didn't do this at all.
>>>
>>> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
>>> The former function map a GEM buffer into the kernel's address space
>>> with regular vmap operations, but keeps holding the reservation lock.
>>> The _vunmap_local() helper undoes the vmap and releases the lock. The
>>> updated GEM callbacks make this possible. Between the two calls, the
>>> fbdev emulation can update the buffer content without have the buffer
>>> moved or evicted. Update fbdev-generic to use vmap_local helpers,
>>> which fix amdgpu. The idea of adding a "local vmap" has previously been
>>> attempted at [3] in a different form.
>>>
>>> Patch 11 adds implicit pinning to the DRM client's regular vmap
>>> helper so that long-term vmap'ed buffers won't be evicted. This only
>>> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
>>> there are no practical changes.
>>>
>>> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
>>> operations in gem-vram and qxl. These pin operations are not supposed
>>> to be part of vmap code, but were required to keep the buffers in place
>>> for fbdev emulation. With the conversion o ffbdev-generic to to
>>> vmap_local helpers, that code can finally be removed.
>> Isn't it a common behaviour for all DRM drivers to implicitly pin BO
>> while it's vmapped? I was sure it should be common /o\
> 
> That's what I originally thought as well, but the intention is for pin
> and vmap to be distinct operation. So far each driver has been
> different, as you probably know best from your vmap refactoring. :)
> 
>>
>> Why would you want to kmap BO that isn't pinned?
> 
> Pinning places the buffer object for the GPU. As a side effect, the
> buffer is then kept in place, which enables vmap. So pinning only makes
> sense for buffer objects that never move (shmem, dma). That's what patch
> 11 is for.
> 
>>
>> Shouldn't TTM's vmap() be changed to do the pinning?
> 
> I don't think so. One problem is that pinning needs a memory area (vram,
> GTT, system ram, etc) specified, which vmap simply doesn't know about.
> That has been a problem for fbdev emulation at some point. Our fbdev
> code tried to pin as part of vmap, but chose the wrong area and suddenly
> the GPU could not see the buffer object any longer.  So the next best
> thing for vmap was to pin the buffer object where ever it is currently
> located. That is what gem-vram and qxl did so far. And of course, the
> fbdev code needs to unpin and vunmap the buffer object quickly, so that
> it can be relocated if the GPU needs it.  Hence, the vmap_local
> interface removes such short-term pinning in favor of holding the
> reservation lock.
> 
>>
>> I missed that TTM doesn't pin BO on vmap() and now surprised to see it.
>> It should be a rather serious problem requiring backporting of the
>> fixes, but I don't see the fixes tags on the patches (?)
> 
> No chance TBH. The old code has worked for years and backporting all
> this would require your vmap patches at a minimum.
> 
> Except maybe for amdgpu. It uses fbdev-generic, which requires pinning,
> but amdgpu doesn't pin. That looks fishy, but I'm not aware of any bug
> reports either. I guess, a quick workaround could fix older amdgpu if
> necessary.

Thanks! I'll make another pass on the patches on Monday

-- 
Best regards,
Dmitry

