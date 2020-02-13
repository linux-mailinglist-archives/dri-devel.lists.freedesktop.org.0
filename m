Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841DC15BEBD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 13:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF416F5BD;
	Thu, 13 Feb 2020 12:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10006F5BB;
 Thu, 13 Feb 2020 12:55:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 04:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; d="scan'208";a="222638645"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga007.jf.intel.com with ESMTP; 13 Feb 2020 04:55:24 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4] drm/i915: dont retry stream management at seq_num_m roll
 over
Date: Thu, 13 Feb 2020 18:25:40 +0530
Message-Id: <20200213125540.27293-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When roll over detected for seq_num_m, we shouldn't continue with stream
management with rolled over value.

So we are terminating the stream management retry, on roll over of the
seq_num_m.

v2:
  using drm_dbg_kms instead of DRM_DEBUG_KMS [Anshuman]
v3:
  dev_priv is used as i915 [JaniN]
v4:
  roll over of seq_num_m detected at the start of stream management.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b24d12efae0a..f4b1dd1e62e7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1391,6 +1391,13 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 	const struct intel_hdcp_shim *shim = hdcp->shim;
 	int ret;
 
+	/*
+	 * seq_num_m roll over is possible only when dynamic update of
+	 * content type is supported. But implementing as per the spec.
+	 */
+	if (hdcp->seq_num_m > HDCP_2_2_SEQ_NUM_MAX)
+		return -1;
+
 	/* Prepare RepeaterAuth_Stream_Manage msg */
 	msgs.stream_manage.msg_id = HDCP_2_2_REP_STREAM_MANAGE;
 	drm_hdcp_cpu_to_be24(msgs.stream_manage.seq_num_m, hdcp->seq_num_m);
@@ -1419,11 +1426,6 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 
 err_exit:
 	hdcp->seq_num_m++;
-	if (hdcp->seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
-		DRM_DEBUG_KMS("seq_num_m roll over.\n");
-		ret = -1;
-	}
-
 	return ret;
 }
 
@@ -1618,8 +1620,11 @@ hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 
 	for (i = 0; i < tries; i++) {
 		ret = _hdcp2_propagate_stream_management_info(connector);
-		if (!ret)
+		if (!ret || connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
+			if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX)
+				drm_dbg_kms(&i915->drm, "seq_num_m roll over.\n");
 			break;
+		}
 
 		drm_dbg_kms(&i915->drm,
 			    "HDCP2 stream management %d of %d Failed.(%d)\n",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
