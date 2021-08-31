Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2728E3FC396
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 10:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6371089C51;
	Tue, 31 Aug 2021 08:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F7689C51;
 Tue, 31 Aug 2021 08:10:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="218434690"
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; d="scan'208";a="218434690"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 01:10:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; d="scan'208";a="498182662"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 01:10:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/edid: parse the DisplayID v2.0 VESA vendor block
 for MSO
In-Reply-To: <YSz1AhsVUc7m3Ng7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1630319138.git.jani.nikula@intel.com>
 <09f57d55813f916578d1dd1e28bee3a621068bdd.1630319138.git.jani.nikula@intel.com>
 <YSz1AhsVUc7m3Ng7@intel.com>
Date: Tue, 31 Aug 2021 11:10:53 +0300
Message-ID: <87wno2avaq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 30 Aug 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Aug 30, 2021 at 01:29:01PM +0300, Jani Nikula wrote:
>> The VESA Organization Vendor-Specific Data Block, defined in VESA
>> DisplayID Standard v2.0, specifies the eDP Multi-SST Operation (MSO)
>> stream count and segment pixel overlap.
>>=20
>> DisplayID v1.3 has Appendix B: DisplayID as an EDID Extension,
>> describing how DisplayID sections may be embedded in EDID extension
>> blocks. DisplayID v2.0 does not have such a section, perhaps implying
>> that DisplayID v2.0 data should not be included in EDID extensions, but
>> rather in a "pure" DisplayID structure at its own DDC address pair
>> A4h/A5h, as described in VESA E-DDC Standard v1.3 chapter 3.
>>=20
>> However, in practice, displays out in the field have embedded DisplayID
>> v2.0 data blocks in EDID extensions, including, in particular, some eDP
>> MSO displays, where a pure DisplayID structure is not available at all.
>>=20
>> Parse the MSO data from the DisplayID data block. Do it as part of
>> drm_add_display_info(), extending it to parse also DisplayID data to
>> avoid requiring extra calls to update the information.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c  | 63 +++++++++++++++++++++++++++++++++++++
>>  include/drm/drm_connector.h | 12 +++++++
>>  include/drm/drm_displayid.h | 11 +++++++
>>  3 files changed, 86 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 6325877c5fd6..7e8083068f3f 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -28,6 +28,7 @@
>>   * DEALINGS IN THE SOFTWARE.
>>   */
>>=20=20
>> +#include <linux/bitfield.h>
>>  #include <linux/hdmi.h>
>>  #include <linux/i2c.h>
>>  #include <linux/kernel.h>
>> @@ -5148,6 +5149,62 @@ void drm_get_monitor_range(struct drm_connector *=
connector,
>>  		      info->monitor_range.max_vfreq);
>>  }
>>=20=20
>> +static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>> +				    const struct displayid_block *block)
>> +{
>> +	struct displayid_vesa_vendor_specific_block *vesa =3D
>> +		(struct displayid_vesa_vendor_specific_block *)block;
>> +	struct drm_display_info *info =3D &connector->display_info;
>> +
>> +	if (sizeof(*vesa) !=3D sizeof(*block) + block->num_bytes) {
>> +		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block size\n");
>> +		return;
>> +	}
>> +
>> +	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
>> +	default:
>> +		drm_dbg_kms(connector->dev, "Reserved MSO mode value\n");
>> +		fallthrough;
>> +	case 0:
>> +		info->mso_stream_count =3D 0;
>> +		break;
>> +	case 1:
>> +		info->mso_stream_count =3D 2; /* 2 or 4 links */
>> +		break;
>> +	case 2:
>> +		info->mso_stream_count =3D 4; /* 4 links */
>> +		break;
>> +	}
>> +
>> +	if (!info->mso_stream_count) {
>> +		info->mso_pixel_overlap =3D 0;
>> +		return;
>> +	}
>> +
>> +	info->mso_pixel_overlap =3D FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa=
->mso);
>> +	if (info->mso_pixel_overlap > 8) {
>> +		drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value %u\n",
>> +			    info->mso_pixel_overlap);
>> +		info->mso_pixel_overlap =3D 8;
>> +	}
>> +
>> +	drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
>> +		    info->mso_stream_count, info->mso_pixel_overlap);
>> +}
>> +
>> +static void drm_update_mso(struct drm_connector *connector, const struc=
t edid *edid)
>> +{
>> +	const struct displayid_block *block;
>> +	struct displayid_iter iter;
>> +
>> +	displayid_iter_edid_begin(edid, &iter);
>> +	displayid_iter_for_each(block, &iter) {
>> +		if (block->tag =3D=3D DATA_BLOCK_2_VENDOR_SPECIFIC)
>
> Don't we need to check the OUI to make sure the block is the right
> type? I don't have the v2 spec at hand atm, but I presume a vendor
> specific block could contain all kinds of different things?

You're right.

BR,
Jani.

>
>> +			drm_parse_vesa_mso_data(connector, block);
>> +	}
>> +	displayid_iter_end(&iter);
>> +}
>> +
>>  /* A connector has no EDID information, so we've got no EDID to compute=
 quirks from. Reset
>>   * all of the values which would have been set from EDID
>>   */
>> @@ -5171,6 +5228,9 @@ drm_reset_display_info(struct drm_connector *conne=
ctor)
>>=20=20
>>  	info->non_desktop =3D 0;
>>  	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
>> +
>> +	info->mso_stream_count =3D 0;
>> +	info->mso_pixel_overlap =3D 0;
>>  }
>>=20=20
>>  u32 drm_add_display_info(struct drm_connector *connector, const struct =
edid *edid)
>> @@ -5249,6 +5309,9 @@ u32 drm_add_display_info(struct drm_connector *con=
nector, const struct edid *edi
>>  		info->color_formats |=3D DRM_COLOR_FORMAT_YCRCB444;
>>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>>  		info->color_formats |=3D DRM_COLOR_FORMAT_YCRCB422;
>> +
>> +	drm_update_mso(connector, edid);
>> +
>>  	return quirks;
>>  }
>>=20=20
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 79fa34e5ccdb..379746d3266f 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -590,6 +590,18 @@ struct drm_display_info {
>>  	 * @monitor_range: Frequency range supported by monitor range descript=
or
>>  	 */
>>  	struct drm_monitor_range_info monitor_range;
>> +
>> +	/**
>> +	 * @mso_stream_count: eDP Multi-SST Operation (MSO) stream count from
>> +	 * the DisplayID VESA vendor block. 0 for conventional Single-Stream
>> +	 * Transport (SST), or 2 or 4 MSO streams.
>> +	 */
>> +	u8 mso_stream_count;
>> +
>> +	/**
>> +	 * @mso_pixel_overlap: eDP MSO segment pixel overlap, 0-8 pixels.
>> +	 */
>> +	u8 mso_pixel_overlap;
>>  };
>>=20=20
>>  int drm_display_info_set_bus_formats(struct drm_display_info *info,
>> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
>> index 79771091771a..b18611e016a2 100644
>> --- a/include/drm/drm_displayid.h
>> +++ b/include/drm/drm_displayid.h
>> @@ -23,6 +23,7 @@
>>  #define DRM_DISPLAYID_H
>>=20=20
>>  #include <linux/types.h>
>> +#include <linux/bits.h>
>>=20=20
>>  struct edid;
>>=20=20
>> @@ -126,6 +127,16 @@ struct displayid_detailed_timing_block {
>>  	struct displayid_detailed_timings_1 timings[];
>>  };
>>=20=20
>> +#define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>> +#define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
>> +
>> +struct displayid_vesa_vendor_specific_block {
>> +	struct displayid_block base;
>> +	u8 oui[3];
>> +	u8 data_structure_type;
>> +	u8 mso;
>> +} __packed;
>> +
>>  /* DisplayID iteration */
>>  struct displayid_iter {
>>  	const struct edid *edid;
>> --=20
>> 2.20.1

--=20
Jani Nikula, Intel Open Source Graphics Center
