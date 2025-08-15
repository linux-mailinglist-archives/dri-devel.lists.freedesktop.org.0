Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2963BB2774E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B83110E95B;
	Fri, 15 Aug 2025 03:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YzWu9DOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE32E10E99A;
 Fri, 15 Aug 2025 03:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5S0PWM4I3nLqK6tIKORBkZYbpCfEfczQNFRaiOFbA6lv5OGqLvfvT0SVdYmGvr0ukf7IcZsBz2rgyMbQNiq9zaZd9x+GoyK8zx7DHuyIFCULUTUJvqfgG6HZkI0SalYTBjjK2MYbceK9TNVpgcb1X6LBHVrudzpuMUn4HZj1Df0/tvT0Ic+YhLJrhDDAiS6D9aUrNaJtWK31FW+L1Oc2KwQN7lCxyo6AVVCPE+jv9H2XgSr6PhqomWAxZZiptR9R+/XdDCGvZZvLXy9VGck/ok26cTZoAcrkuxt/8+5/kJy1PoVCza6JuUrWXShkZVDDoKN/kOSuCOKhdkXtDTtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pL1bgkIkP3h4Ne7qyFZ5kuAxmVK3LkSnEt2POYGfsM=;
 b=gsjT3BQGTScUio+bK0SHAS6Ct1d/eiMndGw/zGLMC4QSU5XuYh6qlqF8qXr/ZYVgU4mSRw93lgaONHm16jS12gpG8N16iYWbr9jGQ38fWcwLUNSrRXBloIOKjjpJpyPhMYcqbiUNdHa/6//jdt8qmWV8uEzMM0w85wrrvUUIl5JpFLy6JN8Ucur23CtMDchAk63e9/rCpZJwc5TA50JrSP4uPRTPPeXRk84wnC5QPMIUaKCgN0p0s9s+5aNR+TygOITw9rNpgKyJfEPGnjIYXqXsT3pVkGDkVymM2o5GaKbQaWi8lTRRTOdAzqlpso/Zhtjta3lyHC88/HsSKckX6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pL1bgkIkP3h4Ne7qyFZ5kuAxmVK3LkSnEt2POYGfsM=;
 b=YzWu9DOXF7QtCekOl/YN76CHL8vZk25t06dIz684wl4Th6v/9K9b7sKsMbHw+gkLbC2bwAIDLWHQ2pZawSdAlkJt9qA1f2ztogcy5NprJCGAMv1M9zse8c8JO5/S/kq9Dnf5jv2x/kjCseBhtuLesnOeetTyOxCumfjwT26ho7I=
Received: from MW4PR04CA0109.namprd04.prod.outlook.com (2603:10b6:303:83::24)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 03:55:44 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::1a) by MW4PR04CA0109.outlook.office365.com
 (2603:10b6:303:83::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Fri,
 15 Aug 2025 03:55:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:55:44 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:55:40 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 17/47] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Thu, 14 Aug 2025 21:50:06 -0600
Message-ID: <20250815035047.3319284-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: c7db7dc5-4a96-4c96-1eaf-08dddbaf9c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?veaBm/OLPj7ZoMmOaMh51ukom2n1g55/CC7mD/ELgyvMImD6coBhgRvG4YMs?=
 =?us-ascii?Q?tkwe1d/xPkIdSY3VexwzIdNdZt1DUN+6lABjK+CRJHnPQwwDo0k1Zmo77jdc?=
 =?us-ascii?Q?Ba/1SSufc1MmbA4NvrCmCwNy6HArClWeEil3w7B2Tc/CQ/u5zdy4eyCp6i7O?=
 =?us-ascii?Q?MGo+rkYMtwOkwBlW+bnWgzAvggxssurhXSYCf+zz+pvcVcgMH90d/u6HSW36?=
 =?us-ascii?Q?rKUKalrgxRzKlnBNCJqZGc8Bn5gWr4wEhoSF3ZjnqUZbgc5mtmQ0Hga9XJuy?=
 =?us-ascii?Q?FU5DBrgNYnRlZdSbs2/+7O4xkMOeQ+DsmbM46nM0BGAymWBFC1tkIKOymg/d?=
 =?us-ascii?Q?kqmt5t5u1cYOkOP8yJ9PaOU/KMCoGYVIJrEkkfw8BLo7NSsjS+lo+PemvOY3?=
 =?us-ascii?Q?7BROA/Pi8Wt8vA1W8D2FZkU26PpFYZc9CkU2GgB91XMSnBqZUZEThaeZYN69?=
 =?us-ascii?Q?jXi7U7lX/YfibbNVOkpLBH8DV8AbRZ4W+RidLVR0lJ1jhRp5nTRqEXxJHzjK?=
 =?us-ascii?Q?LRQrSQEWB8+pKCBQE/ZDQeCcgR0fvHIxELYUpBFXSpJFPizb0ij8kBP3o9SX?=
 =?us-ascii?Q?5aoVgdCHzGSAP+fgwa+n9pN/NO8OoAt+xQ5ynVTz8YLGuVXum4GOwqyMc+bx?=
 =?us-ascii?Q?uAfd9WwX4JfsdwTQHINMm3IK86R0E+ksiCO792v9XuAx6wwh0FCtMHCdQelU?=
 =?us-ascii?Q?AmY4gn3TM4B+ocZXNPfNWZrXStk0BUpmqDTBH00bVUl7hfN/SrUHQm+hKV2U?=
 =?us-ascii?Q?B4H3uDUJdwxEALA+7agW4i7WQ0/Yo9jhfFvhfEgM/qa4EeI/xC3DO3XXQQF4?=
 =?us-ascii?Q?GrDeCQyBd5CvEMJ5YNdNl2AAAitk0TvYdvoBHzXYW8Ce6vJIsFdy4wCNqLls?=
 =?us-ascii?Q?rN1NwIw9vFbFuGgWNBndtR8VZ4TbcFo7v0+4ggHSoAutK3iyCpqobVLmSPvP?=
 =?us-ascii?Q?kwGo+GYtKG5WNPe4UMdlbfElRqQqqR5I1HflTjKDJ+oC1T851+UugF1XDrk+?=
 =?us-ascii?Q?6MRjiGyIQKkmSHtSui/LhppfcEu8jmXdX896ezMUJNaJ0DyoUT/e11MbGCd/?=
 =?us-ascii?Q?HJF/AglGCxIxryygSaAGSqB7hiTpNqVtkV/a2NPijKFG8bNlZ3gft0vS+Fwn?=
 =?us-ascii?Q?dqkED40j7VLVveViAnry9UPrpLGFRV/K1CIkzTFA8LS0R1eOZST9lGZWUwuF?=
 =?us-ascii?Q?YE/yJCR/tQqL9ZazeCMXGZ8XxBcoeOQT5Ua8hihO4IukzcTMcKEs+piqPsf4?=
 =?us-ascii?Q?AtD6eHjh4KcbUP6L+tvJNYtkTil1jG13cn2QFcYyu/D7Yzy5PQJX0kktuyrp?=
 =?us-ascii?Q?naz6LQ/8UVvC01aUKd2CYSqTNfkx5k8+ZEtVQCImEAA8lczGc7XDiBTYVCDc?=
 =?us-ascii?Q?nHobZprLqdYWUOA1T+Aci0HABkULLPHtNIfm6xYSJ3q0L0hh2MqNTaEXGQaV?=
 =?us-ascii?Q?KohidHEJ9mWnSjhCk4CvESaFwHysjnny4hjeulHUzS9GBy6DXzyJNC3Bsy3t?=
 =?us-ascii?Q?UW+L+j7sMKLNtV8hrmAIu7eBEMG6Gc1UdVBg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:55:44.3535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7db7dc5-4a96-4c96-1eaf-08dddbaf9c4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
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

