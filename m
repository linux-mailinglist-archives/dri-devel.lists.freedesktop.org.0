Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D09E29C6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D78C10EAF0;
	Tue,  3 Dec 2024 17:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJbU0UBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D99310EAF0;
 Tue,  3 Dec 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733247955; x=1764783955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tqb7zp0+menYzgwWCTZOrH67+2p8i2CZtaOqiZ0YxJk=;
 b=VJbU0UBo1KbdhtlRJtmGnI3jI7hfiOzsT1ZpsgkkXcMwZfRbF7ttPmDR
 c20MaDJLpHrT7t2O2OokR2ctvx/do7RJIyNr5SgyFgKArus2K3bGILdXl
 2DsvOML98NctSsUizoUqbFDogwdz7P7i/vuXbRnNRApBStycHahn/Fir6
 upVbhAcvhmxnlkKwasjCildVGZUBm40xcym6VkHRsPvOle3Vpg05El7nf
 cQGLD95QuTXItq/wHlTvn0D1b0MtzznElCQXppxRTLytasFqvEqCWBiWv
 gc5FT9mSKTD909GZkUIbIdHTpWR0uUw/DKzHItMj1bk/IQoDDAgAJlagJ A==;
X-CSE-ConnectionGUID: tSEXMSrzTOqHIbfRvFNijQ==
X-CSE-MsgGUID: 7p+Lh/XRRNSlR4GwKGoO8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33355504"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33355504"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 09:45:54 -0800
X-CSE-ConnectionGUID: GTcp+KC8RC64mDWhKpQCDA==
X-CSE-MsgGUID: s4gziCP8Sqy0Cy0h7TvDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="97569894"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 09:45:53 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 4/7] drm/dp_mst: Fix down request message timeout handling
Date: Tue,  3 Dec 2024 19:46:32 +0200
Message-ID: <20241203174632.2941402-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241203160223.2926014-5-imre.deak@intel.com>
References: <20241203160223.2926014-5-imre.deak@intel.com>
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

If receiving a reply for an MST down request message times out, the
thread receiving the reply in drm_dp_mst_handle_down_rep() could try to
dereference the drm_dp_sideband_msg_tx txmsg request message after the
thread waiting for the reply - calling drm_dp_mst_wait_tx_reply() - has
timed out and freed txmsg, hence leading to a use-after-free in
drm_dp_mst_handle_down_rep().

Prevent the above by holding the drm_dp_mst_topology_mgr::qlock in
drm_dp_mst_handle_down_rep() for the whole duration txmsg is looked up
from the request list and dereferenced.

v2: Fix unlocking mgr->qlock after verify_rx_request_type() fails.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 6ec8680998d5a..ab21855d5c0f7 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3984,9 +3984,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 
 	/* find the message */
 	mutex_lock(&mgr->qlock);
+
 	txmsg = list_first_entry_or_null(&mgr->tx_msg_downq,
 					 struct drm_dp_sideband_msg_tx, next);
-	mutex_unlock(&mgr->qlock);
 
 	/* Were we actually expecting a response, and from this mstb? */
 	if (!txmsg || txmsg->dst != mstb) {
@@ -3995,11 +3995,17 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 		hdr = &msg->initial_hdr;
 		drm_dbg_kms(mgr->dev, "Got MST reply with no msg %p %d %d %02x %02x\n",
 			    mstb, hdr->seqno, hdr->lct, hdr->rad[0], msg->msg[0]);
+
+		mutex_unlock(&mgr->qlock);
+
 		goto out_clear_reply;
 	}
 
-	if (!verify_rx_request_type(mgr, txmsg, msg))
+	if (!verify_rx_request_type(mgr, txmsg, msg)) {
+		mutex_unlock(&mgr->qlock);
+
 		goto out_clear_reply;
+	}
 
 	drm_dp_sideband_parse_reply(mgr, msg, &txmsg->reply);
 
@@ -4013,9 +4019,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 			    txmsg->reply.u.nak.nak_data);
 	}
 
-	mutex_lock(&mgr->qlock);
 	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
 	list_del(&txmsg->next);
+
 	mutex_unlock(&mgr->qlock);
 
 	wake_up_all(&mgr->tx_waitq);
-- 
2.44.2

