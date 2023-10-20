Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA287D1345
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0E10E5D6;
	Fri, 20 Oct 2023 15:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8887F10E5DA;
 Fri, 20 Oct 2023 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697817379; x=1729353379;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CHmOEA7LHes6zRhZJc6PG3j+zI4CzTMkHzHxbBQXHvY=;
 b=ZDdaJpd1bXFCjGOdO+dxjH48qeIE+vnh7Qcg69d0ut8dFclDrqlVXSKL
 vLm9MfZ/nq67yInqOCkZroJJSCqg8hqYKbi3vs/YaLxx1fPBAGFTqZBzg
 ZBMzUcYEptbToLPuxOUng3Ag5HmrcZO2QVHf72kvHnKnOlotdxw1pss/j
 K3qZvYfpFWLP+LiO5291NvAGE9a1OpV85tMjcOjMY3/AwhNi1BcXsO00L
 IONl08lN+/qte7AB84kf3Jx2sTE4gDyavwu+JibG6QXB8ecoYAgqCjjSQ
 ToHypSEWIXP0SlwfbRlvzefcI7vNmWQzAtKSbGyGRNjeWtdZteksy4B+I A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453000047"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="453000047"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 08:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1088778671"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="1088778671"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 08:56:15 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com, michael.j.ruhl@intel.com
Subject: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
Date: Fri, 20 Oct 2023 21:28:35 +0530
Message-Id: <20231020155835.1295524-6-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
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

Whenever a correctable or an uncorrectable error happens an event is sent
to the corresponding listeners of these groups.

v2: Rebase

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index bab6d4cf0b69..b0befb5e01cb 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -786,6 +786,37 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 				(HARDWARE_ERROR_MAX << 1) + 1);
 }
 
+static void
+generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
+{
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
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -849,6 +880,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 	}
 
 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err), errsrc);
+
+	generate_netlink_event(tile_to_xe(tile), hw_err);
 unlock:
 	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
 }
-- 
2.25.1

