Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E3D76C611
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5067A10E4C3;
	Wed,  2 Aug 2023 07:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587010E4C3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 07:04:34 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E26A62AC;
 Wed,  2 Aug 2023 09:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690959809;
 bh=Sc8D2SdGCbu9XTm7K1J4nA4tf4ujy8AiwCNW6zEjPtc=;
 h=From:Date:Subject:To:Cc:From;
 b=FfYfM4N1drAfSIeYowE2wcYQqqWWGXUNPsNmJTifGB3F4oblbZ11WejjArS67hcBc
 SawOP2YSmRBD5TbVXcMYg9rxRf89vRNzIh2J1XMP6ntdz5K2lawkM2n/+wz/Y4gKuV
 SdNXTwmsjuSnaC8Jvz8V0SOg/Kqf59R9E5NBgd14=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 02 Aug 2023 10:04:11 +0300
Subject: [PATCH v4] drm/bridge: Add debugfs print for bridge chains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230802-drm-bridge-chain-debugfs-v4-1-7e3ae3d137c0@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAOr/yWQC/43NwQ6CMAwG4FchOzvDNmDgyfcwHjbaQQ8wsynRE
 N7dwcmDGo5/+/frzCIGwshO2cwCThTJjykUh4y1vRk75AQpM5lLlWspOISB20CQNqlAIwe0j85
 FnlvbilJKV2rD0vktoKPnRl+uKfcU7z68tk+TWKc70ElwwetKFM5prJsczgRooh+tNwGOrR/Ya
 k9yryeTpytwTaEK3VTyh6c+PPXPU6sHqdQ4hc6oL96yLG8cHJZeZwEAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5273;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Sc8D2SdGCbu9XTm7K1J4nA4tf4ujy8AiwCNW6zEjPtc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkyf/+VtvShjhA7H75mV9NW+L+8CI5miTedTfg4
 kZX80rCnOqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMn//gAKCRD6PaqMvJYe
 9QfpEACrXQFv2Ayfa1k0W/JGf0tSkIMgGLOj+jKErewnpXnU4asuDy7L1nDvLETTeZqewh0kgeI
 H4GyAQWnfW9ZUz7yT7rde9JuhQ4IQESLEABJIoeGqRrtQkURMhIddpjyRpojImMK8sJIsoL2dOU
 bVHaPx/iXOMTVYrHPxmxtXkfQFGNi6XCuyR3agRgPbqY5UutHsfs3+buGi3n4A2WvGHHy1Xx2KA
 LWjmo39BWeME8UdJS8TF4nv8wJmb+gy0qBGgVrNYPzmyyV4Ah8HkK/n9BjBDLxUgfuUTLPZD1q9
 HYA2adM4MqIwiVS2I3yoNvsiLHqwJnO93m/5/z6w5sPFTvGv8VpG2BgHmJgRKnF0WM2HfFphl4v
 7xVGDWmJ69KIIzAts85OSG73c51uuGWXqlZSZjDmXtx7zulo+atABN5Doua/7UUPqI45RgwuZI6
 VhsQwnO9qv0c8JBRK2+bL/SlsVgjNVK1nPrp7IhU+VZQGCTjWe89/U2jlKd9BwWtAzTZk7dRABB
 5zY+KZUHcN+p2ip1soeAH3olT7NlvgjGJoMgo3j4CcLElHD1ORR7Whd83zSBEgpvLvibfOHIF7Q
 gFiiFdbcVvU+en2hxioU9tabXguJ8iXqNQr1ehDp5U+i8VcSq9iwSjSppu1ec6KY1IdK7z4xC3x
 3lp923aLWPDC8Fw==
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v4:
- Move 'struct drm_minor' to be along the other declarations
- Added Tested-by and Reviewed-by
- Link to v3: https://lore.kernel.org/r/20230731-drm-bridge-chain-debugfs-v3-1-7d0739f3efa3@ideasonboard.com

Changes in v3:
- Use drm_for_each_bridge_in_chain()
- Drop extra comment
- Fix whitespace issue
- Call drm_bridge_debugfs_init() only if the driver uses modeset
- Drop #ifdef for drm_bridge_debugfs_init() declaration
- Link to v2: https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v2-1-76df94347962@ideasonboard.com

Changes in v2:
- Fixed compilation issue when !CONFIG_OF
- Link to v1: https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d@ideasonboard.com
---
 drivers/gpu/drm/drm_bridge.c  | 46 +++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_debugfs.c |  2 ++
 include/drm/drm_bridge.h      |  3 +++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79..39e68e45bb12 100644
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
 
@@ -1345,6 +1347,50 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
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
+		drm_for_each_bridge_in_chain(encoder, bridge) {
+			drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
+				   bridge_idx, bridge->type, bridge->ops);
+
+#ifdef CONFIG_OF
+			if (bridge->of_node)
+				drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
+#endif
+
+			drm_printf(&p, "\n");
+
+			bridge_idx++;
+		}
+	}
+
+	return 0;
+}
+
+static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
+	{ "bridge_chains", drm_bridge_chains_info, 0 },
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
index a3a488205009..2de43ff3ce0a 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -31,6 +31,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_auth.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_client.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
@@ -274,6 +275,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		drm_atomic_debugfs_init(minor);
+		drm_bridge_debugfs_init(minor);
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index bf964cdfb330..c339fc85fd07 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -36,6 +36,7 @@ struct drm_bridge;
 struct drm_bridge_timings;
 struct drm_connector;
 struct drm_display_info;
+struct drm_minor;
 struct drm_panel;
 struct edid;
 struct i2c_adapter;
@@ -949,4 +950,6 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
+void drm_bridge_debugfs_init(struct drm_minor *minor);
+
 #endif

---
base-commit: a0c64d153d687756c8719b8d10e609d62e1cb6fd
change-id: 20230721-drm-bridge-chain-debugfs-0bbc1522f57a

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

