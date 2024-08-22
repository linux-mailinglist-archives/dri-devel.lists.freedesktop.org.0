Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD995AE48
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BCF10E78F;
	Thu, 22 Aug 2024 06:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="DW5N+Feb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2082.outbound.protection.outlook.com [40.107.117.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CDF10E78F;
 Thu, 22 Aug 2024 06:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLJyoqLDrSibftHT7VQRUSQCAJZxyQgboVzFPKgNv7a0+zvjx9Z6K2rwdOxief9njCfrBv3QTjEcGGq5fxI7hs0736g/S02+6udXEFPygEsAp5HJKAKvY9C6CcdzyPdSJ9UtAlgl2QmXE7g4JvYkL0Tf1GuRihuFBETWAg1qmiwla7dwZsDPlkvCC4EgxZdXI9jqvtVsFP5S+jr0x6Trg8yGRFNx/j2StFMZ34rrWYs6DMgiDMhGKcKc6/tZZa99JWdWnZQumVIuzCZqLIHPI3qXtx7g5HMGOaMRgC5GorXFSZrA8RBt+QBaB6KJl1VgttGAfEWVXHv2xxlo6CHOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=TvWjZ3+zy6cSOWTV/0byJfG7h4lVsOl3XsGWDF68XSvVwQh1ZWPuiwR+/QKLiJzs0JCFV2iaYAqnoYKL5SADQ/+3wGuweIti6qPd1iiS2F7xt6zb36q3ouUm/PP0L2DPZVlpZLLAzCbIRAwyHfprQn3J+MtouwjCHFzadL+zjxsCHW+99L+PSQCiIG/5M57J3ruOof1L+MC6FADfDiq6uY6jDyXZGFC2SYTrsTaPA6/gOrexxcWVqIIIr/2gzcEeZ37Fp0fn5GIKH5mchEiPn07WR47VAFt3fcY06Q9IfTkso5ZcIJD9FpGpO4ngiC//ZyJrtw9l/hCi7C2x1PSBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=DW5N+FebxvD4JsQJdMJ4EaQNWBSYZRSzpLRVpSAu3PV5illTOmU8EGmHtlOAW4yy5ilk8g5cTGIxF4YXtwKeSiUygR+gL9QpeOVjakcfUoEx9CKqU9xsbCTQrQc12vhVwyaWw6oecwvMoz7qgG+/sy9gkVO7xyYbUeGQozpofJghdynT1aJ2+c0789BIz9ZjO82yxERnzVmse0PAQIvC2piQyzjqjOG4htPKjwN41e2q20/YQTEHCEch7k/8HcTkDebkeN3NmRlkRq3/r1dEQetayq53NVWLhGxe/z9e7VR67FC9/GNKPZqJ5svue6g+zUcJmJ9z5DF16itb8/NMgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:58:13 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:58:13 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 5/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:57:22 +0800
