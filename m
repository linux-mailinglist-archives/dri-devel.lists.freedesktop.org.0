Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3CF2C3E46
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 11:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1A46E925;
	Wed, 25 Nov 2020 10:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2F56E925
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 10:41:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so1664494wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 02:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iY0w/rYhU4zQmtV4vIRlhxfmxncXrSZhBMnwcfQeBeY=;
 b=CFG5kTEekjvLVH5LPBBa/XVG5aPQwA5S0E9uQLYuRUPuHs+UEWQBSq3ZZwLXDlyO3E
 lzQ6qGX3nbo1l/Z9LCgMIV2XSyzzmIWbE92kjTTkBblEsdi32Y1MPtlBZB5C+mveUu3T
 y8weqUkcnnbrhY7tO5nDngbeMtCodvsnC4x7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iY0w/rYhU4zQmtV4vIRlhxfmxncXrSZhBMnwcfQeBeY=;
 b=E7zQns7D2RHJ5MUs3jQiz5C9U7te4jLVMrGEO8r5YFzdPxBI4LzDK6a9lIGj64KWT7
 cxwCpGCFm4WuwEYqMtIfwYFBNqCpFVXsIP5lNLizYzXjh+r6zfOp/kWZeHoxUXo0FMaY
 ya/cVyuDfOysOshNgFvvTokCGQKGLfggl32fF6+hJtHSp65c/eXeIHDYegjCwmclRlzO
 7DnurzPYqakmDyduMu/nFZtgtahhonF+UDuURZ7C8XfWja5LrkjHNxtosF9JHm3BlRSV
 3W9fobP84l9fkk/kTCJXLuI8nA+GiFqmtD8zi0OYXrztq7F8jSekBdZWwx3i6xwv9u+7
 wkYg==
X-Gm-Message-State: AOAM532octwT58Te4BR33eeyfNJM7bmzRAjMZzYVAZ8jwBIfcT4+WqmT
 I5yXZuXHqxcKj59Nf/OH1c/ozA==
X-Google-Smtp-Source: ABdhPJwMtjtfCp6ndhlm6QHnZqdB/BQqXsROKQj+rYtpwj2hdB1EDoR9fcA3ucHXkDTMBriiTtlFOA==
X-Received: by 2002:a1c:44d4:: with SMTP id r203mr3238854wma.60.1606300901561; 
 Wed, 25 Nov 2020 02:41:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w17sm4117545wru.82.2020.11.25.02.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 02:41:40 -0800 (PST)
Date: Wed, 25 Nov 2020 11:41:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v3 08/12] drm/amdgpu: Split amdgpu_device_fini into early
 and late
Message-ID: <20201125104138.GW401619@phenom.ffwll.local>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-9-git-send-email-andrey.grodzovsky@amd.com>
 <20201124145318.GS401619@phenom.ffwll.local>
 <21f9e551-495a-3c3e-09d9-7cdf2bbab8d1@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21f9e551-495a-3c3e-09d9-7cdf2bbab8d1@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: gregkh@linuxfoundation.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 10:51:57AM -0500, Andrey Grodzovsky wrote:
> 
> On 11/24/20 9:53 AM, Daniel Vetter wrote:
> > On Sat, Nov 21, 2020 at 12:21:18AM -0500, Andrey Grodzovsky wrote:
> > > Some of the stuff in amdgpu_device_fini such as HW interrupts
> > > disable and pending fences finilization must be done right away on
> > > pci_remove while most of the stuff which relates to finilizing and
> > > releasing driver data structures can be kept until
> > > drm_driver.release hook is called, i.e. when the last device
> > > reference is dropped.
> > > 
> > Uh fini_late and fini_early are rathare meaningless namings, since no
> > clear why there's a split. If you used drm_connector_funcs as inspiration,
> > that's kinda not good because 'register' itself is a reserved keyword.
> > That's why we had to add late_ prefix, could as well have used
> > C_sucks_ as prefix :-) And then the early_unregister for consistency.
> > 
> > I think fini_hw and fini_sw (or maybe fini_drm) would be a lot clearer
> > about what they're doing.
> > 
> > I still strongly recommend that you cut over as much as possible of the
> > fini_hw work to devm_ and for the fini_sw/drm stuff there's drmm_
> > -Daniel
> 
> 
> Definitely, and I put it in a TODO list in the RFC patch.Also, as I
> mentioned before -
> I just prefer to leave it for a follow up work because it's non trivial and
> requires shuffling
> a lof of stuff around in the driver. I was thinking of committing the work
> in incremental steps -
> so it's easier to merge it and control for breakages.

Yeah doing devm/drmm conversion later on makes sense. It'd still try to
have better names than what you're currently going with. A few of these
will likely stick around for very long, not just interim.
-Daniel

