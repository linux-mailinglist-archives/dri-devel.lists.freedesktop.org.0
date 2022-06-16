Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B754ED04
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 00:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D04A10EDB6;
	Thu, 16 Jun 2022 22:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F6D10EAD9;
 Thu, 16 Jun 2022 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416996; x=1686952996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tzWrPIFy4CO475j8hdpU6fmursZ4DxlLe9YB8NjSEzQ=;
 b=KnQ3AWmt0Jbbmt3Wthyye05geJhI//xq1GU8lz/JPhSG2vLhJfHvqv+q
 uVcDTjydmAsMt+gnDjAfudLyyY74CFYDQzk8xrGjIfGWlnbbY7iCla/8n
 GwTBBvoAQ5ofpUJHkxGi9G1fTfuHmkUewSpcTdsNz8rJGYz+cMEzg1H2t
 6nBNoC9vt5Q1RPQEwU+EZ3VsJrPI50RGjTEceiXtZ58aUWkn7MEpwIyuV
 FAmRZrZKlzUypw5JmcIEE3W0aq1ThAfueHLNAegn/F/sZFlX9xqOSF8fr
 E+EgQdO9LnRkk3HqqZAEdaOkCL7Bx+TVvNLXsrQn4IzRp3Jl42G/RUw3C w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341016842"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341016842"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583801254"
Received: from dbstims-dev.fm.intel.com ([10.1.27.167])
 by orsmga007.jf.intel.com with ESMTP; 16 Jun 2022 15:03:01 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Check for ct enabled while waiting for response
Date: Thu, 16 Jun 2022 15:01:59 -0700
Message-Id: <20220616220158.15778-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 24 ++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index f01325cd1b62..f07a7666b1ad 100644
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
+		err = -ECANCELED;
 
 	*status = req->status;
 	return err;
@@ -703,11 +708,15 @@ static int ct_send(struct intel_guc_ct *ct,
 
 	intel_guc_notify(ct_to_guc(ct));
 
-	err = wait_for_ct_request_update(&request, status);
+	err = wait_for_ct_request_update(ct, &request, status);
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 	if (unlikely(err)) {
-		CT_ERROR(ct, "No response for request %#x (fence %u)\n",
-			 action[0], request.fence);
+		if (err == -ECANCELED)
+			CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is disabled\n",
+				 action[0], request.fence);
+		else
+			CT_ERROR(ct, "No response for request %#x (fence %u)\n",
+				 action[0], request.fence);
 		goto unlink;
 	}
 
@@ -771,8 +780,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
 	if (unlikely(ret < 0)) {
-		CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
-			 action[0], ERR_PTR(ret), status);
+		if (ret != -ECANCELED)
+			CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
+				 action[0], ERR_PTR(ret), status);
 	} else if (unlikely(ret)) {
 		CT_DEBUG(ct, "send action %#x returned %d (%#x)\n",
 			 action[0], ret, ret);
-- 
2.36.0

