Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832D67F57B5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 06:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD30C10E0B1;
	Thu, 23 Nov 2023 05:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0163A10E0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 05:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4AkWQ9jZvdia8upt6SCrOWA31vjNKr0EkwBpmavW69D3ENjVLxkjnvrZ0MmwDqHG3NDHOaxheB90eAedHV47ZHD7pQgL+sPyC8fHMdkKnYkTpECmC3YeiP6YKPh9817k+VYjh1O2UgKEJLaEgMovixqBjDUzMKDz4+E5Teye5Yv6AhWcmkHrpb3S2fQ8Afq0t0rBKBiBGQ0gK4b0Fh5iwj+2JT+YxL1FaMyBVOiQ1+ntyvcf58D7HWEiPyJp2h32uERu6hLiLss+fWIVkADpkWQSY4EMD87TI6UrXHT6Utj7Zc91SBuie/s7EZyiKvW27yYz/pQ6UPJw+39/btLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCGO8YxaqmtrDTihbErqof0bqtxkGR0UeiW9iVLqKE8=;
 b=Ig/V3oqjUIScACWLse1DGNlttTzLtySO4f1daobyhXpPdnxjp/JihOE+KlxE7U+xnS41wQ3842d8OZ5DM06RyU6aV0exLNZqfqqSvj/MY7d9IA/p5i9vvrI46GUTVGQR6FnA/S9KYzW3ySqL790C6+3aVK/546e68vQpE4nc2MpFOmgFqIPiBuPDN0tzl0jLk6JrE8puSYa77rh9IsyI+ooVA4Pgp16p9mNY453Ac+DINtB2nf5yiPHf0igGgMIRe0MVgLNhyzYVHXcISFpKjwVXj/wQ+eApmxRCcpKmW4Y7Y5g5jP8Smv4WviyJiat7gRniW8VTZYNgvnSvq4Kggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCGO8YxaqmtrDTihbErqof0bqtxkGR0UeiW9iVLqKE8=;
 b=HA44V2P/pRxd+lam419DR8P4Rf0L9R5hkVoMMT2OfR6o8wI1nw6HvZ3irgHuACEnKJ5eVQxNZ08GxNTw9w1nVb9XM7Hf532qGvru5Ip2y3Wr8jNcah6GUn0R66QE13TX2gw8MJjGOfi6GPrPg1b2j9UwYTo8yrlXJ4gaHvAHG70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 05:13:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf%7]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 05:13:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge: imx93-mipi-dsi: Fix a couple of building
 warnings
