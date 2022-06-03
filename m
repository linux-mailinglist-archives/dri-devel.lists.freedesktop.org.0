Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C674553CDEA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 19:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ECC1138ED;
	Fri,  3 Jun 2022 17:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB253112072;
 Fri,  3 Jun 2022 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654276432; x=1685812432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DkFHuG3v9/ZzHiPlXux73uUpYW2NHRrn7Edjy4vHP/g=;
 b=TfQZ2B0OTKbmuzy6lFEBAzjCCNPtIJ29nlCmQr/3jzDW2wWfetQMfhuF
 SApwG8vsYI1BoNA3eLHjnB7tEAOkVNkS3hLRMelr2nVTX7MLh3o6/6Kdp
 IZ1+7IA639UB/MmsnX2mmPqA49miElCROf34NA4xnWXjgJSaSRMpU36H7
 81rBgQg021tieWsjVVCYY9id3vEpqaWhvbg9CaOmJvvMmWjQgbBMyrGsO
 UgE694V0Z/HCapsLlI3JbYDd7pw8TKkRNXjKvRBGel5Xsl36CfaHEOkEx
 OCUTRanBgLo04v5Ig2Sc97bSIudX8rdxGNwsMvXRRweLzAfJPZaThST+d g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="263956957"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="263956957"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 10:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="668531090"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by FMSMGA003.fm.intel.com with SMTP; 03 Jun 2022 10:13:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Jun 2022 20:13:48 +0300
Date: Fri, 3 Jun 2022 20:13:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 11/13] drm/edid: add HF-EEODB support to EDID read and
 allocation
Message-ID: <YppBTAFXSNgaoymG@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
 <7451127fb889f9d2ed723a6d83e033d6a5196354.1653381821.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7451127fb889f9d2ed723a6d83e033d6a5196354.1653381821.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 24, 2022 at 01:39:33PM +0300, Jani Nikula wrote:
