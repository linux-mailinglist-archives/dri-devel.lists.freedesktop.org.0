Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE6F4AB057
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 16:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1FB10E270;
	Sun,  6 Feb 2022 15:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF2410E1A9
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 15:44:24 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id cca9bdfd-8763-11ec-b20b-0050568c148b;
 Sun, 06 Feb 2022 15:45:24 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 859CB194BCE;
 Sun,  6 Feb 2022 16:44:22 +0100 (CET)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 2/9] drm: add drm specific media-bus-format header file
Date: Sun,  6 Feb 2022 16:43:58 +0100
Message-Id: <20220206154405.1243333-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206154405.1243333-1-sam@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For now the header file includes a single method to retreive the bpc
from the bus format.
The supported MEDIA_BUS_* codes are the ones used for the current panels
in DRM. The list can be extended as there are a need for more formats.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/drm/media-bus-format.h | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 include/drm/media-bus-format.h

diff --git a/include/drm/media-bus-format.h b/include/drm/media-bus-format.h
new file mode 100644
index 000000000000..d4d18f19a70f
--- /dev/null
+++ b/include/drm/media-bus-format.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Sam Ravnborg
+ */
+
+#ifndef __LINUX_DRM_MEDIA_BUS_FORMAT
+#define __LINUX_DRM_MEDIA_BUS_FORMAT
+
+#include <linux/bug.h>
+#include <linux/media-bus-format.h>
+#include <linux/types.h>
+
+/**
+ * media_bus_format_to_bpc - The bits per color channel for the bus_format
+ *
+ * Based on the supplied bus_format return the maximum number of bits
+ * per color channel.
+ *
+ * RETURNS
+ * The number of bits per color channel, or -EINVAL if the bus_format
+ * is unknown.
+ */
+static inline int media_bus_format_to_bpc(u32 bus_format)
+{
+	switch (bus_format) {
+	/* DPI */
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		return 6;
+
+	/* DPI */
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_3X8:
+	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
+	case MEDIA_BUS_FMT_Y8_1X8:
+		return 8;
+
+     	/* LVDS */
+	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
+		return 6;
+
+     	/* LVDS */
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		return 8;
+
+	default:
+		WARN(1, "Unknown MEDIA_BUS format %d\n", bus_format);
+		return -EINVAL;
+	}
+}
+
+#endif
-- 
2.32.0

