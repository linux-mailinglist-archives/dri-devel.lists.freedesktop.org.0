Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2842C6A40AA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A67D10E3B3;
	Mon, 27 Feb 2023 11:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A735710E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:31:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE23556A;
 Mon, 27 Feb 2023 12:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677497465;
 bh=v9QIMXHiIX2q45kNO/iBQh1aBflGm0hbfspKY5Q4vM8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=rcCmGVkR5kGXZcDVFczLGugTSbyk19ncTfZAOvnXe+SI2N/BtaB4GrobuxV3XPahH
 KFAd2Z0vxZkYG9rsMWMuHOXRKaAuE58S/+vDc7rIVzCsUwKS3sgAG0B0EleFZivYvD
 asixFwSgW/dmI6DOhsyKGtcT/gKuDyqBMGcfqgLo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y/yAw6sHu82OnOWj@kili>
References: <Y/yAw6sHu82OnOWj@kili>
Subject: Re: [PATCH] drm: rcar-du: Fix a NULL vs IS_ERR() bug
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Dan Carpenter <error27@gmail.com>
Date: Mon, 27 Feb 2023 11:31:02 +0000
Message-ID: <167749746289.93391.8800048490344197437@Monstersaurus>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dan Carpenter (2023-02-27 10:06:59)
> The drmm_encoder_alloc() function returns error pointers.  It never
> returns NULL.  Fix the check accordingly.

Yes, indeed. Thanks.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Fixes: 7a1adbd23990 ("drm: rcar-du: Use drmm_encoder_alloc() to manage en=
coder")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/=
rcar-du/rcar_du_encoder.c
> index b1787be31e92..7ecec7b04a8d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -109,8 +109,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>         renc =3D drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, =
base,
>                                   &rcar_du_encoder_funcs, DRM_MODE_ENCODE=
R_NONE,
>                                   NULL);
> -       if (!renc)
> -               return -ENOMEM;
> +       if (IS_ERR(renc))
> +               return PTR_ERR(renc);
> =20
>         renc->output =3D output;
> =20
> --=20
> 2.39.1
>
