Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F099C88E2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 12:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720F510E128;
	Thu, 14 Nov 2024 11:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dVoezNXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C980310E128
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731583681;
 bh=BNDtROPezRHX1KQmij+hx1LLswPVWwEU86wva6qx5GM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dVoezNXLMk2Uh82UrM9vSFozBpRyO6JS8Nd0tM22ABoRUUR+A1sZ0j7lCogr/hw+f
 xaxkgLF+zFZdakXXeNhAbFarA95V2K9RHnE2F2mqRKVxRvtbrSkWRyRoYgVxmmwYgp
 PNJQsKLN8HUaQ+pi86k+iC0rcrzZlR0uNF0cQcrkDlz1Gz/n/pLD2ig7QFpRFnGjMg
 EeNGanXLioqioASwf98ocLbX+L7GqrrDsMBBRd/PHoTd3B8czsNVpuJKOnTPKx/SjM
 ezEtsiErTxtGQFPaYZwRUEtUvWD+qU6uqmvx6ZD8ILjIBCKzn414n9Mekbs1UTIc8o
 6Av/O73otv1ng==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F149C17E360A;
 Thu, 14 Nov 2024 12:28:00 +0100 (CET)
Date: Thu, 14 Nov 2024 12:27:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/5] drm/panthor: Be robust against runtime PM resume
 failures in the suspend path
Message-ID: <20241114122755.7dfb7bef@collabora.com>
In-Reply-To: <ZzXbWUtF_oxWXl9G@e110455-lin.cambridge.arm.com>
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-3-boris.brezillon@collabora.com>
 <ZzXbWUtF_oxWXl9G@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu, 14 Nov 2024 11:13:29 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Wed, Nov 13, 2024 at 04:42:54PM +0100, Boris Brezillon wrote:
> > The runtime PM resume operation is not guaranteed to succeed, but if it
> > fails, the device should be in a suspended state. Make sure we're robust
> > to resume failures in the unplug path.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c | 23 ++++++++---------------
> >  drivers/gpu/drm/panthor/panthor_fw.c     | 14 +++++++++-----
> >  drivers/gpu/drm/panthor/panthor_gpu.c    |  3 ++-
> >  drivers/gpu/drm/panthor/panthor_mmu.c    |  3 ++-
> >  4 files changed, 21 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index db7ba40f771d..8b5d54b2bbb4 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -48,6 +48,8 @@ static int panthor_clk_init(struct panthor_device *ptdev)
> >  
> >  void panthor_device_unplug(struct panthor_device *ptdev)
> >  {
> > +	int ret;
> > +
> >  	/* This function can be called from two different path: the reset work
> >  	 * and the platform device remove callback. drm_dev_unplug() doesn't
> >  	 * deal with concurrent callers, so we have to protect drm_dev_unplug()
> > @@ -74,7 +76,8 @@ void panthor_device_unplug(struct panthor_device *ptdev)
> >  	 */
> >  	mutex_unlock(&ptdev->unplug.lock);
> >  
> > -	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
> > +	ret = pm_runtime_get_sync(ptdev->base.dev);
> > +	drm_WARN_ON(&ptdev->base, ret < 0);
> >  
> >  	/* Now, try to cleanly shutdown the GPU before the device resources
> >  	 * get reclaimed.
> > @@ -85,7 +88,10 @@ void panthor_device_unplug(struct panthor_device *ptdev)
> >  	panthor_gpu_unplug(ptdev);
> >  
> >  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> > -	pm_runtime_put_sync_suspend(ptdev->base.dev);
> > +
> > +	/* If the resume failed, we don't need to suspend here. */
> > +	if (!ret)
> > +		pm_runtime_put_sync_suspend(ptdev->base.dev);
> >  
> >  	/* If PM is disabled, we need to call the suspend handler manually. */
> >  	if (!IS_ENABLED(CONFIG_PM))
> > @@ -541,17 +547,4 @@ int panthor_device_suspend(struct device *dev)
> >  	clk_disable_unprepare(ptdev->clks.core);
> >  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> >  	return 0;
> > -
> > -err_set_active:  
> 
> Label is being deleted here, but I don't see where the `goto err_set_active` is being removed.

Yes, as mentioned in my own reply, this chunk should be in patch 3.
