Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F166DAE913A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 00:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C09510E245;
	Wed, 25 Jun 2025 22:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="InfMjCFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E3B10E245
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750891565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cOrJ0BWmzHP1S8qZkg+9YGmlzCtKwaBoQZ0rsm3ib5U=;
 b=InfMjCFHRPY5yicrn2LbHGX10DpLM9H+AqavUHUtgBLc6V6iL7ugOX1DGl8U9zcuUQddax
 5wNUun29esQtBHyNlvzDAgpRq0VQfPmZhsQNKvKGyleTxvCzNZu5LZBsNsu1V24ykqp+xD
 ccKDVSRaCT9XbNHde9XNOHA5UQH+25o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-_XCgAn6hO-qAjMP2R-ffBA-1; Wed,
 25 Jun 2025 18:46:02 -0400
X-MC-Unique: _XCgAn6hO-qAjMP2R-ffBA-1
X-Mimecast-MFC-AGG-ID: _XCgAn6hO-qAjMP2R-ffBA_1750891560
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D0D641800268; Wed, 25 Jun 2025 22:45:59 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.179])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 678C819560A3; Wed, 25 Jun 2025 22:45:56 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 25 Jun 2025 17:44:44 -0500
Subject: [PATCH v2] panel/simple-simple: Identify simple DPI panels using
 .compatible field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-b4-simple-panel-regression-v2-1-9422d46917ac@redhat.com>
X-B4-Tracking: v=1; b=H4sIANt7XGgC/42NSw6CUAxFt0I6toZXQdCR+zAMChRowi99hGgIe
 /fBChyek9xzN/BiKh6e0QYmq3qdxgB0iaDqeGwFtQ4MFFMa3ynBMkGvw9wLzjxKjyatiT9mmLP
 cSqacGiEIgdmk0c8ZfxeBO/XLZN/za3WH/Su7OnTIKdfNgzirXPYyqTtertU0QLHv+w+DY4nrx
 QAAAA==
X-Change-ID: 20250624-b4-simple-panel-regression-8ae3ba282fe2
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750891486; l=8509;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=KpQBq8cTWgHBNZDDJpzS8CHdL8OOqHXQA7o9ZDYM6RI=;
 b=Sb9YHTyGFNODaxRqP+TJOHaOR6GP9g6wYOLczCx6IdQblOZgshlmv7RxFrrPsCaLkNa2hu5jJ
 Ej11NK7/wPwDpH86OsX/KG8pDTE0WdYm/NXh/ow7Dt4DaujUDScVYVE
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

The panel allocation in panel_simple_probe() breaks due to not having
the panel desc for DPI panels. DPI panels gets probed much later.

Currently driver is checking for desc == &panel_dpi to do the DPI
specific panel desc allocations. This looks hacky.

This patch does the following:

- Rename panel_dpi_probe() to panel_dpi_get_desc() and call it before
panel allocation. panel_dpi_get_desc() returns a panel desc unlike
panel_dpi_probe() which returned an int. This way driver has a known
connector type while allocating the panel.
- panel_dpi_get_desc() returns a panel desc
- Add a simple helper is_panel_dpi() to identify a simple DPI panel from
a simple panel based on .compatible field

Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Suggested-by: Maxime Ripard <mripard@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>
Reported-by: Francesco Dolcini <francesco@dolcini.it>
Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Seeing the below trace due to the changes introduced by:
Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")

