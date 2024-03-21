Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F18861DE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0715112108;
	Thu, 21 Mar 2024 20:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LzkbfCVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038DE112105
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN5dPjdb1Fl64Ikk3mbP7j1bFyXZcCUgdMGhnTo3Rodz/AqXyrURE7+/j5e61YDNHu1m5TVxeANn9mcGpmRAVCxpbTwerdwgPSu0moLmx6vQpWZX03TEE69G33Qj6cp6E0U9m6hfXeImDyfoWZ0fN29nCfjOmI96HHCNgix0u1vvWN/L5ad7JoaMquqftDgvlWuabDd3XbG+IOY269siSQpJukfuBXp4erlfhTLstPD8eVQibg6swE+B5zq1vmqvZg21npxyaTiGSuRUww25tgZRUb6pBx/M/rd2ZmgabtzC4ZBCpBS5cix4Mq6IFnFQftX5cmdt4q0B0qkJTrhBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMLkSDZL4nR6b27lobc4CgWcFwW+v3szovkHGL/k90w=;
 b=YSv/IvQQKGOHL1vqo1DP6kG7+wVMbzU2yj8YUcKhwvDwZRWSVbXFb6EvKzHl2pySJKU0g3pN8iJlumLPz4QuiLyB4cfoM7RootnbaJE0FoUWUhgT+TSlxSYluDsKVkcg5mkmBoBFX6B8Mdadlqd5qeoIjoc9SCDzbFTQwTbGfQBRbrMVuwojod5c8Ol5EU5aOet0bV9aldw+G0fGX7Uf28zahSve6r9e9Dxc3xkvjpOniF2mGuvdTx1zfUtGOgP7hTjFIzJGJnk/RXbhB7+Eh1zEjvSqocIl3EB71n7uy02M/6SzhltPrOImCGh2Le5KJun8qdonPcLaMFA8gimkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMLkSDZL4nR6b27lobc4CgWcFwW+v3szovkHGL/k90w=;
 b=LzkbfCVcgicfX6b/bgGLjO7W7uSaPCKQYUhRQva/7o1xaumeX3InjKOxIILLZrJrWE+J8QfIqhhAfcf5I5smy8EdO5nlB58F4TkSLumCZ+E5cyVZ8s4mElQRLVL+ghLHb7bnHCRJ0BfQLHjEX5fTZKyAoZkRaASCQVDr2vnG0gA=
Received: from BN1PR12CA0021.namprd12.prod.outlook.com (2603:10b6:408:e1::26)
 by SJ2PR12MB7894.namprd12.prod.outlook.com (2603:10b6:a03:4c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 20:44:08 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::f9) by BN1PR12CA0021.outlook.office365.com
 (2603:10b6:408:e1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 21 Mar 2024 20:44:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7430.0 via Frontend Transport; Thu, 21 Mar 2024 20:44:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:44:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 13:44:06 -0700
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 21 Mar 2024 15:44:05 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 21 Mar 2024 13:43:44 -0700
Subject: [PATCH v3 6/9] drm: xlnx: zynqmp_dpsub: Set input live format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240321-dp-live-fmt-v3-6-d5090d796b7e@amd.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
In-Reply-To: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SJ2PR12MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ae9ccd-74b6-4eb6-0f03-08dc49e7a7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: deIKL7CCqXZZm6zJGDgiTtchZ50uQIdIjHNyC49Xn3FzYKMx0NpCY8a6cajHSOsfd2zKjkFhIN4VfPM+NwDFlcD4RHnFLeEfN5qOXtO7nCJ8C5le6qTjewWH6Gwo1ZDUXZgrdzH/puUnZsTdiB/Se8ZylDCZhwRdbU4rM/CyBU6ktGIqDMT9vjs7fTY8P4q/7yWWxpsn+uJdWZXMmdzdZXonz8tyQoIJD6lWVKpGpgfoNzANJbogcTrIeoUfUkLwxiIo2h/4ZaLgQBFbhNQeuOKD1q/kuSOJ6yz7FMth0VVlOAEIjcOPj9Sh7f5s9LKXx7b+vyGyCBRbgbI9PH1GJGKP8IozAUEzQLGR1JPbstchM/pyyQOc45PVrhyNW5vPE+NNNh+rxZLbX/axISOqPZtX1/8zwLRlsP4D6vBfmfzABhDvYzev6b8ZyJQUeeigClzFVB+qlFSiMzX3O49Stwt68NM68HPvQ0DCzlvMIDO1qwTQZcmi1FpvJu+O44tKp9ip/qbczH6G41dBByKZ+M7T/Gq/9fmGKY6ARfw70ClsyVw53AKYQfwhRGyixBew7N09kKLwWkWnX6l8gpK6w37fZbaRHlpkzRogs2JJdpQvzZzjwxLP7NewfIh7SDeIw0IqR2Gb5Y3m6FMvUlJ4xE9nRQ7oI14Z9P0avm3EXIKQsnAYWfN+MzNM6a8KtmcOX1xNanfKtNT7MMG2Za8ScDtzEmihCXs3aQLrJVZHGMDgO3BqjV5tQ070kKpo0HAXBBsdkHiJ6dJ0MFjy97bPgg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(7416005)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:44:07.8537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ae9ccd-74b6-4eb6-0f03-08dc49e7a7c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7894
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
registers accordingly. Update zynqmp_disp_layer_set_format() API to fit
both live and non-live layer types.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 66 +++++++++++++++++++++++++-------------
 drivers/gpu/drm/xlnx/zynqmp_disp.h |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c   | 13 +++++---
 drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
 4 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 0c2b3f4bffa6..a385d22d428e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -436,19 +436,28 @@ static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp *disp,
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
+	} else {
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
+		    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
+		val = fmt->buf_fmt;
+	}
+	zynqmp_disp_avbuf_write(disp, reg, val);
 
 	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
