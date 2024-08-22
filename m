Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ECF95AD82
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC5710E746;
	Thu, 22 Aug 2024 06:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="FXmo/3tS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2056.outbound.protection.outlook.com [40.107.215.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9538610E746;
 Thu, 22 Aug 2024 06:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCERfs96POD3M/O74g8SCTnbi84ZlVpq2yzYOF19SaBTlPGl+F9o3GuH828sMrXjzxLNzdSC1wPU+T3bsr5MU+nQHR7yUHbactsemdNo7zT9kXkmFg+0FPrtTpEmRsc8SfX2c45EXKH/piWbQXMEYDcjvtNz4Iozq0mK/uYfSTl7mNe8xiXhYCbRtRFqB1h/nsZK5YV0Sw1uExExc40p9srZ+akDN/U1BRqBTqYy6Ayj4EJ5v7Lf8An279gP8ntu5vdxis8l5upk0sDnfDf+yRcmDi/InKMBEFaSJY+ZXrDeLaczU0+rNI54EWYCPwKHvjnkH7qjjJymWHL+WLpxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDzZO710rFLkj1elfDytM9c007FIqcUXwciJ5i4GCmw=;
 b=R+awt0WgdWwZ111rDg2npsQzNFfFjE0b7st26weGaCzQZD5pRdOkxaXcosFyQ2n8ey/3WsUdKDeRGaOhgQBqwDfme/ibCeZAuU1lWmbHjtk8akX8v0zcsoHaog58RQP0+Sr816605Rf9xaE1IpmY9VIarjYeVOiyR3E6oRyAjgst3plRbt1tirSTlOgGGz1VyQCtwHWQGANpC5Qoqz7w2Y+MZFOsu8D2Psoku24zQwC4gfW+esY2poGbg8PAX0tTBDcEoOZOFUDAfLv3q69kn2jChC6lWpf6NV5MYAdy2PEzZEgKljf75p9jAtKr8MZP0VoMF2a+iZQYAc4po6JMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDzZO710rFLkj1elfDytM9c007FIqcUXwciJ5i4GCmw=;
 b=FXmo/3tSEpJg5fUvlezlx7X6qdmwe83SKCSEPo8zcH9GO85fQ/ziXNH4mkR4mthVzYsOf4PA9BO5lL4Yy1esHCm9AgNiQNsjSxD+2T20Drcn+wJf9EzqSuq5NC53OsZyOw9yPTU7TyiMHlt/iZHA2ljmykzajYqs6ZmG4jyLrmBvqHt0ye2+UcdlBSG0QsdtjeZrpPixXKccrlToaUxNEqUycaBc6gkPfn9HEuczNEjWJ6MxZ/MydU4ozB6Z1qkWmxqAH8W0zCLGkx/u6Rv3RAp2FprEzCshI6IsUDirAoOLqKsbwSuHemIfsG/OWFijRGqgZjDP/sd/P9+WhiwWmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by JH0PR06MB6344.apcprd06.prod.outlook.com (2603:1096:990:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:30:43 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:30:43 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Samson Tam <samson.tam@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 2/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:29:28 +0800
Message-Id: <20240822062947.1318340-3-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822062947.1318340-1-yujiaoliang@vivo.com>
References: <20240822062947.1318340-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|JH0PR06MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a99653-18d1-4f26-1c7b-08dcc273f314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O1e7+QoSZI5tGaJo83rlmyp6IqisaxZ80nspoBss2Gxne4/xCXKzc/AmjeU9?=
 =?us-ascii?Q?q2DizbssWzluUE0OiF9CNxogx9Fi+qv+sSgp272Q5wBAsW4xcdIGltPCnRCg?=
 =?us-ascii?Q?5+Z/0q67dXFarASeOLqv1cPcdOHkbzxu4wHFcQwkHRyavOTo5y+6GJkzkvbR?=
 =?us-ascii?Q?ApNrw5ZKbKmSIf98LVef7Wf0EAk7XZPiXgS1lg85KMQSm4oGduxenjFQYgy4?=
 =?us-ascii?Q?+eep2o9jfd69jOUDV/euwVcVyNNkVs+3biP36cEs2rPg+QKbUVf3I6kMAfLG?=
 =?us-ascii?Q?+ohjou1LWfrAybc1GSB8r+hfQIrBlb3mNFFJXdhwR5aTxuK7NO/KzuMUu+Ol?=
 =?us-ascii?Q?IPPYU80nZDOqy+fQK6uaYiYPc7bsabK0nfhxav+6Z2pZUQhm6SUk+toFqtOT?=
 =?us-ascii?Q?Tyk+28S/NwEyp3dx5wynEiL8uxTtH+RHWbpg+biCP3BPMv7ANsTjWewyKv1k?=
 =?us-ascii?Q?NLfn5kjYdj59e09d+dj6YdJ1h6/A12GhyBis9CFEG68Yc1tvDppTcIoKYOoN?=
 =?us-ascii?Q?seZOnrFgryScF5NxVbyRkefLTY83gJjVs5BAojRgXsSQTX3Y+DHwKSDD7eGf?=
 =?us-ascii?Q?zowvLEGKZnS3wQZ6oFXNm3xViv7/WtYqjZeUGy2PMgH6ZySNhFjJgShhgiHY?=
 =?us-ascii?Q?XcPzPBRC3uwkYarOEp9JCR5AX1/WOTj1ZbnoelZm2IaMMCCw8gQTYrrH8Ej3?=
 =?us-ascii?Q?qeg91+F33gBQZ3LSvzx8hvSAcPlBgetzpzlOEq+8WKi9AKyVGvqmtZubjBSk?=
 =?us-ascii?Q?6eJgAG+B49/HCF1iNr9ks9oU5Y5NrV9/e5nCGLVWXXUibGFLIL3j/6sJT6e/?=
 =?us-ascii?Q?YCeGHxovtrrm2KSrSbfeM60dizJAjNOoFYMBgVpxAxvzBFkXNNrLKopKjd6v?=
 =?us-ascii?Q?erwclMYoFH2lvQ0ud9btx7ZmmFIxvt49+q37SCp9d2/SF+kRLs6N4qqLWppZ?=
 =?us-ascii?Q?tdASnCiKqnyz14LaCu/plfVyCrzVqRFr2/cqmjHGHmfivHYPL5aayE8l2uh6?=
 =?us-ascii?Q?6AyjvrY2sYHnGXTRwuS3wGG/+FfmyAvReeNAER6OcfMkrq/Vcxuo1Mp/scxc?=
 =?us-ascii?Q?i0FKAozjTRtgDlHUvA7xOQ9Z5o3zIQHgVjncw+DQCsGe3K84w8/y+WK27yiN?=
 =?us-ascii?Q?gu/G6nsgRdsuYJjgT8DKvXq7Tu+DRedR9wvAZTFFY3ANhRMz7E/BqHE/KJ2a?=
 =?us-ascii?Q?vF9gzTXmDWVnT238AJggzHzdD87xKuj4XcN4fDEVlpuAbHSgI0WT7eZhHnXa?=
 =?us-ascii?Q?+NiloA61lS1gzlPnb3GC49FZSRppidGoTsQYYn1qBs5PmUTR+7sYvvXj4vNs?=
 =?us-ascii?Q?HlActxjJWS6XGKs6IwXVhuMpniYto3/Iwz503PrC4WYs1750S+qYtE8ySaDA?=
 =?us-ascii?Q?nUEmXR5d3nL+fKi1VjzSpN2595RpiuzIGhJ0a3oaljCvETOv37F6Ve8Epk2O?=
 =?us-ascii?Q?/DN25Ln4Rsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z4p3ykxodpztXJfQqKckDuZ/4fZSmDeAGMdwPEfiZtfQGpJYDEV4lbWk4qgE?=
 =?us-ascii?Q?RrYdJPRBgrkC/zuEtX0p2RFjEUYLMG1j81SEWOBRqnw1XxwRP75hlMo6G4D5?=
 =?us-ascii?Q?0Gl5cDb6I7OvGsezKG9hijEBNnIJC4x3CfPNnk/GDIt1RGK4ZpCuckrd7vn9?=
 =?us-ascii?Q?tFyKhUotH49rqA3Xcz3fl/tTsJN5Ur5R+V3ub4n90NjBVR3EocKzYHElX9DM?=
 =?us-ascii?Q?zdDZau8mnCNx3/LWBuD/+jYNs/yFYnlWPRrAUPntY6uMY/p0ilNhSEpJ8MgS?=
 =?us-ascii?Q?6+AiobO2aHwIME3vsluYcE1vxj/IISyc3PT36zwPv3RnX9ftHFfg9vm5MAno?=
 =?us-ascii?Q?h3OrBXSjj6XFLYGdIExbdZEte8sCIgVvWR+Axf4Lni/jr3M+lpL5AAiZTGRH?=
 =?us-ascii?Q?tT+g4UOzVrftCnJKlbfQs+8nkkg4RsutNkZsT3TuhBAwLHwQg7T7lY654egG?=
 =?us-ascii?Q?iqgy2RXNNeGeu8uiEuo2ljpzHUS7vS/KHh3cbvBfwLbhCEP4yod6OE/xQiR2?=
 =?us-ascii?Q?gJuUbnFq3d83Py9sFfW1v9Li0tAcGTE1ECPH9hnnNzfpUVE3atSMdqNTqLXT?=
 =?us-ascii?Q?HoeROCUdvvKEK/fVHuifluny3tiecfUyw78tYPxkAJFa/hH6Rrz7ZI9FndB7?=
 =?us-ascii?Q?VXvQcVp4Z+iWoKTxyet1h0Lq+Ey4At4kew7HFqVUOJ/Xj5Fxf8G1zmb3rsWk?=
 =?us-ascii?Q?5weNOi3zIbEAN6ze0cx52rHfD1+z1Iq4fiqUdg3paG9YZmsB2/GTlyTHA7Hx?=
 =?us-ascii?Q?kGbZObPBy/hHxvuISbXanv9GplDfXfeMYc9Ms1FnZ9QWLy4P/gqP9k6Cu+RX?=
 =?us-ascii?Q?DQ3xdcwXbv81yO8ihc1OyzIT/25A/7Cy4bBmffyCCIVyvTv+TQZVXe7EkucN?=
 =?us-ascii?Q?0MG2PhJMuwd41PwpVoEisB0yi6NK9/b81t6ukxbKMbrRl6PK1DU8C9DOSUop?=
 =?us-ascii?Q?pQZVbXfSM2HG88imgJaZIqsKaDa13TAkE18TlPKPVSjCbDot8WNgRcIWoajf?=
 =?us-ascii?Q?YEED30V8oqZuInuAncUzLBunfXxQXVrP4GT/3XSYYWZEQIXtWlJilXkqDasA?=
 =?us-ascii?Q?ewGlhMQ3QhThYTWGROUXv7ky/CzF5eeFN/7/jzosZ0/hylgrwPM28FruGWaZ?=
 =?us-ascii?Q?MAZpJDMSDponyAiSIyDq8zknKRCkflTYpm16okBWzu13THIHytgbhz6qoi2N?=
 =?us-ascii?Q?R9SStNDHIdcUhI1FAxXePUV7HAc1yZIiYwoDdLhV+6JMPAxnMr2nKpSpsD6x?=
 =?us-ascii?Q?bvxuLd5tO1wdMm2LLYYvoNTqJuLa/CzaY+d/x+Xk+/AIEr14F4vKXI9qE+4E?=
 =?us-ascii?Q?9XeqafrjJ9r5KE9CXoI/bWogxcCc8TUn6Bgkgs5AYWNA1UBK/N5hTOV5Dxyj?=
 =?us-ascii?Q?8uhNMa6t9dE0g/qKmNj2kvak43rE90egOGI/1qYDpM/f+rLdytVMzDsGYzo/?=
 =?us-ascii?Q?38Y/1riXfmQwzBbYuroFrHv6vtjN31920n4umtkZzQo3ucXVBPuEJ6VDVwy+?=
 =?us-ascii?Q?Nlu6JcpIpJ/mf2qZlXLYKbOOR4VGVc9sRIl9Jjehp0YJv7rZxcNpK4Fc/Yku?=
 =?us-ascii?Q?uomNRdQnPW+uQmZjJ+vEWffTjiOI1AjpSeCiIRqk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a99653-18d1-4f26-1c7b-08dcc273f314
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:30:43.6768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spBNy9p0cO1jIJrzj2eEPw5IjubmdGNFDCMV16+sjTPIrjcdf5orbGhP6paoHJOso3WitPycvU/mpb6F2KNehg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6344
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
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
index bb4f3bd7532e..4975d47b66d8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
@@ -311,7 +311,9 @@ void dcn2_update_clocks(struct clk_mgr *clk_mgr_base,
 		new_clocks->disp_dpp_voltage_level_khz = new_clocks->dppclk_khz;
 
 		if (update_dispclk)
-			new_clocks->disp_dpp_voltage_level_khz = new_clocks->dispclk_khz > new_clocks->dppclk_khz ? new_clocks->dispclk_khz : new_clocks->dppclk_khz;
+			new_clocks->disp_dpp_voltage_level_khz =
+				max(new_clocks->dispclk_khz,
+				    new_clocks->dppclk_khz);
 
 		clk_mgr_base->clks.disp_dpp_voltage_level_khz = new_clocks->disp_dpp_voltage_level_khz;
 		if (pp_smu && pp_smu->set_voltage_by_freq)
-- 
2.34.1

