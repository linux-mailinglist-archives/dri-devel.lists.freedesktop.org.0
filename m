Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1F95AE44
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8266410E78A;
	Thu, 22 Aug 2024 06:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="OIaJfNVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2042.outbound.protection.outlook.com [40.107.215.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2919610E78A;
 Thu, 22 Aug 2024 06:58:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEyAiAKVnisnRvdOLjH+LetB3QR/4FKoy3LrcHAmRn6t15myFc3+ppJHxIAdpJyS+9MS8DaZ2Q6+yz/BvT4hPBAp1xsbtalVqtGfscQSiZibgy6JVsckCSwLGEgJ3LezP+5M/LZnRludGJYW7SG/Cj29qZGADvFl1PzJujMMK088WhsJ1hkUpI8KI8H27DXxJ5DnECKH98zcOhPy76wug7Ih3oRmSTd65LCfJZQAi1Uc2eieJjJ5JBLTaJRq8npiwhGpcMTwf1tGCHbUGNoL0gAh3Vpbz63FYaRe6Pki2OvjcTQgd8TAWLqJmZiO6T7QOGhpyCCvFe0I7If0KHpGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPHFiCX2D8HefJU2ksWv8ccMuI1S9KxOQ2E/bdwcOTg=;
 b=IbazQVhYa4afpmtpBgr/mRsBhC10v/UUKVhJu4HHTcJypkDSNDDHidRnLv0kH1TA4e+YzzLtV95g7aqvgJ5GjofRXH45Ws5fRAplX3FlQyZo+4dueK1RP8FstGdcRIe2zksE2d76Pe8tS5Dp/6UGt2siPd4sOGFmbWxrj2VI+QNr2v6Z3AkOKzK1Zg9PdWSIpxZuiq6ybnQQY1HETNEptA5hnqv/vVBgLkyLFpxIgcDEhkwbNQ28WE2B3acncMMMAEZqrq855G4byYrllmAb1lIkeXzx1WGz5SR2QGP34AKenaXuJKQ4TqI8F8uhkW+3JDWXjGkm3t+kvtpco7vF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPHFiCX2D8HefJU2ksWv8ccMuI1S9KxOQ2E/bdwcOTg=;
 b=OIaJfNVVFIDpxp1xSNNJ79b0qW7fXNsItkqm3S4BcwXWGLGjmjMSYd9vjm78s/d8xsQGyPe7Si5Sm0FCZFdWAm3D5v2wq4kh1qQoq7DTFTu9zQJO/5n5XHiUxYXuTD4jsV4sELaO/usOgv25+CFyVErJnEBihGmeHe4T34N+Ir/zxPyt3CYd2cO7vjO1RoA2gHba+p6noS1tbG0q8Eqf1FcI8r4CVu/u7dtkUl333UoagL8XC/nEpdl1pcLfGeP+MhQk4gXpwEr10RY+yubAZeiseojKbctVM6KrCj9KoMt7YxSDfIVFMoGUhSCDk6yNI+DF5w6mPa1Rr46Dd2CGiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:58:06 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:58:06 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 3/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:57:20 +0800
