Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49786693F8A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2510E048;
	Mon, 13 Feb 2023 08:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B6410E048
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676276676; x=1707812676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=31mLu1XCJv6s/q55NYh6g4JWjHbIkglSzNS4CgoSaLE=;
 b=mQ+R6oljO5JwGFB2FmCQlae3Zho7U53mOZ57z0RQQRWYmBJsP4ko15VV
 fP5odgQTw+LtedpScQAPdFQzCjRU/eR2HLqLrMWCWVfDMNUBa7SqaA062
 hCOCX3XeUPOM6MH7u01PFam63GmFEuOuMZ5VfYgatsKJdrTPSrm3Tr6jd
 H7PAWSYwxKHwvD0mT2kdsZHyYoK2MbyQ8jty7IBJ8f/47hWRi79n2iJtd
 hjQUxYtICkQxIEbHEY7KT+u+uZ3GQ9rQxgi0NOFv6grFeei7uNb65l+5o
 OOtA02agqLwGNwPZZPirjsQt8x+teKWI5+6I2xIL3+h6WaUKSQpzf41n1 g==;
X-IronPort-AV: E=Sophos;i="5.97,293,1669071600"; d="scan'208";a="29034609"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Feb 2023 09:24:33 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 13 Feb 2023 09:24:33 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 13 Feb 2023 09:24:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676276673; x=1707812673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=31mLu1XCJv6s/q55NYh6g4JWjHbIkglSzNS4CgoSaLE=;
 b=HpPqhA/c9VJSc31UvwY706TdvSj3Y5KgPGJbiEAD4f28mB44nnw6jEtQ
 Gr205DgFCU6ayHQ8ZurAnjSuYmwzWPjOtXotazOh5pEGoia9TTUk1KTN0
 5j/FY0tIxHGkiUvx3h3Xn5ihxzvS4qW8q7SAHMdzqx0iE8VOfFFYJ4GYJ
 zZMT6D9tvU1dmezV0PjtUypKyu120p8HJkbj6Fy+RcA2Di0ENgE8abbzb
 7EqlWzKXWtk1QEl0IHyJZqyFttVitJkMZEiAIJPgfSL86EHpmpQTEL3TC
 As3yBHcuqY3ozqVueVIKHzYkWhm07WGfV2lGcOPD7jKPfUj/ufOQnRINH w==;
X-IronPort-AV: E=Sophos;i="5.97,293,1669071600"; d="scan'208";a="29034608"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Feb 2023 09:24:33 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 67119280056;
 Mon, 13 Feb 2023 09:24:33 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Mon, 13 Feb 2023 09:24:33 +0100
Message-ID: <2275894.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230117110801.2069761-1-alexander.stein@ew.tq-group.com>
References: <20230117110801.2069761-1-alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

any feedback on this series?

Best regards,
Alexander

Am Dienstag, 17. Januar 2023, 12:08:00 CET schrieb Alexander Stein:
> fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
> to remove an invalid error message and add it to deferral description.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c index
> 8579c7629f5e..418887654bac 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -103,10 +103,8 @@ static int fsl_dcu_load(struct drm_device *dev,
> unsigned long flags) int ret;
>=20
>  	ret =3D fsl_dcu_drm_modeset_init(fsl_dev);
> -	if (ret < 0) {
> -		dev_err(dev->dev, "failed to initialize mode setting\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev->dev, ret, "failed to initialize=20
mode
> setting\n");
>=20
>  	ret =3D drm_vblank_init(dev, dev->mode_config.num_crtc);
>  	if (ret < 0) {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


