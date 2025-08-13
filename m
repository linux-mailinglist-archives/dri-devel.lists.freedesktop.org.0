Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C87B245C2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F8710E1D0;
	Wed, 13 Aug 2025 09:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="c3cWyFWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012035.outbound.protection.outlook.com [52.101.126.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D24710E1D0;
 Wed, 13 Aug 2025 09:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUu8jDj4PEEV3WaS8KN8k9c9HbPOYJn91MTHG+a7QORiqz9/rksbmatohhSm5OulEedvXXEmT1od3RrMaMNqeCL4j8UPykPW36TEb8Yg4P2ZkwH1UD+IU8od9Yhl+1wlvtcqeiGeEB5GB/zyDFRIaU4RKzn8hCZNAO80Gm+8W5uV2OkMxq8KYMx36AqToFEDJddYfp7UM5mqevCZjgJd9ztlnh/pTJd+QGNQTwVlIWZMXD/5gw/2r7DEv9Apib+wGs72WwSYvs9T8mlH1X2f7QY4CKGiRmvHWvoU3fIZxkaCs1M1cYP1Bp6oxkKYkvuv1RmRea2OmxjNq20xMRB33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOz+3Ln3dJGVBRCDNNXRuy46iTmND03+zmIRErzeuyw=;
 b=YtDKoLeX6/woWB90D32ICr7M2lCNy7UHr2koiw4WppxtVaqllqvBe4jM18lL8c/OV2RVkhLtONDpiSTS7JphlPl4I7IQ4sV0bM1CxcWYsFtRW9NSp1E4hYA2wWbytlac9YxBRBHBWrmMS7pIBOQQHX6PSsN6ka/BUkF9bI0cvlmFckAdMypQzXi8PKJ8djTfOmccJPEvJSlYGbqnkpyw+11+TOuvbCYu7ZUPtITWXHxwJjR+PelQHxRPxRRDYY01xtC9NdBzKWQs5UHvTD8ULiWgDKJ62ICLOl+Ff3hReSXSkvv4Wy5Z3PWWs5kbNH0TORqcZgoooyd31J60PNCouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOz+3Ln3dJGVBRCDNNXRuy46iTmND03+zmIRErzeuyw=;
 b=c3cWyFWkIADV66TjGkhDh1/6ROpolGnACEVhnrwluV1RVHGiGO8OYtwas5TdprK4FKe8By0XuzGE4uIfS0fpyxNuEkrxF/rdCIqFNaOtkSbM2rIE9bu5+6jMnluezteKMRDQIgr2d9Kf3kWXPOuhEko45Djua61U4KM21XT3FiEIgmClmRGSt6+NDf8jAaHqWoY3bo2gLGVc65hAGPmfx5JEB18tOaenzGZrXkNTROP2sMMrQizvpwdwPQCGQiC9I0MGlpIO2NawklphQ2gqyVNotak5ycRVgtTxS9pCnh9WN+BAjJkd1STTqN9NxJzgCiVJR++cLJ6zlxcqcH22lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KU2PPF4166F2409.apcprd06.prod.outlook.com (2603:1096:d18::491)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Wed, 13 Aug
 2025 09:43:37 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:43:37 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/amd/display: Remove redundant semicolons
