Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544079A59E0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 07:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E55910E2D0;
	Mon, 21 Oct 2024 05:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE2uvBm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1844710E087;
 Mon, 21 Oct 2024 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729489568; x=1761025568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sCLXIH+f41dp6R34CT4MxqUaL5J7BMa4OgN8f/KYKjs=;
 b=aE2uvBm49b0hpkw9aYle2SEMegtZttn/NKu3MeKEwRrL/uGLyeyuBPpE
 Z+Tltz/+DbwQz0iZo/onOJNak2wsMd1ODzkijPUaGTrJmfJk1o+7f9I/U
 n8/Ut6x1aesTDAbU50ymdcWFvRNQ9cv9JZrNULtbtrhRrL9CKRzYfOPaA
 4FPBGGgbkiBrauioM/epRugFkn2vIFk/99Hy+dIRU8AkiCTxvRqEUSBmA
 nNDKuZlr0T5PU9q1vb43XeZy2s/VPKfBI0q9bIvb1pxAc8zCQUPi8GCep
 usRmpr+k3JS2Umuk84aF9G3be8y0am+RG9uHkRjlMrwackARE0mWEOmJD w==;
X-CSE-ConnectionGUID: cFAZTxNeRzuEsZF882kGfQ==
X-CSE-MsgGUID: 0qgCGTuHT9K0MTa5n0UN+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40345941"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40345941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:07 -0700
X-CSE-ConnectionGUID: IDhJF0GmQqOWk25fJ0TXtA==
X-CSE-MsgGUID: Igy66gfWRe+PEeD+EhpLdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110180210"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:05 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v2 2/5] drm/xe/dmabuf: Don't migrate BO to System RAM while
 running in VF mode
Date: Sun, 20 Oct 2024 22:21:30 -0700
Message-ID: <20241021052236.1820329-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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
index 68f309f5e981..a90c9368d265 100644
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
2.45.1

