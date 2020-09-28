Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753427AE8F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 15:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D564989E0E;
	Mon, 28 Sep 2020 13:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7307F89E0E;
 Mon, 28 Sep 2020 13:02:40 +0000 (UTC)
IronPort-SDR: k2GsFVEF033j6lvbStwWYZOYL5HMpEZ5B/QIbyHSmrZQiG4I5P4fKQAcDPibWrH0SgT2ts69ln
 bcfaI5IrBCHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="162871208"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="162871208"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 06:01:45 -0700
IronPort-SDR: 2PYb7chxyfjfrLHr1gMCoPXK20Doql8Ipysr3XEkekNBhef/3QikprX/1U1qDPFgKsaDmmqgcW
 UeaWQB1ewDJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="340409775"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 28 Sep 2020 06:01:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Sep 2020 16:01:41 +0300
Date: Mon, 28 Sep 2020 16:01:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
Message-ID: <20200928130141.GV6112@intel.com>
References: <20200922210510.156220-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922210510.156220-1-lyude@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 05:05:10PM -0400, Lyude Paul wrote:
> While I thought I had this correct (since it actually did reject modes
> like I expected during testing), Ville Syrjala from Intel pointed out
> that the logic here isn't correct. max_clock refers to the max symbol
> rate supported by the encoder, so limiting clock to ds_clock using max()
> doesn't make sense. Additionally, we want to check against 6bpc for the
> time being since that's the minimum possible bpc here, not the reported
> bpc from the connector. See:
> =

> https://lists.freedesktop.org/archives/dri-devel/2020-September/280276.ht=
ml
> =

> For more info.
> =

> So, let's rewrite this using Ville's advice.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 409d38139b42 ("drm/nouveau/kms/nv50-: Use downstream DP clock limi=
ts for mode validation")
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> index 7b640e05bd4cd..24c81e423d349 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -231,23 +231,26 @@ nv50_dp_mode_valid(struct drm_connector *connector,
>  		   const struct drm_display_mode *mode,
>  		   unsigned *out_clock)
>  {
> -	const unsigned min_clock =3D 25000;
> -	unsigned max_clock, ds_clock, clock;
> +	const unsigned int min_clock =3D 25000;
> +	unsigned int max_clock, ds_clock, clock;
> +	const u8 bpp =3D 18; /* 6 bpc */

AFAICS nv50_outp_atomic_check() and nv50_msto_atomic_check()
just blindly use connector->display_info.bpc without any fallback
logic to lower the bpc. So Ilia's concerns seem well founded.
Without that logic I guess you should just use
connector->display_info.bpc here as well.

>  	enum drm_mode_status ret;
>  =

>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
>  		return MODE_NO_INTERLACE;
>  =

>  	max_clock =3D outp->dp.link_nr * outp->dp.link_bw;
> -	ds_clock =3D drm_dp_downstream_max_dotclock(outp->dp.dpcd,
> -						  outp->dp.downstream_ports);
> -	if (ds_clock)
> -		max_clock =3D min(max_clock, ds_clock);
> -
> -	clock =3D mode->clock * (connector->display_info.bpc * 3) / 10;
> -	ret =3D nouveau_conn_mode_clock_valid(mode, min_clock, max_clock,
> -					    &clock);
> +	clock =3D mode->clock * bpp / 8;
> +	if (clock > max_clock)
> +		return MODE_CLOCK_HIGH;

This stuff vs. nouveau_conn_mode_clock_valid() still seems a bit messy.
The max_clock you pass to nouveau_conn_mode_clock_valid() is the max
symbol clock, but nouveau_conn_mode_clock_valid() checks it against the
dotclock. Also only nouveau_conn_mode_clock_valid() has any kind of
stereo 3D handling, but AFAICS stereo_allowed is also set for DP?

> +
> +	ds_clock =3D drm_dp_downstream_max_dotclock(outp->dp.dpcd, outp->dp.dow=
nstream_ports);
> +	if (ds_clock && mode->clock > ds_clock)
> +		return MODE_CLOCK_HIGH;
> +
> +	ret =3D nouveau_conn_mode_clock_valid(mode, min_clock, max_clock, &cloc=
k);
>  	if (out_clock)
>  		*out_clock =3D clock;
> +
>  	return ret;
>  }
> -- =

> 2.26.2

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
