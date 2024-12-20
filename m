Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD949F8B68
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AB710EE89;
	Fri, 20 Dec 2024 04:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0VNU5se5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCE710EE8D;
 Fri, 20 Dec 2024 04:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRoGIyGJnuMPjofeII1ppiwViiOyDtEjQ7bH6kWzeMCqJY2c/8S5yZlAGuVMCFSCgh66a/AqF9JR+CbtCTUZDwvq3r6toL+25bwQGXghySejsL87ZGmUj4zO97VtZTmGD3FfGsNFGPVqyJ+x9yrOfyYnnmKohii7FqX1Ngf7D2en1OrGdm1jx2O37CWLRM6GI/ks9BW3PEL/zMXZlFX9z1jIYKijlwY4xLyMZZNuPQ6LpXeFPoFDCiccQkFFnKDsLyReMzzhauCL9cTMCh67NZSPIvlwS2K/p5xq31xYm6B9u/nL8AhvJeRVlQnSZBYl/15YBm10X7pkltfq/rFDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j73OifFfd7GCUI/ca+IZbkUCQaX8OvEau7DW8hOoUU=;
 b=VhSyq6lmUVhm1bHoY9kCVBfnQXEW9ZbBNQU6YP2dGGLmD6TnJtKHLKOINfSScXj0Y79dTN3iAXx2xUqaFibpY8lUoB92X/NOaXxv8AFDN36l7dxqo19RYhe7qVacb40osykQM5Hvybn+hNe2oQRuVPhJ9yeEyVgPuc6glGqILyDQkR55k7P8hgsk7RFg6GAqasNO8iVP1Y0IRLPtUZriBeEnzSztFnE7g5WV9YdzRghQCE9M6c0eUQ+F/QTbwsQCmvRp0XgWFcwPuPi0Ze3l6YxO7aNTUWf/ZZJ9KuNzaUeP4K6B6ghQQvp8mp5QV0VCNcLIAqRA0vku4rF6ovmxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j73OifFfd7GCUI/ca+IZbkUCQaX8OvEau7DW8hOoUU=;
 b=0VNU5se54X1O6xF3YsLMA5YPLRi3MT0EZ0dyzm9USR8coHqZvJmlzRrhqzbWgGzqDvVLq71mGlt7Mc/HBo76oRS9zdEzU1idjgYxGKxCvM6YNxugKFeSYA0Whj6eChsQvoSxJ367DXujMMZkT7nGIy4mjdw7oK/INkvKVuCJ2WE=
