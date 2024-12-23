Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45589FB2B7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E5010E575;
	Mon, 23 Dec 2024 16:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2913410E575
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 16:22:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B836E11FB;
 Mon, 23 Dec 2024 08:23:12 -0800 (PST)
Received: from [10.57.73.219] (unknown [10.57.73.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAC963F694;
 Mon, 23 Dec 2024 08:22:42 -0800 (PST)
Message-ID: <da6d8b5c-4ee8-47da-be4e-eee143e574a1@arm.com>
Date: Mon, 23 Dec 2024 16:22:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix a race between the reset and suspend path
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Christopher Healy <healych@amazon.com>,
 kernel@collabora.com
References: <20241217092457.1582053-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241217092457.1582053-1-boris.brezillon@collabora.com>
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

On 17/12/2024 09:24, Boris Brezillon wrote:
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

Reviewed-by: Steven Price <steven.price@arm.com>

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
>  	/* Clear all IOMEM mappings pointing to this device after we've
>  	 * resumed. This way the fake mappings pointing to the dummy pages
>  	 * are removed and the real iomem mapping will be restored on next

