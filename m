Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AFE957604
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5C10E3AC;
	Mon, 19 Aug 2024 20:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XOvqGMNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A71310E3B3;
 Mon, 19 Aug 2024 20:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/tnWIhFi+nyImRYKEByH/fknv4Jj/95OqCB6pMx/Io1a0akTBDjIRjc/XZvYd8nizLcdxp+IjrPPv2r6ki+SvB4naN32iyvDIEr1iGuCNugHR8yJzjT3GImYNsFEfXBy3wJiJuQDwYzxmivtj2hQL6QLVkN+6GJZ5T/AruOmcESaVww2JgN/6QVNdAbXmlnEOE5+PdoXRlkN9uyEmKM5FJA5jqMwp4YnEyRhqDX1VYYhbGJZWa32V8HhuJ73BqYBjTOc8L/HaW8g7MiVR6jv/AsCABaUfzTT/EpakpRsWhpH7gR7PtSakzjdPh2R7QvteABHNYaDEb2Wy/wmlfozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nj78KKswlvdA2UaSwS0yS3Yiseub2gPxMQ8Sm2aOafQ=;
 b=U996t4wBecxjdHsnVXb5kL87RnJ1tDXqoA8ymgAKGRb6M1bsu4KTCVprPK5tQxDgOcnAjN0KRCz3RjEY3nN/1xilFqunuboD2+1jKuTJtKt5htfOPd5YDvib7OEBu9nZmtzvASeY9aGECEcTbeJTmmAH3tXnyL4FazA2AdXNk2vk6Uv004H3cHXjDaHu25SFXKFkHsvI4icUdcEb7/yl0MmwF8YGZSDmwJiuZGEOnqlIG0a/mYZYsmKcCkOgiFcvkx025xJzeXCAaU7VEV55nzZYjQhVj90EuvwhiYU7aq1SiitO4s3EozeBGPWnYXINBJbl8ACusogtRGBLrNbwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj78KKswlvdA2UaSwS0yS3Yiseub2gPxMQ8Sm2aOafQ=;
 b=XOvqGMNpgG6kUTAgly3bXmfF5sjfb5W3bJC3w8GlMYy8Sjz+b8/sE6/b4gxNZ00mgCb4jMELrtZTlNEdtjTn0coiF+J/4517BNu9P0cRAXunQXccbssH5Yz8g8mdDgOwuolPh6z9fIn1ItCIRpDaxRp9P6yPAziKSxyzupx+6pA=
Received: from MN2PR17CA0014.namprd17.prod.outlook.com (2603:10b6:208:15e::27)
 by DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:32 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::48) by MN2PR17CA0014.outlook.office365.com
 (2603:10b6:208:15e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:29 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:29 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 18/44] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Mon, 19 Aug 2024 16:56:45 -0400