> 
> Andrey
> 
> 
> > 
> > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 ++++++++++++----
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  7 ++-----
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 15 ++++++++++++++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 24 +++++++++++++++---------
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  1 +
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 12 +++++++++++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  3 +++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  3 ++-
> > >   9 files changed, 65 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > index 83ac06a..6243f6d 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > @@ -1063,7 +1063,9 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
> > >   int amdgpu_device_init(struct amdgpu_device *adev,
> > >   		       uint32_t flags);
> > > -void amdgpu_device_fini(struct amdgpu_device *adev);
> > > +void amdgpu_device_fini_early(struct amdgpu_device *adev);
> > > +void amdgpu_device_fini_late(struct amdgpu_device *adev);
> > > +
> > >   int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
> > >   void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
> > > @@ -1275,6 +1277,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
> > >   int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
> > >   void amdgpu_driver_postclose_kms(struct drm_device *dev,
> > >   				 struct drm_file *file_priv);
> > > +void amdgpu_driver_release_kms(struct drm_device *dev);
> > > +
> > >   int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
> > >   int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
> > >   int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index 2f60b70..797d94d 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -3557,14 +3557,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> > >    * Tear down the driver info (all asics).
> > >    * Called at driver shutdown.
> > >    */
> > > -void amdgpu_device_fini(struct amdgpu_device *adev)
> > > +void amdgpu_device_fini_early(struct amdgpu_device *adev)
> > >   {
> > >   	dev_info(adev->dev, "amdgpu: finishing device.\n");
> > >   	flush_delayed_work(&adev->delayed_init_work);
> > >   	adev->shutdown = true;
> > > -	kfree(adev->pci_state);
> > > -
> > >   	/* make sure IB test finished before entering exclusive mode
> > >   	 * to avoid preemption on IB test
> > >   	 * */
> > > @@ -3581,11 +3579,18 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
> > >   		else
> > >   			drm_atomic_helper_shutdown(adev_to_drm(adev));
> > >   	}
> > > -	amdgpu_fence_driver_fini(adev);
> > > +	amdgpu_fence_driver_fini_early(adev);
> > >   	if (adev->pm_sysfs_en)
> > >   		amdgpu_pm_sysfs_fini(adev);
> > >   	amdgpu_fbdev_fini(adev);
> > > +
> > > +	amdgpu_irq_fini_early(adev);
> > > +}
> > > +
> > > +void amdgpu_device_fini_late(struct amdgpu_device *adev)
> > > +{
> > >   	amdgpu_device_ip_fini(adev);
> > > +	amdgpu_fence_driver_fini_late(adev);
> > >   	release_firmware(adev->firmware.gpu_info_fw);
> > >   	adev->firmware.gpu_info_fw = NULL;
> > >   	adev->accel_working = false;
> > > @@ -3621,6 +3626,9 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
> > >   		amdgpu_pmu_fini(adev);
> > >   	if (adev->mman.discovery_bin)
> > >   		amdgpu_discovery_fini(adev);
> > > +
> > > +	kfree(adev->pci_state);
> > > +
> > >   }
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > index 7f98cf1..3d130fc 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -1244,14 +1244,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
> > >   {
> > >   	struct drm_device *dev = pci_get_drvdata(pdev);
> > > -#ifdef MODULE
> > > -	if (THIS_MODULE->state != MODULE_STATE_GOING)
> > > -#endif
> > > -		DRM_ERROR("Hotplug removal is not supported\n");
> > >   	drm_dev_unplug(dev);
> > >   	amdgpu_driver_unload_kms(dev);
> > > +
> > >   	pci_disable_device(pdev);
> > > -	pci_set_drvdata(pdev, NULL);
> > >   	drm_dev_put(dev);
> > >   }
> > > @@ -1557,6 +1553,7 @@ static struct drm_driver kms_driver = {
> > >   	.dumb_create = amdgpu_mode_dumb_create,
> > >   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
> > >   	.fops = &amdgpu_driver_kms_fops,
> > > +	.release = &amdgpu_driver_release_kms,
> > >   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > >   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > index d0b0021..c123aa6 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > @@ -523,7 +523,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
> > >    *
> > >    * Tear down the fence driver for all possible rings (all asics).
> > >    */
> > > -void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
> > > +void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev)
> > >   {
> > >   	unsigned i, j;
> > >   	int r;
> > > @@ -544,6 +544,19 @@ void amdgpu_fence_driver_fini(struct amdgpu_device *adev)
> > >   		if (!ring->no_scheduler)
> > >   			drm_sched_fini(&ring->sched);
> > >   		del_timer_sync(&ring->fence_drv.fallback_timer);
> > > +	}
> > > +}
> > > +
> > > +void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev)
> > > +{
> > > +	unsigned int i, j;
> > > +
> > > +	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
> > > +		struct amdgpu_ring *ring = adev->rings[i];
> > > +
> > > +		if (!ring || !ring->fence_drv.initialized)
> > > +			continue;
> > > +
> > >   		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
> > >   			dma_fence_put(ring->fence_drv.fences[j]);
> > >   		kfree(ring->fence_drv.fences);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > > index 300ac73..a833197 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > > @@ -49,6 +49,7 @@
> > >   #include <drm/drm_irq.h>
> > >   #include <drm/drm_vblank.h>
> > >   #include <drm/amdgpu_drm.h>
> > > +#include <drm/drm_drv.h>
> > >   #include "amdgpu.h"
> > >   #include "amdgpu_ih.h"
> > >   #include "atom.h"
> > > @@ -297,6 +298,20 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
> > >   	return 0;
> > >   }
> > > +
> > > +void amdgpu_irq_fini_early(struct amdgpu_device *adev)
> > > +{
> > > +	if (adev->irq.installed) {
> > > +		drm_irq_uninstall(&adev->ddev);
> > > +		adev->irq.installed = false;
> > > +		if (adev->irq.msi_enabled)
> > > +			pci_free_irq_vectors(adev->pdev);
> > > +
> > > +		if (!amdgpu_device_has_dc_support(adev))
> > > +			flush_work(&adev->hotplug_work);
> > > +	}
> > > +}
> > > +
> > >   /**
> > >    * amdgpu_irq_fini - shut down interrupt handling
> > >    *
> > > @@ -310,15 +325,6 @@ void amdgpu_irq_fini(struct amdgpu_device *adev)
> > >   {
> > >   	unsigned i, j;
> > > -	if (adev->irq.installed) {
> > > -		drm_irq_uninstall(adev_to_drm(adev));
> > > -		adev->irq.installed = false;
> > > -		if (adev->irq.msi_enabled)
> > > -			pci_free_irq_vectors(adev->pdev);
> > > -		if (!amdgpu_device_has_dc_support(adev))
> > > -			flush_work(&adev->hotplug_work);
> > > -	}
> > > -
> > >   	for (i = 0; i < AMDGPU_IRQ_CLIENTID_MAX; ++i) {
> > >   		if (!adev->irq.client[i].sources)
> > >   			continue;
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> > > index c718e94..718c70f 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> > > @@ -104,6 +104,7 @@ irqreturn_t amdgpu_irq_handler(int irq, void *arg);
> > >   int amdgpu_irq_init(struct amdgpu_device *adev);
> > >   void amdgpu_irq_fini(struct amdgpu_device *adev);
> > > +void amdgpu_irq_fini_early(struct amdgpu_device *adev);
> > >   int amdgpu_irq_add_id(struct amdgpu_device *adev,
> > >   		      unsigned client_id, unsigned src_id,
> > >   		      struct amdgpu_irq_src *source);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > > index a0af8a7..9e30c5c 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > > @@ -29,6 +29,7 @@
> > >   #include "amdgpu.h"
> > >   #include <drm/drm_debugfs.h>
> > >   #include <drm/amdgpu_drm.h>
> > > +#include <drm/drm_drv.h>
> > >   #include "amdgpu_sched.h"
> > >   #include "amdgpu_uvd.h"
> > >   #include "amdgpu_vce.h"
> > > @@ -94,7 +95,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
> > >   	}
> > >   	amdgpu_acpi_fini(adev);
> > > -	amdgpu_device_fini(adev);
> > > +	amdgpu_device_fini_early(adev);
> > >   }
> > >   void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
> > > @@ -1147,6 +1148,15 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
> > >   	pm_runtime_put_autosuspend(dev->dev);
> > >   }
> > > +
> > > +void amdgpu_driver_release_kms(struct drm_device *dev)
> > > +{
> > > +	struct amdgpu_device *adev = drm_to_adev(dev);
> > > +
> > > +	amdgpu_device_fini_late(adev);
> > > +	pci_set_drvdata(adev->pdev, NULL);
> > > +}
> > > +
> > >   /*
> > >    * VBlank related functions.
> > >    */
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > > index 9d11b84..caf828a 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > > @@ -2142,9 +2142,12 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
> > >   {
> > >   	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
> > > +	//DRM_ERROR("adev 0x%llx", (long long unsigned int)adev);
> > > +
> > >   	if (!con)
> > >   		return 0;
> > > +
> > >   	/* Need disable ras on all IPs here before ip [hw/sw]fini */
> > >   	amdgpu_ras_disable_all_features(adev, 0);
> > >   	amdgpu_ras_recovery_fini(adev);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > > index 7112137..074f36b 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > > @@ -107,7 +107,8 @@ struct amdgpu_fence_driver {
> > >   };
> > >   int amdgpu_fence_driver_init(struct amdgpu_device *adev);
> > > -void amdgpu_fence_driver_fini(struct amdgpu_device *adev);
> > > +void amdgpu_fence_driver_fini_early(struct amdgpu_device *adev);
> > > +void amdgpu_fence_driver_fini_late(struct amdgpu_device *adev);
> > >   void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);
> > >   int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
> > > -- 
> > > 2.7.4
> > > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
