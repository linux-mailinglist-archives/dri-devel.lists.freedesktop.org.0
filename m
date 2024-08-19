Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C45957637
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFC910E3EA;
	Mon, 19 Aug 2024 20:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qV0okSCX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6B10E3F0;
 Mon, 19 Aug 2024 20:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8zB759yQ+oOLZoLux3eZvCaTos1h66ZlBWKO1uJ4oBVTVALMmiTleg04dVfgaCJ/y7s/aiIQx9T7r8mIRKTremuHqbuIQup58/WD8gf62unDUg6XqWnRes7UC4p5q2Cc7jOCPxClu0J86S2UcloY2YZqgfojPmjtm06xVtteOEY0cBUNq8T7uZ8hi4oMS5sgQwx1aE9YACy9EdDXqFws50B4rQp2sqei9x2QlT1Em4F9vMYLKkUmMRmKCzu4j37E7sD0ZZaET/uf2ntgQHXlNrG9s5MxbV+rh34Y4NssGtbYI5Nd1NskIRb1Kz1PvodD8WFa8VZWwO5wdwoqUVIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpa52Q291OQRyy+cJmUmWi24e3QtEqjoejeWm62DKzY=;
 b=WGylGi7oI7qx4NyvgZfCcxnqZCVPibgtu0bAjWIFeM+U5BHKsZGI+ebsw41reLMWrH4RmyzqrT7yRDBLhCy2IZrQCBuw/yqDzxmC2kZTBHcDRwqQQI7BYnqhLQ4SBmoIoDcr9zY26cPTq2eWKG1EcIp9FLFXRly/U3pLapIoQibsZN4zd83M4BrbFvQfUHf/Lz5w3fY4MWibAKHpbFt7DcTHy3v8v28DgxEiYJgvr+2xCJUkIRZzReaDWgY6s+HDax8NL1OLV1BF8937ddtEnI1HmHQoXrqK519f4cumGsZJYJNQq7DhZmfbjVKpeo1JSLsIFo6KHB/onfVhR63gag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpa52Q291OQRyy+cJmUmWi24e3QtEqjoejeWm62DKzY=;
 b=qV0okSCXXBD6jZ6iLrcy0v3dF1JUgOcDq4Wzg/KpkLUFcdCvpapeDYcUhE8Z1zMvryUzmNWs/ebIRC82v7/mHtzUiVJstlLw7NMo7spF3l+hNlQJT/V6iNlCtTQJ4UI64KxqR9mEesd3+zxplbiinF7lmFVBDa+HhTCCvah/lY4=
Received: from MN2PR06CA0009.namprd06.prod.outlook.com (2603:10b6:208:23d::14)
 by BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:41 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::2f) by MN2PR06CA0009.outlook.office365.com
 (2603:10b6:208:23d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 33/44] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Mon, 19 Aug 2024 16:57:00 -0400
