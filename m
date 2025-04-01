Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C9A7791A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 12:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE81D10E023;
	Tue,  1 Apr 2025 10:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nPEk8NxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120210E023
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 10:50:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F17285C408B;
 Tue,  1 Apr 2025 10:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A636C4CEE4;
 Tue,  1 Apr 2025 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1743504600;
 bh=oyjlsBUUto2ycDPKHIN4KtiNZu1mnRr8ZGOyS8sSat0=;
 h=Subject:To:Cc:From:Date:From;
 b=nPEk8NxT/CLeJstX8JJuyMVtwmZj9ADRL8zCVtssQ2Yd3Qxl7lPPzZIq0lwIDDxOH
 39CNKGHioASeCQSsIwcPjr9Ja84XbiFdVidTV3VVfRLy/EN5Qhareq0Lgb2sPxZoD/
 dvyFDlpf3S26layMVnE1buUoqw9DpOu6+vCHJ+zw=
Subject: Patch "drm/dp_mst: Add a helper to queue a topology probe" has been
 added to the 6.6-stable tree
To: cascardo@igalia.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, imre.deak@intel.com, lyude@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Apr 2025 11:48:17 +0100
Message-ID: <2025040117-pushcart-morality-bf67@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    drm/dp_mst: Add a helper to queue a topology probe

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-dp_mst-add-a-helper-to-queue-a-topology-probe.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From dbaeef363ea54f4c18112874b77503c72ba60fec Mon Sep 17 00:00:00 2001
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 22 Jul 2024 19:54:51 +0300
Subject: drm/dp_mst: Add a helper to queue a topology probe

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


Patches currently in stable-queue which might be from imre.deak@intel.com are

queue-6.6/drm-dp_mst-factor-out-function-to-queue-a-topology-probe-work.patch
queue-6.6/drm-dp_mst-add-a-helper-to-queue-a-topology-probe.patch
