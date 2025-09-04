Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52095B43A34
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8251710EA06;
	Thu,  4 Sep 2025 11:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="OCTyeHWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013056.outbound.protection.outlook.com [52.101.127.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E717710EA06;
 Thu,  4 Sep 2025 11:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyZV+QSSdzmH9KIjXrUK5bfKRLYMBlB01Ti0/WwchizPqJBewsMAaMNSwDCo5FaUx4nKgWFs+i4Q+PslrV4WxdC9eyfFks+XGbTePM27Wvvn512qDnEt2eT+4aHiyIIvmKgqkHq7s0an1DdD74smx9xCrQfOwvtF72lGrYLv6TGoz70oUzix0VCIo4cqhvhvP+XXO+QSRB+q2lQZ3xNs/0zOUYKLyZ77sqb/AHuOkAZtph7h5/AkdTGnXYD2gYHI95AF1UjaCLLoMPygscBC+c9UiNoVd2LF+BGaxoQGsY0J4GdoGgBlM1QWz0nMUZtVBDLjQLMApIdj2TGAB8cZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXuMWIR85eIqMCdeI28pK68aaePXO2m9ciyKbMEpz/0=;
 b=uMvRu8I/cBwzocW5JDphk9i+H3EKEqj0jMHFiMsmZVRuQa1E0u/vybz43l1a9IwLVCmQXeSYQiaA/pTx5m78Kzylhugt2BhNzz+7ydE++nXlC8/7cxH0dTg8p7wdZlYeCEw6n9+ACzBhAvSipmW1KHlbqfNWgbf2OYa/bK7hx9k9SlWOUARJzQpcygT5Q3RaXPWaDEW+V/nvkWTGJJd5YRU0wcURmCt1dwA2Ma/xa2rfL06Ec877bmr2qT5mM3yiXVWIzY7kNtNkHPAhIDkx2kcxSviyeoq974FLYdQPR8HnCRHNZoGVpWUGcVttj1hayezfJNjhw17+s+uJH5ZzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXuMWIR85eIqMCdeI28pK68aaePXO2m9ciyKbMEpz/0=;
 b=OCTyeHWa9goizD8Kix80i0BN44toROx2nA3j09dJeAHVs9MBTTqKVQ4YELrHkioXeHfaJDmNsadqCnvxm0AeLvhKoyrhyVyT8BCBr4pCgzY5APh+0e+Ach1uuAyOS8lxnmqoDf6DOamrY0tW54t3ohpohTUpWAjCmDcryhGO6e2rEIT62VKl4/iiNWRlrDtgsGasviJ+xSW+POqULYNYG527EwDMet+DVKocGCL+GZ0tPptblWHwoH2cbv1njthNC5j4UxzPhekJCB4m8zvNCO+1XJZUkdBv+WNRuW6Gj6tWkiQAjJ0S4kmYkP61Q3394tphBKOSDZfdnC9C6PTOaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6233.apcprd06.prod.outlook.com (2603:1096:820:d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:32:23 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:32:23 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 3/4] drm/radeon/radeon_legacy_encoders: Remove redundant
 ternary operators
