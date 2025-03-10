Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB05A58C91
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3514210E1AF;
	Mon, 10 Mar 2025 07:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="g1Nk77i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9245C10E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XVw0pob9jb2c3wftROgEMOXujGuWIlQHsT9fxfkDxSk=; b=g1Nk77i40nAWso/L2Z9Tw196wN
 3rrs9KH8j9H7yQRTeZS/iwFTWmuFDbwcczZqcTCgl+zJdFxV5XsaBL8n3wBaGOsW0sEhXsiFEQuuh
 g1u6mBbPvO6bpl2Ne//tGUWsyDqT+zJtty3PTrWrGxKJBtBAYDRzqPBs/6FF2PMorUPFtBW4p05J8
 XZLR5AWiadRT+D7AceDlWGsgwtcUWLtD8SHp2JmInfsEAQK/ej0f/rigHHJC0GAiMLPffSa4jOhyB
 f39nyU+PUsH2Qhm2ZP8mPZ/TbbxppWRYvFS5efCREAsbppAefXKalFWmJSX0nRhyIcWmUQZH6xRvu
 KSG/A0oQ==;
Received: from [159.147.169.180] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1trXLx-006NKD-AR; Mon, 10 Mar 2025 08:15:15 +0100
Message-ID: <b6c8114bc6d89755072eb89f0369ee574c919525.camel@igalia.com>
Subject: Re: [PATCH v2 3/6] drm/v3d: Associate a V3D tech revision to all
 supported devices
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com
Date: Mon, 10 Mar 2025 08:15:04 +0100
In-Reply-To: <20250308-v3d-gpu-reset-fixes-v2-3-2939c30f0cc4@igalia.com>
References: <20250308-v3d-gpu-reset-fixes-v2-0-2939c30f0cc4@igalia.com>
 <20250308-v3d-gpu-reset-fixes-v2-3-2939c30f0cc4@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El s=C3=A1b, 08-03-2025 a las 11:33 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> The V3D driver currently determines the GPU tech version (33, 41...)
