Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F388895AF9E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 09:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F6910E114;
	Thu, 22 Aug 2024 07:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="fJfVRaU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2044.outbound.protection.outlook.com [40.107.215.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD0910E7CE;
 Thu, 22 Aug 2024 07:30:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrBEqOa6t8GY3mzBUftD6zQrrxlPFuRbBVzjeeR2dJe/QagCNdLr2ZDuEfYj111QOAnZ9L4J6XOOXngfvrlZ4raq345uYS+8/KLUKtGVqby8LGhBKPVmk4hDGDD8KBBJ/bWVHHiQaJiV4aUVqo7RyHq79QDukUl/1ulXl01Q/mHyGUbFIIDP86HDsfG4RcYM2Lbmlc+bLCHIU8csCtO9hJ0N9LmA5zamzGUa25zNBpXH48MKlq8+C7Nozj+aByCT7pWD+R4s1yPEHfc+twLLT1vrsMtVB6LxgY+6LakGU2UKuAS+U0GwUrHQxD2GXC0XLkbIyRuBArAja16q2JixOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6Bc6JgjaL1DliBAVYLTXWq/ys63GjfzrTK1N0acZDA=;
 b=EW7yrYh6uJc8hy9kcuHwUO4fDVF5Y6ubvAaZMvltRfN801GP4GPh2b9rgDaZZ6RqFN68yjeqg10E+CqJjib6V+wRvb1M4BdlKItoE7bLd5CZh86zKFRVN/S60mtYBjsUI6UGqkKv+zRyo/ZnOsEsfr6Pn9BnVrRH/xjYsSTLl/vhKTTcAKWC7IXhHsDdkSZ4hmqHscSIXSQXVIEuEarla1oRVTaEB35HHNlWxja293lqRA+UvnCG8Wk7dZ6No9Z4I3hp15QwrkSsc0LPhvqeSjCflu0/ngXWwYL6eDSQKaIH8wS/U2YWnrn9pLtiYSSuhmYYDfVoSa0ne6TxrL/W0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6Bc6JgjaL1DliBAVYLTXWq/ys63GjfzrTK1N0acZDA=;
 b=fJfVRaU3nVBLDOEYUF7zp/UlV+6rtJ1xSo7wbOEa2nKY8hk1eDF1cmIE7E/u4kHqtSROxw8KQ3FlMsJ2AV3+n/2FBXhfl1QvlZN8axbd8nTDW0TVgIwIJlS8RRLpXgoOPAERtzceRyY0sxrT45yFeR9b8gQdbmGDm6egFKy0OamSb/Z99NgnXFMOr65NLWs96/i/b5qDtsQ5RZmOiSmJkH8zD5Q5q+izGptpmDiXoUCGIGd44xXJMdgJ8069Yu23JgjFkmVb0LYRWlBTDyDenVHj2vuWPPSSsibfgUKPSp/3f47I7Lr5+Rfi4ImmHFqWm32/Z3EndslYUS/DG07VRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by KL1PR06MB6964.apcprd06.prod.outlook.com (2603:1096:820:121::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 07:30:21 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 07:30:21 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Yang Ruibin <11162571@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] drivers:smumgr:Variable names should be consistent
