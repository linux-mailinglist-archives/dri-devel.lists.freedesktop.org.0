Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F783347A0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 20:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D803889CCB;
	Wed, 10 Mar 2021 19:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34E889CCB;
 Wed, 10 Mar 2021 19:12:31 +0000 (UTC)
IronPort-SDR: UEaj4FXvBjV0F/tCh9reA3oewfaABI8pDNav1JdVUdP9z8fOryyF09L/Q9jHB3LAgB8IA1Oxmu
 1x5lCKrBB0Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="175648512"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="175648512"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 11:12:30 -0800
IronPort-SDR: HipzxYdw+gN21AwTQH3t+Ng6MKWD1GrE4t0kpDe9Vj6FXNA+TOtSRPrxBGtTz0nq/NG4HpuJ1z
 YEK5iUgf5JeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="372057886"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 10 Mar 2021 11:12:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Mar 2021 21:12:27 +0200
Date: Wed, 10 Mar 2021 21:12:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC v1 5/6] drm/edid: use the new displayid iterator for
 finding CEA extension
Message-ID: <YEkaG4HoEPME4OHa@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
 <8a527f66b856d6c099313046e028a18f9257baa8.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a527f66b856d6c099313046e028a18f9257baa8.1615297748.git.jani.nikula@intel.com>
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

On Tue, Mar 09, 2021 at 03:54:13PM +0200, Jani Nikula wrote:
> Neatly reduce displayid boilerplate in code. No functional changes.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index fbaa7d679cb2..4526e2557dca 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3266,35 +3266,28 @@ const u8 *drm_find_edid_extension(const struct ed=
id *edid,
>  =

>  static const u8 *drm_find_cea_extension(const struct edid *edid)
>  {
> -	int length, idx;
>  	const struct displayid_block *block;
> +	struct displayid_iter iter;
>  	const u8 *cea;
> -	const u8 *displayid;
> -	int ext_index;
> +	int ext_index =3D 0;
>  =

>  	/* Look for a top level CEA extension block */
>  	/* FIXME: make callers iterate through multiple CEA ext blocks? */
> -	ext_index =3D 0;
>  	cea =3D drm_find_edid_extension(edid, CEA_EXT, &ext_index);
>  	if (cea)
>  		return cea;
>  =

>  	/* CEA blocks can also be found embedded in a DisplayID block */
> -	ext_index =3D 0;
> -	for (;;) {
> -		displayid =3D drm_find_displayid_extension(edid, &length, &idx,
> -							 &ext_index);
> -		if (!displayid)
> -			return NULL;
> -
> -		idx +=3D sizeof(struct displayid_hdr);
> -		for_each_displayid_db(displayid, block, idx, length) {
> -			if (block->tag =3D=3D DATA_BLOCK_CTA)
> -				return (const u8 *)block;
> +	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_for_each(block, &iter) {
> +		if (block->tag =3D=3D DATA_BLOCK_CTA) {
> +			cea =3D (const u8 *)block;
> +			break;
>  		}
>  	}
> +	displayid_iter_end(&iter);
>  =

> -	return NULL;
> +	return cea;
>  }
>  =

>  static __always_inline const struct drm_display_mode *cea_mode_for_vic(u=
8 vic)
> -- =

> 2.20.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
