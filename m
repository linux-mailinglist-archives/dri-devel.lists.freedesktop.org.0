Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46995B4D8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 14:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0E410E881;
	Thu, 22 Aug 2024 12:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="J6RaMdSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010041.outbound.protection.outlook.com [52.101.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999E310E881
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 12:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+dl006fPstJrFbvSSA4muSysMXekzWo05Wsko/t+uT3eCx2Z4fLJWbLAl3du/Ikh094G2HUxmpk+uUevnjT4Knaq+/46Q9M8s7sBCWTZapziqbx3UlUuMrNz3NP3q1Hu1NMIZCrxFyIN9ioNHNOXwwbZ3ix+uVe8JNhk+lqAp/ZaRz5PSx2r5unkDHuUds6jNv7EFTpJNUfPDTSW/JFZOxkZP5P8gn1FXGs+0vXGGWyEHuGiAKn2kqwbbOlMoK57Wls4cLWl837gfE42YfeyRI0lpdoJejg2n+dRheJM8x8grwNySrsKrQjGgUyQ7Q1SU7fVbrLNX2D82qAIHzmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVU+086nvyV7Wwfk6l777bfLsvfD0zz7hwSACnvVNg4=;
 b=OL2OjggNh2QYbji8CMk8FwbaTUV6Zu9rlXtupzKVyZKvpzp8zJhNZo18Z7n/x7c6mwSSyzYBw9BaXoj22ysOTkyfrJEH/z8x6PcA1ZlCQ2c4tk8PJcOc4m5JpO/AERs0sk3HYomR4dBIgmM+RYqbO+218G1EQ9AGuE8g8KbN15HA25JH5vMwcHXfQNrTvwZA37JX8tyVzETgcnMFz+dJ2HIO+fsAxsfptDj7BYfgKROO2P92DKTkpEQCQ3ner/n1ceAMWkDHoGxUdIwWEGdeOmsk0V9ELfQaqmVGJi1nhcfHZFOaOsn7EKrnXHI15mnC7d9YuVX3Esk49d6a9Sy5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVU+086nvyV7Wwfk6l777bfLsvfD0zz7hwSACnvVNg4=;
 b=J6RaMdSh4Ibn6+ralrOVFlbBGx4I/ExYgzE0YMPOt4i/EgPBFzUo61HXgWs1r01psTxa81gg0UgssOxtvk0hy6zl40BEVXNz0zzedmALl0M7KpBErFqR7LdETzb3geYX8DYOOzaDkE2fRLumbbUZqWeHK7unsKOwDoPKGXD+15bBi75Tw0exjaE0b5IeENXuCNg4PAu/DLrIRzKPJs89gtVkKuIQRnIlWKzsydHwcTOEYVMTH2pJwn7Lqjqe8wo1fWk8iVtT5E7HvYdlAK/TffjYDW4zcCbjYrOG3h+UwCmuG8cTVYbo5bEB50XlgVBINIhNkbuwvmaa+AcdyDnbdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 12:18:00 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 12:18:00 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: julian.calaby@gmail.com, linux.amoon@gmail.com,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v2] gpu: drm: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 20:17:49 +0800
