Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70356B4358F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B1310E2BA;
	Thu,  4 Sep 2025 08:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="EMJ39GmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012007.outbound.protection.outlook.com [52.101.126.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C82B10E2BA;
 Thu,  4 Sep 2025 08:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShlXx8m+uE+E5cwJmjhj8AIKiWy+M8IW9bgaYX4QRKmVH1yhmkoHFnSn4CB23lgtkTlgRdqrBzZxJJve7aH19zkxS1DTEx4vW0SvXYE3PK2kqlZqLLHt/u7W+QBZ+eOts80z/SfBx54YKA3SgLXVvZxESi7s2iTEg7Xdx/iadXhkvfga8u/SFaT+ejLJfCYSVrTTL/+glitIY6TkZziJ9g+rGzbRaYAlwmt7mevs5dla3BOIECP0E4jfg8jqcJsdsX2Ws2iMaqVpAhRVw/IHLwRnDcTCevT98mA1HadAtXZbt7ajcI1g0YJi4rREAO+k06BFQKAxprx3gn6BDW2vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pK3k6e7TmYpzC0Bv1Tn5IOgmcZJKJZExEpkK4pHHoY=;
 b=Wy/KUyO8CgbFZHIUAE/zArXDKQmvWkN6BeB15SkX6VMkFSAx+FfpX/ZXhs21vbTn9+eOfsahdEuDvr+iX5UGEw349XK5K4oV4ODUsyca3HJY8b0U5VWwErK52DzcJBVHloGJPRTOifVGTuDvQFN6mEvP/tr63GK04ilRjnSuAQsKStzgOIJmcyjEhqvOletP4rQzgkbLJ53cqZiILccBdoNw6hGcyAxXeE7feO5ioAT3/TmYZ8nt8Pek/z93qzlf5+Ilz+4k/OEjySeyYpsdrp/2BmkOZ9qHdgScHE0Fkp7voZdoROXs7IgroM6RlAp3j/iAutWmiAVeBstqWSkEMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pK3k6e7TmYpzC0Bv1Tn5IOgmcZJKJZExEpkK4pHHoY=;
 b=EMJ39GmM3Yx3IVVYkuOunHVv/MvyTPZnunNSlsSAtHQrtbEQLY113p2wrKAssPLZDgZZ49FdXr214Q3sKbhzE0EULa+k+uZhPZdMCwmH1x7WjdtTJidC5k0i0xlppHe9qHLB2ngTrQ5MlSd25ggE/4IBMiyHro+gtMqLXpUYxtOvoA8w9DkZz92+LRhUjSy2sbEmcyPsFFMVv6tHGHT2OVa1dPt3zzWqJBFv3jYHjHOi0gM3QHwinCmEXU8uBZ7EFRoDe9lYeQ+torTwPlK3p5ecK3VlsuC2W/Kevk/+3sDxWusX0UTwKBcwlcq0FHfZObEuuau7WoRaOyQm9hCucA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5062.apcprd06.prod.outlook.com (2603:1096:101:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 08:22:03 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 08:22:02 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 3/3] drm/amd/pm/powerplay/smumgr: remove redundant ternary
 operators
