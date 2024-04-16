Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9508A75A9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC67112E58;
	Tue, 16 Apr 2024 20:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kg+VWZPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F8D112E54
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggTBkbpbToMQtPqWX3sc+aUqaSCYiUHsshviGiiocDQM/TrIE6jAI4SonGEnBIH1JuG3jwZ9e3Vs5OuzZPDwns0GHjJQGrHUQsw13QkF0H4tOCQ1Zt3umal6UwLqDDQmIRWM+E90W0ob6rbUhClyUaeeCjs2S+VxJEIYpmRtQBgYmoUGXT0UDfFN6ApuFy0kzZ3QgRtBs7AmYvST2VvA+HanLwd9WD94Mq+QwaAEP6rEvxyGjJwX8H2yQcEB+D+s1/ytdXdMl4yYLNiBXgrU2gIs3EDm85Lr+nIzCe0PMP/nHqyFpM9m1zIqtO3gdboeBKYDnUL2a9fTPqYkKfndbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dV0KsIkTVgZXNMcA+MIJEQa00SxiDnxa3D/DViJxUA=;
 b=f3p/v6OUtWDJAYek3gWwnZUKKW/HxwckTA3RYlAujUAMvM/bLxZDUUCNowXl6aMzk6395BGVNiU80p6a/mbkbrbH5Vo6G+qh9kB3zJ0ObfQDECXqCEKf4Mx0fIZoSYrBoyS28sl3sf5WkRuSZ9Q2KinABj2MR+6XPtoU/XGY0sFIobV/DEdiaNTYwlk8hZebRrficm9gPg2VJl/VWDxSr3CIvilVAiMmRDiWbnF2fOxuebbNCYg4RBgGj5m5W2LxpZxnN7PWQjGGqkn9W9er03AuE/VjAv9jTmtm3yQkbCngoXCXnO9AHMmhKQYMPzuSiKxWTNcJPt5HgLR9kdR0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dV0KsIkTVgZXNMcA+MIJEQa00SxiDnxa3D/DViJxUA=;
 b=Kg+VWZPj3zkLDy1sil59MFOM7EvWwNmQZ6TcrskxiB51Awe0EGR7j9YYaLbgwVznUEJHzb8mjAA26besfQFdGIdjNlV7XNLY8Ptx78TY+rXnDdSEZq8MIvqTusqmsjpok4Frz1jmVo/5BqekO0eumeBDBERBvV5PNY4RMTF4+Wk=
Received: from BL1PR13CA0215.namprd13.prod.outlook.com (2603:10b6:208:2bf::10)
 by SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:32:01 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::db) by BL1PR13CA0215.outlook.office365.com
 (2603:10b6:208:2bf::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 20:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 20:32:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 15:32:00 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 16 Apr 2024 15:31:59 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 16 Apr 2024 13:31:41 -0700
Subject: [PATCH v4 6/7] drm: xlnx: zynqmp_dpsub: Set input live format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240416-dp-live-fmt-v4-6-c7f379b7168e@amd.com>
References: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
In-Reply-To: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: 81011f14-6c67-45b9-84cc-08dc5e54451a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5jSZzRfJfpZEmbg0y9MJDbA1crPOd6AU4ZUacJ7vpA9njgLKqkaWWjNnaXJQQWar9kT3OEFbKIdpXHv/EL1+y4ktpaoZcH+Bbx3V3ApD0eziW7M7lj98A8zWkIe5871aA3uV8ZpOKOlQsmNA4X4yQx4O35hFcCRiH5mZ50/74te2xpnACnwRpLoW1jTgsgFaejTZ9pHLzjLRWNA40iUkv7u8oXReo1nLcQ2P1wBqBbdmynf1Ac/BA+bH2YnwRTPOlctBjFX5zBV1G2ZQtVyKOLIX/bmI1TWc7WASMT6Va4AciFfxmfqER0dNtqCgLZxH2vLPLggxW8xYPpaU35Ts5lXcMENcWtKAGF+dyioxJJbPuCJOITw5Lx8pME3YBZN14ONPpdZr14/iJbnm9DUGSdD6TH3d2KwjbJVzUSFDENP5mdHMhQoIUFGSpJAF3lk/S4kMJxeEOD28xtLdFqdYiYqsxDDf9bpbS+TEq3wgEpq3ZoABOeDtwFXqtY5J66RbbjEhuvd3alZfAAtUNhWblcF4sY3C1o9quEZOiUR5CweW2h9frDDnd/CohRSZ0AwlEAs8HRhNzsJQJ0/D1rMD10krqtW0sZlnyBzQprF14jC7oacWRl7fLPfdh/TSVtP3BsYpoirB7E5qQ/lla+8HaQgFtERXgXTKIkS8Qw55EsrKQYuO8MrWzW9i3Z8HPV8s0TEfXZwmOpOvVrxCouPKDN8VBE58tPmPiWZo7GLXx5eKOeVqx2bdnDbMYScvzU/yn/xN91Ss8Upv3J0TL9jQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:32:00.8928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81011f14-6c67-45b9-84cc-08dc5e54451a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644
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

Program live video input format according to selected media bus format.

In the bridge mode of operation, DPSUB is connected to FPGA CRTC which
almost certainly supports a single media bus format as its output. Expect
this to be delivered via the new bridge atomic state. Program DPSUB
registers accordingly.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 92 ++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/xlnx/zynqmp_disp.h |  2 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c   | 13 ++++--
 3 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 8cdd74a9b772..13157da0089e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -436,19 +436,29 @@ static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp *disp,
 					 const struct zynqmp_disp_format *fmt)
 {
 	unsigned int i;
-	u32 val;
+	u32 val, reg;
 
-	val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
-	val &= zynqmp_disp_layer_is_video(layer)
-	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
-	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
-	val |= fmt->buf_fmt;
-	zynqmp_disp_avbuf_write(disp, ZYNQMP_DISP_AV_BUF_FMT, val);
+	layer->disp_fmt = fmt;
+	if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE) {
+		reg = ZYNQMP_DISP_AV_BUF_FMT;
+		val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
+		val &= zynqmp_disp_layer_is_video(layer)
+		    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
+		    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
+		val |= fmt->buf_fmt;
+		zynqmp_disp_avbuf_write(disp, reg, val);
+	} else {
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
+		    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
+		val = fmt->buf_fmt;
+		zynqmp_disp_avbuf_write(disp, reg, val);
+	}
 
 	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
