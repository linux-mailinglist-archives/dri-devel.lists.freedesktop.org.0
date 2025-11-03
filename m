Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123CAC2C70D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A1610E40C;
	Mon,  3 Nov 2025 14:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3DCD10E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:39:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CDC71D14
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:39:43 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2066A3F694
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:39:51 -0800 (PST)
Date: Mon, 3 Nov 2025 14:39:39 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix race with suspend during unplug
Message-ID: <aQi-q-cWv2tzNX9F@e110455-lin.cambridge.arm.com>
References: <20251022103242.1083311-1-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022103242.1083311-1-ketil.johnsen@arm.com>
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

On Wed, Oct 22, 2025 at 12:32:41PM +0200, Ketil Johnsen wrote:
> There is a race between panthor_device_unplug() and
> panthor_device_suspend() which can lead to IRQ handlers running on a
> powered down GPU. This is how it can happen:
> - unplug routine calls drm_dev_unplug()
> - panthor_device_suspend() can now execute, and will skip a lot of
>   important work because the device is currently marked as unplugged.
> - IRQs will remain active in this case and IRQ handlers can therefore
>   try to access a powered down GPU.
> 
> The fix is simply to take the PM ref in panthor_device_unplug() a
> little bit earlier, before drm_dev_unplug().
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Fixes: 5fe909cae118a ("drm/panthor: Add the device logical block")

Pushed to drm-misc-next.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 81df49880bd87..962a10e00848e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -83,6 +83,8 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  		return;
>  	}
>  
> +	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
> +
>  	/* Call drm_dev_unplug() so any access to HW blocks happening after
>  	 * that point get rejected.
>  	 */
> @@ -93,8 +95,6 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	 */
>  	mutex_unlock(&ptdev->unplug.lock);
>  
> -	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
> -
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
>  	 */
> -- 
> 2.47.2
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
