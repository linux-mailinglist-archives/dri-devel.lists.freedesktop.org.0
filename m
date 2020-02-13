Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79115CD0E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AA56E417;
	Thu, 13 Feb 2020 21:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2E96E417
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:16:15 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id z125so3694169ybf.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qRrR/LDPMNdbg5VVbPW4kfAy/iroq4jdXriomyXQWuU=;
 b=PnwqKVtwfWwnhRhuWL6BZemDz6AvlFONlWRY4K7kZB4xfTlvf+ZzgSU6b37l8OGizS
 BGkgSrGoBKkXcP2RC3CQC2K/n6pYFqVrfqxcgtbDUNfStJqUVYENRljAWfHKoqP3foxD
 wwlusQ3jJ8CD7L6EdBSVJ/u/YFsW0bmToI53WQdDpSms8+FM7nmeXtbCkzC0iJ6U7vnP
 VjjCTb8iTjHDM0at0CyySBU1zDAlQJdHYu+9vqt5jk7Rh1FNGVaJ4MfLahyrMT7/oyJV
 k/GMgBlmlvu0mnZeEGyuIj8udIVUDL5NelPY+ULb/Py8Ntke1oVEpTSSZWzYi/D0K28c
 YLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qRrR/LDPMNdbg5VVbPW4kfAy/iroq4jdXriomyXQWuU=;
 b=mWf1EoTjjfpH+sBSbcwrDKH6EBz2gPSXmtIWTe1aUFokpJdjZ91u/sMsizWzzIKhoq
 pfnTpnVJRkS2du8vEvAtneTq71nBQF3WIVpnhK3TOrY6egDiaNV0ATRoN7lqdR6ev6Ka
 KKG6N1LwuFRdiz3KKxMmRxM90ck1tvvGkllgzoenht8AfzuYqtFNHRnzUli3TpGheG8W
 tvuUw4Ty+erEOAtb1cOak7b3eYE1W0YfXSxeN3Cm5xet5LyYT6qaZqArzkKWlXNXzN5l
 MT/myEVc5Uf6TIy+6oVV5klxYvyyZ/EqJAemRQlPIwUMVHy+9f/L26ybhC3GUQsMm5aH
 3PfQ==
X-Gm-Message-State: APjAAAWqkgs9eYRdtUS7LmdEq4zqyk5FIirhGhlL8ll1Bo1jw40H+m9F
 AWeeYTTRLQSXK95Qv3sydYi0KUzis+Y=
X-Google-Smtp-Source: APXvYqzBRQYvHSmzocrz1om1yDLcxXzSpv7jqBT6niFiGpDrRrn/yPPxKe4Haz/CbsAioycSC+WJ2Q==
X-Received: by 2002:a25:1654:: with SMTP id 81mr5296060ybw.434.1581628574144; 
 Thu, 13 Feb 2020 13:16:14 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id g128sm1671241ywb.33.2020.02.13.13.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:16:13 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/mst: Separate sideband packet header parsing from
 message building
Date: Thu, 13 Feb 2020 16:15:18 -0500
Message-Id: <20200213211523.156998-2-sean@poorly.run>
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

In preparation of per-branch device down message handling, separate
header parsing from message building. This will allow us to peek at
figure out which branch device the message is from before starting to
parse the message contents.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 102 ++++++++++++++------------
 1 file changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index a811247cecfef..e8bb39bb17a0f 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -687,51 +687,45 @@ static void drm_dp_encode_sideband_reply(struct drm_dp_sideband_msg_reply_body *
 	raw->cur_len = idx;
 }
 
