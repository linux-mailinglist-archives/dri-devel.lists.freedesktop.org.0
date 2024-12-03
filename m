Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895A9E2583
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6CD10EA87;
	Tue,  3 Dec 2024 16:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvWsbJK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC79710EA86;
 Tue,  3 Dec 2024 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733241715; x=1764777715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k8fwvjctETWNOv+QwoVYOowJ+wYnbUTYofPb3m49Mdc=;
 b=kvWsbJK1Bx3SJo+gtxciab0amRL+Lmtvic/RPAaC99gvosJgwoljrkpZ
 MVQ4NStnE8tOmzQ/C41LCxhKCF67vhcXrtSqj9HoXPgg0SinI5p8Q8y5V
 ddVxUMGc7oMtBmhezMjtFFKJhFtxM4BZZzWgHfmTdVj4L45Jhtd+LYgac
 /T585JusZrh8MmL2mIbyvujyopyg+S7hrlWk9dpGuHUS/rcHJEAUJOcEw
 0INaw+rFZKEBfKAc5cjDzJA9VQOx0htPXvsmVeBRoRtqX5f6LoICvvsYx
 gLzqHuUGM7TgTbZ3hLecrSeuMo3Jdh6Jhz92w3h3ASTNkGTAVDx69tNsR Q==;
X-CSE-ConnectionGUID: l4B6RaZ8TfiauAXyYGpu3Q==
X-CSE-MsgGUID: RkimLKdTSBOKU1kgVDe2ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37236057"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37236057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:55 -0800
X-CSE-ConnectionGUID: cKg/nNRNTwCnWzdj/GfRCw==
X-CSE-MsgGUID: FN9XY4kVRFepH3HXPFPbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93313039"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:46 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/7] drm/dp_mst: Verify request type in the corresponding down
 message reply
Date: Tue,  3 Dec 2024 18:02:18 +0200
Message-ID: <20241203160223.2926014-3-imre.deak@intel.com>
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

After receiving the response for an MST down request message, the
response should be accepted/parsed only if the response type matches
that of the request. Ensure this by checking if the request type code
stored both in the request and the reply match, dropping the reply in
case of a mismatch.

This fixes the topology detection for an MST hub, as described in the
Closes link below, where the hub sends an incorrect reply message after
a CLEAR_PAYLOAD_TABLE -> LINK_ADDRESS down request message sequence.

Cc: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12804
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 1475aa95ab6b2..bcf3a33123be1 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3941,6 +3941,34 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	return true;
 }
 
+static int get_msg_request_type(u8 data)
+{
+	return data & 0x7f;
+}
+
+static bool verify_rx_request_type(struct drm_dp_mst_topology_mgr *mgr,
+				   const struct drm_dp_sideband_msg_tx *txmsg,
+				   const struct drm_dp_sideband_msg_rx *rxmsg)
+{
+	const struct drm_dp_sideband_msg_hdr *hdr = &rxmsg->initial_hdr;
+	const struct drm_dp_mst_branch *mstb = txmsg->dst;
+	int tx_req_type = get_msg_request_type(txmsg->msg[0]);
+	int rx_req_type = get_msg_request_type(rxmsg->msg[0]);
+	char rad_str[64];
+
+	if (tx_req_type == rx_req_type)
+		return true;
+
+	drm_dp_mst_rad_to_str(mstb->rad, mstb->lct, rad_str, sizeof(rad_str));
+	drm_dbg_kms(mgr->dev,
+		    "Got unexpected MST reply, mstb: %p seqno: %d lct: %d rad: %s rx_req_type: %s (%02x) != tx_req_type: %s (%02x)\n",
+		    mstb, hdr->seqno, mstb->lct, rad_str,
+		    drm_dp_mst_req_type_str(rx_req_type), rx_req_type,
+		    drm_dp_mst_req_type_str(tx_req_type), tx_req_type);
+
+	return false;
+}
+
 static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
@@ -3970,6 +3998,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 		goto out_clear_reply;
 	}
 
+	if (!verify_rx_request_type(mgr, txmsg, msg))
+		goto out_clear_reply;
+
 	drm_dp_sideband_parse_reply(mgr, msg, &txmsg->reply);
 
 	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
-- 
2.44.2

