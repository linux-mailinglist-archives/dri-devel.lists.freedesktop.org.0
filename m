Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6261B6129
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 18:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586C6E8FA;
	Thu, 23 Apr 2020 16:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FCF6E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587660173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=odJrFOK+7bivbDZ7ZKaNo+MENCGaQCojnN8HH0MbtLQ=;
 b=Qc0rvV6pj3O0qxkfNU5dT+4WejmMcUIFPYptm50q6/d9d/uKwZqgNLfvS74Bqe9G1WaLWQ
 CQTJRIXrxbNB8e+s2cSb76uWB7E+1Y4sm0D/RRYAPY9dRVZXGMI/IEUcfKQx+KBboCm8/j
 0rFTviRP/tlRnWxm+HHegOcOmRSoLUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-uYnyQ5tLMYyrRTydAnFg0Q-1; Thu, 23 Apr 2020 12:42:49 -0400
X-MC-Unique: uYnyQ5tLMYyrRTydAnFg0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB72F803786;
 Thu, 23 Apr 2020 16:42:30 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-186.rdu2.redhat.com [10.10.119.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F7545D9CC;
 Thu, 23 Apr 2020 16:42:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/dp_mst: Remove single tx msg restriction."
Date: Thu, 23 Apr 2020 12:42:24 -0400
Message-Id: <20200423164225.680178-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 6bb0942e8f46863a745489cce27efe5be2a3885e.

Unfortunately it would appear that the rumors we've heard of sideband
message interleaving not being very well supported are true. On the
Lenovo ThinkPad Thunderbolt 3 dock that I have, interleaved messages
appear to just get dropped:

  [drm:drm_dp_mst_wait_tx_reply [drm_kms_helper]] timedout msg send
  00000000571ddfd0 2 1
  [dp_mst] txmsg cur_offset=2 cur_len=2 seqno=1 state=SENT path_msg=1 dst=00
  [dp_mst] 	type=ENUM_PATH_RESOURCES contents:
  [dp_mst] 		port=2

DP descriptor for this hub:
  OUI 90-cc-24 dev-ID SYNA3  HW-rev 1.0 SW-rev 3.12 quirks 0x0008

It would seem like as well that this is a somewhat well known issue in
the field. From section 5.4.2 of the DisplayPort 2.0 specification:

  There are MST Sink/Branch devices in the field that do not handle
  interleaved message transactions.

  To facilitate message transaction handling by downstream devices, an
  MST Source device shall generate message transactions in an atomic
  manner (i.e., the MST Source device shall not concurrently interleave
  multiple message transactions). Therefore, an MST Source device shall
  clear the Message_Sequence_No value in the Sideband_MSG_Header to 0.

  MST Source devices that support field policy updates by way of
  software should update the policy to forego the generation of
  interleaved message transactions.

This is a bit disappointing, as features like HDCP require that we send
a sideband request every ~2 seconds for each active stream. However,
there isn't really anything in the specification that allows us to
accurately probe for interleaved messages.

If it ends up being that we -really- need this in the future, we might
be able to whitelist hubs where interleaving is known to work-or maybe
try some sort of heuristics. But for now, let's just play it safe and
not use it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 6bb0942e8f46 ("drm/dp_mst: Remove single tx msg restriction.")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++++++++++++--
 include/drm/drm_dp_mst_helper.h       |  5 +++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 21f10ceb3d6c..03a1496f6120 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1205,6 +1205,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
 			mstb->tx_slots[txmsg->seqno] = NULL;
 		}
+		mgr->is_waiting_for_dwn_reply = false;
+
 	}
 out:
 	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
@@ -1214,6 +1216,7 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 	}
 	mutex_unlock(&mgr->qlock);
 
+	drm_dp_mst_kick_tx(mgr);
 	return ret;
 }
 
@@ -2789,9 +2792,11 @@ static void process_single_down_tx_qlock(struct drm_dp_mst_topology_mgr *mgr)
 	ret = process_single_tx_qlock(mgr, txmsg, false);
 	if (ret == 1) {
 		/* txmsg is sent it should be in the slots now */
+		mgr->is_waiting_for_dwn_reply = true;
 		list_del(&txmsg->next);
 	} else if (ret) {
 		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
+		mgr->is_waiting_for_dwn_reply = false;
 		list_del(&txmsg->next);
 		if (txmsg->seqno != -1)
 			txmsg->dst->tx_slots[txmsg->seqno] = NULL;
@@ -2831,7 +2836,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
 
-	if (list_is_singular(&mgr->tx_msg_downq))
+	if (list_is_singular(&mgr->tx_msg_downq) &&
+	    !mgr->is_waiting_for_dwn_reply)
 		process_single_down_tx_qlock(mgr);
 	mutex_unlock(&mgr->qlock);
 }
@@ -3823,6 +3829,7 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	mutex_lock(&mgr->qlock);
 	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
 	mstb->tx_slots[seqno] = NULL;
+	mgr->is_waiting_for_dwn_reply = false;
 	mutex_unlock(&mgr->qlock);
 
 	wake_up_all(&mgr->tx_waitq);
@@ -3830,6 +3837,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	return 0;
 
 out_clear_reply:
+	mutex_lock(&mgr->qlock);
+	mgr->is_waiting_for_dwn_reply = false;
+	mutex_unlock(&mgr->qlock);
 	if (msg)
 		memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
 out:
@@ -4683,7 +4693,7 @@ static void drm_dp_tx_work(struct work_struct *work)
 	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct drm_dp_mst_topology_mgr, tx_work);
 
 	mutex_lock(&mgr->qlock);
-	if (!list_empty(&mgr->tx_msg_downq))
+	if (!list_empty(&mgr->tx_msg_downq) && !mgr->is_waiting_for_dwn_reply)
 		process_single_down_tx_qlock(mgr);
 	mutex_unlock(&mgr->qlock);
 }
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 2d7c26592c05..96bcf33c03d3 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -592,6 +592,11 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	bool payload_id_table_cleared : 1;
 
+	/**
+	 * @is_waiting_for_dwn_reply: whether we're waiting for a down reply.
+	 */
+	bool is_waiting_for_dwn_reply : 1;
+
 	/**
 	 * @mst_primary: Pointer to the primary/first branch device.
 	 */
-- 
2.25.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
