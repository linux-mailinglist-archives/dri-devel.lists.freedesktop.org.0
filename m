Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72CA56D89B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 10:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB01D11239E;
	Mon, 11 Jul 2022 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C97311239E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8TJ5g
 uUkS/bak50CUHzprPyBkbWeqAk8A3fP1ZoqSUo=; b=nKcYh12jhL4mdMYOSpzJ0
 FVOAtPIvWjE2RNN+D+mj4mrJ1n0809LcblDAI2E6wDPCGmL65DwLF3JYa7MNis6h
 XwOyN22Mdur4lDUcME9YfkoQ5VTVOTYnciAthffPf+nOtbCd7GLcQmjnSC5N5MAT
 higFX5sdQV7p5lfRosBM/U=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp10 (Coremail) with SMTP id NuRpCgDXIXYn48tixiSkGQ--.55101S2;
 Mon, 11 Jul 2022 16:45:28 +0800 (CST)
From: Liang He <windhl@126.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 sam@ravnborg.org, windhl@126.com
Subject: [PATCH] drm/mipi-dsi: Fix device_node's refcount bugs
Date: Mon, 11 Jul 2022 16:45:26 +0800
Message-Id: <20220711084526.360000-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgDXIXYn48tixiSkGQ--.55101S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXrWxtF4fCrW8GrWDKr4DArb_yoW5KFyUpF
 W5G343Zry8trsYkrWjvF4kZFyYg3W2qayruFn7G3W3CwsrA34Utr1vyFy5Gas8JrWxAF1Y
 qFn7J347u3WkZr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMRRRUUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgk7F18RPePAewAAsA
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

In mipi_dsi_device_register_full(), we should call of_node_get()
when a new reference is created in to dsi->dev.of_node(), and call
of_node_put() in fail path or when it is not used anymore in *_unregister().

The reasons to commit this patch as folllow:

(1) There are totally 16 locations to call (devm_)mipi_dsi_device_register_full()
in current version of kernel source code (5.19rc2), and 13 of them pass 'NULL'
to the function.

(2) Three other call sites have different manners as follow:

 <1> ./drm/drm_mipi_dsi.c/of_mipi_dsi_device_add() calls
      of_node_get() before pass the reference into above register func.
 <2> ./drm/panel/panel-raspberrypi-touchscreen.c/rpi_touchscreen_probe()
     calls of_graph_get_remote_port() to get the referenece with refcount
     incremented before pass it into above register func.
 <3> ./drm/panel/panel-novatek-nt35950.c/nt35950_probe() directly use
     the reference without any refcounting to call above register func.

(3) So it is better to move refcounting into register func and also add
the corresponding of_node_put() into in fail path and *_unregister func.

Fixes: c63ae8a9686b ("drm/dsi: Use mipi_dsi_device_register_full() for DSI device creation")
Signed-off-by: Liang He <windhl@126.com>
---
 
I have noticed that the of_node_get() is moved into
of_mipi_dsi_device_add() which then call above register func in commit-c63ae8a9686b.
However, as there are different ways to directly call the register, I think it
is better to move the refcounting back into it. Please check it carefully.

 drivers/gpu/drm/drm_mipi_dsi.c                        | 6 ++++--
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..856ecb3bcecb 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -173,7 +173,7 @@ of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
 	}
 
 	info.channel = reg;
-	info.node = of_node_get(node);
+	info.node = node;
 
 	return mipi_dsi_device_register_full(host, &info);
 }
@@ -221,12 +221,13 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 		return dsi;
 	}
 
-	dsi->dev.of_node = info->node;
+	dsi->dev.of_node = of_node_get(info->node);
 	dsi->channel = info->channel;
 	strlcpy(dsi->name, info->type, sizeof(dsi->name));
 
 	ret = mipi_dsi_device_add(dsi);
 	if (ret) {
+		of_node_put(dsi->dev.of_node);
 		drm_err(host, "failed to add DSI device %d\n", ret);
 		kfree(dsi);
 		return ERR_PTR(ret);
@@ -242,6 +243,7 @@ EXPORT_SYMBOL(mipi_dsi_device_register_full);
  */
 void mipi_dsi_device_unregister(struct mipi_dsi_device *dsi)
 {
+	of_node_put(dsi->dev.of_node);
 	device_unregister(&dsi->dev);
 }
 EXPORT_SYMBOL(mipi_dsi_device_unregister);
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 145047e19394..9622f903d4c2 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -424,6 +424,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c,
 	of_node_put(endpoint);
 
 	ts->dsi = mipi_dsi_device_register_full(host, &info);
+	of_node_put(info.node);
 	if (IS_ERR(ts->dsi)) {
 		dev_err(dev, "DSI device registration failed: %ld\n",
 			PTR_ERR(ts->dsi));
-- 
2.25.1

