Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EB19588AF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 16:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0168B10E7E5;
	Tue, 20 Aug 2024 14:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="MGQWZ7OX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010001.outbound.protection.outlook.com [52.101.128.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1190910E1EE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 12:59:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg+G/gj4E7SxAnjT4mncKaGA6JgDoD8V8z1sBa0pn8ugFcLPsjcCtoQQg46utkOpnYEsY+xVL3ZOvWOAVisDiE6t1mdHdYbI/beKQWlQd9hr3POtUWR/4VeJhUIQO1Rrh+2sBz5jokVbOweXVdHsPRiEDN+TTyUAluv5PUMtktAf0JCHgokVE7/OSkPwFfMcroBl5PH8MVltW6VY21YTgk1ClOkjFYqC11EGVB0FntYR+Zo5F19W1dX6L7qdRNdRU2yvDA6WiwZaSh4nBsXmIZSwSSHe1jL5uYM7t2pU4xcbKNS5RgeVp5tZCMWoYepXEEgPDSZldTwXotkcD6HkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRLw71wB4Ai1sE4Q8xSOt5qTsHe0+n8B+sr7C3Mo2R4=;
 b=d1Ov/uDVURApGqhYfFDVUHV78AqXhG4V09DxTiIuiPS/5MaVIjBQcw2eDGWWO7Qr4dC8/fr9a/RNZEpAJwVGAj9rqjT3GJ4RQTApMTJaDPFZZvnuhDQfqrrEC85mKQqwt25cmURG9r7d1buMN9gE6Tj4y1MSnf8UshHlGD97O93D1gKXop6oovv84C48lQ0NIYUfqAJk8Qa8MtXEDiDDDGp7iKeaPbjgpwOqTj5SxPqszVtk3Yms5EPGeMv9enScZ2u3Qm8mIZkM+jmbAyOXbfmPeE6SNVz/I/O2ewifQa/4LH8ZU7ee8iQvluoMjinD45VckK+q7U4Yp26kGI85yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRLw71wB4Ai1sE4Q8xSOt5qTsHe0+n8B+sr7C3Mo2R4=;
 b=MGQWZ7OXYYMLRHJa5+cmAKqGjCM/vpucaAgTDRzrd+psb9e8PQaJ9Uo4K99z4cwbnm1bNh6I+PO/FuCynWowCQtV97inM5ksfSgpZaKK1FWDkaHQroj4ScB/aAsrSRK3sj8zyFj1EKLL6JLPtK9rcB3uzsw4nhQRVa3sqt0RcGftQkrqrwXngyEIDx/Pwn/DpiYo/vk26ZenJ0D953NwtAXQU8GFsX4lFT/MfuoDAq9MIDJuorFAqOPpvGFylWFq52ZQEN18dL4Rey2KCm9nmBvwZPMS2j6phDe0NKQxNnxzlnNVePr0TiVMX/2kZ6Irano7zRllvIQgG3m/aijUIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 OSQPR06MB7156.apcprd06.prod.outlook.com (2603:1096:604:293::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 12:59:10 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 12:59:10 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
Date: Tue, 20 Aug 2024 20:58:40 +0800
Message-Id: <20240820125840.9032-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|OSQPR06MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd29964-a1fb-4564-4d13-08dcc117e221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cgOvvh88lGT4lSXy2QV5CxNUOABb6kPXPWGe8uGP/K6lGLYPGszoC5Wj4HNt?=
 =?us-ascii?Q?qerxS4Ae7tw5ya4Lh7Z78KtIgDIUGXb1pENDSXnV2rMUe7lt0GLsGu2IxHwf?=
 =?us-ascii?Q?onK6T+mAapdC+JqQYUaGdXyST/83JN7PwXSk6+fcOmCys7v/+RVmAPZVG4Lt?=
 =?us-ascii?Q?Cnya8YE1geIGrCixx3tNtC+PT/CumHga89blEEfPvAzai1FMafx92VdrGeNr?=
 =?us-ascii?Q?0Zm0PHhrxFOQFkBjSqghoG/+QWEpty/9O+AyjnoMGzoppBZ5hzkNtpPyY5ku?=
 =?us-ascii?Q?dR9BTp1+i27Ra9U1UryzQZQpjecPYwRPQWZDc5UjEWBZff+fZmlNkdDr8FYV?=
 =?us-ascii?Q?AkyRBv63vquWkhxaF9HqsmVXMAqRZwZSU/8ZtkyIq2dHEla6iUTMePzoVMXe?=
 =?us-ascii?Q?keTIhUQwanrsCrsHh2CzSxcoEEh7/RAvDlv5HTHmDo5lpXu2kPQ/stadFDF7?=
 =?us-ascii?Q?Um35uuzFA7txsl5O8ljzenvkrzN+rz5W6/2xtxUfCaemfuNANVaVzxJwheM2?=
 =?us-ascii?Q?Ngm0znz5ki1oypRO/RMAKR/zy6XvytO+RbmbR+2HbilqEFSblYt7DLrjmUSO?=
 =?us-ascii?Q?hRizRxcn/uXpwYiBjUZaGbr3j6s1MlcHTY9V5JKQ52D2ObJQwNzg90DrzzAq?=
 =?us-ascii?Q?uhoT1jB+Wnn28dvWsYxTYwscjgBzUnSKI69CZMuXShKYCRf030nvmqpW/xFY?=
 =?us-ascii?Q?ZyzuRSKb9ROzD2BQ3iFY58Y3ND4lYpoCc4n0JTsIlBilnJFtpuJGe73a1/Fs?=
 =?us-ascii?Q?Be8/jlAFyaatsQne3A98xVjt9/ORlAz8aMJ6KcW/Gl375Tqajz7ctj4J9Qds?=
 =?us-ascii?Q?taiW1FlFWM3XSWJ5pbjpaIXpxwhRE9sn7twj7UwrTadE6GptHmx6fD01eufk?=
 =?us-ascii?Q?xmccLWvCMZ9uMA8XH6flEEliSu4u5Lhrk1rVKuEvurspxoa7lEPW5ytB/WVz?=
 =?us-ascii?Q?+uFwKbBBUelcnGh4nSuD9Vnrh3qZ6GzhxVuHDuQs2qhpCuKf8RKJlCr+IzFX?=
 =?us-ascii?Q?CWVERMQc3mjv1Xy0ckjpDduJ71+vSbDVAleOVIRRT5jD8DBs+vClhyGWDDBV?=
 =?us-ascii?Q?KFX7DQ+lL1T3mOVhM8iTWSZC2sOBzE6HfwSHKQsn9Y6xgmLoE3dOp4slljoK?=
 =?us-ascii?Q?VpFctgS7JkBBVP2ObZhKt0YWaxcJxRin73bqyxVy1cJjVvXnyxmulBquA8fA?=
 =?us-ascii?Q?sBxjR5fiv29qf5jTBm/rw6EX8JBWi9kxiokC9RyrXqXnkCgIYYaRjIeSHN3S?=
 =?us-ascii?Q?iYWvgcYJ+pSz1yVU8+6F8T8U+eCInvmv1MGGQ/TLSNpUCiCNOvmMZoPrDpGE?=
 =?us-ascii?Q?p5Wyq6+uTB1ePbP/U56CLS/NPzO5RZynixmFI9+n45PFfznF/1zEeB6KbnVw?=
 =?us-ascii?Q?R2v+dbvmq0XLkxbtzyh09UtSDresq9kL1ueN/uP8bnRvZwD8I7zAHxq6f7dd?=
 =?us-ascii?Q?blmXTWEFmxQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lfhV+Ow0gyzViy0TjvqsBh4YqZ1bwXeE6G35QVHpu6RzRD0Gyk3zPPBPQyDP?=
 =?us-ascii?Q?CTree/RVRGROqHLj0gc3ehhYbyJn7GDxkqIegxlkp4g9M6WGTVkV8RMJZHH+?=
 =?us-ascii?Q?YeAWhusruUNGWE1xAAwyNiTftHleN02mT4QcD++H9Xo7BVUPMKscU9nRviRz?=
 =?us-ascii?Q?k+a29DkijDZ3JArBoe7DivYas9Y8MKWLBNkk9fPy+gJJgWgXUlB3wgez8DJ4?=
 =?us-ascii?Q?dTCgGIK3/6GRG+dEBU/LuT1FM9MA20n6FRMcAQ8Zj723RhGFTvujrIiVu85x?=
 =?us-ascii?Q?MulfZuFNel5fNpo33bIVlXSVuQkknJRglDb29U3Yb6u6CH4rqSY/jquMSKBP?=
 =?us-ascii?Q?SRx1xCgYJjZxNpk9rIo+kFeuA5Va01fjpYVOTAi3X5Prkvr5WTQu7Tdra5Ef?=
 =?us-ascii?Q?BQAs53Hdgq61NRpUOoJQ24imt5003p99CIPnL5me6TK+cHQd550KijNrJFsw?=
 =?us-ascii?Q?4xrBvVKrEQRLEX5JpWllMwQ1K/DxNKo4VBK2nCzo0imwhmP+tlKtDA7B/iVj?=
 =?us-ascii?Q?RQqLUNYlNRBH9YgTdJFc5rIt4LOq72LP014At5s0Op5/4tt1NYZk670H8vbK?=
 =?us-ascii?Q?RU43oZ7yT/M/yj5CM1fSC5PoJ2cz3S0ovvUwpDo0aPgEwP+7R3ZojMIME/Ep?=
 =?us-ascii?Q?c9LXqxKLIu06L/z29v9ujPsWxw8D0+skyz8ixGXi0bBL+dINWLjLjuzFritL?=
 =?us-ascii?Q?3TuZZ4zEnMhpyW/V3NeECJ+JIeA0u2EakRgapJqBnj7ZqeUdzqcY8k3sNyhT?=
 =?us-ascii?Q?+Ck70ur3JLqjmbMexrr3UH6Do21dEli2wU6NhbQDMxqZ+00UZRhKOG8fCLF3?=
 =?us-ascii?Q?YDh8vcm2/ZKp5E+ALrQ2rR7somSJQalX6vAUJekcM1As2+mPmmJRH56cHf20?=
 =?us-ascii?Q?KqtRJbkiiUoR8n7BV1LEAJYM9fgpu5EqraBubmlwPA4Ma2kH7M6pCgfCqmQ/?=
 =?us-ascii?Q?VfRIs11B+mQffFT1ndTmtWjaVsuRieedua8SNm7HhmKxN4bxsC1TdUFIxJjh?=
 =?us-ascii?Q?VBYFxwsGGKGQCiDv77GB9GKIy4k4AcU4BwyE49uKGCx5XwCxyBcUmdM6Yg3E?=
 =?us-ascii?Q?YrsEGMRKHl0tEoZSL1V3dBysNHU/xhfYpi70n2XE5YSvk4z0yEzW1CA5kYfg?=
 =?us-ascii?Q?sxg3IVPkw66JORqW92NeskooiwOPKMJDHIbyrETW+l1dcDljSgbjjNg71uZJ?=
 =?us-ascii?Q?UteO/1pEEpj6d+64ioyT3LpxISQwxVzu9rNzCmEEfnsgTdu3fMgYSXhrAx1h?=
 =?us-ascii?Q?z3KCVg3dUVg/Ksn05ICVWkk16LH5GDzRKpVInR+f9RsZxR4ghPBOy/xEcjPA?=
 =?us-ascii?Q?7PvtDuh3m5c0ugDgn6LiZvIyvV9visyB54SK/mNuSCsvvlm78+69m7mG/nx6?=
 =?us-ascii?Q?P7w4gf2gaGEo0/Mw/Dg2K+YL+HNhO2b5c/LcVXWi8D1lNCip92ReGqeMxiOP?=
 =?us-ascii?Q?kiWsWbZjTjBrUKxy8AekfUQWMo9OI1uVctJh1fm2146SZwtUGmcJ3LbTnIoe?=
 =?us-ascii?Q?5XP0cPewXAfqDr6H6uCOhj9g+j2GeBZYIGuqexK5uuQ2hykP58QO4MbSYGxC?=
 =?us-ascii?Q?SLs5wNk8K9uX3ldBnTiRTsB64TsGUUSXGjcc9qxU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd29964-a1fb-4564-4d13-08dcc117e221
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 12:59:10.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9EjIzLY3tAe72vreMAlE7Vrkz3JjEyWzf7raeS5Wc1/Do4QsEHN1PrjZLd2cGjOnx1apVXO/ab8l5OXHx9Wgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7156
X-Mailman-Approved-At: Tue, 20 Aug 2024 14:11:49 +0000
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

Replace devm_clk_get() and clk_prepare_enable() with =0D
devm_clk_get_enabled() that also disables and unprepares it on =0D
driver detach.=0D

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
 drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
 drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
 3 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fs=
l-dcu/fsl_dcu_drm_drv.c
index ab6c0c6cd0e2..057dceaf079e 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -284,16 +284,11 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
 		return PTR_ERR(fsl_dev->regmap);
 	}