-		unsigned int reg = zynqmp_disp_layer_is_video(layer)
-				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
-				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
+		    : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
 
 		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
 	}
@@ -902,25 +911,33 @@ static void zynqmp_disp_audio_disable(struct zynqmp_disp *disp)
  */
 
 /**
- * zynqmp_disp_layer_find_format - Find format information for a DRM format
+ * zynqmp_disp_layer_find_format - Find format information for a DRM or media
+ * bus format
  * @layer: The layer
- * @drm_fmt: DRM format to search
+ * @drm_or_bus_format: DRM or media bus format
  *
  * Search display subsystem format information corresponding to the given DRM
- * format @drm_fmt for the @layer, and return a pointer to the format
- * descriptor.
+ * or media bus format @drm_or_bus_format for the @layer, and return a pointer
+ * to the format descriptor. Search key choice depends on @layer mode, for live
+ * layers search is done by zynqmp_disp_format.bus_fmt, and for non-live layers
+ * zynqmp_disp_format.drm_fmt is used.
  *
  * Return: A pointer to the format descriptor if found, NULL otherwise
  */
 static const struct zynqmp_disp_format *
 zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
-			      u32 drm_fmt)
+			      u32 drm_or_bus_format)
 {
 	unsigned int i;
+	const struct zynqmp_disp_format *disp_format;
 
 	for (i = 0; i < layer->info->num_formats; i++) {
-		if (layer->info->formats[i].drm_fmt == drm_fmt)
-			return &layer->info->formats[i];
+		disp_format = &layer->info->formats[i];
+		if ((layer->mode == ZYNQMP_DPSUB_LAYER_LIVE &&
+		     disp_format->bus_fmt == drm_or_bus_format) ||
+		    (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE &&
+		     disp_format->drm_fmt == drm_or_bus_format))
+			return disp_format;
 	}
 
 	return NULL;
@@ -992,20 +1009,25 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 /**
  * zynqmp_disp_layer_set_format - Set the layer format
  * @layer: The layer
- * @info: The format info
+ * @drm_or_bus_format: DRM or media bus format
  *
  * Set the format for @layer to @info. The layer must be disabled.
  */
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
-				  const struct drm_format_info *info)
+				  u32 drm_or_bus_format)
 {
 	unsigned int i;
 
-	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
-	layer->drm_fmt = info;
+	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, drm_or_bus_format);
+	if (WARN_ON(!layer->disp_fmt))
+		return;
 
 	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
 
+	layer->drm_fmt = drm_format_info(layer->disp_fmt->drm_fmt);
+	if (!layer->drm_fmt)
+		return;
+
 	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
 		return;
 
@@ -1013,7 +1035,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	 * Set pconfig for each DMA channel to indicate they're part of a
 	 * video group.
 	 */
-	for (i = 0; i < info->num_planes; i++) {
+	for (i = 0; i < layer->drm_fmt->num_planes; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct xilinx_dpdma_peripheral_config pconfig = {
 			.video_group = true,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 88c285a12e23..9f9a5f50ffbc 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -55,7 +55,7 @@ u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
 void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
-				  const struct drm_format_info *info);
+				  u32 drm_or_bus_format);
 int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 			     struct drm_plane_state *state);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index e3b9eb3d9273..200e63636006 100644
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
+	zynqmp_disp_layer_set_format(layer, bus_fmt);
 	zynqmp_disp_layer_enable(layer);
 
 	if (layer == dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_GFX])
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index bf9fba01df0e..d96b3f3f2e3a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -111,7 +111,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 		if (old_state->fb)
 			zynqmp_disp_layer_disable(layer);
 
-		zynqmp_disp_layer_set_format(layer, new_state->fb->format);
+		zynqmp_disp_layer_set_format(layer, new_state->fb->format->format);
 	}
 
 	zynqmp_disp_layer_update(layer, new_state);

-- 
2.25.1

