Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE12B01F5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 10:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74AF6E183;
	Thu, 12 Nov 2020 09:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CDA6E14D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 09:29:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o15so5231065wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 01:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3xGsBFkINHlcPCbyUW0rzNvyBSPMRhRo4H+/TdURu5E=;
 b=J96rzRujaYxi42J2WCmyAtl53Hk1lxFi/IH/Wkar0mUY/IJ4hQwtrypnL5uTUaEr+B
 78JiG+wfm2lYwPFcNHip57O5hp996znH2W9jqAjTSmEyJLiwm2dWy8LSQdhDhVYVdqX+
 0InRwhRhfa+Ch4fuW8OfNvIzMxW3RIxbtlQkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3xGsBFkINHlcPCbyUW0rzNvyBSPMRhRo4H+/TdURu5E=;
 b=jh6HSR/ZhCHqbQgVhILUY/NBKrxYj3Dpn0p6kzAJ/JlDI5GMfK4yjxJ1aAYxhOU3Br
 18AQ7glWZmjxFlv++jOnSdfBzfNyM6MJiJGsWH91OWSkAeslz8n9/8w5ycTEvH1N++1b
 fO1Gey+X3p5lK/nF7Zv2q9mXRnECSQatl/Fv3UV+ht2n2Gk2T3E1aPFQt3bR1i4ruHJq
 72c+x39CHNNUVuG+iG4nq1nrYKkLaxI6wHxY/FFld6EswIQy5QIkVZriT+YCRcTEk7bq
 cHsu8n0AWlDgQU5JUnRFXQF2UL0vU7VCakWwpCFBfDjUyZB+FPIXPzsHZHrAtdmcvI9o
 cb8Q==
X-Gm-Message-State: AOAM5315WE051h6duwj1hKexlVrKy/DIIUIxVV2dKPXlW+4+VHhrv7fl
 LTSScnjzOujqEr+G81mAaH8tug==
X-Google-Smtp-Source: ABdhPJwCESQG8J26ois6f4eUiZ46n405JjASLChmK/vtvvA6Utq2FSwvmX/yZ1Cfom83r5WD3afAZQ==
X-Received: by 2002:adf:f608:: with SMTP id t8mr23288430wrp.72.1605173376294; 
 Thu, 12 Nov 2020 01:29:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j13sm5910883wrt.80.2020.11.12.01.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 01:29:35 -0800 (PST)
Date: Thu, 12 Nov 2020 10:29:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 4/8] drm/amdgpu: Split amdgpu_device_fini into early
 and late
Message-ID: <20201112092933.GR401619@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-5-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094849.GD20149@phenom.ffwll.local>
 <c0c79eaf-8820-8def-d8ec-2aa79d6aaca6@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0c79eaf-8820-8def-d8ec-2aa79d6aaca6@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 11:19:04PM -0500, Andrey Grodzovsky wrote:
> 
> On 6/22/20 5:48 AM, Daniel Vetter wrote:
> > On Sun, Jun 21, 2020 at 02:03:04AM -0400, Andrey Grodzovsky wrote:
> > > Some of the stuff in amdgpu_device_fini such as HW interrupts
> > > disable and pending fences finilization must be done right away on
> > > pci_remove while most of the stuff which relates to finilizing and releasing
> > > driver data structures can be kept until drm_driver.release hook is called, i.e.
> > > when the last device reference is dropped.
> > > 
> > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Long term I think best if as much of this code is converted over to devm
> > (for hw stuff) and drmm (for sw stuff and allocations). Doing this all
> > manually is very error prone.
> > 
> > I've started various such patches and others followed, but thus far only
> > very simple drivers tackled. But it should be doable step by step at
> > least, so you should have incremental benefits in code complexity right
> > away I hope.
> > -Daniel
> 
> 
> Sure, I will definitely add this to my TODOs for after landing (hopefully)
> this patch set (after a few more iterations)
> as indeed the required changes for using devm and drmm are non trivial and I prefer
> to avoid diverging here into multiple directions at once.

For the display side there's a very nice patch series from Philip Zabel
pending:

https://lore.kernel.org/dri-devel/20200911135724.25833-1-p.zabel@pengutronix.de/

I think you'll want to use this. It's not landed yet, so a nudge from
someone else also using it would help I think.

Cheers, Daniel

