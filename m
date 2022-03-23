Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F69D4E5629
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A224710E723;
	Wed, 23 Mar 2022 16:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5F10E723;
 Wed, 23 Mar 2022 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648052254; x=1679588254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f7NseM3K4UVJHH5Y2OXcLrmoOrpaVC5lbAOQ7Q3BN6o=;
 b=fqtyJjWTqz2rQsh9QRT7+mBMHzy3gab5YGcPtFfddzW9v/myeI0ECi09
 +6qvjR0Zxjxb7S0DIPv9vhpOgbi0GjMzvHrHr4QOFhQzirLJMJ64SeCPM
 mXqEaikJ8H4Oj4K2KkaAgy/fkdsak3cJwzXZ13RsJulSLYJcoVuAVccLQ
 uhAnLxPT3xsZ1mbOwoxaNirkgiOZab3PLDK3kCFeOuycD6GJPE8F1mrqz
 xnAFfHZFe1v5Z/FedHUGSHsSiI/gwjsV4uBa2O3O7pA/vZ6Ufvmfbemlm
 qzyr+APW6ml7nmX1/r/VwELuKMKjnf65M33yfXlBmTt1C5Dh7cYNVT7bS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238758654"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="238758654"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 09:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="544250824"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga007.jf.intel.com with SMTP; 23 Mar 2022 09:05:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 18:05:19 +0200
Date: Wed, 23 Mar 2022 18:05:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC 05/19] drm/edid: add iterator for CEA data blocks
Message-ID: <YjtFP3oWa2HyqlS5@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
 <6da67bfcb883daf80910a49dbc1bd112ca51345d.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6da67bfcb883daf80910a49dbc1bd112ca51345d.1647985054.git.jani.nikula@intel.com>
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