Date: Thu,  4 Sep 2025 19:31:59 +0800
Message-Id: <20250904113201.352187-4-liaoyuanhong@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68ad5e5a-d015-4f8f-f3ec-08ddeba6b76e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BLTitklD0O2t7SztUw3AKYYPJBEtF4pIzC0g1Gxsc4ui3PQHJr3JCBTkB6hB?=
 =?us-ascii?Q?QWroo8WLWviB2bpHmH2d0nnkptSYCGpwXW1uCemRLubg/M0yddx7am8HUXAY?=
 =?us-ascii?Q?KtdDJw23R+huZfSiojb6KUGGIrJMtQ6Oc3xYkB+Bua4JgCI9AtiCgdx23pcA?=
 =?us-ascii?Q?hAAigPM1UxjGUm72t6IPoHX8VJ8R/U9aGyktDcdW20CJ2NMEQ1NdEMdTOCZy?=
 =?us-ascii?Q?OH6AZKm48VKeZI59zRhRbbjJJp6sO/JZ4LUQtLocmGnYrW5gGve/QMM+cjcA?=
 =?us-ascii?Q?X2Z1ONzD+HctpA+/KUlSEs/n8NgFjgLy11jQCUveVC39qRs4SMeb3BdVyDVl?=
 =?us-ascii?Q?9PYYpn5+k8EALeHQOsa2fGpWUxvyNzYuPtGCvtaRZ32HCD26E5lqqTkEuDRB?=
 =?us-ascii?Q?R5jf1W+2X7kz+3qVIAAuBomaZlLOtc1GZlaYAnYAruvfX80URW3u7AnmrqJz?=
 =?us-ascii?Q?C4TE/tPNpmBCbVow+DpzGOV62n2eJFg1CSBwXwEIcLM+AmW3FkHdcnyvTsHO?=
 =?us-ascii?Q?uBLI7am1o7L/MZAPJ2TbzkNJ77oWiqTkWrvj9G7a1ZEr2ok6iIHPAVzFHSjw?=
 =?us-ascii?Q?8Y85fsgVL+lmKZKPFEXIhj78/W+/hMMO68WONjLHgzee4NzgwsevD2g76RDl?=
 =?us-ascii?Q?Uck/op358l9fWt2rPKnFIbJsR+NF08AI59XujkBOQoWLOLIKKpmsgAjxgxJJ?=
 =?us-ascii?Q?2JwRqXeYpMbGYOPrpUhcDdtW1xOySz0CX+1yLOnRmBrKZYrdLQOc2yERhiCQ?=
 =?us-ascii?Q?t5DVaR3x8NtjLUP+LK8mW2B3h/KqdoNB8ORjeK6YZdNiPfPZMfKg7m/7up7i?=
 =?us-ascii?Q?mfikck/qg7Y0MIQVsqHbubSMtRkc9YWW3MCAiPJUSMa+3Gvrtm7oXdhJQ4o9?=
 =?us-ascii?Q?b2v733kxj2vn99J9XEGSI+9uzYaorOsJeRZjgINuI+k0wHQJmT6MFamjYSIl?=
 =?us-ascii?Q?sfC8v5kTQS+uesRLRiU2jwZeZlXuAtk1CPxHnlALV7CU+ilT7SJNayGMDcAS?=
 =?us-ascii?Q?+mcPwbdD5E0dLP7zHKwlPCb2fI6NB9KWSf/hZoFglZ/JOTn4I5K9Nlbhd8WL?=
 =?us-ascii?Q?s5mjQK11XDU1enenD1KwiSk5qFK6UbBkV1bRpaNPKCzUrr6xietkho9wH3P6?=
 =?us-ascii?Q?iZSIPfVvxjLniLwOyDCoBHihm3RwWJzyuR9krFOGUNS6ItDfFn+/tw9ICvSt?=
 =?us-ascii?Q?b54Jm6gVGPLhjLAeMv+hX9AZ5uQ+cyfncUQyQdYcjN1mHgzm91JkyQLuu9VX?=
 =?us-ascii?Q?TPF13CHpdth9GY73IJnXqZpkQi+N+dpnDijCHQcPHMRwmqAHYJmBvrtHs5rX?=
 =?us-ascii?Q?1UxNIJhlwCOQ3UgQ9kI0DOzrMNGrk0YiSCSWBonatqHg96D9G6hTEyYnlNQy?=
 =?us-ascii?Q?2PwB9GaF31/3U0q5xBRg/886B+4ZTCOit/3pR+dj3giFgUMavomnmezqOk6T?=
 =?us-ascii?Q?P57Cufw3AfsmcW07d2mRNl6QbYk9WdHdmsLE/sDcFKc0SY6P0/yi0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DKLbauGDckPRpzlxkE62At0OnTbnGDRv3OZHtvLUEYQFbH+bpt/P7aaXPUdq?=
 =?us-ascii?Q?x3hGOkPyEqVaY2cL0vDFkWACTrisphx+PW2TI0D7aWtbCN3fL58wyT+Mj1ZN?=
 =?us-ascii?Q?1qXjbEjhPAdy10uMTkYEu+fhUiiG8kfuMUwZZT9QpFaD/6duh6gB4QsyHr4y?=
 =?us-ascii?Q?uhlxn8hxtyo+XfqCGBcbuMVWeQkd6HGoyTjNYR8P4ps0bp2u7iefdDXc+E8K?=
 =?us-ascii?Q?mcUNEOmQiDuwz8Z1BqMDgDRcLB7f7Yd5Jlf6J9TCFoU4GnuNjDuEz/2z1k/u?=
 =?us-ascii?Q?yLOontbW8QKdbcJUnUaA6gcB50jKGvziXavaqk/1XJeN1mZpbfLcsKRnvvPv?=
 =?us-ascii?Q?mGoUMJvDTNGodec13u8WgT0RxdrVEttc1mm3a2h2V+kwsh0H/XjSAv6x+sv9?=
 =?us-ascii?Q?whsEQKg2YWE2QypqI7+0hHKlci4G0ZPmBmFhy+DqV/lXgM2hc4nfFlWLl9Hp?=
 =?us-ascii?Q?1saEDNOFZUE/AYkTckuSuH4u6h/B5q5Mq51UN7IGWP7Lw4xEoOL+4mRA6rZg?=
 =?us-ascii?Q?7abGJR2o+Pvb/2rzY4zHXh3MOiYZn1vNeiL0fpXuQlrcq5BJvRbjnuLLsC5l?=
 =?us-ascii?Q?ZL10bmViDx+4lEP5mvdzw7y5GW09qVYsjmWW9gEyg0R+MzNT6C3OZUnS1zgB?=
 =?us-ascii?Q?tBS8z6PbE3Tz14qnUKzk5vxvfCQySK1YTKiTcMv02axP4sb/HPKsp5zgBRsH?=
 =?us-ascii?Q?ZlQKa6/tXZbWcPC4N7d/sG8A/WT/Zrhuch6wgxGTFodV/R42Rev9mP0GgfKt?=
 =?us-ascii?Q?PRoCQL06vQUM+XRW4M1e9cBYOX3+0IwGzgcy88qgqI0Cune78ID56eZ1xkSr?=
 =?us-ascii?Q?gje9F/7v95rNNnySZ0cgVJJHEtOdL0UmdgCTbXSU8A23POaUr7UZuYt6OYg2?=
 =?us-ascii?Q?+ujkDgOwW1YCSweUuf6xyN+nn2U6aoOmZVE3ofY2HDlqD4kYuK7WldPzJLF3?=
 =?us-ascii?Q?Nune/7+DqRNPL5rZ/NV/1JswzUctlsloF27JZi7EUPQ2IxN34VQYv3/jUXaV?=
 =?us-ascii?Q?7hSiNhqN1+y+XMBdE3Qt2enqYyqen9pKvNK6EYRv4sZ7TVdvKs8u72mL9J3O?=
 =?us-ascii?Q?Kw7iH0BHa3DMfADe1HPu6hXNliL/rGB5LXr4Pv4x6nVDb+p8p1XZjzqwQUAo?=
 =?us-ascii?Q?aNCGEQy/DhO2v5J+8c1bDqECet7ue2EgsYWDPBuUe/hNmyW1ue+/rd3qcIvf?=
 =?us-ascii?Q?TfOYUQFOO8wZOf6oMHJzSqwX1UxjVQgTWYUgC22ORfXdZWkte1afdw/cvG3I?=
 =?us-ascii?Q?G3Ob4RBXo1RMFs0q649bTbjURkd7NeBdrQXNa81ekG2OBghDljF00nbe0oWK?=
 =?us-ascii?Q?YkIjBOtbSC6BZ8yz2sCQlycir/Zv93D+Un4UGGwcE4eu0HyvaaKg1NwLd2yc?=
 =?us-ascii?Q?v/I12+gIyFAf6F+SCf5gQPiFbc80vwC8bbhUwQRIeXt5uXNTgxMYr8BVIlV3?=
 =?us-ascii?Q?I1qmQCpoNzmc8qz4WBEw9f5jSQDm+kcrsnhC1mIPrmiXgAVWnKxoja9ZhcYc?=
 =?us-ascii?Q?Ymv2SHNKIfaI64yRowT/cpCPSW/Mmt3J9Wr+D5h27I7AGWCckDCqRFF8qEAf?=
 =?us-ascii?Q?vrBrG4u7ve36dsV2GkP8imAj0r4ehGmSKmo91ncZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ad5e5a-d015-4f8f-f3ec-08ddeba6b76e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:32:23.3030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ah4bfcFyw6eUHwLoGEW/yiha7u47FgaT9VFyqVM1wQGLb4v1ibgfilKSQ+U7c2iUcYlR9IUeeYlyurEQ7F0RA==
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
 .../gpu/drm/radeon/radeon_legacy_encoders.c   | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index d6aa1a3012a8..d1e8b9757a65 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -136,9 +136,9 @@ static void radeon_legacy_lvds_update(struct drm_encoder *encoder, int mode)
 	}
 
 	if (rdev->is_atom_bios)
