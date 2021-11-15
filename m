Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AAE44FF2D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 08:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BF36E423;
	Mon, 15 Nov 2021 07:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300129.outbound.protection.outlook.com [40.107.130.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96176E423
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 07:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGqC/8OONTO8gvllLt5CtRpdUJHNzWxcR7w0tRckNYl8sWqq6zcquGvNn/p7D2keSl4XQnRWfEmAfOo4VD8ActzVyyTrxOp6lba/vNYMpRcZSYkvPmOW1PJDVhPTiwoQ1MUC3dEn2phONAe7+tIKFCKwbxQiGMdB1b70ezqoRcQ2rjHIA1G1LJ6i30ii7UetfMTbKR7f6Aii9s7E1Qlbtjl42rqXQZf1V4sgbemmN1cjhOcpxdv7FkZdMDxyeswi/5mCEhIdAu1W5H2mE+pIO70jsZqIuEp71/5NVs+81ZhzqW8UQOHtlW2w7fpFP8VfAhI+sb+UM1Kys6uhJ3jxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTco0NYI0CXMANGrX7EqDMTzGagUPr8X0bPyDBf+Wn4=;
 b=GWBiU0xgre4mCgeqyYTqRFnO0UXt14wjpW2l/LCMZsuuQw7TkjC1xo6TBCNiSPsmIjD8NgMig7GAY/Pv2IUO7FnlBZBwV2mh/wij1paanMSxpxQBJoNfPVQmIVStoQHOFomyK4xaF1R4U0rj4LCmVcnKacarOho1bXD+4uBM2beDlLgx8pM5gxqWUpy3ty8F1ykLIDJRJ2WfZelff+PKV1nq/tNsSvAVKue9menpLCa3APZmAHAMDtvG5Id+tJDOwRdwFk/7fG2Reknp2g53ZIbHvy9F3/4TfOLMLMuH+x5tdoFooRCnElJw0Byulmoz0W0S0pTLINbdD7Xdqbb2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTco0NYI0CXMANGrX7EqDMTzGagUPr8X0bPyDBf+Wn4=;
 b=WAoEmAo2EsYKRYZg/vRVslkvBPwnJuvnxezl6/5BHYbucwpEfikRhwqPjhmz6HP4yNJEaJaiZru3f/C6arbZKsz6mti2/BLepKPTJEkw2SLcdTMiSRlS2O/MDLKHTaxnuvlroW9Q9r/wGEMJivwXdIuQ5lHgumhV835N9+YeZ+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS1PR0601MB2042.apcprd06.prod.outlook.com (2603:1096:803:b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 07:24:10 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 07:24:10 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: remove useless type conversion
Date: Sun, 14 Nov 2021 23:23:59 -0800
Message-Id: <20211115072359.7534-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.190) by
 HKAPR04CA0018.apcprd04.prod.outlook.com (2603:1096:203:d0::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 07:24:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 392c7768-4ca5-4dd9-f5cb-08d9a808ea64
X-MS-TrafficTypeDiagnostic: PS1PR0601MB2042:
X-Microsoft-Antispam-PRVS: <PS1PR0601MB2042DD03C6D785D8B78D5E31DF989@PS1PR0601MB2042.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zOZtNOny+jZKKfo4emFRVYVqewKz6EN4s3AIIvsj7ODJudeXtMPuHtb+CyqBRolyXami4nYQAOivkPorNutz3LaPbJrZ6hydnQgPY1J7s6zMkM/+WptDx5Vig+D9YXGr0fU4oEEmyijTl7xKY4mKKNJvRC46bDyi0VL+UKoamqSVKgBsa93Nwkzts7ZHn6JwdzJt8CJPCGce65mOcVIev5MnAwWelrsmmh4R0IpxT7qhfVP0urJVyQAYkCbw8DEDRnfYfjNuFfMh4fCcpeVgH5ScSyEUPFsu30RaR2JhXPyDHYr8Mv6zRo2jPLgzOlK7/tCWoNIdGbNEEpzA3U2YeXoBeBT2isgkmrS0aZlubFR/9Cm6opOAXAKksPsvf1NEgTJxH5N7TvemB1mQdg0/kVriDTchs/6PPgJdvprLYgVsQLixpTd2S1iTMxSCWesBXeHGMijzyl6Xl3HQ3nyHz/eGeSZhi4W5MTAUki9FoJFyrVTQ69Hl3BpOZcv7LI2/Eot3Dd2jyrPajjg8HxnT5wkhj2xz9jdbTPTKh8FCeTazcLjWAj9jnvvsaft23fRqRH8LG4WcxHwvNgs5BstpohheV5OGMDrVuW4AZPJHoBpCQj/QGZGT0hCVz2gAV5otDr3r+a4kto3PtOCnrz1fX1NOaqoEch7OkSK8/Mrdme8jJPDTXUT+qNddVRirukuwd0jsai2u7zl1lfbjkBHJO0HXuGaGD2whZm5Vr3eNp/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(38100700002)(38350700002)(1076003)(4744005)(36756003)(83380400001)(66556008)(86362001)(66946007)(6486002)(921005)(66476007)(508600001)(110136005)(52116002)(316002)(8936002)(2906002)(6666004)(4326008)(8676002)(956004)(2616005)(26005)(186003)(6506007)(6512007)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T8o2S+zwSAFmpvrN/gfxw2sCPcBZQuCSaUErscpNAhEDD8MxrwR3o5AjwmDv?=
 =?us-ascii?Q?CEzd32wNk0j+73gYJgubwmlEhGyV4x34+coivFHvcWe6oxFI8EbSt7LDm83n?=
 =?us-ascii?Q?onkSKnhr1KzrUdqNnBpzz51lEdL1kgrzfKGvGKt6QFkuKA2gvDw70yBOtKab?=
 =?us-ascii?Q?cdtxow2wqbWnjRdv3wkQiTMUtILEvaiw4neR+IAJN4W9pt/RlW6TYy0D7kjP?=
 =?us-ascii?Q?c7RPROAtlCu3xQMAbYb+iaM1mLI/NSeipQPzg3aL0Q5DooN/TOwSbJEN6NyE?=
 =?us-ascii?Q?hRqfCr1ODevLETKotpAvsvjVyOUcJ/EwPimpLIpJGERyJM+zag2u74KXo2W7?=
 =?us-ascii?Q?D5klcAVnRvb7RB5JDqpcFg9XS5E+bB9jZARLXLxlcZ5hdUN4irbqBtt4N63u?=
 =?us-ascii?Q?G3+L4r7/D9BKa9zbMWg/DjYi1804xJKfazAu2TyRdW+dnLsvRSCh+mI66gh1?=
 =?us-ascii?Q?ze8x6EARSBiQIDzlIKltpUCqV5bT42iL1bVnqASQ9PmZpp1VeMoxJvGXwYBT?=
 =?us-ascii?Q?A4lbG9/b0t4nXMc2VO0RnIxpf/869jAEXJLjqgxCIp+hHaahrinrHzeq7xfk?=
 =?us-ascii?Q?HPOKXvEhgLWzd7i2PNnRsBEgoW1gE7blts+iiG34oR8qyUtf4I8ldAiFsSEY?=
 =?us-ascii?Q?oNzp7LVMlKb5zXK+znUO2TgNcdy+YVf3WPib5pYGLrzgIl/rNfcB1EulVRI0?=
 =?us-ascii?Q?j2QwdPdYFGnTK5GUFeTtWa3cg7lz38/oqL66DDGwykwmIvEwedaD/NVf+/iO?=
 =?us-ascii?Q?wfSB7mJ25TYi8EOVEvh1rg1DYzAo/1g7h4SXhc6bkmQ14BbEoMfzuw2w6c3y?=
 =?us-ascii?Q?Vu5OS5VoXFPhu0gFB//Ts+90oE4t5Jq+hXRmL4huLwbDc5lqv3jkQKY9Drx3?=
 =?us-ascii?Q?26QUkjdRRBAVEEIqZJF7l1sAuV8nx/J1Ir8YaH5Mjak3QFKMmcoEhcyMbZNC?=
 =?us-ascii?Q?em0ysDsjU30dSN84QA1PXopRcT5JY/3JeP/S1Fx5BiHCRyGwR+vxb9cHmAuC?=
 =?us-ascii?Q?MgKYK7ZKR5TrJ1HKfIUFlkNsDGwa3at5BRX1O/Q8l5EQijQ3Y0A82H9eF0sE?=
 =?us-ascii?Q?mlyYrM6S4claOc45JS0yvvHSYTUi/UfxOOcVB2ibUzR8ijex0a6o8ZEwO+Ln?=
 =?us-ascii?Q?/uzywYEAPr3z1UzQZNUU9YNeAQGPUB2HNVzQPcbj0w6PP+A5CL4kGMD965vn?=
 =?us-ascii?Q?qwL9o9MEJCZvv6HrQkwVvJdt67chFXlfwHoqZm17s8HnPjmR/aTdr4cmeyko?=
 =?us-ascii?Q?L2wvp5PbYkawyIVGrCwS2cdpwFQ39d5dHx8Yrt05W4GHq2fxnSoLlZNGl7E5?=
 =?us-ascii?Q?YU3wkQ51M4GusIQIXR6WSEy9RkbHRA4GewnUuNbuwaDn24mL5kesib1jAKh/?=
 =?us-ascii?Q?JOlPeTG4whX/drnse/aEnsVDcAPuSntfUxrOTOI8syoVyKzB3tNsaaPaqGpt?=
 =?us-ascii?Q?LZsX8JoeebvbQxXrLmXh9/6BDQi9AowBu+gqPdP74C1yic9ZuxyGGbuhzsok?=
 =?us-ascii?Q?TPsiA0FKjLu4oRL7w7V/B/nOFM8BZcDb+CO7l58yu+qqnrMoVGLmYecN4AlK?=
 =?us-ascii?Q?ON16rIDiz6hPC7Bleod7wk3FywXKGzB3ThVB8gv6wadvXC40SkfyQieowquH?=
 =?us-ascii?Q?X5xjS5FzbvYIVcCRuaUu7d8=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392c7768-4ca5-4dd9-f5cb-08d9a808ea64
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 07:24:10.1687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNvl8HpZi7zTXaRHars/gB5pgHXfb1l6h9dXON45WCmPWS792yjSweHlwgWK99+VVq2eSyBOx+DxlLWZaRcxEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB2042
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change is to cleanup the code a bit.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index ecfd82d0afb7..023f54ee61a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -782,8 +782,8 @@ static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
 
 	sc->hratio = (src_w << 14) / (dst_w << hfactor);
 	sc->vratio = (src_h << 14) / (dst_h << vfactor);
-	sc->up_h = (dst_w >= src_w) ? true : false;
-	sc->up_v = (dst_h >= src_h) ? true : false;
+	sc->up_h = (dst_w >= src_w);
+	sc->up_v = (dst_h >= src_h);
 	DRM_DEV_DEBUG_KMS(ctx->dev, "hratio[%d]vratio[%d]up_h[%d]up_v[%d]\n",
 			  sc->hratio, sc->vratio, sc->up_h, sc->up_v);
 
-- 
2.33.1