Received: from SN1PR12CA0062.namprd12.prod.outlook.com (2603:10b6:802:20::33)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 04:39:40 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::d9) by SN1PR12CA0062.outlook.office365.com
 (2603:10b6:802:20::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.25 via Frontend Transport; Fri,
 20 Dec 2024 04:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:39:40 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:39:38 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [V7 17/45] drm/vkms: Use s32 for internal color pipeline precision
Date: Thu, 19 Dec 2024 21:33:23 -0700
Message-ID: <20241220043410.416867-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 324d55d1-8c68-4118-8d0f-08dd20b0511b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Su2pm6Pw/osLw/MxwCf9n5pI7rybPAluNZx7w6iT11fLXzgg5v4raRtxge8d?=
 =?us-ascii?Q?8uZbQb0iiRxRdR9GlDsbC13QDpI9uCQtrcVlJ9pxZAJsaM2/i+vC6Xj3JDvF?=
 =?us-ascii?Q?tU20Bd3uO92lh4ecsYV+18LE+2sXaDyDKbu4Kv/DcDP4Gg5ToaJNDNwOc/wq?=
 =?us-ascii?Q?2y8Y30i1zZ8TJBlnCnYI44o1JcwySQi2rM9yp5Fws5qKTdSUEUTfmhUz1k/W?=
 =?us-ascii?Q?b+l99ps5R5Ixr5kqshie/ddERBABn7+NbswrbrfTemYcG8scWFYMZR0QcCO0?=
 =?us-ascii?Q?HKbfHZwM/3oA/IhMPVLs7ROeRaxP3BZi3AXCPxWgqfYvZisbXAECv93PdjIW?=
 =?us-ascii?Q?k+hgjcTfQ2edEyYPFpknWZuYz993Q3dpdyWRWpC6dPdkPP8qpz272L4sOFRh?=
 =?us-ascii?Q?4QuBTMlFiLVTESRBSRF09pnI0QzqeVs0jKYNJBatpYAEf/gUM9EJJgJuIquu?=
 =?us-ascii?Q?rw8SJdr6wyOX+/pDU+K4RGKN4ZD8+AdWXrP27sEgaeFK5fvcz4hyyqK6RMwv?=
 =?us-ascii?Q?Yk9+BHrM1Ae4I1Z/BI06HWlpI+PHalMp+g/Vgt4+AIKHKg+L8DxAWMxiU0Gq?=
 =?us-ascii?Q?9MvcrgKxHbXJl8JxmLb3YSp3O01/nx9ezW79glQlOWijjynBlhv9EYXhFtun?=
 =?us-ascii?Q?lirwAfNQLKMi5wLvM1KyGSu5b5Rrz7t/S49HmQOpjMFtBbGamxdPkxZj3Op2?=
 =?us-ascii?Q?SKgWCpaznrBX7LDtg7Ky8VK5u9dtl4yAov5vYHvuJ5NRRyBcHOoPOWJ2nDQR?=
 =?us-ascii?Q?ehd519xog4AGvc3llAXR3tkoiQzuFmcDkdyIozDKcXqNhAqc3SwJCQVUbPhH?=
 =?us-ascii?Q?cybPKuxq/3cciy6Z2NBQ14fw36NGKNB80HneJKQ+/zIJMeEdYfNslRlFKlZL?=
 =?us-ascii?Q?/FZ/fcjPA6xt55WUItwWMiovoJO3E8logjPjabwP38kQl0VTfLOLtteXHAkq?=
 =?us-ascii?Q?yr6a0MTTyaKQ/D9aXEaceUt3nDrq0QLVlJMBPZFJP3iD7at5RAaXGo+l1QtC?=
 =?us-ascii?Q?x6Rz09A/N7ZTC0bs6ddNy4jSOp71MFYtQxMsfMvPquXeaB5YMBCXR7o7ik35?=
 =?us-ascii?Q?j3630wmPiXpdnwmNkLVizqWMlfGq8c3nCL8unQmTCacc7OiG9SWCePn09hxr?=
 =?us-ascii?Q?ve1+5MOeS4l1M+u8UWJiA5GpcuQDeilT4dB6pH0enWo+QKwwKr/TJECJ97vt?=
 =?us-ascii?Q?T5km3WRmncIMZTJmDLRb+0RAa1Rq1aFe3VIcnVljsl2/bevY4XORPfLx8yQk?=
 =?us-ascii?Q?SqiHAli6xRiQGR0AqqPXXhNxHB1sb4hTq9KGjR+rTTgFINtC0Ue4JoxD0H2/?=
 =?us-ascii?Q?h+tCbbabYAr1K1gZy719e9sWkv5QrMg+fTKQVqlwM+UY5NA2lbSt6hL9Qx5+?=
 =?us-ascii?Q?RctdMkUP2ZQPfY2f4ENeVr75f3OcHAyffus77F/ejdO49dkB23Xm+GB/jamt?=
 =?us-ascii?Q?oE1rhLXx4mzG34fSp43v/YcOcJS014LNpU5pOlYmNdwK5GsZvlynfiFfRAst?=
 =?us-ascii?Q?Ma3PsymCOEWa5wU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:39:40.2790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 324d55d1-8c68-4118-8d0f-08dd20b0511b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811
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
index ee3cfe153d8f..b009e607a310 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -159,7 +159,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;
 
@@ -186,9 +186,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
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
 
@@ -198,10 +215,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
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
index c3c8f5ac81b9..5e24c02d5294 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -36,6 +36,10 @@ struct vkms_frame_info {
 	unsigned int cpp;
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

