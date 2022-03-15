Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAEB4D99E4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 12:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B5C10E352;
	Tue, 15 Mar 2022 11:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B88A10E343;
 Tue, 15 Mar 2022 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647342205; x=1678878205;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Uqo2APHOgPCKOY3O397vCvshaEwUBO4/a66Vc1IJS3U=;
 b=LdeTAZFQP+wBMvIMfxjuwaQFp6VgMNZwak2I+lRpyUe/KnYaxf40NpPp
 KRpkbES0GTktZTivz88VuheRu5JIdMPYZGxLZ7U/HDwhCqgGire3dNuGe
 4amHYrXFQq3TbapyCUHysuEj0DKSMxpgBC90h5XqR7YBnkDdhnVFp9pgX
 HIjtWcFrBPgTHNu5FrPm8igEwwAdBY3jHnn/1VWEqRrbQI5ruTn/j6xLj
 sxvxhZVtJDVPN/SXTtwxzi3Cj/rRaBvZaImGv5wi/MlytodhiBLcBWxgz
 s6qSLuWHrh+6/TVtU8hy251QhXaiecO5ydXMOac6b7s/eUw6cmvTFji5h A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236217115"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="236217115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 04:03:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="556874399"
Received: from cgrilli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.234])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 04:03:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [v7 3/5] drm/edid: read HF-EEODB ext block
In-Reply-To: <20220313134702.24175-4-shawn.c.lee@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220313134702.24175-1-shawn.c.lee@intel.com>
 <20220313134702.24175-4-shawn.c.lee@intel.com>
Date: Tue, 15 Mar 2022 13:03:19 +0200
Message-ID: <87y21btr48.fsf@intel.com>
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
Cc: Drew Davenport <ddavenport@chromium.org>, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 13 Mar 2022, Lee Shawn C <shawn.c.lee@intel.com> wrote:
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
>
> v2: support to find CEA block, check EEODB block format, and return
>     available block number in drm_edid_read_hf_eeodb_blk_count().
>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Drew Davenport <ddavenport@chromium.org>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  8 +++-
>  drivers/gpu/drm/drm_edid.c      | 71 +++++++++++++++++++++++++++++++--
>  include/drm/drm_edid.h          |  1 +
>  3 files changed, 74 insertions(+), 6 deletions(-)
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

This approach does not scale. If the number of extensions and thus the
total EDID size depend on HF-EEODB, this *must* be abstracted.

Consider, for example, drm_edid_duplicate(), which only looks at
edid->extensions. A subsequent HF-EEODB aware access on an EDID
duplicated using drm_edid_duplicate() will access beyond the allocated
buffer.

Yes, it's a lot of work to introduce drm_edid_size() and
drm_edid_extension_count() or similar, and use them everywhere, but this
is what we must do. It's a lot more work to try to take HF-EEODB into
account everywhere. The latter is going to be riddled with bugs with
everyone doing it a little different.

> +	}
>  
>  	/* Set the display info, using edid if available, otherwise
>  	 * resetting the values to defaults. This duplicates the work
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 9fa84881fbba..5ae4e83fa5e3 100644
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
> @@ -4274,9 +4305,41 @@ static bool cea_db_is_y420vdb(const u8 *db)
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
> +	int i, start, end, cea_ext_index = 0, displayid_ext_index = 0;
> +
> +	if (edid->extensions) {
> +		cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
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

This should be static and not exported.

BR,
Jani.

> +
>  static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>  				      const u8 *db)
>  {
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..585f0ed932d4 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -593,5 +593,6 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  const u8 *drm_find_edid_extension(const struct edid *edid,
>  				  int ext_id, int *ext_index);
>  
> +size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid);
>  
>  #endif /* __DRM_EDID_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
