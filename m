Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB9A34E9C7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 16:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642D86E900;
	Tue, 30 Mar 2021 14:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A2B6E900
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:01:40 +0000 (UTC)
IronPort-SDR: GlEcGOyS60mPVcilpclCoPOl/yF54XcpTWPPDJnQzDIV5njwFUCbvKdcqGQuSwKEY6kTt6YoqR
 FSYWkYlUvC/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="171180138"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; d="scan'208";a="171180138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 07:01:40 -0700
IronPort-SDR: 5W+Pm6pxQg6paSSW3ZNE+fcuk5O4p375dGVxqhVSMpGKPVVVIqYWkyXryVZ5nDiysAb0acP8mz
 X3GqIRXqeH+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="393618051"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 30 Mar 2021 07:01:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Mar 2021 17:01:31 +0300
Date: Tue, 30 Mar 2021 17:01:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 09/14] drm/edid: Use the cached EDID in drm_get_edid()
 if eDP
Message-ID: <YGMvO3PNDCiBmqov@intel.com>
References: <20210330025345.3980086-1-dianders@chromium.org>
 <20210329195255.v2.9.Ia7e9bb7cf6c51d960b9455fb0fa447cc68ece99d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329195255.v2.9.Ia7e9bb7cf6c51d960b9455fb0fa447cc68ece99d@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 07:53:40PM -0700, Douglas Anderson wrote:
> Each time we call drm_get_edid() we:
> 1. Go out to the bus and ask for the EDID.
> 2. Cache the EDID.
> =

> We can improve this to actually use the cached EDID so that if
> drm_get_edid() is called multiple times then we don't need to go out
> to the bus over and over again.
> =

> In normal DP/HDMI cases reading the EDID over and over again isn't
> _that_ expensive so, presumably, this wasn't that critical in the
> past. However for eDP going out to the bus can be expensive. This is
> because eDP panels might be powered off before the EDID was requested
> so we need to do power sequencing in addition to the transfer.
> =

> In theory we should be able to cache the EDID for all types of
> displays. There is already code throwing the cache away when we detect
> that a display was unplugged. However, it can be noted that it's
> _extra_ safe to cache the EDID for eDP since eDP isn't a hot-pluggable
> interface. If we get the EDID once then we've got the EDID and we
> should never need to read it again. For now we'll only use the cache
> for eDP both because it's more important and extra safe.
> =

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> =

> (no changes since v1)
> =

>  drivers/gpu/drm/drm_edid.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c2bbe7bee7b6..fcbf468d73c9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2049,15 +2049,39 @@ struct edid *drm_get_edid(struct drm_connector *c=
onnector,
>  			  struct i2c_adapter *adapter)
>  {
>  	struct edid *edid;
> +	size_t old_edid_size;
> +	const struct edid *old_edid;
>  =

>  	if (connector->force =3D=3D DRM_FORCE_OFF)
>  		return NULL;
>  =

> -	if (connector->force =3D=3D DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(ada=
pter))
> -		return NULL;
> +	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP &&
> +	    connector->edid_blob_ptr) {
> +		/*
> +		 * eDP devices are non-removable, or at least not something
> +		 * that's expected to be hot-pluggable. We can freely use
> +		 * the cached EDID.
> +		 *
> +		 * NOTE: technically we could probably even use the cached
> +		 * EDID even for non-eDP because the cached EDID should be
> +		 * cleared if we ever notice a display is not connected, but
> +		 * we'll use an abundance of caution and only do it for eDP.
> +		 * It's more important for eDP anyway because the EDID may not
> +		 * always be readable, like when the panel is powered down.
> +		 */
> +		old_edid =3D (const struct edid *)connector->edid_blob_ptr->data;
> +		old_edid_size =3D ksize(old_edid);
> +		edid =3D kmalloc(old_edid_size, GFP_KERNEL);
> +		if (edid)
> +			memcpy(edid, old_edid, old_edid_size);
> +	} else {
> +		if (connector->force =3D=3D DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(ad=
apter))
> +			return NULL;
> +
> +		edid =3D drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
> +		drm_connector_update_edid_property(connector, edid);
> +	}

This is a pretty low level function. Too low level for this caching
IMO. So I think better just do it a bit higher up like other drivers.

>  =

> -	edid =3D drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
> -	drm_connector_update_edid_property(connector, edid);
>  	return edid;
>  }
>  EXPORT_SYMBOL(drm_get_edid);
> -- =

> 2.31.0.291.g576ba9dcdaf-goog
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