-		unsigned int reg = zynqmp_disp_layer_is_video(layer)
-				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
-				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
+		    : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
 
 		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
 	}
@@ -926,6 +936,31 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
 	return NULL;
 }
 
+/**
+ * zynqmp_disp_layer_find_live_format - Find format information for given
+ * media bus format
+ * @layer: The layer
+ * @drm_fmt: Media bus format to search
+ *
+ * Search display subsystem format information corresponding to the given media
+ * bus format @media_bus_format for the @layer, and return a pointer to the
+ * format descriptor.
+ *
+ * Return: A pointer to the format descriptor if found, NULL otherwise
+ */
+static const struct zynqmp_disp_format *
+zynqmp_disp_layer_find_live_format(struct zynqmp_disp_layer *layer,
+				   u32 media_bus_format)
+{
+	unsigned int i;
+
+	for (i = 0; i < layer->info->num_formats; i++)
+		if (layer->info->formats[i].bus_fmt == media_bus_format)
+			return &layer->info->formats[i];
+
+	return NULL;
+}
+
 /**
  * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
  * @layer: The layer
@@ -1040,6 +1075,9 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
  * @layer: The layer
  * @info: The format info
  *
+ * NOTE: Use zynqmp_disp_layer_set_live_format() to set media bus format for
+ * live video layers.
+ *
  * Set the format for @layer to @info. The layer must be disabled.
  */
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
@@ -1047,14 +1085,16 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 {
 	unsigned int i;
 
+	if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_NONLIVE))
+		return;
+
 	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
+	if (WARN_ON(!layer->disp_fmt))
+		return;
 	layer->drm_fmt = info;
 
 	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
 
-	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
-		return;
-
 	/*
 	 * Set pconfig for each DMA channel to indicate they're part of a
 	 * video group.
@@ -1074,6 +1114,32 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	}
 }
 
+/**
+ * zynqmp_disp_layer_set_live_format - Set the live video layer format
+ * @layer: The layer
+ * @info: The format info
+ *
+ * NOTE: This function should not be used to set format for non-live video
+ * layer. Use zynqmp_disp_layer_set_format() instead.
+ *
+ * Set the display format for the live @layer. The layer must be disabled.
+ */
+void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
+				       u32 media_bus_format)
+{
+	if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_LIVE))
+		return;
+
+	layer->disp_fmt = zynqmp_disp_layer_find_live_format(layer,
+							     media_bus_format);
+	if (WARN_ON(!layer->disp_fmt))
+		return;
+
+	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
+
+	layer->drm_fmt = drm_format_info(layer->disp_fmt->drm_fmt);
+}
+
 /**
  * zynqmp_disp_layer_update - Update the layer framebuffer
  * @layer: The layer
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index efd1c52c2916..fa545533c9d1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -58,6 +58,8 @@ void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 				  const struct drm_format_info *info);
+void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
+				       u32 media_bus_format);
 int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 			     struct drm_plane_state *state);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index faaeea526970..a7fa5e2abb9b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1299,15 +1299,20 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 				  struct drm_bridge_state *old_bridge_state)
 {
 	struct zynqmp_disp_layer *layer;
-	const struct drm_format_info *info;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_fmt;
 
 	layer = zynqmp_dp_disp_connected_live_layer(dp);
 	if (!layer)
 		return;
 
-	/* TODO: Make the format configurable. */
-	info = drm_format_info(DRM_FORMAT_YUV422);
-	zynqmp_disp_layer_set_format(layer, info);
+	bridge_state = drm_atomic_get_new_bridge_state(old_bridge_state->base.state,
+						       old_bridge_state->bridge);
+	if (WARN_ON(!bridge_state))
+		return;
+
+	bus_fmt = bridge_state->input_bus_cfg.format;
+	zynqmp_disp_layer_set_live_format(layer, bus_fmt);
 	zynqmp_disp_layer_enable(layer);
 
 	if (layer == dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_GFX])

-- 
2.25.1

