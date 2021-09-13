Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD04084A4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 08:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443E89F6F;
	Mon, 13 Sep 2021 06:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115C089F55;
 Mon, 13 Sep 2021 06:24:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="201759110"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="201759110"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2021 23:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="543019311"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2021 23:23:45 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 07:23:44 +0100
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2242.012;
 Mon, 13 Sep 2021 11:53:42 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v2 4/6] drm/edid: parse the DisplayID v2.0 VESA vendor
 block for MSO
Thread-Topic: [PATCH v2 4/6] drm/edid: parse the DisplayID v2.0 VESA vendor
 block for MSO
Thread-Index: AQHXnnMP3ZkKGG/hO0qHTdOFN1KAfKuhjZ7Q
Date: Mon, 13 Sep 2021 06:23:42 +0000
Message-ID: <264db723a9c34755bd8c2a052e3e5bf6@intel.com>
References: <cover.1630419362.git.jani.nikula@intel.com>
 <73ca2887e7b37880690f5c9ba4594c9cd1170669.1630419362.git.jani.nikula@intel.com>
In-Reply-To: <73ca2887e7b37880690f5c9ba4594c9cd1170669.1630419362.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni Nikula
> Sent: Tuesday, August 31, 2021 7:48 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com; Nikul=
a, Jani
> <jani.nikula@intel.com>
> Subject: [PATCH v2 4/6] drm/edid: parse the DisplayID v2.0 VESA vendor bl=
ock for
> MSO
>=20
> The VESA Organization Vendor-Specific Data Block, defined in VESA Display=
ID
> Standard v2.0, specifies the eDP Multi-SST Operation (MSO) stream count a=
nd
> segment pixel overlap.
>=20
> DisplayID v1.3 has Appendix B: DisplayID as an EDID Extension, describing=
 how
> DisplayID sections may be embedded in EDID extension blocks. DisplayID v2=
.0 does
> not have such a section, perhaps implying that DisplayID v2.0 data should=
 not be
> included in EDID extensions, but rather in a "pure" DisplayID structure a=
t its own DDC
> address pair A4h/A5h, as described in VESA E-DDC Standard v1.3 chapter 3.
>=20
> However, in practice, displays out in the field have embedded DisplayID
> v2.0 data blocks in EDID extensions, including, in particular, some eDP M=
SO displays,
> where a pure DisplayID structure is not available at all.
>=20
> Parse the MSO data from the DisplayID data block. Do it as part of
> drm_add_display_info(), extending it to parse also DisplayID data to avoi=
d requiring
> extra calls to update the information.
>=20
> v2: Check for VESA OUI (Ville)
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 72 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h | 12 +++++++  include/drm/drm_displayid.h | =
13
> +++++++
>  3 files changed, 97 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c inde=
x
> 92974b1478bc..c45c225267ca 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -28,6 +28,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>=20
> +#include <linux/bitfield.h>
>  #include <linux/hdmi.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> @@ -5145,6 +5146,71 @@ void drm_get_monitor_range(struct drm_connector
> *connector,
>  		      info->monitor_range.max_vfreq);  }
>=20
> +static void drm_parse_vesa_mso_data(struct drm_connector *connector,
> +				    const struct displayid_block *block) {
> +	struct displayid_vesa_vendor_specific_block *vesa =3D
> +		(struct displayid_vesa_vendor_specific_block *)block;
> +	struct drm_display_info *info =3D &connector->display_info;
> +
> +	if (block->num_bytes < 3) {
> +		drm_dbg_kms(connector->dev, "Unexpected vendor block size
> %u\n",
> +			    block->num_bytes);
> +		return;
> +	}
> +
> +	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) !=3D VESA_IEEE_OUI)
> +		return;
> +
> +	if (sizeof(*vesa) !=3D sizeof(*block) + block->num_bytes) {
> +		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block
> size\n");
> +		return;
> +	}
> +
> +	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
> +	default:
> +		drm_dbg_kms(connector->dev, "Reserved MSO mode value\n");
> +		fallthrough;
> +	case 0:
> +		info->mso_stream_count =3D 0;
> +		break;
> +	case 1:
> +		info->mso_stream_count =3D 2; /* 2 or 4 links */
> +		break;
> +	case 2:
> +		info->mso_stream_count =3D 4; /* 4 links */
> +		break;
> +	}
> +
> +	if (!info->mso_stream_count) {
> +		info->mso_pixel_overlap =3D 0;
> +		return;
> +	}
> +
> +	info->mso_pixel_overlap =3D FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP,
> vesa->mso);
> +	if (info->mso_pixel_overlap > 8) {
> +		drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value
> %u\n",
> +			    info->mso_pixel_overlap);
> +		info->mso_pixel_overlap =3D 8;

