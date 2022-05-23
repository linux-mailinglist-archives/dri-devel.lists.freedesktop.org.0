Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48CF530EC5
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 15:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E73510F66D;
	Mon, 23 May 2022 13:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A8F10F66D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 13:02:36 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id i24so13627567pfa.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DDMJSeyEhz3D8bGy5InCdDzKQ32lo+eZUXii2YT076w=;
 b=SYoS4zFvTiXtdoMfpCOIouQm7bVwMfE6+UlK4HDAtlU3277AH047Ur9x22r05V5pow
 9DBafu+rDDrqZ4wr7PQ3NaEXstFSubiBcJjb0s+Gukf+htgc0+zHXf3e+IUiL/+nVQR2
 ZQ4AWIqsVFyttV9JF0c73CazcawkwE5OzrCJllCj7o8MDHd2TCNkThwa0ci/vm1Le2EO
 ldZvmd6H4kQabjMegLcnFMGx/y11KMsjKXTcTho3xDc2yGkl1E69QHblnYlqSePLtw7Z
 eqmzYpdyg3V9Qnj8QwKEgp/vWwdLCbltz3g5CK5ZtqheawxjxXWCYi457kfWpHOwPkWo
 Z7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DDMJSeyEhz3D8bGy5InCdDzKQ32lo+eZUXii2YT076w=;
 b=Asv/pO0uSZoga91lORQ/pjcXOVzDNT3AuVtdIpkeLT0Z1UuOGVSg/gVJK0mMgKifgR
 CxewpCuKkTm+BUtA5Oi+eVw3SCdeHU4Dm40wEufFH2GYRgtHc1/DHzlvOmU9Sjyhd6Ww
 B8UnVSnjsBCPhJLGWhS4MOu7MMK2ssPZ6rew+XDxoMnbF65UGhG6ruFf9oTlM2ZiGrLH
 Y75CzSuqUXU0c9uBmTMP1Fy+4Fefyez8Iptvc9HH68nFUGfkhhPb63+0YSwWuW16aHeo
 tUZ64P73xmIrp1LK97TuHbLQ9Gz/utq1RChlrmRag6vv6/dhEPFeal3aOHFS6Ng4oZc9
 u1/g==
X-Gm-Message-State: AOAM533yoOO3fueLclRpoqez1WWk4+HEZqlFhgi7ltp7sG++o7E97QpY
 9vgeGMu1Fql3akTUjTFHoPpMbUhCnhBX8yLL
X-Google-Smtp-Source: ABdhPJyP+rcgfnE++8labjEMCnSV+ws14gytPrT5o3etY2G6nnehd2OCtnI6uORIs7/BS9FFYiU+1A==
X-Received: by 2002:a05:6a00:2d0:b0:518:95f8:d00a with SMTP id
 b16-20020a056a0002d000b0051895f8d00amr7304351pft.8.1653310955804; 
 Mon, 23 May 2022 06:02:35 -0700 (PDT)
Received: from 167-179-157-192.a7b39d.syd.nbn.aussiebb.net
 (167-179-157-192.a7b39d.syd.nbn.aussiebb.net. [167.179.157.192])
 by smtp.gmail.com with ESMTPSA id
 v22-20020aa78096000000b0050dc76281d0sm7380271pff.170.2022.05.23.06.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 06:02:35 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: bridge: icn6211: Adjust clock phase using SYS_CTRL_1
Date: Mon, 23 May 2022 23:01:44 +1000
Message-Id: <20220523130144.444225-1-net147@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, Jonathan Liu <net147@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code from [1] sets SYS_CTRL_1 to different values depending on the
desired clock phase (0, 1/4, 1/2 or 3/4). A clock phase of 0 aligns the
positive edge of the clock with the pixel data while other values delay
the clock by a fraction of the clock period. A clock phase of 1/2 aligns
the negative edge of the clock with the pixel data.

The driver currently hard codes SYS_CTRL_1 to 0x88 which corresponds to
aligning the positive edge of the clock with the pixel data. This won't
work correctly for panels that require aligning the negative edge of the
clock with the pixel data.

Adjust the clock phase to 0 if DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE is
present in bus_flags, otherwise adjust the clock phase to 1/2 as
appropriate for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE.

[1] https://github.com/tdjastrzebski/ICN6211-Configurator

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
V2: Use GENMASK and FIELD_PREP macros
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 47dea657a752..f1538fb5f8a9 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -9,6 +9,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_mipi_dsi.h>
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -26,6 +28,11 @@
 #define PD_CTRL(n)		(0x0a + ((n) & 0x3)) /* 0..3 */
 #define RST_CTRL(n)		(0x0e + ((n) & 0x1)) /* 0..1 */
 #define SYS_CTRL(n)		(0x10 + ((n) & 0x7)) /* 0..4 */
+#define SYS_CTRL_1_CLK_PHASE_MSK	GENMASK(5, 4)
+#define CLK_PHASE_0			0
+#define CLK_PHASE_1_4			1
+#define CLK_PHASE_1_2			2
+#define CLK_PHASE_3_4			3
 #define RGB_DRV(n)		(0x18 + ((n) & 0x3)) /* 0..3 */
 #define RGB_DLY(n)		(0x1c + ((n) & 0x1)) /* 0..1 */
 #define RGB_TEST_CTRL		0x1e
@@ -336,7 +343,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	const struct drm_bridge_state *bridge_state;
 	u16 hfp, hbp, hsync;
 	u32 bus_flags;
-	u8 pol, id[4];
+	u8 pol, sys_ctrl_1, id[4];
 
 	chipone_readb(icn, VENDOR_ID, id);
 	chipone_readb(icn, DEVICE_ID_H, id + 1);
@@ -414,7 +421,14 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	chipone_configure_pll(icn, mode);
 
 	chipone_writeb(icn, SYS_CTRL(0), 0x40);
-	chipone_writeb(icn, SYS_CTRL(1), 0x88);
+	sys_ctrl_1 = 0x88;
+
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
+		sys_ctrl_1 |= FIELD_PREP(SYS_CTRL_1_CLK_PHASE_MSK, CLK_PHASE_0);
+	else
+		sys_ctrl_1 |= FIELD_PREP(SYS_CTRL_1_CLK_PHASE_MSK, CLK_PHASE_1_2);
+
+	chipone_writeb(icn, SYS_CTRL(1), sys_ctrl_1);
 
 	/* icn6211 specific sequence */
 	chipone_writeb(icn, MIPI_FORCE_0, 0x20);
-- 
2.36.1

