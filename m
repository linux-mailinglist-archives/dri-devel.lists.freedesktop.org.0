Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B1195E70E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 04:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8410E094;
	Mon, 26 Aug 2024 02:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="nQlHqfAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2088.outbound.protection.outlook.com [40.107.255.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E6010E094;
 Mon, 26 Aug 2024 02:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHIvi6Rj4lM8Xnw93NAJNyXwLta2wGqyVFEqfckS4bmk68Btjxs0kKVoo4G6JChCBAkHEkCP36w6YRbNTM89uMIohjaubX//nP6wkCz32+3YkU4sB4lqwlLr+ibkIvT7P0ZLVet/HchCecbiMv7Rw3TlFAX7pjrF/L2MtichrcctjV6caGh47kb3x1vmx3SKyWK/2dh7dWAqfrbeEst7laHeEkBhGm9aNftM1ZY60LaWM9vEe+mFHMt7ykZFCFqMef8hAuuPEC2h8LnV7Knd7lYgMP2jkmd4ydbmzFYS0URYx1mj1aH4Gj7A3qv0Mrb9xBFY4uyDnkrYLGHi8SifbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8rfuUr/xNpvoE0F9bSyecwlsIRnqr5tDaN6W0okL+Q=;
 b=itfkGNNGCFcF8jQe0R41fxu8WX+tf5K1pSImuJaL6ToNIko5WSQEf5h24wbdFS63xB3vOQ2Qbd/RyWFODt2C49cNmjHvyOu7yGZUs4LCugfaCgR7hKZHF5n47xR7gffIcYP7Q3MRv0yufSvhwWKJmTxq3TD+jw5pDSQ0MFc1sntBrVDQIOyV8iHSeKbdnkFz8tS7UFt+fMk/RyW8KzJvNtEGg4VLWW8OShooRIu7X5EiBLoQWThsgUrUGnAjWhqTt489eW1JmrGTIv9NE0FjQDVH1rPg1WkhVndsrkLlt9MBvdS6Z8aTUp44sgqtpXJkJKx4VWBstA+xldcbsvnU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8rfuUr/xNpvoE0F9bSyecwlsIRnqr5tDaN6W0okL+Q=;
 b=nQlHqfAgXVqfhfasPsuqDnisj+sfkcfpNEqqE1wXs8qpAku1sz7+JJljADkt/YE4ButW54mEicPTR41bk/zeO9e07ahjOLrUktBEJaAayH8WqNglwmhqqB51SYsw4kb4AD77k8k7bLpdVNb1IeLQbPu8UQBBAHljuOSO7vunGkAT8zPOL66m/bFX5M0XT9rHHen8DI9jxRV+FRsz5boZhQ0FxGQxuISw5QLw753oeNrGk8iRkIRdKarNSNoiMWjGmNkPCQc6e295WnqbHE+IPX0qpywFwFoftWiRHaUbcup4iJ3PUkoZMJnfOR6iswc/PWJi5mbBJbhAQzIepc0RZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB6252.apcprd06.prod.outlook.com (2603:1096:101:c5::14)
 by SEZPR06MB5877.apcprd06.prod.outlook.com (2603:1096:101:e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Mon, 26 Aug
 2024 02:55:36 +0000
Received: from SEYPR06MB6252.apcprd06.prod.outlook.com
 ([fe80::d2f1:960e:a2e7:406b]) by SEYPR06MB6252.apcprd06.prod.outlook.com
 ([fe80::d2f1:960e:a2e7:406b%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 02:55:35 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yang Ruibin <11162571@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v3] fix up the misspellings
Date: Mon, 26 Aug 2024 10:55:04 +0800
Message-Id: <20240826025522.1474757-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To SEYPR06MB6252.apcprd06.prod.outlook.com
 (2603:1096:101:c5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB6252:EE_|SEZPR06MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 474b1c1d-8144-4e9e-9d5a-08dcc57a8ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014|921020|81742002; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jKLnZFWeYjCCUac2Qa2y9jyxxCmMCwp8O4i+9EsZvCEdhoW1dii7k3hwl64g?=
 =?us-ascii?Q?O+50rRRU3GhoWDCTYmiBD2AUwNlDAkahML/ojnAKOmS5dU4EYGT2iWxabKhK?=
 =?us-ascii?Q?g0JQuKip9e62RHIKrmqPhClvSM+kz5/UxBV77aBgpS0P59vKYBmc61gn0ew2?=
 =?us-ascii?Q?Ew5t/sNqepLk1fYxV8XgNmz7DmvPPfrBk5BrIsBzMWNVCAcazGTubGQC6Nw1?=
 =?us-ascii?Q?fb5RtD8QaFYTz+7KBczhnq8Ug6Dre01AANYWGM5JGMBODKOkj0uxgMOKzLPa?=
 =?us-ascii?Q?EAqFguTic284V+UBbvOwIAwvZncdm+0xcmmGBnpewfuJiAcWHLFzZOzIep5R?=
 =?us-ascii?Q?2io13VvOZiEHznDbyAFBwLBhKzFBbM7m88LwrYKGrBDy8g0chaCVwd2vIcWC?=
 =?us-ascii?Q?6kWvIsLR1mmLsIXq7juZAKbYGbh5BP9HZcwus+pzTPH8wy8kO2CwKtuKH1K5?=
 =?us-ascii?Q?saoMTVcTAgw5ni5bEs2GE/V1ZX6DIF7HwGpM6zHbCyUI7aJtuk7Iw6F5LAB8?=
 =?us-ascii?Q?5Mc2RHkR75qdmG8f/sXuG+Z6DN6W0w0Pl4hnZx5aj6MdtUeWDsdxmkbip2Ye?=
 =?us-ascii?Q?HGxaOH3kVEl7Ogu12RiRdy0MdIhaJR1YcLmaj5EYRkBfCWHlkcKKr5eqvPTJ?=
 =?us-ascii?Q?T7Z+rjP3LGzGS+BImNupunEvn++BqWionpstEmZ/F8QcUwVB9yQpL1YCdbxf?=
 =?us-ascii?Q?Y/7jj9Zv9fLniFVH/J5Kgd0Vp1J04asvcI+HeOM8aanHF7IrUU97IPtWy2az?=
 =?us-ascii?Q?DegFCUEdMmfzSpuIgDm/qkdhBBMsMeH9jkmjIVLMQzF6p5bnxaYhSTP8z4R+?=
 =?us-ascii?Q?y3oy7j2kdc1skJuL95ZLMY67UulPHaV8tIqGRvMxjlMfLGHMKhHJrGHwYknw?=
 =?us-ascii?Q?rCiHOerf1Ui5K00gWNe21PYxyvZhBvG5SZyX5PLXA52QuJCkpZbbuSmP9u+P?=
 =?us-ascii?Q?GthhpbfPmae01V0VtZi81M1ML8XTnzA6Z7JcaLxAdas2b3Ijwuxre5+mr23Z?=
 =?us-ascii?Q?lWq0/mfXqRCDIyYRf+i1U09tcxfjhx9deldS5O1QO3rTb3pzgFSaXX/roRxo?=
 =?us-ascii?Q?LgGCZ/MzqmCIY4PsVo0LQyav6OisdCZHegSfSQ8FUnNQVQsACByedJ/shFXH?=
 =?us-ascii?Q?IdSEoWTe5oD5cub4jjKVVblKHakDa1oZFyb5W29ttYJX3Bl2E6/ePdIq7YsV?=
 =?us-ascii?Q?tufH27Hx6U4hzWD0O3kqOx6HYceNPE8U6wvutoLvNjI82qLmHr4jJGB4gN2k?=
 =?us-ascii?Q?MBF4A3HJeCJ3kO1hzyxs0rDlsWw7yNUqi7FkKQec77h7ti7QKFmNFaf11i+5?=
 =?us-ascii?Q?zMijo4tULprl/pOTy5zdFpVdT+VhlW8CfI7BK41fbqwJPHUe21xFC693/Lw9?=
 =?us-ascii?Q?Xs69rGT2AVlzaoNdx5sdjT72taKDfu//dSOgKl2Q/ut+qiEO5yE4FLhY9IcQ?=
 =?us-ascii?Q?J0/Uf3B8RN3SavxAmYTVImH+GvBN2q5I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB6252.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2WbaEoFRDmYmx8LsKfP2QcWKR0G3Qyz87nnJ4PqiFUjBgJRKtyqLhcguwZrv?=
 =?us-ascii?Q?RE0j41kTqCEPJHNgvB2HhkkXQ8V7z4OAOeFmN6N2Nbl0yQm7MVva05fUwhcu?=
 =?us-ascii?Q?kLxLMY1iXa7WILKhwMrdWF5oWNcXYp9+XX1X/QJ3Qoa/n4VF1ScdLN3xk1CG?=
 =?us-ascii?Q?FosTgQyemWZPYxynQlT6wURh0yIrGW2ungGX6ANHYNCZgUtAYX/rCzFt0lsk?=
 =?us-ascii?Q?9fs7GpnKZ/rmL1HUpwjcDGVOTyTkqam9GNnBAhas3Z+dUwmu0OyRlvqP2Uo9?=
 =?us-ascii?Q?9ZdXHrWuYyU0saHUPX2iSqPLgSqIaV44K1yTgEOl0s74cNvoWwqvaQO4CLHF?=
 =?us-ascii?Q?y42rsA5+FmEOemkFVWpEjKTDIqCywsigytylV41sZIzSzuP38Q+X6XFW3VYP?=
 =?us-ascii?Q?6rWVknmUp56YZTkS98lVmlgWoZC5Q6ZfT1niGW1SUIpUwCqHWEA6nBFwsxej?=
 =?us-ascii?Q?5I7RBTfXPm39wdENmYOjPqD8rsq8dRejB6FZaH0p6MBTu8pc0MBTtiSW0b5f?=
 =?us-ascii?Q?QGkzXf1arnIItK2e3n+f+EdEU9Fmhih6cbxEoMaTm92Gz4IS9vRVqHs9MJej?=
 =?us-ascii?Q?5L6otlmaiCMPlX2vklWLUO4ndRjPH42jAQwF+KgxUZx6Ni7dnlFrPj+682f6?=
 =?us-ascii?Q?JvO+8al+OLgkFtsMitEYXNkUlzcFQ9Zmafr/bnWdeIj6NeGOhIFEz6EnyHBj?=
 =?us-ascii?Q?lwOu5XB4clcJr8nqQDtMt3mf2QXHhNP1fyPYaYj+0QwOHUj6NamovTH4oByM?=
 =?us-ascii?Q?pgOX1WxswOu0BrAV6GP5glf08zN8vjTVdLyPqr+WDNZjv3vlzPbs/4RbVvvk?=
 =?us-ascii?Q?1fk6JvOSh0GT4bm9PcGU+phtn8ErxKApxGzrJE56j6GlWTZUV/GI+VQl+1fQ?=
 =?us-ascii?Q?oVCGwoK1EtgztbHMekv2ARb8Rv/eIvBPzvQWmm6qekxNWTOGC+if2nJLnSDE?=
 =?us-ascii?Q?ogSw5j6ZbbU68eHv2vlyfiiu0diMfAP+pHzq/UeQdfj0mYgS8tqL19uq6sL8?=
 =?us-ascii?Q?bCjOQ/DaQCNPlzbf7KlKCESileHHPD0nOOnvRPodJUUtk4kay6K+6BPe7ROb?=
 =?us-ascii?Q?UwA6ic9ajDnyBEwYnP6qUzacBUMqdGbZJV5mI35FczZ0MdC1zXLYNqnz+nma?=
 =?us-ascii?Q?7FzQSgo+4O6IPYAzLU8RBu0avWbXe9q5cgOQQJDMub2dTTheTkPgCWhYVaZ+?=
 =?us-ascii?Q?NlC5fPSFjpzX+JgQoQWhEL8+DyPTZ18UMquuZPBpfu4Bdc42ZMgWXBlKL/ue?=
 =?us-ascii?Q?ohKChOo/ppRh0RYPfINVhKfabq+yPF0WS4bAgZFzfH5VkrB3uAfDWH6XWs+e?=
 =?us-ascii?Q?JGj+7GkOytpYy6aebAu3qxmUTpUOL1tTcufOCXeg2qv7rbWo1XEOQSit+GQl?=
 =?us-ascii?Q?GT1VsBQsV5NbYg3eTW9O8EASHa4JdCFZCf5XCqGI5FpywYlhXbkiRjsgHYvW?=
 =?us-ascii?Q?XMh58RKJjeqe2bq+Hw2dDUzkwfZcANa1w+CMvEgV0Ub82KIRlJNsNw/yK2Os?=
 =?us-ascii?Q?f9XARGGfzch6M9lsK9foSwq+IKB0Y+DpiVXDtD3xeSLf+gq6GtALnQdnBqZU?=
 =?us-ascii?Q?Bhu9gPn3JO4mvQE1On5NnA4a7Bk6nq+8f122q2kN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474b1c1d-8144-4e9e-9d5a-08dcc57a8ec0
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 02:55:35.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KAo9qX01KoocqNuX/hiDaBb8Ai9m8IaCexBf9oOPPdFbFdsIey21Wd+wnbLB7KbXXwBb6f6lk+s8pd9y13nlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5877
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

Hightest is a typo. It should be highest.Please ensure
the consistency of variable naming.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
Changes V3:
-Updated the ignored misspellings
---
 .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c    | 16 ++++++++--------
 .../amd/pm/powerplay/smumgr/polaris10_smumgr.c   | 16 ++++++++--------
 .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c   | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index 5e43ad2b2956..e16efc44df88 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -1014,7 +1014,7 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	struct SMU73_Discrete_GraphicsLevel *levels =
 			smu_data->smc_state_table.GraphicsLevel;
 	uint32_t i, max_entry;
-	uint8_t hightest_pcie_level_enabled = 0,
+	uint8_t highest_pcie_level_enabled = 0,
 			lowest_pcie_level_enabled = 0,
 			mid_pcie_level_enabled = 0,
 			count = 0;
@@ -1054,27 +1054,27 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	} else {
 		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
-						(1 << (hightest_pcie_level_enabled + 1))) != 0))
-			hightest_pcie_level_enabled++;
+						(1 << (highest_pcie_level_enabled + 1))) != 0))
+			highest_pcie_level_enabled++;
 
 		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << lowest_pcie_level_enabled)) == 0))
 			lowest_pcie_level_enabled++;
 
