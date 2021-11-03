Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8D444299
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 14:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C8B6E11E;
	Wed,  3 Nov 2021 13:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C7A6E11E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 13:42:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="317699530"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="317699530"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 06:41:06 -0700
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="489568012"
Received: from bmagdala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.215.42])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 06:41:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 4/5] drm: Add a drm_drv_enabled() helper function
In-Reply-To: <20211103123206.1041442-1-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211103123206.1041442-1-javierm@redhat.com>
Date: Wed, 03 Nov 2021 15:41:00 +0200
Message-ID: <87o871bbmb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neal Gompa <ngompa13@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
> DRM drivers can use this to determine whether they can be enabled or not.
>
> For now it's just a wrapper around drm_modeset_disabled() but having the
> indirection level will allow to add other conditions besides "nomodeset".
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Can't see i915 trivially using this due to the drm_driver
parameter. Please let's not merge helpers like this without actual
users.

BR,
Jani.


> ---
>
>  drivers/gpu/drm/drm_drv.c | 21 +++++++++++++++++++++
>  include/drm/drm_drv.h     |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8214a0b1ab7f..70ef08941e06 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -975,6 +975,27 @@ int drm_dev_set_unique(struct drm_device *dev, const char *name)
>  }
>  EXPORT_SYMBOL(drm_dev_set_unique);
>  
> +/**
> + * drm_drv_enabled - Checks if a DRM driver can be enabled
> + * @driver: DRM driver to check
> + *
> + * Checks whether a DRM driver can be enabled or not. This may be the case
> + * if the "nomodeset" kernel command line parameter is used.
> + *
> + * Returns:
> + * True if the DRM driver is enabled and false otherwise.
> + */
> +bool drm_drv_enabled(const struct drm_driver *driver)
> +{
> +	if (drm_modeset_disabled()) {
> +		DRM_INFO("%s driver is disabled\n", driver->name);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_drv_enabled);
> +
>  /*
>   * DRM Core
>   * The DRM core module initializes all global DRM objects and makes them
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 0cd95953cdf5..48f2b6eec012 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -598,5 +598,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
>  
>  int drm_dev_set_unique(struct drm_device *dev, const char *name);
>  
> +bool drm_drv_enabled(const struct drm_driver *driver);
>  
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
