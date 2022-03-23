Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409F4E501A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3537510E663;
	Wed, 23 Mar 2022 10:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6885510E65C;
 Wed, 23 Mar 2022 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648030338; x=1679566338;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4rSuxwZGT/Ny5zrbukTAmWBnBYxG9X0h5pQiCNwk47c=;
 b=gIPSatccgl8SPHtsY0Cc+5ZLXFE3jx114Nvqsht2xupqvH5EFe3osUiO
 1DQu0INYbDgOnBahnyx5bLbN91Z2MBcAcd4PTlLPUpYVjiARkw3FE0Nb2
 jXjh4M5wsxsa8ZdoITN/3s1bIedU9ADMPQcPRUvYqRqRPH37uX2MHRRAI
 wO6APS1q7EPkfBnCNaPVR4T2t9MWuROUzFBKa0lEL5GzdXLo9pGrT5+9B
 u/2JlF3qrvB+E/N9Ai4/SMHvDq66RW6DtvgfzAhq27oJ9Ojp/rc1Z2/VZ
 HW7DG9lKECiBAT4Km5ckFHOwUTYf04spf5LzSd6hK/jje7AE3QQssRNnp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="318783409"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="318783409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 03:11:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560832954"
Received: from caliyanx-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.57.47])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 03:11:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [v8 3/5] drm/edid: read HF-EEODB ext block
In-Reply-To: <20220317124202.14189-4-shawn.c.lee@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220317124202.14189-1-shawn.c.lee@intel.com>
 <20220317124202.14189-4-shawn.c.lee@intel.com>
Date: Wed, 23 Mar 2022 12:11:50 +0200
Message-ID: <8735j9j7vd.fsf@intel.com>
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
> According to HDMI 2.1 spec.
>
> "The HDMI Forum EDID Extension Override Data Block (HF-EEODB)
> is utilized by Sink Devices to provide an alternate method to
> indicate an EDID Extension Block count larger than 1, while
> avoiding the need to present a VESA Block Map in the first
> E-EDID Extension Block."
>
> It is a mandatory for HDMI 2.1 protocol compliance as well.
> This patch help to know how many HF_EEODB blocks report by sink
> and read allo HF_EEODB blocks back.

It still just boggles my mind that they've implemented something like
this. They cite avoiding the EDID Block Map as the rationale... but it's
been optional since E-EDID structure v1.4, published in 2006. 15+ years
ago.

Can anyone tell me a sane reason for this? What does it provide that
E-EDID 1.4 does not? Do they want to use E-EDID v1.3 with this? Why?

BR,
Jani.