-		while ((count < hightest_pcie_level_enabled) &&
+		while ((count < highest_pcie_level_enabled) &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
 			count++;
 
 		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
-				hightest_pcie_level_enabled ?
+				highest_pcie_level_enabled ?
 						(lowest_pcie_level_enabled + 1 + count) :
-						hightest_pcie_level_enabled;
+						highest_pcie_level_enabled;
 
-		/* set pcieDpmLevel to hightest_pcie_level_enabled */
+		/* set pcieDpmLevel to highest_pcie_level_enabled */
 		for (i = 2; i < dpm_table->sclk_table.count; i++)
-			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
+			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
 
 		/* set pcieDpmLevel to lowest_pcie_level_enabled */
 		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
index ff6b563ecbf5..d785cc6468ef 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
@@ -1050,7 +1050,7 @@ static int polaris10_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	struct SMU74_Discrete_GraphicsLevel *levels =
 			smu_data->smc_state_table.GraphicsLevel;
 	uint32_t i, max_entry;
-	uint8_t hightest_pcie_level_enabled = 0,
+	uint8_t highest_pcie_level_enabled = 0,
 		lowest_pcie_level_enabled = 0,
 		mid_pcie_level_enabled = 0,
 		count = 0;
@@ -1114,27 +1114,27 @@ static int polaris10_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	} else {
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
-						(1 << (hightest_pcie_level_enabled + 1))) != 0))
-			hightest_pcie_level_enabled++;
+						(1 << (highest_pcie_level_enabled + 1))) != 0))
+			highest_pcie_level_enabled++;
 
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << lowest_pcie_level_enabled)) == 0))
 			lowest_pcie_level_enabled++;
 
