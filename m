Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F314E5588
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5660910E736;
	Wed, 23 Mar 2022 15:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C66110E736;
 Wed, 23 Mar 2022 15:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648050232; x=1679586232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=moaXWnEhfol3pD/OuYljTh1bkTU2VPPY60ptbTXn+IA=;
 b=Gi1j7IKqG3GWw8UWFlNpnIFGEMadiP9NKXw22jYwLqgj/j/GaMxuP/1N
 ORB8ixUD29R5IA0Wjk1aWKenYxWaR4eAPfo15TfSgVymEagV1qs8dXPI4
 YvqFEOySDGgVnqiRXCQjpQIfayNZ3MkK+BBVrDFCzzOolx71UscdMy0oa
 FFf72qXzKGlcVrwVeFP5dsyHMs+q5uOM8vIz1zuVKxJBn7zBbkVLe7U00
 Exhm4r8iQHdRZz9pcdYAfRgWZfdgUmtS5KzBGLSZpOhI12FRsWnmN1BrX
 CGOrmRdAIcQIg3KkU/Owrr2whabMF1kddLhcDC8lUxp2BQgiEAdRM8JkL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258328239"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="258328239"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="583732588"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga001.jf.intel.com with SMTP; 23 Mar 2022 08:43:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 17:43:48 +0200
Date: Wed, 23 Mar 2022 17:43:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC 06/19] drm/edid: clean up cea_db_is_*() functions
Message-ID: <YjtANOJjTC4Q4T3m@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
 <a9b83af4adfbc10296933958a057dddbb42bf769.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9b83af4adfbc10296933958a057dddbb42bf769.1647985054.git.jani.nikula@intel.com>
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

On Tue, Mar 22, 2022 at 11:40:35PM +0200, Jani Nikula wrote:
> Abstract helpers for matching vendor data blocks and extended tags, and
> use them to simplify all the cea_db_is_*() functions.
> 
> Take void pointer as parameter to allow transitional use for both u8 *
> and struct cea_db *.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 113 ++++++++++++-------------------------
>  1 file changed, 37 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c12c3cbab274..a0a5a7271658 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4196,12 +4196,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
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
> @@ -4313,6 +4307,22 @@ static const void *cea_db_data(const struct cea_db *db)
>  	return db->data;
>  }
>  
> +static bool cea_db_is_extended_tag(const struct cea_db *db, int tag)
> +{
> +	return (cea_db_tag(db) == CEA_DB_EXTENDED_TAG &&
> +		cea_db_payload_len(db) >= 1 &&
> +		db->data[0] == tag);
> +}

nit: not a huge fan of the redundant parens in all of these

> +
> +static bool cea_db_is_vendor(const struct cea_db *db, int vendor_oui)

I'd probably make the tag/oui unsigned.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +{
> +	const u8 *data = cea_db_data(db);
> +
> +	return (cea_db_tag(db) == CEA_DB_VENDOR &&
> +		cea_db_payload_len(db) >= 3 &&
> +		oui(data[2], data[1], data[0]) == vendor_oui);
> +}
> +
>  static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
>  {
>  	memset(iter, 0, sizeof(*iter));
> @@ -4443,79 +4453,44 @@ static void cea_db_iter_end(struct cea_db_iter *iter)
>  	memset(iter, 0, sizeof(*iter));
>  }
>  
> -static bool cea_db_is_hdmi_vsdb(const u8 *db)
> +static bool cea_db_is_hdmi_vsdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CEA_DB_VENDOR)
> -		return false;
> -
> -	if (cea_db_payload_len(db) < 5)
> -		return false;
> -
> -	return oui(db[3], db[2], db[1]) == HDMI_IEEE_OUI;
> +	return (cea_db_is_vendor(db, HDMI_IEEE_OUI) &&
> +		cea_db_payload_len(db) >= 5);
>  }
>  
> -static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
> +static bool cea_db_is_hdmi_forum_vsdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CEA_DB_VENDOR)
> -		return false;
> -
> -	if (cea_db_payload_len(db) < 7)
> -		return false;
> -
> -	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
> +	return (cea_db_is_vendor(db, HDMI_FORUM_IEEE_OUI) &&
> +		cea_db_payload_len(db) >= 7);
>  }
>  
> -static bool cea_db_is_microsoft_vsdb(const u8 *db)
> +static bool cea_db_is_microsoft_vsdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CEA_DB_VENDOR)
> -		return false;
> -
> -	if (cea_db_payload_len(db) != 21)
> -		return false;
> -
> -	return oui(db[3], db[2], db[1]) == MICROSOFT_IEEE_OUI;
> +	return (cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
> +		cea_db_payload_len(db) == 21);
>  }
>  
> -static bool cea_db_is_vcdb(const u8 *db)
> +static bool cea_db_is_vcdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (cea_db_payload_len(db) != 2)
> -		return false;
> -
> -	if (cea_db_extended_tag(db) != CEA_EXT_DB_VIDEO_CAP)
> -		return false;
> -
> -	return true;
> +	return (cea_db_is_extended_tag(db, CEA_EXT_DB_VIDEO_CAP) &&
> +		cea_db_payload_len(db) == 2);
>  }
>  
> -static bool cea_db_is_y420cmdb(const u8 *db)
> +static bool cea_db_is_y420cmdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (!cea_db_payload_len(db))
> -		return false;
> -
> -	if (cea_db_extended_tag(db) != CEA_EXT_DB_420_VIDEO_CAP_MAP)
> -		return false;
> -
> -	return true;
> +	return cea_db_is_extended_tag(db, CEA_EXT_DB_420_VIDEO_CAP_MAP);
>  }
>  
> -static bool cea_db_is_y420vdb(const u8 *db)
> +static bool cea_db_is_y420vdb(const void *db)
>  {
> -	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (!cea_db_payload_len(db))
> -		return false;
> -
> -	if (cea_db_extended_tag(db) != CEA_EXT_DB_420_VIDEO_DATA)
> -		return false;
> +	return cea_db_is_extended_tag(db, CEA_EXT_DB_420_VIDEO_DATA);
> +}
>  
> -	return true;
> +static bool cea_db_is_hdmi_hdr_metadata_block(const void *db)
> +{
> +	return (cea_db_is_extended_tag(db, CEA_EXT_DB_HDR_STATIC_METADATA) &&
> +		cea_db_payload_len(db) >= 3);
>  }
>  
>  #define for_each_cea_db(cea, i, start, end) \
> @@ -4651,20 +4626,6 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>  	mode->clock = clock;
>  }
>  
> -static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
> -{
> -	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
> -		return false;
> -
> -	if (db[1] != CEA_EXT_DB_HDR_STATIC_METADATA)
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
