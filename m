Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEEC3347B8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 20:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB326E25B;
	Wed, 10 Mar 2021 19:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B2F6E25B;
 Wed, 10 Mar 2021 19:16:20 +0000 (UTC)
IronPort-SDR: SJFujEcii4Ax4uRAxS27Ua2H6MzJDouQVBNhFbfuefDV8YOJm61mMbk2D2TPKla6ZXZLRFb+gE
 xXLLGDy9LFRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="175649281"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="175649281"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 11:16:19 -0800
IronPort-SDR: iEu5E41QWqP8wldJmVDcRI7ZRmyKIi+SrLN8Jg0VFt5aw0px/n78Rf4+eRSVW0DfVxOw+8H1Jo
 bl9jyKj4x8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="438438134"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 10 Mar 2021 11:16:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Mar 2021 21:16:16 +0200
Date: Wed, 10 Mar 2021 21:16:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC v1 6/6] drm/edid: use the new displayid
 iterator for tile info
Message-ID: <YEkbAIWTqZ6MO8dT@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
 <96ad612f337691cc31ab25f6a661bf1d3721fab9.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96ad612f337691cc31ab25f6a661bf1d3721fab9.1615297748.git.jani.nikula@intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 09, 2021 at 03:54:14PM +0200, Jani Nikula wrote:
> Neatly reduce displayid boilerplate in code. Remove excessive debug
> logging while at it, no other functional changes.
> =

> The old displayid iterator becomes unused; remove it as well as make
> drm_find_displayid_extension() static.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Hopeuflly you tested with some of those weird EDIDs with
multiple DisplayID and/or CEA blocks ;)

I was thinking we should try to coalesce an iterator for
the CEA stuff as well...

> ---
>  drivers/gpu/drm/drm_displayid.c |  6 +++---
>  drivers/gpu/drm/drm_edid.c      | 37 +++++++--------------------------
>  include/drm/drm_displayid.h     | 12 -----------
>  3 files changed, 10 insertions(+), 45 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displa=
yid.c
> index 88070267aac9..b146f2d0d72a 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -33,9 +33,9 @@ static int validate_displayid(const u8 *displayid, int =
length, int idx)
>  	return 0;
>  }
>  =

> -const u8 *drm_find_displayid_extension(const struct edid *edid,
> -				       int *length, int *idx,
> -				       int *ext_index)
> +static const u8 *drm_find_displayid_extension(const struct edid *edid,
> +					      int *length, int *idx,
> +					      int *ext_index)
>  {
>  	const u8 *displayid =3D drm_find_edid_extension(edid, DISPLAYID_EXT, ex=
t_index);
>  	const struct displayid_hdr *base;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4526e2557dca..81d5f2524246 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5969,43 +5969,20 @@ static void drm_parse_tiled_block(struct drm_conn=
ector *connector,
>  	}
>  }
>  =

> -static void drm_displayid_parse_tiled(struct drm_connector *connector,
> -				      const u8 *displayid, int length, int idx)
> -{
> -	const struct displayid_block *block;
> -
> -	idx +=3D sizeof(struct displayid_hdr);
> -	for_each_displayid_db(displayid, block, idx, length) {
> -		DRM_DEBUG_KMS("block id 0x%x, rev %d, len %d\n",
> -			      block->tag, block->rev, block->num_bytes);
> -
> -		switch (block->tag) {
> -		case DATA_BLOCK_TILED_DISPLAY:
> -			drm_parse_tiled_block(connector, block);
> -			break;
> -		default:
> -			DRM_DEBUG_KMS("found DisplayID tag 0x%x, unhandled\n", block->tag);
> -			break;
> -		}
> -	}
> -}
> -
>  void drm_update_tile_info(struct drm_connector *connector,
>  			  const struct edid *edid)
>  {
> -	const void *displayid =3D NULL;
> -	int ext_index =3D 0;
> -	int length, idx;
> +	const struct displayid_block *block;
> +	struct displayid_iter iter;
>  =

>  	connector->has_tile =3D false;
> -	for (;;) {
> -		displayid =3D drm_find_displayid_extension(edid, &length, &idx,
> -							 &ext_index);
> -		if (!displayid)
> -			break;
>  =

> -		drm_displayid_parse_tiled(connector, displayid, length, idx);
> +	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_for_each(block, &iter) {
> +		if (block->tag =3D=3D DATA_BLOCK_TILED_DISPLAY)
> +			drm_parse_tiled_block(connector, block);
>  	}
> +	displayid_iter_end(&iter);
>  =

>  	if (!connector->has_tile && connector->tile_group) {
>  		drm_mode_put_tile_group(connector->dev, connector->tile_group);
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 27e06c98db17..10ee863f1734 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -96,18 +96,6 @@ struct displayid_detailed_timing_block {
>  	struct displayid_detailed_timings_1 timings[];
>  };
>  =

> -#define for_each_displayid_db(displayid, block, idx, length) \
> -	for ((block) =3D (const struct displayid_block *)&(displayid)[idx]; \
> -	     (idx) + sizeof(struct displayid_block) <=3D (length) && \
> -	     (idx) + sizeof(struct displayid_block) + (block)->num_bytes <=3D (=
length) && \
> -	     (block)->num_bytes > 0; \
> -	     (idx) +=3D sizeof(struct displayid_block) + (block)->num_bytes, \
> -	     (block) =3D (const struct displayid_block *)&(displayid)[idx])
> -
> -const u8 *drm_find_displayid_extension(const struct edid *edid,
> -				       int *length, int *idx,
> -				       int *ext_index);
> -
>  /* DisplayID iteration */
>  struct displayid_iter {
>  	const struct edid *edid;
> -- =

> 2.20.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
