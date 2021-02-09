Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BF3152E4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 16:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B6B6EB67;
	Tue,  9 Feb 2021 15:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA91E6EB67;
 Tue,  9 Feb 2021 15:36:10 +0000 (UTC)
IronPort-SDR: 29RSp6vMIdQaKblOVPbCQ7bkzPpMjDWsNF39QoXomQI+cADV/EJ9Mn83BMXqkOuBJsBKUh2csk
 9lNPueD3YQ5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="179339839"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="179339839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 07:36:10 -0800
IronPort-SDR: Sea8NHAhGA9jZbHTingLKer22K0lsSEL5F8qjZEtJ6c0R3HRMAIUn6WpXgVP95rUBTp+0IBmqQ
 +anFK+cXiDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; d="scan'208";a="488186228"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 09 Feb 2021 07:36:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 09 Feb 2021 17:36:07 +0200
Date: Tue, 9 Feb 2021 17:36:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/vblank: Document drm_crtc_vblank_restore constraints
Message-ID: <YCKr50cudEYgAiiF@intel.com>
References: <20210209101523.2954281-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209101523.2954281-1-daniel.vetter@ffwll.ch>
X-Patchwork-Hint: comment
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 11:15:23AM +0100, Daniel Vetter wrote:
> I got real badly confused when trying to review a fix from Ville for
> this. Let's try to document better what's required for this, and check
> the minimal settings at runtime - we can't check ofc that there's
> indeed no races in the driver callback.
> =

> Also noticed that the drm_vblank_restore version is unused, so lets
> unexport that while at it.
> =

> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 25 ++++++++++---------------
>  include/drm/drm_vblank.h     |  1 -
>  2 files changed, 10 insertions(+), 16 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index c914b14cfb43..05f4d4c078fd 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1471,20 +1471,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_on);
>  =

> -/**
> - * drm_vblank_restore - estimate missed vblanks and update vblank count.
> - * @dev: DRM device
> - * @pipe: CRTC index
> - *
> - * Power manamement features can cause frame counter resets between vbla=
nk
> - * disable and enable. Drivers can use this function in their
> - * &drm_crtc_funcs.enable_vblank implementation to estimate missed vblan=
ks since
> - * the last &drm_crtc_funcs.disable_vblank using timestamps and update t=
he
> - * vblank counter.
> - *
> - * This function is the legacy version of drm_crtc_vblank_restore().
> - */
> -void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
> +static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
>  {
>  	ktime_t t_vblank;
>  	struct drm_vblank_crtc *vblank;
> @@ -1520,7 +1507,6 @@ void drm_vblank_restore(struct drm_device *dev, uns=
igned int pipe)
>  		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
>  	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
>  }
> -EXPORT_SYMBOL(drm_vblank_restore);
>  =

>  /**
>   * drm_crtc_vblank_restore - estimate missed vblanks and update vblank c=
ount.
> @@ -1531,9 +1517,18 @@ EXPORT_SYMBOL(drm_vblank_restore);
>   * &drm_crtc_funcs.enable_vblank implementation to estimate missed vblan=
ks since
>   * the last &drm_crtc_funcs.disable_vblank using timestamps and update t=
he
>   * vblank counter.
> + *
> + * Note that drivers must have race-free high-precision timestamping sup=
port,
> + * i.e.  &drm_crtc_funcs.get_vblank_timestamp must be hooked up and
> + * &drm_driver.vblank_disable_immediate must be set to indicate the
> + * time-stamping functions are race-free against vblank hardware counter
> + * increments.

Looks good. Might prevent someone from shooting themselves in
the foot.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>   */
>  void drm_crtc_vblank_restore(struct drm_crtc *crtc)
>  {
> +	WARN_ON_ONCE(!crtc->funcs->get_vblank_timestamp);
> +	WARN_ON_ONCE(!crtc->dev->vblank_disable_immediate);
> +
>  	drm_vblank_restore(crtc->dev, drm_crtc_index(crtc));
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_restore);
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index dd125f8c766c..733a3e2d1d10 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -247,7 +247,6 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc);
>  void drm_crtc_vblank_reset(struct drm_crtc *crtc);
>  void drm_crtc_vblank_on(struct drm_crtc *crtc);
>  u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc);
> -void drm_vblank_restore(struct drm_device *dev, unsigned int pipe);
>  void drm_crtc_vblank_restore(struct drm_crtc *crtc);
>  =

>  void drm_calc_timestamping_constants(struct drm_crtc *crtc,
> -- =

> 2.30.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
