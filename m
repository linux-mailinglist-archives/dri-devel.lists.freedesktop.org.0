Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE415CD10
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 22:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD7F6E419;
	Thu, 13 Feb 2020 21:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B052B6F87C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 21:16:27 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id l75so3708219ybf.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzIxMWDW2W6YnfrR7RKZb+pbbYE9WYwoZVxQ5ylCh1s=;
 b=aGCbN9fjL7DAewc+nsgSqABq3SioGeEFvsDIb5hitmQsEw39ETAAvbLrIrcGun9qqD
 T7AJcQQAETXDMyFCgGtZGvBK983w7SSkvH0E6/H4eDoTD0Bvl5bkUzGKbdewsFmfUHm1
 4J/v80DbcxvwGvIafhDaFb+AVzDE/1bIOaIicBDFTF63Ango8ZWbwx6dHIH0gPZlji4x
 WDAqONDudTdhrfqmgi6Dn5qJehWH8l96iS3kYWugqRv+mvtflbkEHdyZcMzccUcShQE/
 ecaiztOFhhuz5ohKcri/4u7CRwCIg16hcojS4lofVV6zMalv5kdPUX8x6SL6TDBIugUI
 cr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzIxMWDW2W6YnfrR7RKZb+pbbYE9WYwoZVxQ5ylCh1s=;
 b=T7R1XzblIYTtzTMYEjcvowfC3yXPFpX6jnnVNpexP+mP6y+F1ImKQIpfz7/UA+0ZN3
 ySWysYaV2pExxREBg6hAJQTstAqRdjVRcePijnX/nLba1ILIJyu8aCsCaawvwjLTkzRZ
 3klu58nDxhumoil5WYZKLiO9pPSr7ZJwi+itqEF2wo52PDffBIkATL2tUck9t2h/Ok3Y
 I8d1UCCx6oHz1NBPpjheDSu4Hi5ghwkzvp4YIqvSq8UdMrCA9yhLuGwRNf0KX1Nxt/2Z
 /isai/JEt/C9R7EDyy180nOYZrV/4krYV0KOStvKaOx9sWaiWDmBDQlQslq+bpt6Edh7
 W6fw==
X-Gm-Message-State: APjAAAXVVT2cosLq/NG6yzbDF0F0FSqVHyBcJ/hz2sYdpSiMSe4ez893
 MUyw2x0yPx4lGJ0NXM/kS8R9QE2LLEk=
X-Google-Smtp-Source: APXvYqzj3VKyfWGEVtaJWfsUZAdb+P2hgNFiX/aHdy5YJA+S7oZ9v1cCAZlKpfFiWS4rIxfEQnRPmw==
X-Received: by 2002:a5b:b4f:: with SMTP id b15mr17620098ybr.156.1581628586688; 
 Thu, 13 Feb 2020 13:16:26 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id m62sm1656422ywb.107.2020.02.13.13.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 13:16:26 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/dp_mst: Remove single tx msg restriction.
Date: Thu, 13 Feb 2020 16:15:20 -0500
Message-Id: <20200213211523.156998-4-sean@poorly.run>
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

Now that we can support multiple simultaneous replies, remove the
restrictions placed on sending new tx msgs.

This patch essentially just reverts commit
  5a64967a2f3b ("drm/dp_mst: Have DP_Tx send one msg at a time")
now that the problem is solved in a different way.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++------------
 include/drm/drm_dp_mst_helper.h       |  6 ------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7e6a82efdfc02..cbf0bb0ddeb84 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1203,8 +1203,6 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
 			mstb->tx_slots[txmsg->seqno] = NULL;
 		}
-		mgr->is_waiting_for_dwn_reply = false;
-
 	}
 out:
 	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
@@ -1214,7 +1212,6 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 	}
 	mutex_unlock(&mgr->qlock);
 
-	drm_dp_mst_kick_tx(mgr);
 	return ret;
 }
 
@@ -2797,11 +2794,9 @@ static void process_single_down_tx_qlock(struct drm_dp_mst_topology_mgr *mgr)
 	ret = process_single_tx_qlock(mgr, txmsg, false);
 	if (ret == 1) {
 		/* txmsg is sent it should be in the slots now */
-		mgr->is_waiting_for_dwn_reply = true;
 		list_del(&txmsg->next);
 	} else if (ret) {
 		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
-		mgr->is_waiting_for_dwn_reply = false;
 		list_del(&txmsg->next);
 		if (txmsg->seqno != -1)
 			txmsg->dst->tx_slots[txmsg->seqno] = NULL;
@@ -2841,8 +2836,7 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
 
-	if (list_is_singular(&mgr->tx_msg_downq) &&
-	    !mgr->is_waiting_for_dwn_reply)
+	if (list_is_singular(&mgr->tx_msg_downq))
 		process_single_down_tx_qlock(mgr);
 	mutex_unlock(&mgr->qlock);
 }
@@ -3822,7 +3816,6 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	mutex_lock(&mgr->qlock);
 	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
 	mstb->tx_slots[seqno] = NULL;
-	mgr->is_waiting_for_dwn_reply = false;
 	mutex_unlock(&mgr->qlock);
 
 	wake_up_all(&mgr->tx_waitq);
@@ -3830,9 +3823,6 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	return 0;
 
 out_clear_reply:
-	mutex_lock(&mgr->qlock);
-	mgr->is_waiting_for_dwn_reply = false;
-	mutex_unlock(&mgr->qlock);
 	if (msg)
 		memset(msg, 0, sizeof(struct drm_dp_sideband_msg_rx));
 out:
@@ -4670,7 +4660,7 @@ static void drm_dp_tx_work(struct work_struct *work)
 	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct drm_dp_mst_topology_mgr, tx_work);
 
 	mutex_lock(&mgr->qlock);
-	if (!list_empty(&mgr->tx_msg_downq) && !mgr->is_waiting_for_dwn_reply)
+	if (!list_empty(&mgr->tx_msg_downq))
 		process_single_down_tx_qlock(mgr);
 	mutex_unlock(&mgr->qlock);
 }
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 7d0341f94ce1b..fcc30e64c8e7e 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -619,12 +619,6 @@ struct drm_dp_mst_topology_mgr {
 	 * &drm_dp_sideband_msg_tx.state once they are queued
 	 */
 	struct mutex qlock;
-
-	/**
-	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down reply
-	 */
-	bool is_waiting_for_dwn_reply;
-
 	/**
 	 * @tx_msg_downq: List of pending down replies.
 	 */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
