Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC97834D85F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 21:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD84A6E50C;
	Mon, 29 Mar 2021 19:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908F76E513;
 Mon, 29 Mar 2021 19:37:01 +0000 (UTC)
IronPort-SDR: ETZZuL/PIcggsLQrFT5E7DjuVKQht9/5zWB7w5QUx+lvnlQBfUyM/jfeNfJGQdVgJhBcyYrtn6
 G9lUm3H98xAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="189366329"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="189366329"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 12:37:01 -0700
IronPort-SDR: PZ3FW2MKxIC/26b+Z6VfdMfS2OSrIkJBqr8Q4kaJ2ktThqk8mj1Xsxgd/BDmUv0XhpbhNrL6d9
 G1KHE4qtKEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; d="scan'208";a="444738215"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 29 Mar 2021 12:36:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 29 Mar 2021 22:36:58 +0300
Date: Mon, 29 Mar 2021 22:36:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 7/8] drm/displayid: allow data blocks with 0 payload
 length
Message-ID: <YGIsWg0WccD4mzbi@intel.com>
References: <cover.1617024940.git.jani.nikula@intel.com>
 <d562dff99ba7c92accb654a99b433bed471e8507.1617024940.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d562dff99ba7c92accb654a99b433bed471e8507.1617024940.git.jani.nikula@intel.com>
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

On Mon, Mar 29, 2021 at 04:37:21PM +0300, Jani Nikula wrote:
> The DisplayID specifications explicitly call out 0 as a valid payload
> length for data blocks. The mere presence of a data block, or the
> information coded in the block specific data (bits 7:3 in offset 1), may
> be enough to convey the necessary information.
> =

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Though after looking at the current users it looks to me like
we're missing some block length checks. In particular
drm_parse_tiled_block() looks suspect. Judging by what I wrote
in cea_db_offsets() I think I once convinced myself that the
CEA ext block stuff is safe. And add_displayid_detailed_1_modes()
looks OK as well.

> ---
>  drivers/gpu/drm/drm_displayid.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displa=
yid.c
> index 902ff6114b68..e0b9e58a9dc8 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -77,8 +77,7 @@ displayid_iter_block(const struct displayid_iter *iter)
>  	block =3D (const struct displayid_block *)&iter->section[iter->idx];
>  =

>  	if (iter->idx + sizeof(*block) <=3D iter->length &&
> -	    iter->idx + sizeof(*block) + block->num_bytes <=3D iter->length &&
> -	    block->num_bytes > 0)
> +	    iter->idx + sizeof(*block) + block->num_bytes <=3D iter->length)
>  		return block;
>  =

>  	return NULL;
> -- =

> 2.20.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
