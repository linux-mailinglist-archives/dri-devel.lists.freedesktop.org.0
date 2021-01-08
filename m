Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9332EF07A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 11:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FC889C6E;
	Fri,  8 Jan 2021 10:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0D089C6E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 10:13:46 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kxom8-0007zY-HY; Fri, 08 Jan 2021 11:13:44 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/modes: add non-OF stub for of_get_drm_display_mode
Date: Fri,  8 Jan 2021 11:13:43 +0100
Message-Id: <20210108101343.23695-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If CONFIG_OF is disabled, of_get_drm_display_mode is not compiled in,
and drivers using it fail to build:

  ld: drivers/gpu/drm/imx/parallel-display.o: in function `imx_pd_connector_get_modes':
  parallel-display.c:(.text+0x8d): undefined reference to `of_get_drm_display_mode'

Add an inline stub so they can be build-tested with non-OF
configurations.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 include/drm/drm_modes.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index a0d79d1c51e2..29ba4adf0c53 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -461,9 +461,19 @@ void drm_display_mode_from_videomode(const struct videomode *vm,
 void drm_display_mode_to_videomode(const struct drm_display_mode *dmode,
 				   struct videomode *vm);
 void drm_bus_flags_from_videomode(const struct videomode *vm, u32 *bus_flags);
+
+#if defined(CONFIG_OF)
 int of_get_drm_display_mode(struct device_node *np,
 			    struct drm_display_mode *dmode, u32 *bus_flags,
 			    int index);
+#else
+static inline int of_get_drm_display_mode(struct device_node *np,
+					  struct drm_display_mode *dmode,
+					  u32 *bus_flags, int index)
+{
+	return -EINVAL;
+}
+#endif
 
 void drm_mode_set_name(struct drm_display_mode *mode);
 int drm_mode_vrefresh(const struct drm_display_mode *mode);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
