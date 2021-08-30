Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14A3FB8CF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 17:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACC9892B7;
	Mon, 30 Aug 2021 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400E889138;
 Mon, 30 Aug 2021 15:11:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="240528934"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="240528934"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 08:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="445756975"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 30 Aug 2021 08:10:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 30 Aug 2021 18:10:58 +0300
Date: Mon, 30 Aug 2021 18:10:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/edid: parse the DisplayID v2.0 VESA vendor block
 for MSO
Message-ID: <YSz1AhsVUc7m3Ng7@intel.com>
References: <cover.1630319138.git.jani.nikula@intel.com>
 <09f57d55813f916578d1dd1e28bee3a621068bdd.1630319138.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09f57d55813f916578d1dd1e28bee3a621068bdd.1630319138.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 30, 2021 at 01:29:01PM +0300, Jani Nikula wrote:
> The VESA Organization Vendor-Specific Data Block, defined in VESA
> DisplayID Standard v2.0, specifies the eDP Multi-SST Operation (MSO)
> stream count and segment pixel overlap.
> 
> DisplayID v1.3 has Appendix B: DisplayID as an EDID Extension,
> describing how DisplayID sections may be embedded in EDID extension
> blocks. DisplayID v2.0 does not have such a section, perhaps implying
> that DisplayID v2.0 data should not be included in EDID extensions, but
> rather in a "pure" DisplayID structure at its own DDC address pair
> A4h/A5h, as described in VESA E-DDC Standard v1.3 chapter 3.
> 
> However, in practice, displays out in the field have embedded DisplayID
> v2.0 data blocks in EDID extensions, including, in particular, some eDP
> MSO displays, where a pure DisplayID structure is not available at all.
> 
> Parse the MSO data from the DisplayID data block. Do it as part of
> drm_add_display_info(), extending it to parse also DisplayID data to
> avoid requiring extra calls to update the information.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c  | 63 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h | 12 +++++++
>  include/drm/drm_displayid.h | 11 +++++++
>  3 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6325877c5fd6..7e8083068f3f 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -28,6 +28,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/hdmi.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> @@ -5148,6 +5149,62 @@ void drm_get_monitor_range(struct drm_connector *connector,
>  		      info->monitor_range.max_vfreq);
>  }
>  
> +static void drm_parse_vesa_mso_data(struct drm_connector *connector,
> +				    const struct displayid_block *block)
> +{
> +	struct displayid_vesa_vendor_specific_block *vesa =
> +		(struct displayid_vesa_vendor_specific_block *)block;
> +	struct drm_display_info *info = &connector->display_info;
> +
> +	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
> +		drm_dbg_kms(connector->dev, "Unexpected VESA vendor block size\n");
> +		return;
> +	}
> +
> +	switch (FIELD_GET(DISPLAYID_VESA_MSO_MODE, vesa->mso)) {
> +	default:
> +		drm_dbg_kms(connector->dev, "Reserved MSO mode value\n");
> +		fallthrough;
> +	case 0:
> +		info->mso_stream_count = 0;
> +		break;
> +	case 1:
> +		info->mso_stream_count = 2; /* 2 or 4 links */
> +		break;
> +	case 2:
> +		info->mso_stream_count = 4; /* 4 links */
> +		break;
> +	}
> +
> +	if (!info->mso_stream_count) {
> +		info->mso_pixel_overlap = 0;
> +		return;
> +	}
> +
> +	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> +	if (info->mso_pixel_overlap > 8) {
> +		drm_dbg_kms(connector->dev, "Reserved MSO pixel overlap value %u\n",
> +			    info->mso_pixel_overlap);
> +		info->mso_pixel_overlap = 8;
> +	}
> +
> +	drm_dbg_kms(connector->dev, "MSO stream count %u, pixel overlap %u\n",
> +		    info->mso_stream_count, info->mso_pixel_overlap);
> +}
> +
> +static void drm_update_mso(struct drm_connector *connector, const struct edid *edid)
> +{
> +	const struct displayid_block *block;
> +	struct displayid_iter iter;
> +
> +	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_for_each(block, &iter) {
> +		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)

Don't we need to check the OUI to make sure the block is the right
type? I don't have the v2 spec at hand atm, but I presume a vendor
specific block could contain all kinds of different things?

> +			drm_parse_vesa_mso_data(connector, block);
> +	}
> +	displayid_iter_end(&iter);
> +}
> +
>  /* A connector has no EDID information, so we've got no EDID to compute quirks from. Reset
>   * all of the values which would have been set from EDID
>   */
> @@ -5171,6 +5228,9 @@ drm_reset_display_info(struct drm_connector *connector)
>  
>  	info->non_desktop = 0;
>  	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
> +
> +	info->mso_stream_count = 0;
> +	info->mso_pixel_overlap = 0;
>  }
>  
>  u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
> @@ -5249,6 +5309,9 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
>  		info->color_formats |= DRM_COLOR_FORMAT_YCRCB422;
> +
> +	drm_update_mso(connector, edid);
> +
>  	return quirks;
>  }
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 79fa34e5ccdb..379746d3266f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -590,6 +590,18 @@ struct drm_display_info {
>  	 * @monitor_range: Frequency range supported by monitor range descriptor
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
>  
>  int drm_display_info_set_bus_formats(struct drm_display_info *info,
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 79771091771a..b18611e016a2 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -23,6 +23,7 @@
>  #define DRM_DISPLAYID_H
>  
>  #include <linux/types.h>
> +#include <linux/bits.h>
>  
>  struct edid;
>  
> @@ -126,6 +127,16 @@ struct displayid_detailed_timing_block {
>  	struct displayid_detailed_timings_1 timings[];
>  };
>  
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
> 2.20.1

-- 
Ville Syrjälä
Intel