Going beyond 8 is not right from a vendor perspective as it goes into reser=
ved region.
Should we not just set to 0 or how we decide that we fixed overlap at 8. It=
 seems an
undefined operation and it may vary from sink to sink.

Regards,
Uma Shankar

> +	}
> +
> +	drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
> +		    info->mso_stream_count, info->mso_pixel_overlap); }
> +
> +static void drm_update_mso(struct drm_connector *connector, const
> +struct edid *edid) {
> +	const struct displayid_block *block;
> +	struct displayid_iter iter;
> +
> +	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_for_each(block, &iter) {
> +		if (block->tag =3D=3D DATA_BLOCK_2_VENDOR_SPECIFIC)
> +			drm_parse_vesa_mso_data(connector, block);
> +	}
> +	displayid_iter_end(&iter);
> +}
> +
>  /* A connector has no EDID information, so we've got no EDID to compute =
quirks
> from. Reset
>   * all of the values which would have been set from EDID
>   */
> @@ -5168,6 +5234,9 @@ drm_reset_display_info(struct drm_connector
> *connector)
>=20
>  	info->non_desktop =3D 0;
>  	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
> +
> +	info->mso_stream_count =3D 0;
> +	info->mso_pixel_overlap =3D 0;
>  }
>=20
>  u32 drm_add_display_info(struct drm_connector *connector, const struct e=
did
> *edid) @@ -5246,6 +5315,9 @@ u32 drm_add_display_info(struct drm_connecto=
r
> *connector, const struct edid *edi
>  		info->color_formats |=3D DRM_COLOR_FORMAT_YCRCB444;
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>  		info->color_formats |=3D DRM_COLOR_FORMAT_YCRCB422;
> +
> +	drm_update_mso(connector, edid);
> +
>  	return quirks;
>  }
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h in=
dex
> 79fa34e5ccdb..379746d3266f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -590,6 +590,18 @@ struct drm_display_info {
>  	 * @monitor_range: Frequency range supported by monitor range descripto=
r
>  	 */
>  	struct drm_monitor_range_info monitor_range;
> +
> +	/**
> +	 * @mso_stream_count: eDP Multi-SST Operation (MSO) stream count from
> +	 * the DisplayID VESA vendor block. 0 for conventional Single-Stream
> +	 * Transport (SST), or 2 or 4 MSO streams.
> +	 */
> +	u8 mso_stream_count;
> +
> +	/**
> +	 * @mso_pixel_overlap: eDP MSO segment pixel overlap, 0-8 pixels.
> +	 */
> +	u8 mso_pixel_overlap;
>  };
>=20
>  int drm_display_info_set_bus_formats(struct drm_display_info *info, diff=
 --git
> a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h index
> 79771091771a..7ffbd9f7bfc7 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -23,9 +23,12 @@
>  #define DRM_DISPLAYID_H
>=20
>  #include <linux/types.h>
> +#include <linux/bits.h>
>=20
>  struct edid;
>=20
> +#define VESA_IEEE_OUI				0x3a0292
> +
>  /* DisplayID Structure versions */
>  #define DISPLAY_ID_STRUCTURE_VER_12		0x12
>  #define DISPLAY_ID_STRUCTURE_VER_20		0x20
> @@ -126,6 +129,16 @@ struct displayid_detailed_timing_block {
>  	struct displayid_detailed_timings_1 timings[];  };
>=20
> +#define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
> +#define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
> +
> +struct displayid_vesa_vendor_specific_block {
> +	struct displayid_block base;
> +	u8 oui[3];
> +	u8 data_structure_type;
> +	u8 mso;
> +} __packed;
> +
>  /* DisplayID iteration */
>  struct displayid_iter {
>  	const struct edid *edid;
> --
> 2.30.2

