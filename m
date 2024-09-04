Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BD96B8A5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 12:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B6410E03B;
	Wed,  4 Sep 2024 10:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="C7z2bSfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F70210E74C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725446147;
 bh=sq1HLtAaTzHAr2JrOecqssPZDwWSMAtYsh1WiUbcq1E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C7z2bSfZZsKiH8FBsZ5X23cTwZ1fziilwy4D4NX/akQtgeapI7MueKiylFGcbyV9n
 9VCy1L89x0bAn70tE5o8Cue+qScpoXcrZT3hUM3ueolX/vQctj1M3j5AMdI4UPR+UX
 Y2RW3sVHpaNJOeDLLQf/cx9xT/z9CrJ+61h+aC7pdEdzdWr8BKODhxWbLY83m/NSTg
 Se/m+Y/mop0SsBStfpMALerSjgQfQXjKkoffryaKjZ5YSHJLHCbMpX0GWWujWv6tDa
 KvdDa6IpxADxt+e7Ao5wIH+hFileXUwbgHQS1+I+V1icWLeo5BltuduLkX0EBDH7pI
 xeKgCJQgLmn5g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2630E17E0FC7;
 Wed,  4 Sep 2024 12:35:47 +0200 (CEST)
Date: Wed, 4 Sep 2024 12:35:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mary Guillemard <mary.guillemard@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com,
 stable@vger.kernel.org, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panthor: Restrict high priorities on group_create
Message-ID: <20240904123542.2b22a92e@collabora.com>
In-Reply-To: <20240903144955.144278-2-mary.guillemard@collabora.com>
References: <20240903144955.144278-2-mary.guillemard@collabora.com>
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

On Tue,  3 Sep 2024 16:49:55 +0200
Mary Guillemard <mary.guillemard@collabora.com> wrote:

> We were allowing any users to create a high priority group without any
> permission checks. As a result, this was allowing possible denial of
> service.
> 
> We now only allow the DRM master or users with the CAP_SYS_NICE
> capability to set higher priorities than PANTHOR_GROUP_PRIORITY_MEDIUM.
> 
> As the sole user of that uAPI lives in Mesa and hardcode a value of
> MEDIUM [1], this should be safe to do.
> 
> Additionally, as those checks are performed at the ioctl level,
> panthor_group_create now only check for priority level validity.
> 
> [1]https://gitlab.freedesktop.org/mesa/mesa/-/blob/f390835074bdf162a63deb0311d1a6de527f9f89/src/gallium/drivers/panfrost/pan_csf.c#L1038
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Cc: stable@vger.kernel.org

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.c |  2 +-
>  include/uapi/drm/panthor_drm.h          |  6 +++++-
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index b5e7b919f241..34182f67136c 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -10,6 +10,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  
> +#include <drm/drm_auth.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_exec.h>
> @@ -996,6 +997,24 @@ static int panthor_ioctl_group_destroy(struct drm_device *ddev, void *data,
>  	return panthor_group_destroy(pfile, args->group_handle);
>  }
>  
> +static int group_priority_permit(struct drm_file *file,
> +				 u8 priority)
> +{
> +	/* Ensure that priority is valid */
> +	if (priority > PANTHOR_GROUP_PRIORITY_HIGH)
> +		return -EINVAL;
> +
> +	/* Medium priority and below are always allowed */
> +	if (priority <= PANTHOR_GROUP_PRIORITY_MEDIUM)
> +		return 0;
> +
> +	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
> +	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
> +		return 0;
> +
> +	return -EACCES;
> +}
> +
>  static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  				      struct drm_file *file)
>  {
> @@ -1011,6 +1030,10 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  	if (ret)
>  		return ret;
>  
> +	ret = group_priority_permit(file, args->priority);
> +	if (ret)
> +		return ret;
> +
>  	ret = panthor_group_create(pfile, args, queue_args);
>  	if (ret >= 0) {
>  		args->group_handle = ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index c426a392b081..91a31b70c037 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3092,7 +3092,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	if (group_args->pad)
>  		return -EINVAL;
>  
> -	if (group_args->priority > PANTHOR_CSG_PRIORITY_HIGH)
> +	if (group_args->priority >= PANTHOR_CSG_PRIORITY_COUNT)
>  		return -EINVAL;
>  
>  	if ((group_args->compute_core_mask & ~ptdev->gpu_info.shader_present) ||
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 926b1deb1116..e23a7f9b0eac 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -692,7 +692,11 @@ enum drm_panthor_group_priority {
>  	/** @PANTHOR_GROUP_PRIORITY_MEDIUM: Medium priority group. */
>  	PANTHOR_GROUP_PRIORITY_MEDIUM,
>  
> -	/** @PANTHOR_GROUP_PRIORITY_HIGH: High priority group. */
> +	/**
> +	 * @PANTHOR_GROUP_PRIORITY_HIGH: High priority group.
> +	 *
> +	 * Requires CAP_SYS_NICE or DRM_MASTER.
> +	 */
>  	PANTHOR_GROUP_PRIORITY_HIGH,
>  };
>  
> 
> base-commit: a15710027afb40c7c1e352902fa5b8c949f021de