On Tue, Mar 22, 2022 at 11:40:34PM +0200, Jani Nikula wrote:
> Add an iterator for CEA Data Blocks across CEA extensions and CTA
> DisplayID Data Blocks.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 198 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 186 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 31d132fcd0ca..c12c3cbab274 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4196,24 +4196,12 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
>  	return modes;
>  }
>  
> -static int
> -cea_db_payload_len(const u8 *db)
> -{
> -	return db[0] & 0x1f;
> -}
> -
>  static int
>  cea_db_extended_tag(const u8 *db)
>  {
>  	return db[1];
>  }
>  
> -static int
> -cea_db_tag(const u8 *db)
> -{
> -	return db[0] >> 5;
> -}
> -
>  static int
>  cea_revision(const u8 *cea)
>  {
> @@ -4269,6 +4257,192 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
>  	return 0;
>  }
>  
> +/*
> + * CEA Data Block iterator.
> + *
> + * Iterate through all CEA Data Blocks in both EDID CEA extensions and CTA Data
> + * Blocks in DisplayID extension blocks.
> + *
> + * struct cea_db *db:
> + * struct cea_db_iter iter;
> + *
> + * cea_db_iter_edid_begin(edid, &iter);
> + * cea_db_iter_for_each(db, &iter) {
> + *         // do stuff with db
> + * }
> + * cea_db_iter_end(&iter);
> + */
> +struct cea_db_iter {
> +	struct drm_edid_iter edid_iter;
> +	struct displayid_iter displayid_iter;
> +
> +	/* Current Data Block Collection. */
> +	const u8 *collection;
> +
> +	/* Current Data Block index in current collection. */
> +	int index;
> +
> +	/* End index in current collection. */
> +	int end;
> +};
> +
> +/* CEA-861-F section 7.5 CEA Extension Version 3 and Table 43 */
> +struct cea_db {
> +	u8 tag_length;
> +	u8 data[];
> +} __packed;
> +
> +static int cea_db_tag(const void *_db)
> +{
> +	/* FIXME: Transition to passing struct cea_db * everywhere. */
> +	const struct cea_db *db = _db;
> +
> +	return db->tag_length >> 5;
> +}
> +
> +static int cea_db_payload_len(const void *_db)
> +{
> +	/* FIXME: Transition to passing struct cea_db * everywhere. */
> +	const struct cea_db *db = _db;
> +
> +	return db->tag_length & 0x1f;
> +}
> +
> +static const void *cea_db_data(const struct cea_db *db)
> +{
> +	return db->data;
> +}
> +
> +static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
> +{
> +	memset(iter, 0, sizeof(*iter));
> +
> +	drm_edid_iter_begin(edid, &iter->edid_iter);
> +	displayid_iter_edid_begin(edid, &iter->displayid_iter);
> +}
> +
> +static const struct cea_db *
> +__cea_db_iter_current_block(const struct cea_db_iter *iter)
> +{
> +	const struct cea_db *db;
> +
> +	if (!iter->collection)
> +		return NULL;
> +
> +	db = (const struct cea_db *)&iter->collection[iter->index];
> +
> +	if (iter->index + sizeof(*db) <= iter->end &&
> +	    iter->index + sizeof(*db) + cea_db_payload_len(db) <= iter->end)
> +		return db;
> +
> +	return NULL;
> +}
> +
> +/*
> + * References:
> + * - VESA E-EDID v1.4
> + * - CEA-861-F section 7.5 CEA Extension Version 3
> + */
> +static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
> +{
> +	const u8 *ext;
> +
> +	drm_edid_iter_for_each(ext, &iter->edid_iter) {
> +		/* Only support CEA extension revision 3+ */
> +		if (ext[0] != CEA_EXT || cea_revision(ext) < 3)
> +			continue;
> +
> +		iter->index = 4;
> +		iter->end = ext[2];
> +		if (iter->end == 0)
> +			iter->end = 127;
> +		if (iter->end < 4 || iter->end > 127)
> +			continue;
> +
> +		return ext;
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * References:
> + * - DisplayID v1.3 Appendix C: CEA Data Block within a DisplayID Data Block
> + * - DisplayID v2.0 section 4.10 CTA DisplayID Data Block
> + *
> + * Note that the above do not specify any connection between DisplayID Data
> + * Block revision and CEA Extension versions.
> + */
> +static const void *__cea_db_iter_displayid_next(struct cea_db_iter *iter)
> +{
> +	const struct displayid_block *block;
> +
> +	displayid_iter_for_each(block, &iter->displayid_iter) {
> +		if (block->tag != DATA_BLOCK_CTA)
> +			continue;
> +
> +		iter->index = sizeof(*block);
> +		iter->end = iter->index + block->num_bytes;

I'd like to keep the comment from cea_db_offsets() reminding
us why we  can trust this thing.

Overall looks pretty nice to my eyes.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +
> +		return block;
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct cea_db *__cea_db_iter_next(struct cea_db_iter *iter)
> +{
> +	const struct cea_db *db;
> +
> +	if (iter->collection) {
> +		/* Current collection should always be valid. */
> +		db = __cea_db_iter_current_block(iter);
> +		if (WARN_ON(!db)) {
> +			iter->collection = NULL;
> +			return NULL;
> +		}
> +
> +		/* Next block in CEA Data Block Collection */
> +		iter->index += sizeof(*db) + cea_db_payload_len(db);
> +
> +		db = __cea_db_iter_current_block(iter);
> +		if (db)
> +			return db;
> +	}
> +
> +	for (;;) {
> +		/*
> +		 * Find the next CEA Data Block Collection. First iterate all
> +		 * the EDID CEA extensions, then all the DisplayID CTA blocks.
> +		 *
> +		 * Per DisplayID v1.3 Appendix B: DisplayID as an EDID
> +		 * Extension, it's recommended that DisplayID extensions are
> +		 * exposed after all of the CEA extensions.
> +		 */
> +		iter->collection = __cea_db_iter_edid_next(iter);
> +		if (!iter->collection)
> +			iter->collection = __cea_db_iter_displayid_next(iter);
> +
> +		if (!iter->collection)
> +			return NULL;
> +
> +		db = __cea_db_iter_current_block(iter);
> +		if (db)
> +			return db;
> +	}
> +}
> +
> +#define cea_db_iter_for_each(__db, __iter) \
> +	while (((__db) = __cea_db_iter_next(__iter)))
> +
> +static void cea_db_iter_end(struct cea_db_iter *iter)
> +{
> +	displayid_iter_end(&iter->displayid_iter);
> +	drm_edid_iter_end(&iter->edid_iter);
> +
> +	memset(iter, 0, sizeof(*iter));
> +}
> +
>  static bool cea_db_is_hdmi_vsdb(const u8 *db)
>  {
>  	if (cea_db_tag(db) != CEA_DB_VENDOR)
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