=20
-	fsl_dev->clk =3D devm_clk_get(dev, "dcu");
+	fsl_dev->clk =3D devm_clk_get_enabled(dev, "dcu");
 	if (IS_ERR(fsl_dev->clk)) {
 		dev_err(dev, "failed to get dcu clock\n");
 		return PTR_ERR(fsl_dev->clk);
 	}
-	ret =3D clk_prepare_enable(fsl_dev->clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable dcu clk\n");
-		return ret;
-	}
=20
 	pix_clk_in =3D devm_clk_get(dev, "pix");
 	if (IS_ERR(pix_clk_in)) {
@@ -311,8 +306,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pd=
ev)
 			div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NULL);
 	if (IS_ERR(fsl_dev->pix_clk)) {
 		dev_err(dev, "failed to register pix clk\n");
-		ret =3D PTR_ERR(fsl_dev->pix_clk);
-		goto disable_clk;
+		return PTR_ERR(fsl_dev->pix_clk);
 	}
=20
 	fsl_dev->tcon =3D fsl_tcon_init(dev);
@@ -341,8 +335,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pd=
ev)
 	drm_dev_put(drm);
 unregister_pix_clk:
 	clk_unregister(fsl_dev->pix_clk);
-disable_clk:
-	clk_disable_unprepare(fsl_dev->clk);
+
 	return ret;
 }
