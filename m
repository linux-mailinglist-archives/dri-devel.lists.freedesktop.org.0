Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6279ADC053
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F33010E538;
	Tue, 17 Jun 2025 04:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iXHnvxrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864E210E538;
 Tue, 17 Jun 2025 04:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfX90OTzL0cYp08H+zEYOJMI5vEORCxDmLDxMuxohPAbm6YqLIJHJKZoIoBZYqMCulKx63xdjuL/0JKnXMUiPBJaqTZ0F8K0JRiQjqEvVeKnXmWLDKg86dfm9xzhE0E/7NWxc0uYH82SjoenwIj0JqYvSkJ1P7Yt/OIcM8Z3gZ2p5DrsPQQFGa/AbJXI9SxskNay3YJxAKY8ULaYlslPk833Dz4tgLJZ7vCk4bj+EqGxzN2hJr3cUw/tfhFhOEXwbe3QymHp1/nUUUW5WtKYzY89W22ryXQzpTPxRtwXbdQElMYLfBdvTBbl2qsbGTrh2yzGnTsNrrUpEKnOv3a5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/YhSkPzf7jiFC7TBY+3x+F8rdiwmm+jxGhyQ7cMt1g=;
 b=BLkP7sLLrB2NAce85c05sV9RevYPwnjEYpq5QjznhYtNUhgWxv/6ZNk8C6TiYpqc3tw6dm4JFgf1l+9t+/2euC7Mxgc2bcN8s/evivnk7M1exIPQbOx7mg4q9+p6nlwnZiywzFnSMbZwe5sP8rQGv9+0+HPKP92Pw95ozTSDqjSUphHBDXTDudIxCWz0wDUCmA4Ylg0AnlZEqAFxFK36Vzu+QUyM7LKAVk4qe5LtC39DIE+awQCXxBy0ai2X/jJrqNCWWO2IG5Em/1C0LPM0tnhyR47t36D7NmIv3mwZn0REaVElvSHtvKrb2m1gogsiTkpoJiP3+T/98VaS/NSQ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/YhSkPzf7jiFC7TBY+3x+F8rdiwmm+jxGhyQ7cMt1g=;
 b=iXHnvxrHyuXnT7VXt6GFdHjP1OnjwH+ONTvQwjD1rp6RGb+ZJkfYUfAG48EVATHmAzLkGIC63xEcIB4968832mNl/db0vjkCUwaU5KDt0em+9HOPVk86CywwnezRJXPSK4yxWUFqzv6Q0ngKtAgu6XpAlorAN9tKBbCf5eWuWok=
Received: from CH2PR05CA0031.namprd05.prod.outlook.com (2603:10b6:610::44) by
 MW4PR12MB7467.namprd12.prod.outlook.com (2603:10b6:303:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:22:16 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::f3) by CH2PR05CA0031.outlook.office365.com
 (2603:10b6:610::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 17 Jun 2025 04:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:22:15 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:22:12 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 17/46] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Mon, 16 Jun 2025 22:16:59 -0600
