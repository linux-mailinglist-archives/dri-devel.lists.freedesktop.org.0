Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCB1C1E428
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE4210E238;
	Thu, 30 Oct 2025 03:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pYv1ayHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F93310E238;
 Thu, 30 Oct 2025 03:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doa8D63ZHptvZhyjIO1hB2Swfq7d0XkEhBKv2FD2+RJFPjIO6yAsvHsxWSOacOggyt1HpymaxpJK3TkZMbz6l5DP7Srxp453KLbEnPpsWDZxSLm8yyz+7qyre2vRZ9YJ82zPq0wZa1vqwiEHfARqMDt2rwEAKITl6gKXP7kAQG0OYrOLc6pkLBTXf5+UCyC8K6mYz/Zz+sUUOa4aaP7ZKBHjQTsf9nFWQLO4An/5Q+Ck1CSWY9S+WOHzv2vxYmIJBxQ5KsVjuun9hlbxNzrTy1Ne4+r28WCNZKcg7qimtyDWzgNW91gf/25W53+hqnjOBaySPoZMYLq0BhmgyOX2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6HNZQXd8JQGR50EEfRARF1JkjXtBzr9CsW3uZn1DR0=;
 b=FHbJc6iARIWXu9wJLOzHkKs8ujP8ImPz9HxUleGRWkbqcc6Vmj2dKuFExRP3gu82Ua/m7ju3bzAC4/+/j+0z63CvQL8ApVMvL3CzmuPYvYhqpbqtDg/9BIUjzvvxRSY3Raayfw+s/qOWTUfpDo0HUgokDHTcmfQP6jBMN22v4O+ohghfeJqSIgGL3wrUt3p8nO3hdC+ILlCePP2bEylEJF4/oRpH/vep4uVld1gpo68MZGTuWgddU7QaSjVbb1RAFlFSlCxzLFNznuqwrw42L1rFQq7J7IU056HP5V7dkELGyhdzo4hHJcyZcvPJc1QLt3xIGE6MwgyID3xOEdPJHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6HNZQXd8JQGR50EEfRARF1JkjXtBzr9CsW3uZn1DR0=;
 b=pYv1ayHpZJKUsVPLYpFuZv9+Rf8Ohslj/yik9Pij4Aux3Yo9P6S46G716Jiex/5DNBwKnIwd2SIRORvxJ/1wjPBNV7s17r6G5ELaqTK+l3WeRu7IbnBC+Nk/eG3wMTyAcAt3nHUoyjibwh09frg3MiQ1T0BlhPIf/SlOXvUyt3g=
Received: from BN0PR07CA0018.namprd07.prod.outlook.com (2603:10b6:408:141::25)
 by CY8PR12MB7145.namprd12.prod.outlook.com (2603:10b6:930:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:49:01 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::c9) by BN0PR07CA0018.outlook.office365.com
 (2603:10b6:408:141::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:49:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:49:00 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:48:56 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 17/49] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Wed, 29 Oct 2025 21:42:22 -0600
