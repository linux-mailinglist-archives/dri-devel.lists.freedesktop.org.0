Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB298F7B3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77610E963;
	Thu,  3 Oct 2024 20:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OAw39GiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17C610E955;
 Thu,  3 Oct 2024 20:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdsL7nT4/2Y7LPdBSTET19feJHhoTjoWFLS5HrfEf2Qrrji5O5Tng4FBPfF8bM5Ry3arUFaCOTksfV0L7r+ZkGl+HCGVHINkNLk+PG3Pmn8eghEaHXu2WaEztOLDmTfKm4G+U+R4XV72WweJWoz9sGLuxUabu0sczf+lItzJstKYIl1YsRy5h+07hDKL2Ldo/npVzdrs2sP1c9tuyG5JGOB3WSk3m0iuGIGE3LAo6F8jWjBzOBJDhwnQaayZiH/yYd9ahUaH6IE9tQ2uPBHJ6d+PvAXE5fiM1Pxcs4dBRq/oetL6VCmCkXKxiKSUMDW3vc31bquFE40bxhDXkrArUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t6bXtnAk50Utz0J5CwII5FryENPI/9GfBAtkKdP7xA=;
 b=bALmbk8hKQY27mtpo71AUwv+N+gXEk3ZsK8FY//kZPajrLPrghl7XrIgsQrO5SaZ4O/Khy/XLBsWYyb3it76/GZlJmwz95yahaow3Wxjs32gCfVvgghcORX2+Uf7vqet+8WY6X9C5Tg0cNWBVfX/8flWA3PaNw4YsXPmwP72lVoK7gLctxPLdeMG8NKETAqKJvmns6N5ZE/q0XNsO2rJna63CoNkHazrItGQngPaESmd8kpOFr9rGHgrAjYgUM/WAkBoFV1XbbCwk3OekK5LLZ2NTZnpG5hGiI/nFSsdaYKME0Ydx6PMKKb5Udv/JACqiTF55+cSKbVquIHJrRNg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t6bXtnAk50Utz0J5CwII5FryENPI/9GfBAtkKdP7xA=;
 b=OAw39GiDDnBXyGA+0zoT9jygaL2q4CN3Libq92c1RrKxnk/FYw7UEnX1DJMLPeYhmvl2DzipilK5g6hdtj4lwZlU919O/EEKNgH8RA2mfo6ksxk/SMp8yGpwkiOGxWkOPMPGmUSbOxAz7JioXJtvUiSgYk2JR2vRC363uZQ65b8=
Received: from DM6PR04CA0005.namprd04.prod.outlook.com (2603:10b6:5:334::10)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:54 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::6b) by DM6PR04CA0005.outlook.office365.com
 (2603:10b6:5:334::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:51 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:51 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 33/44] drm/amd/display: Add support for BT.709 and BT.2020
 TFs