>
> v2: support to find CEA block, check EEODB block format, and return
>     available block number in drm_edid_read_hf_eeodb_blk_count().
>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  8 +++-
>  drivers/gpu/drm/drm_edid.c      | 71 +++++++++++++++++++++++++++++++--
>  include/drm/drm_edid.h          |  2 +-
>  3 files changed, 74 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a50c82bc2b2f..16011023c12e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2129,7 +2129,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  				       const struct edid *edid)
>  {
>  	struct drm_device *dev = connector->dev;
> -	size_t size = 0;
> +	size_t size = 0, hf_eeodb_blk_count;
>  	int ret;
>  	const struct edid *old_edid;
>  
> @@ -2137,8 +2137,12 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  	if (connector->override_edid)
>  		return 0;
>  
> -	if (edid)
> +	if (edid) {
>  		size = EDID_LENGTH * (1 + edid->extensions);
> +		hf_eeodb_blk_count = drm_edid_read_hf_eeodb_blk_count(edid);
> +		if (hf_eeodb_blk_count)
> +			size = EDID_LENGTH * (1 + hf_eeodb_blk_count);
> +	}
>  
>  	/* Set the display info, using edid if available, otherwise
>  	 * resetting the values to defaults. This duplicates the work
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ef65dd97d700..890038758660 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1992,6 +1992,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  {
>  	int i, j = 0, valid_extensions = 0;
>  	u8 *edid, *new;
> +	size_t hf_eeodb_blk_count;
>  	struct edid *override;
>  
>  	override = drm_get_override_edid(connector);
> @@ -2051,7 +2052,35 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  		}
>  
>  		kfree(edid);
> +		return (struct edid *)new;
> +	}
> +
> +	hf_eeodb_blk_count = drm_edid_read_hf_eeodb_blk_count((struct edid *)edid);
> +	if (hf_eeodb_blk_count >= 2) {
> +		new = krealloc(edid, (hf_eeodb_blk_count + 1) * EDID_LENGTH, GFP_KERNEL);
> +		if (!new)
> +			goto out;
>  		edid = new;
> +
> +		valid_extensions = hf_eeodb_blk_count - 1;
> +		for (j = 2; j <= hf_eeodb_blk_count; j++) {
> +			u8 *block = edid + j * EDID_LENGTH;
> +
> +			for (i = 0; i < 4; i++) {
> +				if (get_edid_block(data, block, j, EDID_LENGTH))
> +					goto out;
> +				if (drm_edid_block_valid(block, j, false, NULL))
> +					break;
> +			}
> +
> +			if (i == 4)
> +				valid_extensions--;
> +		}
> +
> +		if (valid_extensions != hf_eeodb_blk_count - 1) {
> +			DRM_ERROR("Not able to retrieve proper EDID contain HF-EEODB data.\n");
> +			goto out;
> +		}
>  	}
>  
>  	return (struct edid *)edid;
> @@ -3315,15 +3344,17 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
>  #define VIDEO_BLOCK     0x02
>  #define VENDOR_BLOCK    0x03
>  #define SPEAKER_BLOCK	0x04
> -#define HDR_STATIC_METADATA_BLOCK	0x6
> -#define USE_EXTENDED_TAG 0x07
> -#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
> +#define EXT_VIDEO_CAPABILITY_BLOCK	0x00
> +#define HDR_STATIC_METADATA_BLOCK	0x06
> +#define USE_EXTENDED_TAG		0x07
>  #define EXT_VIDEO_DATA_BLOCK_420	0x0E
> -#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
> +#define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
> +#define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
>  #define EDID_BASIC_AUDIO	(1 << 6)
>  #define EDID_CEA_YCRCB444	(1 << 5)
>  #define EDID_CEA_YCRCB422	(1 << 4)
>  #define EDID_CEA_VCDB_QS	(1 << 6)
> +#define HF_EEODB_LENGTH		2
>  
>  /*
>   * Search EDID for CEA extension block.
> @@ -4273,9 +4304,41 @@ static bool cea_db_is_y420vdb(const u8 *db)
>  	return true;
>  }
>  
> +static bool cea_db_is_hdmi_forum_eeodb(const u8 *db)
> +{
> +	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (cea_db_payload_len(db) != HF_EEODB_LENGTH)
> +		return false;
> +
> +	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_EEODB_DATA_BLOCK)
> +		return false;
> +
> +	return true;
> +}
> +
>  #define for_each_cea_db(cea, i, start, end) \
>  	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
>  
> +size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid)
> +{
> +	const u8 *cea;
> +	int i, start, end, ext_index = 0;
> +
> +	if (edid->extensions) {
> +		cea = drm_find_cea_extension(edid, &ext_index);
> +
> +		if (cea && !cea_db_offsets(cea, &start, &end))
> +			for_each_cea_db(cea, i, start, end)
> +				if (cea_db_is_hdmi_forum_eeodb(&cea[i]))
> +					return cea[i + 2];
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_edid_read_hf_eeodb_blk_count);
> +
>  static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>  				      const u8 *db)
>  {
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..5549da7bd7be 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -592,6 +592,6 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  			      u8 video_code);
>  const u8 *drm_find_edid_extension(const struct edid *edid,
>  				  int ext_id, int *ext_index);
> -
> +size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid);
>  
>  #endif /* __DRM_EDID_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