-		while ((count < hightest_pcie_level_enabled) &&
+		while ((count < highest_pcie_level_enabled) &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
 			count++;
 
 		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
-				hightest_pcie_level_enabled ?
+				highest_pcie_level_enabled ?
 						(lowest_pcie_level_enabled + 1 + count) :
-						hightest_pcie_level_enabled;
+						highest_pcie_level_enabled;
 
-		/* set pcieDpmLevel to hightest_pcie_level_enabled */
+		/* set pcieDpmLevel to highest_pcie_level_enabled */
 		for (i = 2; i < dpm_table->sclk_table.count; i++)
-			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
+			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
 
 		/* set pcieDpmLevel to lowest_pcie_level_enabled */
 		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
index 34c9f59b889a..3e73f380a591 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
@@ -878,7 +878,7 @@ static int vegam_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	struct SMU75_Discrete_GraphicsLevel *levels =
 			smu_data->smc_state_table.GraphicsLevel;
 	uint32_t i, max_entry;
-	uint8_t hightest_pcie_level_enabled = 0,
+	uint8_t highest_pcie_level_enabled = 0,
 		lowest_pcie_level_enabled = 0,
 		mid_pcie_level_enabled = 0,
 		count = 0;
@@ -925,27 +925,27 @@ static int vegam_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	} else {
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
-						(1 << (hightest_pcie_level_enabled + 1))) != 0))
-			hightest_pcie_level_enabled++;
+						(1 << (highest_pcie_level_enabled + 1))) != 0))
+			highest_pcie_level_enabled++;
 
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << lowest_pcie_level_enabled)) == 0))
 			lowest_pcie_level_enabled++;
 
-		while ((count < hightest_pcie_level_enabled) &&
+		while ((count < highest_pcie_level_enabled) &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
 			count++;
 
 		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
-				hightest_pcie_level_enabled ?
+				highest_pcie_level_enabled ?
 						(lowest_pcie_level_enabled + 1 + count) :
-						hightest_pcie_level_enabled;
+						highest_pcie_level_enabled;
 
-		/* set pcieDpmLevel to hightest_pcie_level_enabled */
+		/* set pcieDpmLevel to highest_pcie_level_enabled */
 		for (i = 2; i < dpm_table->sclk_table.count; i++)
-			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
+			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
 
 		/* set pcieDpmLevel to lowest_pcie_level_enabled */
 		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
-- 
2.34.1

