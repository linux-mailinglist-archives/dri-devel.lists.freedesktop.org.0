Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C436DB43A33
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0EA10EA04;
	Thu,  4 Sep 2025 11:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="dMdcHvlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013009.outbound.protection.outlook.com [40.107.44.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA88810EA04;
 Thu,  4 Sep 2025 11:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7hGDwuxsUa1M3Ifu382MJOQics2U57HM2ueRWQu/ZC+j6aWYnBbP5Qg47e5Ss1psNQVvJ772z7BtjvAbokdOx23CfCGDbPrARVXokYEqiTUUVN/QqvJJSso0k1IANXKnTGCJsw7r5JvhRb3U2CdJCkdcvFmBV+RQ3syo1YFR40AhKfkBCWc5f9ev7Z4lJo/Ba+GBi6F37dHwkfOv1+dIQUgoRDfLgz/r4+DZPvJC6NExOcsKtVL4mzOaO9ahdQ00STMXuh+5sMT9ofKF2upeOQmZHolxIoj3+GoKMAgXs7uO+1h8E9GL0yetjOndSrNxN/hRyLGmwKdwF4VgMclew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flR3a0d40gbqOiYq4ow3ZiogxRP3xlGYuBg9WgdBVY4=;
 b=Ptz3SgfFUAFJod3uK9q5lVL+Vguxcy6evqs+9okhXrEKWoQAqv8//Y7lf6L9H5FQtVV64gaAEIrEdH14ac6bM+xdYzqTNUkxtQPSLZvg2geG4A+/ZcjeQsrkMkeQ2AUJl4ZjlysYDLmeLFI8U0JKSzhfbvgIqGY80uVe4hf1mo3vqpnJsiTsrk5J1y/d0EQmS4nSa5TWS3JDakTTgzOK1DhJowkHMzIZNL8IsgRsfCU8iCWR3HG+Yej5qbAUWbgBxsfVq9CYimkmDCAGJ5XRdrIke1sNg4KQBXbJGorpScytBuIwOk5Ls9tJpqLqzoAyhkSO7eUycLRiqzRSejVnXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flR3a0d40gbqOiYq4ow3ZiogxRP3xlGYuBg9WgdBVY4=;
 b=dMdcHvlx21cVRw8Ekr2inEdyI/pJk/d5yRYMMKHhPJ4JWN+6n4xTc6RjZCaz6oyfoZ9UvjIw81wDWOvuTGRO6lS44K0A0rPhB6tZKF5dRlGQ7kMYFRFS9IVIgTdSaU9PBzaq/e/BgRVjSdpT9D68VPfbo6dzLV3Cwx0Tsbe/znBFuc8FNot8fWmCPUhOtJ3/laIe251nPlQlrQnOv9ynip6VkDa2FLllPQ5wOgb88+ggA+BkygftjmP94uYdU2gMm77hWjD6VGv0JDiu3qZSjdcvxzd7Z/4kXz0Fai4hxrQ5+WcHkT8+6Y+tiDPOEOqqNmbFnOBtI1jXnuYv3/KGzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:32:20 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:32:20 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 2/4] drm/radeon/dpm: Remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:31:58 +0800
