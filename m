Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CA4EDC28
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7C510F1A2;
	Thu, 31 Mar 2022 14:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DB210E2F6;
 Thu, 31 Mar 2022 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648738471; x=1680274471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YG2GHY47QeGCOkq0sunUKueHY6xVAuPLyUFVNSPeSPU=;
 b=ehDVx8KYRAG6B5Td7VUKjbIdIbPdcut9qCJmi+1j/TuELr47NzjcAIqm
 PNGtOu9qVMXzzQqLOyvofWljLJvfOvXgOCYQexqu0UuAzYP5IPN7RD9Qx
 /UNY9kNZrgkASPJYoRV0zoq1THoxr2fpj0Fp71GWD54x0d+9qywrzcpW6
 7DfRtzjauiEwy8nqBLlmOqq9HlLenRBoyRyu6svgZyGaJEkOKZu/c9Rp1
 cuHGDLsZU36HXwfp6kv7Zg7skxOix3ldA4f2RYL9Hoo8R4UJ3VYBKlT72
 IIPdKuvYEWuBlnOQqjDm2rvdyDshJ5vWPD71JAnjpe7v+eaeoJETAHvrB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="323033394"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="323033394"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="520587249"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga002.jf.intel.com with SMTP; 31 Mar 2022 07:54:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Mar 2022 17:54:27 +0300
Date: Thu, 31 Mar 2022 17:54:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 07/12] drm/edid: split drm_edid_block_valid() to check
 and act parts
Message-ID: <YkXAo2NceBUlGbE1@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
 <296443a99ce907b11d08ddc88407aa35d9bdc5a3.1648578814.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <296443a99ce907b11d08ddc88407aa35d9bdc5a3.1648578814.git.jani.nikula@intel.com>
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

On Tue, Mar 29, 2022 at 09:42:14PM +0300, Jani Nikula wrote:
> Add edid_block_check() that only checks the EDID block validity, without
> any actions. Turns out it's simple and crystal clear.
> 
> Rewrite drm_edid_block_valid() around it, keeping all the functionality
> fairly closely the same, warts and all. Turns out it's incredibly
> complicated for a function you'd expect to be simple, with all the
> fixing and printing and special casing. (Maybe we'll want to simplify it
> in the future.)
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 150 ++++++++++++++++++++++---------------
>  1 file changed, 88 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 481643751d10..04eb6949c9c8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1668,10 +1668,55 @@ bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
>  }
>  EXPORT_SYMBOL(drm_edid_are_equal);
>  
> +enum edid_block_status {
> +	EDID_BLOCK_OK = 0,
> +	EDID_BLOCK_NULL,
> +	EDID_BLOCK_HEADER_CORRUPT,
> +	EDID_BLOCK_HEADER_REPAIR,
> +	EDID_BLOCK_HEADER_FIXED,
> +	EDID_BLOCK_CHECKSUM,
> +	EDID_BLOCK_VERSION,
> +};
> +
> +static enum edid_block_status edid_block_check(const void *_block, bool base)

s/base/is_base_block/ or something?