Date: Thu,  4 Sep 2025 16:21:13 +0800
Message-Id: <20250904082127.271638-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904082127.271638-1-liaoyuanhong@vivo.com>
References: <20250904082127.271638-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0100.apcprd02.prod.outlook.com
 (2603:1096:4:92::16) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 1011a622-f77d-43a9-06ce-08ddeb8c204f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nqXJULT/ebPxibZ3BXXjkoOOjO4UZmcQfG4Vadbf+PoqKhrCFxCXVKpJellx?=
 =?us-ascii?Q?ZfhwfKJ5aBVkctzJNtYFRd3XDEyTrxrliyIXR0sEwTj+nw+ppFjhH+0FWL3T?=
 =?us-ascii?Q?/lhroRnEZKLB1vDb/RWtXlHAA0EiHVLjPdibDF2TRPKXlyV4oqDAdWtz3m83?=
 =?us-ascii?Q?xfIGA0LVHHioDEsXg93xiGE2IVJUEhNcocMu5rGy/6bSO9K+w76+gLazsptV?=
 =?us-ascii?Q?eKmLtJziABsFuTFfDro8EruiX6Sw2QUW6Uo+fLoPluLo9UasnggAJQtr+9Cb?=
 =?us-ascii?Q?xHbo+R+kzrgp1HH7mfYEtNS57cY9QTPYIOKQ4N+6Lc3KTUhiRdWZMrJZ5rkp?=
 =?us-ascii?Q?ii0dxG05VMEVJJU7kxJq0w+Mr6iQOWaWUW5lFtG/wiQI30msmEBHAmYpRwhj?=
 =?us-ascii?Q?Rl7eHTzFP+Ji3xAXdZYLPlg9G8pf/WNz+Fo//+v8+0E9ETmcIUyMjRU+siYW?=
 =?us-ascii?Q?MwEZCFOXbATzbgU6YM57OwSaaUoODJZmb70qIIUYwuLCsGTM31Ht2kLxh/YR?=
 =?us-ascii?Q?/px+4TT52TXrKxpMmr9+7RhsYnVw140vhA+zcHRfnaRlFrM/TFyQ4edOibCV?=
 =?us-ascii?Q?8oJYYaFQCF67U6oVWnFGmFCxuQNMzC1kiKrKBHB+0xVCEJDAKTE2eZgW/Kik?=
 =?us-ascii?Q?YE3Q+GhA7SPow06YEuY312ZlBeIIArcmQKdht7cdSJ7+dw/4be8ZILJVYoEo?=
 =?us-ascii?Q?uGHnCsip8a5uvUphMYAWQqMgUL1Qa6iIZf10t0mYQCjw6b5pJJJQECsyqFf8?=
 =?us-ascii?Q?IXu0q5R8OkBsN2PTKs+019gyCXvQI9RP4NB1G9dv6YLxyFCf4GtnJOq6W0pH?=
 =?us-ascii?Q?1IWR9FlmjZgdE7fUQpqziFKIHzRyJCedyv70jZ0s+jyCc07YUP1ZsHseHEuE?=
 =?us-ascii?Q?W4PRo8AlKPetYYY81SdcK7f1fsWaSAlVOpgahnAWZ3vcOfounWfpBer3DYbG?=
 =?us-ascii?Q?FPSCRC105pbfo+nrkdB0g5LZVu6CGANq6/HG516PLG17lSANlBrUGuZgl8YP?=
 =?us-ascii?Q?b6II54+CfeHcW3kADcLK8O+N9QDoPsv43k3dxzYFeq8fnhYG6A64mwxc8eX9?=
 =?us-ascii?Q?OVv2VKbiiuqLwYowdYRsD6PtsByFUDxJwAJsl7NMJea/Ngtmw06pzhMAlCTx?=
 =?us-ascii?Q?KvRQb2UF/8h7r3m9jLkZMoL6EOBjB87FFg7K0ycOwat7elTBkx6e00JbxZou?=
 =?us-ascii?Q?M6yH4KBG/2Gyw5KPX2F2GRCBpoXbcJdnnJf/J2yX1d2z4hFqav3PwqZusw/v?=
 =?us-ascii?Q?jDLq+I2TPw1snPVW71sheIXRJPfcVRwE6eWz7Jdf5O4zt7/4mS4khEnWR3Uq?=
 =?us-ascii?Q?x/i5xEYCTiBHDXnImW8q4AfYs2ywM4rdnkoM217fpYftTgwZDqBPqy5KA2Bu?=
 =?us-ascii?Q?HT5xO+V0YDIkt7jRz0mQr9jq6yFUabXwF5lORpOw43nK3ukjPWP6WwZqTj3o?=
 =?us-ascii?Q?zysCejSuT8uwxG5PgIg6T9o9NFgQGHkogmJLJHW1wEMzA6P23WU/YQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/LGt1oELkCo/fQ7iyz3DEpBLFI4o2HlOTYV6AukrIw77ZiGQw/X3TANt74XQ?=
 =?us-ascii?Q?Q4FfqYNs1qPAUM9K4QwfaLvku7vX8Q2zCeU2OZUPNHYeTN/8AwBbsYTEh4IW?=
 =?us-ascii?Q?+OoeCAWtg1hDpGGn6zNPGWUaZKtG0f8Pb16SrtW0igEFPqnz6VK6XlDEa82C?=
 =?us-ascii?Q?TqNeQFUQlL3vZ6c4oRhQiKdI8nVkq4Buu8bbnGKdCJrbhcY/oNwFsBNq/fSb?=
 =?us-ascii?Q?rrkcrCkMF6Uf5EX1VczxRd1F6/WqoghFgm5MWtEcHn+n2lrQbNRYXvivMRYs?=
 =?us-ascii?Q?NFqiVmWbcg1982Ro+3XHQkiA9uq0SAU2Awp+YRWSqVMX62DCoV/TvN4zpQFM?=
 =?us-ascii?Q?Hpkd/wzArGVB5ailsfVkU05MM0XDZiluy6WIiCSchrJWKGKqacBwO1bhzSol?=
 =?us-ascii?Q?E32mzVKoYw1L76aqVLSJH9Y/thMGXCFca6gkqLZ1twrA1S4I6fIJlSVih0qx?=
 =?us-ascii?Q?qqnc0GlOR2xXYKB9fyRLzb/z6NF+DdQ/895X2D++nARAEWnAvsw9P/hFX/l2?=
 =?us-ascii?Q?YtTB1+X4bdggvvM49DyG97Syew02cKwj7maRgHOjvMH4CmP3JNtXomUZysjs?=
 =?us-ascii?Q?u6+W4v16m0YWR+YO6v+OLhc9YvVVdghuOeBtD90UtkX/zmbCA7alSWQeqoO8?=
 =?us-ascii?Q?ss3w/IfVGO5P0TarE509wtR5exTgENHxgZWSJ9pwmCXX3FVxW07jUQWwYAQd?=
 =?us-ascii?Q?OyWaDL9W7VrN6jOkKF2ub9zauz+yQog/7t7iILlFqzibAAXMgxRKnqAk+RI7?=
 =?us-ascii?Q?WurY2lEZNz9KrKeL9Fx2WmJ93hwkxOcExEjJuEzMT5tNzz1ESqioEaP2yoRM?=
 =?us-ascii?Q?UOHfEIuv/dU/qhYAinsaRravFNOxgw5/S8UMNeJQ/V/LupKJTULYjQRM8zEF?=
 =?us-ascii?Q?gUAxisf4jZNE4YJiHRUgGgLhWonrA/DSdX4lT/RbwNEaUhm1ldQ9ZuCgFzi7?=
 =?us-ascii?Q?Fpewi0WfSEyJ/VHd5srNs7SWSg2yeHL/2lsXj28NwVLPrS8O8XuujoeR+Ism?=
 =?us-ascii?Q?CQ7MYwlIr41s075DkZwCTYXWpmieAcnmy+w9lP6WwhqxnCXtgd0MpeT22lRk?=
 =?us-ascii?Q?K8d+v/cF1MU8u3VoqB3sR1pme1dJeWf0RNYKbule/KmgdpKUdSdL5LMdIy5B?=
 =?us-ascii?Q?vjFHGis7WIMdo1PWMe/rmL4vGBMUAihWm/Q4B8808oFK8S+tek+KgDBPShbp?=
 =?us-ascii?Q?Bna6ANDwhBG9qierTW54Y+An41pQUROY2JPQWO9OF6s38HxA4rZ3QH9IVoJr?=
 =?us-ascii?Q?Q3Shw3oTZlDolXHLEvz/SbIk8jxOWqcH4TDIqox6sK6KWL4nXWbJW5Yy+gB9?=
 =?us-ascii?Q?E/f37sKE/QiojsLnMW9fvyHR/ZWEifrf1stqA3cQU31YyxANh0ZaeB30tAH7?=
 =?us-ascii?Q?HCAoy7BMXZ1IJu/Zo4bc1Qwr4cdzs6AiDgYXmznP31tY2jzZmuVTp4ur46wp?=
 =?us-ascii?Q?kWa8QYOKia4TkhDcuCgcvfHMvfDy1/hJlVZQCXDKiWI0iutCJCubLH3O5fTw?=
 =?us-ascii?Q?IuptQKRuV8rp6SWLXL5D5EsjLPxY3HHzYoCAjS4DoKvNw+kXqts+lO58IrnS?=
 =?us-ascii?Q?tjffhtGAp3AbHku+065o/kcYhcqecNrS3JgSdW0d?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1011a622-f77d-43a9-06ce-08ddeb8c204f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:22:02.8087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hnZS2bJx1RmDpEgwK5Y4hrUMLTE4rnYwhCknzri6fc6nVs+o8WeEeZjmiB9WlPCNQchN4Sy3e2om8+hYWUUcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5062
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
redundant ternary operators to clean up the code. Swap variable positions
on either side of '==' to enhance readability.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c      | 5 ++---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   | 5 ++---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 5 ++---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c     | 5 ++---
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index 5e43ad2b2956..d2dbd90bb427 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -2540,9 +2540,8 @@ static int fiji_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
 
 static bool fiji_is_dpm_running(struct pp_hwmgr *hwmgr)
 {
-	return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
-			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
-			? true : false;
+	return PHM_READ_INDIRECT_FIELD(hwmgr->device,
+			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON) == 1;
 }
 
 static int fiji_update_dpm_settings(struct pp_hwmgr *hwmgr,
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
index 17d2f5bff4a7..1f50f1e74c48 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
@@ -2655,9 +2655,8 @@ static int iceland_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
 
 static bool iceland_is_dpm_running(struct pp_hwmgr *hwmgr)
 {
-	return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
-			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
-			? true : false;
+	return PHM_READ_INDIRECT_FIELD(hwmgr->device,
+			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON) == 1;
 }
 
 const struct pp_smumgr_func iceland_smu_funcs = {
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
index ff6b563ecbf5..bf6d09572cfc 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
@@ -2578,9 +2578,8 @@ static int polaris10_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
 
 static bool polaris10_is_dpm_running(struct pp_hwmgr *hwmgr)
 {
-	return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
-			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
-			? true : false;
+	return PHM_READ_INDIRECT_FIELD(hwmgr->device,
+			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON) == 1;
 }
 
 static int polaris10_update_dpm_settings(struct pp_hwmgr *hwmgr,
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
index 6fe6e6abb5d8..2e21f9d066cb 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
@@ -3139,9 +3139,8 @@ static int tonga_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
 
 static bool tonga_is_dpm_running(struct pp_hwmgr *hwmgr)
 {
-	return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
-			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
-			? true : false;
+	return PHM_READ_INDIRECT_FIELD(hwmgr->device,
+			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON) == 1;
 }
 
 static int tonga_update_dpm_settings(struct pp_hwmgr *hwmgr,
-- 
2.34.1

