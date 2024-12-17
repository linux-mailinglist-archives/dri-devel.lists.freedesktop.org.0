Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8119F495F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB26F10E912;
	Tue, 17 Dec 2024 10:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09DFD10E911
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:56:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DD8D1063
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 02:56:46 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B33B3F528
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 02:56:18 -0800 (PST)
Date: Tue, 17 Dec 2024 10:56:14 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix a race between the reset and suspend path
Message-ID: <Z2FYzqCkhKQRwxYU@e110455-lin.cambridge.arm.com>
References: <20241217092457.1582053-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217092457.1582053-1-boris.brezillon@collabora.com>
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

On Tue, Dec 17, 2024 at 10:24:57AM +0100, Boris Brezillon wrote:
> If a reset is scheduled when the suspend happens, we drop the
> reset-pending info on the floor assuming the resume will fix things,
> but the resume logic might try a fast reset. If we're lucky, the
> fast reset fails and we fallback to a slow reset, but if the FW was
> corrupted in a way that makes it partially functional (it boots but
> doesn't quite do what it's expected to do), we won't notice immediately
> that things are not working correctly, leading to a new reset further
> down the road.
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 2c817e65e6be..3285ac42d2cd 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -128,14 +128,11 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
>  	int ret = 0, cookie;
>  
> -	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE) {
> -		/*
> -		 * No need for a reset as the device has been (or will be)
> -		 * powered down
> -		 */
> -		atomic_set(&ptdev->reset.pending, 0);
> +	/* If the device is entering suspend, we don't reset. A slow reset will
> +	 * be forced at resume time instead.
> +	 */
> +	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
>  		return;
> -	}
>  
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return;
> @@ -473,6 +470,14 @@ int panthor_device_resume(struct device *dev)
>  
>  	if (panthor_device_is_initialized(ptdev) &&
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
> +		/* If there was a reset pending at the time we suspended the
> +		 * device, we force a slow reset.
> +		 */
> +		if (atomic_read(&ptdev->reset.pending)) {
> +			ptdev->reset.fast = false;
> +			atomic_set(&ptdev->reset.pending, 0);
> +		}
> +
>  		ret = panthor_device_resume_hw_components(ptdev);
>  		if (ret && ptdev->reset.fast) {
>  			drm_err(&ptdev->base, "Fast reset failed, trying a slow reset");
> @@ -489,9 +494,6 @@ int panthor_device_resume(struct device *dev)
>  			goto err_suspend_devfreq;
>  	}
>  
> -	if (atomic_read(&ptdev->reset.pending))
> -		queue_work(ptdev->reset.wq, &ptdev->reset.work);
> -

If you remove this, why do we need a reset workqueue at all? Nothing gets scheduled in it.

Best regards,
Liviu

>  	/* Clear all IOMEM mappings pointing to this device after we've
>  	 * resumed. This way the fake mappings pointing to the dummy pages
>  	 * are removed and the real iomem mapping will be restored on next
> -- 
> 2.47.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
