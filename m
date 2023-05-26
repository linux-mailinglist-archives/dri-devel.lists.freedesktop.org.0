Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA7712A85
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 18:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F93E10E814;
	Fri, 26 May 2023 16:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BA310E810;
 Fri, 26 May 2023 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685118072; x=1716654072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sgOX7MektjDiLCtSkbg/yakhC4VrhPBC3qAodGV6VKM=;
 b=Oy2f1OAV9zLzP/wCIZU5XbanLRyib/TRue3RPvJ6XVCkFgLP/RyjWx2y
 MQ9ApwgcOS3fYd77InL1rjDnKnnjY9YcJhzz/JSCv1f72b7u3MVr9i370
 1QSLJMWh7+dkchzkROV0SvrWvjKxX8XJj39h5pRs10vG/r0Yo/W9anq2v
 Me8nxZOHl4wJLnn8XtWAUfDKQxCT28tqFbZXEQfNaKNn1lWaf0quaCCrt
 pctN6UPnkStgtSi+TtEyQ2S+W5nBHCoEWYzb0k3zCOSdT+4yYMTUMkMAn
 BMQ2Z9SOV77gaiT+oZM40EFLwrwvsPLbWlx9mBJ7QiaQKHtRzD6D2K8RI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="343735873"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="343735873"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="849620151"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="849620151"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:21:09 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 5/5] drm/xe/RAS: send multicast event on occurrence of an error
Date: Fri, 26 May 2023 21:50:16 +0530
Message-Id: <20230526162016.428357-6-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
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
Cc: alexander.deucher@amd.com, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever a correctable or an uncorrectable error happens an event is sent
to the corresponding listeners of these groups.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c     | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_netlink.c |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 226be96e341a..1b415c8585a4 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -1073,6 +1073,37 @@ xe_gsc_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 	xe_mmio_write32(gt, GSC_HEC_CORR_UNCORR_ERR_STATUS(base, hw_err).reg, err_status);
 }
 
+static void generate_netlink_event(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	struct xe_device *xe = gt->xe;
+	struct sk_buff *msg;
+	void *hdr;
+
+	if (!xe->xe_genl_family.module)
+		return;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg) {
+		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error multicast event\n");
+		return;
+	}
+
+	hdr = genlmsg_put(msg, 0, 0, &xe->xe_genl_family, 0, DRM_CMD_ERROR_EVENT);
+	if (!hdr) {
+		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
+		nlmsg_free(msg);
+		return;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast(&xe->xe_genl_family, msg, 0,
+			  hw_err ?
+			  DRM_GENL_MCAST_UNCORR_ERR
+			  : DRM_GENL_MCAST_CORR_ERR,
+			  GFP_ATOMIC);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 {
@@ -1103,6 +1134,7 @@ xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 
 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
 
+	generate_netlink_event(gt, hw_err);
 out_unlock:
 	spin_unlock_irqrestore(&gt_to_xe(gt)->irq.lock, flags);
 }
diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
index 2a6965f5cde9..0c1d51e1a9a5 100644
--- a/drivers/gpu/drm/xe/xe_netlink.c
+++ b/drivers/gpu/drm/xe/xe_netlink.c
@@ -490,6 +490,8 @@ static void xe_genl_family_init(struct xe_device *xe)
 	xe->xe_genl_family.ops = xe_genl_ops;
 	xe->xe_genl_family.n_ops = ARRAY_SIZE(xe_genl_ops);
 	xe->xe_genl_family.maxattr = DRM_ATTR_MAX;
+	xe->xe_genl_family.mcgrps = drm_event_mcgrps;
+	xe->xe_genl_family.n_mcgrps = ARRAY_SIZE(drm_event_mcgrps);
 	xe->xe_genl_family.module = THIS_MODULE;
 }
 
-- 
2.25.1

