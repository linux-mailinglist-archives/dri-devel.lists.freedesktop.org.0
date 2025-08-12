Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F00AB21FD5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 09:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1C810E5B3;
	Tue, 12 Aug 2025 07:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="q5nJkAnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012021.outbound.protection.outlook.com [52.101.126.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBEF10E03B;
 Tue, 12 Aug 2025 07:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/88h/GRbLbt8Pz79y40CU8n88wPinT2bM4oNmnNkfDnI4nvWKSHJxIfsaRTvqrorTtz9ttjEI2SmrweLK0IYKE3oaK8LU+7ouoYJX3ORZdks4shuaeLlbPH9lRDZoHus8peSAGRQufs8Ys+0GiQsrgBNLe8YQyV6QEvPTmy3/tgFCVc3aV03D5y9mDAN2tYKMZw5sOkHhzSSN9w61aLQAnbHj8G2QJtg+hdV6a8Z8KXS4YqsJGPi+cYre3PQAcP5P79x6yfyJdgGK3/gMl78vlziCW68+Duz/ip4L1pJjY0uZbfm/ih1tERisiDfdUF3ylwIs1AM7cZ1f6Tr7Br+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1k615Sif31ncSoMAlE8XiaR9bjefsXamFVAe8l87fU=;
 b=PnwOibcKPG/yp7iiD8afubwMvjKCmwYGlFI0kOMVG4/yiisNFz+0Ohi0Q1GU/kdtb7POqxHXoZwtlhCjwX7aTAAKGgDzvniCSUA7y/Uoja3uFNPk4GG+m454lLI9zrbGo3AYrh+lCahWbT2xdMr3gHbUllUEfqqao2lLit9gAt2IUjEfwrUyPi7eNh82HzzkVlIR3ghOR+7VqcLEgKRe6IFR6a/62GAdAJCGzQIfheB7k6ljlNtZFedUlsPym898XgU9/vwj16m+1gFSA78dG+2GmheQIYT+Gm+/f1mUzAzS5YkAlhe1z8Tw5genMv5smv4deMLOLa8dweNFY8LhkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1k615Sif31ncSoMAlE8XiaR9bjefsXamFVAe8l87fU=;
 b=q5nJkAnI6DsbJhIuajGbPWAE+FWfoVGlRRrvWCyYByfqC4splidptWRcZAl28kfjbrp4xLJasqtsV+Pu0s0swCNamANpxq0oyxj8/S9AOdMy/BrcCu5mAvLVD+I7DKHEedq5I8+NRbCukaOa4i4zraGvtfno5eDHa9g3tbiKX9J++YxH8kPc1Atc8T8dosgoMOinQPUsgdacBm8TIFd989yXsRhPrMm5dEpO0OVbJvXEADK/1SBsOJG1UsK3RGGn1ZKsRGNOZpeej8C4GaWtPWTqy/53UQ9QwAUHyyzo3IFxN1uohINIfiPyVHDRcxHyWuVJZg3hMw6wg1uGZHN6Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY0PR06MB5151.apcprd06.prod.outlook.com (2603:1096:400:1b2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 07:50:45 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 07:50:45 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/amd/display: Remove redundant semicolons
Date: Tue, 12 Aug 2025 15:50:14 +0800
Message-Id: <20250812075017.5370-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY0PR06MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: 05912df8-7eb4-4e2b-3b09-08ddd974f1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PIdyVj9Z6m1ueepCOAgATKHZ4+8B/vD+JULjv3wf4Qux8THyoTY+1rgVzBJO?=
 =?us-ascii?Q?el5MORSZEs3//6+Fvmv2CTlFOv2l7QWS3S1kyRKpAQ2Xf4q8mJEkdEdCUbuU?=
 =?us-ascii?Q?ZusmP7+6m69UjYv/mRTtA4elYC0CUohAYe1txgIRfQxAeewQCZMqH42yRMn1?=
 =?us-ascii?Q?fcURUvNU7KF1Pq+H/5NWLO4Hdcs0Yk2tYnfVwOSUW1Fqxpp4Rv97Nz+ktReF?=
 =?us-ascii?Q?vFzxKt78+lZX4I0F0WkOc6AylYyxPRenLG0iGFjP/Z0o2f5rIDlg1I4nV/31?=
 =?us-ascii?Q?SIfNm6fAT9fY/wZ6BVm3CgtawZ6ugHvLanEZWPDr15SSgEwr9T61Xx/+Mexl?=
 =?us-ascii?Q?EMxYCexlryVeKoAgmUVUM9oRt7gfdD9nArSjUSo0u3TG1vw+2HFjsSnBUXtZ?=
 =?us-ascii?Q?s+/+5Ff/yV959bjrz3QovkPjx3VhxxWHpB67D0MLzELhpfYATVNmU8eLsAK/?=
 =?us-ascii?Q?d50ebOYNlhW12pOsHH0sFUWftjwONdl3odPR2SSoACD2zkLRLeTZCQcfchkW?=
 =?us-ascii?Q?bfeBU3iU2hEosPmvTGkmMd0+bJTiHGOHRZYVBqFAE9WHpFimhdxY8Afj7fnd?=
 =?us-ascii?Q?O/3UbB8aj5bsfAlKx1Aba++xf7UQa/ywHMKtuFddGpheG5aNpW76Hbjpxap6?=
 =?us-ascii?Q?BIh7ForhdssQlrpZdQwkO1n0Z9xk32k1uUxt3tGafXDFxZoAnF77bGm+sBv5?=
 =?us-ascii?Q?kwJ8Uy7qUjtCdOoHkJDcZz+9r7uA/OGyKz3DVDK6+F3xGyxUyvgpnRyLMJZT?=
 =?us-ascii?Q?ir0hxII/5zjRqVmLrqsbwoiieCcYV7QNPObziGKFU7l+KoYc1LJCFb9/6ZJS?=
 =?us-ascii?Q?15lLLQcdQTWHKBChIQaxFvqnD9wc8NzCO3inglDeSA8l9dYPfJHErk8jLoBA?=
 =?us-ascii?Q?ttyTyLJVfo8kvLB3ibYN4WUcS6o5EwBXFzZNxyGsapzBvLLVqJ1DjENJ0MRZ?=
 =?us-ascii?Q?uI3J8SruX9tZjyDhbtzgunO8u3v9sL6WercGB8I9sp1ioLwAKEP6AHJPUCGi?=
 =?us-ascii?Q?jiRg//24hbb1eTaIf2tnFItClOhBRzJ+0z2ZOl9NV7iTYtrg4BBfgiXzHRLI?=
 =?us-ascii?Q?Q/wx6UKi3/8y4OMPAvsvsPyHgQDZtyRnutGH1rDdak6L1RROJGpJhUOiNnJ7?=
 =?us-ascii?Q?L7C0rCpMVdbM9EOp038uwlJZnMHgDALzWHR0P67+NFQMBQiNIivryGXP/jD5?=
 =?us-ascii?Q?sKwlhp7KsalfDuQsxLmzHjbzaMylIE8bxtkLY61etRfQNI1wLkPuWL1EACl6?=
 =?us-ascii?Q?VYGBZBosHMs3Jc0B0ry0K5DcvlEcdLerpqdudf1BvZa94cdeq4TWL6YvdAF8?=
 =?us-ascii?Q?A4LExXs867qnr4DXhBNvPU3j+xxbQc7g2FHw4lvRykVHBXm5h2Mlco1IHp5x?=
 =?us-ascii?Q?OjRapLvPLzr9gYkRSzceCQGo0a1CJ15BL6BrgajDP5oUE4bx8Z1KBLs58IM8?=
 =?us-ascii?Q?XGuyii95XhvZsPMQWfUXyqLI+0bino8cfypMejKpyw8traLC4dDvhFHmBhIP?=
 =?us-ascii?Q?+DA0Dd0uVbpIQ8U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p5gs2V+7ojNr2wex32K7qg7jS8dXEZzezBvFc5Cy0oFtyt4BPNaNkwHBWttV?=
 =?us-ascii?Q?iiIYroL105nkjQvbXs4PrgGndiYP5fPiIpHa340pEQnWl+vaWVgTm7DIjPWk?=
 =?us-ascii?Q?mx65LYO+Muv3Qt8LSMUXCcVI3IAyLaLTfvezfU57eFzZfOHL3Ygm+Q7IiD6r?=
 =?us-ascii?Q?+JFBcuiBExwqFidVYaiqCIHvZMD5TrrRNZjSEVp2JNHhvAcbFkODTjF0qgaZ?=
 =?us-ascii?Q?g0CkA4gNjhX+qGt08HC8zGJUzlGttX9dfTGNVmXKxsvj9uexhtDh4dWObePh?=
 =?us-ascii?Q?z6gK2GNWh6YMYr3a4owr/Hg86Z+KHI7OjNoGTNNOIAByxr2V7PkXJv4Ex0AI?=
 =?us-ascii?Q?ScztspEpFJ5JZ0dUo+c7IUljDseHdpuertgiRLrCQvcHV9E+TBgq+ed518KX?=
 =?us-ascii?Q?9VbYtVleiY0pRmW6UP9vZLkB3EEMPYzQAQYrSnm8oO3PMwykSGwo/Ka4oIOm?=
 =?us-ascii?Q?Ohzc+V3mksDLyPyePXfStkT/6N2J1T8SeZGRw2E1iHlIalozOpSWChhEB5Jh?=
 =?us-ascii?Q?gfN/5mhSUjfkU8uI/xZWD/fVw9Q5LYHM2SvxIbeSY/K6rDJuuWu2a0985HKC?=
 =?us-ascii?Q?qS58uTgp7/Xklkqey5nLdwxOU7Fg1HEhV+iCH8BCDu2TapEiI1ZAosozTDXz?=
 =?us-ascii?Q?gARoq3gJrHeWTOz+9IMTwcZqaClkyV+kyKaK8+td9NQ5ObTwXy+/CE63YCgI?=
 =?us-ascii?Q?wgAbVGOkpc7Bi5JLmKHyJ0sNuXt547zofUTZO4hSkMC1JUE5Zcz3K9bnS28B?=
 =?us-ascii?Q?FGzvTEcQEmcXnhZIfqhO6Er0coiJ486nDogc5+hWGj1B4+p2KyozFThex8sr?=
 =?us-ascii?Q?ifSrahxuJyEhvpf7VX5BZNe7pbAUCFCgoMlfUu1+UDb9s+tTPFMc+elcKGFT?=
 =?us-ascii?Q?uLQ7rWVfrNUhILnJsg+i/85pJOYvfm++rOB+7QeyUWJ/4PxQ8wzwSyYMfTsP?=
 =?us-ascii?Q?VHo1lB8Bn2MDtOexIByyoYu45XJ0qNzKhZ1761muXrLP4pt1ig361ZGmqiPd?=
 =?us-ascii?Q?9pZWcU7v1SoLw5HhZtXReYk1xMyDvLlTaFU8lUWt9Ugx8Ww/pCeijrVj784l?=
 =?us-ascii?Q?0BtVBkJzvLSsqNweWfApt/d/ZUBOhmESN17rikjKuRZop/X2t55Am0TxwtNW?=
 =?us-ascii?Q?5yD8sCJQZlIrS36wn5M8eA3bRgYwvUAInQX3aq1vywizqaFtP9LeE4HDTACh?=
 =?us-ascii?Q?ruvSsT1wwq6i0Ngp5Wbn1fJ2gUVf9WX/Bb1p/TTDHRC2JfqvKh6zmUuQtLGd?=
 =?us-ascii?Q?sxjBFqXKAzeBlnc69GwdWLALd5ROi7yTbqQeEnlEVcjb2gDkzd4DNDqTzyFK?=
 =?us-ascii?Q?HBn7SDH8EPFiwtUs2Wlt5HGzBwsORxg/bJpepE6C4LTXHpwezvweKBMs6I2b?=
 =?us-ascii?Q?QfWMtqtJgsxjM1bdhhZVR5tD46rVf1gMpzseL+9PuY/QPgP4GX8AnxQm+RCU?=
 =?us-ascii?Q?/VJ4aDJB6NwuGukDH5mw4bIVCB88aWNaAB2MLlmLhdrJT7ote6RVGSb57Fx/?=
 =?us-ascii?Q?HjkgiB5nxvX6KSFNpbjyGJO/0UUMORjDhXVptgwa2t1fGJj9mcddAGCp+mRX?=
 =?us-ascii?Q?7yFFZTrg4cE9WFAq1ECk3W+gSYOPiop2YbedUXBW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05912df8-7eb4-4e2b-3b09-08ddd974f1db
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 07:50:45.6124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIRF4m2DiU7jCpfe5uHUq4hKJd2bX0lKJ1/E7rjwKAAer0EORAU40k4sFOWAicB3H9iLUZz8iNh6XlXChwSQXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5151
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

Fixes: dda4fb85e433f ("drm/amd/display: DML changes for DCN32/321")
Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
index 9ba6cb67655f..6c75aa82327a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
@@ -139,7 +139,6 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
 	if (dual_plane) {
 		unsigned int p1_pte_row_height_linear = get_dpte_row_height_linear_c(mode_lib, e2e_pipe_param,
 				num_pipes, pipe_idx);
-		;
 		if (src->sw_mode == dm_sw_linear)
 			ASSERT(p1_pte_row_height_linear >= 8);
 
-- 
2.34.1

