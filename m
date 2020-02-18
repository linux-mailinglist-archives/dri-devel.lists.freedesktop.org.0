Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D54162922
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 16:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E146E31E;
	Tue, 18 Feb 2020 15:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD20E6E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 15:15:08 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 60826294266;
 Tue, 18 Feb 2020 15:15:07 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: Fix the bridge kernel doc
Date: Tue, 18 Feb 2020 16:15:03 +0100
Message-Id: <20200218151503.595825-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
introduced new helpers and hooks but the kernel was slightly broken.
Fix that now.

v2:
* Fix the drm_atomic_add_encoder_bridges() doc

Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_atomic.c |  5 +++--
 include/drm/drm_atomic.h     |  2 +-
 include/drm/drm_bridge.h     | 15 ++++++++-------
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 65c46ed049c5..9ccfbf213d72 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1098,8 +1098,9 @@ EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
  *
  * This function adds all bridges attached to @encoder. This is needed to add
  * bridge states to @state and make them available when
- * &bridge_funcs.atomic_{check,pre_enable,enable,disable_post_disable}() are
- * called
+ * &drm_bridge_funcs.atomic_check(), &drm_bridge_funcs.atomic_pre_enable(),
+ * &drm_bridge_funcs.atomic_enable(),
+ * &drm_bridge_funcs.atomic_disable_post_disable() are called.
  *
  * Returns:
  * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 52d65a055491..7b6cb4774e7d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1016,7 +1016,7 @@ struct drm_bus_cfg {
 	 * @format: format used on this bus (one of the MEDIA_BUS_FMT_* format)
 	 *
 	 * This field should not be directly modified by drivers
-	 * (&drm_atomic_bridge_chain_select_bus_fmts() takes care of the bus
+	 * (drm_atomic_bridge_chain_select_bus_fmts() takes care of the bus
 	 * format negotiation).
 	 */
 	u32 format;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 45626ecf20f8..999faaaab9a1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -349,9 +349,9 @@ struct drm_bridge_funcs {
 	 * Duplicate the current bridge state object (which is guaranteed to be
 	 * non-NULL).
 	 *
-	 * The atomic_duplicate_state() is optional. When not implemented the
-	 * core allocates a drm_bridge_state object and calls
-	 * &__drm_atomic_helper_bridge_duplicate_state() to initialize it.
+	 * The atomic_duplicate_state() hook is optional. When not implemented
+	 * the core allocates a drm_bridge_state object and calls
+	 * __drm_atomic_helper_bridge_duplicate_state() to initialize it.
 	 *
 	 * RETURNS:
 	 * A valid drm_bridge_state object or NULL if the allocation fails.
@@ -407,11 +407,11 @@ struct drm_bridge_funcs {
 	 * Formats listed in the returned array should be listed in decreasing
 	 * preference order (the core will try all formats until it finds one
 	 * that works). When the format is not supported NULL should be
-	 * returned and *num_output_fmts should be set to 0.
+	 * returned and num_output_fmts should be set to 0.
 	 *
 	 * This method is called on all elements of the bridge chain as part of
 	 * the bus format negotiation process that happens in
-	 * &drm_atomic_bridge_chain_select_bus_fmts().
+	 * drm_atomic_bridge_chain_select_bus_fmts().
 	 * This method is optional. When not implemented, the core will bypass
 	 * bus format negotiation on this element of the bridge without
 	 * failing, and the previous element in the chain will be passed
@@ -478,9 +478,10 @@ struct drm_bridge_funcs {
 	 *
 	 * Note that the atomic_reset() semantics is not exactly matching the
 	 * reset() semantics found on other components (connector, plane, ...).
-	 * 1/ The reset operation happens when the bridge is attached, not when
+	 *
+	 * 1. The reset operation happens when the bridge is attached, not when
 	 *    drm_mode_config_reset() is called
-	 * 2/ It's meant to be used exclusively on bridges that have been
+	 * 2. It's meant to be used exclusively on bridges that have been
 	 *    converted to the ATOMIC API
 	 *
 	 * RETURNS:
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
