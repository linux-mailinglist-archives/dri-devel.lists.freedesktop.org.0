Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1740883F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 11:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365B6E141;
	Mon, 13 Sep 2021 09:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BADB6E140;
 Mon, 13 Sep 2021 09:30:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221662044"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="221662044"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 02:30:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="543084139"
Received: from elinares-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.33.216])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 02:30:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Shankar\, Uma" <uma.shankar@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala\@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 4/6] drm/edid: parse the DisplayID v2.0 VESA vendor
 block for MSO
In-Reply-To: <264db723a9c34755bd8c2a052e3e5bf6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1630419362.git.jani.nikula@intel.com>
 <73ca2887e7b37880690f5c9ba4594c9cd1170669.1630419362.git.jani.nikula@intel.com>
 <264db723a9c34755bd8c2a052e3e5bf6@intel.com>
Date: Mon, 13 Sep 2021 12:30:19 +0300
Message-ID: <87wnnk3jro.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Sep 2021, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Jani Nikula
>> Sent: Tuesday, August 31, 2021 7:48 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; ville.syrjala@linux.intel.com; Nikula, Jani
>> <jani.nikula@intel.com>
>> Subject: [PATCH v2 4/6] drm/edid: parse the DisplayID v2.0 VESA vendor block for
>> MSO
>> 
>> The VESA Organization Vendor-Specific Data Block, defined in VESA DisplayID
>> Standard v2.0, specifies the eDP Multi-SST Operation (MSO) stream count and
>> segment pixel overlap.
>> 
>> DisplayID v1.3 has Appendix B: DisplayID as an EDID Extension, describing how
>> DisplayID sections may be embedded in EDID extension blocks. DisplayID v2.0 does
>> not have such a section, perhaps implying that DisplayID v2.0 data should not be
>> included in EDID extensions, but rather in a "pure" DisplayID structure at its own DDC
>> address pair A4h/A5h, as described in VESA E-DDC Standard v1.3 chapter 3.
>> 
>> However, in practice, displays out in the field have embedded DisplayID
>> v2.0 data blocks in EDID extensions, including, in particular, some eDP MSO displays,
>> where a pure DisplayID structure is not available at all.
>> 
>> Parse the MSO data from the DisplayID data block. Do it as part of
>> drm_add_display_info(), extending it to parse also DisplayID data to avoid requiring
>> extra calls to update the information.
>> 
>> v2: Check for VESA OUI (Ville)
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c  | 72 +++++++++++++++++++++++++++++++++++++
>>  include/drm/drm_connector.h | 12 +++++++  include/drm/drm_displayid.h | 13
>> +++++++
>>  3 files changed, 97 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index
>> 92974b1478bc..c45c225267ca 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -28,6 +28,7 @@
>>   * DEALINGS IN THE SOFTWARE.
>>   */
>> 
>> +#include <linux/bitfield.h>
>>  #include <linux/hdmi.h>
>>  #include <linux/i2c.h>
>>  #include <linux/kernel.h>
>> @@ -5145,6 +5146,71 @@ void drm_get_monitor_range(struct drm_connector
>> *connector,
>>  		      info->monitor_range.max_vfreq);  }
>> 
>> +static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>> +				    const struct displayid_block *block) {
>> +	struct displayid_vesa_vendor_specific_block *vesa =
>> +		(struct displayid_vesa_vendor_specific_block *)block;
>> +	struct drm_display_info *info = &connector->display_info;
>> +
>> +	if (block->num_bytes < 3) {
>> +		drm_dbg_kms(connector->dev, "Unexpected vendor block size
>> %u\n",
>> +			    block->num_bytes);
>> +		return;
>> +	}
>> +
>> +	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>> +		return;
>> +
>> +	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
>> +		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block
>> size\n");
>> +		return;
>> +	}
>> +
>> +	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
>> +	default:
>> +		drm_dbg_kms(connector->dev, "Reserved MSO mode value\n");
>> +		fallthrough;
>> +	case 0:
>> +		info->mso_stream_count = 0;
>> +		break;
>> +	case 1:
>> +		info->mso_stream_count = 2; /* 2 or 4 links */
>> +		break;
>> +	case 2:
>> +		info->mso_stream_count = 4; /* 4 links */
>> +		break;
>> +	}
>> +
>> +	if (!info->mso_stream_count) {
>> +		info->mso_pixel_overlap = 0;
>> +		return;
>> +	}
>> +
>> +	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP,
>> vesa->mso);
>> +	if (info->mso_pixel_overlap > 8) {
>> +		drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value
>> %u\n",
>> +			    info->mso_pixel_overlap);
>> +		info->mso_pixel_overlap = 8;
>
> Going beyond 8 is not right from a vendor perspective as it goes into reserved region.
> Should we not just set to 0 or how we decide that we fixed overlap at 8. It seems an
> undefined operation and it may vary from sink to sink.