Message-Id: <20250904113201.352187-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904113201.352187-1-liaoyuanhong@vivo.com>
References: <20250904113201.352187-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a335089-a77c-471a-cdee-08ddeba6b59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oUYUbVa4uXzIeJSppzMvKvaHUMlAeEncHMx6+vAVPlZ5h5Iwvv+9TPV+j43T?=
 =?us-ascii?Q?Q1LZx9syEHOookEJ4fbHKSmSDFXKG61UQmtWIFOGa3BapxU+LFpj+XLEXD4s?=
 =?us-ascii?Q?vHq28JUPkLGCvFjGpOqqMj29Twr6SiuqI/ml9tRAgoxoQpJO4qmq8agv7vp4?=
 =?us-ascii?Q?llP59WAwy2qgfX5pfOerjU9c6o/OCBPj85MzThXJTEa3W7Xff0c8fgBXS0Ex?=
 =?us-ascii?Q?dm2Mx//B0N//+8SX/6SOJT1RAarKgu7LdhsjcJ2Mq4wKh3lChpkKvadaJJed?=
 =?us-ascii?Q?SsblztDHM18DTLEmbh/7537r3Vmnxvdj6zgL8eunD/LJLYkn39XTyrCX2+gx?=
 =?us-ascii?Q?JdfpoFYAwH7YLNDsAbOVlS2gO43P8yY+/gaXX/tQT2L7+PMVeKlUrLzRiuTn?=
 =?us-ascii?Q?kH1719Et8jCOzdbgh5d//z2e1TGUBDu7lLLoDAUm/qlu+c4NVbx+xzhfUU9N?=
 =?us-ascii?Q?sQR0T0MYXYMZgdKQOzuRGi52HY4kChpGJ1a3k0n37wOLLThNj5k0vucmpY+4?=
 =?us-ascii?Q?oqeCtCjFVWKIN5amndyKa0K52sM22kjN3yIidxn2km6xOFxkir+fy5GANe56?=
 =?us-ascii?Q?9t76VE2/Ui647fsVtwp/t/9vhawa3kNLAbdqIPkbcu/8wYSlkgahFJPOnqsh?=
 =?us-ascii?Q?XXFDQxJpkbXmNjpoDk4OfdwtZIO3/zA6+B2KKHPTJCCETlwzElx9mz2jF77J?=
 =?us-ascii?Q?GQxVLMBoYO9j+g0WtH90VfJEbGFWvZ7BXextUvv4eJBtNasauoC3rIYkNUkq?=
 =?us-ascii?Q?DhCOIn5ECguKcGUMbO5GS2sQUU9n4Mvcs3+WWupi8B96r1+4cb3bTdYH3LZ/?=
 =?us-ascii?Q?WOwG/pgE9dFEGRrgAJM01lYzC0yh18+eviqAzvjHELPMPABl+cNtUsCj9woG?=
 =?us-ascii?Q?qHGz5oBAMtrH1TipUwtiQ9wXkCFOOGNKCifQK4ZY7lliKv3Wic5EP1ZigG1u?=
 =?us-ascii?Q?iE1wZNwM93myNBd3n7zlWLfpKM0EQfhQbUq9B+GldgBJuMf71fkW+DrNXcP5?=
 =?us-ascii?Q?Z0oebWOIAAk6U21gkK3x2PfwsS21ReTfwIBHoztEHVwXM/AgObZRkp5jJzjO?=
 =?us-ascii?Q?7T5/S/5OXQVBOJzxkmgjFX+e97PQXiXJANN2s4koyjGXgX3eG5JxGLuIEyh2?=
 =?us-ascii?Q?+ndJfDBfqNOVjQG2i/eUNEsWkcxT3AF2yTC5jbFdzgMsYIYQ9Js2B3kbpv+f?=
 =?us-ascii?Q?PlkuoiACSeWXpWtcdlbYq+ebDbz/fDSE+LvCxSz1WqNLr1penxgc4PCN6AIt?=
 =?us-ascii?Q?dQ1Vmx6RMK5GG7oLysZ2jI6x/2hSTSlf4egLmwCiBQ8OZ7lU1Geos/NgnRET?=
 =?us-ascii?Q?1t//S//eAFv2OYJPv++auJr/uFUEfmRdJClnhabYVeCmJLI5zc60m1d+g8o1?=
 =?us-ascii?Q?v98mRBzg2jFdbTek4WPGXlvTTe59jncWaC65cLTvgbZhQsz38F+PthOVsFPm?=
 =?us-ascii?Q?dCb8KkPTIjPq9/pXsKXSrtsePViMozsGSl0nzOoGoaV2WIofVWPMCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1tKifbJHyAe1/v8hoHWViOtjksR8HeD10k2tSkl4xQ2MUMYLAxOnqvkLOmgc?=
 =?us-ascii?Q?Tym20WKDKLgjVLxB0MPZFSFb2KcfNxXyPGph0QhSqTPeGuOzYED2aXvNUi7k?=
 =?us-ascii?Q?OVxf1WD3YUrokyyxzzftQKdPzGiQE+2PsIHoZAiXLO8WFCWVwT0fCTKwaZAz?=
 =?us-ascii?Q?kiRHIppzMPAn0hNFevs7S/wYJUDRChnQB2G+lVYvk8oPraUIJbOuIMQ6V6rv?=
 =?us-ascii?Q?BWo1qlxpGtUawgWjYMyaKsZKpQ0Kf0AifziFpLOboL/olBaQHh0iIa+EnH/6?=
 =?us-ascii?Q?eLJojTc/quDkUplL2Jkf2P3OEKdYcU6UTzMSUsTIfJeRzOW8xL5ayGI3CGY1?=
 =?us-ascii?Q?JyvkUIbe8kvLNEh4VCPUGVSIVUWaEPbAyIhFEoy1ENkoTEgOeljko++tIcwi?=
 =?us-ascii?Q?zUWzylU/7oaSRCPr/I/Nih1Y6/XOU+x+/et5VVaHicFu407srr+vWGaiaZfu?=
 =?us-ascii?Q?z+GcKvjDlq1ZxAWcAoP6c444OnFFFOEt/1KWr09Ck2SzcSPyV/5PvSmLGZDA?=
 =?us-ascii?Q?9xfJ8G0WprykzDagySPKJHSSvrBy3IuHjoI8hwnQZcXhznf25P+QEAJ6FeUi?=
 =?us-ascii?Q?q8dnhfzmyg0ed+swSg+X3fdp/qib9L2tGH4dmcm1a+M9SBos7vv/SmGeQRXY?=
 =?us-ascii?Q?6IaNc/Pf3EPTlFaLR5cj86eVMIYs1arTgB09G5/p5jJrWV/4hBktDWMWNsLJ?=
 =?us-ascii?Q?fsrnAdPiLdj89mQCn2mIMUK+m8EJKFcPxF2n3wDN5h0t/GTq/eq5zw4epq4s?=
 =?us-ascii?Q?TFsmonzgGthHSiMjmbSV/RvwY9u3jWkQ0FMwdSRaWy8ihzL648kAMjVE+J3d?=
 =?us-ascii?Q?VIBPpmxcxsjwFfLOEIHz/8kpsOq7WW1iYPeBE9V/X4uWVOsRYGvfr0+wJ7O0?=
 =?us-ascii?Q?+LkLSzdx/YM5+uWS5IXqLGIquQtcAYAI2gvmov9ZsMaE7c+sCzN9INEUOL/O?=
 =?us-ascii?Q?drHQBczlJy1ZzYSq4LAp9ny+C8OSCg1xwWfyOrXZ7dbKBmr8dGdTCqJZ4zGt?=
 =?us-ascii?Q?oH9vVibyecc5kyWCDzUgGxaYKQGlo2FmJ1TKiZJCms9NS5Z3OKa6j3Dil9XL?=
 =?us-ascii?Q?sdVfpKAW8CQKbHo7xlCihvfYfysNfyDGNNmUiE893PpozDe8EzYqWp0Hz7Yi?=
 =?us-ascii?Q?roY/p2/l6A7o+uqk7WPsX/QbFeixmgna0FV648tyeDrXaSdKsARg2BnEWidZ?=
 =?us-ascii?Q?2sq8I0Cte8HvBAZF4X4LWJFeTBZWr1XmSrSsSvs1aZenQeJbWPb7cr0ol0vs?=
 =?us-ascii?Q?9XMRl2DkYIJmKRWVloqaSdSpy/pUzTrI+a3UFrUlkeHh9FLlUNvviQcu3D07?=
 =?us-ascii?Q?b+wnidZrT7xgO5/S+6SKPAtcs4Sx+QkoQ3cu1/ZfMlEdqbH0IDXh9MXpPiuM?=
 =?us-ascii?Q?7XbyNjJ9AOu8Jgt39lXVR4LLDUWGG2ImGWQ7M2AIwInqCiunr7qj7yL/LTkA?=
 =?us-ascii?Q?pjzIPVHhUPmfrbdB11zvZM06BPR0KoatqWBVtf/JDrK2jWAs9k8DNcW3aB6x?=
 =?us-ascii?Q?801Pc+INXMFwJNxUQdIskzan3uSAbMTuVtw2M4fDgJhxJanGJbKzE82LzDUA?=
 =?us-ascii?Q?x9J6X2+cJdMGSxz5MwYxgYqgLuM/sie1GWwvuRwl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a335089-a77c-471a-cdee-08ddeba6b59a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:32:20.3137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVr55GQYvs/cKWlBJId+Ii9wHwAJLFqladUY+OIugOrBS1Nu7cxd8k+0mDExt29GWo196n721MrOLhZbVfenqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6233
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

