Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6142125440E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 12:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481696E061;
	Thu, 27 Aug 2020 10:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064F56E061
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 10:57:05 +0000 (UTC)
IronPort-SDR: YhJqvnCOXS0+ujjrrrOA4P/b/Fqdi3a47SI6wrqytr7nghmlkklN85yd3GhHSgQa64UtBe9FA7
 4zfSGT8W/FbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="154019830"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="154019830"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 03:57:05 -0700
IronPort-SDR: 5VR6ccig7DZlLiO+sMhEo+Emle4xy6LXWOE2nLy+9HD06TFwaDF3kjkmYll9QnidBP84HuExZ0
 bWSumeroZ0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="299810019"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 27 Aug 2020 03:57:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 27 Aug 2020 13:57:01 +0300
Date: Thu, 27 Aug 2020 13:57:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH] drm: Parse Colorimetry data block from EDID
Message-ID: <20200827105701.GS6112@intel.com>
References: <20200826142328.131144-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826142328.131144-1-algea.cao@rock-chips.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 10:23:28PM +0800, Algea Cao wrote:
> CEA 861.3 spec adds colorimetry data block for HDMI.
> Parsing the block to get the colorimetry data from
> panel.

And what exactly do you want to do with that data?

> =

> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> ---
> =

>  drivers/gpu/drm/drm_edid.c  | 45 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h |  3 +++
>  include/drm/drm_edid.h      | 14 ++++++++++++
>  3 files changed, 62 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 31496b6cfc56..67e607c04492 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3223,6 +3223,7 @@ add_detailed_modes(struct drm_connector *connector,=
 struct edid *edid,
>  #define VIDEO_BLOCK     0x02
>  #define VENDOR_BLOCK    0x03
>  #define SPEAKER_BLOCK	0x04
> +#define COLORIMETRY_DATA_BLOCK		0x5
>  #define HDR_STATIC_METADATA_BLOCK	0x6
>  #define USE_EXTENDED_TAG 0x07
>  #define EXT_VIDEO_CAPABILITY_BLOCK 0x00
> @@ -4309,6 +4310,48 @@ static void fixup_detailed_cea_mode_clock(struct d=
rm_display_mode *mode)
>  	mode->clock =3D clock;
>  }
>  =

> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
> +{
> +	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (db[1] !=3D COLORIMETRY_DATA_BLOCK)
> +		return false;
> +
> +	if (cea_db_payload_len(db) < 2)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void
> +drm_parse_colorimetry_data_block(struct drm_connector *connector, const =
u8 *db)
> +{
> +	struct drm_hdmi_info *info =3D &connector->display_info.hdmi;
> +
> +	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_xvYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_709)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_xvYCC_709;
> +	if (db[2] & DRM_EDID_CLRMETRY_sYCC_601)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_sYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_ADBYCC_601)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_ADBYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_ADB_RGB)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_ADB_RGB;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_CYCC)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_BT2020_CYCC;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_YCC)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_BT2020_YCC;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_RGB)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_BT2020_RGB;
> +	/* Byte 4 Bit 7: DCI-P3 */
> +	if (db[3] & BIT(7))
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_DCI_P3;
> +
> +	DRM_DEBUG_KMS("Supported Colorimetry 0x%x\n", info->colorimetry);
> +}
> +
>  static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
>  {
>  	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
> @@ -4994,6 +5037,8 @@ static void drm_parse_cea_ext(struct drm_connector =
*connector,
>  			drm_parse_vcdb(connector, db);
>  		if (cea_db_is_hdmi_hdr_metadata_block(db))
>  			drm_parse_hdr_metadata_block(connector, db);
> +		if (cea_db_is_hdmi_colorimetry_data_block(db))
> +			drm_parse_colorimetry_data_block(connector, db);
>  	}
>  }
>  =

> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index af145608b5ed..d599c3b9e881 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -207,6 +207,9 @@ struct drm_hdmi_info {
>  =

>  	/** @y420_dc_modes: bitmap of deep color support index */
>  	u8 y420_dc_modes;
> +
> +	/* @colorimetry: bitmap of supported colorimetry modes */
> +	u16 colorimetry;
>  };
>  =

>  /**
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index cfa4f5af49af..98fa78c2f82d 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -229,6 +229,20 @@ struct detailed_timing {
>  				    DRM_EDID_YCBCR420_DC_36 | \
>  				    DRM_EDID_YCBCR420_DC_30)
>  =

> +/*
> + * Supported Colorimetry from colorimetry data block
> + * as per CEA 861-G spec
> + */
> +#define DRM_EDID_CLRMETRY_xvYCC_601   (1 << 0)
> +#define DRM_EDID_CLRMETRY_xvYCC_709   (1 << 1)
> +#define DRM_EDID_CLRMETRY_sYCC_601    (1 << 2)
> +#define DRM_EDID_CLRMETRY_ADBYCC_601  (1 << 3)
> +#define DRM_EDID_CLRMETRY_ADB_RGB     (1 << 4)
> +#define DRM_EDID_CLRMETRY_BT2020_CYCC (1 << 5)
> +#define DRM_EDID_CLRMETRY_BT2020_YCC  (1 << 6)
> +#define DRM_EDID_CLRMETRY_BT2020_RGB  (1 << 7)
> +#define DRM_EDID_CLRMETRY_DCI_P3      (1 << 15)
> +
>  /* ELD Header Block */
>  #define DRM_ELD_HEADER_BLOCK_SIZE	4
>  =

> -- =

> 2.25.1
> =

> =

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
