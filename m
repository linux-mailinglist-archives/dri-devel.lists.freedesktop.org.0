Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA32DAF2F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD8F6E3B2;
	Tue, 15 Dec 2020 14:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCEF6E3B2;
 Tue, 15 Dec 2020 14:44:12 +0000 (UTC)
IronPort-SDR: wwahZhmUzioC3T8zgNHXALr29dr9zsa1W4wNNr5jM9eDkm6Lf0tA236ld8XCjlvBJHySylCc3U
 apRTtEp4TEsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="238986230"
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="238986230"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 06:44:11 -0800
IronPort-SDR: 274jQrRyRdV2o3YFMyJUX4JNIS7rDX25fDoWDOiM7ZDkP4TuVFCawXaR6OQAqDUbqYvmiYaw9g
 muU186HXCqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="411979356"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 15 Dec 2020 06:44:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Dec 2020 16:44:08 +0200
Date: Tue, 15 Dec 2020 16:44:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Message-ID: <X9jLt5p62uJ38cE7@intel.com>
References: <20201214174912.174065-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214174912.174065-1-jose.souza@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 09:49:08AM -0800, Jos=E9 Roberto de Souza wrote:
> Much more clear to read one function call than four lines doing this
> conversion.
> =

> Cc: dri-devel@lists.freedesktop.org
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/drm_rect.c | 15 +++++++++++++++
>  include/drm/drm_rect.h     |  2 ++
>  2 files changed, 17 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
> index 0460e874896e..24345704b353 100644
> --- a/drivers/gpu/drm/drm_rect.c
> +++ b/drivers/gpu/drm/drm_rect.c
> @@ -373,3 +373,18 @@ void drm_rect_rotate_inv(struct drm_rect *r,
>  	}
>  }
>  EXPORT_SYMBOL(drm_rect_rotate_inv);
> +
> +/**
> + * drm_rect_convert_16_16_to_regular - Convert a rect in 16.16 fixed poi=
nt form
> + * to regular form.
> + * @in: rect in 16.16 fixed point form
> + * @out: rect to be stored the converted value
> + */
> +void drm_rect_convert_16_16_to_regular(struct drm_rect *in, struct drm_r=
ect *out)
> +{
> +	out->x1 =3D in->x1 >> 16;
> +	out->y1 =3D in->y1 >> 16;
> +	out->x2 =3D in->x2 >> 16;
> +	out->y2 =3D in->y2 >> 16;
> +}

That's not the same as what we do in most places. We truncate
the width/height, not x2/y2. Doing it on x2/y2 may increase
the width/height.

So I suggest something more like:

static inline void drm_rect_fp_to_int(struct drm_rect *r)
{
	drm_rect_init(r, r->x1 >> 16, r->y1 >> 16,
		      drm_rect_width(r) >> 16,
		      drm_rect_height(r) >> 16);
}

to match the current way of doing things.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