> 
> Andrey
> 
> 
> > 
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +++++-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++----
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ++----
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 24 +++++++++++++++---------
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h    |  1 +
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 23 +++++++++++++++++------
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c    |  3 +++
> > >   7 files changed, 54 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > index 2a806cb..604a681 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > @@ -1003,7 +1003,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> > >   		       struct drm_device *ddev,
> > >   		       struct pci_dev *pdev,
> > >   		       uint32_t flags);
> > > -void amdgpu_device_fini(struct amdgpu_device *adev);
> > > +void amdgpu_device_fini_early(struct amdgpu_device *adev);
> > > +void amdgpu_device_fini_late(struct amdgpu_device *adev);
> > > +
> > >   int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
> > >   void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
> > > @@ -1188,6 +1190,8 @@ void amdgpu_driver_lastclose_kms(struct drm_device *dev);
> > >   int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
> > >   void amdgpu_driver_postclose_kms(struct drm_device *dev,
> > >   				 struct drm_file *file_priv);
> > > +void amdgpu_driver_release_kms(struct drm_device *dev);
> > > +
> > >   int amdgpu_device_ip_suspend(struct amdgpu_device *adev);
> > >   int amdgpu_device_suspend(struct drm_device *dev, bool fbcon);
> > >   int amdgpu_device_resume(struct drm_device *dev, bool fbcon);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index cc41e8f..e7b9065 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -2309,6 +2309,8 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
> > >   {
> > >   	int i, r;
> > > +	//DRM_ERROR("adev 0x%llx", (long long unsigned int)adev);
> > > +
> > >   	amdgpu_ras_pre_fini(adev);
> > >   	if (adev->gmc.xgmi.num_physical_nodes > 1)
> > > @@ -3304,10 +3306,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
> > >    * Tear down the driver info (all asics).
> > >    * Called at driver shutdown.
> > >    */
> > > -void amdgpu_device_fini(struct amdgpu_device *adev)
> > > +void amdgpu_device_fini_early(struct amdgpu_device *adev)
> > >   {
> > > -	int r;
> > > -
> > >   	DRM_INFO("amdgpu: finishing device.\n");
> > >   	flush_delayed_work(&adev->delayed_init_work);
> > >   	adev->shutdown = true;
> > > @@ -3330,7 +3330,13 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
> > >   	if (adev->pm_sysfs_en)
> > >   		amdgpu_pm_sysfs_fini(adev);
> > >   	amdgpu_fbdev_fini(adev);
> > > -	r = amdgpu_device_ip_fini(adev);
> > > +
> > > +	amdgpu_irq_fini_early(adev);
> > > +}
> > > +
> > > +void amdgpu_device_fini_late(struct amdgpu_device *adev)
> > > +{
> > > +	amdgpu_device_ip_fini(adev);
> > >   	if (adev->firmware.gpu_info_fw) {
> > >   		release_firmware(adev->firmware.gpu_info_fw);
> > >   		adev->firmware.gpu_info_fw = NULL;
> > > @@ -3368,6 +3374,7 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
> > >   		amdgpu_pmu_fini(adev);
> > >   	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
> > >   		amdgpu_discovery_fini(adev);
> > > +
> > >   }
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > index 9e5afa5..43592dc 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > > @@ -1134,12 +1134,9 @@ amdgpu_pci_remove(struct pci_dev *pdev)
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
> > >   	pci_set_drvdata(pdev, NULL);
> > >   	drm_dev_put(dev);
> > > @@ -1445,6 +1442,7 @@ static struct drm_driver kms_driver = {
> > >   	.dumb_create = amdgpu_mode_dumb_create,
> > >   	.dumb_map_offset = amdgpu_mode_dumb_mmap,
> > >   	.fops = &amdgpu_driver_kms_fops,
> > > +	.release = &amdgpu_driver_release_kms,
> > >   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > >   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > > index 0cc4c67..1697655 100644
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
> > > +		drm_irq_uninstall(adev->ddev);
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
> > > -		drm_irq_uninstall(adev->ddev);
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
> > > index c0b1904..9d0af22 100644
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
> > > @@ -86,7 +87,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
> > >   	amdgpu_unregister_gpu_instance(adev);
> > >   	if (adev->rmmio == NULL)
> > > -		goto done_free;
> > > +		return;
> > >   	if (adev->runpm) {
> > >   		pm_runtime_get_sync(dev->dev);
> > > @@ -95,11 +96,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
> > >   	amdgpu_acpi_fini(adev);
> > > -	amdgpu_device_fini(adev);
> > > -
> > > -done_free:
> > > -	kfree(adev);
> > > -	dev->dev_private = NULL;
> > > +	amdgpu_device_fini_early(adev);
> > >   }
> > >   void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
> > > @@ -1108,6 +1105,20 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
> > >   	pm_runtime_put_autosuspend(dev->dev);
> > >   }
> > > +
> > > +void amdgpu_driver_release_kms (struct drm_device *dev)
> > > +{
> > > +	struct amdgpu_device *adev = dev->dev_private;
> > > +
> > > +	amdgpu_device_fini_late(adev);
> > > +
> > > +	kfree(adev);
> > > +	dev->dev_private = NULL;
> > > +
> > > +	drm_dev_fini(dev);
> > > +	kfree(dev);
> > > +}
> > > +
> > >   /*
> > >    * VBlank related functions.
> > >    */
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > > index 7348619..169c2239 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > > @@ -2056,9 +2056,12 @@ int amdgpu_ras_pre_fini(struct amdgpu_device *adev)
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