Date: Wed, 13 Aug 2025 17:43:06 +0800
Message-Id: <20250813094308.554035-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KU2PPF4166F2409:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c771fe-4ad9-47e2-7a49-08ddda4de086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J4njlZD9oXCJ/bP8RroMO7PkLOeK5S5GT+UHThlNTf3HMBo8+4oarN6nfOFz?=
 =?us-ascii?Q?XFhKXPGORHPooY9oYGBfOkfb86C7ngaKL/RGI1m7QAUIs/v7wqgpk2U6k/xB?=
 =?us-ascii?Q?rLayvXofVCv+oKJRn8/CirwKYXcEZB9e+w9NLnaI9UQ48c6jIvuSrS7UXSeX?=
 =?us-ascii?Q?E+lsQJs3HnvG+ShfK3hoovrfbF9hp+SLfNTBFVw/9UjXMPLvRZl9aWZeuxYl?=
 =?us-ascii?Q?UqGKVevH9fn+CMixmoZG8iKroSJ3ll8AgQiq4yaUI5vOJut1zyHKNcQpBomQ?=
 =?us-ascii?Q?6cpiaV5vA8ekMhrTKJc53obRRjmonp4hrw7VoFWX1l0pmjTHF2oz3Kcx64t4?=
 =?us-ascii?Q?bCdE2X/E/WmaUA0DWApwcJBSm8NIimZj/C0YZT1LDdkRBIHWlGbZfs5ZkPyi?=
 =?us-ascii?Q?sxgAsdIGxujeCb6xnFpSRReuu9RH5c9Q3l1AKHyj0tmWgqigH1FOthp8NXwL?=
 =?us-ascii?Q?ADOrDG77VejuCmXVyk7PxibWSbfVI7bRa9P3BlsIO8lIZgo9U5I3byNaeW+O?=
 =?us-ascii?Q?WAnbrOOJaT+jikgCBlpbl4eRw3DLRIV36GrdCg8l+UEG7R/lZGV1J5lQoXNO?=
 =?us-ascii?Q?GW/j+13NLqHj96XcxAACXYZOz4ZbPnMl6Vva5ePYdJuidwybA3KE9dqdSjMP?=
 =?us-ascii?Q?iCma9UlrSr3f9nGFJvQqjdO0ZU56UxkDLcn+Y2S5CK0XmOU/4KZl8RWBKnhS?=
 =?us-ascii?Q?jEdfRJFZlDiswQSf5VcC5NPSJWAUIaFPdmTAxiSgivOh4fguGxCnlUemqb5r?=
 =?us-ascii?Q?sdUMCHtYHYVxF9eHtx1/dZzrRjOGT3+EOrCbnjB50d6+DNxdHTMSgrTSwOv0?=
 =?us-ascii?Q?aHIG1/IAH1DuDxAya0Ccym89vhKHxRy7e29wcADTpjYT3yFxNU8Guso+GyBD?=
 =?us-ascii?Q?Ss44o3tBmKllp9H8/Ep4d1RFTh1X4X/h9j5qWH/8fsPlTixJ49cezTaO5TXR?=
 =?us-ascii?Q?TzoQsEEfEEAQMjmqa/hOdSR6i1bJxp/2DTAIYsy4PfzZEUMH645dPJmBRBgE?=
 =?us-ascii?Q?6BxIZ4RzNFdAvA96X2xxK1a4apvePA+7ii7zItZvKDhA/Jh/U4MrYzijj0tq?=
 =?us-ascii?Q?8SCF0xDIuo6Qv5T2c/TA/hK/9KOmu9x6X9BCg2d5bHfrbbxdzNy/Yo3BmhdA?=
 =?us-ascii?Q?52KuYGiTYHDmlaGfmQjdVpNVrT2Gy88Z+gPqP4SGxpiZlSje5xiYgdiysTgr?=
 =?us-ascii?Q?ty8fo/cY4qjXGDq/kqzwjoGkni47qByr5RhvC4PN9uGnQ+1+ThkfiOz56qSv?=
 =?us-ascii?Q?JgG59nHOXWsyTZpdJCYZtwOM3DiD4cI2rd0SP6Bri8Y10eiRjBQglg8sMzTy?=
 =?us-ascii?Q?crkUmK7auNC+OqPXsR5hJL8iPEcGSU7hQU9PHIynJxR0DDurf7zowqLCQQZD?=
 =?us-ascii?Q?WOKfdjgbDSShnVNj7vVI5AR2E4ebyYmIvg4UGl0O2gOnucPcqOWP7J3GH3A+?=
 =?us-ascii?Q?LfEDwy7X+boSe5XHYC5E9aEv/dSghTxsEEQoaZPx3Du1/B7GxdlKSitCi5nB?=
 =?us-ascii?Q?Gznd1OHzNNP7IRU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pdXQreQAgQ591UZq8+HHWL4nUgCh7MqdRz+vIS+KcBZCyVx6JXssRDXJcIj6?=
 =?us-ascii?Q?lgvPrMhZ6CWAU3nnAPFaKs6goqrfabvKA18TwY/xCCsYzm2GXllkcWbld82n?=
 =?us-ascii?Q?b8D5hFDT91q1KpYqId6jDFddhX9zK7RH1pawE5eIz/0nQWyID0VfSrQdrlmf?=
 =?us-ascii?Q?VOY44zgPwEH2hMR3Nljmtxn3dhILx0txYmm0MlDl/TuUvyMP2OfitvPirWfB?=
 =?us-ascii?Q?t0wkM4nF9BJFdipUAK1k4O7GixyR/njgHIwDncVJnNKgX5084I82yE8DX+u6?=
 =?us-ascii?Q?Lc6xFs0iSynn1qcR0evEe4Cl/hZ6ed0MtaG6VnughVU0AGROzJe/ORX0rcq6?=
 =?us-ascii?Q?BB/Bhg79J3biVrGfQJp2oppsqxTD0tG9byWTtzVmPeETYQQFuXWvju9MpIZK?=
 =?us-ascii?Q?WTEIHodpVQN5rKqoGHjZp4ShMzPKCPVW7GrSljrurLloUH3igrhcLMoUvrT5?=
 =?us-ascii?Q?ADUMq9sJRDlGzN+zxXldbF8cGsbNJsrGtM3LKOSkDfdEXL82S9C67wm3RVA7?=
 =?us-ascii?Q?RjIed1vnfyA1N2gmHQ+VqFKqUESM1onakCW3T035yVP+V/USf+B/N6ZOmkJ4?=
 =?us-ascii?Q?B9cMgeAOu2A3vwsuMyW9BKOc83NNv/pAhfR4F1rpyv/11iFsyEM1raJVHQhQ?=
 =?us-ascii?Q?y9b2BeN0mlaaF4jf97x+iEXeFtfzyMP1JHYaxi1HvLpXKulX2nOzvCRskcBk?=
 =?us-ascii?Q?dG7/GmZDWAxTg6rHuuXh6XEjWyzwTSQWcE1mp+mFMK7rzR5/6E+wcJTL8drV?=
 =?us-ascii?Q?k2+d4b97d/lcQgp4IpA/1ktfWIJF+wTHepUVo2kyj0mh+pk5kaC7wBtyAyKp?=
 =?us-ascii?Q?PJ6qRU7JW/FNNhTO4TRBUrEiujooXcaUiFZEDonlXrpzzHyL/oBLsOS+c+Mo?=
 =?us-ascii?Q?38LHTjjFnlSKZZySukf6no4NayZYcY3hgS6uk3iuD//nMc+5lIkMa9Ls1lca?=
 =?us-ascii?Q?6Hf5bOTj8AI1vu53WSsUI/cWuOjswz4vdorndvdB1AaF2ooQ636e3WF0d7A8?=
 =?us-ascii?Q?MSRRr9W9zDiFCGVH8gJzxG0cvt7MuNndrkDE8Oy8rOTSV2yowTGgjdpgzBzc?=
 =?us-ascii?Q?aeoaoKxMOByorDnjI2wnue0H0mL7r+tWfc/KCA8OcrOftnOvQIbQkTfTxJsF?=
 =?us-ascii?Q?baWDZID21aqE6o/EgLKkbvQjUZrvYqCc84160X/BouMHb43LXZXwL+aV5iLr?=
 =?us-ascii?Q?rm0D7ZlDuqf1BYNZO+XjzaCw62XMKVM3QyBcRjlkb6916qQH4PDP9MzHMafq?=
 =?us-ascii?Q?Rh+iMbsDStsTwyweOIgkUMu7/zZkUTimWfeqK2cRPrl2Coh/Yn7ALi+YRa32?=
 =?us-ascii?Q?9zssywkQHeq+dFudntoeHNmDoeUpe0Z1SebyELNK3FgJlHf0qbvi3MJGDEoj?=
 =?us-ascii?Q?a5YgeR5EeznR6UsAx7rER/KKlqOjRgAR/Bm7Y3jkmW/tBtGJ5oDXaMHHyTA5?=
 =?us-ascii?Q?NU5Zl6mVysDfVIooWRLA1zfO6TfzhFjvo9+LnMeMalf+GWb146u4VCJWHNhq?=
 =?us-ascii?Q?JQJlDcJvuUqlkFYAWATyDSHcR3MKqa1PDZ/B9uAcjWzJldoJ6QrkjXnRsOHS?=
 =?us-ascii?Q?JYHEU9xDb+0apEuwtJ1mA6k9G3ra6h1DN3YDPmuf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c771fe-4ad9-47e2-7a49-08ddda4de086
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:43:37.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qvmq3vehSgieLPsGeB682fEdPdkWffvS9dqkCWPzcXUgaYpFqPvuskLxCUN68DulvSyJWlDxfz5ez/TEJUHNNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF4166F2409
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

Remove unnecessary semicolons.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
index 9ba6cb67655f..2c7a86bd7938 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
@@ -139,7 +139,7 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
 	if (dual_plane) {
 		unsigned int p1_pte_row_height_linear = get_dpte_row_height_linear_c(mode_lib, e2e_pipe_param,
 				num_pipes, pipe_idx);
-		;
+
 		if (src->sw_mode == dm_sw_linear)
 			ASSERT(p1_pte_row_height_linear >= 8);
 
-- 
2.34.1

