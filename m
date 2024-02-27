Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C5868854
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 05:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB4610E867;
	Tue, 27 Feb 2024 04:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5uGc5HrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411910E865
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 04:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDlABtg6ek42lR7nnjksnuvMvwCYzisOkdhCL716CIpo8g1ifx3p7seLrNWFlxax5LZ1T8/ykroWlDkpf61Gd6w0EcxZh75kwfZ8eNqOBBpxfR1bdZX1vWvbgJoBswGNMGCjvNE/JMQ8V03IyVssBGTiz9xgmesFoof36qdC5gTmPtRs6jEmq+S7Ku1WS83tki9B3KQYF0cbIoPMxNlaRiTgHx3wU0C+KRYdxK96O4NUodM3grx+fzc8yrvXm4neSa/stysfBmMBToJJlydI+nlAAuJiEIPORo3GT9ICaQNevwW38RX0UxNBSkNAgcIPllr6FW41hpg/NAU4fstalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aygYq62jAk05LY0p6mruWbTdprElX/LT1jxqeOWlmCk=;
 b=dSJUvf00s/jp9hGzAMUSLUj8V+eUmm5s17U/5Bx2DIGEvPH7KHKYwldUrwwfyEpecpFfB1RXM6c08d0w3LScW6jMw5NXQIs74cAtm4NdIrD9DREq7QD1ZQx1y/od2MArfQzGTS5XNpTrO6O8N8/T/DdJsTwpGVh8eDlkx7Ht58/UaJJa9JF5ZJFhHHUdyrFQvX3LqzIWe2Z5N2MPfIQvYTHu8Ysfw9slYuwLfscuCWBRzSzMKhoIdKUHpMoWv7sQ/pDcAH5pQ4lDNKWOKrTdKJK6ExauSQXaMrOPJaXM9/HaqUm/Ssq+gP96ibLcovUC3bENR8iGe2IFA/p41diMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aygYq62jAk05LY0p6mruWbTdprElX/LT1jxqeOWlmCk=;
 b=5uGc5HrCzuaGa7ymExiyETgAScT/126GtYGgFwdeTPiAkI4NCsWlUbc2r1hKaQDfdxl6wbSV6e8b+BZErLVEl2p35BfOST/9Nmv/v53OiFoFYUw2FchtMvRzS0FPmAelsogBuLMLLIdLXrRuvZ4oOYdgWU8crpcXVmp5xQSf2+E=
Received: from SJ0PR03CA0236.namprd03.prod.outlook.com (2603:10b6:a03:39f::31)
 by DM4PR12MB5150.namprd12.prod.outlook.com (2603:10b6:5:391::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 04:44:52 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::23) by SJ0PR03CA0236.outlook.office365.com
 (2603:10b6:a03:39f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Tue, 27 Feb 2024 04:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 04:44:52 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 22:44:51 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 20:44:51 -0800
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Mon, 26 Feb 2024 22:44:49 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Mon, 26 Feb 2024 20:44:44 -0800
Subject: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Set input live format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240226-dp-live-fmt-v1-3-b78c3f69c9d8@amd.com>
References: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
In-Reply-To: <20240226-dp-live-fmt-v1-0-b78c3f69c9d8@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.12.4
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DM4PR12MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6370b7-0f08-4958-ba81-08dc374ed642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ndIqd1XjOpU8sFqAyRElz8F1vevp9eYdGfHzqyXgQlXMRMsuVdqZBivELYb38mqTySfvFzqy9Pp2d7nOxn0+I4GSgI6ZIjWikQ3Rt/Qw34P5hVh61TQXjb1WLZdSi+NPNKsy9oxzMFjveV8xzi9U3PvmnRDVcIrz/4x5r202PUqASVEFrf5ts+5TCPWZMi8aeO3BOlHvTNRv/t/HVeH6phHnUG4SSerp0E961XdsRz8VvPG4V33QGmT2OzMPfz8oF4p5CxHZhR1SXpAmzPsYUR616RuYswEN4RQPOlfGHUryB24B8WJZWxwrgydbCWwZPnyoQIQ80HuL/OB9xQfwNedrgHyi6aAo8ULkddf840V/XESBUzTOpn1Ir3G3LNfaAXczvu3173UYKuIx8dVd3SO3frIiIzkPcNaCN6j60m+kZ2uZxnmGy1d/nkWHThBFbJtNCUnodu5VcFmAkPh07NrOlyQdwJ+YLXHV3aMPCg3Jf/yPb5MpQB+8glvmaDJIPNHIp7FpM5W/qNl8ynQQms74M76U36/4pouYs8PVJizL63AdgM2Q9iEi/cIxKO7pVC8SGPwQoNCGHtcj6l1bLahqXSuuWTZec0otwPu/VOguelpAUNI3YAvFSEjNW0hUIt4OPF/y8l9y2/9Jr1Ml9if9m44Et0LiTsTIscf6UjRSvO3UCJnceopNN0EEdoIqk6CCnZwtBSNhvcIttOit3Ag0MkZb1xFysNpa6C/J7EudDmmjE6lBUXqNkq1aAdyqm2svSlqtMoTeIZzAReKn0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(921011); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 04:44:52.0191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6370b7-0f08-4958-ba81-08dc374ed642
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5150
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
 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 52 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_disp.h      |  2 ++
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  8 ++---
 drivers/gpu/drm/xlnx/zynqmp_dp.c        | 13 ++++++---
 4 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index ee99aad915ba..1c3ffdee6b8e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -416,6 +416,34 @@ static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
 	return layer->id == ZYNQMP_DPSUB_LAYER_VID;
 }
 
