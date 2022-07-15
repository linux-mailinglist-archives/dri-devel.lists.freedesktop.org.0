Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F2576F34
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C82810F18B;
	Sat, 16 Jul 2022 14:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E607110E153;
 Fri, 15 Jul 2022 22:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657923208; x=1689459208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g4fFp5ecwvNINqM2RksISMoMdqI1f5fQUGgvCXMkIEA=;
 b=KGaaafoSa62cnOhvBVHHkCNIEbTP3mHqiq7oNUm/YVg8JtUEXRF3tZcy
 xxP2bXjo0l5xHwDXBDI4UHMYPogxkRUfzWR5FDxTgWla4hd0IYKkUGpwY
 Cymty/zN7QizSzQAZKVLHgWg3DoDeMgMgzJNibmCQwHcaN71fLYSInrdL
 A7Of4pSMf2Y3WdWShpzzlgE62YUKhVVzXwz/3mmf1eCaVSLTGUbubAyLU
 1JBgFsgG2Xff2wVajqll1fVDNmERxO/7uI1WE40bRVQEyGUhQupJUATu2
 B6UI/8Y6aJCUYwtAP5F4HYV355ZxoO7Gr/Kk0bzQa89T0OiTaSpmIR2cl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="347597744"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="347597744"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 15:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="773134444"
Received: from dbstims-dev.fm.intel.com ([10.1.27.167])
 by orsmga005.jf.intel.com with ESMTP; 15 Jul 2022 15:13:26 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Check for ct enabled while waiting for response
Date: Fri, 15 Jul 2022 14:13:13 -0700
Message-Id: <20220715211313.143645-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.36.0
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are seeing error message of "No response for request". Some cases
happened while waiting for response and reset/suspend action was triggered.
In this case, no response is not an error, active requests will be
cancelled.

This patch will handle this condition and change the error message into
debug message.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 27 +++++++++++++++++------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index f01325cd1b62..74194c11234d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -455,6 +455,7 @@ static int ct_write(struct intel_guc_ct *ct,
 
 /**
  * wait_for_ct_request_update - Wait for CT request state update.
+ * @ct:		pointer to CT
  * @req:	pointer to pending request
  * @status:	placeholder for status
  *
@@ -467,9 +468,10 @@ static int ct_write(struct intel_guc_ct *ct,
  * *	0 response received (status is valid)
  * *	-ETIMEDOUT no response within hardcoded timeout
  */
-static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+static int wait_for_ct_request_update(struct intel_guc_ct *ct, struct ct_request *req, u32 *status)
 {
 	int err;
+	bool ct_enabled;
 
 	/*
 	 * Fast commands should complete in less than 10us, so sample quickly
@@ -481,12 +483,15 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 #define GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10
 #define GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000
 #define done \
-	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
+	(!(ct_enabled = intel_guc_ct_enabled(ct)) || \
+	 FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
 	 GUC_HXG_ORIGIN_GUC)
 	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
 	if (err)
 		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
 #undef done
+	if (!ct_enabled)
+		err = -ENODEV;
 
 	*status = req->status;
 	return err;
@@ -703,11 +708,18 @@ static int ct_send(struct intel_guc_ct *ct,
 
 	intel_guc_notify(ct_to_guc(ct));
 
-	err = wait_for_ct_request_update(&request, status);
+	err = wait_for_ct_request_update(ct, &request, status);
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 	if (unlikely(err)) {
-		CT_ERROR(ct, "No response for request %#x (fence %u)\n",
-			 action[0], request.fence);
+		if (err == -ENODEV)
+			/* wait_for_ct_request_update returns -ENODEV on reset/suspend in progress.
+			 * In this case, output is debug rather than error info
+			 */
+			CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is disabled\n",
+				 action[0], request.fence);
+		else
+			CT_ERROR(ct, "No response for request %#x (fence %u)\n",
+				 action[0], request.fence);
 		goto unlink;
 	}
 
@@ -771,8 +783,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
 	if (unlikely(ret < 0)) {
-		CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
-			 action[0], ERR_PTR(ret), status);
+		if (ret != -ENODEV)
+			CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
+				 action[0], ERR_PTR(ret), status);
 	} else if (unlikely(ret)) {
 		CT_DEBUG(ct, "send action %#x returned %d (%#x)\n",
 			 action[0], ret, ret);
-- 
2.36.0

