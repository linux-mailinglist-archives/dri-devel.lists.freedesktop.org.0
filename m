Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6F9A6AA3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BCF10E4FB;
	Mon, 21 Oct 2024 13:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8wtrmv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EDE10E4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729518137; x=1761054137;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pjvibWiVCG0PZxiM1xmWuEP9nThsSFVq3jPfmC8Vi4E=;
 b=G8wtrmv9YPh5YNpckw+Ux0KtOKJWj50uJA3SriRHk/c0oEz6ytDDWokw
 IAE4+YiA3cWSZ1wyxfOfL2bgByaI12iOVryG0AOXP/3HJMTU6ns92TnD2
 14INTNR1W3aggbagJKcA9Ew4WsHiVbUU19CL2xQQw63Zr3zxze3RhEkvL
 NslN5cdlnkFQFrHfAexRlJAEzk6EKKgFHUftuhjMFqFR8BojZV3LmWf8k
 9Ev0hbbKtYVgKJXPXM4ARFfRZDy2AZxZecR9ogMx0jAD7Tdnx6v119ZrZ
 My3VRkOTBT9kzGU41gyt6Ee5VLwEGY3TNSht6oG0RTfCWKWmAb54VAcrW g==;
X-CSE-ConnectionGUID: 4Vt0a6y+R/GfjIKiw8ZA2g==
X-CSE-MsgGUID: 9YpW8BN9R/6dbNGRSPwgLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32928201"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="32928201"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 06:42:11 -0700
X-CSE-ConnectionGUID: mCKX58edS1qA1g+YHEihxw==
X-CSE-MsgGUID: 6qhZLUzeQyOxSGhnBMmJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="80355240"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.222])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 06:42:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/edid: transition to passing struct cea_db * to
 cae_db_payload_len
In-Reply-To: <20241011152929.10145-1-vamsikrishna.brahmajosyula@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241011152929.10145-1-vamsikrishna.brahmajosyula@gmail.com>
Date: Mon, 21 Oct 2024 16:42:04 +0300
Message-ID: <87jze1y3mb.fsf@intel.com>
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

On Fri, 11 Oct 2024, Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com> wrote:
> Address the FIXME in cea_db_payload_len
> 	Transition to passing struct cea_db * everywhere

You've misunderstood the comment. The point is to pass struct cea_db *
around, not to stick to u8 * and drop calls to cea_db_payload_len().

BR,
Jani.

