Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B43334798
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 20:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BAC6EA5A;
	Wed, 10 Mar 2021 19:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FF06E2B6;
 Wed, 10 Mar 2021 19:10:42 +0000 (UTC)
IronPort-SDR: jakf9GQLCQsEncvlFMGmL3k4VitlTHhRfnc1ke+6qJaEFrAFPOG4VL/fFLULQXr+JNll0e9glf
 3ie64fbDPm3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="186165035"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="186165035"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 11:10:40 -0800
IronPort-SDR: Btp3Itzl8w9KSNLASOiAc9XnDx8irfou9OPI54aCO7iGM8IZSZ2mJLl3D18Jd1dcOS1Tih4/ke
 DP0frKLl3dDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="409209965"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 10 Mar 2021 11:10:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Mar 2021 21:10:37 +0200
Date: Wed, 10 Mar 2021 21:10:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC v1 4/6] drm/edid: use the new displayid iterator for
 detailed modes
Message-ID: <YEkZrc3S1xao9IaU@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
 <ca35f536b8c6b25f518a56b443807256a40e7d2c.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca35f536b8c6b25f518a56b443807256a40e7d2c.1615297748.git.jani.nikula@intel.com>
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

On Tue, Mar 09, 2021 at 03:54:12PM +0200, Jani Nikula wrote:
> Neatly reduce displayid boilerplate in code. No functional changes.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 58e61f792bc7..fbaa7d679cb2 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5333,27 +5333,16 @@ static int add_displayid_detailed_1_modes(struct =
drm_connector *connector,
>  static int add_displayid_detailed_modes(struct drm_connector *connector,
>  					struct edid *edid)
>  {
> -	const u8 *displayid;
> -	int length, idx;
>  	const struct displayid_block *block;
> +	struct displayid_iter iter;
>  	int num_modes =3D 0;
> -	int ext_index =3D 0;
> -
> -	for (;;) {
> -		displayid =3D drm_find_displayid_extension(edid, &length, &idx,
> -							 &ext_index);
> -		if (!displayid)
> -			break;
>  =

> -		idx +=3D sizeof(struct displayid_hdr);
> -		for_each_displayid_db(displayid, block, idx, length) {
> -			switch (block->tag) {
> -			case DATA_BLOCK_TYPE_1_DETAILED_TIMING:
> -				num_modes +=3D add_displayid_detailed_1_modes(connector, block);
> -				break;
> -			}
> -		}
> +	displayid_iter_edid_begin(edid, &iter);
> +	displayid_iter_for_each(block, &iter) {
> +		if (block->tag =3D=3D DATA_BLOCK_TYPE_1_DETAILED_TIMING)
> +			num_modes +=3D add_displayid_detailed_1_modes(connector, block);
>  	}
> +	displayid_iter_end(&iter);
>  =

>  	return num_modes;
>  }
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
