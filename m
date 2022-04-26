Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70180510894
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7F310E4C0;
	Tue, 26 Apr 2022 19:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF22A10E48C;
 Tue, 26 Apr 2022 19:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651000091; x=1682536091;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SlTZkvIJehQCtMOYAWcYJuhfxgwmu1ZTUJlhlyGBqeI=;
 b=ZWq4azWxbCZ584+5yvqvu+3k5kCG5hc86nF7N3app2OHZQfebZ8yHMLz
 MfKfY4quOmdbfI7HRu2gDNse9YxawD82NTbeTSCSe9nTWgiJd6vzdhH+r
 wgZ96Y84NHMc1Gz0eKTyMX0tsP4LGdSTFpsYDKwQKleN0hrTW6HyiBZEI
 /l7lY5CF2XiYwFsuymrXiOMcM9d3Ifht5u+b963cXvUkFgXkWuoQObrsn
 kTHUf3FNn87MXIq8JGIgKMqF/RFn9xdNxqIyHL9za7HDZCeBR5Fkq52ZO
 zIrd0WfewAv24ofgyxFbTKdMOTuQUSmc5Qy0N3DgZWIcZoZnZUtmL21oa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265218213"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265218213"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="705189688"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga001.fm.intel.com with SMTP; 26 Apr 2022 12:07:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Apr 2022 22:07:51 +0300
Date: Tue, 26 Apr 2022 22:07:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 02/19] drm/edid: check for HF-SCDB block
Message-ID: <YmhDB6LxHXJvBMRB@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
 <a372cec9ce98438a963d199ebb04c2de56152513.1649948562.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a372cec9ce98438a963d199ebb04c2de56152513.1649948562.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 06:06:45PM +0300, Jani Nikula wrote:
> From: Lee Shawn C <shawn.c.lee@intel.com>
> 
> Find HF-SCDB information in CEA extensions block. And retrieve
> Max_TMDS_Character_Rate that support by sink device.
> 
> v2: HF-SCDB and HF-VSDBS carry the same SCDS data. Reuse
>     drm_parse_hdmi_forum_vsdb() to parse this packet.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4758e78fad82..32ece9607b94 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3495,6 +3495,7 @@ add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
>  #define EXT_VIDEO_CAPABILITY_BLOCK 0x00
>  #define EXT_VIDEO_DATA_BLOCK_420	0x0E
>  #define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
> +#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
>  #define EDID_BASIC_AUDIO	(1 << 6)
>  #define EDID_CEA_YCRCB444	(1 << 5)
>  #define EDID_CEA_YCRCB422	(1 << 4)
> @@ -4426,6 +4427,20 @@ static bool cea_db_is_vcdb(const u8 *db)
>  	return true;
>  }
>  
> +static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
> +{
> +	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (cea_db_payload_len(db) < 7)
> +		return false;
> +
> +	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_SCDB_DATA_BLOCK)
> +		return false;
> +
> +	return true;
> +}
> +
>  static bool cea_db_is_y420cmdb(const u8 *db)
>  {
>  	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> @@ -5387,7 +5402,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  
>  		if (cea_db_is_hdmi_vsdb(db))
>  			drm_parse_hdmi_vsdb_video(connector, db);
> -		if (cea_db_is_hdmi_forum_vsdb(db))
> +		if (cea_db_is_hdmi_forum_vsdb(db) ||
> +		    cea_db_is_hdmi_forum_scdb(db))
>  			drm_parse_hdmi_forum_vsdb(connector, db);

I'd do a s/parse_hdmi_forum_vsdb/parse_scds/ to keep up
with the spec terminology.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  		if (cea_db_is_microsoft_vsdb(db))
>  			drm_parse_microsoft_vsdb(connector, db);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