-		radeon_atombios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_atombios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 	else
-		radeon_combios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_combios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 
 }
 
@@ -545,9 +545,9 @@ static void radeon_legacy_primary_dac_dpms(struct drm_encoder *encoder, int mode
 	WREG32(RADEON_DAC_MACRO_CNTL, dac_macro_cntl);
 
 	if (rdev->is_atom_bios)
-		radeon_atombios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_atombios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 	else
-		radeon_combios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_combios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 
 }
 
@@ -742,9 +742,9 @@ static void radeon_legacy_tmds_int_dpms(struct drm_encoder *encoder, int mode)
 	WREG32(RADEON_FP_GEN_CNTL, fp_gen_cntl);
 
 	if (rdev->is_atom_bios)
-		radeon_atombios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_atombios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 	else
-		radeon_combios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_combios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 
 }
 
@@ -908,9 +908,9 @@ static void radeon_legacy_tmds_ext_dpms(struct drm_encoder *encoder, int mode)
 	WREG32(RADEON_FP2_GEN_CNTL, fp2_gen_cntl);
 
 	if (rdev->is_atom_bios)
-		radeon_atombios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_atombios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 	else
-		radeon_combios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_combios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 
 }
 
@@ -1113,9 +1113,9 @@ static void radeon_legacy_tv_dac_dpms(struct drm_encoder *encoder, int mode)
 	}
 
 	if (rdev->is_atom_bios)
-		radeon_atombios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_atombios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 	else
-		radeon_combios_encoder_dpms_scratch_regs(encoder, (mode == DRM_MODE_DPMS_ON) ? true : false);
+		radeon_combios_encoder_dpms_scratch_regs(encoder, mode == DRM_MODE_DPMS_ON);
 
 }
 
-- 
2.34.1

