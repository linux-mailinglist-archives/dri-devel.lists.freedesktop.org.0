Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F6120755
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F716E532;
	Mon, 16 Dec 2019 13:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CB06E082;
 Mon, 16 Dec 2019 13:39:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 05:39:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="212216140"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 16 Dec 2019 05:39:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 15:39:04 +0200
Date: Mon, 16 Dec 2019 15:39:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] drm/i915/dp: Use BDB_GENERAL_FEATURES VBT block info
 for builtin panel-orientation
Message-ID: <20191216133904.GP1208@intel.com>
References: <20191215213307.689830-1-hdegoede@redhat.com>
 <20191215213307.689830-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215213307.689830-2-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 10:33:07PM +0100, Hans de Goede wrote:
> Some devices with a builtin panel have the panel mounted upside down,
> this is indicated by the rotate_180 bit in the BDB_GENERAL_FEATURES VBT
> block.
> =

> We store this info in dev_priv->vbt.orientation, use this to set the
> connector's orientation property so that fbcon and userspace will show
> the image the right way up on devices with an upside-down mounted panel.
> =

> This fixes the image being upside-down on a Teclast X89 tablet.
> =

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index b05b2191b919..d31c04a22976 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -7350,9 +7350,12 @@ static bool intel_edp_init_connector(struct intel_=
dp *intel_dp,
>  	intel_connector->panel.backlight.power =3D intel_edp_backlight_power;
>  	intel_panel_setup_backlight(connector, pipe);
>  =

> -	if (fixed_mode)
> +	if (fixed_mode) {
> +		connector->display_info.panel_orientation =3D
> +			dev_priv->vbt.orientation;

Do we want to set this to UNKNOWN when the VBT didn't supply the
information? IIRC the DSI code sets it to NORMAL in that case.

>  		drm_connector_init_panel_orientation_property(
>  			connector, fixed_mode->hdisplay, fixed_mode->vdisplay);
> +	}
>  =

>  	return true;
>  =

> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