> HDMI 2.1 section 10.3.6 defines an HDMI Forum EDID Extension Override
> Data Block, which may contain a different extension count than the base
> block claims. Add support for reading more EDID data if available. The
> extra blocks aren't parsed yet, though.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 81 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 78 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 5e0a91da565e..ba0c880dc133 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1581,6 +1581,15 @@ static bool version_greater(const struct drm_edid *drm_edid,
>  		(edid->version == version && edid->revision > revision);
>  }
>  
> +static int edid_hfeeodb_extension_block_count(const struct edid *edid);
> +
> +static int edid_hfeeodb_block_count(const struct edid *edid)
> +{
> +	int eeodb = edid_hfeeodb_extension_block_count(edid);
> +
> +	return eeodb ? eeodb + 1 : 0;
> +}
> +
>  static int edid_extension_block_count(const struct edid *edid)
>  {
>  	return edid->extensions;
> @@ -2026,6 +2035,11 @@ static struct edid *edid_filter_invalid_blocks(struct edid *edid,
>  	struct edid *new;
>  	int i, valid_blocks = 0;
>  
> +	/*
> +	 * Note: If the EDID uses HF-EEODB, but has invalid blocks, we'll revert
> +	 * back to regular extension count here. We don't want to start
> +	 * modifying the HF-EEODB extension too.
> +	 */
>  	for (i = 0; i < edid_block_count(edid); i++) {
>  		const void *src_block = edid_block_data(edid, i);
>  
> @@ -2235,7 +2249,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  				     size_t *size)
>  {
>  	enum edid_block_status status;
> -	int i, invalid_blocks = 0;
> +	int i, num_blocks, invalid_blocks = 0;
>  	struct edid *edid, *new;
>  	size_t alloc_size = EDID_LENGTH;
>  
> @@ -2277,7 +2291,8 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  		goto fail;
>  	edid = new;
>  
> -	for (i = 1; i < edid_block_count(edid); i++) {
> +	num_blocks = edid_block_count(edid);
> +	for (i = 1; i < num_blocks; i++) {
>  		void *block = (void *)edid_block_data(edid, i);
>  
>  		status = edid_block_read(block, i, read_block, context);
> @@ -2288,11 +2303,31 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  			if (status == EDID_BLOCK_READ_FAIL)
>  				goto fail;
>  			invalid_blocks++;
> +		} else if (i == 1) {
> +			/*
> +			 * If the first EDID extension is a CTA extension, and
> +			 * the first Data Block is HF-EEODB, override the
> +			 * extension block count.
> +			 *
> +			 * Note: HF-EEODB could specify a smaller extension
> +			 * count too, but we can't risk allocating a smaller
> +			 * amount.
> +			 */
> +			int eeodb = edid_hfeeodb_block_count(edid);
> +
> +			if (eeodb > num_blocks) {
> +				num_blocks = eeodb;
> +				alloc_size = edid_size_by_blocks(num_blocks);
> +				new = krealloc(edid, alloc_size, GFP_KERNEL);
> +				if (!new)
> +					goto fail;
> +				edid = new;
> +			}
>  		}
>  	}
>  
>  	if (invalid_blocks) {
> -		connector_bad_edid(connector, edid, edid_block_count(edid));
> +		connector_bad_edid(connector, edid, num_blocks);
>  
>  		edid = edid_filter_invalid_blocks(edid, &alloc_size);
>  	}
> @@ -3825,6 +3860,7 @@ static int add_detailed_modes(struct drm_connector *connector,
>  #define CTA_EXT_DB_HDR_STATIC_METADATA	6
>  #define CTA_EXT_DB_420_VIDEO_DATA	14
>  #define CTA_EXT_DB_420_VIDEO_CAP_MAP	15
> +#define CTA_EXT_DB_HF_EEODB		0x78
>  #define CTA_EXT_DB_HF_SCDB		0x79
>  
>  #define EDID_BASIC_AUDIO	(1 << 6)
> @@ -4868,6 +4904,12 @@ static bool cea_db_is_hdmi_forum_vsdb(const struct cea_db *db)
>  		cea_db_payload_len(db) >= 7;
>  }
>  
> +static bool cea_db_is_hdmi_forum_eeodb(const void *db)
> +{
> +	return cea_db_is_extended_tag(db, CTA_EXT_DB_HF_EEODB) &&
> +		cea_db_payload_len(db) >= 2;
> +}
> +
>  static bool cea_db_is_microsoft_vsdb(const struct cea_db *db)
>  {
>  	return cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
> @@ -4902,6 +4944,39 @@ static bool cea_db_is_hdmi_hdr_metadata_block(const struct cea_db *db)
>  		cea_db_payload_len(db) >= 3;
>  }
>  
> +/*
> + * Get the HF-EEODB override extension block count from EDID.
> + *
> + * The passed in EDID may be partially read, as long as it has at least two
> + * blocks (base block and one extension block) if EDID extension count is > 0.
> + *
> + * References:
> + * - HDMI 2.1 section 10.3.6 HDMI Forum EDID Extension Override Data Block
> + */
> +static int edid_hfeeodb_extension_block_count(const struct edid *edid)
> +{
> +	const u8 *cta;
> +
> +	/* No extensions according to base block, no HF-EEODB. */
> +	if (!edid_extension_block_count(edid))
> +		return 0;
> +
> +	/* HF-EEODB is always in the first EDID extension block only */
> +	cta = edid_extension_block_data(edid, 0);
> +	if (edid_block_tag(cta) != CEA_EXT || cea_revision(cta) < 3)
> +		return 0;
> +
> +	/*
> +	 * Sinks that include the HF-EEODB in their E-EDID shall include one and
> +	 * only one instance of the HF-EEODB in the E-EDID, occupying bytes 4
> +	 * through 6 of Block 1 of the E-EDID.
> +	 */
> +	if (!cea_db_is_hdmi_forum_eeodb(&cta[4]))
> +		return 0;

Still not a big fan of these hardcoded things. Not sure if there's any
easy way to just use the normal iterators at this point when we don't
really know the full composition of the EDID yet. If not then I guess
we'll have to use some hardcoded stuff. What we definitely seem to be
missing here are size checks, for both the whoe data block collection,
and the specific data block payload.

> +
> +	return cta[4 + 2];
> +}
> +
>  static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>  				      const u8 *db)
>  {
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
