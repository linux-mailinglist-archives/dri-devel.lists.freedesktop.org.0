Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBFA7791B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 12:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6458710E032;
	Tue,  1 Apr 2025 10:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EjdQiXg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9B910E032
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 10:50:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A0EEA44650;
 Tue,  1 Apr 2025 10:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31462C4CEE4;
 Tue,  1 Apr 2025 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1743504606;
 bh=h3jCXBjzmxUb5sqGyBDhA2mOH7q6Aor+POffIhb1RRY=;
 h=Subject:To:Cc:From:Date:From;
 b=EjdQiXg4QYtDkd2F6OuCJWPpCCUSeGOdR1hxzsK+9lWwDD6n/RYKVWTk+97Ln0Snw
 GtgFrQYJYjUTY1WOqPGC2oALY8mjeEs/2UbqyLRdLYFR0N6Urw2eLU1lL1JYTalPzu
 7+dUkFV93L/g95cD0F61Mia2LA3vLyeefyOLQIu8=
Subject: Patch "drm/dp_mst: Factor out function to queue a topology probe
 work" has been added to the 6.6-stable tree
To: cascardo@igalia.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, imre.deak@intel.com, lyude@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Apr 2025 11:48:17 +0100
Message-ID: <2025040117-conjoined-frostily-c770@gregkh>
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

    drm/dp_mst: Factor out function to queue a topology probe work

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-dp_mst-factor-out-function-to-queue-a-topology-probe-work.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From e9b36c5be2e7fdef2cc933c1dac50bd81881e9b8 Mon Sep 17 00:00:00 2001
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 22 Jul 2024 19:54:50 +0300
Subject: drm/dp_mst: Factor out function to queue a topology probe work

From: Imre Deak <imre.deak@intel.com>

commit e9b36c5be2e7fdef2cc933c1dac50bd81881e9b8 upstream.

Factor out a function to queue a work for probing the topology, also
used by the next patch.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722165503.2084999-2-imre.deak@intel.com
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2692,6 +2692,11 @@ static void drm_dp_mst_link_probe_work(s
 		drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_dp_mst_queue_probe_work(struct drm_dp_mst_topology_mgr *mgr)
+{
+	queue_work(system_long_wq, &mgr->work);
+}
+
 static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 				 u8 *guid)
 {
@@ -3643,7 +3648,7 @@ int drm_dp_mst_topology_mgr_set_mst(stru
 		/* Write reset payload */
 		drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
 
-		queue_work(system_long_wq, &mgr->work);
+		drm_dp_mst_queue_probe_work(mgr);
 
 		ret = 0;
 	} else {
@@ -3766,7 +3771,7 @@ int drm_dp_mst_topology_mgr_resume(struc
 	 * state of our in-memory topology back into sync with reality. So,
 	 * restart the probing process as if we're probing a new hub
 	 */
-	queue_work(system_long_wq, &mgr->work);
+	drm_dp_mst_queue_probe_work(mgr);
 	mutex_unlock(&mgr->lock);
 
 	if (sync) {


Patches currently in stable-queue which might be from imre.deak@intel.com are

queue-6.6/drm-dp_mst-factor-out-function-to-queue-a-topology-probe-work.patch
queue-6.6/drm-dp_mst-add-a-helper-to-queue-a-topology-probe.patch
