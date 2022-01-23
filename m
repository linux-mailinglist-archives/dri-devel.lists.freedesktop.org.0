Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC4497609
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 23:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B424210E47F;
	Sun, 23 Jan 2022 22:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802E210E194;
 Sun, 23 Jan 2022 22:37:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB811D41;
 Sun, 23 Jan 2022 23:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1642977476;
 bh=LGBn1RwFmm14/HzhggmIU5tcjXm8g8aTB4rurTsCMvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vD1LKIjcmmVVOL0oevmpZCrWFoh6g8KTV0XxZ+xE85uW7He1VsXYe1kY6o0dmXCvd
 vZpb+uDlWdCzyXWHSjCRF4AS8UZmhWHc4Rd+pvLOVyn0/0JCmlnsr46vZMx016Fv1+
 tlVTJXXLT7AyQb+Zch/l4GH2VeA5kdehfBKD41EQ=
Date: Mon, 24 Jan 2022 00:37:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [RFC PATCH v3 2/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Message-ID: <Ye3Ys5cToECCazq2@pendragon.ideasonboard.com>
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-3-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220114101753.24996-3-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Esaki-san,

Thank you for the patch.

On Fri, Jan 14, 2022 at 07:17:52PM +0900, Tomohito Esaki wrote:
> The LINEAR modifier is advertised as default if a driver doesn't specify
> modifiers.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  drivers/gpu/drm/drm_plane.c | 15 ++++++++++++---
>  include/drm/drm_plane.h     |  3 +++
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index deeec60a3315..5aa7e241971e 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -237,6 +237,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  				      const char *name, va_list ap)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
> +	const uint64_t default_modifiers[] = {

This can be static.

> +		DRM_FORMAT_MOD_LINEAR,
> +		DRM_FORMAT_MOD_INVALID

No need for a terminator here. The terminator is needed in the
format_modifiers array passed to this function, to count the number of
elements, but the default_modifiers is used with a hard-coded count.

> +	};
>  	unsigned int format_modifier_count = 0;
>  	int ret;
>  
> @@ -277,6 +281,11 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  
>  		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
>  			format_modifier_count++;
> +	} else {
> +		if (!dev->mode_config.fb_modifiers_not_supported) {
> +			format_modifiers = default_modifiers;
> +			format_modifier_count = 1;

You can use

			format_modifier_count = ARRAY_SIZE(default_modifiers);

> +		}
>  	}
>  
>  	/* autoset the cap and check for consistency across all planes */
> @@ -341,7 +350,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
>  	}
>  
> -	if (config->allow_fb_modifiers)
> +	if (format_modifier_count)
>  		create_in_format_blob(dev, plane);
>  
>  	return 0;
> @@ -368,8 +377,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>   * drm_universal_plane_init() to let the DRM managed resource infrastructure
>   * take care of cleanup and deallocation.
>   *
> - * Drivers supporting modifiers must set @format_modifiers on all their planes,
> - * even those that only support DRM_FORMAT_MOD_LINEAR.
> + * For drivers supporting modifiers, all planes will advertise
> + * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.

I'd write this a bit differently:

 * Drivers that only support the DRM_FORMAT_MOD_LINEAR modifier support may set
 * @format_modifiers to NULL. The plane will advertise the linear modifier.

As fb_modifiers_not_supported is only for a few legacy drivers, I
wouldn't even mention it here, it would only obfuscate things.

>   *
>   * Returns:
>   * Zero on success, error code on failure.
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 0c1102dc4d88..cad641b1f797 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -803,6 +803,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
>   *
>   * The @drm_plane_funcs.destroy hook must be NULL.
>   *
> + * For drivers supporting modifiers, all planes will advertise
> + * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.

Same here.

With these small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + *
>   * Returns:
>   * Pointer to new plane, or ERR_PTR on failure.
>   */

-- 
Regards,

Laurent Pinchart
