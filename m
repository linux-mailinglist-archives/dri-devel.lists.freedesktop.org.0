Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD205A6BE00
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 16:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5C410E7DB;
	Fri, 21 Mar 2025 15:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jww2x2XA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8F310E7DB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 15:12:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25732220;
 Fri, 21 Mar 2025 16:10:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742569833;
 bh=KDNfUMZJWGgtp8pGF0mHPVBdyUrKLiXykRKQ5RtvBTw=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
 b=Jww2x2XA2RmdGHo0yQgj3FGO0yWBatNVYGkKRH51lApq/8nndsjc5KZFdc7FWMmzL
 YQm+ztVCb1YgAgIHjOPCXpChio7IuFdZEMcmoXPYpQ9kz6tHrK4aU2qmy2hphleWQT
 Z3MemBeloVtcWg2y+GYfDT4u1FkN5CakYeUkuG3A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Support dmabuf import
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 21 Mar 2025 15:12:14 +0000
Message-ID: <174256993443.3289779.5724572608037540450@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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

Hi Laurent,

Quoting Laurent Pinchart (2025-03-21 10:46:15)
> The rz-du driver uses GEM DMA helpers, but does not implement the
> drm_driver .gem_prime_import_sg_table operation. This  prevents
> importing dmabufs. Fix it by implementing the missing operation using
> the DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() helper macro.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Kieran, would you be able to test this ?

Thanks! This patch fixes display for me on the RZ/V2H Kakip to render
images from the Raspberry Pi v3 camera (IMX708) directly on the
Raspberry Pi v2 7" Touch screen display.

Without this patch I get the following errors (reconfirmed now)


"Unable to import framebuffer dmabuf: Invalid argument"

And with this patch - I can stream directly to the display in RGB888
with the extra enablement from Lad Prabhakar for DSI.

Thanks,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> # RZ/V2=
H + DSI=20

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.c
> index cbd9b9841267..5e40f0c1e7b0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -79,7 +79,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
> =20
>  static const struct drm_driver rzg2l_du_driver =3D {
>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
ATOMIC,
> -       .dumb_create            =3D rzg2l_du_dumb_create,
> +       DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(rzg2l_du_dumb_create),
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .fops                   =3D &rzg2l_du_fops,
>         .name                   =3D "rzg2l-du",
>=20
> base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
> --=20
> Regards,
>=20
> Laurent Pinchart
>