Date: Thu, 22 Aug 2024 15:30:10 +0800
Message-Id: <20240822073011.1352849-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|KL1PR06MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: b78c7bcd-f5e6-47e1-7644-08dcc27c47cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014|81742002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/Y83rcRkZe1bYk8hykqyMukidZ72VjGCYdgaZnuRSDGITpvQMz4nhtZa88Lc?=
 =?us-ascii?Q?Idf6KXtaKATj1QkB+PlDMMlpeSbU9vOv1ASg8nZ3qkYsDtXI+lQF8inGxZ+L?=
 =?us-ascii?Q?M2H1j0ofYpcRuK1a/RGCoZ7ztCILyGbJc9271mOn4NK0SyMRtQ3l/T/3CjXi?=
 =?us-ascii?Q?HP9S5kGt7FVxigadlR2y8XrOmSgUPOqdmZi8dQdVR/0htmfXC8MQLalSUE0k?=
 =?us-ascii?Q?3t/LZyHhh0t7Wf79ddkHgMH6EgLqkroKYhDAoXbmyEFoOXuFC7oFC7tMm7+Q?=
 =?us-ascii?Q?P9t2sroIyHYbGTzoFe+IRDD4+J5VUlOpxUvNjxLwCDX/eIbM8PWk09TxAzN4?=
 =?us-ascii?Q?uatJoX60cGB7tMUQSlG1sZ6IoVNTvE3HXFiKnletZFLngJ/2JZjoy2vMXU7e?=
 =?us-ascii?Q?dMGcjNKJ4PD8YfVHlRI7EnYfux3E6olXR2SAuPvbsOB00xxGtEH5JoqxKnq6?=
 =?us-ascii?Q?C1QPPINtevMDPMqJ/EL8/Vmfr16cW82H24jo47pY9a9zBejJHSzWV1uaRZVh?=
 =?us-ascii?Q?TtgkhF9UDacS3gJ8kE5P+bgQVnNw+I6W4dUxBQMDM9a7NqYXxOlkqdjhsPxh?=
 =?us-ascii?Q?FUX7QsI4mjSQZHqjQUnbZyFxyMeK7h8OA91wP86bT+z9yp6gPk3BAEZ1nZZd?=
 =?us-ascii?Q?3zNGpX59vacURWlpz2gzrq2ESAgzwSwl8EoEs3g8kCDKjqCah1a8E/yOGZm9?=
 =?us-ascii?Q?osi7m1WZgFgiocPJ1ib3gJ/PveysivpvOTVoiCrjC0daG4IYhCVsUUrVVcsd?=
 =?us-ascii?Q?dzaFYF+Uoi7IjlLj/XlztJK3DMADHYpj3gRoP1E6it+y3UXJR+8N0O+Cb5Sj?=
 =?us-ascii?Q?rPbX8NBe2PvfGF2kfBPCN7DF/miOSTiv+/PxRAslcxQ9LeFQVtkuC/E14dEB?=
 =?us-ascii?Q?uobgpJSSZ1vc8hcQH0asX7YEJBoy3jkWq2wihvz2WQx4fw/bTzqrAycp3OtO?=
 =?us-ascii?Q?K8F2gIXSv22IXiwgXgfYr7WZGdZ5yYL8HYc2NI+dezfqyei1ysh0CFTv51ar?=
 =?us-ascii?Q?Dj01EeUbnMi9y7B7a+f+tUIAzQBJOLwqt594LXSaN/H3vTYkXrnPb37SxuVl?=
 =?us-ascii?Q?mUAh8Bc49YX1hH7vGKTBDm4jnE1NDaMVsnbA4foZA9A1mgs8kylps3V/KFaq?=
 =?us-ascii?Q?BqII+MfqxvAAHjiLVF+9/Qp5u2fV5vs8Wna1WGatFxBMBGVLNeuqzmBIZhkV?=
 =?us-ascii?Q?J3HMdo7GGtleMebyDZgdvZcoDsOxF/wpPtAivnKHzabwaxZFOMRMQjMqiXT7?=
 =?us-ascii?Q?arb1owZO9IAv7QoWy+zOTyMSOqvEiHq6lnoTVOdCrXxj5BJ2ZWSKGl4ldsnU?=
 =?us-ascii?Q?epytq2/tUfzXvzQgow9zqlj9JJ2mMgBq7C3VUdBUNAl1odQAiVvCRa1k9kdf?=
 =?us-ascii?Q?9pKEjnflUWOaUGNfOxNUvmCqPPMIHXEmk5uSmtEwiox2LDRAIQB/ustTuDNG?=
 =?us-ascii?Q?uCTR+5CfCG4558tNmL6qZd/f2d+uZFvN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6263.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h4Ku9pAc+5ogDInMVRr+3TkGgDLGPhuEjxOHZVzDAERN8RAFXIHffBLMxvrT?=
 =?us-ascii?Q?xExEdXozwwt/XA0WP4EA8tuu0n4ic4+IQhC6fP1dRDD6jKR8xSUbFuJpntWz?=
 =?us-ascii?Q?J5KrO64aumI6bBsgXbZJCNUf0xVoJKKJrtTQUgtPvLMvDO5BDWEYFiT19OzY?=
 =?us-ascii?Q?hqDsWXcHUdEIddkt9QEE1xACCl7NfmumSLWk3X+52fWdFEGbGKjEaoFMyZej?=
 =?us-ascii?Q?vtlb8/JWNFyVmlMMYkas4+4ulb4oXxsvxzLWBlDOD/bw3BfWjhztRu7R+kep?=
 =?us-ascii?Q?2fLubTX2tadOjTPfwbE8pdcpVKCs1/A5IRcNJFATGNc0HNiAmytAl2qFxBpY?=
 =?us-ascii?Q?d/X3fLUJiq6ARgi7YQpMjBiDINJS97I/Sc9xPDKAipksrZ07tNejMpOYrhmQ?=
 =?us-ascii?Q?TYmo9ss/t611Nh+3dUE9oe/iRlUt0ne4q6KWwLhSplgK2R52OKh+hcPJb/hH?=
 =?us-ascii?Q?D9C1D6Qy133rAQ9vxCQzC1CLVaxUKndEdrUU0WcdCdTQt/Ggi8YUlAIjmzwV?=
 =?us-ascii?Q?2ugwXF12IFCAhyHsppjkhuutTRBPcy2Tml+SRzmvWTPX4xwOIyaCYh98okUl?=
 =?us-ascii?Q?Oc5l5wNsjncM2FvSX8P4EOHObPWlPp47+lPub3ZIESk3IoA3bYn2HsWvuU6P?=
 =?us-ascii?Q?09BCVO4mRzwtjTNapxk4e7bTtPgJYlkSFXNwJPiuOgigf2Vq6FssA/kYC6oR?=
 =?us-ascii?Q?0sP+dphtsT+2QU/vWDz6eTuutIsGc58+rq5vh+wIzvfc1fN9QIco+8MuUx3R?=
 =?us-ascii?Q?KLn5S2TLNooG22KJeefde3H0XE5j2hQlnbN97qZZPXZack6Ap8F1sLqOsqkH?=
 =?us-ascii?Q?3qOJ4HwmGHkX3IHxLI5WMRzBouzVKXtBNSk7Dhirskdu4Im8lxwAgI2L0s98?=
 =?us-ascii?Q?lDwXV/nwHsNbvqbKD9ubavei/Q+uV4W79v3FVnjDUoadbssEUUZawD9fVy7e?=
 =?us-ascii?Q?AIIjKmF513sw2uBUz6eNVypALzPvAaEBK6DZbekPeLccxQg1nyKeyFcRwdSp?=
 =?us-ascii?Q?9wegnavF40oFxqTjPMSU55KkeoYh5X4UanjWLUlJ5lUGJVtruUnvA7HOwYEU?=
 =?us-ascii?Q?uds8ZP1QpYezl03C2/2QzkFjEkN2lNjH4oK6MUHmsunsu96BrNU3tPyr9LdY?=
 =?us-ascii?Q?VnP9WY3krPd9fZdP+HJ9gI2cGUmVpUqfikN05ykE6Kq/Z2uxPSfP4690nSr1?=
 =?us-ascii?Q?LFB0rNUH9J45CU2S6F6NccANv7qEwIEMzvvsZMAnJfo1PdWSD30Vi3emhaCk?=
 =?us-ascii?Q?o9/2O/vVBm0bH6jEJdV3De2L+utTfrU00slKfcYbUTap9kJSkdd2WFzfE9DD?=
 =?us-ascii?Q?FK5PKkzcamgfocZ7g6bGJag96RSZJanea9n+wWHL+qQ9iMHkAJweepDYwsw1?=
 =?us-ascii?Q?pEgUjl8CGuzL3xwNB78T0R8q709Iyg/RNN2ViOXMzLvUUzotUVkH0QR95hs1?=
 =?us-ascii?Q?9M1F0hBgLWTHiGbwqYL9Dre9bTMXL7y/39SW803Z9wLbARUMcmNP+NS4r9EP?=
 =?us-ascii?Q?6idgaeovQzqyaeFy2SmNaWnovI6qvOVKb4dvYugd1p1ykyfo1xXr7akcaksv?=
 =?us-ascii?Q?vWckq567H5yeTybbnkUtCQcxucLmw6FbtIxFa3w6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78c7bcd-f5e6-47e1-7644-08dcc27c47cc
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 07:30:21.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l38wv/8DR7gSG9w1MWy81j+YxdJUW+Cj1Pjy9eKTF/Pze4+u5mV5INdv0nfIHzRJY/pqMauvJugrlt+qHcpXBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6964
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:49:09 +0000
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

