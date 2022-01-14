Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8FC48EEAB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 17:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807B10EB02;
	Fri, 14 Jan 2022 16:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477F810EAFA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 16:50:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s1so16594500wra.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=VEOOxhr/Qwdhz6jGRXCfn43YOQWOPX+v7bNM1lLXnMs=;
 b=GQYnWMHTELRAX6IxEgSqmKjWAnpubD1b5rEvbvgGfNtDbs7tQuSCh/OrJmX7kDVK8z
 rPdvpyBfW761Oyb3/+SC3o/9fHqJEKGv83GhHHBQM/aW0ZBAtayMSxhfItAzaxMYLRRt
 5CZsm6e0kddTqky4BUZbuj+6wzRBrVNehO/QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=VEOOxhr/Qwdhz6jGRXCfn43YOQWOPX+v7bNM1lLXnMs=;
 b=vNimta4+IXoX0OSwXsCoAIDi3+/qcbvO+ig97GKAeu/I9ZZX7Ou9MXUMrF80Km7TBL
 w3rZGl7y7fx0CKRjIt4sKzNq1BFW6MGiK+CAm4MgfyJBw+KUWnY9WQoSTd7KCPZYvisT
 yENj/UMy6H9omBJ+C679UKdC1l+0ziJwH2afnwJPfGdU0bsEggW78V538HYF9KiGzjJc
 A+ZrUqyUHYPah8zp8rbxuqA/5BpccL8CvO0vkznvtz7HzIYZOUBfwPUg8ORCns8ULCAn
 WUOBNFyx8MgbH8Ly4CTxHo7Zm828FsUP8adH5dKKUnp17XoSyTUQXrMfAmwDTEitrbj5
 P2+w==
X-Gm-Message-State: AOAM531QJ4Eo04D9F+ilsAGVbyKwmdaJ7iVymYHX4f3Z6uOMhMYHOOFv
 VtCEoJbFXJtNKEgL/06+hOudJA==
X-Google-Smtp-Source: ABdhPJwz9kukA9QNeawPcf2CaPxbGlOu7bGLv961X6bi262Yhbg82aYRWaL5DsXL4YUvYSzxOtsv8Q==
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr2499147wri.350.1642179014678; 
 Fri, 14 Jan 2022 08:50:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l6sm9036159wry.18.2022.01.14.08.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 08:50:14 -0800 (PST)
Date: Fri, 14 Jan 2022 17:50:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [RFC PATH 1/3] drm: add support modifiers for drivers whose
 planes only support linear layout
Message-ID: <YeGpw7L3jODHHnPC@phenom.ffwll.local>
Mail-Followup-To: Tomohito Esaki <etom@igel.co.jp>,
 dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Simon Ser <contact@emersion.fr>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Mark Yacoub <markyacoub@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Evan Quan <evan.quan@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>
References: <20211222052727.19725-1-etom@igel.co.jp>
 <20211222052727.19725-2-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222052727.19725-2-etom@igel.co.jp>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 22, 2021 at 02:27:25PM +0900, Tomohito Esaki wrote:
> The LINEAR modifier is advertised as default if a driver doesn't specify
> modifiers. However, there are legacy drivers such as radeon that do not
> support modifiers but infer the actual layout of the underlying buffer.
> Therefore, a new flag not_support_fb_modifires is introduced for these
> legacy drivers. Allow_fb_modifiers will be replaced with this new flag.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  drivers/gpu/drm/drm_plane.c   | 34 ++++++++++++++++++++++++++--------
>  include/drm/drm_mode_config.h | 10 ++++++++++
>  include/drm/drm_plane.h       |  3 +++
>  3 files changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 82afb854141b..75308ee240c0 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -161,6 +161,16 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
>  	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
>  }
>  
> +static bool check_format_modifier(struct drm_plane *plane, uint32_t format,
> +				  uint64_t modifier)
> +{
> +	if (plane->funcs->format_mod_supported)
> +		return plane->funcs->format_mod_supported(plane, format,
> +							  modifier);
> +
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}
> +
>  static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
>  {
>  	const struct drm_mode_config *config = &dev->mode_config;
> @@ -203,16 +213,15 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
>  
>  	/* If we can't determine support, just bail */
> -	if (!plane->funcs->format_mod_supported)
> +	if (config->fb_modifiers_not_supported)
>  		goto done;
>  
>  	mod = modifiers_ptr(blob_data);
>  	for (i = 0; i < plane->modifier_count; i++) {
>  		for (j = 0; j < plane->format_count; j++) {
> -			if (plane->funcs->format_mod_supported(plane,
> -							       plane->format_types[j],
> -							       plane->modifiers[i])) {
> -
> +			if (check_format_modifier(plane,
> +						  plane->format_types[j],
> +						  plane->modifiers[i])) {
>  				mod->formats |= 1ULL << j;
>  			}
>  		}
> @@ -242,6 +251,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  				      const char *name, va_list ap)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
> +	const uint64_t default_modifiers[] = {
> +		DRM_FORMAT_MOD_LINEAR,
> +		DRM_FORMAT_MOD_INVALID
> +	};
>  	unsigned int format_modifier_count = 0;
>  	int ret;
>  
> @@ -282,6 +295,11 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  
>  		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
>  			format_modifier_count++;
> +	} else {
> +		if (!dev->mode_config.fb_modifiers_not_supported) {
> +			format_modifiers = default_modifiers;
> +			format_modifier_count = 1;
> +		}
>  	}
>  
>  	/* autoset the cap and check for consistency across all planes */
> @@ -346,7 +364,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
>  	}
>  
> -	if (config->allow_fb_modifiers)
> +	if (format_modifier_count)
>  		create_in_format_blob(dev, plane);
>  
>  	return 0;
> @@ -373,8 +391,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>   * drm_universal_plane_init() to let the DRM managed resource infrastructure
>   * take care of cleanup and deallocation.
>   *
> - * Drivers supporting modifiers must set @format_modifiers on all their planes,
> - * even those that only support DRM_FORMAT_MOD_LINEAR.
> + * For drivers supporting modifiers, all planes will advertise
> + * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.
>   *
>   * Returns:
>   * Zero on success, error code on failure.
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 48b7de80daf5..c56f298c55bd 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -920,6 +920,16 @@ struct drm_mode_config {
>  	 */
>  	bool allow_fb_modifiers;
>  
> +	/**
> +	 * @fb_modifiers_not_supported:
> +	 *
> +	 * This flag is for legacy drivers such as radeon that do not support

Maybe don't put specific driver names into kerneldoc (in commit message to
motivate your changes it's fine). It's unlikely radeon ever changes on
this, but also no one will update this in the docs if we ever do that.

Perhaps also add that new driver should never set this, just to hammer it
home that modifiers really should work everywhere.

Otherwise I think this series is the right thing to do.
-Daniel

> +	 * modifiers but infer the actual layout of the underlying buffer.
> +	 * Generally, each drivers must support modifiers, this flag should not
> +	 * be set.
> +	 */
> +	bool fb_modifiers_not_supported;
> +
>  	/**
>  	 * @normalize_zpos:
>  	 *
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
> + *
>   * Returns:
>   * Pointer to new plane, or ERR_PTR on failure.
>   */
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
