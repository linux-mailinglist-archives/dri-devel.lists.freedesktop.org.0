Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641225B33D8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02B510EC45;
	Fri,  9 Sep 2022 09:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700D410EC45
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 09:30:03 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWaKn-0003dp-G6; Fri, 09 Sep 2022 11:30:01 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fourcc: add Vivante tile status modifiers
Date: Fri,  9 Sep 2022 11:30:00 +0200
Message-Id: <20220909093000.3458413-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tile status modifiers can be combined with all of the usual
color buffer modifiers. When they are present an additional plane
is added to the surfaces to share the tile status buffer. The
TS modifiers describe the interpretation of the tag bits in this
buffer.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 include/uapi/drm/drm_fourcc.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0980678d502d..93b022498900 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -718,6 +718,35 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED fourcc_mod_code(VIVANTE, 4)
 
+/*
+ * Vivante TS (tile-status) buffer modifiers. They can be combined with all of
+ * the color buffer tiling modifiers defined above. When TS is present it's a
+ * separate buffer containing the clear/compression status of each tile. The
+ * modifiers are defined as VIVANTE_MOD_TS_c_s, where c is the color buffer
+ * tile size in bytes covered by one entry in the status buffer and s is the
+ * number of status bits per entry.
+ * We reserve the top 8 bits of the Vivante modifier space for tile status
+ * clear/compression modifiers, as future cores might add some more TS layout
+ * variations.
+ */
+#define VIVANTE_MOD_TS_64_4               (1ULL << 48)
+#define VIVANTE_MOD_TS_64_2               (2ULL << 48)
+#define VIVANTE_MOD_TS_128_4              (3ULL << 48)
+#define VIVANTE_MOD_TS_256_4              (4ULL << 48)
+#define VIVANTE_MOD_TS_MASK               (0xfULL << 48)
+
+/*
+ * Vivante compression modifiers. Those depend on a TS modifier being present
+ * as the TS bits get reinterpreted as compression tags instead of simple
+ * clear markers when compression is enabled.
+ */
+#define VIVANTE_MOD_COMP_DEC400           (1ULL << 52)
+#define VIVANTE_MOD_COMP_MASK             (0xfULL << 52)
+
+/* Masking out the extension bits will yield the base modifier. */
+#define VIVANTE_MOD_EXT_MASK              (VIVANTE_MOD_TS_MASK | \
+                                           VIVANTE_MOD_COMP_MASK)
+
 /* NVIDIA frame buffer modifiers */
 
 /*
-- 
2.30.2

