Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2A9763A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1660410E8E9;
	Thu, 12 Sep 2024 07:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="G5jrE1Ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2063.outbound.protection.outlook.com [40.107.117.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A182610E1F2;
 Thu, 12 Sep 2024 07:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/MAbsSA22GKNcrd+8qpQ6ju6BtP6TiVBos+27fksUoKDMUXTORgfamASIKNd8+pyz5Fx9GpJsWxzKERErwUHyc6pYEuY/P+Kg5Aa57jV+AYlWm7W2WSmBVo1rXhZATeavgnuzFoVCF9zCKcC6WnZyYY/7itgZ5e56QCX1ayEp1iyTGgGezt54NfSfmh7CZfa7tc51ITUbG4A/orBwVwDZFSCECgFbrSSLiMmWRwkFc2HccaSVS3T7fJDU4136vGGsu6L5ysqb6CFmudj3miHcIhLvbZDfeniWvuhiEAGB4/nn2uJmP5EN8MjcPLFyfaeMZcXh/iGr3d7aBb7WSDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV6dLJodIBtjFLXYU4IUuaxgxQhurHUIoRmA7DMhpKU=;
 b=wdh7qOyrzBk6pBmO35sliBKuj5jGsKIcJwICMScAMYQGg0MMRhxL2BYKBvU0jFlG4iUUGcoOKcT0c01fsGajX5KUac7t+2cpm4oq6vSHuRMsc4HxoVQXflC6FD2WAG02vkLEhVWzImwjolHgaxSJGyMqll+4n6ZaNhXTbeotuJBNiOtWyeVHmNSQ9UGmatT47Vs6D/xP3pa7KUDX6oFsWn1bLUPaIUDtvM4AZaKmuLUT2U2N83DtXYBY18+SedgrXxMe+QJY3TX4GZc32VbDUkM38M05OFMKsyeznckXd6wTy7I0qNjdcfDo5x0LDGnaxd/avkY3f6ovJQFqufjewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV6dLJodIBtjFLXYU4IUuaxgxQhurHUIoRmA7DMhpKU=;
 b=G5jrE1UdQT9Bau/MGVOU7I0POg1atz+LKFyhsLK2ATarnWVsd/6IonbB4T+Cu5AEYM1cqi1EpC3xzTGC8hrOpdbUHndyGA5bobTu7etwtQwcf73Dx3uhGs+c2Zhk5DHaP+IrjzVao4a5VGqdR62hGYkYV8CodmOPUEOr8mGrJhV6AlfwdUvOS3LTpniqSs2Ets5/6GfkLX9pwfJvs5xXjVzeyblj1YqMDiCZgXl6Ptd3M6w3XxXjJ9BRouZEhcNfKL+e9lgb7OpH8w50j+R0p3QJ0PX1jXB3aYeS1jK1vjglBhH7//5078uM1CMDkLrDOxYx8JSK9hHSsJtOztBlQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by KL1PR0601MB5776.apcprd06.prod.outlook.com (2603:1096:820:b4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 07:13:11 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 07:13:10 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, chaitanya.dhere@amd.com,
 jun.lei@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
 Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] drm/amd/display: fix typo in the comment
