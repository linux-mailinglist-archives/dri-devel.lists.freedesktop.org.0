Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1961E87E99E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 13:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BA210F6B0;
	Mon, 18 Mar 2024 12:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kO2vD8Gc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7491310F6B0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710766666;
 bh=fUU0xj2HCLWRMYWz3BCvwp9RAz1P41Pnt0sWAFkrA/k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kO2vD8GcSfV7lR/YRs2UTTAirGQ9Y3ZNN5zj/VzQWaM6XLAVCDQTpAhbDcKLt7oHL
 5DkJJBrbNraECLUcRT9QntErjE2ASt2bdYydtbmFSDJXl5wJ57EGgsY8/DvOPU//o7
 NM2JoJp0SJaGQhhuURlBNw3AhUivu+E68ViNayDAPK5N1OMLUM3c8NUmDaTWfLBTMp
 d/anjHo9LCWyRw9XNUEkYyRyCyvDR2S/346U92TcpFy5pT2UKrDPT5MPsxyWTKV/E3
 F88Gocxcb1TxEFPKQAsMpHnvHEOBOD8dviw0a7NMNfpEwf2+jjBy62bm/StmaDjnAi
 sAEF0ko5nCLew==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3D14A3780A0B;
 Mon, 18 Mar 2024 12:57:46 +0000 (UTC)
Date: Mon, 18 Mar 2024 13:57:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH] drm/panthor: Fix the CONFIG_PM=n case
Message-ID: <20240318135744.76208b30@collabora.com>
In-Reply-To: <70bdc326-3e97-4f6b-ad6d-09473ee85b97@arm.com>
References: <20240318085855.994179-1-boris.brezillon@collabora.com>
 <70bdc326-3e97-4f6b-ad6d-09473ee85b97@arm.com>
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

On Mon, 18 Mar 2024 12:18:53 +0000
Robin Murphy <robin.murphy@arm.com> wrote:

> On 18/03/2024 8:58 am, Boris Brezillon wrote:
> > Putting a hard dependency on CONFIG_PM is not possible because of a
> > circular dependency issue, and it's actually not desirable either. In
> > order to support this use case, we forcibly resume at init time, and
> > suspend at unplug time.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Tested by faking CONFIG_PM=n in the driver (basically commenting
> > all pm_runtime calls, and making the panthor_device_suspend/resume()
> > calls unconditional in the panthor_device_unplug/init() path) since
> > CONFIG_ARCH_ROCKCHIP selects CONFIG_PM. Seems to work fine, but I
> > can't be 100% sure this will work correctly on a platform that has
> > CONFIG_PM=n.
> > ---
> >   drivers/gpu/drm/panthor/panthor_device.c | 13 +++++++++++--
> >   drivers/gpu/drm/panthor/panthor_drv.c    |  4 +++-
> >   2 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index 69deb8e17778..ba7aedbb4931 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -87,6 +87,10 @@ void panthor_device_unplug(struct panthor_device *ptdev)
> >   	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> >   	pm_runtime_put_sync_suspend(ptdev->base.dev);
> >   
> > +	/* If PM is disabled, we need to call the suspend handler manually. */
> > +	if (!IS_ENABLED(CONFIG_PM))
> > +		panthor_device_suspend(ptdev->base.dev);
> > +
> >   	/* Report the unplug operation as done to unblock concurrent
> >   	 * panthor_device_unplug() callers.
> >   	 */
> > @@ -218,6 +222,13 @@ int panthor_device_init(struct panthor_device *ptdev)
> >   	if (ret)
> >   		return ret;
> >   
> > +	/* If PM is disabled, we need to call panthor_device_resume() manually. */
> > +	if (!IS_ENABLED(CONFIG_PM)) {
> > +		ret = panthor_device_resume(ptdev->base.dev);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >   	ret = panthor_gpu_init(ptdev);
> >   	if (ret)
> >   		goto err_rpm_put;
> > @@ -402,7 +413,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
> >   	return 0;
> >   }
> >   
> > -#ifdef CONFIG_PM
> >   int panthor_device_resume(struct device *dev)
> >   {
> >   	struct panthor_device *ptdev = dev_get_drvdata(dev);
> > @@ -547,4 +557,3 @@ int panthor_device_suspend(struct device *dev)
> >   	mutex_unlock(&ptdev->pm.mmio_lock);
> >   	return ret;
> >   }
> > -#endif
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index ff484506229f..2ea6a9f436db 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -1407,17 +1407,19 @@ static const struct of_device_id dt_match[] = {
> >   };
> >   MODULE_DEVICE_TABLE(of, dt_match);
> >   
> > +#ifdef CONFIG_PM  
> 
> This #ifdef isn't necessary, and in fact will break the !PM build - 
> pm_ptr() already takes care of allowing the compiler to optimise out the 
> ops structure itself without any further annotations.

Oops, I forgot how pm_ptr() was working (I thought it had 2
definitions, one for the PM case and another for the !PM one).

> 
> Thanks,
> Robin.
> 
> >   static DEFINE_RUNTIME_DEV_PM_OPS(panthor_pm_ops,
> >   				 panthor_device_suspend,
> >   				 panthor_device_resume,
> >   				 NULL);
> > +#endif
> >   
> >   static struct platform_driver panthor_driver = {
> >   	.probe = panthor_probe,
> >   	.remove_new = panthor_remove,
> >   	.driver = {
> >   		.name = "panthor",
> > -		.pm = &panthor_pm_ops,
> > +		.pm = pm_ptr(&panthor_pm_ops),
> >   		.of_match_table = dt_match,
> >   	},
> >   };  

