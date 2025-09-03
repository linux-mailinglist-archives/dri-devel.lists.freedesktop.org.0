Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86988B42CD5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ADD10E957;
	Wed,  3 Sep 2025 22:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfB8Lf39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787D010E953;
 Wed,  3 Sep 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756938969; x=1788474969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QlKuNCAMtPk9JCSXBDnl96Am+2bn0NvDRIGsJ1s4MLo=;
 b=XfB8Lf39j/epDjj7AACYMk1TjeJgewwgi1Tm3r5PtUq1UIH/8NE5H6me
 UozaX37pXFC7IU42QuzCB3JlupkMe3FTDu6g6vCRqjIkmAmSBaH3+JQxM
 olkVD8prhclnI2fD90YIaQvvy4X4gLDfAeZTD6uTMTibTkDGUdMS19U9b
 tborN9qoVmyqQZAs9HovcAzyZJD/13yJN2h1z4Tv5lPw0AvkB9NGu7Aqy
 2Vi71Woh6JvlFpfd15k9YqeYOIS1B2aU9wBXGsCK73mLXwR6SG/SZJsae
 Z0jV678adrV42Tom5LpolcyVAnR8nAmI0HVYBX2lad2oKxWk7Yf7UHgyZ Q==;
X-CSE-ConnectionGUID: xiuMweEQQN2pYHYkygnR0g==
X-CSE-MsgGUID: xlqVPryaQtixStGv798tLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76715636"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76715636"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:08 -0700
X-CSE-ConnectionGUID: A6ZRnzLLQ5+bMBO2gOJNxw==
X-CSE-MsgGUID: F4FNOXQZS4OfyYxy6xhTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="202570673"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 2/5] drm/xe/dmabuf: Don't migrate BO to System RAM while
 running in VF mode
Date: Wed,  3 Sep 2025 15:30:55 -0700
Message-ID: <20250903223403.1261824-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
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

If the importer has allow_peer2peer set to true, then we can expect that
it would be able to handle VRAM addresses. Therefore, in this specific
case and only while running in VF mode, do not migrate the BO to System
RAM before exporting it.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 346f857f3837..2111faed5f46 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -17,6 +17,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_pm.h"
+#include "xe_sriov.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 
@@ -26,8 +27,11 @@ static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 			     struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct xe_device *xe = xe_bo_device(bo);
 
 	if (attach->peer2peer &&
+	    !IS_SRIOV_VF(xe) &&
 	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
 		attach->peer2peer = false;
 
@@ -51,7 +55,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_device *xe = xe_bo_device(bo);
-	int ret;
+	int ret = 0;
 
 	/*
 	 * For now only support pinning in TT memory, for two reasons:
@@ -63,7 +67,8 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return -EINVAL;
 	}
 
-	ret = xe_bo_migrate(bo, XE_PL_TT);
+	if (!IS_SRIOV_VF(xe) || !attach->peer2peer)
+		ret = xe_bo_migrate(bo, XE_PL_TT);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			drm_dbg(&xe->drm,
-- 
2.50.1

