Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B194F7E78
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569AB10E197;
	Thu,  7 Apr 2022 11:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0910E197;
 Thu,  7 Apr 2022 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649332457; x=1680868457;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HN2DtR0xtCzCUe4m8mwX3MopOEmbTnewrLCroEHqGmo=;
 b=AMfOPLcDwgmtwAdKG4F8+NUfpDqTtKDIfoDB/yqk+Wr3DTlQMsNuIJ5i
 NH37BoIa2J1IbkOO0hjQApuBpvo9u8Pb698YczjAiaVkFsiM9cT6FZ1sM
 92rfCGRs5k+wqU/m4foOERwJ6LvIYnDLtMtbtA39TydTb9Nyo+jCOjK1E
 5pMj1G0P+p3PmB9wj0Kxpzob+VcAkzsheT1494kV5zCHuMUPP8k0f8Tjk
 FH1LIJm+yMhCs34/PEZSJMoq5j/tpUI5G6ANE2Ab6WIkiDRAcruVZjDM0
 AQQVmiVeO9Uqn7s6UO4j4BMZcDbMbACArScnc+TdVxrjEfTKKWMfCsOJ0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="261296100"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="261296100"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 04:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="524893241"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga006.jf.intel.com with SMTP; 07 Apr 2022 04:54:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 07 Apr 2022 14:54:13 +0300
Date: Thu, 7 Apr 2022 14:54:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 03/12] drm/edid: refactor EDID block status printing
Message-ID: <Yk7Q5fJoe7Dv/XOB@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
 <012d5b007a6a3771540499fb1273882d631887b3.1649322799.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <012d5b007a6a3771540499fb1273882d631887b3.1649322799.git.jani.nikula@intel.com>
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

On Thu, Apr 07, 2022 at 12:14:29PM +0300, Jani Nikula wrote:
> Split out a function to log EDID block status. The printouts get changed
> slightly.
> 
> Unfortunately, not all users will have struct drm_device available, so
> we convert to pr_* debug logging instead of drm device based logging.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 75 ++++++++++++++++++++++++++------------
>  1 file changed, 51 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f062d1715ec3..3d04d63464ba 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1729,6 +1729,50 @@ static bool edid_block_valid(const void *block, bool base)
>  				       edid_block_tag(block));
>  }
>  
> +static void edid_block_status_print(enum edid_block_status status,
> +				    const struct edid *block,
> +				    int block_num)
> +{
> +	switch (status) {
> +	case EDID_BLOCK_OK:
> +		break;
> +	case EDID_BLOCK_NULL:
> +		pr_debug("EDID block %d pointer is NULL\n", block_num);
> +		break;
> +	case EDID_BLOCK_ZERO:
> +		pr_notice("EDID block %d is all zeroes\n", block_num);
> +		break;
> +	case EDID_BLOCK_HEADER_CORRUPT:
> +		pr_notice("EDID has corrupt header\n");
> +		break;
> +	case EDID_BLOCK_HEADER_REPAIR:
> +		pr_debug("EDID corrupt header needs repair\n");
> +		break;
> +	case EDID_BLOCK_HEADER_FIXED:
> +		pr_debug("EDID corrupt header fixed\n");
> +		break;
> +	case EDID_BLOCK_CHECKSUM:
> +		if (edid_block_status_valid(status, edid_block_tag(block))) {
> +			pr_debug("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d, ignoring\n",
> +				 block_num, edid_block_tag(block),
> +				 edid_block_compute_checksum(block));
> +		} else {
> +			pr_notice("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
> +				  block_num, edid_block_tag(block),
> +				  edid_block_compute_checksum(block));
> +		}
> +		break;
> +	case EDID_BLOCK_VERSION:
> +		pr_notice("EDID has major version %d, instead of 1\n",
> +			  block->version);
> +		break;
> +	default:
> +		pr_debug("EDID block %d unknown edid block status code %d\n",
> +			 block_num, status);

Maybe this should complaing a bit more loudly. Indicates a bug in the
code no?

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +		break;
> +	}
> +}
> +
>  /**
>   * drm_edid_block_valid - Sanity check the EDID block (base or extension)
>   * @raw_edid: pointer to raw EDID block
> @@ -1775,33 +1819,16 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
>  			*edid_corrupt = true;
>  	}
>  
> +	edid_block_status_print(status, block, block_num);
> +
>  	/* Determine whether we can use this block with this status. */
>  	valid = edid_block_status_valid(status, edid_block_tag(block));
>  
> -	/* Some fairly random status printouts. */
> -	if (status == EDID_BLOCK_CHECKSUM) {
> -		if (valid) {
> -			DRM_DEBUG("EDID block checksum is invalid, remainder is %d\n",
> -				  edid_block_compute_checksum(block));
> -			DRM_DEBUG("Assuming a KVM switch modified the block but left the original checksum\n");
> -		} else if (print_bad_edid) {
> -			DRM_NOTE("EDID block checksum is invalid, remainder is %d\n",
> -				 edid_block_compute_checksum(block));
> -		}
> -	} else if (status == EDID_BLOCK_VERSION) {
> -		DRM_NOTE("EDID has major version %d, instead of 1\n",
> -			 block->version);
> -	}
> -
> -	if (!valid && print_bad_edid) {
> -		if (status == EDID_BLOCK_ZERO) {
> -			pr_notice("EDID block is all zeroes\n");
> -		} else {
> -			pr_notice("Raw EDID:\n");
> -			print_hex_dump(KERN_NOTICE,
> -				       " \t", DUMP_PREFIX_NONE, 16, 1,
> -				       block, EDID_LENGTH, false);
> -		}
> +	if (!valid && print_bad_edid && status != EDID_BLOCK_ZERO) {
> +		pr_notice("Raw EDID:\n");
> +		print_hex_dump(KERN_NOTICE,
> +			       " \t", DUMP_PREFIX_NONE, 16, 1,
> +			       block, EDID_LENGTH, false);
>  	}
>  
>  	return valid;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