Message-ID: <20240819205714.316380-19-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DM4PR12MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 378d7ba3-eb56-4d6f-3c0a-08dcc0918bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4ROUGALZe/FGLUF69b9C8uRslo70uR9C8b7be+MSClPI51+ppU+XrhxBTDHg?=
 =?us-ascii?Q?hnfvMSrcRjRBxvcXjKlTAFWKPyl5AiWDEuv+3TXLlFatqnvoFRmPW9zl5oTp?=
 =?us-ascii?Q?45NB+PU9ngtmRJJCrf7wY7mYGuF8+8hasRbDW7EJAVHwQNWfE2huocsANEm+?=
 =?us-ascii?Q?Y628sJt19XPLEXJTTzavaFM3tk9m6FJfcmMT7GeEkL1eM29xwldy01th5bwi?=
 =?us-ascii?Q?Z9KEkCjYoKj3pXSHUDzXAgBwVgV6srOaFwD0bmnPTyB6oDTsK2NDLVeHm7fu?=
 =?us-ascii?Q?1wanbsI0hBPkkpsiWKvhgoCVQt90HbyUj7x2gQUgkXK51MEJ2bmvRQDgxQWy?=
 =?us-ascii?Q?lrJeuqt9CTZ59w04ZeSz0AYAkZ0uUzOG6pugffWvSUEHA1FyHX4FDUE7iLGZ?=
 =?us-ascii?Q?AkzlODgRTpMQqiunz/kCjwHyeqao+G5LaCJSrYacktYrHj8i5uvQzaM6qTBp?=
 =?us-ascii?Q?ixxkRwwA/dkPCGo8b82Uu9UOhMOy5nuiv3aIos4y9IE1OcmvD45aE68TFYmV?=
 =?us-ascii?Q?mLzOiwsBXQwCIM/NT/XCD0kDhBLcJ9UHGG3YHblvOPhhe9OkauaFl5m1lusI?=
 =?us-ascii?Q?uhekU53ilKguNXRdRhefOKoQ1kWgTEMQyPyUZF5nMceVfGOhgVRSI/c2h49w?=
 =?us-ascii?Q?m+2f8lD8tiuBU3RJKZ9cox3vPX+Slx7EVFbvgAQKEyUoTy9/Gck8KLq3y7Qi?=
 =?us-ascii?Q?XvmYW3PQxdXi8UVFatzoRd0USKbXiyJ5CbcTB45uNKD6NUsLYrCfqiuzkNsH?=
 =?us-ascii?Q?w189n5dhvL3kyXHUu4Gp11Dax2d6eSvMQrgu4YLZt3iyFkery3TzN++0Veca?=
 =?us-ascii?Q?YX2hVNU1NWRosIm/lg3vEot79m/KATFMlYNMOqceAcj/Y+UX/eRIqjNBV2EB?=
 =?us-ascii?Q?4NpyjfNwiK5DXaNFPrSKT1yKZhikGkGzzD4xhc4juCxgX8sHpaw2qE7dZmP+?=
 =?us-ascii?Q?6nXFx2VghH1857aihsfHSXCRK6fVD4IMIcFsEKHZH36HJ/AWdsylmCeIZH/4?=
 =?us-ascii?Q?HMGl7bZk55fbLkpOxCYlbnXZM6DkEezu4B77+ElxVdORPB2ghB+fJ9IrhISw?=
 =?us-ascii?Q?OwPPW9XHk5FlO+KmNa/MsIEly2T4eLryzuKHFIyFYEZBEY7eGHKjv6E4NNIB?=
 =?us-ascii?Q?E5Q+inzRHx+i+tpwhU6UwFXibLuLXZyWB/ikRTBMU1N0SOREZbbu4IkyoQBO?=
 =?us-ascii?Q?Er+hjnLS46nhBAZCNoVY8Ih0MUCcG9vzcEYHx8dC6R+z2rVopTWyB7jCnaND?=
 =?us-ascii?Q?G8mc+wh8SGjWyH5RNwMZVEBLqe/GEfHh0ZgIyam5pajf5oYAjEPmQbp4rO5W?=
 =?us-ascii?Q?sSoE0xgpUR55XOha7uYEWa/1axWgAx1S8TgJmry8752HRq3Dr1OTAF9Xwr5l?=
 =?us-ascii?Q?nMIYcIpCbq5XhhYpG9bhTw7Ea8lhJ0ITEgE3KZeTzPSsWb9g837ECeTUX7t8?=
 =?us-ascii?Q?poyoJBd9hC/bqAv+X6s78ftDzzArQ8ti?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:32.6670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 378d7ba3-eb56-4d6f-3c0a-08dcc0918bc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559
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
 drivers/gpu/drm/vkms/vkms_composer.c | 55 ++++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
 2 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index bc116d16e378..6e939d3a6d5c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;
 
@@ -190,24 +190,55 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
 
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
 
-		colorop_state = colorop->state;
+		colorop = plane_state->base.base.color_pipeline;
+		while (colorop) {
+			struct drm_colorop_state *colorop_state;
 
-		if (!colorop_state)
-			return;
+			if (!colorop)
+				return;
+
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
index 278cf3533f58..b78bc2611746 100644
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
2.46.0

