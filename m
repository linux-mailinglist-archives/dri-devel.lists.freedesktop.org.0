Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9D7A93B1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C8D10E5B4;
	Thu, 21 Sep 2023 10:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B02910E5B4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:51:08 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C2DBB75;
 Thu, 21 Sep 2023 12:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695293369;
 bh=GtelloX72BG0KpOKNT08ravq8i4jklKRI0NqaQwnfmY=;
 h=From:Date:Subject:To:Cc:From;
 b=b3dK9v+1Zms30TB3W9ZPNRpNm5qpTHgSNMOGzHKiqCQc9UPaAsN49na3FtZvl2CjH
 eML8+Pi15aqegXktXe3pgrCrkvQrgyR1sGcH4Y+iB84PoHQPhTb0KVb9h1P6Dfl+CH
 xWicZQTB1agftUc9lyqIprMKP1Yv3JdarfOlwvf8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 21 Sep 2023 13:50:32 +0300
Subject: [PATCH] drm/mipi-dsi: Fix detach call without attach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-dsi-detach-fix-v1-1-d0de2d1621d9@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAPcfDGUC/x2MywqAIBAAf0X23IKPyOpXooPlmnux0Igg+vek4
 wzMPFAoMxUYxQOZLi68pwqqEbBGlzZC9pVBS23koBX6wujpdGvEwDd21nTBurZfnIUaHZmq/of
 T/L4ffU4YumAAAAA=
To: "H. Nikolaus Schaller" <hns@goldelico.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4464;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GtelloX72BG0KpOKNT08ravq8i4jklKRI0NqaQwnfmY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlDCAYl+B54Nb5SeNh3o0z42dOJKO+9qwZHo/FL
 m+U3tupsPGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZQwgGAAKCRD6PaqMvJYe
 9Td5D/9tSIAGMyzurWvslVtJRJCj7Dcqji/ukpDthj6E/e4KjnAasDqROAqhNno0V/nudEOMnks
 796BQ9cbAZ9st10LecAKAQiRWeBE8MgRR1FE4D0k7C9jKNA+3jv4auS3/UCOMyTHPFzklS/cInf
 5tYJMQ4Myaep6L9xUq3/SozRtMo1ZY+2CRaHI8bmUkgzW7rXWiEt5I8vXB6wn0QDNmATR2/Atia
 sh7c55ybOSQS06kDI1+kjCmGODn9TDwlP347/doOkrFHWUuMvQzfoMoasS+VJ/Oa0Co/TtVuzcl
 yF4Idlzf5nLo6qkn6J+pqY+rc4GKMnb45h8A5awKEeLttJ8KV0sOSgUqYbhm9atoBhkyiBj6HiL
 TmJ9GSwqr15NQ5Jzr+jKvcEoUpH73Z6WfWgBbrFINC2olgGcyupivgUThLcHtA6HHU78bUiBy/J
 TnrTMNvmGVQhVTphX0RpuXh0+r55Yl3+3rspSL+I0dvuLPBURTI02tm+3hcQ2tvGWZVLwzGQY2J
 lgCn6jl3pirW0urqBk/RzdvtbIZcCNPYvz9slsZsYal+DQK1iRlqsQMSF4aW2tjwTfTt//0MxFB
 8JbEXyTUhUpW7fZc26ZiGFjA4CcauKylXHzOXWHwE9TfTCc7n6Qi03L9VGV9lJ5xWz3JHe8l1Dq
 u2XpRVgTbdN4dkw==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's been reported that DSI host driver's detach can be called without
the attach ever happening:

https://lore.kernel.org/all/20230412073954.20601-1-tony@atomide.com/

After reading the code, I think this is what happens:

We have a DSI host defined in the device tree and a DSI peripheral under
that host (i.e. an i2c device using the DSI as data bus doesn't exhibit
this behavior).

The host driver calls mipi_dsi_host_register(), which causes (via a few
functions) mipi_dsi_device_add() to be called for the DSI peripheral. So
now we have a DSI device under the host, but attach hasn't been called.

Normally the probing of the devices continues, and eventually the DSI
peripheral's driver will call mipi_dsi_attach(), attaching the
peripheral.

However, if the host driver's probe encounters an error after calling
mipi_dsi_host_register(), and before the peripheral has called
mipi_dsi_attach(), the host driver will do cleanups and return an error
from its probe function. The cleanups include calling
mipi_dsi_host_unregister().

mipi_dsi_host_unregister() will call two functions for all its DSI
peripheral devices: mipi_dsi_detach() and mipi_dsi_device_unregister().
The latter makes sense, as the device exists, but the former may be
wrong as attach has not necessarily been done.

To fix this, track the attached state of the peripheral, and only detach
from mipi_dsi_host_unregister() if the peripheral was attached.

Note that I have only tested this with a board with an i2c DSI
peripheral, not with a "pure" DSI peripheral.

However, slightly related, the unregister machinery still seems broken.
E.g. if the DSI host driver is unbound, it'll detach and unregister the
DSI peripherals. After that, when the DSI peripheral driver unbound
it'll call detach either directly or using the devm variant, leading to
a crash. And probably the driver will crash if it happens, for some
reason, to try to send a message via the DSI bus.

But that's another topic.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 17 +++++++++++++++--
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 14201f73aab1..843a6dbda93a 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -347,7 +347,8 @@ static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 
-	mipi_dsi_detach(dsi);
+	if (dsi->attached)
+		mipi_dsi_detach(dsi);
 	mipi_dsi_device_unregister(dsi);
 
 	return 0;
@@ -370,11 +371,18 @@ EXPORT_SYMBOL(mipi_dsi_host_unregister);
 int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 {
 	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
+	int ret;
 
 	if (!ops || !ops->attach)
 		return -ENOSYS;
 
-	return ops->attach(dsi->host, dsi);
+	ret = ops->attach(dsi->host, dsi);
+	if (ret)
+		return ret;
+
+	dsi->attached = true;
+
+	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_attach);
 
@@ -386,9 +394,14 @@ int mipi_dsi_detach(struct mipi_dsi_device *dsi)
 {
 	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
 
+	if (WARN_ON(!dsi->attached))
+		return -EINVAL;
+
 	if (!ops || !ops->detach)
 		return -ENOSYS;
 
+	dsi->attached = false;
+
 	return ops->detach(dsi->host, dsi);
 }
 EXPORT_SYMBOL(mipi_dsi_detach);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c9df0407980c..c0aec0d4d664 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -168,6 +168,7 @@ struct mipi_dsi_device_info {
  * struct mipi_dsi_device - DSI peripheral device
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
+ * @attached: the DSI device has been successfully attached
  * @name: DSI peripheral chip type
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
@@ -184,6 +185,7 @@ struct mipi_dsi_device_info {
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
 	struct device dev;
+	bool attached;
 
 	char name[DSI_DEV_NAME_SIZE];
 	unsigned int channel;

---
base-commit: 9fc75c40faa29df14ba16066be6bdfaea9f39ce4
change-id: 20230921-dsi-detach-fix-6736f7a48ba7

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

