Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7275C342
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 11:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861910E641;
	Fri, 21 Jul 2023 09:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44FB10E643
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 09:42:18 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED3C52F5E;
 Fri, 21 Jul 2023 11:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1689932481;
 bh=cNkl06QQHpvODOS+NcyjyJrtUpAGoum7uDoGdQ4v5oM=;
 h=From:Date:Subject:To:Cc:From;
 b=oG+GCAZvk/7E4PKI49WAqK0Txl/XPwdEHjLiMWDlLIc1YWJeQWPFnj8d3/MhRPywj
 EqIIl8oc23WpAsnpNeO8IU3T7tJJAN9WU/bT2QB8z4JwgOrxlrTRUXrbYmVoi5f+EI
 H+5gSOzbbrdPC9jw6DsPOY+O4X67pgRR0UqNGok0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 21 Jul 2023 12:41:49 +0300
Subject: [PATCH] drm/bridge: Add debugfs print for bridge chains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIANxSumQC/x2MQQqAMAwEvyI5G2gjIvgV8WBtqjlYJUURxL8bP
 A47Ow8UVuECffWA8iVF9mzg6wrmdcoLo0RjIEeN68hj1A2DSrTFBMkYOZxLKuhCmH1LlNpuArs
 fyknuPz2M7/sB66l4eWoAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4407;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cNkl06QQHpvODOS+NcyjyJrtUpAGoum7uDoGdQ4v5oM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkulL3/1oxZDXSy2KXI3/n4Ihjp95Gkuy5lrimi
 SLm6s6nQmSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZLpS9wAKCRD6PaqMvJYe
 9b/lD/4vm9Td3Avl7pKylPBLSvKEq6KJ/GlYvERTWzWXNl0eHg0VbaYyXDIAZOJyJBRtvFanKsW
 B0DdiDHr3OdWAE+4NvAy4IyOQwrR121WYgfPPFuK9GdxCVoEaYmQW4EZ6yQ/iOxknT3vLEDWLr9
 c3lxhkMst8jL5N7jkocg39agZ7V/UpiAzJm63WSjRMP6w9NaKBa6heFcipEBIexQKUoHnRmNPo6
 pwx+xxL1kSDkQH2dhZ2/AdyExWQ6RVYMFRQbvNRFr6HFVtFBCWGY0R90z9stTeFyVhpV7qUGfo+
 awF4JpAX7/uOY/cm+QYR7GNUPBocoWuuqQ7V9LZj4wEWVsJpFjovXeAuGNP9y5Y4hhMzXjmVBhL
 cYWb16j0RwftAnQ273fH2VXWfn1zvtnhxYuUKDVcFhACdIvtzoXAATuH+CiI6LtmATS7nlCCx76
 31aonf3pWxb+cMQIvNQYy544LKYXk6JbehUGj09vZHH46tBnm8r2e6TPVGoMNkWdXTuTT+q5DSP
 jH2Y8UFg3rdc8Fw/A26L/1eJXuUx4oG7Ad4MV9iODKU4r1Vb0Rel/o9Qh3mWGM25NJ1sSpmuNwK
 I729ds+lxDQgRi/xP+CdyxiaH7EGvg6G8GCOer0Bywpnq4KVUdf2sre32Rg3LnWDnyDm866TYOi
 LHAqvD7LEyxrwCg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM bridges are not visible to the userspace and it may not be
immediately clear if the chain is somehow constructed incorrectly. I
have had two separate instances of a bridge driver failing to do a
drm_bridge_attach() call, resulting in the bridge connector not being
part of the chain. In some situations this doesn't seem to cause issues,
but it will if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is used.

Add a debugfs file to print the bridge chains. For me, on this TI AM62
based platform, I get the following output:

encoder[39]
	bridge[0] type: 0, ops: 0x0
	bridge[1] type: 0, ops: 0x0, OF: /bus@f0000/i2c@20000000/dsi@e:toshiba,tc358778
	bridge[2] type: 0, ops: 0x3, OF: /bus@f0000/i2c@20010000/hdmi@48:lontium,lt8912b
	bridge[3] type: 11, ops: 0x7, OF: /hdmi-connector:hdmi-connector

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_bridge.c  | 48 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_debugfs.c |  3 +++
 include/drm/drm_bridge.h      |  5 +++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79..da3205aaed6b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -27,8 +27,10 @@
 #include <linux/mutex.h>
 
 #include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_debugfs.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_file.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
@@ -1345,6 +1347,52 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
+#ifdef CONFIG_DEBUG_FS
+static int drm_bridge_chains_info(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_encoder *encoder;
+	unsigned int bridge_idx = 0;
+
+	list_for_each_entry(encoder, &config->encoder_list, head) {
+		struct drm_bridge *bridge;
+
+		drm_printf(&p, "encoder[%u]\n", encoder->base.id);
+
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+
+		while (bridge) {
+			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
+				   bridge_idx, bridge->type, bridge->ops);
+
+			if (bridge->of_node)
+				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
+
+			drm_printf(&p, "\n");
+
+			bridge_idx++;
+			bridge = drm_bridge_get_next_bridge(bridge);
+		}
+	}
+
+	return 0;
+}
+
+/* any use in debugfs files to dump individual planes/crtc/etc? */
+static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
+	{"bridge_chains", drm_bridge_chains_info, 0},
+};
+
+void drm_bridge_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
+			      ARRAY_SIZE(drm_bridge_debugfs_list));
+}
+#endif
+
 MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
 MODULE_DESCRIPTION("DRM bridge infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index c90dbcffa0dc..3e89559d68cd 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -31,6 +31,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_auth.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_client.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
@@ -272,6 +273,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 
 	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
 
+	drm_bridge_debugfs_init(minor);
+
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		drm_atomic_debugfs_init(minor);
 	}
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index bf964cdfb330..60dbee6bd1e6 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -949,4 +949,9 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
+#ifdef CONFIG_DEBUG_FS
+struct drm_minor;
+void drm_bridge_debugfs_init(struct drm_minor *minor);
+#endif
+
 #endif

---
base-commit: c7a472297169156252a50d76965eb36b081186e2
change-id: 20230721-drm-bridge-chain-debugfs-0bbc1522f57a

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