>
> Precompute the payload length in drm_parse_cea_ext and pass to
> individual parsers to avoid casting struct cea_db pointer to u8
> pointer where length is needed.
>
> Since the type of payload length is inconsistent in the file,
> use u8, u16 where it was already in place, use int elsewhere.
>
> Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 63 ++++++++++++++++----------------------
>  1 file changed, 27 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..80442e8b8ac6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4977,11 +4977,8 @@ static int cea_db_tag(const struct cea_db *db)
>  	return db->tag_length >> 5;
>  }
>  
> -static int cea_db_payload_len(const void *_db)
> +static int cea_db_payload_len(const struct cea_db *db)
>  {
> -	/* FIXME: Transition to passing struct cea_db * everywhere. */
> -	const struct cea_db *db = _db;
> -
>  	return db->tag_length & 0x1f;
>  }
>  
> @@ -5432,22 +5429,18 @@ static uint8_t hdr_metadata_type(const u8 *edid_ext)
>  }
>  
>  static void
> -drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
> +drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db, const u16 payload_len)
>  {
> -	u16 len;
> -
> -	len = cea_db_payload_len(db);
> -
>  	connector->hdr_sink_metadata.hdmi_type1.eotf =
>  						eotf_supported(db);
>  	connector->hdr_sink_metadata.hdmi_type1.metadata_type =
>  						hdr_metadata_type(db);
>  
> -	if (len >= 4)
> +	if (payload_len >= 4)
>  		connector->hdr_sink_metadata.hdmi_type1.max_cll = db[4];
> -	if (len >= 5)
> +	if (payload_len >= 5)
>  		connector->hdr_sink_metadata.hdmi_type1.max_fall = db[5];
> -	if (len >= 6) {
> +	if (payload_len >= 6) {
>  		connector->hdr_sink_metadata.hdmi_type1.min_cll = db[6];
>  
>  		/* Calculate only when all values are available */
> @@ -5457,20 +5450,18 @@ drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
>  
>  /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
>  static void
> -drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
> +drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db, u8 payload_len)
>  {
> -	u8 len = cea_db_payload_len(db);
> -
> -	if (len >= 6 && (db[6] & (1 << 7)))
> +	if (payload_len >= 6 && (db[6] & (1 << 7)))
>  		connector->eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= DRM_ELD_SUPPORTS_AI;
>  
> -	if (len >= 10 && hdmi_vsdb_latency_present(db)) {
> +	if (payload_len >= 10 && hdmi_vsdb_latency_present(db)) {
>  		connector->latency_present[0] = true;
>  		connector->video_latency[0] = db[9];
>  		connector->audio_latency[0] = db[10];
>  	}
>  
> -	if (len >= 12 && hdmi_vsdb_i_latency_present(db)) {
> +	if (payload_len >= 12 && hdmi_vsdb_i_latency_present(db)) {
>  		connector->latency_present[1] = true;
>  		connector->video_latency[1] = db[11];
>  		connector->audio_latency[1] = db[12];
> @@ -5695,7 +5686,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
>  		case CTA_DB_VENDOR:
>  			/* HDMI Vendor-Specific Data Block */
>  			if (cea_db_is_hdmi_vsdb(db))
> -				drm_parse_hdmi_vsdb_audio(connector, (const u8 *)db);
> +				drm_parse_hdmi_vsdb_audio(connector, (const u8 *)db, len);
>  			break;
>  		default:
>  			break;
> @@ -6122,7 +6113,7 @@ static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
>  }
>  
>  static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
> -			       const u8 *hf_scds)
> +			       const u8 *hf_scds, int payload_len)
>  {
>  	hdmi_dsc->v_1p2 = hf_scds[11] & DRM_EDID_DSC_1P2;
>  
> @@ -6142,7 +6133,7 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
>  		/* Supports min 8 BPC if DSC 1.2 is supported*/
>  		hdmi_dsc->bpc_supported = 8;
>  
> -	if (cea_db_payload_len(hf_scds) >= 12 && hf_scds[12]) {
> +	if (payload_len >= 12 && hf_scds[12]) {
>  		u8 dsc_max_slices;
>  		u8 dsc_max_frl_rate;
>  
> @@ -6188,13 +6179,13 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
>  		}
>  	}
>  
> -	if (cea_db_payload_len(hf_scds) >= 13 && hf_scds[13])
> +	if (payload_len >= 13 && hf_scds[13])
>  		hdmi_dsc->total_chunk_kbytes = hf_scds[13] & DRM_EDID_DSC_TOTAL_CHUNK_KBYTES;
>  }
>  
>  /* Sink Capability Data Structure */
>  static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
> -				      const u8 *hf_scds)
> +				      const u8 *hf_scds, int payload_len)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  	struct drm_hdmi_info *hdmi = &info->hdmi;
> @@ -6247,8 +6238,8 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  
>  	drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
>  
> -	if (cea_db_payload_len(hf_scds) >= 11 && hf_scds[11]) {
> -		drm_parse_dsc_info(hdmi_dsc, hf_scds);
> +	if (payload_len >= 11 && hf_scds[11]) {
> +		drm_parse_dsc_info(hdmi_dsc, hf_scds, payload_len);
>  		dsc_support = true;
>  	}
>  
> @@ -6259,7 +6250,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  }
>  
>  static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> -					   const u8 *hdmi)
> +					   const u8 *hdmi, const u8 payload_len)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  	unsigned int dc_bpc = 0;
> @@ -6267,7 +6258,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	/* HDMI supports at least 8 bpc */
>  	info->bpc = 8;
>  
> -	if (cea_db_payload_len(hdmi) < 6)
> +	if (payload_len < 6)
>  		return;
>  
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
> @@ -6320,18 +6311,17 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  
>  /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
>  static void
> -drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
> +drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db, const u8 payload_len)
>  {
>  	struct drm_display_info *info = &connector->display_info;
> -	u8 len = cea_db_payload_len(db);
>  
>  	info->is_hdmi = true;
>  
>  	info->source_physical_address = (db[4] << 8) | db[5];
>  
> -	if (len >= 6)
> +	if (payload_len >= 6)
>  		info->dvi_dual = db[6] & 1;
> -	if (len >= 7)
> +	if (payload_len >= 7)
>  		info->max_tmds_clock = db[7] * 5000;
>  
>  	/*
> @@ -6340,14 +6330,14 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
>  	 * HDMI infoframe support was first added in HDMI 1.4. Assume the sink
>  	 * supports infoframes if HDMI_Video_present is set.
>  	 */
> -	if (len >= 8 && db[8] & BIT(5))
> +	if (payload_len >= 8 && db[8] & BIT(5))
>  		info->has_hdmi_infoframe = true;
>  
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
>  		    connector->base.id, connector->name,
>  		    info->dvi_dual, info->max_tmds_clock);
>  
> -	drm_parse_hdmi_deep_color_info(connector, db);
> +	drm_parse_hdmi_deep_color_info(connector, db, payload_len);
>  }
>  
>  /*
> @@ -6410,12 +6400,13 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  	cea_db_iter_for_each(db, &iter) {
>  		/* FIXME: convert parsers to use struct cea_db */
>  		const u8 *data = (const u8 *)db;
> +		int len = cea_db_payload_len(db);
>  
>  		if (cea_db_is_hdmi_vsdb(db))
> -			drm_parse_hdmi_vsdb_video(connector, data);
> +			drm_parse_hdmi_vsdb_video(connector, data, len);
>  		else if (cea_db_is_hdmi_forum_vsdb(db) ||
>  			 cea_db_is_hdmi_forum_scdb(db))
> -			drm_parse_hdmi_forum_scds(connector, data);
> +			drm_parse_hdmi_forum_scds(connector, data, len);
>  		else if (cea_db_is_microsoft_vsdb(db))
>  			drm_parse_microsoft_vsdb(connector, data);
>  		else if (cea_db_is_y420cmdb(db))
> @@ -6425,7 +6416,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  		else if (cea_db_is_vcdb(db))
>  			drm_parse_vcdb(connector, data);
>  		else if (cea_db_is_hdmi_hdr_metadata_block(db))
> -			drm_parse_hdr_metadata_block(connector, data);
> +			drm_parse_hdr_metadata_block(connector, data, len);
>  		else if (cea_db_tag(db) == CTA_DB_VIDEO)
>  			parse_cta_vdb(connector, db);
>  		else if (cea_db_tag(db) == CTA_DB_AUDIO)
>
> base-commit: 1d227fcc72223cbdd34d0ce13541cbaab5e0d72f

-- 
Jani Nikula, Intel