Message-Id: <20240822121749.19284-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0222.apcprd06.prod.outlook.com
 (2603:1096:4:68::30) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bc6be4-5b94-43cf-0702-08dcc2a476a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7fOTT5+SPFHWQE7nFHhf9baW2tJ0MtsGDrMqCUIOrBg1N7lvezlJ7yGMYlgy?=
 =?us-ascii?Q?tm4rLL4h2eaL5i5ofRMv2aCtbKPEc4YmVKYHD2wx+5JqsYMsNR4LbzkKyoAM?=
 =?us-ascii?Q?37lgTujT0QxVPrmON0gYreVUKwy+Pr8XuygqJpZbIZDe/m9narnclah891xx?=
 =?us-ascii?Q?2y96/mB3xEI99XXi1HCmLA8NvRN7Cr4gn1xV4j54e1g1010nReSzuGnT/w3B?=
 =?us-ascii?Q?wGYV/Y4yRsRGIpX+w6Fw/KkHFWbrDhcNNnAIgXeegAuHESnJkkLKt/ATw8tk?=
 =?us-ascii?Q?VkYFzCILXdm7s61gkfnBY5vhEd4k0vwhBmI57r++sRSlCWhVZrGJ8wJEN51P?=
 =?us-ascii?Q?/gRKQ4f+7A6n1630iC8W1hTPrILe97XM5XIkVAF8d4d6P5w3TdHcNEHElzv7?=
 =?us-ascii?Q?hJYw6o4xb+EedfbP0Uk6W4qwDJNpleOXdomeinrFS3QmOgqCbc93uL4sK9Ng?=
 =?us-ascii?Q?Nx9sZbEDXX9F/bZ46WWpyg/2u6o6AVcEoUp42bCK7wyL53BMxeLQSypJyeEY?=
 =?us-ascii?Q?SaP9odhld/bW3nBK1TFpnWNdreFdLEQjeA78//BrlaW2sZjm99tk0Eplobsm?=
 =?us-ascii?Q?eCpOex4xjepmCua9785ageAhpKgMTEy/FD6p2+dOKsT7rszewJBlyEtE8X83?=
 =?us-ascii?Q?aZHmXSZwf+jQoGSmDZE9ZCqNCtbpX5/z+CQBgDyU6chmY+6wc4lgEXBcyE75?=
 =?us-ascii?Q?YjU0ilfi87aRlfykJBw+i1Z2eYkmn5pq/FyPwBUB1dzgn7heWoS827cFg28H?=
 =?us-ascii?Q?GI8iFSGem6uk8UecNj9khkCYDUiOvn5QPk2T8+XF76MhyRIyJFT9BkE731uS?=
 =?us-ascii?Q?FolG9A5cYcWQmQVGiLtTflvGV0CTrlXwucx7ztaw57b60Log9e4Hp5mZYQgy?=
 =?us-ascii?Q?Lv3Y8MKyR2prtGYbsVmIYirbU7aPqW2SKbOXYHXh0xgIobf76bnKQTbvy3nG?=
 =?us-ascii?Q?29n3ixAfF7Zzf7iOT1JH2+y00SDAB+0mxgjBW2aXU8hGXh1Mop1TKQY9rwiG?=
 =?us-ascii?Q?ozKKzlyVG5g7yuG8gSAOlVsfro0ijKKuOim+22vETFDbFxoRKjqj4g9gIAus?=
 =?us-ascii?Q?BVldarDg7IMmGr0Kyh4orxA6ReY3zO0lywWzojvnz9RK3hEaSvopiUlUd/9O?=
 =?us-ascii?Q?fAXPZ2L818/FjCRKxrCI+/e/UOrfMEhpSZyGkXBTfIiUyF+bKqYsMiwH8d5m?=
 =?us-ascii?Q?z53SpxGONshalEhgyTher2sneW/uT8Qezc2tP3/jENPjHl9pdGaP7MKyPl/4?=
 =?us-ascii?Q?jZs/zfVLtWG5Jt2kLhlRryn8oceUGaH8DXMkIiVfvgDLz9+UFZMhvhJN3tYv?=
 =?us-ascii?Q?jQJMjqVoYPiyFQlPnvuDP3vKkdzVKhwIGOUbsSiLo1A/cksQ2LD2y+Jch1dk?=
 =?us-ascii?Q?Due6DDRt6vSchhBXN+CAE711gpMkbTQIyR7jay44WlxhSmTYOhhYp8O6UKsg?=
 =?us-ascii?Q?HXOJUZhLRjI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wEGxkrbTatlvJCcc6yuFVRbUlWO/8nay0zB4CQwhw1oWs/WJS4Tx37SoenPs?=
 =?us-ascii?Q?xLecdJqn98EpKDrUrqYZrnH6QH4Yo/0dw4vC61eh0oLP0j4nATWq0v8viTl/?=
 =?us-ascii?Q?Y4d3vpkUeZ2XzNkK7f4MhhhZS+nBewF8aXiKd+HxAhE4qXzvCdGelvzojLeM?=
 =?us-ascii?Q?UOZQcgzirTDJ6cgRc8xixQ7l6T4jVz5q1I0/Vw/38mf2RzKxQWt4GjBDJqtc?=
 =?us-ascii?Q?RD2bIlNbyW2VwJVVL6Hu+IcKSQR2z/2csAcfRVXW0tUSvZ7jllW33oS0ctaX?=
 =?us-ascii?Q?Nc6dXfQxoiksvp4Z6Rxg/dpvsO5eSNXIRSmGxB2R2eSBlWROb+I5F7cNc2Uu?=
 =?us-ascii?Q?K7gndhx2h0jAjrc6lrH1XjHHISxo0d4DCEpNwL+6L99HH5ZQPPCV8EQxPpId?=
 =?us-ascii?Q?Rzy02hDuVIXuV4b115Jj9M2TfuYXfsZM/eYmiSshXIk+0NyY/6djnALrg2wW?=
 =?us-ascii?Q?s3dzMwgrdK9hidvhaiNFHgK9VUHLEI/BX2m/qFuIA0hatq8Z3WP/XFHp64E4?=
 =?us-ascii?Q?ZoeoIeG/rSrGErmAj5RBa8NvwgWoH7bbtKt1Ugwh7wHTzVFVfBpcfO67Tr6Y?=
 =?us-ascii?Q?YKhc8MhYZ9Zfw9zTb5B0hJSvUyDLW4wVxoKSRUkA07IK2KULMD3PBx2W/KKe?=
 =?us-ascii?Q?hnh8FuLsgv2pfA1rnjgVT5nW4yPpBoNBtJb0lKneQ2DRVSWbepk0K0F0kUM+?=
 =?us-ascii?Q?vlrb5+ROdBTi1/Z5RBlM1x92OueQGdQMAgwWLqbdJ4M9+LKfl+fYuaIk/Egk?=
 =?us-ascii?Q?RbcMoPie901GXdk9owIe9ZBDTjzBrKNOJZmqQ+GX8RW0GdNyzH6drxsAi04S?=
 =?us-ascii?Q?3Cf9Wq9y7IsrHGxIg1fQTZZ4mzr6dARalI+sf57/rxlhXy/eiC7KzlTHmEKl?=
 =?us-ascii?Q?fhotPo+mj88Zbwd8GUGJEc1/zgx4WJA7wwsOgyO7WS8+IBHmAhmpoAVA+yYz?=
 =?us-ascii?Q?KWUmHi4aNFhh/clFkN0Bq1pHWAHXt/eeSvh6qkacamcW0QsGmblsa4uaQQIK?=
 =?us-ascii?Q?aWb08IoBbXjsgRTJvq5RXOovMGCiJfEvZXRV5z8yGnCmeSjH4UUuhPhMmKjd?=
 =?us-ascii?Q?/agjEHlEWw32bigHDnGvqYuYIS5Ea2xAw3Rlgqd0wax0m4+avj/Nba1a6Ejp?=
 =?us-ascii?Q?NjLmHy7gbyXhicZQGcoz6QkK6j0HA9qQSjFvs1wwp2EG2Oxx3rpoA9dpVvjF?=
 =?us-ascii?Q?ks2xEyMiVzuYptEKsUH8zZfLwc1BHmt9MpkPwWNHRSEKt+a0NFtNmmsaly4K?=
 =?us-ascii?Q?KB01euE9DhsXLfSLrIw1a5MHHGEV8FFtC9+Hrx6KgJ0d5R1w7VMu/h15IIJV?=
 =?us-ascii?Q?TX4ydUA6Gk+wf26gISCZBuBxv4uPFVl/p9T111M6YMCyrqcgvKNf8D0GT3Fm?=
 =?us-ascii?Q?pv4FRMK3wVrF01bXZRj9BDRSwKTSgqzrEmYlpZrxC2YI5G40xYBargezKTv7?=
 =?us-ascii?Q?VfrqS3aUa8gQRp7QRWMJPSnXtO2Whw7VE8ueuj6EfmRtuufI7p+NS5bVivpF?=
 =?us-ascii?Q?vTV5FpVxPruMSkMlsHYfeqwRLwMBO8n36FomiCNGXL5oI4WfAIow6/lx14AC?=
 =?us-ascii?Q?+61ZmOCnCbY3gGMG+bmJ+zSQz4Tv/UQSa3ibNyak?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bc6be4-5b94-43cf-0702-08dcc2a476a3
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 12:18:00.2382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1jgHI1UaiRAOi7kC5S5KE1lGf2rehowOLZO3Hk53tcvTxFls0sbYz1uPnblSjkDQRU5aDQwvhPYOftDu7PCcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5899
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