From: Harry Wentland <harry.wentland@amd.com>

Certain operations require us to preserve values below 0.0 and
above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
such operation is a BT709 encoding operation followed by its
decoding operation, or the reverse.

We'll use s32 values as intermediate in and outputs of our
color operations, for the operations where it matters.

For now this won't apply to LUT operations. We might want to
update those to work on s32 as well, but it's unclear how
that should work for unorm LUT definitions. We'll revisit
that once we add LUT + CTM tests.

In order to allow for this we'll also invert the nesting of our
colorop processing loops. We now use the pixel iteration loop
on the outside and the colorop iteration on the inside.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v7:
 - Fix checkpatch warnings
  - Add a commit messages
  - Fix code styles by adding and removing spaces (new lines, tabs and so on)

v6:
 - use clamp_val instead of manual clamping (Louis Chauvet)

v4:
 - Clarify that we're packing 16-bit UNORM into s32, not
   converting values to a different representation (Pekka)

v3:
 - Use new colorop->next pointer

 drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0f3fcd6a5925..6630dccd68a4 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -128,7 +128,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;
 	struct drm_device *dev = colorop->dev;
@@ -157,9 +157,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
 static void pre_blend_color_transform(const struct vkms_plane_state *plane_state,
 				      struct line_buffer *output_buffer)
 {
+	struct pixel_argb_s32 pixel;
+
 	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
 		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
 
+		/*
+		 * Some operations, such as applying a BT709 encoding matrix,
+		 * followed by a decoding matrix, require that we preserve
+		 * values above 1.0 and below 0.0 until the end of the pipeline.
+		 *
+		 * Pack the 16-bit UNORM values into s32 to give us head-room to
+		 * avoid clipping until we're at the end of the pipeline. Clip
+		 * intentionally at the end of the pipeline before packing
+		 * UNORM values back into u16.
+		 */
+		pixel.a = output_buffer->pixels[x].a;
+		pixel.r = output_buffer->pixels[x].r;
+		pixel.g = output_buffer->pixels[x].g;
+		pixel.b = output_buffer->pixels[x].b;
+
 		while (colorop) {
 			struct drm_colorop_state *colorop_state;
 
@@ -169,10 +186,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
 				return;
 
 			if (!colorop_state->bypass)
-				apply_colorop(&output_buffer->pixels[x], colorop);
+				apply_colorop(&pixel, colorop);
 
 			colorop = colorop->next;
 		}
+
+		/* clamp values */
+		output_buffer->pixels[x].a = clamp_val(pixel.a, 0, 0xffff);
+		output_buffer->pixels[x].r = clamp_val(pixel.r, 0, 0xffff);
+		output_buffer->pixels[x].g = clamp_val(pixel.g, 0, 0xffff);
+		output_buffer->pixels[x].b = clamp_val(pixel.b, 0, 0xffff);
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 30941714cd0f..55440ec6db52 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -45,6 +45,10 @@ struct vkms_frame_info {
 	unsigned int rotation;
 };
 
+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
+
 /**
  * struct pixel_argb_u16 - Internal representation of a pixel color.
  * @a: Alpha component value, stored in 16 bits, without padding, using
-- 
2.43.0

