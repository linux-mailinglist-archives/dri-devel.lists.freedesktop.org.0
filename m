Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB665868284
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB9210F1F7;
	Mon, 26 Feb 2024 21:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q+87XTHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2041E10EF34;
 Mon, 26 Feb 2024 21:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGEaCvTJVt5QSpiwLPpDwrDfUB/AgnIibrNqFOxyWRL7unn6v4y2sbz3/CpQl/9eoo+HOhBGYBwNVhay8MbCStaeCpZ4nDG/TgP3ssOEc011VrU1QB+1D/7yNIy8LENnwOg3ArwZJK6y7k5/f1hmtQZ39UAnBPfvwuJYTM3MxXRMNpIKup4j/IawBuJVuJxwzzFK41XepQflaoHLBLAvX+sbmfFu4oTmgBvBVIFaosPY6aVjIrY+vO/va9566YGDhBBi8AdCZSm4WqGrAFiL4JLhjKoPxw+Jz1isd4laPBShkoLOo83LIoQY4U+p9uadQ1YwzXaMITjTyf8pAiMxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5OhYsLfo3hgWuzR5nYSSscUd25CDQsKujOqFCl/Z0A=;
 b=DjBjKmCJycNa+ew1h6qKd+5YUEzNKnpFVk44G1bX6d7ktYKYgViaC9Fb5IQytg2MyYOxB3GFkSRMoNBhZax0gI7F/w6O2zxnj265rPrQCsEhS4FpeKiO5PZJnzAxRBqa0N87E71OHy1uOUaV4eNqUnlM3qWW6PdkRMTPplzrXzn7cJYsHG64J5dms/mr4SlamdXbIk1YlatZTEzpsBxIrqJFfBUH977da4TAx+NiimsPxn8nB0Sc2j/89sut2h4tA4wIxmbACvW3aSViw5MehqGtvW5YnFjj5iZ+ElwEfShHJPuwLkU3y+4ineszcnOOeWiy2ggRJttx7VRGDipx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5OhYsLfo3hgWuzR5nYSSscUd25CDQsKujOqFCl/Z0A=;
 b=Q+87XTHWJX3/vcbpDrI38jJdto/aiqSn7wqEz+uZPQ2PmWoVkhyOWrupY5gJ5xuE6oeJYHhY/H6OOIXq/C/EStNZhbMaJ6s2YnuHWVDax9Tt2GGHU4D9Mf8izkSYQnFB9zOPtM88a0gBVhPCwH3wNBdCfLq79+R5lgLxmU5Wryw=
Received: from BL0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:2d::14)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:20 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2d:cafe::be) by BL0PR03CA0001.outlook.office365.com
 (2603:10b6:208:2d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:19 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:19 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 22/42] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Mon, 26 Feb 2024 16:10:36 -0500
Message-ID: <20240226211100.100108-23-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: f8045805-ca69-481a-2fbb-08dc370f7aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nYJLmjZLYGu2hGxOcLvW16Ahww1EN84RuAqqMjg92w/4Z49MLOXoypI75groXFCgjFx0iXCSJpYNygNfb+XLQ8Suu3258d0RESvniH2HuiSDJbyqxYZK931QLUpCXd0YE5MachO9Vmk7eEBrb3HjS3uYh967y9/gTTNSXCD0Gnrt84GDGNrr3iqPmCW+6UNTnQVcwbUXb/KF3AQQg6f5NQ4RyD/ELD2jQw9Y4KnfESmU/6Ygrt6B+kz/C+4RIacaGeT+84z9nTqjTuXqe0ZPtaR3yBQzQq+mab/Kvgxh+lakswvIOkyNz16BuEgue50i/viwP7z/LtXsCe62yMs3vK+6OgNazBO1wSHln6pKTg7BFxpD8dREG4dkx4eXwG6uyFXNUKkzXS9tTg7EWaKo9xMND9SY2WbWlBUvtmEhsLt873jsSNqVPSwoZ81a5548Ebv7X7qb1eOQpKYMiKyO1w9J6SWmunPaFl01oz7LwLQ2V8rRgiwe9v+UR9O6k/ceZ05HHLzh35KRu5kVA1Dy2S5/gW8tKeMw2rFfGNXBTw8SOCk4/3G64QjGTPgNek3NTVAxD61Cp//FVrOUhYN+0IKgeFIcxPcbpWRR9dAXsFrXPoy6O2lsZJzQedeRUzkF1Ox+WFciNk1ATyHFF9PGphyigVNO2Tv7TrwL8u20Io+FVq0miQNQ7IypugbIbIvZB5yPpIgTr57FwiB/h9NfDb2y6dZ7ciPDbmmnL7zOPYx9QLpEOOAZDrumHr/yUdhR
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:20.1047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8045805-ca69-481a-2fbb-08dc370f7aa6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689
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

v4:
 - Clarify that we're packing 16-bit UNORM into s32, not
   converting values to a different representation (Pekka)

v3:
 - Use new colorop->next pointer

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 57 +++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
 2 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 25b786b49db0..d2101fa55aa3 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	/* TODO is this right? */
 	struct drm_colorop_state *colorop_state = colorop->state;
@@ -191,25 +191,56 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
 
 static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
 {
-	struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
+	struct drm_colorop *colorop;
+	struct pixel_argb_s32 pixel;
 
-	while (colorop) {
-		struct drm_colorop_state *colorop_state;
+	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
 
-		if (!colorop)
-			return;
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
 
-		/* TODO this is probably wrong */
-		colorop_state = colorop->state;
+		colorop = plane_state->base.base.color_pipeline;
+		while (colorop) {
+			struct drm_colorop_state *colorop_state;
 
-		if (!colorop_state)
-			return;
+			if (!colorop)
+				return;
+
+			/* TODO this is probably wrong */
+			colorop_state = colorop->state;
+
+			if (!colorop_state)
+				return;
 
-		for (size_t x = 0; x < output_buffer->n_pixels; x++)
 			if (!colorop_state->bypass)
-				apply_colorop(&output_buffer->pixels[x], colorop);
+				apply_colorop(&pixel, colorop);
 
-		colorop = colorop->next;
+			colorop = colorop->next;
+		}
+
+		/* clamp pixel */
+		pixel.a = max(min(pixel.a, 0xffff), 0x0);
+		pixel.r = max(min(pixel.r, 0xffff), 0x0);
+		pixel.g = max(min(pixel.g, 0xffff), 0x0);
+		pixel.b = max(min(pixel.b, 0xffff), 0x0);
+
+		/* put back to output_buffer */
+		output_buffer->pixels[x].a = pixel.a;
+		output_buffer->pixels[x].r = pixel.r;
+		output_buffer->pixels[x].g = pixel.g;
+		output_buffer->pixels[x].b = pixel.b;
 	}
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 2bcc24c196a2..fadb7685a360 100644
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
2.44.0

