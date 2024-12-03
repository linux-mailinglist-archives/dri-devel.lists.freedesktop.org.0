Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB59E2584
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BE210EA86;
	Tue,  3 Dec 2024 16:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KblXPN6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C3110EA86;
 Tue,  3 Dec 2024 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733241716; x=1764777716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+jzMWD2K9MP0F/iPu4a4Vfi4n1HNpD4IUCzlAmn7oU=;
 b=KblXPN6ltOlerT6xK2XX9JK9LnitqZ2mhFU19L5RdH4+e1vZHA6m4i9a
 60UEmlAkNUyFJ1FZY/IY0zmawfmAb3Q7fCkoPkYcfD+L0Mnf0JTFl1SBJ
 28v6mlPN0kmUj7fwn/JPQkzX5VylxSpf1WsrT5ob89DfmEnLrOKWT35NZ
 A0Y+67FLVc+VL8S+DoQ9sKbW+5iH7+B9kw+/yGJluOEicV3DVKvay06a8
 srpnUR+ifSAlGFlEAKMhKYdS3uOGcYlh4KcraOKJDQvjhummZENwC/Eyo
 JPabqKJyN4TYwW6ZYCs1YCgbEbkCx51S0p8S05beXu93hE6EmvCH6Knq4 Q==;
X-CSE-ConnectionGUID: yTXGg4MLTt+4+iqyRpRuHw==
X-CSE-MsgGUID: GYfcscu1TlK6g22adKWGLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37236065"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37236065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:56 -0800
X-CSE-ConnectionGUID: J7DQXDC0TkyT+X7fVZ/6Qg==
X-CSE-MsgGUID: FDFipBAdTNiLpJ2Yb8wytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93313068"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:49 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH 4/7] drm/dp_mst: Fix down request message timeout handling
Date: Tue,  3 Dec 2024 18:02:20 +0200
Message-ID: <20241203160223.2926014-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241203160223.2926014-1-imre.deak@intel.com>
References: <20241203160223.2926014-1-imre.deak@intel.com>
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

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 6ec8680998d5a..95742d82510a7 100644
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
@@ -3995,6 +3995,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 		hdr = &msg->initial_hdr;
 		drm_dbg_kms(mgr->dev, "Got MST reply with no msg %p %d %d %02x %02x\n",
 			    mstb, hdr->seqno, hdr->lct, hdr->rad[0], msg->msg[0]);
+
+		mutex_unlock(&mgr->qlock);
+
 		goto out_clear_reply;
 	}
 
@@ -4013,9 +4016,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
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