Message-Id: <20240822065723.1336181-4-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065723.1336181-1-yujiaoliang@vivo.com>
References: <20240822065723.1336181-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e01031-52a6-40d1-2581-08dcc277c62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?26aEPKw2VQsGPqlZyaAH6jxoMgIqtjZozWAbm5AfGiQLgRWJJGPcM0zG4XjE?=
 =?us-ascii?Q?o3+5JCI2KcXSNaJ8VXo9/kliw/epjengwHl5DG/qrlfVsd+pJU60UzE8BXvp?=
 =?us-ascii?Q?T9LissiagM4bLjtNO3BVanRyc8+Yj5/ucPF9YD3ai4/DR/7iLCh2+Bp9yN4N?=
 =?us-ascii?Q?PxoyVeicqDKuNJIzSyFyaXtQNa5Ifh/OpUUNUdJD7sG9v5T7xc+O8XfaPYJw?=
 =?us-ascii?Q?uY4nltdfYM8P3hOoLtMnwuAgo4rG+9dTOE2TZpudR931gEbzP0LpdzLNtGtf?=
 =?us-ascii?Q?0M3dTG+xQVbfC1EGP1pZuo/PNBMr3EVnXHFGzbCrieBAJPZSZTN9lzWwAwai?=
 =?us-ascii?Q?7JpZ3vbbwd6IfzjuLOhuImZOGHWK2QaCiA4PFAu+kvn7Foz8+msVuMSawz53?=
 =?us-ascii?Q?NXrivVpMWL7KSUknd2fnzHT0KF1g9m5bVyJxjs/YBcRmwL1g6IgtlAC1zCNA?=
 =?us-ascii?Q?kvKRDkDklzPLFa79g8zMyMKimnGvazbE+S/NLWOUn5LcPp5TVsFm2gavh6Fj?=
 =?us-ascii?Q?UCR6FchnL0203ujWCLu5TH2yWLTb10erkeKSO6sPEPWqXyFUNvYNKHgxeSHn?=
 =?us-ascii?Q?Q/ksNWGftwOKFcwDyY31uP2wa996Vum5wn3FfOT5352nn9mAoFDjRe/i04jG?=
 =?us-ascii?Q?WzY55Zl++5Z7A7ja3MHwSg4nGQabwrISdtyd4r5GnZwk7eU3pgBV8uyiHZ2f?=
 =?us-ascii?Q?y3AcGDQ9Z3eu1TSdyZZp5/4TOJha7TMY5ompGsOVvvv4HVBm6gIz44mXR7M2?=
 =?us-ascii?Q?5a67g/w0AdXwmhakUPy4+sc08H1XA+TmNRRbsQ1y/zjvqerRlOHP4YJagw1s?=
 =?us-ascii?Q?29jViB6M6fsqzBU0OQyJvI3dSN8j+3OSxgQg5UBUVoY4S17eI7RS1coLX6JH?=
 =?us-ascii?Q?DT71MUVxj9LrUwIk5l8drJXuZ/kL2aufjW/a6ynn1qdoSo7L3IZg+NVQCC97?=
 =?us-ascii?Q?uG35RsKDgfrE0RusBWKohLzQjpTISnPqTkJIfPyo2kmjei3jKbSk0o2j18H/?=
 =?us-ascii?Q?CQRgoGSnbEc8ilhC8fM5oT0x08Rjq2HcbVMza71x046fYgrPXnkiv9tELLi/?=
 =?us-ascii?Q?gPun3/Tf+k31Rx+UivBR8SrhbASncVzcapc3Wcn/mxD5I+lWcUQYrr5oZwGM?=
 =?us-ascii?Q?MQKAaScmT9peQu1Ehz5DclBd3nac+kilo0ZPff6XHCDR79YLSdQ8J2dYyPam?=
 =?us-ascii?Q?ywqa1wSND9XbUrXPTYOsWVkJ+SXN8ixV975l6m5+eBWyTfnM7DnzGpd1fYlR?=
 =?us-ascii?Q?iMn0JMBGcImQ1TZ7BPHWGsU4HrZ7iEkuceeSEDGbC2kMislCa32E7Mhkm/6N?=
 =?us-ascii?Q?Advjf9OgjNHUhLie3OsH7N2sHp8GFV5I0UErGXYJg0HDjBKn6CA24zZs6LtI?=
 =?us-ascii?Q?bYMl5UEhWRYx1vZc4/PhTvaP0K58EMoWw+FLE++X8ZbDtqHC14Nv28Bb2eSO?=
 =?us-ascii?Q?1cA9G1b260g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3UNe0DLxZDdM7Aa9Aa84GOPiiO4yB0sA26n9hRCDgLG9pE/tNx7qlVL+Z7e+?=
 =?us-ascii?Q?5tpsS7F00fNdWpK14UAHugsKrPerhDXqJsrYD9a70L2xOrK6gUC39qo6dEmx?=
 =?us-ascii?Q?ozZTlUFZ20SJjbIfnSkU+r7nAipGoH24fkWHugXdzY189clV+c6ZstYjdglW?=
 =?us-ascii?Q?QOcrS9J4B0LADakfunXUsFjnb5S1ZjV6bm9Z6mTBIFcQNDH8DTT0q0LrmmB2?=
 =?us-ascii?Q?tB/WLMyxJBJQ1RQ4ODtHYzwcwSF+bNj3RO+vzSnIt+YGaZwnDNKDyOTsGLeb?=
 =?us-ascii?Q?rWBraHjM1ih3QTscOMuRPzi/4pjwmlmcRnssLPKQWmfmIQ0Tcj2l3NITOlZe?=
 =?us-ascii?Q?xlZjyzvzQiccYlbH55SfdVZG3LeZg3fB0axrla6vKo+hG8tOI72lbjJ/TtaX?=
 =?us-ascii?Q?Xoz9OvtW7n6zf3izBbzb397izwQ7OjvN0WcNN7OSeR69vqxfOiX3ecgNH9qw?=
 =?us-ascii?Q?8O0u9bugmLPN883Ksx8TiOgE5KsLfvfz0e+je7k3R7wtptcoKbWEhcJ2Gy/I?=
 =?us-ascii?Q?EoG2bnXU7p3H1Szw6YWn0UHuZIMs0B8b5E8ictNNYuvHhymLUpFStSlexkwA?=
 =?us-ascii?Q?kzc3hV6H+pkS2nyjmieSEYFFlimFXfcFSdkPZygNusfxloRBbFKoFKyZ3Dlw?=
 =?us-ascii?Q?hLenwaWDF6xxYJnMpYE1vDcxhmMWwBS8HABX4mVqfZxs1xr17QTl/haO+UGX?=
 =?us-ascii?Q?vJa9RJIi5EWXAOQx5vUA5n+ARjBr0NN9BRDh77Z/slfqDZ/gW3nWYdCGN1vT?=
 =?us-ascii?Q?RliuwDgloK2D5KxhoLDp4VaNM4WR/iPrLx5jHE+KSsu/+dJ03ZQu8MKqmvgs?=
 =?us-ascii?Q?JG5eptXuZhhKhhTCgZxTMjTVKAE/EWfSw9a89UfNov54VrNSQKCiHk/9bCLG?=
 =?us-ascii?Q?FO4zqQgOMZBwGVibWn/Sg1RZ7QoQaZJ8IYlvCJxiHSbEnCH4AB8o8VMq0VuX?=
 =?us-ascii?Q?/KQKsg8JxbkduNHFxRxVPk3/4eanp1FGEvREflxcvdrmdN+P7oDr1uMwb+mk?=
 =?us-ascii?Q?Xmrsv+0Mm/UPHNzdFJ55T4mVrA2MryAvebeNGEggYhjnbIg2yTD/qgtZxDv0?=
 =?us-ascii?Q?3qvLB7wufFVJCZAvbeCbFa76jehMBLd3jmBh6PNhbarTFl/eek3aVLuu+UrK?=
 =?us-ascii?Q?/auMlrUZh6iqsXPi84+eRLGjoyNhAYgOEtKuidNbv4S74d4jGHAmT+dI+pET?=
 =?us-ascii?Q?ULNP4aRmn0buTLZEaU6izCD11lVv6fmOEv2zGbcqI07ynl0b5Szfq5Xbrap4?=
 =?us-ascii?Q?qtANvS9s1yev31tLa2diDBtaHwSoqX21TFhl1zdjX9wpSiQPBPqxc1m/Jtn/?=
 =?us-ascii?Q?uQtbVJJzQ3w/YddfFUhJfVe0NA+kK8z/4J/2kW+j6e3qxYQQiXa7xJ8vhfer?=
 =?us-ascii?Q?9rrvThr89MkU3qTzSNezA/s0GSLks2lYIl5u0/C/D0sg4NeEdBSuM9KG24S7?=
 =?us-ascii?Q?cuKVFgYklnFYxb7iEBIHDQI21ijT0PMQKH9WQ2R33EcAOJFYkgBYqKQj5HI9?=
 =?us-ascii?Q?ZNkAW+U4JJykekq73hGyuKraeJXQgKgIRbysNZi9RMQyh6kGJXamLlMgYr7W?=
 =?us-ascii?Q?u6tdruvAx9fu7ntK9G6ECnCpcvily/Gw5hytGgb4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e01031-52a6-40d1-2581-08dcc277c62b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:58:06.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwSD6oG6wAKy4eibIN3hysK9n+P5yr9Z6qMQmnlYS6Ufpvf9uxeVqRsR3UsYnGo2GhAJnqMWfuLCG9N9dDrCnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5982
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

 Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index b38340c690c6..5d40f61261ad 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -797,9 +797,9 @@ static struct rect intersect_rec(const struct rect *r0, const struct rect *r1)
 	int r0_y_end = r0->y + r0->height;
 	int r1_y_end = r1->y + r1->height;
 
-	rec.x = r0->x > r1->x ? r0->x : r1->x;
+	rec.x = max(r0->x, r1->x);
 	rec.width = r0_x_end > r1_x_end ? r1_x_end - rec.x : r0_x_end - rec.x;
-	rec.y = r0->y > r1->y ? r0->y : r1->y;
+	rec.y = max(r0->y, r1->y);
 	rec.height = r0_y_end > r1_y_end ? r1_y_end - rec.y : r0_y_end - rec.y;
 
 	/* in case that there is no intersection */
-- 
2.34.1

