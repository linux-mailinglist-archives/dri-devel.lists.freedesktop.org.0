Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD58A75A7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4F4112E5A;
	Tue, 16 Apr 2024 20:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lWHkOTBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8433112E58
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:32:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfC3xT9LxMtEutS1qYJWlU8TIKh2a6e6bFCOV14bQ/6Rzn2uCVHYrggnucuokR+b1cNNxI6m0cOEWAUdY2hDjxhWR8aLNIMsrIe5QBuegfI+M8hiJ8UUG2m4mdV1Q5EAFQDAKcANsh3S0543gm+OlYKNJXVBOlMnf5zEJeVJ5PIhZYsf13O7RKLwc8S4aIxNboT+6mRoCymC8jBerKWX4EJR9FAMXRdT5pKidC/yU6MbRGo4ZDU3lAlBrXdFo5IWpnv+zabieJ23AGHumEch8PCRnAuwp4ZN4N8abQmmjCyvc9V2ge1ngkemNsluKAIXmZj7/yCSQGmz/33Q4Gb9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0ImcF5+f8PxLy3F3qASiZOnUYitjVli58R3DNOhPXQ=;
 b=Xd9BM6zaygH4MV0QI4oLOnQ963ESAYkcDRvhf+XkNmJTkJO2y9Krn1SjCZIc/iC2zi88l67kRR5UECjJO1lKMdWrppLU/V+vIhCHjlNgdIjJVX3NK6iYD/+zYUT6RKEARFMem47ddbG2QF3+4/9boQ3n6k7dVCESTr2ADFoMlg2pXEgfjb30aT8TOuL7NX/igSyMUuCi4Z7aQfmexbQjRO+Z+Zh7Kjf0S9WQZlM6eG9ujqbxP13UjspuMhvZFsRzSyILKm5F6zpPYS1i8yYF+uOGiGiQdVmb/COvMftLBWgmvFcUMdT9gLW4ye36DG4he+xESjAGiUpxT0VZPqXnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0ImcF5+f8PxLy3F3qASiZOnUYitjVli58R3DNOhPXQ=;
 b=lWHkOTBuuuzOE+b7TewSlcO0NZBpCKleDVLTG16uIByo+B6yDTZdsK+ElnpGuL5GwQU6F5LTCtcxOCCXCzbpxrBEvNzAxcbniD7lWbn3t10wnVR9wSTGfKw9IfKTFGiUq79Gvq4O+6ZNbEKhs/K8HNUkZGoit6Ur0m9wjxfMMEE=
