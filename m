Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF57168F75
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E896E919;
	Sat, 22 Feb 2020 15:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743E56E096
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:01:44 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4293411FC;
 Sat, 22 Feb 2020 16:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383702;
 bh=yfDkWIE4S6uDXrpHHb1DZbiTPcKlplnAWwAnn8D1RvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J0PxFKKuHeHcVR5WvAoZHCS8vPoB4m7VdoiFHzSwpPwWx9+5V+Ax3zJ3fkfmquwe0
 b/1WsUTzlWF/e5OAt1SZ5yXCzsTX40D1Wh5cuvZjYYTu1PbUZq2DR6zorAKQptG2te
 asK/BDXY3ip8UnczR7hrcDDl4UQO01s9VHQBVEmo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 05/54] drm/bridge: Fix atomic state ops documentation
Date: Sat, 22 Feb 2020 17:00:17 +0200
Message-Id: <20200222150106.22919-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_bridge_funcs atomic_state_duplicate and atomic_state_destroy
operations are erroneously documented as having a default implementation
if not implemented in bridge drivers. This isn't correct, fix the
documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/drm/drm_bridge.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 999faaaab9a1..38de129d5947 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -349,9 +349,11 @@ struct drm_bridge_funcs {
 	 * Duplicate the current bridge state object (which is guaranteed to be
 	 * non-NULL).
 	 *
-	 * The atomic_duplicate_state() hook is optional. When not implemented
-	 * the core allocates a drm_bridge_state object and calls
-	 * __drm_atomic_helper_bridge_duplicate_state() to initialize it.
+	 * The atomic_duplicate_state hook is mandatory if the bridge
+	 * implements any of the atomic hooks, and should be left unassigned
+	 * otherwise. For bridges that don't subclass &drm_bridge_state, the
+	 * drm_atomic_helper_bridge_duplicate_state() helper function shall be
+	 * used to implement this hook.
 	 *
 	 * RETURNS:
 	 * A valid drm_bridge_state object or NULL if the allocation fails.
@@ -364,8 +366,11 @@ struct drm_bridge_funcs {
 	 * Destroy a bridge state object previously allocated by
 	 * &drm_bridge_funcs.atomic_duplicate_state().
 	 *
-	 * The atomic_destroy_state hook is optional. When not implemented the
-	 * core calls kfree() on the state.
+	 * The atomic_destroy_state hook is mandatory if the bridge implements
+	 * any of the atomic hooks, and should be left unassigned otherwise.
+	 * For bridges that don't subclass &drm_bridge_state, the
+	 * drm_atomic_helper_bridge_destroy_state() helper function shall be
+	 * used to implement this hook.
 	 */
 	void (*atomic_destroy_state)(struct drm_bridge *bridge,
 				     struct drm_bridge_state *state);
@@ -474,7 +479,10 @@ struct drm_bridge_funcs {
 	 * This function is called at attach time.
 	 *
 	 * The atomic_reset hook is mandatory if the bridge implements any of
-	 * the atomic hooks, and should be left unassigned otherwise.
+	 * the atomic hooks, and should be left unassigned otherwise. For
+	 * bridges that don't subclass &drm_bridge_state, the
+	 * drm_atomic_helper_bridge_reset() helper function shall be used to
+	 * implement this hook.
 	 *
 	 * Note that the atomic_reset() semantics is not exactly matching the
 	 * reset() semantics found on other components (connector, plane, ...).
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
