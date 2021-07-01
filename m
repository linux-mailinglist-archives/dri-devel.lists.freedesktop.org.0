Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F092B3B9464
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 17:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0D6EB4C;
	Thu,  1 Jul 2021 15:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8986EB47;
 Thu,  1 Jul 2021 15:56:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208511927"
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="208511927"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 08:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="426205293"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga002.jf.intel.com with ESMTP; 01 Jul 2021 08:56:04 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.146.9])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 161Fu0LB001058; Thu, 1 Jul 2021 16:56:03 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/guc: Move and improve error message for missed
 CTB reply
Date: Thu,  1 Jul 2021 17:55:13 +0200
Message-Id: <20210701155513.2024-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210701155513.2024-1-michal.wajdeczko@intel.com>
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
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
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we timeout waiting for a CT reply we print very simple error
message. Improve that and by moving error reporting to the caller
we can use CT_ERROR instead of DRM_ERROR and report just fence
as error code will be reported later anyway.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 8110586ce1fd..f488a51e1ebe 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -490,9 +490,6 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 		err = wait_for(done, 10);
 #undef done
 
-	if (unlikely(err))
-		DRM_ERROR("CT: fence %u err %d\n", req->fence, err);
-
 	*status = req->status;
 	return err;
 }
@@ -536,8 +533,11 @@ static int ct_send(struct intel_guc_ct *ct,
 	intel_guc_notify(ct_to_guc(ct));
 
 	err = wait_for_ct_request_update(&request, status);
-	if (unlikely(err))
+	if (unlikely(err)) {
+		CT_ERROR(ct, "No response for request %#x (fence %u)\n",
+			 action[0], request.fence);
 		goto unlink;
+	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 		err = -EIO;
-- 
2.25.1