For ternary operators in the form of "a ? true : false", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 8 ++++----
 drivers/gpu/drm/radeon/ni_dpm.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index 7c3a960f486a..7be9006d5848 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -2457,7 +2457,7 @@ static void ci_register_patching_mc_arb(struct radeon_device *rdev,
 	u32 tmp, tmp2;
 
 	tmp = RREG32(MC_SEQ_MISC0);
-	patch = ((tmp & 0x0000f00) == 0x300) ? true : false;
+	patch = (tmp & 0x0000f00) == 0x300;
 
 	if (patch &&
 	    ((rdev->pdev->device == 0x67B0) ||
@@ -3436,7 +3436,7 @@ static int ci_setup_default_dpm_tables(struct radeon_device *rdev)
 			pi->dpm_table.sclk_table.dpm_levels[pi->dpm_table.sclk_table.count].value =
 				allowed_sclk_vddc_table->entries[i].clk;
 			pi->dpm_table.sclk_table.dpm_levels[pi->dpm_table.sclk_table.count].enabled =
-				(i == 0) ? true : false;
+				i == 0;
 			pi->dpm_table.sclk_table.count++;
 		}
 	}
@@ -3449,7 +3449,7 @@ static int ci_setup_default_dpm_tables(struct radeon_device *rdev)
 			pi->dpm_table.mclk_table.dpm_levels[pi->dpm_table.mclk_table.count].value =
 				allowed_mclk_table->entries[i].clk;
 			pi->dpm_table.mclk_table.dpm_levels[pi->dpm_table.mclk_table.count].enabled =
-				(i == 0) ? true : false;
+				i == 0;
 			pi->dpm_table.mclk_table.count++;
 		}
 	}
@@ -4487,7 +4487,7 @@ static int ci_register_patching_mc_seq(struct radeon_device *rdev,
 	bool patch;
 
 	tmp = RREG32(MC_SEQ_MISC0);
-	patch = ((tmp & 0x0000f00) == 0x300) ? true : false;
+	patch = (tmp & 0x0000f00) == 0x300;
 
 	if (patch &&
 	    ((rdev->pdev->device == 0x67B0) ||
diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dpm.c
index e08559c44a5c..82edbfb259bf 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -3397,7 +3397,7 @@ static int ni_enable_smc_cac(struct radeon_device *rdev,
 				if (PPSMC_Result_OK != smc_result)
 					ret = -EINVAL;
 
-				ni_pi->cac_enabled = (PPSMC_Result_OK == smc_result) ? true : false;
+				ni_pi->cac_enabled = PPSMC_Result_OK == smc_result;
 			}
 		} else if (ni_pi->cac_enabled) {
 			smc_result = rv770_send_msg_to_smc(rdev, PPSMC_MSG_DisableCac);
-- 
2.34.1

