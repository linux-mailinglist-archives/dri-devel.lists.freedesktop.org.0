Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9466BD1B5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 15:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0108410E0BB;
	Thu, 16 Mar 2023 14:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B592310E0BB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 14:06:00 +0000 (UTC)
Received: from [62.91.42.93] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pcoEl-0001uw-A0; Thu, 16 Mar 2023 15:05:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org, 
 ndesaulniers@google.com, michael.riesch@wolfvision.net,
 s.hauer@pengutronix.de, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] drm/rockchip: vop2: fix uninitialized variable
 possible_crtcs
Date: Thu, 16 Mar 2023 15:05:46 +0100
Message-ID: <8664878.T7Z3S40VBb@phil>
In-Reply-To: <20230316132302.531724-1-trix@redhat.com>
References: <20230316132302.531724-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 16. M=E4rz 2023, 14:23:02 CET schrieb Tom Rix:
> clang reportes this error
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error:
>   variable 'possible_crtcs' is used uninitialized whenever 'if'
>   condition is false [-Werror,-Wsometimes-uninitialized]
>                         if (vp) {
>                             ^~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2336:36: note:
>   uninitialized use occurs here
>                 ret =3D vop2_plane_init(vop2, win, possible_crtcs);
>                                                  ^~~~~~~~~~~~~~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:4:
>   note: remove the 'if' if its condition is always true
>                         if (vp) {
>                         ^~~~~~~~
>=20
> The else-statement changes the win->type to OVERLAY without setting the
> possible_crtcs variable.  Rework the block, initialize possible_crtcs to
> 0 to remove the else-statement.  Split the else-if-statement out to its
> own if-statement so the OVERLAY check will catch when the win-type has
> been changed.
>=20
> Fixes: 368419a2d429 ("drm/rockchip: vop2: initialize possible_crtcs prope=
rly")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 03ca32cd2050..fce992c3506f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2301,7 +2301,7 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>  	nvp =3D 0;
>  	for (i =3D 0; i < vop2->registered_num_wins; i++) {
>  		struct vop2_win *win =3D &vop2->win[i];
> -		u32 possible_crtcs;
> +		u32 possible_crtcs =3D 0;
> =20
>  		if (vop2->data->soc_id =3D=3D 3566) {
>  			/*
> @@ -2327,12 +2327,11 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>  				/* change the unused primary window to overlay window */
>  				win->type =3D DRM_PLANE_TYPE_OVERLAY;
>  			}
> -		} else if (win->type =3D=3D DRM_PLANE_TYPE_OVERLAY) {
> -			possible_crtcs =3D (1 << nvps) - 1;
> -		} else {
> -			possible_crtcs =3D 0;
>  		}
> =20
> +		if (win->type =3D=3D DRM_PLANE_TYPE_OVERLAY)
> +			possible_crtcs =3D (1 << nvps) - 1;
> +

After a long hard stare at the code in question, I think doing it this
way looks like the correct one, as as you mention in the commit message
the first "if" will change the win->type to OVERLAY in one case, but this
then will never be added.

Michael, do you agree/disagree?


Thanks
Heiko

https://lore.kernel.org/r/20230315090158.2442771-1-michael.riesch@wolfvisio=
n.net

>  		ret =3D vop2_plane_init(vop2, win, possible_crtcs);
>  		if (ret) {
>  			drm_err(vop2->drm, "failed to init plane %s: %d\n",
>=20




