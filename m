Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A2D546D52
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2341139AB;
	Fri, 10 Jun 2022 19:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D4B1139AB;
 Fri, 10 Jun 2022 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654889713; x=1686425713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2BAlktfvmeMqi18Mh6WBrVDk6nYqIfxdxCCUf5xaX5Q=;
 b=NC2nPYr9c8lgK/6IHRIBBM2bLiQguD9afz35Cuh4Q2DEWJ0R1BGD804L
 XibMf641erI6dwJKlN1Lwcu/nzDn41sF7hhcFOgTFZL3HcE5lHBXROq82
 92l6NMs8U404k3npyIVcyPvOGU5ogdO6hN0WTjZoIqu78holXKLhSvHsx
 P4NwEFgg+kCa0B+yeKFC7Jh4NJ7WQ17sG/RymMHzUQPdXNd+AEqzrudzX
 XFiVQuLQ9PqEGbVcbBv40HYjhnH35Da+LbYtBgUJPP1fDN8n3TdOOpFHW
 abj8JzLBdd/E5SJ24OVaKukuE+VHXQg7uX5sojL3WI3k03jmjB06O9M8+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="275257110"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="275257110"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="672000838"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by FMSMGA003.fm.intel.com with SMTP; 10 Jun 2022 12:35:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:35:09 +0300
Date: Fri, 10 Jun 2022 22:35:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 04/15] drm/edid: keep track of alloc size in
 drm_do_get_edid()
Message-ID: <YqOc7QVJFzw4z5w1@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <8e4261d8c2947ea99240ea929f09a04878235f4e.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e4261d8c2947ea99240ea929f09a04878235f4e.1654674560.git.jani.nikula@intel.com>
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

On Wed, Jun 08, 2022 at 10:50:34AM +0300, Jani Nikula wrote:
> We'll want to return the allocated buffer size in the future. Keep track
> of it.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f44ada4bfa5b..2beaa48301c1 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2021,13 +2021,16 @@ bool drm_edid_is_valid(struct edid *edid)
>  EXPORT_SYMBOL(drm_edid_is_valid);
>  
>  static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
> -					       int invalid_blocks)
> +					       int invalid_blocks,
> +					       size_t *alloc_size)
>  {
>  	struct edid *new, *dest_block;
>  	int valid_extensions = edid->extensions - invalid_blocks;
>  	int i;
>  
> -	new = kmalloc(edid_size_by_blocks(valid_extensions + 1), GFP_KERNEL);
> +	*alloc_size = edid_size_by_blocks(valid_extensions + 1);
> +
> +	new = kmalloc(*alloc_size, GFP_KERNEL);
>  	if (!new)
>  		goto out;
>  
> @@ -2140,7 +2143,8 @@ static void connector_bad_edid(struct drm_connector *connector,
>  }
>  
>  /* Get override or firmware EDID */
> -static struct edid *drm_get_override_edid(struct drm_connector *connector)
> +static struct edid *drm_get_override_edid(struct drm_connector *connector,
> +					  size_t *alloc_size)
>  {
>  	struct edid *override = NULL;
>  
> @@ -2150,6 +2154,10 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector)
>  	if (!override)
>  		override = drm_load_edid_firmware(connector);
>  
> +	/* FIXME: Get alloc size from deeper down the stack */
> +	if (!IS_ERR_OR_NULL(override) && alloc_size)
> +		*alloc_size = edid_size(override);
> +
>  	return IS_ERR(override) ? NULL : override;
>  }
>  
> @@ -2169,7 +2177,7 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
>  	struct edid *override;
>  	int num_modes = 0;
>  
> -	override = drm_get_override_edid(connector);
> +	override = drm_get_override_edid(connector, NULL);
>  	if (override) {
>  		drm_connector_update_edid_property(connector, override);
>  		num_modes = drm_add_edid_modes(connector, override);
> @@ -2245,12 +2253,13 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	enum edid_block_status status;
>  	int i, invalid_blocks = 0;
>  	struct edid *edid, *new;
> +	size_t alloc_size = EDID_LENGTH;
>  
> -	edid = drm_get_override_edid(connector);
> +	edid = drm_get_override_edid(connector, &alloc_size);
>  	if (edid)
>  		goto ok;
>  
> -	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	edid = kmalloc(alloc_size, GFP_KERNEL);
>  	if (!edid)
>  		return NULL;
>  
> @@ -2278,7 +2287,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	if (!edid_extension_block_count(edid))
>  		goto ok;
>  
> -	new = krealloc(edid, edid_size(edid), GFP_KERNEL);
> +	alloc_size = edid_size(edid);
> +	new = krealloc(edid, alloc_size, GFP_KERNEL);
>  	if (!new)
>  		goto fail;
>  	edid = new;
> @@ -2300,7 +2310,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	if (invalid_blocks) {
>  		connector_bad_edid(connector, edid, edid_block_count(edid));
>  
> -		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
> +		edid = edid_filter_invalid_blocks(edid, invalid_blocks,
> +						  &alloc_size);
>  	}
>  
>  ok:
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
