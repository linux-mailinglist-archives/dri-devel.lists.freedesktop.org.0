Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCC5B15921
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C7910E402;
	Wed, 30 Jul 2025 06:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kL+9d1WI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793A610E40A;
 Wed, 30 Jul 2025 06:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753858298; x=1785394298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wIMfmgq1inzQUR5IBiHoJOD/UxwCy0bAGS6RjjYD/ww=;
 b=kL+9d1WIiWMsbMLOETXPh5veIntyspUYf1gGt8dUR5uK7CDCEH4ppj4x
 yhhnPNRwIR3QxV5+WJ9y9kDlNWBEXu2FVjDBVocgJ5Aw9B6KOLfNenIwM
 Usug+qeQq7CNjgkzqYANVBH3G0dLOZnIatYruczCpNKBHE4VNHSh6pnrF
 dLJB0e+0VN8S8wpxBa+b5MM98mqf4TYEFhgiSjY/bVwLktVP259+XAz2o
 /9CDeF3bhj4HdHfHKcDpP30b+zWesARhO3Y5kUzVZq1uZ0WOHpfV50vHR
 4fWo1dDeIZmdq58C0p2+mXA2piDBkezlojKaDtXBIXs0O7UaWgVhTDCs2 w==;
X-CSE-ConnectionGUID: uALMQ15aQy2vcTp0pVdSUw==
X-CSE-MsgGUID: 0GMxkljrRkq23Eoyy+GtIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66847974"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66847974"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:35 -0700
X-CSE-ConnectionGUID: hJEHgaxBSJKOTchRIpMqLQ==
X-CSE-MsgGUID: df2Bfa/wQECCM2wLrrtGkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162178294"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:32 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Ruhl@freedesktop.org,
	Michael J <michael.j.ruhl@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [RFC v5 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
Date: Wed, 30 Jul 2025 12:19:56 +0530
Message-Id: <20250730064956.1385855-6-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
v3: protect with CONFIG_NET define.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v2
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index bdd9c88674b2..e6e2e6250b70 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -2,6 +2,8 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include <net/genetlink.h>
+#include <uapi/drm/drm_netlink.h>
 
 #include "xe_gt_printk.h"
 #include "xe_hw_error.h"
@@ -776,6 +778,43 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 				(HARDWARE_ERROR_MAX << 1) + 1);
 }
 
+#ifdef CONFIG_NET
+static void
+generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
+{
+	struct sk_buff *msg;
+	void *hdr;
+
+	if (!xe->drm.drm_genl_family)
+		return;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg) {
+		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error multicast event\n");
+		return;
+	}
+
+	hdr = genlmsg_put(msg, 0, 0, xe->drm.drm_genl_family, 0, DRM_RAS_CMD_ERROR_EVENT);
+	if (!hdr) {
+		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
+		nlmsg_free(msg);
+		return;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast(xe->drm.drm_genl_family, msg, 0,
+			  hw_err ?
+			  DRM_GENL_MCAST_UNCORR_ERR
+			  : DRM_GENL_MCAST_CORR_ERR,
+			  GFP_ATOMIC);
+}
+#else
+static void
+generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
+{}
+#endif
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -837,6 +876,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 	}
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
+
+	generate_netlink_event(tile_to_xe(tile), hw_err);
 unlock:
 	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
 }
-- 
2.25.1