The devm_clk_get_enabled() helpers:=0D
    - call devm_clk_get()=0D
    - call clk_prepare_enable() and register what is needed in order to=0D
     call clk_disable_unprepare() when needed, as a managed resource.=0D
=0D
This simplifies the code and avoids the calls to clk_disable_unprepare().=0D
=0D
While at it, use dev_err_probe consistently, and use its return value=0D
to return the error code.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---=0D
V1->V2 changes:=0D
1. Drop the similar patch for sun6i_drc and sun8i_mixer as the patch may=0D
have issues in sun6i_drc and sun8i_mixer. The specific problem is not=0D
yet clear, but ChenYu has already encountered it.=0D
2. use dev_err_probe for there is no more special handling needed here.=0D

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 26 +++++++----------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fs=
l-dcu/fsl_dcu_drm_drv.c
index ab6c0c6cd0e2..97bfba317854 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -284,16 +284,10 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
 		return PTR_ERR(fsl_dev->regmap);
 	}
=20
-	fsl_dev->clk =3D devm_clk_get(dev, "dcu");
-	if (IS_ERR(fsl_dev->clk)) {
-		dev_err(dev, "failed to get dcu clock\n");
-		return PTR_ERR(fsl_dev->clk);
-	}
-	ret =3D clk_prepare_enable(fsl_dev->clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable dcu clk\n");
-		return ret;
-	}
+	fsl_dev->clk =3D devm_clk_get_enabled(dev, "dcu");
+	if (IS_ERR(fsl_dev->clk))
+		return dev_err_probe(dev, PTR_ERR(fsl_dev->clk),
+						     "failed to get dcu clock\n");
=20
 	pix_clk_in =3D devm_clk_get(dev, "pix");
 	if (IS_ERR(pix_clk_in)) {
@@ -309,11 +303,9 @@ static int fsl_dcu_drm_probe(struct platform_device *p=
dev)
 	fsl_dev->pix_clk =3D clk_register_divider(dev, pix_clk_name,
 			pix_clk_in_name, 0, base + DCU_DIV_RATIO,
 			div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NULL);
-	if (IS_ERR(fsl_dev->pix_clk)) {
-		dev_err(dev, "failed to register pix clk\n");
-		ret =3D PTR_ERR(fsl_dev->pix_clk);
-		goto disable_clk;
-	}
+	if (IS_ERR(fsl_dev->pix_clk))
+		return dev_err_probe(dev, PTR_ERR(fsl_dev->pix_clk),
+				      "failed to register pix clk\n");
=20
 	fsl_dev->tcon =3D fsl_tcon_init(dev);
=20
@@ -341,8 +333,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pd=
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
@@ -352,7 +343,6 @@ static void fsl_dcu_drm_remove(struct platform_device *=
pdev)
=20
 	drm_dev_unregister(fsl_dev->drm);
 	drm_dev_put(fsl_dev->drm);
-	clk_disable_unprepare(fsl_dev->clk);
 	clk_unregister(fsl_dev->pix_clk);
 }
=20
--=20
2.39.0

