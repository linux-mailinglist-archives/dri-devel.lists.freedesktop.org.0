Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49915CD0F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D3D6E416;
	Thu, 13 Feb 2020 21:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc30.google.com (mail-yw1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDD26E416
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:16:21 +0000 (UTC)
Received: by mail-yw1-xc30.google.com with SMTP id t141so3288000ywc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJOM/EVWcNjbJiGD2/LsLervE5XiHO1FdxViiOWZXUA=;
 b=NNtgLkpRQvBJGLTe8qWzB6B3SAjTu2MBum9BkUJrGqXO3zFZm7JOz7dO1gJJ4RMcUA
 o9KmZuhEexjnxO80OhgXhhGYX9Xhf3pNNLUDFA2AncTRBb5mJep1m6tXoDxxFSuJdioC
 ppZG5E/gzD0IragEknsdSManmtvYqwcGCjttXG4TGtAYCVWA/A/52s2NwEFTm7+znpx8
 EK8+vPX+UEuuBLgA/MH5xHiICJ1KxP1zf/pVBkRWsH0JJCEy5nujvX887zG1BOiCgKV4
 b/P95z3WuP4Fx++s5m2ibV/X6WAoo/CMNUH4c1/okoUa5dbKi9EH0EVVhGN31DDl7CpH
 PUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJOM/EVWcNjbJiGD2/LsLervE5XiHO1FdxViiOWZXUA=;
 b=QEVsheuZL6U1FhISYB19PW1cPxNqu1BcTp2nNM2eHGiiATKoJQpVJ4ehv5HSi0sUKC
 5fg2KkptbpAYRjx85Y1jQ9/cNYubJD2OcRGpSgLB0DvWitvPbZmEO39coR/9cTuM7d+M
 4QewYRq/RZ+pAXsJysySma0CedbbOlGfr/odoytKd3qGuE3K1Oi9ZI0Va5iWEiP9CO6r
 xY9ElkUY0VJiFb4ErShVq7sCqQXmbHP180vZyCtsfqNy0By6w9lpGEfPbITjS+q41wQ7
 cOzhggMLs//PFSEP1CLdSj2YO+J/4gNUX3bdM+pAxN7NQFVInXmycn1fKwAbX6RuxyKn
 ddVw==
X-Gm-Message-State: APjAAAULtXbd7hfwy3r9svMOy3gv9zknKajcqtscfV692OnMoeZoVHzU
 vzmHy/gHN0oi41ekbi75mRAz6K9gNl8=
X-Google-Smtp-Source: APXvYqzlVO2N4H2xU19PJuasKk2jc9VpOqLoXZw0tRL0opU+gbHXKp4RLkWFkfT5qbjsWeV4ElAeEA==
X-Received: by 2002:a81:13d6:: with SMTP id 205mr4836969ywt.95.1581628580240; 
 Thu, 13 Feb 2020 13:16:20 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id i17sm1613986ywg.66.2020.02.13.13.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:16:19 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/mst: Support simultaneous down replies
Date: Thu, 13 Feb 2020 16:15:19 -0500
Message-Id: <20200213211523.156998-3-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200213211523.156998-1-sean@poorly.run>
References: <20200213211523.156998-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Wayne.Lin@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Currently we have one down reply message servicing the mst manager, so
we need to serialize all tx msgs to ensure we only have one message in
flight at a time. For obvious reasons this is suboptimal (but less
suboptimal than the free-for-all we had before serialization).

This patch removes the single down_rep_recv message from manager and
adds 2 replies in the branch structure. The 2 replies mirrors the tx_slots
which we use to rate-limit outgoing messages and correspond to seqno in
the packet headers.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 80 ++++++++++++++++-----------
 include/drm/drm_dp_mst_helper.h       | 59 ++++++++++----------
 2 files changed, 78 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index e8bb39bb17a0f..7e6a82efdfc02 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3690,7 +3690,8 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 }
 EXPORT_SYMBOL(drm_dp_mst_topology_mgr_resume);
 
-static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up)
+static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
+				  struct drm_dp_mst_branch **mstb, int *seqno)
 {
 	int len;
 	u8 replyblock[32];
@@ -3702,7 +3703,8 @@ static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up)
 	int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE :
 			   DP_SIDEBAND_MSG_DOWN_REP_BASE;
 
-	msg = up ? &mgr->up_req_recv : &mgr->down_rep_recv;
+	*mstb = NULL;
+	*seqno = -1;
 
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
 	ret = drm_dp_dpcd_read(mgr->aux, basereg, replyblock, len);