I don't know if there's a right choice here. I don't mind setting it to
0 if you prefer that.

BR,
Jani.


>
> Regards,
> Uma Shankar
>
>> +	}
>> +
>> +	drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
>> +		    info->mso_stream_count, info->mso_pixel_overlap); }
>> +
>> +static void drm_update_mso(struct drm_connector *connector, const
>> +struct edid *edid) {
>> +	const struct displayid_block *block;
>> +	struct displayid_iter iter;
>> +
>> +	displayid_iter_edid_begin(edid, &iter);
>> +	displayid_iter_for_each(block, &iter) {
>> +		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
>> +			drm_parse_vesa_mso_data(connector, block);
>> +	}
>> +	displayid_iter_end(&iter);
>> +}
>> +
>>  /* A connector has no EDID information, so we've got no EDID to compute quirks
>> from. Reset
>>   * all of the values which would have been set from EDID
>>   */
>> @@ -5168,6 +5234,9 @@ drm_reset_display_info(struct drm_connector
>> *connector)
>> 
>>  	info->non_desktop = 0;
>>  	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
>> +
>> +	info->mso_stream_count = 0;
>> +	info->mso_pixel_overlap = 0;
>>  }
>> 
>>  u32 drm_add_display_info(struct drm_connector *connector, const struct edid
>> *edid) @@ -5246,6 +5315,9 @@ u32 drm_add_display_info(struct drm_connector
>> *connector, const struct edid *edi
>>  		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
>>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>>  		info->color_formats |= DRM_COLOR_FORMAT_YCRCB422;
>> +
>> +	drm_update_mso(connector, edid);
>> +
>>  	return quirks;
>>  }
>> 
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h index
>> 79fa34e5ccdb..379746d3266f 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -590,6 +590,18 @@ struct drm_display_info {
>>  	 * @monitor_range: Frequency range supported by monitor range descriptor
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
>> 
>>  int drm_display_info_set_bus_formats(struct drm_display_info *info, diff --git
>> a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h index
>> 79771091771a..7ffbd9f7bfc7 100644
>> --- a/include/drm/drm_displayid.h
>> +++ b/include/drm/drm_displayid.h
>> @@ -23,9 +23,12 @@
>>  #define DRM_DISPLAYID_H
>> 
>>  #include <linux/types.h>
>> +#include <linux/bits.h>
>> 
>>  struct edid;
>> 
>> +#define VESA_IEEE_OUI				0x3a0292
>> +
>>  /* DisplayID Structure versions */
>>  #define DISPLAY_ID_STRUCTURE_VER_12		0x12
>>  #define DISPLAY_ID_STRUCTURE_VER_20		0x20
>> @@ -126,6 +129,16 @@ struct displayid_detailed_timing_block {
>>  	struct displayid_detailed_timings_1 timings[];  };
>> 
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
>> --
>> 2.30.2
>

-- 
Jani Nikula, Intel Open Source Graphics Center