-/* this adds a chunk of msg to the builder to get the final msg */
-static bool drm_dp_sideband_msg_build(struct drm_dp_sideband_msg_rx *msg,
-				      u8 *replybuf, u8 replybuflen, bool hdr)
+static int drm_dp_sideband_msg_set_header(struct drm_dp_sideband_msg_rx *msg,
+					  struct drm_dp_sideband_msg_hdr *hdr,
+					  u8 hdrlen)
 {
-	int ret;
-	u8 crc4;
+	/*
+	 * ignore out-of-order messages or messages that are part of a
+	 * failed transaction
+	 */
+	if (!hdr->somt && !msg->have_somt)
+		return false;
 
-	if (hdr) {
-		u8 hdrlen;
-		struct drm_dp_sideband_msg_hdr recv_hdr;
-		ret = drm_dp_decode_sideband_msg_hdr(&recv_hdr, replybuf, replybuflen, &hdrlen);
-		if (ret == false) {
-			print_hex_dump(KERN_DEBUG, "failed hdr", DUMP_PREFIX_NONE, 16, 1, replybuf, replybuflen, false);
-			return false;
-		}
+	/* get length contained in this portion */
+	msg->curchunk_idx = 0;
+	msg->curchunk_len = hdr->msg_len;
+	msg->curchunk_hdrlen = hdrlen;
 
-		/*
-		 * ignore out-of-order messages or messages that are part of a
-		 * failed transaction
-		 */
-		if (!recv_hdr.somt && !msg->have_somt)
-			return false;
+	/* we have already gotten an somt - don't bother parsing */
+	if (hdr->somt && msg->have_somt)
+		return false;
 
-		/* get length contained in this portion */
-		msg->curchunk_len = recv_hdr.msg_len;
-		msg->curchunk_hdrlen = hdrlen;
+	if (hdr->somt) {
+		memcpy(&msg->initial_hdr, hdr,
+		       sizeof(struct drm_dp_sideband_msg_hdr));
+		msg->have_somt = true;
+	}
+	if (hdr->eomt)
+		msg->have_eomt = true;
 
-		/* we have already gotten an somt - don't bother parsing */
-		if (recv_hdr.somt && msg->have_somt)
-			return false;
+	return true;
+}
 
-		if (recv_hdr.somt) {
-			memcpy(&msg->initial_hdr, &recv_hdr, sizeof(struct drm_dp_sideband_msg_hdr));
-			msg->have_somt = true;
-		}
-		if (recv_hdr.eomt)
-			msg->have_eomt = true;
+/* this adds a chunk of msg to the builder to get the final msg */
+static bool drm_dp_sideband_msg_build(struct drm_dp_sideband_msg_rx *msg,
+				      u8 *replybuf, u8 replybuflen)
+{
+	u8 crc4;
 
-		/* copy the bytes for the remainder of this header chunk */
-		msg->curchunk_idx = min(msg->curchunk_len, (u8)(replybuflen - hdrlen));
-		memcpy(&msg->chunk[0], replybuf + hdrlen, msg->curchunk_idx);
-	} else {
-		memcpy(&msg->chunk[msg->curchunk_idx], replybuf, replybuflen);
-		msg->curchunk_idx += replybuflen;
-	}
+	memcpy(&msg->chunk[msg->curchunk_idx], replybuf, replybuflen);
+	msg->curchunk_idx += replybuflen;
 
 	if (msg->curchunk_idx >= msg->curchunk_len) {
 		/* do CRC */
@@ -3702,25 +3696,43 @@ static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up)
 	u8 replyblock[32];
 	int replylen, curreply;
 	int ret;
+	u8 hdrlen;
+	struct drm_dp_sideband_msg_hdr hdr;
 	struct drm_dp_sideband_msg_rx *msg;
-	int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE : DP_SIDEBAND_MSG_DOWN_REP_BASE;
+	int basereg = up ? DP_SIDEBAND_MSG_UP_REQ_BASE :
+			   DP_SIDEBAND_MSG_DOWN_REP_BASE;
+
 	msg = up ? &mgr->up_req_recv : &mgr->down_rep_recv;
 
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
-	ret = drm_dp_dpcd_read(mgr->aux, basereg,
-			       replyblock, len);
+	ret = drm_dp_dpcd_read(mgr->aux, basereg, replyblock, len);
 	if (ret != len) {
 		DRM_DEBUG_KMS("failed to read DPCD down rep %d %d\n", len, ret);
 		return false;
 	}
-	ret = drm_dp_sideband_msg_build(msg, replyblock, len, true);
+
+	ret = drm_dp_decode_sideband_msg_hdr(&hdr, replyblock, len, &hdrlen);
+	if (ret == false) {
+		print_hex_dump(KERN_DEBUG, "failed hdr", DUMP_PREFIX_NONE, 16,
+			       1, replyblock, len, false);
+		DRM_DEBUG_KMS("ERROR: failed header\n");
+		return false;
+	}
+
+	if (!drm_dp_sideband_msg_set_header(msg, &hdr, hdrlen)) {
+		DRM_DEBUG_KMS("sideband msg set header failed %d\n",
+			      replyblock[0]);
+		return false;
+	}
+
+	replylen = min(msg->curchunk_len, (u8)(len - hdrlen));
+	ret = drm_dp_sideband_msg_build(msg, replyblock + hdrlen, replylen);
 	if (!ret) {
 		DRM_DEBUG_KMS("sideband msg build failed %d\n", replyblock[0]);
 		return false;
 	}
-	replylen = msg->curchunk_len + msg->curchunk_hdrlen;
 
-	replylen -= len;
+	replylen = msg->curchunk_len + msg->curchunk_hdrlen - len;
 	curreply = len;
 	while (replylen > 0) {
 		len = min3(replylen, mgr->max_dpcd_transaction_bytes, 16);
@@ -3732,7 +3744,7 @@ static bool drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up)
 			return false;
 		}
 
-		ret = drm_dp_sideband_msg_build(msg, replyblock, len, false);
+		ret = drm_dp_sideband_msg_build(msg, replyblock, len);
 		if (!ret) {
 			DRM_DEBUG_KMS("failed to build sideband msg\n");
 			return false;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