Date: Thu, 23 Nov 2023 13:18:07 +0800
Message-Id: <20231123051807.3818342-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 12918989-707a-4448-9ec6-08dbebe2fc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iH2XrKHYin2C0pcgD8rn3nmvDxCHZw8XvRhcCSvhJGBRZUDA6ZQdVkhnr5nhikaO3coymu2R0Js0Jpep4lkd+vz2UC4vOGJpJmGasdydsGZACXNKSJrU1xHE/aBcOKJ4vV1gNcFU5NTgWn34wU74+lVTGcLrwvZOctwCqMc+uIZWEKzrwhCBnY2ygho2i2npLicT8H2oYTB2xJuanC4jAZL7X0KsHEYJlNatv3lE9KjyMMBBV4HIwvvekY7VecZpiZaAfZ4NVZCEnKCwQbvsrEkrj5Z1xLg95yiAVhSL3IUpBdnxKlXxLsWi7l0XhoQzHV8V8LLCyt+kdGKLsCrYNutdUUti9DpPpWPSawxHDxrJ2MTweZQQu4HDpmdtacIPE0s7dRQ3MLS0NGVr+5vQJ7Vw9N4A+jaPv1TznV6VBefa2tnVjRP4StsiCk8BTwH7eBotzxLIoqYd/qcWjw+BYl+N1WzMMm/HUZMSFCRGw0heqFFPS6/ZQUmnqadEwV4kcqAPyfc4hdBE2SKC1hoFHtH9ngVB5Y2QoSkos2x13R9F5LMHRzy+c04bCx5w37AJNMn1RTXKgBZ+a4UCJqNMC8lzBPwpR0Cv6gbyoOaTTFVRl8ahVaW+f6nYUuU4P0cRcmdpovm+mqUfiZildxZ5nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(346002)(376002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(1076003)(2616005)(6512007)(6506007)(966005)(52116002)(478600001)(6486002)(6666004)(38100700002)(38350700005)(36756003)(86362001)(66946007)(5660300002)(2906002)(41300700001)(7416002)(66556008)(83380400001)(26005)(66476007)(4326008)(8676002)(8936002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8OiAwvGY67b2/1ZFyZBMH9flI8mrPqgLCDV6IHj/A/74JZk0/CZ2hCUEtoSG?=
 =?us-ascii?Q?Id+g4Gt8fSpsZelaR7ums9UMvxO/5YWeGe+b07Bcug4NrpfRLHQdTa1Da7hB?=
 =?us-ascii?Q?6F1mnRtz4YibIkZMbSiODphowMQHYOKyA7rsxuLLfLlK4eGYI5ITtEnVkgL2?=
 =?us-ascii?Q?/PbM4Di/pX/vewM5B5Q5rIukS4r1u6aQTiK+RD4kbYYEpR4DMuBFXYJf5+lg?=
 =?us-ascii?Q?i1HlWC+xENvSxjDg1244YLYBg8gNAxf4BtxIecoCJtnbVgu8tJjc83Zwqrj7?=
 =?us-ascii?Q?mwnCRHaHFoKp3amzP/mCkcuthlc6BQwQ62s75WjQsXARffanR/wpdBFtXzST?=
 =?us-ascii?Q?raijZynzyoiZsCOROR12cpbnzP+y/DVhZzWk4LqLrf/4bisYiCTIqD1CJHbX?=
 =?us-ascii?Q?upjcCvReoHfOQjvJAQLhaegMpfxsl1MSJyA6xbh1/bf6mBhL90C5DRpIzggh?=
 =?us-ascii?Q?0VJp+OPIHK9Ivsq+6h82iwmnOZny8XH8ZzxQCzXawH6dhjkK7PwZHzH/G58e?=
 =?us-ascii?Q?iq9fPfQMFUdLUC3lt/mhec9IthpJ5Gic6ySl4u36aq9LF9WO90EoeKWTdWf3?=
 =?us-ascii?Q?4Xq4dtZOXaBBH1m7R41VqBiCVPP7iw4OA4v8VFYJ8TY4TysvTBVBb7f8I52G?=
 =?us-ascii?Q?auHy/BI6qGiQZ+MKHQE4O9GRfOtP5AUnaC32mWe9dJHjBwsMOBfkG3IKOhnU?=
 =?us-ascii?Q?GBG/2MrLik5+oSi5QdOIV68ZLGjKLtmnXx7q71fNUqqcO2BAxx5HC9equsgC?=
 =?us-ascii?Q?1eppBzFLQUOKLGBCDGfUxR5InZGzRP5xbzikj0ut/u3ZGD8iACyRfsoZQ5tW?=
 =?us-ascii?Q?9e2xY8AwipzwqmqQDp+GLQSu6gDXYJMvlT5pk9L71iM7ob09uG9Jo5tTmGmb?=
 =?us-ascii?Q?2QovpDmdwytHp4OieuMB5vH33J9hR7Ndp3P9bn2Prj1UKpxcIP6fGSMag6ww?=
 =?us-ascii?Q?RUdiUHLN+eQvk3vA1IiqM5jOgj8pWNiPyl8wIsMqukUoD6WkLFVO7uMej4Y+?=
 =?us-ascii?Q?JjaV+TgX3o5yZIdn0eEMebNGCx3YRJQYdgzkZ/prWSZ1oHT27kV4NokYiXfL?=
 =?us-ascii?Q?fvLJ9LnrqaqoElxSt2bXwWXvn9+vLSiis0Rj53gbzi65GE9ttKi7RafIeYNv?=
 =?us-ascii?Q?l8KNUuXKCFODrHjuNzTvNEZj/nPYhbM58ykPVfah0sp6/j2cuOrWieWdxw2l?=
 =?us-ascii?Q?vrV7lsgw8TnM07+abFs2nOGPX3xfBp01c3Qk9/CNH2tRkTgpt4vCf7bivUKm?=
 =?us-ascii?Q?siCkOHjCvGisvnW+NDCP1KLQUrF2/yUhsELPzSDYwiyQBa/nv/rL+jvDV75n?=
 =?us-ascii?Q?flPVdPo+u+h9V4gfhM9VXFuF4Ct6WeDEZMJVWtbNYoayPNjMKSPD4lbqeCXZ?=
 =?us-ascii?Q?KCYvf/ULKVy2es7Dt98UjdM5134hwCF9RcR15N/8acbNHmY5OdQh4NzBjG05?=
 =?us-ascii?Q?3pVKoybrPaERf29GyOj+09WIKAWWLxCmiHCTYRz2OG8qj2qXqxJuiF5x0o0U?=
 =?us-ascii?Q?uUt3xnxH0/31X2XchgNQjKPALZR8qyHcTMJjiL+ivojG7wAZiUhs/4ermfTs?=
 =?us-ascii?Q?Rs36pTSKkJqsgWaZEWrNnMvsi8iRcck4Qx/l8Ard?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12918989-707a-4448-9ec6-08dbebe2fc8f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 05:13:53.8990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VORRkMS/bL6+XxulKqc+XVLGqyFOJjsk4Gyks2GLJaAVSl6AJYctPQh7GK4QXuMpJMEJkm8JBZylQUCa4diBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com,
 kernel test robot <lkp@intel.com>, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a couple of building warnings on used uninitialized 'best_m' and
'best_n' local variables by initializing 'best_m' to zero and 'best_n'
to UINT_MAX.  This makes compiler happy only.  No functional change.

Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311151746.f7u7dzbZ-lkp@intel.com/
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Initialize 'best_n' to UINT_MAX instead of zero. (Maxime)

 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 3ff30ce80c5b..2347f8dd632f 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -226,8 +226,8 @@ dphy_pll_get_configure_from_opts(struct imx93_dsi *dsi,
 	unsigned long fout;
 	unsigned long best_fout = 0;
 	unsigned int fvco_div;
-	unsigned int min_n, max_n, n, best_n;
-	unsigned long m, best_m;
+	unsigned int min_n, max_n, n, best_n = UINT_MAX;
+	unsigned long m, best_m = 0;
 	unsigned long min_delta = ULONG_MAX;
 	unsigned long delta;
 	u64 tmp;
-- 
2.37.1

