Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB9AD3AA84
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1976A10E468;
	Mon, 19 Jan 2026 13:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNvDunwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E326C10E466
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768829959; x=1800365959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PFlCPo7W5zJ8ZlyCGf4TJChXjCgQiU0U8ziYPvDzD6Y=;
 b=WNvDunwui3VdS0R3/S97s9fBoK1+Rpk+TaFfDpyIe03UcIWACKrKtDAL
 aICLFJ/sdfh+UXuFzXND6HVDVhx4OHSFTS0pY9QxJcedKNxW0VPwpYmz6
 6YSGnixJFR4BlmwUrowtrsWe9ZzGGVS2hxFKLrT7vDiutJbLASrjsCep2
 ji3xBdyTDmoxOC5s2NGmIrw77Bt5RA4dJb7G1LKDjjR7Ua8YmNsMZv0sK
 UpRRGTw3Di078UXFyj1cMEfHr5J2RP2xJ/t8EEE6W1o6WDNT4XmvsTxOV
 6GaIRYdT7e4S+spa07mdZirTiFVmpUIGc7v6+rZTw94uU06d6m88GRaQh A==;
X-CSE-ConnectionGUID: 1H/nRjGRRf665rcMX9dq0g==
X-CSE-MsgGUID: v0QvPYZsT/Oa9BJsgBgrsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="92710049"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="92710049"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:39:18 -0800
X-CSE-ConnectionGUID: 3gqb1nlwQDKbxv3a3tZ99A==
X-CSE-MsgGUID: PaHif++xSnWeaga0jAfqyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="210354929"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 05:39:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joshua Peisach <jpeisach@ubuntu.com>, dri-devel@lists.freedesktop.org
Cc: Joshua Peisach <jpeisach@ubuntu.com>, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
In-Reply-To: <20260117205139.13991-1-jpeisach@ubuntu.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
Date: Mon, 19 Jan 2026 15:39:12 +0200
Message-ID: <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
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

On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com> wrote:
> drm_parse_hdmi_vsdb_video is one of the parsers that still do not use the
> cea_db struct, and currently passes a u8 pointer.
>
> Set the correct struct type and update references to the data accordingly.
> This also makes the same change to drm_parse_hdmi_deep_color_info as
> necessary.
>
> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 26bb7710a..15bd99e65 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
>  }
>  
>  static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
> -					   const u8 *hdmi)
> +					   const struct cea_db *db)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  	unsigned int dc_bpc = 0;
> @@ -6298,24 +6298,24 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	/* HDMI supports at least 8 bpc */
>  	info->bpc = 8;
>  
> -	if (cea_db_payload_len(hdmi) < 6)
> +	if (cea_db_payload_len(db) < 6)
>  		return;
>  
> -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
> +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {

That's not the same thing, but off-by-one now. Ditto everywhere that
changes from u8* to db->data[].

The main problem with the change (even with fixed offsets) is that the
*specs* typically use indexing from the beginning of the data block, not
from the beginning of payload data.

We've discussed this before with Ville (Cc'd) but I'm not sure if we
reached a conclusion.

BR,
Jani.


>  		dc_bpc = 10;
>  		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_30;
>  		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 30.\n",
>  			    connector->base.id, connector->name);
>  	}
>  
> -	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
> +	if (db->data[6] & DRM_EDID_HDMI_DC_36) {
>  		dc_bpc = 12;
>  		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_36;
>  		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 36.\n",
>  			    connector->base.id, connector->name);
>  	}
>  
> -	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
> +	if (db->data[6] & DRM_EDID_HDMI_DC_48) {
>  		dc_bpc = 16;
>  		info->edid_hdmi_rgb444_dc_modes |= DRM_EDID_HDMI_DC_48;
>  		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does deep color 48.\n",
> @@ -6333,7 +6333,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	info->bpc = dc_bpc;
>  
>  	/* YCRCB444 is optional according to spec. */
> -	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
> +	if (db->data[6] & DRM_EDID_HDMI_DC_Y444) {
>  		info->edid_hdmi_ycbcr444_dc_modes = info->edid_hdmi_rgb444_dc_modes;
>  		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink does YCRCB444 in deep color.\n",
>  			    connector->base.id, connector->name);
> @@ -6343,7 +6343,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	 * Spec says that if any deep color mode is supported at all,
>  	 * then deep color 36 bit must be supported.
>  	 */
> -	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
> +	if (!(db->data[6] & DRM_EDID_HDMI_DC_36)) {
>  		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink should do DC_36, but does not!\n",
>  			    connector->base.id, connector->name);
>  	}
> @@ -6351,19 +6351,19 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  
>  /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
>  static void
> -drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
> +drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const struct cea_db *db)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  	u8 len = cea_db_payload_len(db);
>  
>  	info->is_hdmi = true;
>  
> -	info->source_physical_address = (db[4] << 8) | db[5];
> +	info->source_physical_address = (db->data[4] << 8) | db->data[5];
>  
>  	if (len >= 6)
> -		info->dvi_dual = db[6] & 1;
> +		info->dvi_dual = db->data[6] & 1;
>  	if (len >= 7)
> -		info->max_tmds_clock = db[7] * 5000;
> +		info->max_tmds_clock = db->data[7] * 5000;
>  
>  	/*
>  	 * Try to infer whether the sink supports HDMI infoframes.
> @@ -6371,7 +6371,7 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
>  	 * HDMI infoframe support was first added in HDMI 1.4. Assume the sink
>  	 * supports infoframes if HDMI_Video_present is set.
>  	 */
> -	if (len >= 8 && db[8] & BIT(5))
> +	if (len >= 8 && db->data[8] & BIT(5))
>  		info->has_hdmi_infoframe = true;
>  
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
> @@ -6443,7 +6443,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  		const u8 *data = (const u8 *)db;
>  
>  		if (cea_db_is_hdmi_vsdb(db))
> -			drm_parse_hdmi_vsdb_video(connector, data);
> +			drm_parse_hdmi_vsdb_video(connector, db);
>  		else if (cea_db_is_hdmi_forum_vsdb(db) ||
>  			 cea_db_is_hdmi_forum_scdb(db))
>  			drm_parse_hdmi_forum_scds(connector, data);

-- 
Jani Nikula, Intel