=20
diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6=
i_drc.c
index 0d342f43fa93..f263ad282828 100644
--- a/drivers/gpu/drm/sun4i/sun6i_drc.c
+++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
@@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct de=
vice *master,
 		return ret;
 	}
=20
-	drc->bus_clk =3D devm_clk_get(dev, "ahb");
+	drc->bus_clk =3D devm_clk_get_enabled(dev, "ahb");
 	if (IS_ERR(drc->bus_clk)) {
 		dev_err(dev, "Couldn't get our bus clock\n");
 		ret =3D PTR_ERR(drc->bus_clk);
 		goto err_assert_reset;
 	}
-	clk_prepare_enable(drc->bus_clk);
=20
-	drc->mod_clk =3D devm_clk_get(dev, "mod");
+	drc->mod_clk =3D devm_clk_get_enabled(dev, "mod");
 	if (IS_ERR(drc->mod_clk)) {
 		dev_err(dev, "Couldn't get our mod clock\n");
 		ret =3D PTR_ERR(drc->mod_clk);
-		goto err_disable_bus_clk;
+		goto err_assert_reset;
 	}
=20
 	ret =3D clk_set_rate_exclusive(drc->mod_clk, 300000000);
 	if (ret) {
 		dev_err(dev, "Couldn't set the module clock frequency\n");
-		goto err_disable_bus_clk;
+		goto err_assert_reset;
 	}
