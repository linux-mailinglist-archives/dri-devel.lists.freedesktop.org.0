Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00167695C6
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB2810E272;
	Mon, 31 Jul 2023 12:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4804910E272
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:13:49 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAD045A4;
 Mon, 31 Jul 2023 14:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690805566;
 bh=X0B++9ZJoOGXr2Q9dYZmjqsgjlJ16PlZ4syKyoxQEkU=;
 h=From:Date:Subject:To:Cc:From;
 b=jQCblDDrSZz+fpDqp24KCffbYEAStw0+unrpLi3Fsz+doawB+Te+cbH+pFj8wBfOv
 hRM6JPA1dynBc5l8OU7vqDmeF9xi8H7vrBIPnTqU+4wMDhaOwuag0rTU4OW7ihetRj
 it5zcIb+2lUJirgWyUWbpPOG8nq/0PrpZwqOBif8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 31 Jul 2023 15:13:14 +0300
Subject: [PATCH v3] drm/bridge: Add debugfs print for bridge chains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230731-drm-bridge-chain-debugfs-v3-1-7d0739f3efa3@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAFmlx2QC/43NPQ7DIAwF4KtUzKUC54ekU+9RdYBgEg+BClrUK
 srdSzJ3yPjs588LSxgJE7ueFhYxU6LgS6jOJzZM2o/IyZbMQEAlFEhu48xNJFs2pUCeWzTv0SU
 ujBlkA+AapVk5f0Z09Nnp+6PkidIrxO/+KcttegDNkkvetbJ2TmHXC3sjizoFb4KO9jKEmW12h
 qMeFE+11vV1Vau+hT/euq4/inZWbhcBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4740;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=X0B++9ZJoOGXr2Q9dYZmjqsgjlJ16PlZ4syKyoxQEkU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkx6V3kIlljbcwEkPpF2jYccwrfJf2NhfvfkoG7
 tcqoT6g4/aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMeldwAKCRD6PaqMvJYe
 9XIFEACiIy/bIIupSs7y53f++sShmKTkED5D7Bt5qFAz3fvk2/RehoLljivqMQZLW6S/8hBtRE1
 zR1erINCV0M1cuWBnRZU3NBIOVWOtVo2ZGflzu+5TXNnmp2N447JLwEQtFGumBQ63Pf1MY6+qQv
 IJZazVj8lLFhz607fWrUEAeJ/7B7f2iCc/e8pl+uHSMzcGZ62yhz4/OP6wICuuotSmrhk4JXUtb
 M28p7hoTH5deQciOi6L/SS1Y/4p82eJtsIYtSPMW9z8548Ct+Ud5I4nZYL3F1vO+5ED/jNVYSsK
 UQzzhPso0uQJp40dfnQyA1M/2P1T8vsyR9RZHDSonE8f7cxl9lFiNxeCEc2SJVmjjrLYNbxam22
 yPBJo4bwLtirSTPqHPzmUm/P8r2N1qSSbx0sCStv6Z7a0JIzU/z8opb2T9INuF++AexY7n5C0g6
 r+Kx/o9vvIfui7Oi9dJDDlVMI7E6E2DOKpPBsCNRsTcYKEN9S1jHqps6217Du8vqZ8v5aL1J7uf
 B7rtanVfi6s8VWbQcOOXRm8hRDKd5s7sjVHiKbLjITp7am4TMRmHOdNi7Uc/NNOKaOvFIKgVedg
 dNkvL5gXQClxfCwJ/Crq7TrC5tUQ7PTd8v1wBOnNAMeVGRkDF7InIOaWaWLhUEwvi9CXM79qF/l
 1zlw9L+tVGJhF0A==
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
 drivers/gpu/drm/drm_debugfs.c |  3 +++
 include/drm/drm_bridge.h      |  3 +++
 3 files changed, 52 insertions(+)

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
index a3a488205009..3b1de2c61c89 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -31,6 +31,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_auth.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_client.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
@@ -274,6 +275,8 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		drm_atomic_debugfs_init(minor);
+
+		drm_bridge_debugfs_init(minor);
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index bf964cdfb330..cb10ee108538 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -949,4 +949,7 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
+struct drm_minor;
+void drm_bridge_debugfs_init(struct drm_minor *minor);
+
 #endif

---
base-commit: a0c64d153d687756c8719b8d10e609d62e1cb6fd
change-id: 20230721-drm-bridge-chain-debugfs-0bbc1522f57a

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

