Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81246B4273
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACA710E2B6;
	Fri, 10 Mar 2023 14:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9839510E2B6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:03:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC1AB618BC;
 Fri, 10 Mar 2023 14:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEEFC433D2;
 Fri, 10 Mar 2023 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678457010;
 bh=F3qQD6N+1h7dNl+LJ+lDg3z/E7I0j0DYBS8kKRf7vkA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LHFRixk1qFotzeuipFtK6NAPX7e61dMPZPn26z2q0LypXEt6jMO0e5t0W9Jyik4U8
 Yju0FcisF9QWPWIio5gc95L4wbjW+zE8hwDZ4aqDcSEHCaSWJ/sApkyTHs+T2YIPJF
 zt2mNRvO3/BtzaYHuDYsugSxdh1uSlLkt7/HcPGs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.2 201/211] drm/display/dp_mst: Add
 drm_atomic_get_old_mst_topology_state()
Date: Fri, 10 Mar 2023 14:39:41 +0100
Message-Id: <20230310133725.016840060@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310133718.689332661@linuxfoundation.org>
References: <20230310133718.689332661@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Imre Deak <imre.deak@intel.com>

commit 9ffdb67af0ee625ae127711845532f670cc6a4e7 upstream.

Add a function to get the old MST topology state, required by a
follow-up i915 patch.

While at it clarify the code comment of
drm_atomic_get_new_mst_topology_state() and add _new prefix
to the new state pointer to remind about its difference from the old
state.

v2: Use old_/new_ prefixes for the state pointers. (Ville)

Cc: Lyude Paul <lyude@redhat.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: stable@vger.kernel.org # 6.1
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Lyude Paul <lyude@redhat.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230206114856.2665066-3-imre.deak@intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   33 ++++++++++++++++++++++----
 include/drm/display/drm_dp_mst_helper.h       |    3 ++
 2 files changed, 32 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5355,27 +5355,52 @@ struct drm_dp_mst_topology_state *drm_at
 EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
 
 /**
+ * drm_atomic_get_old_mst_topology_state: get old MST topology state in atomic state, if any
+ * @state: global atomic state
+ * @mgr: MST topology manager, also the private object in this case
+ *
+ * This function wraps drm_atomic_get_old_private_obj_state() passing in the MST atomic
+ * state vtable so that the private object state returned is that of a MST
+ * topology object.
+ *
+ * Returns:
+ *
+ * The old MST topology state, or NULL if there's no topology state for this MST mgr
+ * in the global atomic state
+ */
+struct drm_dp_mst_topology_state *
+drm_atomic_get_old_mst_topology_state(struct drm_atomic_state *state,
+				      struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct drm_private_state *old_priv_state =
+		drm_atomic_get_old_private_obj_state(state, &mgr->base);
+
+	return old_priv_state ? to_dp_mst_topology_state(old_priv_state) : NULL;
+}
+EXPORT_SYMBOL(drm_atomic_get_old_mst_topology_state);
+
+/**
  * drm_atomic_get_new_mst_topology_state: get new MST topology state in atomic state, if any
  * @state: global atomic state
  * @mgr: MST topology manager, also the private object in this case
  *
- * This function wraps drm_atomic_get_priv_obj_state() passing in the MST atomic
+ * This function wraps drm_atomic_get_new_private_obj_state() passing in the MST atomic
  * state vtable so that the private object state returned is that of a MST
  * topology object.
  *
  * Returns:
  *
- * The MST topology state, or NULL if there's no topology state for this MST mgr
+ * The new MST topology state, or NULL if there's no topology state for this MST mgr
  * in the global atomic state
  */
 struct drm_dp_mst_topology_state *
 drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
 				      struct drm_dp_mst_topology_mgr *mgr)
 {
-	struct drm_private_state *priv_state =
+	struct drm_private_state *new_priv_state =
 		drm_atomic_get_new_private_obj_state(state, &mgr->base);
 
-	return priv_state ? to_dp_mst_topology_state(priv_state) : NULL;
+	return new_priv_state ? to_dp_mst_topology_state(new_priv_state) : NULL;
 }
 EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
 
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -867,6 +867,9 @@ struct drm_dp_mst_topology_state *
 drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
 				  struct drm_dp_mst_topology_mgr *mgr);
 struct drm_dp_mst_topology_state *
+drm_atomic_get_old_mst_topology_state(struct drm_atomic_state *state,
+				      struct drm_dp_mst_topology_mgr *mgr);
+struct drm_dp_mst_topology_state *
 drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
 				      struct drm_dp_mst_topology_mgr *mgr);
 struct drm_dp_mst_atomic_payload *


