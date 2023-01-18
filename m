Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F751672289
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904A410E1CF;
	Wed, 18 Jan 2023 16:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7639010E1CF;
 Wed, 18 Jan 2023 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674058118; x=1705594118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=duTpPycpgipoVLsrDHCL8AH3lxXBmk1Ues77CjRyEjo=;
 b=US2bspfhyDXIsvNwZm4p7eXN+f6Z6fwPq9HHbCzycQtRaua+1vCu6VC7
 E1U0HFHPzZH9samZt71C+eYJd/J8usi6cCxnLMkNTphaznYRw9MEd6i+2
 t8qJuw7QxhhixbZyxKbyxovKLaDHP2mosMTupt5Snec5OY8H3pf2JCuZm
 dQXrWSjApE+0CrJAGdDk8sL3MCSKlTJGJXlF1oA/9f2TEAmDZdDvwojif
 RbJ4zn38o4EzVcmDnqyEDE6KdGllyxMimPKYlM+8476kxTSojyS7etz9+
 UfSIiKf+6HuJija3wILENzkY93UavXuLBrDnYZ0d/AhZTGhMa+MqPad0b w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326283136"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326283136"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692053522"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="692053522"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 18 Jan 2023 08:08:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 18:08:34 +0200
Date: Wed, 18 Jan 2023 18:08:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 11/22] drm/edid: split HDMI VSDB info and mode parsing
Message-ID: <Y8gZgi6+h0ZyDGuE@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <7c912a01272a6203673c04eec13158051aafc7dd.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c912a01272a6203673c04eec13158051aafc7dd.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:26PM +0200, Jani Nikula wrote:
> Separate the parsing of display info and modes from the HDMI VSDB. This
> is prerequisite work for overall better separation of the two parsing
> steps.
> 
> The info parsing is about figuring out whether the sink supports HDMI
> infoframes. Since they were added in HDMI 1.4, assume the sink supports
> HDMI infoframes if it uses HDMI 1.4 features in HDMI VSDB. For details,
> see commit f1781e9bb2dd ("drm/edid: Allow HDMI infoframe without VIC or
> S3D").
> 
> The logic is not exactly the same, but since it was somewhat heuristic
> to begin with, assume this is close enough.
> 
> Add cea_db_raw_size() helper to get the size of the entire data block,
> including tag and length. This is helpful for checking against specs
> that define indexes from the start of the entire block, like here.

I do wonder how much point there is in this difference between
the payload handling for HDMI vs. CTA specified blocks. CTA
specifies the bytes using 1-based indexing so the indices won't
directly match the spec there either. Perhaps we should just use
the same approach for all data blocks regardless of where they're
specified. Anyways, just food for thought in the future.

> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 39 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 93067b8dd9f6..5cb1d36ce48a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4717,7 +4717,6 @@ static int hdmi_vsdb_latency_length(const u8 *db)
>  static int
>  do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  {
> -	struct drm_display_info *info = &connector->display_info;
>  	int modes = 0, offset = 0, i, multi_present = 0, multi_len;
>  	u8 vic_len, hdmi_3d_len = 0;
>  	u16 mask;
> @@ -4835,8 +4834,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  	}
>  
>  out:
> -	if (modes > 0)
> -		info->has_hdmi_infoframe = true;
>  	return modes;
>  }
>  
> @@ -4893,6 +4890,7 @@ static int cea_db_tag(const struct cea_db *db)
>  	return db->tag_length >> 5;
>  }
>  
> +/* Data block payload length excluding the tag and length byte */
>  static int cea_db_payload_len(const void *_db)
>  {
>  	/* FIXME: Transition to passing struct cea_db * everywhere. */
> @@ -4901,6 +4899,12 @@ static int cea_db_payload_len(const void *_db)
>  	return db->tag_length & 0x1f;
>  }
>  
> +/* Data block raw size including the tag and length byte */
> +static int cea_db_raw_size(const void *db)
> +{
> +	return cea_db_payload_len(db) + 1;
> +}
> +
>  static const void *cea_db_data(const struct cea_db *db)
>  {
>  	return db->data;
> @@ -6159,6 +6163,32 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	}
>  }
>  
> +/*
> + * Try to infer whether the sink supports HDMI infoframes.
> + *
> + * HDMI infoframe support was first added in HDMI 1.4. Assume the sink supports
> + * infoframes if the HDMI VSDB contains HDMI 1.4 features.
> + */
> +static bool hdmi_vsdb_infoframe_support(struct drm_connector *connector, const u8 *db)
> +{
> +	int size = cea_db_raw_size(db);
> +	int offset = 8;
> +
> +	if (offset < size)
> +		offset += hdmi_vsdb_latency_length(db);
> +
> +	/* 3D_present */
> +	if (offset < size && db[offset++] & BIT(7))
> +		return true;
> +
> +	/* HDMI_VIC_LEN and HDMI_3D_LEN */
> +	if (offset < size && db[offset])
> +		return true;

I'm thinking it should be enough to just check the HDMI_Video_present
bit. Granted it would be a slight change in behaviour if there are 
EDIDs with said bit set but with no actual 3D/HDMI modes included. But
such sinks would still conform to spec version 1.4 and so should have
no problems with the infoframe.

> +
> +	return false;
> +}
> +
> +/* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
>  static void
>  drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
>  {
> @@ -6172,6 +6202,9 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
>  	if (len >= 7)
>  		info->max_tmds_clock = db[7] * 5000;
>  
> +	if (hdmi_vsdb_infoframe_support(connector, db))
> +		info->has_hdmi_infoframe = true;
> +
>  	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
>  		    connector->base.id, connector->name,
>  		    info->dvi_dual, info->max_tmds_clock);
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