> by reading a register. This approach has worked so far since this
> information wasn=E2=80=99t needed before powering on the GPU.
>=20
> V3D 7.1 introduces new registers that must be written to power on the
> GPU, requiring us to know the V3D version beforehand. To address
> this,
> associate each supported SoC with the corresponding VideoCore GPU
> version
> as part of the device data.
>=20
> To prevent possible mistakes, add an assertion to verify that the
> version
> specified in the device data matches the one reported by the
> hardware.
> If there is a mismatch, the kernel will trigger a warning.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_debugfs.c | 126 +++++++++++++++++++--------=
-
> ----------
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 ++=
+++--
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 ++=
+-
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-=
-
> =C2=A0drivers/gpu/drm/v3d/v3d_irq.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 6 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_perfmon.c |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A07 files changed, 101 insertions(+), 84 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c
> b/drivers/gpu/drm/v3d/v3d_debugfs.c
> index
> 76816f2551c10026a775e4331ad7eb2f008cfb0a..7e789e181af0ac138044f194a29
> 555c30ab01836 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -21,74 +21,74 @@ struct v3d_reg_def {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct v3d_reg_def v3d_hub_reg_defs[] =3D {
> -	REGDEF(33, 42, V3D_HUB_AXICFG),
> -	REGDEF(33, 71, V3D_HUB_UIFCFG),
> -	REGDEF(33, 71, V3D_HUB_IDENT0),
> -	REGDEF(33, 71, V3D_HUB_IDENT1),
> -	REGDEF(33, 71, V3D_HUB_IDENT2),
> -	REGDEF(33, 71, V3D_HUB_IDENT3),
> -	REGDEF(33, 71, V3D_HUB_INT_STS),
> -	REGDEF(33, 71, V3D_HUB_INT_MSK_STS),
> -
> -	REGDEF(33, 71, V3D_MMU_CTL),
> -	REGDEF(33, 71, V3D_MMU_VIO_ADDR),
> -	REGDEF(33, 71, V3D_MMU_VIO_ID),
> -	REGDEF(33, 71, V3D_MMU_DEBUG_INFO),
> -
> -	REGDEF(71, 71, V3D_GMP_STATUS(71)),
> -	REGDEF(71, 71, V3D_GMP_CFG(71)),
> -	REGDEF(71, 71, V3D_GMP_VIO_ADDR(71)),
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_HUB_AXICFG),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_UIFCFG),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT0),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT1),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT2),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_IDENT3),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_INT_STS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_HUB_INT_MSK_STS),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_CTL),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_VIO_ADDR),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_VIO_ID),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_MMU_DEBUG_INFO),
> +
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_STATUS(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_CFG(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_GMP_VIO_ADDR(71)),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct v3d_reg_def v3d_gca_reg_defs[] =3D {
> -	REGDEF(33, 33, V3D_GCA_SAFE_SHUTDOWN),
> -	REGDEF(33, 33, V3D_GCA_SAFE_SHUTDOWN_ACK),
> +	REGDEF(V3D_GEN_33, V3D_GEN_33, V3D_GCA_SAFE_SHUTDOWN),
> +	REGDEF(V3D_GEN_33, V3D_GEN_33, V3D_GCA_SAFE_SHUTDOWN_ACK),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct v3d_reg_def v3d_core_reg_defs[] =3D {
> -	REGDEF(33, 71, V3D_CTL_IDENT0),
> -	REGDEF(33, 71, V3D_CTL_IDENT1),
> -	REGDEF(33, 71, V3D_CTL_IDENT2),
> -	REGDEF(33, 71, V3D_CTL_MISCCFG),
> -	REGDEF(33, 71, V3D_CTL_INT_STS),
> -	REGDEF(33, 71, V3D_CTL_INT_MSK_STS),
> -	REGDEF(33, 71, V3D_CLE_CT0CS),
> -	REGDEF(33, 71, V3D_CLE_CT0CA),
> -	REGDEF(33, 71, V3D_CLE_CT0EA),
> -	REGDEF(33, 71, V3D_CLE_CT1CS),
> -	REGDEF(33, 71, V3D_CLE_CT1CA),
> -	REGDEF(33, 71, V3D_CLE_CT1EA),
> -
> -	REGDEF(33, 71, V3D_PTB_BPCA),
> -	REGDEF(33, 71, V3D_PTB_BPCS),
> -
> -	REGDEF(33, 42, V3D_GMP_STATUS(33)),
> -	REGDEF(33, 42, V3D_GMP_CFG(33)),
> -	REGDEF(33, 42, V3D_GMP_VIO_ADDR(33)),
> -
> -	REGDEF(33, 71, V3D_ERR_FDBGO),
> -	REGDEF(33, 71, V3D_ERR_FDBGB),
> -	REGDEF(33, 71, V3D_ERR_FDBGS),
> -	REGDEF(33, 71, V3D_ERR_STAT),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT0),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT1),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_IDENT2),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_MISCCFG),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_INT_STS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CTL_INT_MSK_STS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0CS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0CA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT0EA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1CS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1CA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_CLE_CT1EA),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_PTB_BPCA),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_PTB_BPCS),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_STATUS(33)),
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_CFG(33)),
> +	REGDEF(V3D_GEN_33, V3D_GEN_42, V3D_GMP_VIO_ADDR(33)),
> +
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGO),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGB),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_FDBGS),
> +	REGDEF(V3D_GEN_33, V3D_GEN_71, V3D_ERR_STAT),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct v3d_reg_def v3d_csd_reg_defs[] =3D {
> -	REGDEF(41, 71, V3D_CSD_STATUS),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG0(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG1(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG2(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG3(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG4(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG5(41)),
> -	REGDEF(41, 42, V3D_CSD_CURRENT_CFG6(41)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG0(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG1(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG2(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG3(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG4(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG5(71)),
> -	REGDEF(71, 71, V3D_CSD_CURRENT_CFG6(71)),
> -	REGDEF(71, 71, V3D_V7_CSD_CURRENT_CFG7),
> +	REGDEF(V3D_GEN_41, V3D_GEN_71, V3D_CSD_STATUS),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG0(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG1(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG2(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG3(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG4(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG5(41)),
> +	REGDEF(V3D_GEN_41, V3D_GEN_42, V3D_CSD_CURRENT_CFG6(41)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG0(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG1(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG2(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG3(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG4(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG5(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_CSD_CURRENT_CFG6(71)),
> +	REGDEF(V3D_GEN_71, V3D_GEN_71, V3D_V7_CSD_CURRENT_CFG7),
> =C2=A0};
> =C2=A0
> =C2=A0static int v3d_v3d_debugfs_regs(struct seq_file *m, void *unused)
> @@ -164,7 +164,7 @@ static int v3d_v3d_debugfs_ident(struct seq_file
> *m, void *unused)
> =C2=A0		=C2=A0=C2=A0 str_yes_no(ident2 & V3D_HUB_IDENT2_WITH_MMU));
> =C2=A0	seq_printf(m, "TFU:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %s\n=
",
> =C2=A0		=C2=A0=C2=A0 str_yes_no(ident1 & V3D_HUB_IDENT1_WITH_TFU));
> -	if (v3d->ver <=3D 42) {
> +	if (v3d->ver <=3D V3D_GEN_42) {
> =C2=A0		seq_printf(m, "TSY:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %s\=
n",
> =C2=A0			=C2=A0=C2=A0 str_yes_no(ident1 &
> V3D_HUB_IDENT1_WITH_TSY));
> =C2=A0	}
> @@ -196,11 +196,11 @@ static int v3d_v3d_debugfs_ident(struct
> seq_file *m, void *unused)
> =C2=A0		seq_printf(m, "=C2=A0 QPUs:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 %d\n", nslc * qups);
> =C2=A0		seq_printf(m, "=C2=A0 Semaphores:=C2=A0=C2=A0 %d\n",
> =C2=A0			=C2=A0=C2=A0 V3D_GET_FIELD(ident1, V3D_IDENT1_NSEM));
> -		if (v3d->ver <=3D 42) {
> +		if (v3d->ver <=3D V3D_GEN_42) {
> =C2=A0			seq_printf(m, "=C2=A0 BCG int:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %d\=
n",
> =C2=A0				=C2=A0=C2=A0 (ident2 & V3D_IDENT2_BCG_INT) !=3D
> 0);
> =C2=A0		}
> -		if (v3d->ver < 40) {
> +		if (v3d->ver < V3D_GEN_41) {
> =C2=A0			seq_printf(m, "=C2=A0 Override TMU: %d\n",
> =C2=A0				=C2=A0=C2=A0 (misccfg & V3D_MISCCFG_OVRTMUOUT)
> !=3D 0);
> =C2=A0		}
> @@ -234,7 +234,7 @@ static int v3d_measure_clock(struct seq_file *m,
> void *unused)
> =C2=A0	int core =3D 0;
> =C2=A0	int measure_ms =3D 1000;
> =C2=A0
> -	if (v3d->ver >=3D 40) {
> +	if (v3d->ver >=3D V3D_GEN_41) {
> =C2=A0		int cycle_count_reg =3D V3D_PCTR_CYCLE_COUNT(v3d-
> >ver);
> =C2=A0		V3D_CORE_WRITE(core, V3D_V4_PCTR_0_SRC_0_3,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V3D_SET_FIELD_VER(cycle_cou=
nt_reg,
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> b/drivers/gpu/drm/v3d/v3d_drv.c
> index
> 852015214e971c60f9939d34d893d8d8cb4e9b01..c63f0ed1bd8a3d5511085e76ed2
> fbd6ee7df6f80 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/dma-mapping.h>
> =C2=A0#include <linux/io.h>
> =C2=A0#include <linux/module.h>
> +#include <linux/of.h>
> =C2=A0#include <linux/of_platform.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/sched/clock.h>
> @@ -92,7 +93,7 @@ static int v3d_get_param_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0		args->value =3D 1;
> =C2=A0		return 0;
> =C2=A0	case DRM_V3D_PARAM_SUPPORTS_PERFMON:
> -		args->value =3D (v3d->ver >=3D 40);
> +		args->value =3D (v3d->ver >=3D V3D_GEN_41);
> =C2=A0		return 0;
> =C2=A0	case DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT:
> =C2=A0		args->value =3D 1;
> @@ -254,10 +255,10 @@ static const struct drm_driver v3d_drm_driver =3D
> {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id v3d_of_match[] =3D {
> -	{ .compatible =3D "brcm,2711-v3d" },
> -	{ .compatible =3D "brcm,2712-v3d" },
> -	{ .compatible =3D "brcm,7268-v3d" },
> -	{ .compatible =3D "brcm,7278-v3d" },
> +	{ .compatible =3D "brcm,2711-v3d", .data =3D (void *)V3D_GEN_42
> },
> +	{ .compatible =3D "brcm,2712-v3d", .data =3D (void *)V3D_GEN_71
> },
> +	{ .compatible =3D "brcm,7268-v3d", .data =3D (void *)V3D_GEN_33
> },
> +	{ .compatible =3D "brcm,7278-v3d", .data =3D (void *)V3D_GEN_41
> },
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, v3d_of_match);
> @@ -274,6 +275,7 @@ static int v3d_platform_drm_probe(struct
> platform_device *pdev)
> =C2=A0	struct device *dev =3D &pdev->dev;
> =C2=A0	struct drm_device *drm;
> =C2=A0	struct v3d_dev *v3d;
> +	enum v3d_gen gen;
> =C2=A0	int ret;
> =C2=A0	u32 mmu_debug;
> =C2=A0	u32 ident1, ident3;
> @@ -287,6 +289,9 @@ static int v3d_platform_drm_probe(struct
> platform_device *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, drm);
> =C2=A0
> +	gen =3D (enum v3d_gen)of_device_get_match_data(dev);
> +	v3d->ver =3D gen;
> +
> =C2=A0	ret =3D map_regs(v3d, &v3d->hub_regs, "hub");
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -316,6 +321,11 @@ static int v3d_platform_drm_probe(struct
> platform_device *pdev)
> =C2=A0	ident1 =3D V3D_READ(V3D_HUB_IDENT1);
> =C2=A0	v3d->ver =3D (V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_TVER) * 10
> +
> =C2=A0		=C2=A0=C2=A0=C2=A0 V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_REV));
> +	/* Make sure that the V3D tech version retrieved from the HW
> is equal
> +	 * to the one advertised by the device tree.
> +	 */
> +	WARN_ON(v3d->ver !=3D gen);
> +
> =C2=A0	v3d->cores =3D V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
> =C2=A0	WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
> =C2=A0
> @@ -340,7 +350,7 @@ static int v3d_platform_drm_probe(struct
> platform_device *pdev)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (v3d->ver < 41) {
> +	if (v3d->ver < V3D_GEN_41) {
> =C2=A0		ret =3D map_regs(v3d, &v3d->gca_regs, "gca");
> =C2=A0		if (ret)
> =C2=A0			goto clk_disable;
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index
> 9deaefa0f95b71b842f1c5bef2c6a8a8ffc21fe2..de4a9e18f6a9039edf57f406ab1
> cee9dad4c0a49 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -94,11 +94,18 @@ struct v3d_perfmon {
> =C2=A0	u64 values[] __counted_by(ncounters);
> =C2=A0};
> =C2=A0
> +enum v3d_gen {
> +	V3D_GEN_33 =3D 33,
> +	V3D_GEN_41 =3D 41,
> +	V3D_GEN_42 =3D 42,
> +	V3D_GEN_71 =3D 71,
> +};
> +
> =C2=A0struct v3d_dev {
> =C2=A0	struct drm_device drm;
> =C2=A0
> =C2=A0	/* Short representation (e.g. 33, 41) of the V3D tech
> version */
> -	int ver;
> +	enum v3d_gen ver;
> =C2=A0
> =C2=A0	/* Short representation (e.g. 5, 6) of the V3D tech revision
> */
> =C2=A0	int rev;
> @@ -199,7 +206,7 @@ to_v3d_dev(struct drm_device *dev)
> =C2=A0static inline bool
> =C2=A0v3d_has_csd(struct v3d_dev *v3d)
> =C2=A0{
> -	return v3d->ver >=3D 41;
> +	return v3d->ver >=3D V3D_GEN_41;
> =C2=A0}
> =C2=A0
> =C2=A0#define v3d_to_pdev(v3d) to_platform_device((v3d)->drm.dev)
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index
> b1e681630ded098de8aee691884368a959443812..1ea6d3832c2212d9cbbd9023647
> 8d18491f0ff14 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -25,7 +25,7 @@ v3d_init_core(struct v3d_dev *v3d, int core)
> =C2=A0	 * type.=C2=A0 If you want the default behavior, you can still
> put
> =C2=A0	 * "2" in the indirect texture state's output_type field.
> =C2=A0	 */
> -	if (v3d->ver < 40)
> +	if (v3d->ver < V3D_GEN_41)
> =C2=A0		V3D_CORE_WRITE(core, V3D_CTL_MISCCFG,
> V3D_MISCCFG_OVRTMUOUT);
> =C2=A0
> =C2=A0	/* Whenever we flush the L2T cache, we always want to flush
> @@ -58,7 +58,7 @@ v3d_idle_axi(struct v3d_dev *v3d, int core)
> =C2=A0static void
> =C2=A0v3d_idle_gca(struct v3d_dev *v3d)
> =C2=A0{
> -	if (v3d->ver >=3D 41)
> +	if (v3d->ver >=3D V3D_GEN_41)
> =C2=A0		return;
> =C2=A0
> =C2=A0	V3D_GCA_WRITE(V3D_GCA_SAFE_SHUTDOWN,
> V3D_GCA_SAFE_SHUTDOWN_EN);
> @@ -132,13 +132,13 @@ v3d_reset(struct v3d_dev *v3d)
> =C2=A0static void
> =C2=A0v3d_flush_l3(struct v3d_dev *v3d)
> =C2=A0{
> -	if (v3d->ver < 41) {
> +	if (v3d->ver < V3D_GEN_41) {
> =C2=A0		u32 gca_ctrl =3D V3D_GCA_READ(V3D_GCA_CACHE_CTRL);
> =C2=A0
> =C2=A0		V3D_GCA_WRITE(V3D_GCA_CACHE_CTRL,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gca_ctrl | V3D_GCA_CACHE_CTRL_FLU=
SH);
> =C2=A0
> -		if (v3d->ver < 33) {
> +		if (v3d->ver < V3D_GEN_33) {
> =C2=A0			V3D_GCA_WRITE(V3D_GCA_CACHE_CTRL,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gca_ctrl &
> ~V3D_GCA_CACHE_CTRL_FLUSH);
> =C2=A0		}
> @@ -151,7 +151,7 @@ v3d_flush_l3(struct v3d_dev *v3d)
> =C2=A0static void
> =C2=A0v3d_invalidate_l2c(struct v3d_dev *v3d, int core)
> =C2=A0{
> -	if (v3d->ver > 32)
> +	if (v3d->ver >=3D V3D_GEN_33)
> =C2=A0		return;
> =C2=A0
> =C2=A0	V3D_CORE_WRITE(core, V3D_CTL_L2CACTL,
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c
> b/drivers/gpu/drm/v3d/v3d_irq.c
> index
> 72b6a119412fa74f8771308e228305678a19ba43..29f63f572d35b7217e346f82b9a
> fb0957a42bd39 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -143,7 +143,7 @@ v3d_irq(int irq, void *arg)
> =C2=A0	/* We shouldn't be triggering these if we have GMP in
> =C2=A0	 * always-allowed mode.
> =C2=A0	 */
> -	if (v3d->ver < 71 && (intsts & V3D_INT_GMPV))
> +	if (v3d->ver < V3D_GEN_71 && (intsts & V3D_INT_GMPV))
> =C2=A0		dev_err(v3d->drm.dev, "GMP violation\n");
> =C2=A0
> =C2=A0	/* V3D 4.2 wires the hub and core IRQs together, so if we &
> @@ -200,7 +200,7 @@ v3d_hub_irq(int irq, void *arg)
> =C2=A0
> =C2=A0		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
> =C2=A0
> -		if (v3d->ver >=3D 41) {
> +		if (v3d->ver >=3D V3D_GEN_41) {
> =C2=A0			axi_id =3D axi_id >> 5;
> =C2=A0			if (axi_id < ARRAY_SIZE(v3d41_axi_ids))
> =C2=A0				client =3D v3d41_axi_ids[axi_id];
> @@ -217,7 +217,7 @@ v3d_hub_irq(int irq, void *arg)
> =C2=A0		status =3D IRQ_HANDLED;
> =C2=A0	}
> =C2=A0
> -	if (v3d->ver >=3D 71 && (intsts & V3D_V7_HUB_INT_GMPV)) {
> +	if (v3d->ver >=3D V3D_GEN_71 && (intsts &
> V3D_V7_HUB_INT_GMPV)) {
> =C2=A0		dev_err(v3d->drm.dev, "GMP Violation\n");
> =C2=A0		status =3D IRQ_HANDLED;
> =C2=A0	}
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c
> b/drivers/gpu/drm/v3d/v3d_perfmon.c
> index
> 3ebda2fa46fc4775c67d13d8f8131160ff6ca09d..9a3fe52558746e8523d4cf4ee43
> 3a90d94bffdbf 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -200,10 +200,10 @@ void v3d_perfmon_init(struct v3d_dev *v3d)
> =C2=A0	const struct v3d_perf_counter_desc *counters =3D NULL;
> =C2=A0	unsigned int max =3D 0;
> =C2=A0
> -	if (v3d->ver >=3D 71) {
> +	if (v3d->ver >=3D V3D_GEN_71) {
> =C2=A0		counters =3D v3d_v71_performance_counters;
> =C2=A0		max =3D ARRAY_SIZE(v3d_v71_performance_counters);
> -	} else if (v3d->ver >=3D 42) {
> +	} else if (v3d->ver >=3D V3D_GEN_42) {
> =C2=A0		counters =3D v3d_v42_performance_counters;
> =C2=A0		max =3D ARRAY_SIZE(v3d_v42_performance_counters);
> =C2=A0	}
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index
> 34c42d6e12cde656d3b51a18be324976199eceae..b3be08b0ca9188564f9fb6aa326
> 94940a5fadc9d 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -357,11 +357,11 @@ v3d_tfu_job_run(struct drm_sched_job
> *sched_job)
> =C2=A0	V3D_WRITE(V3D_TFU_ICA(v3d->ver), job->args.ica);
> =C2=A0	V3D_WRITE(V3D_TFU_IUA(v3d->ver), job->args.iua);
> =C2=A0	V3D_WRITE(V3D_TFU_IOA(v3d->ver), job->args.ioa);
> -	if (v3d->ver >=3D 71)
> +	if (v3d->ver >=3D V3D_GEN_71)
> =C2=A0		V3D_WRITE(V3D_V7_TFU_IOC, job->args.v71.ioc);
> =C2=A0	V3D_WRITE(V3D_TFU_IOS(v3d->ver), job->args.ios);
> =C2=A0	V3D_WRITE(V3D_TFU_COEF0(v3d->ver), job->args.coef[0]);
> -	if (v3d->ver >=3D 71 || (job->args.coef[0] &
> V3D_TFU_COEF0_USECOEF)) {
> +	if (v3d->ver >=3D V3D_GEN_71 || (job->args.coef[0] &
> V3D_TFU_COEF0_USECOEF)) {
> =C2=A0		V3D_WRITE(V3D_TFU_COEF1(v3d->ver), job-
> >args.coef[1]);
> =C2=A0		V3D_WRITE(V3D_TFU_COEF2(v3d->ver), job-
> >args.coef[2]);
> =C2=A0		V3D_WRITE(V3D_TFU_COEF3(v3d->ver), job-
> >args.coef[3]);
> @@ -412,7 +412,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
> =C2=A0	 *
> =C2=A0	 * XXX: Set the CFG7 register
> =C2=A0	 */
> -	if (v3d->ver >=3D 71)
> +	if (v3d->ver >=3D V3D_GEN_71)
> =C2=A0		V3D_CORE_WRITE(0, V3D_V7_CSD_QUEUED_CFG7, 0);
> =C2=A0
> =C2=A0	/* CFG0 write kicks off the job. */
>=20

