Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD66FC70F
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 14:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED64E10E0D5;
	Tue,  9 May 2023 12:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FBF10E0D5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683636701; x=1715172701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jm7y1445mWGdcBJyO2CI2gHNLLlTZ4MZzOJ1Vnswg3I=;
 b=psK1IGiTP7hT/e3+wt/xiaW5Ikz9LaJ28x9HPgQdTmFy37XCKTZEg4Fg
 itVaUzkLyM6m/mOpF3jcrvoIRrjg0F4fYnyJwyjlJUlDg1KJBL58jXpQB
 4gbGvWNStG5uAz6PGMi6LHf58x3vMRS+cntB9k0HaDIQ2X3Z8243o3Zh0
 8FU+IAq9FEnIPSLQS0PVGffyEGmpTRGfzhSR4qI3jlLo8KE269gTbVrBD
 fj2epXYgUJXdACGU5yjd75snE79WSZX3VDTVsuZx/AgW4FjaJ4XY09O24
 ejqcRhOqO5aEBkDvSIMOAj0W/c3C6TGHeEFPbH1CKtpDMTgqsqFWLP/w7 g==;
X-IronPort-AV: E=Sophos;i="5.99,262,1677538800"; d="scan'208";a="30805255"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 May 2023 14:51:37 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 09 May 2023 14:51:37 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 09 May 2023 14:51:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683636697; x=1715172697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jm7y1445mWGdcBJyO2CI2gHNLLlTZ4MZzOJ1Vnswg3I=;
 b=Jsa7kkBFfJ/TdgapI21KY9DeZ+2S8tO75xw7B4gIzuoOP4FRXT2fAswR
 HOnkAe4mKXRvkwO209KbC30kF2VLNernx3hJzHVIVvB8/gEefwv+3T+xD
 Ms0UeM4G4BKTfmVCHysUr/wJK5kz3+oaDA24AjH0Ug+lZukARoa3hcdEW
 NiV/Qbl2BOJI6h/9IleCb290kQr7xltNu+hzBDTZgwiMtX0o1vuJQEH1+
 cRtPjLKGikayA+dyBTtyzzdpeJk5Lge+OHF63gjPah6aaGHd9vcLKmeM7
 2rzfyDkSbvpov3U4ikq/tRmEFV0jp9NN9GmbEm50IQFCZ6oWfAEtKo21G Q==;
X-IronPort-AV: E=Sophos;i="5.99,262,1677538800"; d="scan'208";a="30805254"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 May 2023 14:51:37 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 11B8E280056;
 Tue,  9 May 2023 14:51:37 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Tue, 09 May 2023 14:51:36 +0200
Message-ID: <3231831.aeNJFYEL58@steina-w>
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

Hello,

another gentle ping.

Alexander

Am Dienstag, 17. Januar 2023, 12:08:00 CEST schrieb Alexander Stein:
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