Message-ID: <20250617041746.2884343-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|MW4PR12MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: bbac10c4-c3dc-4e81-4007-08ddad568a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ihB0xYd0T6sNfR541np3NEVSF/6oY6Ir1htYZf9NeoHaKr9F4JezOEBuWZLT?=
 =?us-ascii?Q?Zc1WqjkZmuNzDmOV8KgODmVqtqX1aHFSApD7WapQpNj/H9yJBVnYsNi2W35b?=
 =?us-ascii?Q?jCSVwOlY9Ly5ryjy4+V6CGXKq4KJlFRUYoOzi4JU85O7+gLQGdF0PheHK/om?=
 =?us-ascii?Q?om8WOuaNK1Dv1w6OIAuFDepFeFFVTV2LWYr+H+LLsAHZ/wKvJ25RybmFSbJr?=
 =?us-ascii?Q?/jzKYnqVFG89XquCvj75SerVEZL7JBjX5oxlTDtVpyUYi4fcGknkqufIS+JF?=
 =?us-ascii?Q?2XhXC0uUgoyB7ucSO2+xvif01o9P/L//YzsMFQdTtVwbvnBqac+qmIChDok0?=
 =?us-ascii?Q?b1YPsRS80GQqScNLZn4dQJb4EbG+T1a2S2Rzrq6c0mAtyMMN9ChqCY0XHzzj?=
 =?us-ascii?Q?vRZrv4yTDU/KuEmWAYONrtK/4Q1WXfikx6bhTHs7R8EamKs4/4rexk66WCEf?=
 =?us-ascii?Q?RX+FScX0NAxzHu3Xl2+iNUBLtCJmfZoXEY3OwsQGPQksujFfE4SNlZI8Cfk7?=
 =?us-ascii?Q?1CuOO/4WHmilN0/FwvrNU99MINk6p6EY9ONoMZUMCDJgO9JyoFHRMp4QBllG?=
 =?us-ascii?Q?zenNYJdKYsx2Oq6JFALh4YG7yCLGOpv6dWY+/79pfSYDGSUBNL5q2c1iTKsY?=
 =?us-ascii?Q?FLfVjvOvC8qZcDjagNGb8lmxzKEAPYlYncXqWDK1Vs2tlGJp5clVdlHRhUkb?=
 =?us-ascii?Q?B/4VTAR3KjwWkL8vzyU5gQ+J59sHE5IqyB6TcJQEXhQS4xibUM7sZB8Gfw0T?=
 =?us-ascii?Q?OVK3Xf+NsIe9t88kGjaBo+QGLhYNPrODLXpdbm4FHiiZleUSr6eWeoWStFEe?=
 =?us-ascii?Q?41IUbFoEmhcVH0lS40sc0q4iAeSaSNuebf1zqj3ovQdZo6PupGOyDJACBdOY?=
 =?us-ascii?Q?2iapwUQ0hQRmCPlhavkUjvfQuPQ3gHNpUe70YhgkfW5DS593d655JzNlD6eQ?=
 =?us-ascii?Q?2LMMFSWD0LqeGwytgBQ6/+crjhC3O5DCZ3xMFqTFUB9HQw/UOCVTE7E3YoJ7?=
 =?us-ascii?Q?MQNbgPjqHyvDUdNWHlulajxR5g+cf4M/edVUbJoLdYAaD6i1i+5d9Bk5+Il0?=
 =?us-ascii?Q?lpjoMtHBeqSdfLftn/xFz87NsCG//xDM9tBUu4lOTIRxZKxK5L/R47btHyRm?=
 =?us-ascii?Q?DIJX7Z/FhhHgAz+f7HO+a6qiATudtpRmF6PcreYBRTW6VH9zaCTpSJCaYYYt?=
 =?us-ascii?Q?j0qDw6MOYrZ5Hn3VV53IFLCA/gz9reuCho8mmqaY7684xXsPVPV4v8XpyJpW?=
 =?us-ascii?Q?uDRtp9DKKo2ZB1SI2yvk1w1WE5a0+8g75zkg0wE9aRS2KtC075m9etv+iwMd?=
 =?us-ascii?Q?gTtLOV7zm38ugdHfR5570W5NW69aNyNr45JnmmCP6JqGqI/9lXulVxhoxWAM?=
 =?us-ascii?Q?i2zhB+AVPLst1ZV8iF7ZORGIALdRV+F0MAqygyA6T8RUvsqyzTX6xLH5HMBN?=
 =?us-ascii?Q?uQ2xEkyz0zAbATYee7NWlq3HGJYkZF+zeOsY+eNGhPDUfBJTYh3ixc+bHMu3?=
 =?us-ascii?Q?v8Ku7NrjBUM+4T0QAald/zjxQ4fTiRQHyotk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:22:15.6096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbac10c4-c3dc-4e81-4007-08ddad568a5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7467
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
index 72890ffea13a..36f0caabb67b 100644
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
index 2e192b1e5be8..5b340ffbf7d0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -45,6 +45,10 @@ struct vkms_frame_info {
 	unsigned int rotation;
 };
 
+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
+
 struct pixel_argb_u16 {
 	u16 a, r, g, b;
 };
-- 
2.43.0

