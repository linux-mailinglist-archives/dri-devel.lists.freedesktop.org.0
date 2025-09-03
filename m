Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FFEB41EC5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0B10E7D5;
	Wed,  3 Sep 2025 12:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ORlmjq0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013019.outbound.protection.outlook.com
 [40.107.44.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBA510E214;
 Wed,  3 Sep 2025 12:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAtXmPsYOUlgGfBt6Q2kQG4anE2qayi6CUShEVvHgT4whPVbGflxcyq5FEEgvsCiIK/pnbiqFIUuw5hbKtylKcmdc6cF7Fxed6kiwCOk4y4GCpGG3fl08UtnFGFRV8MQA9Zb8uwbqzE+g9LHrVXJGHOJ0GEN4LcLcwrkHJkljlf/UFcTiYMcVJgmL7RzLrDV0h46lbz0WVZqpp+ISmJX+H4cpTuoZapGwzkcvQu36IxWdpgL52MNbH7ls71C8c7VlfifdYSy5VDNINQkvPNyquxtdJ5ugwZUI/eWLERajX48HJohS7dq9F0u/wfsRIoVAnBa7Rv1PIX6nKt2ZvE3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to3RoU90KK2h2Ggab2qRNm2WDeb+59XSSVnxTHNHWmE=;
 b=xpTqFCpHjUgphEoDF5AIpmL4lKp8NmLKzUB/oaKx1K4ySVMIuamHO9Zv99fZLHYRITd7sh9RbbN1CRTaiykLMHI6TAjPr1VneHOCKZ5xxjRho6i72kClzMCJaaitP0bxmDG/V8ubwOUqgxWxMO5Ap/+wvTdCKSq6Z68rx9uEvhEzWqruoOaQO/ZiJjKgpHF9vGFwQDtT/rzbLIiWbS+cFeQeuP+O33uudqOAD11Oo8MQ9DK/hXIwexTOtgxIafefK9x0D8SlkQPwjxYuz8OsruEHWNiTZ3L1JeSiQUnGgcYhCXeJ+24kvaozgL1SU61I8nkHvHFDkBu8XRlw1FEjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to3RoU90KK2h2Ggab2qRNm2WDeb+59XSSVnxTHNHWmE=;
 b=ORlmjq0Aljhwi2FGx6O9ZMupmg4vh8cXXU/WhPlZcMH5/9Rp1lCyIuRKFyEk5cDXJDC7HLqZUCWHGwLY3lmAltJc7ZKFxhTH4aJs5pWuoxWSV2gMutan4mK3Lvit1YcOQMqJbk8Q+YVwRW/8dAI8xt5dhPVY0HIjL3NgYKhDXPJv/ClTA0sVjlGx4ObzBqWazrQaJ787NiGPRsTDKa7wFY+UqtnkWZ+L7F7e5tYFNaohrP3uLXrmeBbKGRUKydj0LP03+Z43uwnt3ZxwcRl2sGX5l19/aj/ds8hGmbcJwUO8meJTFPeR95awOeuQEQYg8ZVYhSrfUpxDsQzqectMIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6255.apcprd06.prod.outlook.com (2603:1096:101:e8::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 12:21:26 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 12:21:26 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] drm/radeon/ci_dpm: Use int type to store negative error codes
Date: Wed,  3 Sep 2025 20:21:10 +0800
Message-Id: <20250903122110.389182-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 8240b0b4-8e67-4021-93d3-08ddeae4676d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WluV4iHTWCIc5BFTdCgxr9C1e8C5iawsfiXarVx88g9n68rJcSKQm20miPs/?=
 =?us-ascii?Q?6Jt3XLzjQnffukoNmuy7OrMke+MsWvzwZgcD1/LgiH2taA6Eb/0yBiOZz/3y?=
 =?us-ascii?Q?CdusrRt6ygiSsOeHTFoY4ZoEpT3fX4B6GnD+WlptKqVe/T4kVQWBMNUYz/74?=
 =?us-ascii?Q?bbk4HhT0cfT0pAfvHUEVoGVarwFRRcKqpIrMDHNsgwjoAL0wuygkfYg4u63t?=
 =?us-ascii?Q?S/kmVKaul04dht+equSOR8EaZVi+Bfh6dgp+Q0tfCIVnIyeGEqCOEVUXbVyn?=
 =?us-ascii?Q?zId1uzKXgsowijn3sXPRqWWuBB/zWtIIDD0ZW/8fOsHm2SnmEKhlwgSMoLna?=
 =?us-ascii?Q?c+c4KQLb+hEPFr86Tjpoup//dS3HXepwzSF45pIvKE9IoA0OeOGS+gkmmldJ?=
 =?us-ascii?Q?8aFEpq6QfWHPnG4XvqQr2H1CUG/sgflnk8Z8bzpmpi13S+CnpAwCoFwkWAsE?=
 =?us-ascii?Q?5DfRN+1wF7+kxlE/R6OcUI36X7BSaCFN31XDE8+tSGQyzzeGzC6JhzkW3fZs?=
 =?us-ascii?Q?bWrfKd9Qhb2kqpTMjSoJuht5rIvtl3JGnNSsRQ8/P8q5I1RxZcZGJd5FwQf/?=
 =?us-ascii?Q?MTY652SHiRcCQLbHZ/61waDVGGfAYz9IZO4/A9i6du3iV1TveCxGunPCGEgd?=
 =?us-ascii?Q?do1+G+0+8L9rEWfMFc8I4hz+7HuTzU6L2wqc6h7cBzVKCdtcqvjt+pEn8cRZ?=
 =?us-ascii?Q?MFBRjfTNLGul03cGZsJOiaml1xyRoZQMxExcS+V/1M9WnZXnMhrN749umaWy?=
 =?us-ascii?Q?BdLieK9ewqecPNjjYYSo3SoKW+BB3bOjsQYnwG04FvUssiyoH8PTpVcxc1Uc?=
 =?us-ascii?Q?v5cToS+4E+C0qjE5wyRFzMeDQ5da2SX5OknTn9ESam0dm1u3kwePL6CiVBlD?=
 =?us-ascii?Q?LfDWjq18W8u3iH3U2y4ghtPvQopMWIQImEBnupOXcdTuAGMyHRhVpq0EjUPb?=
 =?us-ascii?Q?95AaFQBoWfIZjebf0TcmnFBGZQ6cPFkhlwzSBGe7NZ5mkAyOBfR9VnS3jzD8?=
 =?us-ascii?Q?aA0vqUDrWzy0xFHRStPgvgp966X00xcZiDs2UBuI7W001Vak+ZQYfxLmnBRN?=
 =?us-ascii?Q?Mpw2vVlqIYC8kjYxIRTbuUJB1NKQAYS10a05SDuzVNyxHVXsee6Kvii5ikZ1?=
 =?us-ascii?Q?ZLpZqY9Dz9YXsOy4k9w8wZ42x+xG9dKKGbs65Y/RdCW9OCG2T0WdWv+9vxaM?=
 =?us-ascii?Q?FfWSh00CazSkIGGQnnuQO1LIJflO8cxNCjEIZAoVpgO6PeKwM0fjgux1cjC3?=
 =?us-ascii?Q?keYVRSgfoLNV8hp2baCbrWi3V652Og5JI2a4tfg1KnQGRXJdYuQ1ZNo+X/UI?=
 =?us-ascii?Q?CfekalyyBJm7N/oa83GNcWtDPpQzSpafSYkoB3tZR1Jii75OPW4ox0hG49bq?=
 =?us-ascii?Q?40e/miQbEHCHYO35AuT1lEnHYcCGqJSCh7LCLdLHZnITSA9Ok1bSWF+4lO5I?=
 =?us-ascii?Q?gPFSFp3TgukZLLkXFSSrIWL161KXgmlSkdVJLDMFBJwhtyIStEG4yg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BBRBiBvjCYAItsEcHmMFJZQRUItM2tzT8z0+ia40sBudvm9eX9KjV/WrmEvd?=
 =?us-ascii?Q?aT9xM/Uy+raHZs6LF2COvmnPCgB/1fj4F5B0yrUCVR5Dx7jdNcH02URpbb+c?=
 =?us-ascii?Q?/xWdXQUSgr1YqexOXE+Z2hQWfHzzybFXpO1Jk5/CDDr4kUO4D9WUaKH8Tdm7?=
 =?us-ascii?Q?X/WRpw9wQMrfApsbI7GE1eSl+3Jbq6tjdRUWWHoiW1qndNCzNq8ktjR/OHEZ?=
 =?us-ascii?Q?dl2Jk24o48aJNOQ+B1ft18/dEGlyxF2iKcCXhq3mH8alRs+yNYaGDEFzUhL6?=
 =?us-ascii?Q?EDEcNeLVidDlbcODUdfffp78KGJ5IDrFCu/kwvm/Avzx8WlZJCSzgRAYtaUV?=
 =?us-ascii?Q?W3VZRSYQlJ4x7r9j4jCYEab8fT0uLRvLRMm+g72tnJ2cHH6L/KguZKQObcaZ?=
 =?us-ascii?Q?UPV0u5V5564HzgXdVyJJ3BX2WdXInJkFVrp0jfx3eb2khnrr6ACOPUjPnqrV?=
 =?us-ascii?Q?U00Cbv6v6LYXEssxa9cvrP7vtwLbJkw/c5RowbeD3L4/h13yaragtGBsmoaO?=
 =?us-ascii?Q?sE5Ea874ZS21wvsdhUdVQ5NZoNtwRtQuYE8MGBSbiwdvzCSvVxvlB48yRTTo?=
 =?us-ascii?Q?9VfwcVdHCuAvJLT9n9WofAiGwaI8vUuwDO8PZqaT4j6a51+vXykD7hvqHXP0?=
 =?us-ascii?Q?b3fR5xPOIEV0RBk4XYgR4t9PLROfry1gZqLDBPsnz8AGdd11SjzvGRU+Xjb7?=
 =?us-ascii?Q?9zP5K+QI30lYmNL3w0mUCiOAe0/C/LRJQA6x4WLaD5gs+UqsZhPgBDbhSLEe?=
 =?us-ascii?Q?RzVqqyWEwLXcgZDsY8ZCs6o1GkQlWIH73U8S3LvN/xrAfzpexxgzdDqluJX1?=
 =?us-ascii?Q?zMsuOF7Bk0ivH6ZADINd7ecSXZg3svkQplAWrwNNdHp39I8D3muJ47Cb4Ess?=
 =?us-ascii?Q?R7XtAE3GPiOUuRP0nGCpRppmJ6rHFuhT1W6kBfcOYn635/xx9tnAdHJ6gMiK?=
 =?us-ascii?Q?AVDifYXCCTJ7yFvUjG8XemcG9pF54aXo1shOvabG1tkv0+btK6Ehly3EVkvI?=
 =?us-ascii?Q?FRBWFQT7QR19QEYxd0+WRo/9GU1csxNrCJ6yvvA/sf9FCnymIRpiKL0WawbY?=
 =?us-ascii?Q?sumMS2lVTSMWc7ehXWtWpth9uaX5UQFLdTnLlNejvcJrOMCqB+H41eZIjcw7?=
 =?us-ascii?Q?6oxH9QqO1Pes+67y+kKhOVv7MCxtMeTfaPN5dth8hB65K2rfdgVob7vwHRfY?=
 =?us-ascii?Q?IpA4aTTGPOtI4+ztpKWcH2juJ4xPjeEZCJvnJASg5LRIKnYLxWbuBzsAhnnA?=
 =?us-ascii?Q?/wKZJc2AXFD5nr60TVUsqD8+/w2TBux5kfEEjFfNuRuLcCoBDp41miCcCG7O?=
 =?us-ascii?Q?hLG3o/DrZM/7hO0oHz6N8BBc9pY1ADIp15sbqmxqbLQ+82Uba1dx61vZE9bT?=
 =?us-ascii?Q?5JXFBoPTMiNVIqURKH/B3eUhEtRNQbKfTei4galYQoxucqNXGb/BhMsgqLPK?=
 =?us-ascii?Q?l9ovPetuc2h0GZ9zH6cQ0dAjgNHQpSDQb58OunREXEBR4VBG2FjQpXxDM86M?=
 =?us-ascii?Q?gZV0Vp0j8FaLsHjGEABWc2EY2odw/T5Zb5QUEvaGx6drcAq1Mh3e6yos1gQG?=
 =?us-ascii?Q?iAZgFZTVgFGRzw04WUni4ugxx+j7tiOrNXY/zirg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8240b0b4-8e67-4021-93d3-08ddeae4676d
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:21:26.7129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biqFOeVfOxc/Q7bDmSgprgZxEUYXwx/hosL5jCah9kimtWYT0Wf+OF/e5lyyR0RJMI0WtD1X9mJ2lOT47liPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6255
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

Change the 'ret' variable in ci_populate_all_graphic_levels()
and ci_populate_all_memory_levels() from u32 to int, as it needs to store
either negative error codes or zero returned by other functions.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but can be confusing.  Additionally, assigning negative error
codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
flag is enabled.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index 7c3a960f486a..1f9f4424055a 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -3238,7 +3238,8 @@ static int ci_populate_all_graphic_levels(struct radeon_device *rdev)
 	u32 level_array_size = sizeof(SMU7_Discrete_GraphicsLevel) *
 		SMU7_MAX_LEVELS_GRAPHICS;
 	SMU7_Discrete_GraphicsLevel *levels = pi->smc_state_table.GraphicsLevel;
-	u32 i, ret;
+	int ret;
+	u32 i;
 
 	memset(levels, 0, level_array_size);
 
@@ -3285,7 +3286,8 @@ static int ci_populate_all_memory_levels(struct radeon_device *rdev)
 	u32 level_array_size = sizeof(SMU7_Discrete_MemoryLevel) *
 		SMU7_MAX_LEVELS_MEMORY;
 	SMU7_Discrete_MemoryLevel *levels = pi->smc_state_table.MemoryLevel;
-	u32 i, ret;
+	int ret;
+	u32 i;
 
 	memset(levels, 0, level_array_size);
 
-- 
2.34.1

