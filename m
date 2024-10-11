Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D699AF4C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 01:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAC010EB43;
	Fri, 11 Oct 2024 23:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA97E10EB43
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 23:22:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0112DA7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 16:22:45 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D2F483F5A1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 16:22:15 -0700 (PDT)
Date: Sat, 12 Oct 2024 00:22:06 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panthor: Fix runtime suspend sequence after OPP
 transition error
Message-ID: <ZwmzHj1CJMQVAyun@e110455-lin.cambridge.arm.com>
References: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
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

On Fri, Oct 11, 2024 at 11:56:59PM +0100, Adrián Larumbe wrote:
> In case an OPP transition to a suspension state fails during the runtime
> PM suspend call, if the driver's subsystems were successfully resumed,
> we should return -EAGAIN so that the device's runtime PM status remains
> 'active'.
> 
> If FW reload failed, then we should fall through, so that the PM core
> can flag the device as having suffered a runtime error.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com> for this patch. For the other two
I would like first if we try to understand why the suspend does not happen
quick enough (or at all).

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 4082c8f2951d..cedd3cbcb47d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -528,8 +528,13 @@ int panthor_device_suspend(struct device *dev)
>  		    drm_dev_enter(&ptdev->base, &cookie)) {
>  			panthor_gpu_resume(ptdev);
>  			panthor_mmu_resume(ptdev);
> -			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> -			panthor_sched_resume(ptdev);
> +			ret = panthor_fw_resume(ptdev);
> +			if (!ret) {
> +				panthor_sched_resume(ptdev);
> +				ret = -EAGAIN;
> +			} else {
> +				drm_err(&ptdev->base, "FW resume failed at runtime suspend: %d\n", ret);
> +			}
>  			drm_dev_exit(cookie);
>  		}
>  
> -- 
> 2.46.2
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