Message-ID: <20240819205714.316380-34-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 83aadf72-37b4-4032-2177-08dcc091909a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3w8Gskb5Pb5q3NEVrcwQbjpUesZoBFfN4lLqJR0khB62GKOFjfQ5p5CeiKi4?=
 =?us-ascii?Q?0lsJO8zbL16oXONeOs8266cREYod9jg5PJlCNcVcPYK+6ZC5fRmIdp6jK/aq?=
 =?us-ascii?Q?VdIe0l+MVAjpB7ec5hJcPuPyetI5xTgCv9ANS4eum30rCnT/VIUimRW0EYui?=
 =?us-ascii?Q?kfnAtNuUSqAQcKHTrZUmqE6fJtg81RGeF4EoHmnwJEQNMGsnWIZFkdlM4Jcc?=
 =?us-ascii?Q?hWmygSbjSaDiWKvsuSu4E/Y2zixtGC5yxzhy35Ds/uN1w8Ap4Rm8VC+/ucWP?=
 =?us-ascii?Q?/NTU0rMGyuEh2W92JwxpR/Howdo9jlU6gwXsJg1vk1tAF5blvv+YSaz6v/aq?=
 =?us-ascii?Q?lZVbb+S6KzIv/hyQWb8l8EUWO9S7dIoK1NIk1zYUWelw65B5EQEWfqH2AyWL?=
 =?us-ascii?Q?MxjSp5tWf4XfienwuqubjYKIscN1E8tPgBbystPvfgkWBl16lCV7FM8lzXYw?=
 =?us-ascii?Q?Ml0aAyXLBnORNGM8+5e9Pd934RNU9nMFQX25jXPY5bCzUp1Iramz/rW0hK7P?=
 =?us-ascii?Q?95LBQfZi1tHW28BcR0KsHKub074TEv+Cdv/F5YHTcMjzOakzuo1DOAn0v167?=
 =?us-ascii?Q?QkmfUbbI17ElfSNOgjwhor7PrU3CBHej7aCW/cZZkiEVMytOy3q34e3E+go4?=
 =?us-ascii?Q?WEyEsFHDDlsC3jc8qlGJAJADaUznLfB9Y6Vt0QhE3gWN3pQs9fi+qAt/PJtZ?=
 =?us-ascii?Q?t3s/IWvDsr20LUQk5yMZwCiuD0F607uULAhxpzTqvpP/Jk1x+weT+ZbSHA0N?=
 =?us-ascii?Q?BEQlFEQIk4cMVyrR72L5C/8zGpEw+k1kzTWLQK+uCGzF4NhHgks2UQNKEyfO?=
 =?us-ascii?Q?nxcsmLgA9zrGxGBoRANMuaLA5BHZSSrWQ7y09wh6Ok0Jb5tcUXC7kN/g+Lqi?=
 =?us-ascii?Q?KbsCIuH0DenVOvDy1JmNNkZiG97KpU9EpHkqkEp9c6/JwryYOc1u1F8N6Edw?=
 =?us-ascii?Q?IWeT9GXppVoYjngMRFrFN1hq0yXUt6/Q+oUhobJS6pMu2Q0QZBQwyze3upsS?=
 =?us-ascii?Q?BMLdfG1QnE1hd75vJhzI/MseVKUpR1UzecHRQEJtdQD1p8AGahmo4HkQmhmD?=
 =?us-ascii?Q?IjF4IrAyRru6kUGJugGCU1zP9mYR4r1DEQy9dZlTBKlv3sOepd/jQ6hbI7KZ?=
 =?us-ascii?Q?c2RdDM6mQtxRV2x35h6qJXmpWOa4fSMUhWelg3+nFSRMvqGte7aoaUEBtwXt?=
 =?us-ascii?Q?4SH0YGazOmR525dR0MrKm4eYReVF9nW1rwuFA8nR58+t1XZThGAagUZNYqvR?=
 =?us-ascii?Q?iXpGpmUkDFrkeD4fc7e8pr/IsQW2xTauQ7dkGZagZFBxv+bZoT7Tw4a3sXdf?=
 =?us-ascii?Q?PmUU8RI5wheH3kgvckWfy2CGygzYGXfHhHh4TbO3aZFIerIN6hfOKxcAmIhI?=
 =?us-ascii?Q?SNgmSERnynp4CX1KUsc8PP+IBOqCdmrCcGgIBdHq2dfCtnhudHA/O6pmQGat?=
 =?us-ascii?Q?ZsiNzkf5V8LHaR71dzZcd3S8II8p2fNK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:40.7953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83aadf72-37b4-4032-2177-08dcc091909a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970
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

This adds support for the BT.709/BT.2020 transfer functions
on all current 1D curve plane colorops, i.e., on DEGAM, SHAPER,
and BLND blocks.

With this change the following IGT subtests pass:
kms_colorop --run plane-XR30-XR30-bt2020_inv_oetf
kms_colorop --run plane-XR30-XR30-bt2020_oetf

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c   | 11 ++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 10 +++++++---
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a1299ca83bac..8f1721bdc243 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -677,6 +677,9 @@ amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
 	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
 	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
 		return TRANSFER_FUNCTION_SRGB;
+	case DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	case DRM_COLOROP_1D_CURVE_BT2020_OETF:
+		return TRANSFER_FUNCTION_BT709;
 	case DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	case DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
 		return TRANSFER_FUNCTION_PQ;
@@ -1287,8 +1290,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
 	const struct drm_color_lut *blend_lut;
 	uint32_t blend_size;
 
-	if (colorop->type != DRM_COLOROP_1D_CURVE &&
-	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+	if (colorop->type != DRM_COLOROP_1D_CURVE)
+		return -EINVAL;
+
+	if (!(BIT(colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs))
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
@@ -1324,7 +1329,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index f99d8e09d89b..bc66bd4f9fdd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -33,14 +33,18 @@
 
 const u64 amdgpu_dm_supported_degam_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 const u64 amdgpu_dm_supported_shaper_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF) |
-	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF);
 
 const u64 amdgpu_dm_supported_blnd_tfs =
-	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
+	BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF);
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
-- 
2.46.0

