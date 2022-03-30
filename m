Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0234ECA66
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 19:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB0A10E670;
	Wed, 30 Mar 2022 17:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B014810E670;
 Wed, 30 Mar 2022 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648660489; x=1680196489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QpWHE55C+0mt4Wo+6Rf6QE6F6ABNUhFya+kfpJP7Rk8=;
 b=jcMad5QW2/D4k6N+hSXwjPqBwKPoXEoXKaIai6EDlugKKx9a042gtQoa
 apD76GtTH7EgZyNwrhOX8x/vzR7Hb3Nh4WYyFVDYcoNOoZctszEypG5UB
 dGH72f/GXT0XDsyWQUKlkb5UujRyKI9lbxchoOoYjNkexb69t/ig+es7D
 NwvZQ1/dtqtIDAwdeZw9f8Lnei71fuhDQF37L37AlXIXbQ05co/NODLrM
 FXVEX2EiAe7ldoKtrVaXBZT0tU7tep3w3tDj5N3f5rnb8BPCscHduqhOw
 93teyWrdViWL84LP+DlgdIJEdMyK1qqToV1+gPIh9OoU50Jhe6o4v0b5r A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="240193264"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="240193264"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="586075707"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga001.jf.intel.com with SMTP; 30 Mar 2022 10:14:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 30 Mar 2022 20:14:45 +0300
Date: Wed, 30 Mar 2022 20:14:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/edid: fix invalid EDID extension block filtering
Message-ID: <YkSQBaW8swA7LY9M@intel.com>
References: <20220330170426.349248-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220330170426.349248-1-jani.nikula@intel.com>
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

On Wed, Mar 30, 2022 at 08:04:26PM +0300, Jani Nikula wrote:
> The invalid EDID block filtering uses the number of valid EDID
> extensions instead of all EDID extensions for looping the extensions in
> the copy. This is fine, by coincidence, if all the invalid blocks are at
> the end of the EDID. However, it's completely broken if there are
> invalid extensions in the middle; the invalid blocks are included and
> valid blocks are excluded.
> 
> Fix it by modifying the base block after, not before, the copy.
> 
> Fixes: 14544d0937bf ("drm/edid: Only print the bad edid when aborting")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d79b06f7f34c..8829120470ab 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2031,9 +2031,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  
>  		connector_bad_edid(connector, edid, edid[0x7e] + 1);
>  
> -		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
> -		edid[0x7e] = valid_extensions;
> -
>  		new = kmalloc_array(valid_extensions + 1, EDID_LENGTH,
>  				    GFP_KERNEL);
>  		if (!new)
> @@ -2050,6 +2047,9 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  			base += EDID_LENGTH;
>  		}
>  
> +		new[EDID_LENGTH - 1] += new[0x7e] - valid_extensions;
> +		new[0x7e] = valid_extensions;
> +
>  		kfree(edid);
>  		edid = new;
>  	}
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