=20
-	clk_prepare_enable(drc->mod_clk);
-
 	return 0;
=20
-err_disable_bus_clk:
-	clk_disable_unprepare(drc->bus_clk);
 err_assert_reset:
 	reset_control_assert(drc->reset);
 	return ret;
@@ -80,8 +75,6 @@ static void sun6i_drc_unbind(struct device *dev, struct d=
evice *master,
 	struct sun6i_drc *drc =3D dev_get_drvdata(dev);
=20
 	clk_rate_exclusive_put(drc->mod_clk);
-	clk_disable_unprepare(drc->mod_clk);
-	clk_disable_unprepare(drc->bus_clk);
 	reset_control_assert(drc->reset);
 }
=20
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/su=
n8i_mixer.c
index bd0fe2c6624e..ebf00676a76d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -507,19 +507,18 @@ static int sun8i_mixer_bind(struct device *dev, struc=
t device *master,
 		return ret;
 	}
=20
-	mixer->bus_clk =3D devm_clk_get(dev, "bus");
+	mixer->bus_clk =3D devm_clk_get_enabled(dev, "bus");
 	if (IS_ERR(mixer->bus_clk)) {
 		dev_err(dev, "Couldn't get the mixer bus clock\n");
 		ret =3D PTR_ERR(mixer->bus_clk);
 		goto err_assert_reset;
 	}
-	clk_prepare_enable(mixer->bus_clk);
=20
-	mixer->mod_clk =3D devm_clk_get(dev, "mod");
+	mixer->mod_clk =3D devm_clk_get_enabled(dev, "mod");
 	if (IS_ERR(mixer->mod_clk)) {
 		dev_err(dev, "Couldn't get the mixer module clock\n");
 		ret =3D PTR_ERR(mixer->mod_clk);
-		goto err_disable_bus_clk;
+		goto err_assert_reset;
 	}
=20
 	/*
@@ -530,8 +529,6 @@ static int sun8i_mixer_bind(struct device *dev, struct =
device *master,
 	if (mixer->cfg->mod_rate)
 		clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
=20
-	clk_prepare_enable(mixer->mod_clk);
-
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
=20
 	base =3D sun8i_blender_base(mixer);
@@ -592,8 +589,6 @@ static int sun8i_mixer_bind(struct device *dev, struct =
device *master,
=20
 	return 0;
=20
-err_disable_bus_clk:
-	clk_disable_unprepare(mixer->bus_clk);
 err_assert_reset:
 	reset_control_assert(mixer->reset);
 	return ret;
@@ -606,8 +601,6 @@ static void sun8i_mixer_unbind(struct device *dev, stru=
ct device *master,
=20
 	list_del(&mixer->engine.list);
=20
-	clk_disable_unprepare(mixer->mod_clk);
-	clk_disable_unprepare(mixer->bus_clk);
 	reset_control_assert(mixer->reset);
 }
=20
--=20
2.39.0

