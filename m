Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77026BF29AC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB0610E48E;
	Mon, 20 Oct 2025 17:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lbda9/2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BCD10E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:06:48 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 902D9E01;
 Mon, 20 Oct 2025 19:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1760979904;
 bh=SdTVhIypZQSLmzRemXZyCRh1Vyw5Q92t90ned3hjN7g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Lbda9/2P/UYvKmQybXSnc09/ONOUE04oF2ttWQxtML4FABex2HNExGFlyVer33PXR
 wuxv7us13oBixh1+N061X+xtgJ9dtQJmPf4omA0+bHZnYBw5GRWIf/wdbCzxNdVwMz
 nCZVC/4E+Tg4vZ8+ca0dDv2cu3BJ5QEs7JlUZoA4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
References: <20251017191634.1454201-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH next] drm: rcar-du: fix incorrect return in
 rcar_du_crtc_cleanup()
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: alok.a.tiwarilinux@gmail.com
To: airlied@gmail.com, alok.a.tiwari@oracle.com,
 dri-devel@lists.freedesktop.org, geert+renesas@glider.be,
 laurent.pinchart+renesas@ideasonboard.com, linux-renesas-soc@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com, mripard@kernel.org,
 simona@ffwll.ch, tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de
Date: Mon, 20 Oct 2025 18:06:44 +0100
Message-ID: <176098000464.199266.533603860929790380@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
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

Quoting Alok Tiwari (2025-10-17 20:16:21)
> The rcar_du_crtc_cleanup() function has a void return type, but
> incorrectly uses a return statement with a call to drm_crtc_cleanup(),
> which also returns void.
>=20
> Remove the return statement to ensure proper function semantics.
> No functional change intended.
>=20
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu=
/drm/renesas/rcar-du/rcar_du_crtc.c
> index 7e175dbfd892..22bcd7db4195 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
> @@ -993,7 +993,7 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crt=
c)

This cleanup is called through .destroy which is:
	void (*destroy)(struct drm_crtc *crtc);

>         rcar_du_crtc_crc_cleanup(rcrtc);
> =20
> -       return drm_crtc_cleanup(crtc);
> +       drm_crtc_cleanup(crtc);

and drm_crtc_cleanup is:
	void drm_crtc_cleanup(struct drm_crtc *crtc)

So it certainly can't return anything:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



>  }
> =20
>  static void rcar_du_crtc_reset(struct drm_crtc *crtc)
> --=20
> 2.50.1
>
