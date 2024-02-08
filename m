Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639BC84E3DF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAEA10E886;
	Thu,  8 Feb 2024 15:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LQvWcSwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDD010E886
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707405552;
 bh=E/a0slzPTPlf6dr3/SbS5mlEGnRzLQ+ALMCIbj75ElQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LQvWcSwB0dSaJ0pUCIbtLVdrYYBSiT0rSCjS2a4HYZQ47+29BQSSl7nSO0TBqtsp/
 6l8UkMm59ra/amErjzVHKe5m8oXIOdeCf0ocTnhzdXTEj+DQh5j1tPauPc7xkco+DR
 1aKEWY/0qvGxH+6HemvoEYUbmsURJxFQBbN0Cq1rEk1pBk3GMz010h4UR/iP62/vtV
 zDRN8kek6jdfYEB2R39Dl4xZpz7l3APZIBf7kJ5vvozKqnwUwnUSdC5Hwu13MPN4a+
 0U1w+q2OexRGU88KV8rpmhI5LOrTC2ZwDgGhhYv/o722iFlV1ZGvugP5Z/EQFtE0Ul
 YuWEOOzwdpLEQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9CCD53780626;
 Thu,  8 Feb 2024 15:19:11 +0000 (UTC)
Date: Thu, 8 Feb 2024 16:19:10 +0100
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
Message-ID: <20240208161910.28a4842c@collabora.com>
In-Reply-To: <ZcTlau71Ffsx2f2r@e110455-lin.cambridge.arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-4-boris.brezillon@collabora.com>
 <ZcTlau71Ffsx2f2r@e110455-lin.cambridge.arm.com>
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

On Thu, 8 Feb 2024 14:30:02 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> > +#ifdef CONFIG_PM
> > +int panthor_device_resume(struct device *dev)
> > +{
> > +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> > +	int ret, cookie;
> > +
> > +	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_SUSPENDED)
> > +		return -EINVAL;
> > +
> > +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_RESUMING);
> > +
> > +	ret = clk_prepare_enable(ptdev->clks.core);
> > +	if (ret)
> > +		goto err_set_suspended;
> > +
> > +	ret = clk_prepare_enable(ptdev->clks.stacks);
> > +	if (ret)
> > +		goto err_disable_core_clk;
> > +
> > +	ret = clk_prepare_enable(ptdev->clks.coregroup);
> > +	if (ret)
> > +		goto err_disable_stacks_clk;
> > +
> > +	ret = panthor_devfreq_resume(ptdev);
> > +	if (ret)
> > +		goto err_disable_coregroup_clk;
> > +
> > +	if (panthor_device_is_initialized(ptdev) &&
> > +	    drm_dev_enter(&ptdev->base, &cookie)) {
> > +		panthor_gpu_resume(ptdev);
> > +		panthor_mmu_resume(ptdev);
> > +		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> > +		if (!ret)
> > +			panthor_sched_resume(ptdev);
> > +
> > +		drm_dev_exit(cookie);
> > +
> > +		if (ret)
> > +			goto err_devfreq_suspend;
> > +	}
> > +
> > +	if (atomic_read(&ptdev->reset.pending))
> > +		queue_work(ptdev->reset.wq, &ptdev->reset.work);
> > +
> > +	/* Clear all IOMEM mappings pointing to this device after we've
> > +	 * resumed. This way the fake mappings pointing to the dummy pages
> > +	 * are removed and the real iomem mapping will be restored on next
> > +	 * access.
> > +	 */
> > +	mutex_lock(&ptdev->pm.mmio_lock);
> > +	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
> > +			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
> > +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
> > +	mutex_unlock(&ptdev->pm.mmio_lock);
> > +	return 0;
> > +
> > +err_devfreq_suspend:
> > +	panthor_devfreq_suspend(ptdev);  
> 
> Should we also call panthor_mmu_suspend(ptdev) and panthor_gpu_suspend(ptdev)
> before panthor_devfreq_suspend()? Otherwise those blocks will be left in an
> inconsistent state.

Yep, it's been fixed in panthor-next (see [1]). Note that I didn't add
it to the error path, to keep the panthor_{mmu,gpu}_suspend() under the
drm_dev_enter/exit() section.

> > +
> > +err_disable_coregroup_clk:
> > +	clk_disable_unprepare(ptdev->clks.coregroup);
> > +
> > +err_disable_stacks_clk:
> > +	clk_disable_unprepare(ptdev->clks.stacks);
> > +
> > +err_disable_core_clk:
> > +	clk_disable_unprepare(ptdev->clks.core);
> > +
> > +err_set_suspended:
> > +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> > +	return ret;
> > +}


[1]https://gitlab.freedesktop.org/panfrost/linux/-/commit/d9eccd669206ffd9383b955bffba93426ebea40a
