Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA7653BD49
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD01A10FF78;
	Thu,  2 Jun 2022 17:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D18310FF82;
 Thu,  2 Jun 2022 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654190494; x=1685726494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gYWKGA6ps5rljbFrsqByZrK10Cher6WfzAT/+WCg2qU=;
 b=kGGBs4ZgfaMxk35m83TFxKYO3C99PBPYPrNpB6DHvIk7OaPQugwDCUpG
 49oSKlDyq8pk4HprjR+gSL2p53KZitOmWcNKpsK3iWO8Y0l5byN7xGe8z
 1cDI39zuC/vL2isxRL1p6jL+x76eJ7CiRGxWpcfAeJtirChr+iWfZM5zg
 A9Kn4Bs3YR44Pv13U3xrFLds/glEJ5dy76CuMHCkbkVtlHTBK9IQI+6cb
 aGioqludlSesHu7/llENHUbIZSXGxpj+f9nQ0sWFVqDmIs/sb9Mpx4y07
 cnkWgCrYqkGyw2JJQJSvdE87jiql7jx9LCzTsT7NVUVl1F27YoN0RfhuT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="362391105"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="362391105"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 10:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="721392067"
Received: from dbstims-dev.fm.intel.com ([10.1.27.167])
 by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2022 10:21:34 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Check ctx while waiting for response
Date: Thu,  2 Jun 2022 10:21:19 -0700
Message-Id: <20220602172119.96324-1-zhanjun.dong@intel.com>
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

We are seeing error message of "No response for request". Some cases happened
while waiting for response and reset/suspend action was triggered. In this
case, no response is not an error, active requests will be cancelled.

This patch will handle this condition and change the error message into
debug message.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index f01325cd1b62..a30a388877e2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -467,7 +467,7 @@ static int ct_write(struct intel_guc_ct *ct,
  * *	0 response received (status is valid)
  * *	-ETIMEDOUT no response within hardcoded timeout
  */
-static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
+static int wait_for_ct_request_update(struct ct_request *req, u32 *status, struct intel_guc_ct *ct)
 {
 	int err;
 
@@ -481,12 +481,14 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 #define GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10
 #define GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000
 #define done \
-	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
+	(!intel_guc_ct_enabled(ct) || FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
 	 GUC_HXG_ORIGIN_GUC)
 	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
 	if (err)
 		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
 #undef done
+	if (!intel_guc_ct_enabled(ct))
+		err = -ECANCELED;
 
 	*status = req->status;
 	return err;
@@ -703,11 +705,15 @@ static int ct_send(struct intel_guc_ct *ct,
 
 	intel_guc_notify(ct_to_guc(ct));
 
-	err = wait_for_ct_request_update(&request, status);
+	err = wait_for_ct_request_update(&request, status, ct);
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 	if (unlikely(err)) {
-		CT_ERROR(ct, "No response for request %#x (fence %u)\n",
-			 action[0], request.fence);
+		if (unlikely(err == ECANCELED))
+			CT_DEBUG(ct, "Request %#x (fence %u) cancelled as CTB is disabled\n",
+				action[0], request.fence);
+		else
+			CT_ERROR(ct, "No response for request %#x (fence %u)\n",
+				action[0], request.fence);
 		goto unlink;
 	}
 
@@ -771,8 +777,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
 	if (unlikely(ret < 0)) {
-		CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
-			 action[0], ERR_PTR(ret), status);
+		if (likely(ret != ECANCELED))
+			CT_ERROR(ct, "Sending action %#x failed (%pe) status=%#X\n",
+				action[0], ERR_PTR(ret), status);
 	} else if (unlikely(ret)) {
 		CT_DEBUG(ct, "send action %#x returned %d (%#x)\n",
 			 action[0], ret, ret);
-- 
2.36.0

