Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60673B945C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 17:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC94D6EB45;
	Thu,  1 Jul 2021 15:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722006EB41;
 Thu,  1 Jul 2021 15:56:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188942710"
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="188942710"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 08:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="457712620"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2021 08:56:02 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.146.9])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 161Fu0L8001058; Thu, 1 Jul 2021 16:56:01 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/guc: Verify result from CTB (de)register action
Date: Thu,  1 Jul 2021 17:55:10 +0200
Message-Id: <20210701155513.2024-2-michal.wajdeczko@intel.com>
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit b839a869dfc9 ("drm/i915/guc: Add support for data
reporting in GuC responses") we missed the hypothetical case
that GuC might return positive non-zero value as success data.

While that would be lucky treated as error case, and at the
end will result in reporting valid -EIO, in the meantime this
value will be passed to ERR_PTR that could be misleading.

v2: rebased

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 43409044528e..a26bb55c0898 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -148,12 +148,15 @@ static int guc_action_register_ct_buffer(struct intel_guc *guc, u32 type,
 		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR, desc_addr),
 		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR, buff_addr),
 	};
+	int ret;
 
 	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
 	GEM_BUG_ON(size % SZ_4K);
 
 	/* CT registration must go over MMIO */
-	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+	ret = intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+
+	return ret > 0 ? -EPROTO : ret;
 }
 
 static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
@@ -177,11 +180,14 @@ static int guc_action_deregister_ct_buffer(struct intel_guc *guc, u32 type)
 		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_DEREGISTER_CTB),
 		FIELD_PREP(HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE, type),
 	};
+	int ret;
 
 	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
 
 	/* CT deregistration must go over MMIO */
-	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+	ret = intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
+
+	return ret > 0 ? -EPROTO : ret;
 }
 
 static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
-- 
2.25.1