@@ -3719,6 +3721,21 @@ static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up)
 		return false;
 	}
 
+	*seqno = hdr.seqno;
+
+	if (up) {
+		msg = &mgr->up_req_recv;
+	} else {
+		/* Caller is responsible for giving back this reference */
+		*mstb = drm_dp_get_mst_branch_device(mgr, hdr.lct, hdr.rad);
+		if (!*mstb) {
+			DRM_DEBUG_KMS("Got MST reply from unknown device %d\n",
+				      hdr.lct);
+			return false;
+		}
+		msg = &(*mstb)->down_rep_recv[hdr.seqno];
+	}
+
 	if (!drm_dp_sideband_msg_set_header(msg, &hdr, hdrlen)) {
 		DRM_DEBUG_KMS("sideband msg set header failed %d\n",
 			      replyblock[0]);
@@ -3759,53 +3776,52 @@ static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up)
 static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
-	struct drm_dp_mst_branch *mstb;
-	struct drm_dp_sideband_msg_hdr *hdr = &mgr->down_rep_recv.initial_hdr;
-	int slot = -1;
+	struct drm_dp_mst_branch *mstb = NULL;
+	struct drm_dp_sideband_msg_rx *msg = NULL;
+	int seqno = -1;
 
-	if (!drm_dp_get_one_sb_msg(mgr, false))
-		goto clear_down_rep_recv;
+	if (!drm_dp_get_one_sb_msg(mgr, false, &mstb, &seqno))
+		goto out_clear_reply;
 
-	if (!mgr->down_rep_recv.have_eomt)
-		return 0;
+	msg = &mstb->down_rep_recv[seqno];
 
-	mstb = drm_dp_get_mst_branch_device(mgr, hdr->lct, hdr->rad);
-	if (!mstb) {
-		DRM_DEBUG_KMS("Got MST reply from unknown device %d\n",
-			      hdr->lct);
-		goto clear_down_rep_recv;
-	}
+	/* Multi-packet message transmission, don't clear the reply */
+	if (!msg->have_eomt)
+		goto out;
 
 	/* find the message */
-	slot = hdr->seqno;
 	mutex_lock(&mgr->qlock);
-	txmsg = mstb->tx_slots[slot];
+	txmsg = mstb->tx_slots[seqno];
 	/* remove from slots */
 	mutex_unlock(&mgr->qlock);
 
 	if (!txmsg) {
+		struct drm_dp_sideband_msg_hdr *hdr;
+		hdr = &msg->initial_hdr;
 		DRM_DEBUG_KMS("Got MST reply with no msg %p %d %d %02x %02x\n",
 			      mstb, hdr->seqno, hdr->lct, hdr->rad[0],
-			      mgr->down_rep_recv.msg[0]);
-		goto no_msg;
+			      msg->msg[0]);
+		goto out_clear_reply;
 	}
 
-	drm_dp_sideband_parse_reply(&mgr->down_rep_recv, &txmsg->reply);
+	drm_dp_sideband_parse_reply(msg, &txmsg->reply);
 
-	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
+	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
 		DRM_DEBUG_KMS("Got NAK reply: req 0x%02x (%s), reason 0x%02x (%s), nak data 0x%02x\n",
 			      txmsg->reply.req_type,
 			      drm_dp_mst_req_type_str(txmsg->reply.req_type),
 			      txmsg->reply.u.nak.reason,
 			      drm_dp_mst_nak_reason_str(txmsg->reply.u.nak.reason),
 			      txmsg->reply.u.nak.nak_data);
+		goto out_clear_reply;
+	}
 
