Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4475C1CF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E88010E634;
	Fri, 21 Jul 2023 08:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E6B10E634
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689928574; x=1721464574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qscxoPZSRFlMdwz0omMr1+2f4St3n6ppordwMHd/tdI=;
 b=m9uHpqaKUXfhgxHzFbsL9FI6jDwNmI1OUx6LTTUentA/G16o4ztDfKr1
 sCfQoAXkgAxuUSdNWxpOc8X8v19ED0mADw451d/01BoTySbiOODAESMTR
 va9T9iY09OLCwqBLAsM/n5khqB9gv0Y5bE9luWXDxIRh7aNhfb2S8dPST
 fFQREtsoS8Ds0AYsUQ+ZeM/LOL+Y0lLxoANWEm7H+Nf7W+2biMS5egt2r
 fnidCiAlMQfRMoiq4Xjw+3a5yxRHICimWKY5zcv4LNwsQRhXj4/cpQG+X
 gMTV+XOx2K4UIiRDxartLwSFMPCYT1WQDVYiEkPBIRbPydxl6P47pX2wD A==;
X-IronPort-AV: E=Sophos;i="6.01,220,1684792800"; d="scan'208";a="32048717"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jul 2023 10:36:12 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9FCF4280078;
 Fri, 21 Jul 2023 10:36:12 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/1] drm/imx/ipuv-v3: Fix front porch adjustment upon
 hactive aligning
Date: Fri, 21 Jul 2023 10:36:10 +0200
Message-ID: <2644832.X9hSmTKtgW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
References: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Mittwoch, 3. Mai 2023, 13:14:56 CEST schrieb Alexander Stein:
> When hactive is not aligned to 8 pixels, it is aligned accordingly and
> hfront porch needs to be reduced the same amount. Unfortunately the front
> porch is set to the difference rather than reducing it. There are some
> Samsung TVs which can't cope with a front porch of instead of 70.
>=20
> Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> AFAICS ipu_di_adjust_videomode() checks that front porch is big enough to
> reduce the alignment difference.

A gentle ping. Is there anything to do? Or is someone picking this patch wa=
s=20
tested by Ian?

Best regards,
Alexander

>  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
> b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c index 1d306f7be9fd..341e9125bf2c
> 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
> @@ -311,7 +311,7 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc
> *crtc) sig_cfg.mode.hactive, new_hactive);
>=20
>  		dev_info(ipu_crtc->dev, "hfront_porch: %u\n",=20
sig_cfg.mode.hfront_porch);
> -		sig_cfg.mode.hfront_porch =3D new_hactive -=20
sig_cfg.mode.hactive;
> +		sig_cfg.mode.hfront_porch -=3D new_hactive -=20
sig_cfg.mode.hactive;
> dev_info(ipu_crtc->dev, "hfront_porch: %u\n", sig_cfg.mode.hfront_porch);
> sig_cfg.mode.hactive =3D new_hactive;
>  	}


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