> +{
> +	const struct edid *block = _block;
> +
> +	if (!block)
> +		return EDID_BLOCK_NULL;
> +
> +	if (base) {
> +		int score = drm_edid_header_is_valid(block);
> +
> +		if (score < clamp(edid_fixup, 6, 8))

That should clamp to 0-8?

Might be nicer to just define a .set() op for the modparam
and check it there, but that's clearly material for a separate patch.

> +			return EDID_BLOCK_HEADER_CORRUPT;
> +
> +		if (score < 8)
> +			return EDID_BLOCK_HEADER_REPAIR;
> +	}
> +
> +	if (edid_block_compute_checksum(block) != edid_block_get_checksum(block))
> +		return EDID_BLOCK_CHECKSUM;
> +
> +	if (base) {
> +		if (block->version != 1)
> +			return EDID_BLOCK_VERSION;
> +	}
> +
> +	return EDID_BLOCK_OK;
> +}
> +
> +static bool edid_block_status_valid(enum edid_block_status status, int tag)
> +{
> +	return status == EDID_BLOCK_OK ||
> +		status == EDID_BLOCK_HEADER_FIXED ||
> +		(status == EDID_BLOCK_CHECKSUM && tag == CEA_EXT);
> +}
> +
>  /**
>   * drm_edid_block_valid - Sanity check the EDID block (base or extension)
>   * @raw_edid: pointer to raw EDID block
> - * @block: type of block to validate (0 for base, extension otherwise)
> + * @block_num: type of block to validate (0 for base, extension otherwise)
>   * @print_bad_edid: if true, dump bad EDID blocks to the console
>   * @edid_corrupt: if true, the header or checksum is invalid
>   *
> @@ -1680,88 +1725,69 @@ EXPORT_SYMBOL(drm_edid_are_equal);
>   *
>   * Return: True if the block is valid, false otherwise.
>   */
> -bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
> +bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
>  			  bool *edid_corrupt)
>  {
> -	u8 csum;
> -	struct edid *edid = (struct edid *)raw_edid;
> +	struct edid *block = (struct edid *)_block;
> +	enum edid_block_status status;
> +	bool base = block_num == 0;
> +	bool valid;
>  
> -	if (WARN_ON(!raw_edid))
> +	if (WARN_ON(!block))
>  		return false;
>  
> -	if (edid_fixup > 8 || edid_fixup < 0)
> -		edid_fixup = 6;
> -
> -	if (block == 0) {
> -		int score = drm_edid_header_is_valid(raw_edid);
> +	status = edid_block_check(block, base);
> +	if (status == EDID_BLOCK_HEADER_REPAIR) {
> +		DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
> +		edid_header_fix(block);
>  
> -		if (score == 8) {
> -			if (edid_corrupt)
> -				*edid_corrupt = false;
> -		} else if (score >= edid_fixup) {
> -			/* Displayport Link CTS Core 1.2 rev1.1 test 4.2.2.6
> -			 * The corrupt flag needs to be set here otherwise, the
> -			 * fix-up code here will correct the problem, the
> -			 * checksum is correct and the test fails
> -			 */
> -			if (edid_corrupt)
> -				*edid_corrupt = true;
> -			DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
> -			edid_header_fix(raw_edid);
> -		} else {
> -			if (edid_corrupt)
> -				*edid_corrupt = true;
> -			goto bad;
> -		}
> +		/* Retry with fixed header, update status if that worked. */
> +		status = edid_block_check(block, base);
> +		if (status == EDID_BLOCK_OK)
> +			status = EDID_BLOCK_HEADER_FIXED;
>  	}
>  
> -	csum = edid_block_compute_checksum(raw_edid);
> -	if (csum != edid_block_get_checksum(raw_edid)) {
> -		if (edid_corrupt)
> +	if (edid_corrupt) {
> +		/*
> +		 * Unknown major version isn't corrupt but we can't use it. Only
> +		 * the base block can reset edid_corrupt to false.
> +		 */
> +		if (base && (status == EDID_BLOCK_OK || status == EDID_BLOCK_VERSION))
> +			*edid_corrupt = false;
> +		else if (status != EDID_BLOCK_OK)
>  			*edid_corrupt = true;
> -
> -		/* allow CEA to slide through, switches mangle this */
> -		if (edid_block_tag(raw_edid) == CEA_EXT) {
> -			DRM_DEBUG("EDID checksum is invalid, remainder is %d\n", csum);
> -			DRM_DEBUG("Assuming a KVM switch modified the CEA block but left the original checksum\n");
> -		} else {
> -			if (print_bad_edid)
> -				DRM_NOTE("EDID checksum is invalid, remainder is %d\n", csum);
> -
> -			goto bad;
> -		}
>  	}
>  
> -	/* per-block-type checks */
> -	switch (edid_block_tag(raw_edid)) {
> -	case 0: /* base */
> -		if (edid->version != 1) {
> -			DRM_NOTE("EDID has major version %d, instead of 1\n", edid->version);
> -			goto bad;
> +	/* Determine whether we can use this block with this status. */
> +	valid = edid_block_status_valid(status, edid_block_tag(block));
> +
> +	/* Some fairly random status printouts. */
> +	if (status == EDID_BLOCK_CHECKSUM) {
> +		if (valid) {
> +			DRM_DEBUG("EDID block checksum is invalid, remainder is %d\n",
> +				  edid_block_compute_checksum(block));
> +			DRM_DEBUG("Assuming a KVM switch modified the block but left the original checksum\n");
> +		} else if (print_bad_edid) {
> +			DRM_NOTE("EDID block checksum is invalid, remainder is %d\n",
> +				 edid_block_compute_checksum(block));
>  		}
> -
> -		if (edid->revision > 4)
> -			DRM_DEBUG("EDID minor > 4, assuming backward compatibility\n");

This debug message seems to disappear. Intentional?

> -		break;
> -
> -	default:
> -		break;
> +	} else if (status == EDID_BLOCK_VERSION) {
> +		DRM_NOTE("EDID has major version %d, instead of 1\n",
> +			 block->version);
>  	}
>  
> -	return true;
> -
> -bad:
> -	if (print_bad_edid) {
> -		if (edid_is_zero(raw_edid, EDID_LENGTH)) {
> +	if (!valid && print_bad_edid) {
> +		if (edid_is_zero(block, EDID_LENGTH)) {
>  			pr_notice("EDID block is all zeroes\n");
>  		} else {
>  			pr_notice("Raw EDID:\n");
>  			print_hex_dump(KERN_NOTICE,
>  				       " \t", DUMP_PREFIX_NONE, 16, 1,
> -				       raw_edid, EDID_LENGTH, false);
> +				       block, EDID_LENGTH, false);
>  		}
>  	}
> -	return false;
> +
> +	return valid;
>  }
>  EXPORT_SYMBOL(drm_edid_block_valid);
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
