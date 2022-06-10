Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EAE546D46
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E605711382D;
	Fri, 10 Jun 2022 19:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE0B11382F;
 Fri, 10 Jun 2022 19:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654889406; x=1686425406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Gd59fcfsffeQ7Di/YDVmY4gHGt6RywDjO6Ufptdhsyg=;
 b=I6Uc5e5s36BuJJixdwKX2lrdPGb6Q26+a+/CGiPW7ZhfEN9rkJjHpBoV
 qRce2ROlTFnmw3JwX5MOFngHzYMr4AZA1NAxnoFHm4VfTlRHlwfonrbhQ
 /mwrTtrUg4NpeljCUIID02KCpal4ZaMWbyBTXncyoSmnHN3h/2vpHHBUB
 whpJUg8TXw3Amv6mCY7LTez5FhZlE5ultHuLMJS3RSgBaY1Xk83F8V8dM
 YMOOZTZj/2gK219V4Fq7X/63ASjL1ZX7lhc767YKPNXJ3YiWIb0ci0fS5
 6VbpirOdebN1neuobFxHueRWgL4e/r+uf9thzYOgcLuTc/mXKT/TlHkzK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="266493639"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="266493639"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="616606014"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga001.jf.intel.com with SMTP; 10 Jun 2022 12:30:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:30:03 +0300
Date: Fri, 10 Jun 2022 22:30:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 12/15] drm/edid: do invalid block filtering in-place
Message-ID: <YqObu/2oPghzDOVF@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <42b16188052ac66868dcb68e08973d1e6912f325.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42b16188052ac66868dcb68e08973d1e6912f325.1654674560.git.jani.nikula@intel.com>
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

On Wed, Jun 08, 2022 at 10:50:42AM +0300, Jani Nikula wrote:
> Rewrite edid_filter_invalid_blocks() to filter invalid blocks
> in-place. The main motivation is to not rely on passed in information on
> invalid block count or the allocation size, which will be helpful in
> follow-up work on HF-EEODB.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 43 ++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4e788c5cbf25..77ec5b0e436d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2020,33 +2020,37 @@ bool drm_edid_is_valid(struct edid *edid)
>  }
>  EXPORT_SYMBOL(drm_edid_is_valid);
>  
> -static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
> -					       int invalid_blocks,
> +static struct edid *edid_filter_invalid_blocks(struct edid *edid,
>  					       size_t *alloc_size)
>  {
> -	struct edid *new, *dest_block;
> -	int valid_extensions = edid->extensions - invalid_blocks;
> -	int i;
> +	struct edid *new;
> +	int i, valid_blocks = 0;
>  
> -	*alloc_size = edid_size_by_blocks(valid_extensions + 1);
> +	for (i = 0; i < edid_block_count(edid); i++) {
> +		const void *src_block = edid_block_data(edid, i);
>  
> -	new = kmalloc(*alloc_size, GFP_KERNEL);
> -	if (!new)
> -		goto out;
> +		if (edid_block_valid(src_block, i == 0)) {
> +			void *dst_block = (void *)edid_block_data(edid, valid_blocks);
>  
> -	dest_block = new;
> -	for (i = 0; i < edid_block_count(edid); i++) {
> -		const void *block = edid_block_data(edid, i);
> +			memmove(dst_block, src_block, EDID_LENGTH);
> +			valid_blocks++;
> +		}
> +	}
>  
> -		if (edid_block_valid(block, i == 0))
> -			memcpy(dest_block++, block, EDID_LENGTH);
> +	/* We already trusted the base block to be valid here... */
> +	if (WARN_ON(!valid_blocks)) {
> +		kfree(edid);
> +		return NULL;
>  	}
>  
> -	new->extensions = valid_extensions;
> -	new->checksum = edid_block_compute_checksum(new);
> +	edid->extensions = valid_blocks - 1;
> +	edid->checksum = edid_block_compute_checksum(edid);
>  
> -out:
> -	kfree(edid);
> +	*alloc_size = edid_size_by_blocks(valid_blocks);
> +
> +	new = krealloc(edid, *alloc_size, GFP_KERNEL);
> +	if (!new)
> +		kfree(edid);
>  
>  	return new;
>  }
> @@ -2290,8 +2294,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>  	if (invalid_blocks) {
>  		connector_bad_edid(connector, edid, edid_block_count(edid));
>  
> -		edid = edid_filter_invalid_blocks(edid, invalid_blocks,
> -						  &alloc_size);
> +		edid = edid_filter_invalid_blocks(edid, &alloc_size);
>  	}
>  
>  ok:
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
