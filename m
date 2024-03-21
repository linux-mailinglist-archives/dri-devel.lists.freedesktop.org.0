Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161568861DF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 21:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B05011210A;
	Thu, 21 Mar 2024 20:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oqX+HZ1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7D411210C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 20:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m01G96dn54T6cIbAY4bMM1qXsrGt6LUs0mj6+++0Mi+Y8IKhN5quEItTKKP77ApiBOY/bcwIQXj+5pPrWuG9g6C8tuukZktIbbPXAfOope3KmoFPedehV4dAuF5lhoU2Q91AiYPC3mC73aiVpTU2HL4HmgIbcZT/bFFsDf/VBZ/klOAXGtR5dCTgpsqw7CNOcv+Be/B5DbmTTDcRgLCNxF9ilTpm+vI5ScBCNywdqbHygoX9M/OzElm1lD/c4yRf+Zt+JE1K0/AXFogsWSfo0C6Pet0j2cBiVAO3VRJNlTQdPOJRZ3kDotym599BJroJmSGyW6ZSnq0g2YgbX0DTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR7l+OkffQKba4rEVoAcNglywMyVbJo8gFYVAmFw0hI=;
 b=Q69NQKaLKkStQyVLLyJMcs2wY7gFLxjUb1H/inoo59Bn/Q/ReOsrzjE5gBygzNqKhtZIWJ4HAl6AIaSIRyB53oT1k7uQOk/2C7gtAda/BhXfJnL17ogSzv7acTrZIRabZv3nmcEl9cfe8XGDvN+9yS+QPqEEV6Xdl6FSO//Ry8VmBzV+9KUKbyZkcOHjpuAV4wZEcBFIZClxA0dLz0N1YI12fNPwPr3iqAcq9FcYPsZsGZcJ63VQ9ruX2dIWKlFFcmhuKaJUekzF9B8TxtPq5CBovNJHeovBeXJnT3vbjNlvNfUOQRYYxKqGj+Mtl0VRFFanS/xmkBgPZiJlc3L2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR7l+OkffQKba4rEVoAcNglywMyVbJo8gFYVAmFw0hI=;
 b=oqX+HZ1Cl3PRBjP18CqbMtaK15U7qPokuT0ujvfW68Bs9sXrvK7szzOHFNElwf7YO/mdG3pIP6yLwCUvQD3lOlhMmNkZy/MfV86ydrNVvWwy69se26g7V/dMfX+T6ZpfxYPD+p+w+IepKAOp9K33VydylSFplhdDiI+x28S3ke4=
Received: from BN9PR03CA0157.namprd03.prod.outlook.com (2603:10b6:408:f4::12)
 by BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Thu, 21 Mar
 2024 20:44:17 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::f6) by BN9PR03CA0157.outlook.office365.com
 (2603:10b6:408:f4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 20:44:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 20:44:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:44:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 15:44:08 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 21 Mar 2024 15:44:06 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 21 Mar 2024 13:43:45 -0700
Subject: [PATCH v3 7/9] drm/atomic-helper: Add select_output_bus_format
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240321-dp-live-fmt-v3-7-d5090d796b7e@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|BY5PR12MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: 72523a37-23a2-4f8e-e5db-08dc49e7acff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2CgC+34DcYChLjnOoeZvazvHZE5CqhHHhLi36JPV8nAb9+EEi1HS11n9Mh1UbxytyLT6SX5WC5xm1AltODdqqq+TinLa7S2lKkWj50hNqwM5I3twZaHX2HMIAT+W+xsVqwZE1EACO5TKd9G/XH84p6bjlbZLXvuwv5tgb283pH6NC47dRHu7tA63BG9YxVKPXrXza6CxuDa1+tZ90lYIlfe4xsb1Savglv0A1ALDBuQtcbHutj6TGxQMRJmCln6MFoK39CAZYyZilnrzzvsK6fc9y00SsnOynr9XsK7rhOKBoxfpl9Mz2XuwyYt0WUPWscOKW6m+7d58fnH9GSVIlCnvukmAf6cLP/4ttyx2r7MwJlQcIF+ouUZDbUi6A8A9UAN71A+UynExl+ogYQutKtOlYv0cEftUXmzhBzv9krOuyrR2eAAA70ryO6l2phHk/Y0kZb/N+c2s3Cc7WwyuZWJG9nIPG/BNKt5YO7F+mC8hBUJTrybatyPJ6qYnRRc7joSijc5HR/Y7/rlDDFV7ZSLnvPnqqvMXClivFGbMZD2KUkOmD9naRQgrYqerzxsgoO+SzIRSZqTjJXbQz7WqzWLPWXohtcWnr/EBWRAEWp5SiIzhY3GB0KT+qVdiCK/SxtDrO6vbz+zplMyzf1RrtV7QVz57Tn5JnP7JyEDCzzaRdnFtmn0uUPvZ8P19eRoYTlFO3mRwm17x+sZxkl+4kHnTdXh7Vk1/RTI2rL3vMLTbknukXO2H4Vn67M/SIXKVN9fPFg55Y4bsrBIr3YviA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(82310400014)(36860700004)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 20:44:16.6461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72523a37-23a2-4f8e-e5db-08dc49e7acff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
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

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/drm_bridge.c             | 14 +++++++++++--
 drivers/gpu/drm/drm_crtc_helper.c        | 36 ++++++++++++++++++++++++++++++++
 include/drm/drm_crtc_helper.h            |  5 +++++
 include/drm/drm_modeset_helper_vtables.h | 30 ++++++++++++++++++++++++++
 4 files changed, 83 insertions(+), 2 deletions(-)

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
index 2dafc39a27cb..f2e12a3c4e5f 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -1055,3 +1055,39 @@ int drm_helper_force_disable_all(struct drm_device *dev)
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
+	if (!crtc || !supported_fmts || !num_supported_fmts)
+		return 0;
+
+	if (!crtc->helper_private ||
+	    !crtc->helper_private->select_output_bus_format)
+		return supported_fmts[0];
+
+	return crtc->helper_private->select_output_bus_format(crtc,
+							crtc_state,
+							supported_fmts,
+							num_supported_fmts);
+}
+EXPORT_SYMBOL(drm_helper_crtc_select_output_bus_format);
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

