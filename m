Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76747161524
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 15:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2076E96E;
	Mon, 17 Feb 2020 14:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F2F6E96E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 14:53:31 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 06:53:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,453,1574150400"; d="scan'208";a="282544401"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 17 Feb 2020 06:53:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 17 Feb 2020 16:53:27 +0200
Date: Mon, 17 Feb 2020 16:53:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH] drm/edid: temporary workaround to pass HDMI 2.0
 compliance HF1-13
Message-ID: <20200217145327.GO13686@intel.com>
References: <20200217174139.3018-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217174139.3018-1-shawn.c.lee@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Cooper Chiou <cooper.chiou@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 01:41:39AM +0800, Lee Shawn C wrote:
> Test case HF1-13 for HDMI 2.0 compliance would ask DUT to downgrade
> output resolution to 720x480 or 720x576 (lower than 3.4Gbps).
> And check scrambling feature was disabled as well.
> =

> But QD980 report it can support low rate scrambling. The vendor
> specific data block byte[6] was 0x88. If driver enabled scrambling
> rely on this info. Then HF1-13 would not get pass because DUT have
> to disable scrambling to run this case.

Sounds like a broken test to me.

> =

> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Clint Taylor <clinton.a.taylor@intel.com>
> Cc: Cooper Chiou <cooper.chiou@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6c9f84..0b4badc20c35 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -85,6 +85,8 @@
>  #define EDID_QUIRK_FORCE_10BPC			(1 << 11)
>  /* Non desktop display (i.e. HMD) */
>  #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
> +/* Do not enable low rates scrambling */
> +#define EDID_QUIRK_DISABLE_LOW_RATE_SCRAMBLING	(1 << 13)
>  =

>  struct detailed_mode_closure {
>  	struct drm_connector *connector;
> @@ -214,6 +216,9 @@ static const struct edid_quirk {
>  =

>  	/* OSVR HDK and HDK2 VR Headsets */
>  	{ "SVR", 0x1019, EDID_QUIRK_NON_DESKTOP },
> +
> +	/* Quantumdata 980 test platform */
> +	{ "QDI", 0x03D4, EDID_QUIRK_DISABLE_LOW_RATE_SCRAMBLING },
>  };
>  =

>  /*
> @@ -4710,10 +4715,11 @@ static void drm_parse_ycbcr420_deep_color_info(st=
ruct drm_connector *connector,
>  }
>  =

>  static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
> -				 const u8 *hf_vsdb)
> +				 const u8 *hf_vsdb, const struct edid *edid)
>  {
>  	struct drm_display_info *display =3D &connector->display_info;
>  	struct drm_hdmi_info *hdmi =3D &display->hdmi;
> +	u32 quirks =3D edid_get_quirks(edid);
>  =

>  	display->has_hdmi_infoframe =3D true;
>  =

> @@ -4747,7 +4753,8 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_co=
nnector *connector,
>  			scdc->scrambling.supported =3D true;
>  =

>  			/* Few sinks support scrambling for clocks < 340M */
> -			if ((hf_vsdb[6] & 0x8))
> +			if ((hf_vsdb[6] & 0x8) &&
> +			    !(quirks & EDID_QUIRK_DISABLE_LOW_RATE_SCRAMBLING))
>  				scdc->scrambling.low_rates =3D true;
>  		}
>  	}
> @@ -4870,7 +4877,7 @@ static void drm_parse_cea_ext(struct drm_connector =
*connector,
>  		if (cea_db_is_hdmi_vsdb(db))
>  			drm_parse_hdmi_vsdb_video(connector, db);
>  		if (cea_db_is_hdmi_forum_vsdb(db))
> -			drm_parse_hdmi_forum_vsdb(connector, db);
> +			drm_parse_hdmi_forum_vsdb(connector, db, edid);
>  		if (cea_db_is_y420cmdb(db))
>  			drm_parse_y420cmdb_bitmap(connector, db);
>  		if (cea_db_is_vcdb(db))
> -- =

> 2.17.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