The variable highest_pcie_level_enabled is named
hightest_pcie_level_enabled in other modules.
Please ensure the consistency of variable naming
and use min macros instead of the triadic operator.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
 .../drm/amd/pm/powerplay/smumgr/tonga_smumgr.c  | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
index 6fe6e6abb..60b1387f6 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
@@ -700,7 +700,7 @@ static int tonga_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	SMU72_Discrete_GraphicsLevel *levels = smu_data->smc_state_table.GraphicsLevel;
 
 	uint32_t i, max_entry;
-	uint8_t highest_pcie_level_enabled = 0;
+	uint8_t hightest_pcie_level_enabled = 0;
 	uint8_t lowest_pcie_level_enabled = 0, mid_pcie_level_enabled = 0;
 	uint8_t count = 0;
 	int result = 0;
@@ -747,8 +747,8 @@ static int tonga_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 
 		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
-					(1<<(highest_pcie_level_enabled+1))) != 0)) {
-			highest_pcie_level_enabled++;
+					(1<<(hightest_pcie_level_enabled+1))) != 0)) {
+			hightest_pcie_level_enabled++;
 		}
 
 		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
@@ -757,18 +757,19 @@ static int tonga_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 			lowest_pcie_level_enabled++;
 		}
 
-		while ((count < highest_pcie_level_enabled) &&
+		while ((count < hightest_pcie_level_enabled) &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 					(1<<(lowest_pcie_level_enabled+1+count))) == 0)) {
 			count++;
 		}
-		mid_pcie_level_enabled = (lowest_pcie_level_enabled+1+count) < highest_pcie_level_enabled ?
-			(lowest_pcie_level_enabled+1+count) : highest_pcie_level_enabled;
 
+		mid_pcie_level_enabled = min(lowest_pcie_level_enabled+1+count,
+					hightest_pcie_level_enabled);
 
-		/* set pcieDpmLevel to highest_pcie_level_enabled*/
+		/* set pcieDpmLevel to hightest_pcie_level_enabled*/
 		for (i = 2; i < dpm_table->sclk_table.count; i++)
-			smu_data->smc_state_table.GraphicsLevel[i].pcieDpmLevel = highest_pcie_level_enabled;
+			smu_data->smc_state_table.GraphicsLevel[i].pcieDpmLevel =
+					hightest_pcie_level_enabled;
 
 		/* set pcieDpmLevel to lowest_pcie_level_enabled*/
 		smu_data->smc_state_table.GraphicsLevel[0].pcieDpmLevel = lowest_pcie_level_enabled;
-- 
2.34.1

