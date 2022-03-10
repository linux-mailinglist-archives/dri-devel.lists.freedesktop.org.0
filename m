Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082624D44F7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEC010EAF0;
	Thu, 10 Mar 2022 10:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FB310EAF0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646909389; x=1678445389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hjNoE4eOnn9T1rV4EfWcfVaInTGWOekNBM8xfNvaUaM=;
 b=aopDRIp7EYrr+bIDRJjXXopX6KYuXWDkOTHtG/RQI9WZH5LtLMLXpcCO
 qMBuveO1TsLB6NeiSEdqcbuL06aQxwTLdcV/fbJmQ/JHqZAKxTewE3TuE
 pSTQY+HSRLmMfckdKjCrIaX5WMGpV5wsRp672e8pvg+K97Q8m4J9zIptu
 gQIia9E3GL9wtpfAZ2BHx0yalBaOeW2TyVwVM1F+OhdiONs5fxcbuw7CT
 ml/wco3c9D5j6L7mfNkk4UoeOMblR1VhYmU4KZwDXbRkS0VpQP3sAm15o
 tUN1ElR76FKxVTQ0JqX2PklReB/l5ODR2RnAbZWQUcSe+wl/FJ/LG/jDD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237388466"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="237388466"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 02:49:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="547976924"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 10 Mar 2022 02:49:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Mar 2022 12:49:44 +0200
Date: Thu, 10 Mar 2022 12:49:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [v4 2/5] drm/edid: parse multiple CEA extension block
Message-ID: <YinXyEcpEqt8762W@intel.com>
References: <20220302093511.30299-1-shawn.c.lee@intel.com>
 <20220302093511.30299-3-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302093511.30299-3-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 05:35:08PM +0800, Lee Shawn C wrote:
> Try to find and parse more CEA ext blocks if edid->extensions
> is greater than one.
> 
> v2: split prvious patch to two. And do CEA block parsing
>     in this one.
> v3: simplify this patch based on previous change.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 375e70d9de86..c4a47465ba76 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4319,16 +4319,24 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>  static int
>  add_cea_modes(struct drm_connector *connector, struct edid *edid)
>  {
> -	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
> -	u8 dbl, hdmi_len, video_len = 0;
> +	const u8 *cea, *db;
> +	u8 dbl, hdmi_len;
>  	int modes = 0, ext_index = 0;
> +	int i, start, end;

I think everything here apart from modes and ext_index can
be moved into the loop.

Apart from that 1-2 look fine to me. intel-gfx wasn't cc:d however
so we have no ci results for any of this.

>  
> -	cea = drm_find_cea_extension(edid, &ext_index);
> -	if (cea && cea_revision(cea) >= 3) {
> -		int i, start, end;
> +	for (;;) {
> +		const u8 *hdmi = NULL, *video = NULL;
> +		u8 video_len = 0;
> +
> +		cea = drm_find_cea_extension(edid, &ext_index);
> +		if (!cea)
> +			break;
> +
> +		if (cea_revision(cea) < 3)
> +			continue;
>  
>  		if (cea_db_offsets(cea, &start, &end))
> -			return 0;
> +			continue;
>  
>  		for_each_cea_db(cea, i, start, end) {
>  			db = &cea[i];
> @@ -4350,15 +4358,15 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
>  							  dbl - 1);
>  			}
>  		}
> -	}
>  
> -	/*
> -	 * We parse the HDMI VSDB after having added the cea modes as we will
> -	 * be patching their flags when the sink supports stereo 3D.
> -	 */
> -	if (hdmi)
> -		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
> -					    video_len);
> +		/*
> +		 * We parse the HDMI VSDB after having added the cea modes as we will
> +		 * be patching their flags when the sink supports stereo 3D.
> +		 */
> +		if (hdmi)
> +			modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
> +						    video_len);
> +	}
>  
>  	return modes;
>  }
> -- 
> 2.17.1

-- 
Ville Syrjälä
Intel
