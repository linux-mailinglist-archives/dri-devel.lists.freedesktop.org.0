Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED714B2DD6F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7498D10E732;
	Wed, 20 Aug 2025 13:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="UbQQj6rf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013039.outbound.protection.outlook.com
 [40.107.44.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CF510E731;
 Wed, 20 Aug 2025 13:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XN8kYoi1osy0etS1TrfgWdUvgqONQBHlovr7dp85jSVhK3ykymd8Z3q+Y0FUVjgza9qCWU/r6Ruev2j8dGDcek6rwzLMBhBSg03QTb2oFDkb+2hMjzpSTfpb8LYTVFfOJczRT9splLU+/m/YTKbzqiRFOq4am+BFrc0xDGFwNzFVOZCGaJjDbZFsPrmxiH9zl/v7JH7bIsx6bGi2mp8Y/FnCC5ka1Cxh2rewiiVVzDMk6F+boBl/Jr0hNZVuMptWaiBnTlXytyE/yYfy0e+G2W1Z/wThHtFTll0qXc/+JhgexeRLmiL6e2lXaghrLJHPNHCmVqTuFqbZpirWvqAvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHQOiioXwQMUvS7GxfjyTuit3kLANlCAJYdTjDWb0p8=;
 b=lGigkV2lAynt8gI78PbTOp2bVhwiNlwaod8mQDl7Lp2gQXWgtA9xnXR13QaxbAI5OmnTnAvsheZiT8B/T4/pdx6ySYswnvV/JHwEGLs+8FthmBJe55jABkXIXzjHI9/9TBjpV/d+5FcDwmGUVVWbS+aL8fMUgZSbVVAf3JZS7heQiIzFh+V4Z+s9RyMb7JnJXtEKkC8OIvguwedZPna4+9EGEexBBC3k6wroxvM/7HXs2SNu+ywDZpNmwYPw+Vu7bsA/pXbw2Yng26En+2qwdeUO59N27XOdDbwm3gEZbzgQvxz/0MCiuYTirH5+xOtcMhsUeBCjq9Sl85kWPzWBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHQOiioXwQMUvS7GxfjyTuit3kLANlCAJYdTjDWb0p8=;
 b=UbQQj6rfix5guKtPSmrGwdg/bHln1bVL0eFM8LAODbxevBNF/wjaX8cv4MKSIGCzTe+FLV+oiBBc76M6DaxHTstDWd9TGQLBpi94ilKuzets3xP9S4qptXIJbKOAFAbxFnIr6uLQnTiGJJgAzTYnFhJaZYEAod0uS1Y7KmatoprzUfbA3NdGxCZ96Bw3r21krHtf5wI86WvJjpph/GbHgdbw/Gqfyt/sU+6KyNgeLVkpJ4By0pGyymyUxwcH0zMMnX4HbcFTTN2StUoBoQnArv7cgxpHbtohoQgI6kP//AieymuwQT3AhxyH5dlkR7rTH+W/lpm76NenVwb0D+AhgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB5994.apcprd06.prod.outlook.com (2603:1096:820:d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 13:13:13 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 13:13:13 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/msm/mdp4: remove the use of dev_err_probe()
Date: Wed, 20 Aug 2025 21:12:56 +0800
Message-Id: <20250820131300.499727-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::22) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 58bf72ea-0e8d-4a16-a680-08dddfeb50e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|52116014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HE2mQ4HEw/cXJ/62McHBs0g4DbaFmammQjcoPGwFEdSSiIL80aSee8PBHuN9?=
 =?us-ascii?Q?C+V8v6G1LcTpyNSa/JofC2GTHsSf/H6Ykuwu2ULoR5zyoeFqQ1AUFIusPDAa?=
 =?us-ascii?Q?akAAOeYen0HuMiKDX/j++UfJKTe4b/iGmeXzVP/6K68ipDauuS8NPGRJsmMG?=
 =?us-ascii?Q?JHuTJ6CVFvyfderThRyCWs/eKXRu+vsrVGrf+EqQ1PQCgohuTjDFYiB4uthO?=
 =?us-ascii?Q?DPqppBgJw0SWSD+4Jmqbz7O+anU4cfKwX5AOsUT38dXhBUVJm1qVW4/OwvcG?=
 =?us-ascii?Q?ZcmgzjFZOxnkhRC2/9o6uSvN851cuSsjAq4K/J0oVp3tMF3AGPuykcjBZ7PV?=
 =?us-ascii?Q?iyK4LRqcN6/baezY/KQOK8MxeiFjzLitlfn+Fc1H0T10JU65fcRRjUsgJ2rN?=
 =?us-ascii?Q?6q7frKHVhL41640NP2BRmQn9s9BJ1/ZXaWvhnLUeBonwMqaFuzwCUJvx6HH3?=
 =?us-ascii?Q?jTE4ZRvHE/RMcB0khsLPRUqg6TH6Np5thFB8TEx4I5wf/a0NM5Ih6HtEdKZ9?=
 =?us-ascii?Q?w93Wz6f2clnNAAgF3IdD7dzUB3TOqvAmkiAoOjEo8coVTjLmx4OYO31DqHLT?=
 =?us-ascii?Q?OjCipjVqKjaRmpOXquHouyXfvYD7hkMstV9W46H13Q8kM+oM/vJ0FyMC1Iar?=
 =?us-ascii?Q?ukXHQ/pk+I+FYkZr5q6VyasaBa3D5Bi/ugAfGQfNpmV+zvfYcwo6nMo1enzS?=
 =?us-ascii?Q?Es4+Fb16xziIjRqiSYvimMIzQxDGKkYNUh4kqxGTf4BwtUUAAXpeh/sL4TAW?=
 =?us-ascii?Q?ZzNfy/TOAGSoMJdR+fBwx7XGJMDjzzIt+P9heyrVM7bOcwGdIzYCBTCMnjUC?=
 =?us-ascii?Q?IeLBiRLlyaaYbx/Rx9DctAFz5SEA2DceiRhDLm7fbxtNyCIiIv/MD3QTBctV?=
 =?us-ascii?Q?c5EMjSgqG5UcQq6rR6dRUxGLK5EaB9TpsrS1JfJKPiC2gq6wiHANCJeqBzxj?=
 =?us-ascii?Q?h0QwatAv0/TFTBhZgVAmdgEsw13VOaZI/9wnlm/Eg20YMZaOw2Lw3B9atNSj?=
 =?us-ascii?Q?pO50YuzQGVUfWtvtvBoMIXTvrZ+HcBTbsXHgUyYsuEErK6jbD7il6//d55Ui?=
 =?us-ascii?Q?b+pawO6eYMOeQGiqrcrObdA6zRg+VwczVfjQFwJyvkrYWAWqN9Yp57oqnr2y?=
 =?us-ascii?Q?ss8BmXkwjNvrXP6y9piL8k2tkavUrBBi8uj2a8FnJSwws3f6DeWyZRfTmNNI?=
 =?us-ascii?Q?ykd5jev9PNmfs2TIRZ+aQBS0JwKDwCfp5plpXk01Xv3sJl2NKy5GOi/bnKH4?=
 =?us-ascii?Q?nwzhkoyPAxVZSTrxVoO6vDEAg6RZQvoPoYaCQ2N6xkjv4f5ibBTrS1H8trqx?=
 =?us-ascii?Q?p8GR2FYUbnBi6Z+hPcRnizSmISpLwK39b5LDupR4oI0GDHLKeKr/6iCheHyF?=
 =?us-ascii?Q?BrJUg9ZXEXM0wbAQRrwuYUEa/Ab0GWf/Fo7De2tO19SAwn1n+kWQ0JFznQR5?=
 =?us-ascii?Q?BdV3ZkUdlHLO/9uoEZINyT3eeF+L4Bl9EtlYlxbIxfdHlOd1TyB+GzsnepZl?=
 =?us-ascii?Q?Jl+sGF7DrZQNuJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JmuYHhS96Gw0tkjed8Klv6GsXRgZHI9Whv4qyjfew7T0jCYk8hzmYKtI2ThX?=
 =?us-ascii?Q?mx+mH6FVzrNhnrv0Q98d4Gsh7q55f1oHByw/DGOLRQkJn5lHU5JuZ0hzHXTq?=
 =?us-ascii?Q?kA2aqlFFRsAA1TJDEJWti6sl4Z9Y1zr5kPgJ/0txXDuKI1Ve5F4bjrtc91TU?=
 =?us-ascii?Q?OxVveRWOyzX+pzWXwFKsRy0aiiP7IC38mlBIjUZrDMcTi+ptPtlbjFj8eH2y?=
 =?us-ascii?Q?nAQlm4w3RvFSy7kGbOd8FzcG0WfiXLNbc3gXCoewKBJLwyDEQnN/DNjlmoom?=
 =?us-ascii?Q?rrBQbreBGf6sebk1+l5T95nUJuwmqUptXMW3u+oVfe+MNk2Cgplo9wM4yT4F?=
 =?us-ascii?Q?MXZfCPXkPH7pikpLPhnZMlsuNX1X1v9gzJXiLXXmoCdnUBDcKF4HFICdk8OR?=
 =?us-ascii?Q?qzBdQ9r9Vs3E+Z43YEytbYSmmtuquoXBJk5ZaIouw7ZKhbfMUxTERfbNpoEk?=
 =?us-ascii?Q?L+7fXfbEprbPSUlCd4qUjG5AkJsPWYFJb8N9ITio7Ijiu0B5zZhe5Ld9R48I?=
 =?us-ascii?Q?uyasdeLciIAClLclCa9AHhDWZUeFmPQT8alegD9QDCCAYY69rRO0roJyhy4X?=
 =?us-ascii?Q?8YabByxHBAqg99qkzxuG2hySIMOExewm8xcHmx0Bt5R6Gnfb72JSJdkUUZPt?=
 =?us-ascii?Q?FH2pBkwBoV46DLWc4h8OT1p2DNM11Aivemxkhdhyicc/KOmeidUcooQd2lqG?=
 =?us-ascii?Q?YccgexmaHEqD+sFD4Hq3JNfAWAXp4DAd9wwNPPXPYOOjOoITM79PpKIzLcVb?=
 =?us-ascii?Q?mZwSdY5VAit3nPdRS1XarwVsG3UN/9zE4m2QFBXZ58oROnWC2MADxz83qgZF?=
 =?us-ascii?Q?Z/HFUnDARKmKWgZ8Kay3bcVaAmxEe5lPMJ0CM6QOBd9ATk3lMz3DfjxyKqy6?=
 =?us-ascii?Q?dFVOOp16fmBNsUoySdPT1Wz+kYcVCiGL3znydKOsGu34BeNopzMSS5dG2uow?=
 =?us-ascii?Q?SkO6b/cIVStziBnh0qgNtIS9nL9YWqi/DRKNLPRhx+ULOvySYZdMfs33/IDi?=
 =?us-ascii?Q?FHZQ5bRbGriSHCASOCjPSOMQogN6TfNk817e38+Qf3VPfW5shnUMGVIQkbjy?=
 =?us-ascii?Q?Y7ahQ+Xv0OAX9SxhedmIp507Xb7D5W2B0V3uUl6KU5DW6Jl7AIjHpW136G3F?=
 =?us-ascii?Q?wTxMMS898e1OuG1+FBT/TaWiOOLqbToZnXkZmPOSP9RgQ+vuUlhAsSqFalI8?=
 =?us-ascii?Q?sTcP+JN4E0G4pksS7bzII2vnDelsor6Fp1SFHzx1BWsdRC1+4qzjwgot5g7/?=
 =?us-ascii?Q?WVgHjgqprELdupSsBqK2EcxAblfznaYk99AXF2gEZ7Apa1ckIzgWhvx0FJte?=
 =?us-ascii?Q?zxT46WWoWDKdwKG8/rgEFSIRQtNXYP3zM+TjdvLyse9SBOYl37+tYqAitIW0?=
 =?us-ascii?Q?5OJX1NJjmQOB34l23nzMHraR8lad92zq0B4qMXGKsCPbhwoZwSth9c+/uwu1?=
 =?us-ascii?Q?saBX68A3Ea+qaM7mE1Gv3BLlIhVmFawcLrvCbVvmk/jT3lTzZmfCiagnCbZQ?=
 =?us-ascii?Q?itZXljEFmZs8oAiNEPFnLfyGSxMgSOdAiLbRxizsUAgKAllwsuJQ8NVaf+sr?=
 =?us-ascii?Q?5kxqGy24L0pTGui5t9neGXOT64Zp3IG8hbM/YkX8?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bf72ea-0e8d-4a16-a680-08dddfeb50e8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 13:13:12.6798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBqr6qpGMz2GZd4xbe31J1QS14DdvNmh7dkBtSLB90vsA/eDi+4GSFVSgeTq1IhRzHaeyXRMVhDIkd5kHm3BhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5994
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

Logging messages that show some type of "out of memory" error are generally
unnecessary as there is a generic message and a stack dump done by the
memory subsystem. These messages generally increase kernel size without
much added value[1].

The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
remove the useless call to dev_err_probe(), and just return the value
instead.

[1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 0952c7f18abd..c7d52caa1cba 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -529,7 +529,7 @@ static int mdp4_probe(struct platform_device *pdev)
 
 	mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
 	if (!mdp4_kms)
-		return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
+		return -ENOMEM;
 
 	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
 	if (IS_ERR(mdp4_kms->mmio))
-- 
2.34.1

