Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0953BCE7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 18:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7D1131DC;
	Thu,  2 Jun 2022 16:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956BD1131DA;
 Thu,  2 Jun 2022 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654188903; x=1685724903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iyThZ2RE5TwDQxms0c58y2qP+P2qE/Rx94W3sVuQMq0=;
 b=R/4Dii2cPCW9N2MiH79gBI/fNfiKO12ShL+EHMlsS0L4Uqhi3BrlAlPr
 RaEFK+8x6EbLsb8JIezlEvP4lyD3OYtKiup6Pb54yG8l6cNYWkVrQdTwB
 6mZVRsnlFuOaE0ddZysx4iw6bh7RFsOUuY8azwMqIHa1IzAaMSD3c3mye
 vUP5hG0eOQnNWTvLmQuEIluiecnZVltPpLxXLvjJugSFz/+CKdZiQZB/3
 5UVRGFP8SKEGUK92IeQTkcL1zCXWXYE6WF7Vc7uYsJc9YdIRl8pkpQ68Y
 b5voqUDnBGhhyFoyLHLsiRRvlK2ssQLvN8iUo4SBNVfvB2MfCP1IJl5xo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="336665923"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="336665923"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 09:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="577596142"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 02 Jun 2022 09:55:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Jun 2022 19:54:59 +0300
Date: Thu, 2 Jun 2022 19:54:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 01/13] drm/edid: add block count and data helper
 functions for drm_edid
Message-ID: <YpjrYx13Bh6Gwj68@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
 <a08352924ad49a32213d8979d43d480f3f7b4a11.1653381821.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a08352924ad49a32213d8979d43d480f3f7b4a11.1653381821.git.jani.nikula@intel.com>
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

On Tue, May 24, 2022 at 01:39:23PM +0300, Jani Nikula wrote:
> Add drm_edid based block count and data access helper functions that
> take the EDID allocated size into account.
> 
> At the moment, the allocated size should always match the EDID size
> indicated by the extension count, but this will change in the future.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 42 +++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 929fc0e46751..682d954a9e42 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1613,6 +1613,35 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
>  	return edid_block_data(edid, index + 1);
>  }
>  
> +static int drm_edid_block_count(const struct drm_edid *drm_edid)
> +{
> +	int num_blocks;
> +
> +	/* Starting point */
> +	num_blocks = edid_block_count(drm_edid->edid);
> +
> +	/* Limit by allocated size */
> +	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);

Hmm. Is there a particular reason we couldn't just always
return drm_edid->size/EDID_LENGTH here? That is, why would we not
set drm_edid->size to always reflect the actual size of the EDID?

> +
> +	return num_blocks;
> +}
> +
> +static int drm_edid_extension_block_count(const struct drm_edid *drm_edid)
> +{
> +	return drm_edid_block_count(drm_edid) - 1;
> +}
> +
> +static const void *drm_edid_block_data(const struct drm_edid *drm_edid, int index)
> +{
> +	return edid_block_data(drm_edid->edid, index);
> +}
> +
> +static const void *drm_edid_extension_block_data(const struct drm_edid *drm_edid,
> +						 int index)
> +{
> +	return edid_extension_block_data(drm_edid->edid, index);
> +}
> +
>  /*
>   * Initializer helper for legacy interfaces, where we have no choice but to
>   * trust edid size. Not for general purpose use.
> @@ -1665,8 +1694,8 @@ static const void *__drm_edid_iter_next(struct drm_edid_iter *iter)
>  	if (!iter->drm_edid)
>  		return NULL;
>  
> -	if (iter->index < edid_block_count(iter->drm_edid->edid))
> -		block = edid_block_data(iter->drm_edid->edid, iter->index++);
> +	if (iter->index < drm_edid_block_count(iter->drm_edid))
> +		block = drm_edid_block_data(iter->drm_edid, iter->index++);
>  
>  	return block;
>  }
> @@ -3574,22 +3603,21 @@ static int add_detailed_modes(struct drm_connector *connector,
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>  				  int ext_id, int *ext_index)
>  {
> -	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;
>  	const u8 *edid_ext = NULL;
>  	int i;
>  
>  	/* No EDID or EDID extensions */
> -	if (!edid || !edid_extension_block_count(edid))
> +	if (!drm_edid || !drm_edid_extension_block_count(drm_edid))
>  		return NULL;
>  
>  	/* Find CEA extension */
> -	for (i = *ext_index; i < edid_extension_block_count(edid); i++) {
> -		edid_ext = edid_extension_block_data(edid, i);
> +	for (i = *ext_index; i < drm_edid_extension_block_count(drm_edid); i++) {
> +		edid_ext = drm_edid_extension_block_data(drm_edid, i);
>  		if (edid_block_tag(edid_ext) == ext_id)
>  			break;
>  	}
>  
> -	if (i >= edid_extension_block_count(edid))
> +	if (i >= drm_edid_extension_block_count(drm_edid))
>  		return NULL;
>  
>  	*ext_index = i + 1;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