Date: Thu, 12 Sep 2024 15:12:09 +0800
Message-Id: <20240912071209.47240-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0038.apcprd06.prod.outlook.com
 (2603:1096:404:2e::26) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|KL1PR0601MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ce66e0-e7d7-463e-fbf5-08dcd2fa5bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q5izYZaDkobkRfESqQxyev5azG6OzTRL3Kx5RejrZ+dUXZsnU9lHX1IavZZb?=
 =?us-ascii?Q?r+rJpXQH9tGqo6rK3FuuKlpmZ8qXB6xexiG4BUoO6HvZ0RExmYF7zegE/AOd?=
 =?us-ascii?Q?Vhzq0+Y2llkGmmictVi9j1Xdlzhw9ZRP7CT47dVOlzTzNpZJT5tEKpSO4L8j?=
 =?us-ascii?Q?Eo70oF5ideKoLch2ko1idwCVtlyJPktxGujWXzFvAEdchJ/fb3bkLJjlEK0I?=
 =?us-ascii?Q?qTU4lVrg+rXcOPp6YyYZ7zZG6QdF7GoPu7pUUHAnWwPEN7EVm3xO3JZ0NFLZ?=
 =?us-ascii?Q?p37zU7JzEDDAc8CIIbH76poxSsfVYAgqErEKRbXBgWpaY/v/tqD9fTub8JuC?=
 =?us-ascii?Q?EGx3JaCww0Zyai+ApyqAyBGFCYH+w4xoLb7P2tqUPUhCWNY78JN/FqOxnFtY?=
 =?us-ascii?Q?ZLsaAxhq43gKCllELxPc1wsBWEIuMjis39siGHX65jMr8XHt1d5/+xe3OZbd?=
 =?us-ascii?Q?t6kv9bYVkpWqSYZtDabWXcfa2yVdAx/4wGAxC5bJ/V4tpGJVEJLHwD0O6gfP?=
 =?us-ascii?Q?zOEnIfftHKiZ2ZVaN2C2SRJkBqaTNAnHg1/PP8Hhcbj/+ZjWj8odL9jdibPg?=
 =?us-ascii?Q?qmdOvb5mSbKl1x4kObovbPaA2XVKiH8nlcpSL0kXi1p8R8mfiQzrjYvKx78T?=
 =?us-ascii?Q?WwbAGxQbAepErLiWIYS/HxCkpxH7JN8ratLJFhXvUA9CxezxxI7q8gQD9DXQ?=
 =?us-ascii?Q?FpFaN3l06DPLgmTtfQROGj05MJW1oBbG396amfcEQTVGYlAeFUPQhD0d5VYE?=
 =?us-ascii?Q?8HaLQiduVReVSBM6GlscjgjhjgazQe26kNgnRerPTC4vStKNygT+ImOfdWhl?=
 =?us-ascii?Q?a/T1VJ7Zk/e399JyriZEuLyw3Fs1dCoyI5y1oL/t2vIcJcZ2O1O6zkgSWURr?=
 =?us-ascii?Q?bdTKEr86zvoVBX930T0EF//PAIkOqABXsFAsUhKMLIe00RkvDjL3YN0yo4FT?=
 =?us-ascii?Q?J4VF/uNWArJqfokvsHONRJXZGYky1OJNVryKw0cmpIm+702y4li57SOUZfaz?=
 =?us-ascii?Q?wK6so+jrmlOlOrFPlyyx3uyxp/mp3iqqVNGYR2GjgENQyq4Pfsf8QRsD+CHc?=
 =?us-ascii?Q?0fGFklr/zIqi9i5MUY4FuB2O4+vL2K9lErorD5fKqKZu7ZRKpgS8bbpvBNUr?=
 =?us-ascii?Q?1qr3mBesFm9Cg124LQulKUNCcaxaRBswp6U+6PdYZeAazbqYAH+s4N3ikaDs?=
 =?us-ascii?Q?iJZTWv9JFNB9PeeLg52KaS4tMOHoMLohGLrosH1t2/nVK4MODg69KDTu2AOt?=
 =?us-ascii?Q?oFbwvVb+R6lNG1i6ucrHL5O6/U3Rj6TLrSIL6JiGAzf7mRtmj7yYo00nPm4w?=
 =?us-ascii?Q?reY+p5xvTBus98l6S6+gLWWNt6mYq3qs6OMEEHZ79PEcwzA+U23SROs3MdFl?=
 =?us-ascii?Q?/1oqFadxTEODMrv4bSud/OtDHwmWlSTHk1OHUrk9yr2qboevrArm7c/7zryf?=
 =?us-ascii?Q?I1SBhuKrujY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4113.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IVuwt0isRxvVqEh12e3UfQScLhOBE/aGjgSoq889JgoBmlVPglyk5zAheeC?=
 =?us-ascii?Q?HlFnEy3BWA2XUJPvKDxYxOlAaiY+rlzbROkmGZ7j39WdMsc93UlQuURw45SS?=
 =?us-ascii?Q?S44dGGzmdfiyPFD89mNdymmzVaB9+QMjNBvpX3WW3K+00uKQ1xU6rZtiR+9c?=
 =?us-ascii?Q?e8xdBmWmdgWvjAEgQ9PhpN7NWSEaGSoxHgA68UMJJqeXfFRc/KFDXB68ukoW?=
 =?us-ascii?Q?j/2bPxg6D1Mjvzl8uN+78Di38VdKqwhOwCf9+yMBQZOwmc+6my8TCJN1JN40?=
 =?us-ascii?Q?UuigbFeU3p4iVvgIgjdwyfzbN3Lt3lYRipI9VbC6/+ilkxJbVxHLKLQPKq/q?=
 =?us-ascii?Q?nfyu+D50gOFEktJ8sMh1mVKuNGR//DD+D2EneF/QR63KwQNZ03tmd45/4a+s?=
 =?us-ascii?Q?ui/X9xqXn0uGHFfZ2X97B4Czuf4+pjo1obS5rhG4NDRd81CERd5Lee0hL5Cn?=
 =?us-ascii?Q?rgK9rVHWlaaq8sVy0A+EAICDzpai4DLmk3pEpzdQibe7dKhbWFTu0NDrgZZk?=
 =?us-ascii?Q?uxwvBMsO5KgfBghvATayjjNshif7UfH5gMNa740gaxO/xVqreNx4UT5zsw8L?=
 =?us-ascii?Q?A6lcoZQSuHnjAfgDMZxmmc1dIXcRz2PdPF3WRKNHnQj7wAly5LIIWV9t5bil?=
 =?us-ascii?Q?zZw4LsPyygRtRQDQdIBaAOBUd/i/cuhlho1o0t8/bgBlaJW9TcqZOd/nqU6b?=
 =?us-ascii?Q?hzLPGOb/QMOgBoqHEIfvMqy+e+0GRKn0Jr+yHSgQJBRNXI907xHlPXWaZExi?=
 =?us-ascii?Q?WPZvCnO5mB4GaxhJ1T+P7vuFYMYITCCCj0vpRcMPVTRbMS+Bs5qe7trFZ2JE?=
 =?us-ascii?Q?hoSAtlr8hcwe5nAzMm1GoW6XsQk7c6lHZsMtO+qaxjEZGuiM9A3vIaXYxjXj?=
 =?us-ascii?Q?tgKRnJvJziLjmIfiuoBpFhYEqRPBJPym3t8oLXgrDoqRmo22I2WAIFTUs/HW?=
 =?us-ascii?Q?EYIBfSmmHNSPCM4fBb+SSLBJ0LCyDmQ6KfaVWXB3qbowLbUefnflNZdVE91D?=
 =?us-ascii?Q?QkSvOlsI3x9jvObY+5BLcjvi+udHPb98HLqatYF9nR4XkAXOSdhWOJQG4PCh?=
 =?us-ascii?Q?psJgMLvr8KNboRADsscnGslXDew+oKdgm7daivJ0Z1yNzv748X7bfSMt/DVc?=
 =?us-ascii?Q?bItJ5dvARZ++ooJTQUfw7JG0rafl5L92cjT7XgvelCpYDeImZAym/1FdCwYk?=
 =?us-ascii?Q?wM2gKb5fOUYWeLj7BoCX6NZledrJb5+c2SOUXmXBeQe/fIkKtpvpOGAx3lvI?=
 =?us-ascii?Q?MF/N5X6rpNAUPOkGU/citQTDhuGiJ3R2mfvh26bKjV572M0wPfLgLPDuMC8p?=
 =?us-ascii?Q?o/a4LwFvtPQYx/0hM0a/GmuQTCDVraB78iRz+wBRiL0D+px97g8C9WlLTewK?=
 =?us-ascii?Q?1YzUZcStsji1mRTiaryfTH03TKBZyCdAHr3BfJlfCwCvR2EXeX+mVuuGonRI?=
 =?us-ascii?Q?RMtz4NpVGGTN1aRo+9ii6wXURPH8miYkNwgqAWY0ECP1ScjSiabcMEQGYYo5?=
 =?us-ascii?Q?w9TVVZ+nzSXPtEcwgrCNzwWafJl2fFAG8Hmbc2glmd+4eXbipGXLSh1BBiks?=
 =?us-ascii?Q?c/iTgTY4Bhkn2UJUkTaNoExSs7AbJfFxLtEQMc03?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ce66e0-e7d7-463e-fbf5-08dcd2fa5bce
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 07:13:10.5483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeNhovxSp9OiSt8m6ioNQhigK5971VdkWTurpVPWgWIc2E7YvjGJ8dXOiN5oVundib4bZPz3mGVukbRU+uMRPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5776
X-Mailman-Approved-At: Thu, 12 Sep 2024 07:56:55 +0000
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

