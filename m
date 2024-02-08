Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658EA84E491
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 17:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32DC10E4D1;
	Thu,  8 Feb 2024 16:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eg/+GMuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AE010E4D1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707408025;
 bh=/mV6aQxUcb97yRy5SbwKxSz7zWt/ypUX3JOc46vkSbY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eg/+GMuU9dv74z7rAMP2HC02YG8lzLBe7O0knYoqlOuZCQtQUC1Rox3ASxIVsQ98F
 cllNPshRq/IQGzTpWcmnESQWfwjK+SCSoxvOJMHrVu3c11svmkQdCtqdNgOqWqzfzP
 EAv1bjZVT031Sb88OoUIgoy2sfAt0PrtStRJhqEG3Jdm3abIni8rHEjbA2p4Vy3yN5
 kXuP1eEjq3infbp0liGMcIFtsKT7HrhvTAcy94HmFTCc38K18WTQqecInnOxBif+3e
 ZuHlkVgyusq5WrplidOR5+xfhWbjiGize+ZfW92tiTZYjY64HpeR6o2p42LP5N9I+B
 nF7bHmV87i7Ow==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 881F7378103D;
 Thu,  8 Feb 2024 16:00:24 +0000 (UTC)
Date: Thu, 8 Feb 2024 17:00:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Steven Price <steven.price@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, kernel@collabora.com, Heiko Stuebner
 <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, Chris Diamand
 <chris.diamand@foss.arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>, Grant
 Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v4 03/14] drm/panthor: Add the device logical block
Message-ID: <20240208170023.134e2f17@collabora.com>
In-Reply-To: <ZcT5ePyWlie4YyAG@e110455-lin.cambridge.arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-4-boris.brezillon@collabora.com>
 <ZcTlau71Ffsx2f2r@e110455-lin.cambridge.arm.com>
 <20240208161459.7dd42bcd@collabora.com>
 <ZcT5ePyWlie4YyAG@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 8 Feb 2024 15:55:36 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> On Thu, Feb 08, 2024 at 04:14:59PM +0100, Boris Brezillon wrote:
> > On Thu, 8 Feb 2024 14:30:02 +0000
> > Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> >   
> > > > +int panthor_device_init(struct panthor_device *ptdev)
> > > > +{
> > > > +	struct resource *res;
> > > > +	struct page *p;
> > > > +	int ret;
> > > > +
> > > > +	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> > > > +
> > > > +	init_completion(&ptdev->unplug.done);
> > > > +	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = drmm_mutex_init(&ptdev->base, &ptdev->pm.mmio_lock);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> > > > +	p = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > +	if (!p)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ptdev->pm.dummy_latest_flush = page_address(p);
> > > > +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
> > > > +				       ptdev->pm.dummy_latest_flush);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/*
> > > > +	 * Set the dummy page holding the latest flush to 1. This will cause the
> > > > +	 * flush to avoided as we know it isn't necessary if the submission
> > > > +	 * happens while the dummy page is mapped. Zero cannot be used because
> > > > +	 * that means 'always flush'.
> > > > +	 */
> > > > +	*ptdev->pm.dummy_latest_flush = 1;
> > > > +
> > > > +	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
> > > > +	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
> > > > +	if (!ptdev->reset.wq)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = panthor_clk_init(ptdev);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = panthor_devfreq_init(ptdev);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ptdev->iomem = devm_platform_get_and_ioremap_resource(to_platform_device(ptdev->base.dev),
> > > > +							      0, &res);
> > > > +	if (IS_ERR(ptdev->iomem))
> > > > +		return PTR_ERR(ptdev->iomem);
> > > > +
> > > > +	ptdev->phys_addr = res->start;
> > > > +
> > > > +	ret = devm_pm_runtime_enable(ptdev->base.dev);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = panthor_gpu_init(ptdev);
> > > > +	if (ret)
> > > > +		goto err_rpm_put;
> > > > +
> > > > +	ret = panthor_mmu_init(ptdev);
> > > > +	if (ret)
> > > > +		goto err_unplug_gpu;
> > > > +
> > > > +	ret = panthor_fw_init(ptdev);
> > > > +	if (ret)
> > > > +		goto err_unplug_mmu;
> > > > +
> > > > +	ret = panthor_sched_init(ptdev);
> > > > +	if (ret)
> > > > +		goto err_unplug_fw;
> > > > +
> > > > +	/* ~3 frames */
> > > > +	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
> > > > +
> > > > +	ret = drm_dev_register(&ptdev->base, 0);
> > > > +	if (ret)
> > > > +		goto err_unplug_sched;    
> > > 
> > > For sake of replicating the panthor_device_unplus() calls, should we do
> > > here:
> > > 
> > > 	if (ret) {
> > > 		pm_runtime_dont_use_autosuspend(ptdev->base.dev);  
> > 
> > But pm_runtime_use_autosuspend() is called after that, why do we need
> > to call pm_runtime_dont_use_autosuspend() here?  
> 
> This is in the case where ret != 0, so we're going to skip over
> pm_runtime_use_autosuspend(). We've just called
> pm_runtime_set_autosuspend_delay() which by my reading also enables
> runtime PM when it calls update_autosuspend(), so this is needed.

That's not how I understand it. To me,
pm_runtime_set_autosuspend_delay() just updates the delay, but doesn't
change the autosuspend status, and update_autosuspend() doesn't seem to
change it either.