Message-Id: <20240822065723.1336181-6-yujiaoliang@vivo.com>
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
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c285e52-da3d-43a6-1966-08dcc277ca5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/l8gDyJLQn0Yu3OvS63cfRtsjvXOcBMdlCywZe4FDJwAooLQ88TvQl2tbN3w?=
 =?us-ascii?Q?Fw+nqhClhOG96B/KxV2FJn8rl7N90rW+Ut8O5bwa2dfb3LrX8gzVsa3nmQ+w?=
 =?us-ascii?Q?T6GBXm1giuK9n61Un5LepcClDiOTJHR8z0P3zJWNIIl9m262Mz5CDt2zG6vq?=
 =?us-ascii?Q?jDJ2oRgnzyRjUwTwGlLKjMmwTEWbAP1LcyKdckQovAX1Vqz6Qb14NE8KazYB?=
 =?us-ascii?Q?V4s9L8FnHirg2DdMYi3T+z7C80LzH0yhtgwYOrQ0HU3S2LIRHd1/vlE4mPjo?=
 =?us-ascii?Q?K7z1iIMjCgKCIAtQ9MSgqM72hDYb2kyqo3R0IZvHISvjy40WM2Sa+MhhsP7R?=
 =?us-ascii?Q?6oqOLiuvMsqdSLUVUxVU8n0TOQDYcXHCm0r7z/OFURCmhJMVES5P8SsyaWhe?=
 =?us-ascii?Q?jXZvejL8AFje+TjSmfYegd6+W5A/ZbXzNvCmrqvXc1kJN5WX4ReVfQsDrZZt?=
 =?us-ascii?Q?yrtoxkU8ihIH48NHIpw1Warjt7N4QJbDKJdYilRkZLGtHevqexS1bS9/smg0?=
 =?us-ascii?Q?QkM/zLfvrx7VNHxgP5bftSKLeSiH8Pg9Bt49hFiB9aG9IYbIqvv0FXiUnTH9?=
 =?us-ascii?Q?h9OK+XPXl6tRcDAZoSF6Qp076Cr1po8BKp3Xp8Rj7+t3JEeuTjAn43EBM47V?=
 =?us-ascii?Q?ZX9i+KTdknYAEQ4VlzFZ3CU2txePJZNZ6Ywy38OLfhoUewIbjxkagwT7MeCy?=
 =?us-ascii?Q?fnnBseMX4DjcugBRTMZUgdbVbLLSmUmYFnugqUg0yCTaOm+0Usb0iYqr79Eo?=
 =?us-ascii?Q?AAJ+lVbiLQLa+HH7lxS6mXQhMJJsnZP2LZauM88yD5ezH8IRWn42syL0yE9P?=
 =?us-ascii?Q?mvsgJtCoeBFNwYevo6EmdhHrK5zUyJ7qUoo08BZP7vxo2q/4o3lbkSqbmCBE?=
 =?us-ascii?Q?GrfNwvzO1C190WYOeW/7aAoKE1+4G+bcYpZxxK7nN6a2Jq5SNPRu8chePglE?=
 =?us-ascii?Q?jDhf6TZLSCyv0KsfoD+IMuk6LJpgBS59oNlw+Hn2d9u1MnLFFzm2ubLRu9s+?=
 =?us-ascii?Q?KFyplRuqq2w9aQbi2WaCeXSc7WwL7WaGejEvIcdn0kQv/mDfYqISI3wJmw53?=
 =?us-ascii?Q?9xeqgGwEPpeEOnENfWKx2aqTjfgpiEj0/ghyPtl2MaNu6xJzFTYkCSjjuM8z?=
 =?us-ascii?Q?kaK30AKbiS/qIACNflNUujn+uZwl+HihlcU+4dfSKhp1D1cMLNDGJ35J3e4m?=
 =?us-ascii?Q?DFtSNNbZOHDQv/WKZvNkFttcaqtmYRj0fdjOQLP/OMA+/nloHQNtD/FWU3m2?=
 =?us-ascii?Q?x7W2/BBp8KYPiAWJTr3TGFUS6wPaG3O/ZtLr9vaMtI/LB4iwMweISSzxJQTc?=
 =?us-ascii?Q?i7ehrnUy01FLyGtMT7Vj4f03PCIbMwhBsVCVCIZb1LzGh2+Pw+6tzfyHSJ9n?=
 =?us-ascii?Q?9LSWCUz55ciKEazPlZSVUMOEZFVhqTtKFUQw1LCHTPEXVlNlja/sXEcn/5qk?=
 =?us-ascii?Q?49LIXwk5zUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gKady4EtXqZKUKCoyUypSpOLrXiKqkAA8THgSrGYZOHDZ5MLJbzlXDC/LNzg?=
 =?us-ascii?Q?Otf1VNcP/6C10VKg24VkqCzyP/Ez4mp4NjYUoHJ6UYCBDq0JaQMmLwNleKbD?=
 =?us-ascii?Q?x8rQONq1Xgw2SL+4rnO4KbzoMpYY+FrvtVEhH1ZNnmU/+3ItJPgweCEpVJ+M?=
 =?us-ascii?Q?ejX640GqTAYOsO0unJ++xy9qeP3yhU8L/55QUKhOLdrhuhyZjzV70AwbM4zS?=
 =?us-ascii?Q?ZnLj0uu1iySPLTPu6AXWDIhQ+zJmjiEkz/D+7niY6dKBKyX2zhB/8wjWISmV?=
 =?us-ascii?Q?NFNHlfRJqUvyphjfu/VwziPh7ADY2JRjNb78ZmaaZcwb0L/jAJ3PWKQC1JwB?=
 =?us-ascii?Q?2k4tTYbzlCDDQNP+xXS0YIg5AgF0RvqihlL11VpF264uoOAPpwog2GXWweuu?=
 =?us-ascii?Q?+asmAYZ89pnhp9pBO8ycfaqbtqveoOM2rFLLl1e68/oELPfp56vqHQCAyNFP?=
 =?us-ascii?Q?vGqoglYtHVBCmqyWklJZGai0pY1J3/+8qPrL/z1ZmoFAokKZRbfa9f2T6Zq+?=
 =?us-ascii?Q?xFgKFKsT6d+T1B1wpT1jBmZyL8p9ds2OHvjEhWMOAgjsvDGkskkUYDATBDAM?=
 =?us-ascii?Q?hQgLKpkbGdWmlYtxrJf/AnANbnlVQJzMXpPe/Af2Bl1JqfKVfdF5DqZqZqUY?=
 =?us-ascii?Q?xOBvfv2TkmYhmegzvD9im+naoP+zPl4QJoaI9CdxE/DuMVOndVgnnXMFpf0k?=
 =?us-ascii?Q?RSOdb7Jw+at8j7rbeNTnCf14PU9Uo7SKlY4ExIgAUmXIKCkuVBODz5a5MVgG?=
 =?us-ascii?Q?tD5eXOFLAxYDx4yIWvzONecK44AkQMTYbv3K9AQbbCvCCfb+kq1/jaCnBmDL?=
 =?us-ascii?Q?TpwflLdE9LPnRZsONqwia4TaTfwUlyDNdEU5tpyc2fSFG5c5D2uF+vYu9BuE?=
 =?us-ascii?Q?P81g4AO9vaMueY8Pepvxjms3ApOgPiW+AsHGd5ho9zVZUZLgDkzMcxCsQpzP?=
 =?us-ascii?Q?UfNrCK8h8QUQ0tizUwuPl/nG4Id5Ftzktg/Cn6f5Fr6l3PT6NJAyQPRP9XHz?=
 =?us-ascii?Q?r0KMTnuzORnM2FCh9d91G1qxnVQkVy2+ZAnZv3WPvyNTSbh/0bwCaCQV9Ol6?=
 =?us-ascii?Q?1RpRoOFDbOX34rzYI/d0p+6ZG558x7W6YDkQB1wHBT9KQFHOstb/lV3oR4Mp?=
 =?us-ascii?Q?yA3ZB+i6hJ0DfgomuSseUGCOwk30P/pLqprQVFrpitNdNHMx9zvTQ2zLaDQ8?=
 =?us-ascii?Q?uRxfuXCs+N+rtPrXWcU/hfSP/OA9H8ZZ0vP3DkUWSGfAOPoF8HBPFeTaU5Do?=
 =?us-ascii?Q?nmkyXCL7RwEVBRJAWRZ6pPrHBRf1yXDYJ1VRc+mpVq9EguKYBvnHqMLWqteF?=
 =?us-ascii?Q?wXxMCCZc2HDObXjkvMGQBZt964m5UeYQ26xwlrZOrbnR8r22y1LPe1IsSypY?=
 =?us-ascii?Q?4q8n230NiEuZ2kC5r2rQ7YmT/uzho7INC5n42IAJLBEd5MId2HlGjevTvard?=
 =?us-ascii?Q?8DkeKTcaN3KpJPZm6HqjfTIj/OXFWhg91HqpejllyaLiqtyV4So/Cpo+RAC5?=
 =?us-ascii?Q?7qn1v73wfWO7pZm32Ea4Vu2boqow9q20Z8pDXCXOcz7uc5fKFUKHOUVBgzM9?=
 =?us-ascii?Q?ZA4WekvjB1RiT3gwwOf0UfzsNRxTXGHJJdm9ChG/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c285e52-da3d-43a6-1966-08dcc277ca5a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:58:13.3388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7m7ID7/bJNvxNMc1Xk+VraJ0AdBHyztZvGFnaAF+wHPyqRkvgT1xQ48oWs7QK0NnBevZZcBb2CymovF8MIZhlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
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
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 9eccdb38bed4..d5fa6e79fdff 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -17,9 +17,9 @@ static struct spl_rect intersect_rec(const struct spl_rect *r0, const struct spl
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