Received: from BL1PR13CA0239.namprd13.prod.outlook.com (2603:10b6:208:2bf::34)
 by IA1PR12MB7615.namprd12.prod.outlook.com (2603:10b6:208:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:32:05 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::f4) by BL1PR13CA0239.outlook.office365.com
 (2603:10b6:208:2bf::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.19 via Frontend
 Transport; Tue, 16 Apr 2024 20:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 20:32:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 15:32:02 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 16 Apr 2024 15:32:00 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 16 Apr 2024 13:31:42 -0700
Subject: [PATCH v4 7/7] drm/atomic-helper: Add select_output_bus_format
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240416-dp-live-fmt-v4-7-c7f379b7168e@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|IA1PR12MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: da737df2-7fd8-4601-d812-08dc5e5447d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDA817bVm9BsEJpJDauXzLbudcC1L3b7BEA4b4AhwNvO6/6z2sCz4EqRn98HRTgm5Sqd48lPu4GbACHDaM7urQgcoWoXjQLcEUtGwDAlyCbEj4AkduErS0MwER/5BbciniXw2uMn9TbE9FoRcsA3SXfksjZubqGviRW9tjxtMP7mRBRFUQLP7ZPc743tHe7/VCxADLSgzLQ1kl2z2k9QzgUkap0yxqp4/DJMwMH46xih1I44XOMqYMv0Hs4YHBl3B+QaJbl0wQDGXFEz6+UpFP4K6WyeW34utrnxDtbZi/MI35inXfUuWlaXTitqQgHrtUKWKsWFU4k6/kJ0/y/vnTWtJgraEJuUTodSf0Lw33y3vr/37JUw2WVzS79UUsefC+HDncbKYrUSXfMSIoWOo2QibdBPCON/Br/MgTym53BRXsW/D+uYAJicaErVSFUZvr6h/N3El7U8mZFBugFPGzZO8078+AeocDM/TLXN+XS9Y116Zysg1apNWbh6tZLPQ4uGj93YAi90AbQ2tAK8Xz60dI0g2dTffWfunIeAt08q+Kft1IcgatG4CeHy/BC7c+zSd3gmO+/14i4Jgmmvul7Fh2EgvNwugMzOIYDeBITzZBBzJsw0k7RmrhMqa8F7GU4Dtl8Ssx6pXQXdcbh9qc5z4WXsv5ROgN+mFgiRTzyQJRU2L/XUz0cMlORHJtTikoM2kz+o8YGhSu0R4/89v28x0Sg0Oa7tWYi6oEi6Vbpd+auWhWbzaE7XhsvF94rwyfUdtWvg6jFgsiiQ/eb1oA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:32:05.4396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da737df2-7fd8-4601-d812-08dc5e5447d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7615
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

Add optional drm_crtc_helper_funcs.select_output_bus_format callback. This
callback allows to negotiate compatible media bus format on the link
between CRTC and connected DRM encoder or DRM bridge chain. A good usage
example is the CRTC implemented as FPGA soft IP. This kind of CRTC will
most certainly support a single output media bus format, as supporting
multiple runtime options consumes extra FPGA resources. A variety of
options for the FPGA designs are usually achieved by synthesizing IP with
different parameters.

Add drm_helper_crtc_select_output_bus_format that wraps
drm_crtc_helper_funcs.select_output_bus_format.

Incorporate select_output_bus_format callback into the format negotiation
stage to fix the input bus format of the first DRM bridge in the chain.

Save negotiated output media bus format in drm_crtc_state.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/drm_bridge.c             | 14 ++++++++++--
 drivers/gpu/drm/drm_crtc_helper.c        | 38 ++++++++++++++++++++++++++++++++
 include/drm/drm_crtc.h                   | 11 +++++++++
 include/drm/drm_crtc_helper.h            |  5 +++++
 include/drm/drm_modeset_helper_vtables.h | 30 +++++++++++++++++++++++++
 5 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 521a71c61b16..955ca108cd4b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -28,6 +28,7 @@
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
@@ -879,7 +880,8 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 	unsigned int i, num_in_bus_fmts = 0;
 	struct drm_bridge_state *cur_state;
 	struct drm_bridge *prev_bridge;
-	u32 *in_bus_fmts;
+	struct drm_crtc *crtc = crtc_state->crtc;
+	u32 *in_bus_fmts, in_fmt;
 	int ret;
 
 	prev_bridge = drm_bridge_get_prev_bridge(cur_bridge);
@@ -933,7 +935,15 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 		return -ENOMEM;
 
 	if (first_bridge == cur_bridge) {
-		cur_state->input_bus_cfg.format = in_bus_fmts[0];
+		in_fmt = drm_helper_crtc_select_output_bus_format(crtc,
+							crtc_state,
+							in_bus_fmts,
+							num_in_bus_fmts);
+		if (!in_fmt) {
+			kfree(in_bus_fmts);
+			return -ENOTSUPP;
+		}
+		cur_state->input_bus_cfg.format = in_fmt;
 		cur_state->output_bus_cfg.format = out_bus_fmt;
 		kfree(in_bus_fmts);
 		return 0;
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 2dafc39a27cb..4d3aa39c8a82 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -1055,3 +1055,41 @@ int drm_helper_force_disable_all(struct drm_device *dev)
 	return ret;
 }
 EXPORT_SYMBOL(drm_helper_force_disable_all);
+
+/**
+ * drm_helper_crtc_select_output_bus_format - Select output media bus format
+ * @crtc: The CRTC to query
+ * @crtc_state: The new CRTC state
+ * @supported_fmts: List of media bus format options to pick from
+ * @num_supported_fmts: Number of media bus formats in @supported_fmts list
+ *
+ * Encoder drivers may call this helper to give the connected CRTC a chance to
+ * select compatible or preffered media bus format to use over the CRTC encoder
+ * link. Encoders should provide list of supported input MEDIA_BUS_FMT_* for
+ * CRTC to pick from. CRTC driver is expected to select preferred media bus
+ * format from the list and, once enabled, generate the signal accordingly.
+ *
+ * Returns:
+ * Selected preferred media bus format or 0 if CRTC does not support any from
+ * @supported_fmts list.
+ */
+u32 drm_helper_crtc_select_output_bus_format(struct drm_crtc *crtc,
+					     struct drm_crtc_state *crtc_state,
+					     const u32 *supported_fmts,
+					     unsigned int num_supported_fmts)
+{
+	if (!crtc || !crtc_state || !supported_fmts || !num_supported_fmts)
+		return 0;
+
+	if (!crtc->helper_private ||
+	    !crtc->helper_private->select_output_bus_format)
+		crtc_state->output_bus_format = supported_fmts[0];
+	else
+		crtc_state->output_bus_format =
+			crtc->helper_private->select_output_bus_format(crtc,
+							crtc_state,
+							supported_fmts,
+							num_supported_fmts);
+	return crtc_state->output_bus_format;
+}
+EXPORT_SYMBOL(drm_helper_crtc_select_output_bus_format);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..cdaa27f50af7 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -317,6 +317,17 @@ struct drm_crtc_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	/**
+	 * @output_bus_format:
+	 *
+	 * CRTC output media bus format of the video signal negotiated between
+	 * CRTC and encoder. This value should be one of MEDIA_BUS_FMT*
+	 * from uapi/linux/media-bus-format.h. It is safe to ignore
+	 * @output_bus_format if CRTC doesn't support multiple output bus format
+	 * options.
+	 */
+	u32 output_bus_format;
+
 	/**
 	 * @event:
 	 *
diff --git a/include/drm/drm_crtc_helper.h b/include/drm/drm_crtc_helper.h
index 8c886fc46ef2..b7eb52f3ce41 100644
--- a/include/drm/drm_crtc_helper.h
+++ b/include/drm/drm_crtc_helper.h
@@ -38,6 +38,7 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_crtc;
+struct drm_crtc_state;
 struct drm_device;
 struct drm_display_mode;
 struct drm_encoder;
@@ -61,5 +62,9 @@ int drm_helper_connector_dpms(struct drm_connector *connector, int mode);
 
 void drm_helper_resume_force_mode(struct drm_device *dev);
 int drm_helper_force_disable_all(struct drm_device *dev);
+u32 drm_helper_crtc_select_output_bus_format(struct drm_crtc *crtc,
+					     struct drm_crtc_state *crtc_state,
+					     const u32 *supported_fmts,
+					     unsigned int num_supported_fmts);
 
 #endif
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 881b03e4dc28..6d5a081e21a4 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -489,6 +489,36 @@ struct drm_crtc_helper_funcs {
 				     bool in_vblank_irq, int *vpos, int *hpos,
 				     ktime_t *stime, ktime_t *etime,
 				     const struct drm_display_mode *mode);
+
+	/**
+	 * @select_output_bus_format
+	 *
+	 * Called by the connected DRM encoder to negotiate input media bus
+	 * format. CRTC is expected to pick preferable media formats from the
+	 * list provided by the DRM encoder.
+	 *
+	 * This callback is optional.
+	 *
+	 * Parameters:
+	 *
+	 * crtc:
+	 *     The CRTC.
+	 * crcs_state:
+	 *     New CRTC state.
+	 * supported_fmts:
+	 *     List of input bus formats supported by the encoder.
+	 * num_supported_fmts:
+	 *     Number of formats in the list.
+	 *
+	 * Returns:
+	 *
+	 * Preferred bus format from the list or 0 if CRTC doesn't support any
+	 * from the provided list.
+	 */
+	u32 (*select_output_bus_format)(struct drm_crtc *crtc,
+					struct drm_crtc_state *crtc_state,
+					const u32 *supported_fmts,
+					unsigned int num_supported_fmts);
 };
 
 /**

-- 
2.25.1

