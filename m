Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1865F5108B6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977E610E4FA;
	Tue, 26 Apr 2022 19:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BB010E4FA;
 Tue, 26 Apr 2022 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651000282; x=1682536282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6prCgnhx46iRN9qzUeuPifXhgWIOvtQ7FGWPCnOowag=;
 b=XCaqPY2wumkfPe3MLR8bO5ptxdmc5np+FmSb0yAcuhbzObn8Yl9kl2ev
 98fjXlQjwkp6mGhvJ2m9rYMwgUq0iVV6o037kKex1s6LeU9j4NDyDmb3A
 rEzjmNAikNdexr+VsC3HfYg0uZazxTeavM3gGhP1u0eonFr+yu6yVlcfT
 7P5JRhJDExXsoBO+3sBOb0JHtX2Dc0B2FJh4K7ioZ0em1Ud69oQ+SQzGK
 /IO4RDMuCk+PvA7MQzb8W8SLK1926iDoKGqv6Ikx6nizfeJ15bU4BAOE0
 HX5VZRv2SMhxIr5lMQ1c18yiGZ8d/6DW/4HDZt94uGzFmsVWwbWVAmNU3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245617219"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="245617219"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="580103955"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga008.jf.intel.com with SMTP; 26 Apr 2022 12:10:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Apr 2022 22:10:24 +0300
Date: Tue, 26 Apr 2022 22:10:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 06/19] drm/edid: clean up cea_db_is_*() functions
Message-ID: <YmhDoHpmVlue4+5J@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
 <da6e3a1f1b5f1038d37e82bdbd9244f999b72d96.1649948562.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da6e3a1f1b5f1038d37e82bdbd9244f999b72d96.1649948562.git.jani.nikula@intel.com>
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

On Thu, Apr 14, 2022 at 06:06:49PM +0300, Jani Nikula wrote:
> Abstract helpers for matching vendor data blocks and extended tags, and
> use them to simplify all the cea_db_is_*() functions.
> 
> Take void pointer as parameter to allow transitional use for both u8 *
> and struct cea_db *.
> 
> v2: Remove superfluous parens (Ville)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 127 ++++++++++++-------------------------
>  1 file changed, 40 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 43d9e04f8fb9..34897b1417a5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4360,12 +4360,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
>  	return modes;
>  }
>  
> -static int
> -cea_db_extended_tag(const u8 *db)
> -{
> -	return db[1];
> -}
> -
>  static int
>  cea_revision(const u8 *cea)
>  {
> @@ -4477,6 +4471,22 @@ static const void *cea_db_data(const struct cea_db *db)
>  	return db->data;
>  }
>  
> +static bool cea_db_is_extended_tag(const struct cea_db *db, int tag)
> +{
> +	return cea_db_tag(db) == CTA_DB_EXTENDED_TAG &&
> +		cea_db_payload_len(db) >= 1 &&
> +		db->data[0] == tag;
> +}
> +
> +static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)
> +{
> +	const u8 *data = cea_db_data(db);
> +
> +	return cea_db_tag(db) == CTA_DB_VENDOR &&
> +		cea_db_payload_len(db) >= 3 &&
> +		oui(data[2], data[1], data[0]) == vendor_oui;
> +}
> +
>  static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
>  {
>  	memset(iter, 0, sizeof(*iter));
> @@ -4611,93 +4621,50 @@ static void cea_db_iter_end(struct cea_db_iter *iter)
>  	memset(iter, 0, sizeof(*iter));
>  }
>  
> -static bool cea_db_is_hdmi_vsdb(const u8 *db)
> +static bool cea_db_is_hdmi_vsdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CTA_DB_VENDOR)
> -		return false;
> -
> -	if (cea_db_payload_len(db) < 5)
> -		return false;
> -
> -	return oui(db[3], db[2], db[1]) == HDMI_IEEE_OUI;
> +	return cea_db_is_vendor(db, HDMI_IEEE_OUI) &&
> +		cea_db_payload_len(db) >= 5;
>  }
>  
> -static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
> +static bool cea_db_is_hdmi_forum_vsdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CTA_DB_VENDOR)
> -		return false;
> -
> -	if (cea_db_payload_len(db) < 7)
> -		return false;
> -
> -	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
> +	return cea_db_is_vendor(db, HDMI_FORUM_IEEE_OUI) &&
> +		cea_db_payload_len(db) >= 7;
>  }
>  
> -static bool cea_db_is_microsoft_vsdb(const u8 *db)
> +static bool cea_db_is_microsoft_vsdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CTA_DB_VENDOR)
> -		return false;
> -
> -	if (cea_db_payload_len(db) != 21)
> -		return false;
> -
> -	return oui(db[3], db[2], db[1]) == MICROSOFT_IEEE_OUI;
> +	return cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
> +		cea_db_payload_len(db) == 21;
>  }
>  
> -static bool cea_db_is_vcdb(const u8 *db)
> +static bool cea_db_is_vcdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (cea_db_payload_len(db) != 2)
> -		return false;
> -
> -	if (cea_db_extended_tag(db) != CTA_EXT_DB_VIDEO_CAP)
> -		return false;
> -
> -	return true;
> +	return cea_db_is_extended_tag(db, CTA_EXT_DB_VIDEO_CAP) &&
> +		cea_db_payload_len(db) == 2;
>  }
>  
> -static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
> +static bool cea_db_is_hdmi_forum_scdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (cea_db_payload_len(db) < 7)
> -		return false;
> -
> -	if (cea_db_extended_tag(db) != CTA_EXT_DB_HF_SCDB)
> -		return false;
> -
> -	return true;
> +	return cea_db_is_extended_tag(db, CTA_EXT_DB_HF_SCDB) &&
> +		cea_db_payload_len(db) >= 7;
>  }
>  
> -static bool cea_db_is_y420cmdb(const u8 *db)
> +static bool cea_db_is_y420cmdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (!cea_db_payload_len(db))
> -		return false;
> -
> -	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_CAP_MAP)
> -		return false;
> -
> -	return true;
> +	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_CAP_MAP);
>  }
>  
> -static bool cea_db_is_y420vdb(const u8 *db)
> +static bool cea_db_is_y420vdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (!cea_db_payload_len(db))
> -		return false;
> -
> -	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_DATA)
> -		return false;
> +	return cea_db_is_extended_tag(db, CTA_EXT_DB_420_VIDEO_DATA);
> +}
>  
> -	return true;
> +static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
> +{
> +	return cea_db_is_extended_tag(db, CTA_EXT_DB_HDR_STATIC_METADATA) &&
> +		cea_db_payload_len(db) >= 3;
>  }
>  
>  #define for_each_cea_db(cea, i, start, end) \
> @@ -4833,20 +4800,6 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>  	mode->clock = clock;
>  }
>  
> -static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
> -{
> -	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (db[1] != CTA_EXT_DB_HDR_STATIC_METADATA)
> -		return false;
> -
> -	if (cea_db_payload_len(db) < 3)
> -		return false;
> -
> -	return true;
> -}
> -
>  static uint8_t eotf_supported(const u8 *edid_ext)
>  {
>  	return edid_ext[2] &
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