+/**
+ * zynqmp_disp_avbuf_set_live_format - Set live input format for a layer
+ * @disp: Display controller
+ * @layer: The layer
+ * @fmt: The format information
+ *
+ * Set the live video input format for @layer to @fmt.
+ */
+static void zynqmp_disp_avbuf_set_live_format(struct zynqmp_disp *disp,
+					      struct zynqmp_disp_layer *layer,
+					      const struct zynqmp_disp_format *fmt)
+{
+	u32 reg, i;
+
+	reg = zynqmp_disp_layer_is_video(layer)
+	    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
+	    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
+	zynqmp_disp_avbuf_write(disp, reg, fmt->buf_fmt);
+
+	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; ++i) {
+		reg = zynqmp_disp_layer_is_video(layer)
+		    ? ZYNQMP_DISP_AV_BUF_LIVD_VID_COMP_SF(i)
+		    : ZYNQMP_DISP_AV_BUF_LIVD_GFX_COMP_SF(i);
+		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
+	}
+	layer->disp_fmt = fmt;
+}
+
 /**
  * zynqmp_disp_avbuf_set_format - Set the input format for a layer
  * @disp: Display controller
@@ -979,6 +1007,30 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 	zynqmp_disp_blend_layer_disable(layer->disp, layer);
 }
 
+/**
+ * zynqmp_disp_layer_set_live_format - Set live layer input format
+ * @layer: The layer
+ * @info: Input media bus format
+ *
+ * Set the live @layer input bus format. The layer must be disabled.
+ */
+void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
+				       u32 bus_format)
+{
+	int i;
+	const struct zynqmp_disp_format *fmt;
+
+	for (i = 0; i < ARRAY_SIZE(avbuf_live_fmts); ++i) {
+		fmt = &avbuf_live_fmts[i];
+		if (fmt->bus_fmt == bus_format) {
+			layer->disp_fmt = fmt;
+			layer->drm_fmt = drm_format_info(fmt->drm_fmt);
+			zynqmp_disp_avbuf_set_live_format(layer->disp, layer, fmt);
+			return;
+		}
+	}
+}
+
 /**
  * zynqmp_disp_layer_set_format - Set the layer format
  * @layer: The layer
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index c2c8dd4896ba..f244b7d2346a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -66,6 +66,8 @@ void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 				  const struct drm_format_info *info);
+void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
+				       u32 bus_format);
 int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 			     struct drm_plane_state *state);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..fa3935384834 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -165,10 +165,10 @@
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		(0x0 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	(0x1 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	(0x2 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	(0x3 << 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
 #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 9cb7ac9f3097..0d5dffd20ad1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1281,7 +1281,8 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 {
 	enum zynqmp_dpsub_layer_id layer_id;
 	struct zynqmp_disp_layer *layer;
-	const struct drm_format_info *info;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_fmt;
 
 	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
 		layer_id = ZYNQMP_DPSUB_LAYER_VID;
@@ -1291,10 +1292,14 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
 		return;
 
 	layer = dp->dpsub->layers[layer_id];
+	bridge_state = drm_atomic_get_new_bridge_state(old_bridge_state->base.state,
+						       old_bridge_state->bridge);
+	if (bridge_state) {
+		bus_fmt = bridge_state->input_bus_cfg.format;
+		zynqmp_disp_layer_set_live_format(layer, bus_fmt);
+	} else
+		return;
 
-	/* TODO: Make the format configurable. */
-	info = drm_format_info(DRM_FORMAT_YUV422);
-	zynqmp_disp_layer_set_format(layer, info);
 	zynqmp_disp_layer_enable(layer);
 
 	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)

-- 
2.25.1