Correctly spelled comments make it easier for the reader to understand
the code.

Replace 'maxium' with 'maximum' in the comment &
replace 'diffculty' with 'difficulty' in the comment &
replace 'suppluy' with 'supply' in the comment &
replace 'Congiuration' with 'Configuration' in the comment &
replace 'eanbled' with 'enabled' in the comment.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c       | 2 +-
 drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c | 6 +++---
 drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
index e47e9db062f4..d70a3549e05a 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
@@ -569,7 +569,7 @@ static void calculate_bandwidth(
 				break;
 			}
 			data->lb_partitions[i] = bw_floor2(bw_div(data->lb_size_per_component[i], data->lb_line_pitch), bw_int_to_fixed(1));
-			/*clamp the partitions to the maxium number supported by the lb*/
+			/* clamp the partitions to the maximum number supported by the lb */
 			if ((surface_type[i] != bw_def_graphics || dceip->graphics_lb_nodownscaling_multi_line_prefetching == 1)) {
 				data->lb_partitions_max[i] = bw_int_to_fixed(10);
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 547dfcc80fde..d851c081e376 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -8926,7 +8926,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 
 	// The prefetch scheduling should only be calculated once as per AllowForPStateChangeOrStutterInVBlank requirement
 	// If the AllowForPStateChangeOrStutterInVBlank requirement is not strict (i.e. only try those power saving feature
-	// if possible, then will try to program for the best power saving features in order of diffculty (dram, fclk, stutter)
+	// if possible, then will try to program for the best power saving features in order of difficulty (dram, fclk, stutter)
 	s->iteration = 0;
 	s->MaxTotalRDBandwidth = 0;
 	s->AllPrefetchModeTested = false;
@@ -9977,7 +9977,7 @@ void dml_core_get_row_heights(
 	dml_print("DML_DLG: %s: GPUVMMinPageSizeKBytes = %u\n", __func__, GPUVMMinPageSizeKBytes);
 #endif
 
-	// just suppluy with enough parameters to calculate meta and dte
+	// just supply with enough parameters to calculate meta and dte
 	CalculateVMAndRowBytes(
 			0, // dml_bool_t ViewportStationary,
 			1, // dml_bool_t DCCEnable,
@@ -10110,7 +10110,7 @@ dml_bool_t dml_mode_support(
 /// Note: In this function, it is assumed that DCFCLK, SOCCLK freq are the state values, and mode_program will just use the DML calculated DPPCLK and DISPCLK
 /// @param mode_lib mode_lib data struct that house all the input/output/bbox and calculation values.
 /// @param state_idx Power state idx chosen
-/// @param display_cfg Display Congiuration
+/// @param display_cfg Display Configuration
 /// @param call_standalone Calling mode_programming without calling mode support.  Some of the "support" struct member will be pre-calculated before doing mode programming
 /// TODO: Add clk_cfg input, could be useful for standalone mode
 dml_bool_t dml_mode_programming(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index 42c52284a868..355823530aa4 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -455,7 +455,7 @@ bool dcn30_mmhubbub_warmup(
 	struct mcif_wb *mcif_wb;
 	struct mcif_warmup_params warmup_params = {0};
 	unsigned int  i, i_buf;
-	/*make sure there is no active DWB eanbled */
+	/* make sure there is no active DWB enabled */
 	for (i = 0; i < num_dwb; i++) {
 		dwb = dc->res_pool->dwbc[wb_info[i].dwb_pipe_inst];
 		if (dwb->dwb_is_efc_transition || dwb->dwb_is_drc) {
-- 
2.34.1

