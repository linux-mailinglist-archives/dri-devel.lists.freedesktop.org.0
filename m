Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F5A7A681
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 17:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6333710EA3B;
	Thu,  3 Apr 2025 15:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zTIhGQHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B2010EA3B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 15:27:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7520543DDB;
 Thu,  3 Apr 2025 15:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F0DC4CEE3;
 Thu,  3 Apr 2025 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1743694033;
 bh=aPr8c50VZeUZdkJnVrQIPWbHy0y1zrd9XJekLgJSc6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zTIhGQHVx5k/ktfvaFDprdzlYlQDQ7DjjIKqn4M3xOYTdhzXqNZlvyRlLX66iWHUe
 BDJmmvmnurpehNnssVR2fwnksLFxzvbJhGJPWahn9MElORtidwcEx4kG01s2SXlkWV
 S2FUD8xXagTEPxQ7SxPgF5S5n1jmkejy3U4iXRaA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH 6.6 09/26] drm/dp_mst: Add a helper to queue a topology probe
Date: Thu,  3 Apr 2025 16:20:30 +0100
Message-ID: <20250403151622.684402831@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403151622.415201055@linuxfoundation.org>
References: <20250403151622.415201055@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Imre Deak <imre.deak@intel.com>

commit dbaeef363ea54f4c18112874b77503c72ba60fec upstream.

A follow up i915 patch will need to reprobe the MST topology after the
initial probing, add a helper for this.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722165503.2084999-3-imre.deak@intel.com
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   27 ++++++++++++++++++++++++++
 include/drm/display/drm_dp_mst_helper.h       |    2 +
 2 files changed, 29 insertions(+)

--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3686,6 +3686,33 @@ drm_dp_mst_topology_mgr_invalidate_mstb(
 }
 
 /**
+ * drm_dp_mst_topology_queue_probe - Queue a topology probe
+ * @mgr: manager to probe
+ *
+ * Queue a work to probe the MST topology. Driver's should call this only to
+ * sync the topology's HW->SW state after the MST link's parameters have
+ * changed in a way the state could've become out-of-sync. This is the case
+ * for instance when the link rate between the source and first downstream
+ * branch device has switched between UHBR and non-UHBR rates. Except of those
+ * cases - for instance when a sink gets plugged/unplugged to a port - the SW
+ * state will get updated automatically via MST UP message notifications.
+ */
+void drm_dp_mst_topology_queue_probe(struct drm_dp_mst_topology_mgr *mgr)
+{
+	mutex_lock(&mgr->lock);
+
+	if (drm_WARN_ON(mgr->dev, !mgr->mst_state || !mgr->mst_primary))
+		goto out_unlock;
+
+	drm_dp_mst_topology_mgr_invalidate_mstb(mgr->mst_primary);
+	drm_dp_mst_queue_probe_work(mgr);
+
+out_unlock:
+	mutex_unlock(&mgr->lock);
+}
+EXPORT_SYMBOL(drm_dp_mst_topology_queue_probe);
+
+/**
  * drm_dp_mst_topology_mgr_suspend() - suspend the MST manager
  * @mgr: manager to suspend
  *
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -859,6 +859,8 @@ int drm_dp_check_act_status(struct drm_d
 void drm_dp_mst_dump_topology(struct seq_file *m,
 			      struct drm_dp_mst_topology_mgr *mgr);
 
+void drm_dp_mst_topology_queue_probe(struct drm_dp_mst_topology_mgr *mgr);
+
 void drm_dp_mst_topology_mgr_suspend(struct drm_dp_mst_topology_mgr *mgr);
 int __must_check
 drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,