-	memset(&mgr->down_rep_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
+	memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
 	drm_dp_mst_topology_put_mstb(mstb);
 
 	mutex_lock(&mgr->qlock);
 	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
-	mstb->tx_slots[slot] = NULL;
+	mstb->tx_slots[seqno] = NULL;
 	mgr->is_waiting_for_dwn_reply = false;
 	mutex_unlock(&mgr->qlock);
 
@@ -3813,13 +3829,15 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 
 	return 0;
 
-no_msg:
-	drm_dp_mst_topology_put_mstb(mstb);
-clear_down_rep_recv:
+out_clear_reply:
 	mutex_lock(&mgr->qlock);
 	mgr->is_waiting_for_dwn_reply = false;
 	mutex_unlock(&mgr->qlock);
-	memset(&mgr->down_rep_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
+	if (msg)
+		memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
+out:
+	if (mstb)
+		drm_dp_mst_topology_put_mstb(mstb);
 
 	return 0;
 }
@@ -3895,11 +3913,10 @@ static void drm_dp_mst_up_req_work(struct work_struct *work)
 
 static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 {
-	struct drm_dp_sideband_msg_hdr *hdr = &mgr->up_req_recv.initial_hdr;
 	struct drm_dp_pending_up_req *up_req;
-	bool seqno;
+	int seqno;
 
-	if (!drm_dp_get_one_sb_msg(mgr, true))
+	if (!drm_dp_get_one_sb_msg(mgr, true, NULL, &seqno))
 		goto out;
 
 	if (!mgr->up_req_recv.have_eomt)
@@ -3912,7 +3929,6 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 	}
 	INIT_LIST_HEAD(&up_req->next);
 
-	seqno = hdr->seqno;
 	drm_dp_sideband_parse_req(&mgr->up_req_recv, &up_req->msg);
 
 	if (up_req->msg.req_type != DP_CONNECTION_STATUS_NOTIFY &&
@@ -3946,7 +3962,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 			      res_stat->available_pbn);
 	}
 
-	up_req->hdr = *hdr;
+	up_req->hdr = mgr->up_req_recv.initial_hdr;
 	mutex_lock(&mgr->up_req_lock);
 	list_add_tail(&up_req->next, &mgr->up_req_list);
 	mutex_unlock(&mgr->up_req_lock);
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 5483f888712ad..7d0341f94ce1b 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -160,6 +160,31 @@ struct drm_dp_mst_port {
 	bool fec_capable;
 };
 
+/* sideband msg header - not bit struct */
+struct drm_dp_sideband_msg_hdr {
+	u8 lct;
+	u8 lcr;
+	u8 rad[8];
+	bool broadcast;
+	bool path_msg;
+	u8 msg_len;
+	bool somt;
+	bool eomt;
+	bool seqno;
+};
+
+struct drm_dp_sideband_msg_rx {
+	u8 chunk[48];
+	u8 msg[256];
+	u8 curchunk_len;
+	u8 curchunk_idx; /* chunk we are parsing now */
+	u8 curchunk_hdrlen;
+	u8 curlen; /* total length of the msg */
+	bool have_somt;
+	bool have_eomt;
+	struct drm_dp_sideband_msg_hdr initial_hdr;
+};
+
 /**
  * struct drm_dp_mst_branch - MST branch device.
  * @rad: Relative Address to talk to this branch device.
@@ -232,24 +257,16 @@ struct drm_dp_mst_branch {
 	int last_seqno;
 	bool link_address_sent;
 
+	/**
+	 * @down_rep_recv: Message receiver state for down replies.
+	 */
+	struct drm_dp_sideband_msg_rx down_rep_recv[2];
+
 	/* global unique identifier to identify branch devices */
 	u8 guid[16];
 };
 
 
-/* sideband msg header - not bit struct */
-struct drm_dp_sideband_msg_hdr {
-	u8 lct;
-	u8 lcr;
-	u8 rad[8];
-	bool broadcast;
-	bool path_msg;
-	u8 msg_len;
-	bool somt;
-	bool eomt;
-	bool seqno;
-};
-
 struct drm_dp_nak_reply {
 	u8 guid[16];
 	u8 reason;
@@ -306,18 +323,6 @@ struct drm_dp_remote_i2c_write_ack_reply {
 };
 
 
-struct drm_dp_sideband_msg_rx {
-	u8 chunk[48];
-	u8 msg[256];
-	u8 curchunk_len;
-	u8 curchunk_idx; /* chunk we are parsing now */
-	u8 curchunk_hdrlen;
-	u8 curlen; /* total length of the msg */
-	bool have_somt;
-	bool have_eomt;
-	struct drm_dp_sideband_msg_hdr initial_hdr;
-};
-
 #define DRM_DP_MAX_SDP_STREAMS 16
 struct drm_dp_allocate_payload {
 	u8 port_number;
@@ -556,10 +561,6 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	int conn_base_id;
 
-	/**
-	 * @down_rep_recv: Message receiver state for down replies.
-	 */
-	struct drm_dp_sideband_msg_rx down_rep_recv;
 	/**
 	 * @up_req_recv: Message receiver state for up requests.
 	 */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
