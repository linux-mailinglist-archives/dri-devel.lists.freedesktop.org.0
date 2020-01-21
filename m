Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97B143F75
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 15:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13A6ED15;
	Tue, 21 Jan 2020 14:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7546ED15;
 Tue, 21 Jan 2020 14:26:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 06:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="215552065"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 21 Jan 2020 06:26:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Jan 2020 16:26:24 +0200
Date: Tue, 21 Jan 2020 16:26:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/2] drm: support feature masks in drm_core_check_feature()
Message-ID: <20200121142624.GA13686@intel.com>
References: <20200121105331.6825-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121105331.6825-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 12:53:30PM +0200, Jani Nikula wrote:
> Allow a mask of features to be passed to drm_core_check_feature(). All
> features in the mask are required.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_drv.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> =

> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index cf13470810a5..51b486d1ee81 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -826,16 +826,18 @@ static inline bool drm_dev_is_unplugged(struct drm_=
device *dev)
>  /**
>   * drm_core_check_feature - check driver feature flags
>   * @dev: DRM device to check
> - * @feature: feature flag
> + * @feature: feature flag(s)
              ^
missing 's'

>   *
>   * This checks @dev for driver features, see &drm_driver.driver_features,
>   * &drm_device.driver_features, and the various &enum drm_driver_feature=
 flags.
>   *
> - * Returns true if the @feature is supported, false otherwise.
> + * Returns true if all features in the @feature mask are supported, false

same here

> + * otherwise.
>   */
> -static inline bool drm_core_check_feature(const struct drm_device *dev, =
u32 feature)
> +static inline bool drm_core_check_feature(const struct drm_device *dev, =
u32 features)
>  {
> -	return dev->driver->driver_features & dev->driver_features & feature;
> +	return features && (dev->driver->driver_features & dev->driver_features=
 &
> +			    features) =3D=3D features;

Could maybe do with an extra variable?

u32 supported =3D driver->driver_features & dev->driver_features;
return features && (features & supported) =3D=3D features;

Series is
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  }
>  =

>  /**
> -- =

> 2.20.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
