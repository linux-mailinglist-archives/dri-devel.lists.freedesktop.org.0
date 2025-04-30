Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3C4AA4047
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A119C10E62E;
	Wed, 30 Apr 2025 01:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i3fDI/97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C5710E62D;
 Wed, 30 Apr 2025 01:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOU1siPB1KaHUdinq00rgWEpx1407OHZYJPzHnoC3084BEd0M/PeZkXPSgKwRMszPkYlW3DcwkhSvA45ZXEpIodh5iBi5yf6htzFRZGF8CvfyOQxt/buGPoSXxxB6eNxguKxjMrV/NgvbHDHX/wz7N6E9B5FX0Qw69xx1Q88WTNiWu9mc+QYwXhcNRPFDPQQQPhnwW67dYLMiVS7QTY53WmmnoMpsjOp7LjpuHRSkqeE+aDxR9CbTuaKxx5G9MRFr7SHyZ3895SzfxtAR5u8PhIX/XjNhcbj18tLGvHgDGt9aLsv6H4fphnK/QkBVZfEBuJVoUoGRXPMwdXymJaXOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/YhSkPzf7jiFC7TBY+3x+F8rdiwmm+jxGhyQ7cMt1g=;
 b=jr+T7v6pSVh87TGRNpHBj0R/J9M6k7XXw7usYfUIpIR+zQiV0NtbfCyRi9agA3k8P9jjtspt6EYqgytEjnDBrYrS+1iJoJZYoo2uLhNZoeTam0HIyqwL/lh9rFgpcMZKSSSV9Ct0zOZ8ilCTXHYLATVakGI4vA5vsSl7AEnKn6XuqZNvTn1ZYjrHVOZYMZu39UzImR6ggxrw//C7PKn/CP1Mc8X3gII98pk1Im6zV0MtjzHBJ7x04115YgQO+9E0+9gF2QJgPKpXasO89HyT7/aEmSR4jqg5aSSvlqY53em8C3lhm3NTNH3/f9uMySbjGJW9MAUm95xMeRqGKES30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/YhSkPzf7jiFC7TBY+3x+F8rdiwmm+jxGhyQ7cMt1g=;
 b=i3fDI/97hx3ob2UVsIDxEz/6DnlwufEz+qEFe7lOv7LrcRRimcAbNSOk2Ds2BBLZMF2SbsmhnGcwlDmYPZdN4zfDzAQxFvt4FrnUMUca/xu5DrMO+5t/NE3FfZmj2P3MHhIcfTaKTexKgcnZkM4/TL6fM0rocDfpcz7ZZ4pzELM=
Received: from SJ0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:a03:39c::17)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 01:16:06 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::49) by SJ0PR03CA0342.outlook.office365.com
 (2603:10b6:a03:39c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:16:06 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:16:02 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 17/43] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Tue, 29 Apr 2025 19:10:47 -0600