Date: Thu, 3 Oct 2024 16:01:15 -0400
Message-ID: <20241003200129.1732122-34-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ea46ee-fef7-4fa0-408c-08dce3e63a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UxASvz8F10QEaEU/eMIdzCHzTgx7bhnJjNTKH/ee/lCd5CUW8Z5C7Vv2/46H?=
 =?us-ascii?Q?g7HcnsPHts1bkeKU+7YYNkx8j3AwF2yy8EdWk8qMgf23/jUZ/fpr2iJ/WC7I?=
 =?us-ascii?Q?hX+OaVIUKcBrUDoIcd6av34ftpwj1DBNR/dp84o6C0kSKZijH7LJpT5qIEX/?=
 =?us-ascii?Q?kvL0N6f4SpEmTjzp8YjZW+xRx7X7HW/ctiV4jyLQBSJqe6cS/D2sGK+180Zc?=
 =?us-ascii?Q?qIUwm/Biw+9q82l3TUOkiat87yUniWubSWpJaeNcW47cXvSawkWSwgdnt5K6?=
 =?us-ascii?Q?VomV9HB2F1rcqsssaMHrknHaHDUfkZi7bW4f4yymhchsHCS+qYbE0WoqKABJ?=
 =?us-ascii?Q?PUojjCuEN7fcOJNozcvptR+mxqkzvgnzhAgE9ELG3gNTE79RXqrnMBji9UrC?=
 =?us-ascii?Q?B9aCcp1hwcQj07J8u4Xq1eQnlA6gicTEx9eKqt4XpbCNCPvZKHmojLNz6IGN?=
 =?us-ascii?Q?tfvXXiSlcTpDDGtwchqD7gzDR1ZBdWIMi4ANlGBfpxQEcpXHmq+3DX91qa7J?=
 =?us-ascii?Q?0HPDBCoez5cGpO7Yc1i8ZES4oRQssy53MnKm94NR1HXNINpfWzwap5g/dNgV?=
 =?us-ascii?Q?aAkWhKCd+N8hfYJRlsFQ9lP+Og4xE8hbcufcbJF9DmpkJwy8e4Yl1jCVBoMn?=
 =?us-ascii?Q?FSdNdo7PUKQPWn9/uIpMbse6UBrxtJBzDwMlsfbcl+mQHY1ZarwxguVNEX2J?=
 =?us-ascii?Q?THt67Srw5rspu0TDtoG6KLUjVX0Qo6iJ7GV+nuQJttDoI/+qkX6uLZd32Lme?=
 =?us-ascii?Q?VLq4Cz1uBD21XSzSmInkiBqEoYlB3DOjDLEotxr31cieO8Rukjetu6AtphHs?=
 =?us-ascii?Q?rbxoT5WQVpE8g994ncXXlvuhT2zYqvwQxsXG0wEfN68MSU2mtTH92rKZrKKE?=
 =?us-ascii?Q?kxub38B1HJT+4LZbi1m+z+EMrIPW6ET+POmt1qXZSBkBgQrhv4vDog3x7fm3?=
 =?us-ascii?Q?IOOpkciDgTdmtyy3ZlaC8FO8duCrkKskqlzZ91CJksFnbfPpAw6POj8gqEU2?=
 =?us-ascii?Q?8paYueNUAnx8HqBFSqhdR6MNtGHTm8mkd74IaxFdxDP7j4b8oEqyucYgzKCs?=
 =?us-ascii?Q?kAejBkUH8MibvLRuZuO5Zvup732tYP+Y6kXBDFOAq4Q1Z5EQ49qsGLzcWO7T?=
 =?us-ascii?Q?CJDke0wgx4oeXfRABJTNvMtvpmgE50R5B/nt3zTOBormpwHfehZ1dhTr7KBX?=
 =?us-ascii?Q?dLn+vi+tGDoCVt3lwXzizAhDIxzgFyJPmXUP1JDRFf/5KPn9zftIXyJzQvfu?=
 =?us-ascii?Q?x+h8X7JjL3r6iQQDSvwN62aBJgh9TNhQXvvTRJNozhP+74cfx6ble7xQjyDd?=
 =?us-ascii?Q?CSEHgyaqvt85FXyEdbb6GChL4YV6WW7H2TMMnR9R12ffz796FYjRUOQoajdm?=
 =?us-ascii?Q?mnz6FiJOhMHeGa7A44oUBOIGhmGS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:54.0411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ea46ee-fef7-4fa0-408c-08dce3e63a68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919
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
index d4ef20bc2be5..69d41b32f529 100644
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
@@ -1285,8 +1288,10 @@ __set_colorop_1d_curve_blend_tf_lut(struct dc_plane_state *dc_plane_state,
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
@@ -1322,7 +1327,7 @@ __set_dm_plane_colorop_blend(struct drm_plane_state *plane_state,
 	/* 3nd op: 1d curve - blend */
 	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 		if (new_colorop_state->colorop == old_colorop &&
-		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+		    (BIT(new_colorop_state->curve_1d_type) & amdgpu_dm_supported_blnd_tfs)) {
 			colorop_state = new_colorop_state;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 0578f33c8422..7fd274dc89b7 100644
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
 
 #define MAX_COLOR_PIPELINE_OPS 10
 
-- 
2.46.2

