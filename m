Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21344F7E7C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5B710E73E;
	Thu,  7 Apr 2022 11:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45A510E73E;
 Thu,  7 Apr 2022 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649332580; x=1680868580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7iWethJPWatDwX1Rc8Gk69WMCgMw5/HLK6pFB/CphXc=;
 b=frmyt4iWkIoIK9QgWpPgY2xm2YyayO3IzhDVK97x6R1zXFjIeQRKlXfU
 yBvaw5cCh1VdP+oA3jd21DxdMDbBblWi4/ZOL1Bpey0uxNo4YJyzdntR/
 0cr9tdkk/GpJj0/qZKygqHn99R4/iBoXEbcT7p6bnTaRiQcFjyZvgEsqY
 W0JE3bGmod1iAkGTWxRVQ+mrehiR2uAWQa0LHLfTr9x6WdruQexiEo2vY
 oKYSqpXEg81r3nOVE9+CzEgBueVMebGIb8SdzCohQfPLyxiPi3jt5szsa
 44yarQ9rHJP4dk8xkPCreB7SNE1RRhcQto5CH5FCobDieFMjY+2V/5vN0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="260996256"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="260996256"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 04:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="588778912"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga001.jf.intel.com with SMTP; 07 Apr 2022 04:56:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Apr 2022 14:56:17 +0300
Date: Thu, 7 Apr 2022 14:56:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 05/12] drm/edid: pass struct edid to connector_bad_edid()
Message-ID: <Yk7RYZxPWZTQbPjT@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
 <13320766ab44588fa27755619fa3b9dc81e91836.1649322799.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13320766ab44588fa27755619fa3b9dc81e91836.1649322799.git.jani.nikula@intel.com>
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

On Thu, Apr 07, 2022 at 12:14:31PM +0300, Jani Nikula wrote:
> Avoid casting here and there, and make it const.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 8638e54e0879..ba54701f91f6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1967,7 +1967,7 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>  }
>  
>  static void connector_bad_edid(struct drm_connector *connector,
> -			       u8 *edid, int num_blocks)
> +			       const struct edid *edid, int num_blocks)
>  {
>  	int i;
>  	u8 last_block;
> @@ -1978,22 +1978,19 @@ static void connector_bad_edid(struct drm_connector *connector,
>  	 * of 0x7e in the EDID of the _index_ of the last block in the
>  	 * combined chunk of memory.
>  	 */
> -	last_block = edid[0x7e];
> +	last_block = edid->extensions;
>  
>  	/* Calculate real checksum for the last edid extension block data */
>  	if (last_block < num_blocks)
>  		connector->real_edid_checksum =
> -			edid_block_compute_checksum(edid + last_block * EDID_LENGTH);
> +			edid_block_compute_checksum(edid + last_block);
>  
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
>  
>  	drm_dbg_kms(connector->dev, "%s: EDID is invalid:\n", connector->name);
> -	for (i = 0; i < num_blocks; i++) {
> -		u8 *block = edid + i * EDID_LENGTH;
> -
> -		edid_block_dump(KERN_DEBUG, block, i);
> -	}
> +	for (i = 0; i < num_blocks; i++)
> +		edid_block_dump(KERN_DEBUG, edid + i, i);

nit: I'm not a big fan of pointer arithmetic in general. IMO it
makes it a bit too easy to miss the fact that it's not counting
bytes but rather potentially something much bigger. So I tend to
prefer array notation for such things. But looks like most of 
these go away at the end anyway with the block_data() stuff.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  }
>  
>  /* Get override or firmware EDID */
> @@ -2139,7 +2136,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	}
>  
>  	if (invalid_blocks) {
> -		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
> +		connector_bad_edid(connector, edid, edid->extensions + 1);
>  
>  		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
>  	}
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
