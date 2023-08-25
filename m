Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E3E78865C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D4310E65A;
	Fri, 25 Aug 2023 11:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6467E10E65E;
 Fri, 25 Aug 2023 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964291; x=1724500291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGFA7cVOFIYfuUhtWfapoqZZyr0cpZq5xvDFfc0NSRg=;
 b=np2RiRP4Sju5nvEmtzvgYoOrHiltzPktpiNxeAUXdmtCKXPYcDV9jD61
 iepBkv0H8Wyzov+ZLbcMFke4UCHyZhaGsFL0bnmPAtczEfpZfb4cEr0Az
 ftsoXhR6Om7Z8UJgd7WUChj2DsoQG10cEIEF+C9lxdl2XIvEWVFehpE3T
 OkHNUK1lKXaxDIdthDxNJW9o8/RjplMgvSiSGFSFlRcaKEveMNql0LthV
 M9C8/182w3t5VOIecha+m4VPf7TkByzWotXersH2t0UDWXiYVlLObipn7
 zyap4zKdjvfYzjxzEJ1uloig/awQuz3Bw9oNEidL4BJ7CuczfZ8S2+PAx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359694753"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="359694753"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="881153541"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:51:34 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
Date: Fri, 25 Aug 2023 17:25:31 +0530
Message-Id: <20230825115531.800574-6-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
References: <20230825115531.800574-1-aravind.iddamsetty@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever a correctable or an uncorrectable error happens an event is sent
to the corresponding listeners of these groups.

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 226be96e341a..5eb041d7e07c 100644
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
+	if (!xe->drm.drm_genl_family.module)
+		return;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg) {
+		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error multicast event\n");
+		return;
+	}
+
+	hdr = genlmsg_put(msg, 0, 0, &xe->drm.drm_genl_family, 0, DRM_RAS_CMD_ERROR_EVENT);
+	if (!hdr) {
+		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
+		nlmsg_free(msg);
+		return;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast(&xe->drm.drm_genl_family, msg, 0,
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
-- 
2.25.1

