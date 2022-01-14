Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9D48E309
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB68910EB68;
	Fri, 14 Jan 2022 03:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150CD10E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:48:59 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5940F831F0;
 Fri, 14 Jan 2022 04:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132137;
 bh=U0Cfmf1X0f2WI+QDwAot8B5V/dBaKDJlN92XUURFPXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QS4xqjgY2Le6SRT9/H0xXfn70NJxBgFDwFMb5m1nze927KFsJp/I1MpvPis9fsASB
 KYfXhZtUSRQfyrdwdr1DP8FQYBuiFWsaLPUr3B3KbmDajVBY3pqQLHWnDk+Nxw2R93
 cMHOlnYHJlZErTYCwEQCtsmFwH52r7ijwuTUTa/DGj+nhCZO6BrYrA5XRKGc9NnPbS
 yc0Z9ZAJCS/khQL+Hu0ld3sKteKRDc2/BkstUrpcYE4d8IHRzXkqYoWL2vLN2iBtzW
 4KknHSkk5Nw+NgwL4YdXs34TQmjVW8PLGzQ4RDWPdd25AcAfmIxGql776gnuUTXCUb
 QvLCEhlmo8vRA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/14] drm: bridge: icn6211: Switch to atomic operations
Date: Fri, 14 Jan 2022 04:48:27 +0100
Message-Id: <20220114034838.546267-3-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the atomic version of the enable/disable operations to continue
the transition to the atomic API, started with the introduction of
.atomic_get_input_bus_fmts(). This will be needed to access the mode
from the atomic state.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index d7eedf35e8415..dc909e7ceb958 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -4,6 +4,7 @@
  * Author: Jagan Teki <jagan@amarulasolutions.com>
  */
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_mipi_dsi.h>
@@ -164,7 +165,8 @@ static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
 		chipone_dsi_write(icn, d, ARRAY_SIZE(d));	\
 	}
 
-static void chipone_enable(struct drm_bridge *bridge)
+static void chipone_atomic_enable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 	struct drm_display_mode *mode = bridge_to_mode(bridge);
@@ -223,7 +225,8 @@ static void chipone_enable(struct drm_bridge *bridge)
 	usleep_range(10000, 11000);
 }
 
-static void chipone_pre_enable(struct drm_bridge *bridge)
+static void chipone_atomic_pre_enable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 	int ret;
@@ -254,7 +257,8 @@ static void chipone_pre_enable(struct drm_bridge *bridge)
 	usleep_range(10000, 11000);
 }
 
-static void chipone_post_disable(struct drm_bridge *bridge)
+static void chipone_atomic_post_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 
@@ -279,9 +283,12 @@ static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flag
 
 static const struct drm_bridge_funcs chipone_bridge_funcs = {
 	.attach = chipone_attach,
-	.post_disable = chipone_post_disable,
-	.pre_enable = chipone_pre_enable,
-	.enable = chipone_enable,
+	.atomic_post_disable = chipone_atomic_post_disable,
+	.atomic_pre_enable = chipone_atomic_pre_enable,
+	.atomic_enable = chipone_atomic_enable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static int chipone_parse_dt(struct chipone *icn)
-- 
2.34.1

