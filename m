Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29105665C41
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D64310E138;
	Wed, 11 Jan 2023 13:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F047B10E138
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 13:15:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6F313D5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 05:16:11 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 082E83F71A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 05:15:28 -0800 (PST)
Date: Wed, 11 Jan 2023 13:15:16 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/10] drm: Include <linux/of.h> where needed
Message-ID: <Y762ZNgVnDi4UJ1G@e110455-lin.cambridge.arm.com>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111130206.29974-3-tzimmermann@suse.de>
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
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 02:01:58PM +0100, Thomas Zimmermann wrote:
> Include <linux/of.h> in source files that need it. Some of DRM's
> source code gets OF header via drm_crtc_helper.h and <linux/fb.h>,
> which can leed to unnecessary recompilation.
> 
> In drm_modes.c, add a comment on the reason for still including
> <linux/fb.h>. The header file is required to get KHZ2PICOS(). The
> macro is part of the UAPI headers, so it cannot be moved to a less
> prominent location.
> 
> v2:
> 	* include <linux/of.h> in komeda_drv.c (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 1 +
>  drivers/gpu/drm/drm_modes.c                     | 5 +++--
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c    | 1 +
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index 3f4e719eebd8..28f76e07dd95 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -6,6 +6,7 @@
>   */
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/component.h>
>  #include <linux/pm_runtime.h>

For komeda: Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index be030f4a5311..40d482a01178 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -31,10 +31,11 @@
>   */
>  
>  #include <linux/ctype.h>
> +#include <linux/export.h>
> +#include <linux/fb.h> /* for KHZ2PICOS() */
>  #include <linux/list.h>
>  #include <linux/list_sort.h>
> -#include <linux/export.h>
> -#include <linux/fb.h>
> +#include <linux/of.h>
>  
>  #include <video/of_display_timing.h>
>  #include <video/of_videomode.h>
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index a8a98c91b13c..866d1bf5530e 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -15,6 +15,7 @@
>  #include <linux/kernel.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/regulator/consumer.h>
> -- 
> 2.39.0
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
