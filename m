Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C2D33938
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 17:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D3110E08C;
	Fri, 16 Jan 2026 16:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="ChRtAKmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A2E10E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=yI2XYSwTvVhb9DCV7BJIh+Gsz4vYaSmf6hvMKZExTCo=; b=ChRtAKmFPFgjEj2MJUr5lwxoqR
 6KHtYVPzSVyn9bFz7rHB0lcpr2sYi5ewutGrLY8qE1juhIvHX/67F94QnlB3wraAH2jbNuNpFg5au
 IUqv1YSIaYrLzsoah74DeYeyC1CmUwzF7yH9YPP5HtAeBisxSpCTqBnPNmEgNIBOKicSlpmLu1O1y
 FY2kEU9Bf++OXlUxM8zRYYOKoDsWM6GO0ZOI2Lb3Vm1/at800F8Mj1DJpFupJQn7TYh6twB4eg4a4
 vkvQRrNNTtUj5LtTcg3HNgxs/XmdZeQ5E6rbcPfIDuWwnTjBPBXkMzka6qXaS9py9cT8jz2tJ3N08
 kyeM9y5w==;
Received: from i53875a97.versanet.de ([83.135.90.151] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vgn0l-002eXq-JT; Fri, 16 Jan 2026 17:49:24 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Fri, 16 Jan 2026 17:49:23 +0100
Message-ID: <6509513.iIbC2pHGDl@diego>
In-Reply-To: <20260116005953.286225-1-andyshrk@163.com>
References: <20260116005953.286225-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Am Freitag, 16. Januar 2026, 01:59:49 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>

when resending an unmodified patch, please mark the subject as
[PATCH RESEND] ....

> Filter the mode that can't output by the crtc.

In commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
hardware capabilities") which introduced the similar check on VOP(1), we
had additional information, in that the VOP1 hardware does not have
an output height limit. Is the same true for VOP2 ?

Because then I'd like to extend the commit description to something like:
=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D
The different VOP variants support different maximum resolutions. Reject
resolutions that are not supported by a specific variant.

Only the output width is checked because the hardware itself does not
have a hard output height limit.
=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D

Because when someone sees the code later they might ask why the height
is not checked, so having that in the commit description allows us all to
remember why the check is this specific way :-)

Thanks
Heiko

> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..74fba29bfff3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1439,6 +1439,17 @@ static void vop2_crtc_disable_vblank(struct drm_cr=
tc *crtc)
>  	vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
>  }
> =20
> +static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> +						 const struct drm_display_mode *mode)
> +{
> +	struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> +
> +	if (mode->hdisplay > vp->data->max_output.width)
> +		return MODE_BAD_HVALUE;
> +
> +	return MODE_OK;
> +}
> +
>  static bool vop2_crtc_mode_fixup(struct drm_crtc *crtc,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adj_mode)
> @@ -1884,6 +1895,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc =
*crtc,
> =20
>  static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs =3D {
>  	.mode_fixup =3D vop2_crtc_mode_fixup,
> +	.mode_valid =3D vop2_crtc_mode_valid,
>  	.atomic_check =3D vop2_crtc_atomic_check,
>  	.atomic_begin =3D vop2_crtc_atomic_begin,
>  	.atomic_flush =3D vop2_crtc_atomic_flush,
>=20