Message-ID: <20251030034349.2309829-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|CY8PR12MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 786597ee-9285-40ac-3fc9-08de176742e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UCj9Xj5Q4JAY1UA2ziQKafcd7MQTIFAsbdCB2Ffa1E04sa+qJZnLz8XsX9VM?=
 =?us-ascii?Q?TBUpasbL4Gx2GfaWfz119NqzkRdxN525PsiZ8OI2se1OZvV4t1zERE65KyET?=
 =?us-ascii?Q?ZQLWVfLpedhhAQDe1tKBNNxxlNFCNDWKZdHpBj6DwFgusBoZQPeuLf6yubWb?=
 =?us-ascii?Q?2FX36ANbK/nEZbp320ZGMjo0dz6WeBl1mWg62QU4aN5+lG6ltURjqXwzEIPn?=
 =?us-ascii?Q?sPlKEeKZRRJZohuhir7InaRu4X56MhpnKzHdAywVusWrUmz50oZQCzk7wXFp?=
 =?us-ascii?Q?6RL+qsHTdyQ4s5FyPQMO/4Mc7p2iojyZgwQSbY5V9L5ChjgEaGyyIVSKfrRT?=
 =?us-ascii?Q?QpoP35Y/+bdD2NWNFuF5z5zmax7dXuSrYSKY+G+5AQQ5YC3rljKuoADpYe7x?=
 =?us-ascii?Q?T9MT3TWAJ4Iyma7/HMDNQ9c6j/AjvaXz0+R7W8s+swT3Z3b1q+5jp047q61R?=
 =?us-ascii?Q?w1Ax56bGfjyjsdwv0I5Bm1s7eAXLVkQx0oriSCkm+xJMjMLnKmNA1gDuTYTj?=
 =?us-ascii?Q?Mqx78JX6t+weEl52GJOszsy9BM0jSR5VhI/s/jD7nXQJVrKTgjr47b9vHc8E?=
 =?us-ascii?Q?ecwvRh4aZedjUZCG6N/y0W1naZnC90LtK03vZQqybO18MI4mNJyQ6g5K5U+2?=
 =?us-ascii?Q?n0XB0Y+8KnfQjKNn1dYI1KSC5X7UEoFfc1y0yO2TLOGrd0LfOjWtDbj9C/9F?=
 =?us-ascii?Q?dyojeKnPIk0PX/KrEYPRSNUjtmQP65jVAPH3fUZPzJtzc0JW15M0AnEl5X0y?=
 =?us-ascii?Q?LL7wtA/v68xc+Lh8TuUCsqXRnjhUZcgVCiTFE7BF/CqhEgtDOC0MEeOyztmg?=
 =?us-ascii?Q?62lIvUAdcQxiOOSxMzlF+BfkzDmZdrNSRk8xB1TLaCrplRaErt908VKrXC4Z?=
 =?us-ascii?Q?uBcpCUCy9+bM/W/A5x94KIO04hx6H78OD/rRcZQ/Kr3XWGW1rn4R1zA0BQfp?=
 =?us-ascii?Q?VwPjMaTKmGTQQxAjW097o5suOWPYBJ7UH7WvneEQbJjnqeYlgmikj/7G3UlQ?=
 =?us-ascii?Q?aAB/pgKL2w/BO9gXvrYLUk8zYUCg35tZ8Kx+Bi6uwI8Qgm5tuck/PYCGpZ5W?=
 =?us-ascii?Q?0GAB1/RA5bC2I4NIDRE4c97gILOfm8vzm8HcmBDYK4lSU6s9HyyxbWQgrgS4?=
 =?us-ascii?Q?WC+D/mQ6BYUkH1xJ7XLDEXbFz62mOkaTULoiOBxB0iQsbKk0JPS+wpjESLxR?=
 =?us-ascii?Q?tlcTgx6p3aHkCYPPDnhzxGdvzdfx5yWjm8e1uoBdloNbRTKLXuJqCV19PmMO?=
 =?us-ascii?Q?4HrvEoGlLwjiMVfk4CtotSWd4RyuLzLF/hxrgDah8wjD1izaM5Lao5Fxi/7A?=
 =?us-ascii?Q?xHunvTC7w8hTaVsP/Hbv566RVnBhQqf0p+pjDhkMDxpQ6/+LwXC7FJKehXIJ?=
 =?us-ascii?Q?ZJWA/BgZAPUbKO8X79H09BCxBH+tbBomcS+cEnP1RXcy79bPY2IXR0lTxQDC?=
 =?us-ascii?Q?r0zEqVMxc0h2XR8CTC5h4t41Jza1ANPXJgtECCL4IsbYRizXGYZ8VEE1nKZD?=
 =?us-ascii?Q?/aFeJeiBOEnCAE2yb4JDLmw794l6OWJaXYTdZy6nVSQtlHLewS29Fk+RZ1ad?=
 =?us-ascii?Q?A05yXzpew2tD7/HIa8k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:49:00.4288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 786597ee-9285-40ac-3fc9-08de176742e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7145
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v12:
 - Remove outdated commit messages (Pekka)

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
index 589324a806a5..85d6e6703b7e 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -127,7 +127,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;
 	struct drm_device *dev = colorop->dev;
@@ -156,9 +156,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
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
 
@@ -168,10 +185,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
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
index ff0470049e0f..36b062b963c7 100644
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