Message-ID: <20250430011115.223996-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ef4c8e-c488-4c8f-c22c-08dd87849549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2GoezJ2ZOBHaawcO1hvWFCLeVxxtFIPDe48SIJ/Tybow1lL3tkzpGIdHRp0C?=
 =?us-ascii?Q?8JPgGogzn0uUbtfrz7zRAr7fcbQFsYXxaHB5gsKw/Al12HgkHNnWelZyZrcd?=
 =?us-ascii?Q?fV2V5tKF2OWQJP21DMRgnPv54/fhwFSeNaLcud9Iu33O3XA4leehs823LYyM?=
 =?us-ascii?Q?Q5PZr2Sx5yRx+xw+g7qnEpfe/BPFs2mkB9gv+ZCFUByWhLRj81zKC7FvYmhv?=
 =?us-ascii?Q?3aHxb4RX+o3WlbLQ3oHVXb/D0d7yKeZ2QBOX8F+n6gdCDeVJE+ONKtYhJq6b?=
 =?us-ascii?Q?Hp/7Ea0MftSGR//GUVoiYcZSuW9UYIrDOzwqnlaiuqaK9/4N5tttG1mSnDre?=
 =?us-ascii?Q?GeXZe2/R34ugQWokPYnzs18+N1d54bJ3vVu4hf3I+DX1+BTZJi8gfR/xGUoW?=
 =?us-ascii?Q?xOcQroxsYmeo/8lyjC3TinwWJJqquXI8zJhjUwpwiGvAOFcaME08HgyRAgwQ?=
 =?us-ascii?Q?CT5NRRReiYb0c0Nm0ovVsEZX3JREdwEeimzncBrm/VOOafnK8T78EPD/yyrJ?=
 =?us-ascii?Q?bRRbsOQFtofhhlMCbNDalAd28/RRlfRL2qfrO4+M9cjSvIpZ8xGusIWwkPs3?=
 =?us-ascii?Q?cILk/Y6zee/Cqe+U/KZTD4Idhfz5sdJNnpz6W2BZuC2QsXUQIG088+PHhGRD?=
 =?us-ascii?Q?3lOnUh7z9quo7aaQ8E+9thGIAUUyQnDPaOnj8TQD+SyFm0X0Xa9yxD5CuhGv?=
 =?us-ascii?Q?zNf7BEP+MMs4t/Y78uXGUAVjeuOsOKlrjdwgx9g8y6oDPo099xeUo4gLkJ3f?=
 =?us-ascii?Q?k9p/7IRFq3f2b1PnrqTsnSJLgoR7/7/7LhANDEWPULduDi98/5BCdYMt1yZq?=
 =?us-ascii?Q?aXBk6b+uH3SNgVEBOJ/sEtawfMliY1zr9JL6Kt74Zn/1jBLzup3864TRxa0P?=
 =?us-ascii?Q?6zq+65SauFA4r7DBEjTNhori4Io6IEPdiQ/kCMVM6UJ3vL/KbT8BMffqze7j?=
 =?us-ascii?Q?aRPEp1zE5hKn+Iby3FH/m9/iOTKM3hLzQ1ZWYzLhgTKxtNx6fkxbqzeKnpSD?=
 =?us-ascii?Q?xk1h8C/0RdXjo0Y4VerQlBrLSiO5TUBocwxso4YsO5XXJ2NUUcieLGWuzEGt?=
 =?us-ascii?Q?Cx62xuMIN9KRcxqseHbiHoBIoZjc3GBzhhUxj67GCnfaQruXPvKAtQl/o7nF?=
 =?us-ascii?Q?0wNfrcjqAuSu2x4jMaZs6sVDYCJZtnx4/Xcg7QHggvA3ZUw//YN5RPz5pKpA?=
 =?us-ascii?Q?S2Uj75CakjqDXPpoaMPYk9OxHtu0AYrBw5oz3gpgOOA15l8P8NYXBjHzphdu?=
 =?us-ascii?Q?LkUpG+r/PvA9m6zSD2Edwsd6TMFPAQ7hAgjKeO4HEfHTrUPXmEkehJugl9/Z?=
 =?us-ascii?Q?FMUJUFZ2qTH0gaSgy+bWfdd4MXIn7feb9SypEh/TGKeknUeXz3zlLKco+Kf0?=
 =?us-ascii?Q?HFWrq4kqTYMJTTcjpCXVSgZP96KEenYcSRTiBQwoiTFdBWeETFsKJHpCnYup?=
 =?us-ascii?Q?vr9T6WKjn7in8867J7Gklb1lVYEHlplT6bN2TniQOgz4GeAG1wYb6Mp3pbIt?=
 =?us-ascii?Q?Em7LEkSIuRyiPoePUO/vgSu5UtkVdOfd9sn2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:16:06.5775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ef4c8e-c488-4c8f-c22c-08dd87849549
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964
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