[   12.089274] ------------[ cut here ]------------
[   12.089303] WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0xac/0xb8
[   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa gpu_sched panel_simple imx6_media(C) imx_media_common
(C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6 autofs4
[   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted: G         C          6.16.0-rc1+ #1 PREEMPT
[   12.157446] Tainted: [C]=CRAP
[   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   12.166953] Workqueue: events_unbound deferred_probe_work_func
[   12.172805] Call trace:
[   12.172815]  unwind_backtrace from show_stack+0x10/0x14
[   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
[   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
[   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
[   12.195567]  warn_slowpath_fmt from devm_drm_of_get_bridge+0xac/0xb8
[   12.201949]  devm_drm_of_get_bridge from imx_pd_probe+0x58/0x164
[   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
[   12.213220]  platform_probe from really_probe+0xd0/0x3a4
[   12.218551]  really_probe from __driver_probe_device+0x8c/0x1d4
[   12.224486]  __driver_probe_device from driver_probe_device+0x30/0xc0
[   12.230942]  driver_probe_device from __device_attach_driver+0x98/0x10c
[   12.237572]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
[   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1c8
[   12.249614]  __device_attach from bus_probe_device+0x88/0x8c
[   12.255285]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
[   12.261739]  deferred_probe_work_func from process_one_work+0x154/0x2dc
[   12.268371]  process_one_work from worker_thread+0x250/0x3f0
[   12.274043]  worker_thread from kthread+0x12c/0x24c
[   12.278940]  kthread from ret_from_fork+0x14/0x28
[   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
[   12.288720] 9fa0:                                     00000000 00000000 00000000 00000000
[   12.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   12.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   12.312050] ---[ end trace 0000000000000000 ]---
---
Changes in v2:
- Add the "Reported-by" and "Closes" tags.
- change the compatible with panel-dpi instead of previously used
panel_dpi (Luca).
- remove DPI entry in platform_of_match() the global panel_desc panel_dpi
declaration (Luca).
- Edit commit message (Maxime)
- Avoid returning NULL, instead return ERR_PTR in panel_dpi_get_desc()
- Link to v1: https://lore.kernel.org/r/20250624-b4-simple-panel-regression-v1-1-a5adf92a7c17@redhat.com
---
v2:
- Add the "Reported-by" and "Closes" tags.
- change the compatible with panel-dpi instead of previously used
panel_dpi (Luca).
- remove DPI entry in platform_of_match() the global panel_desc panel_dpi
declaration (Luca).
- Edit commit message (Maxime)
- Avoid returning NULL, instead return ERR_PTR in panel_dpi_get_desc()
---
 drivers/gpu/drm/panel/panel-simple.c | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0a3b26bb4d731c54614e24e38018c308acd5367a..aace1c7d17bdb3c2a0ebd36d164a858877c2c4c2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -26,6 +26,7 @@
 #include <linux/i2c.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -430,10 +431,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_timings = panel_simple_get_timings,
 };
 
-static struct panel_desc panel_dpi;
-
-static int panel_dpi_probe(struct device *dev,
-			   struct panel_simple *panel)
+static struct panel_desc *panel_dpi_get_desc(struct device *dev)
 {
 	struct display_timing *timing;
 	const struct device_node *np;
@@ -445,17 +443,17 @@ static int panel_dpi_probe(struct device *dev,
 	np = dev->of_node;
 	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
 	if (!desc)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	timing = devm_kzalloc(dev, sizeof(*timing), GFP_KERNEL);
 	if (!timing)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	ret = of_get_display_timing(np, "panel-timing", timing);
 	if (ret < 0) {
 		dev_err(dev, "%pOF: no panel-timing node found for \"panel-dpi\" binding\n",
 			np);
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	desc->timings = timing;
@@ -473,9 +471,7 @@ static int panel_dpi_probe(struct device *dev,
 	/* We do not know the connector for the DT node, so guess it */
 	desc->connector_type = DRM_MODE_CONNECTOR_DPI;
 
-	panel->desc = desc;
-
-	return 0;
+	return desc;
 }
 
 #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
@@ -570,6 +566,15 @@ static int panel_simple_override_nondefault_lvds_datamapping(struct device *dev,
 	return 0;
 }
 
+static bool is_panel_dpi(struct device *dev)
+{
+	const struct of_device_id *match;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+
+	return strcmp(match->compatible, "panel-dpi");
+}
+
 static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 {
 	struct panel_simple *panel;
@@ -579,6 +584,13 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	u32 bus_flags;
 	int err;
 
+	/* Is this simple panel a DPI panel */
+	if (is_panel_dpi(dev)) {
+		desc = panel_dpi_get_desc(dev);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+	}
+
 	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
 				     &panel_simple_funcs, desc->connector_type);
 	if (IS_ERR(panel))
@@ -611,16 +623,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 			return -EPROBE_DEFER;
 	}
 
-	if (desc == &panel_dpi) {
-		/* Handle the generic panel-dpi binding */
-		err = panel_dpi_probe(dev, panel);
-		if (err)
-			goto free_ddc;
-		desc = panel->desc;
-	} else {
-		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
-			panel_simple_parse_panel_timing_node(dev, panel, &dt);
-	}
+	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
+		panel_simple_parse_panel_timing_node(dev, panel, &dt);
 
 	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
 		/* Optional data-mapping property for overriding bus format */
@@ -5364,10 +5368,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "microchip,ac69t88a",
 		.data = &mchp_ac69t88a,
-	}, {
-		/* Must be the last entry */
-		.compatible = "panel-dpi",
-		.data = &panel_dpi,
 	}, {
 		/* sentinel */
 	}

---
base-commit: 10357824151262636fda879845f8b64553541106
change-id: 20250624-b4-simple-panel-regression-8ae3ba282fe2

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

