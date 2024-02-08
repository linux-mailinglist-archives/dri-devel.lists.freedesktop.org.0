Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1069784E470
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AA510E0A9;
	Thu,  8 Feb 2024 15:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C740710E0A9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:55:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F2B3152B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 07:56:20 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4A543F5A1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 07:55:37 -0800 (PST)
Date: Thu, 8 Feb 2024 15:55:36 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Rob Herring <robh@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v4 03/14] drm/panthor: Add the device logical block
Message-ID: <ZcT5ePyWlie4YyAG@e110455-lin.cambridge.arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-4-boris.brezillon@collabora.com>
 <ZcTlau71Ffsx2f2r@e110455-lin.cambridge.arm.com>
 <20240208161459.7dd42bcd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208161459.7dd42bcd@collabora.com>
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

On Thu, Feb 08, 2024 at 04:14:59PM +0100, Boris Brezillon wrote:
> On Thu, 8 Feb 2024 14:30:02 +0000
> Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> 
> > > +int panthor_device_init(struct panthor_device *ptdev)
> > > +{
> > > +	struct resource *res;
> > > +	struct page *p;
> > > +	int ret;
> > > +
> > > +	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> > > +
> > > +	init_completion(&ptdev->unplug.done);
> > > +	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = drmm_mutex_init(&ptdev->base, &ptdev->pm.mmio_lock);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> > > +	p = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > +	if (!p)
> > > +		return -ENOMEM;
> > > +
> > > +	ptdev->pm.dummy_latest_flush = page_address(p);
> > > +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
> > > +				       ptdev->pm.dummy_latest_flush);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Set the dummy page holding the latest flush to 1. This will cause the
> > > +	 * flush to avoided as we know it isn't necessary if the submission
> > > +	 * happens while the dummy page is mapped. Zero cannot be used because
> > > +	 * that means 'always flush'.
> > > +	 */
> > > +	*ptdev->pm.dummy_latest_flush = 1;
> > > +
> > > +	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
> > > +	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
> > > +	if (!ptdev->reset.wq)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = panthor_clk_init(ptdev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = panthor_devfreq_init(ptdev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ptdev->iomem = devm_platform_get_and_ioremap_resource(to_platform_device(ptdev->base.dev),
> > > +							      0, &res);
> > > +	if (IS_ERR(ptdev->iomem))
> > > +		return PTR_ERR(ptdev->iomem);
> > > +
> > > +	ptdev->phys_addr = res->start;
> > > +
> > > +	ret = devm_pm_runtime_enable(ptdev->base.dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = panthor_gpu_init(ptdev);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> > > +
> > > +	ret = panthor_mmu_init(ptdev);
> > > +	if (ret)
> > > +		goto err_unplug_gpu;
> > > +
> > > +	ret = panthor_fw_init(ptdev);
> > > +	if (ret)
> > > +		goto err_unplug_mmu;
> > > +
> > > +	ret = panthor_sched_init(ptdev);
> > > +	if (ret)
> > > +		goto err_unplug_fw;
> > > +
> > > +	/* ~3 frames */
> > > +	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
> > > +
> > > +	ret = drm_dev_register(&ptdev->base, 0);
> > > +	if (ret)
> > > +		goto err_unplug_sched;  
> > 
> > For sake of replicating the panthor_device_unplus() calls, should we do
> > here:
> > 
> > 	if (ret) {
> > 		pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> 
> But pm_runtime_use_autosuspend() is called after that, why do we need
> to call pm_runtime_dont_use_autosuspend() here?

This is in the case where ret != 0, so we're going to skip over
pm_runtime_use_autosuspend(). We've just called
pm_runtime_set_autosuspend_delay() which by my reading also enables
runtime PM when it calls update_autosuspend(), so this is needed.

Best regards,
Liviu

> 
> > 		goto err_unplug_sched;
> > 	}
> > 
> > 
> > > +
> > > +	pm_runtime_use_autosuspend(ptdev->base.dev);
> > > +	pm_runtime_put_autosuspend(ptdev->base.dev);
> > > +	return 0;
> > > +
> > > +err_unplug_sched:
> > > +	panthor_sched_unplug(ptdev);
> > > +
> > > +err_unplug_fw:
> > > +	panthor_fw_unplug(ptdev);
> > > +
> > > +err_unplug_mmu:
> > > +	panthor_mmu_unplug(ptdev);
> > > +
> > > +err_unplug_gpu:
> > > +	panthor_gpu_unplug(ptdev);
> > > +
> > > +err_rpm_put:
> > > +	pm_runtime_put_sync_suspend(ptdev->base.dev);
> > > +	return ret;
> > > +}

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
