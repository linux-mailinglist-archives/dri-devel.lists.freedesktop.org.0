Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C911A8285B9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DAB10E3F3;
	Tue,  9 Jan 2024 12:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D644C10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bQ625XDZI1Bw1KRTaxwi1DlRlhK9DIqeFF1he49SjB4=; b=MdzHEr6Ai8b38I3tBE4G9qOXF9
 4fcNYvEQPvdBfE+8jO1sOsM74iAzExw7nwQc5IMpDwl9LKhdymwsxl6Jze+Ddl9Or18wwGbScxQ/1
 8yrxdFxVqqIvlBgeKFRuosBg22WghfV7tRsXhEP5+yoqFlpXBootpdoh7iJGX3U2Ni0L/JxejC3WD
 tSjukFMXr75zOLjaQbkwvkdRR4xCriIDrl4+EYoBMqqbGbMfPJ2AnHONXe/BQkVmJovmuXRCrq0gG
 rLlQldYpN3KT7xjtxx++r6q8W9Ol9oHntCeXiA36wKl3MK1Rz0SbsgCqP7CP93un3+6DMyGv4HVgJ
 E4STttGg==;
Received: from 193.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.193]
 helo=[192.168.0.101]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rNAtE-004YO7-K2; Tue, 09 Jan 2024 13:07:28 +0100
Message-ID: <bd40825bd189fa80bf4ec28492ce76f909299b29.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Fix support for register debugging on the RPi 4
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 09 Jan 2024 13:07:27 +0100
In-Reply-To: <20240109113126.929446-1-mcanal@igalia.com>
References: <20240109113126.929446-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Ma=C3=ADra!

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El mar, 09-01-2024 a las 08:30 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> RPi 4 uses V3D 4.2, which is currently not supported by the register
> definition stated at `v3d_core_reg_defs`. We should be able to
> support
> V3D 4.2, therefore, change the maximum version of the register
> definition to 42, not 41.
>=20
> Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D
> 7.x")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_debugfs.c | 20 ++++++++++----------
> =C2=A01 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c
> b/drivers/gpu/drm/v3d/v3d_debugfs.c
> index f843a50d5dce..94eafcecc65b 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -62,9 +62,9 @@ static const struct v3d_reg_def v3d_core_reg_defs[]
> =3D {
> =C2=A0	REGDEF(33, 71, V3D_PTB_BPCA),
> =C2=A0	REGDEF(33, 71, V3D_PTB_BPCS),
>=20
> -	REGDEF(33, 41, V3D_GMP_STATUS(33)),
> -	REGDEF(33, 41, V3D_GMP_CFG(33)),
> -	REGDEF(33, 41, V3D_GMP_VIO_ADDR(33)),
> +	REGDEF(33, 42, V3D_GMP_STATUS(33)),
> +	REGDEF(33, 42, V3D_GMP_CFG(33)),
> +	REGDEF(33, 42, V3D_GMP_VIO_ADDR(33)),
>=20
> =C2=A0	REGDEF(33, 71, V3D_ERR_FDBGO),
> =C2=A0	REGDEF(33, 71, V3D_ERR_FDBGB),
> @@ -74,13 +74,13 @@ static const struct v3d_reg_def
> v3d_core_reg_defs[] =3D {
>=20
> =C2=A0static const struct v3d_reg_def v3d_csd_reg_defs[] =3D {
> =C2=A0	REGDEF(41, 71, V3D_CSD_STATUS),
> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG0(41)),
> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG1(41)),
> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG2(41)),
> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG3(41)),
> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG4(41)),
> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG5(41)),
> -	REGDEF(41, 41, V3D_CSD_CURRENT_CFG6(41)),
> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG0(41)),
> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG1(41)),
> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG2(41)),
> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG3(41)),
> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG4(41)),
> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG5(41)),
> +	REGDEF(41, 42, V3D_CSD_CURRENT_CFG6(41)),
> =C2=A0	REGDEF(71, 71, V3D_CSD_CURRENT_CFG0(71)),
> =C2=A0	REGDEF(71, 71, V3D_CSD_CURRENT_CFG1(71)),
> =C2=A0	REGDEF(71, 71, V3D_CSD_CURRENT_CFG2(71)),
> --
> 2.43.0
>=20
>=20

