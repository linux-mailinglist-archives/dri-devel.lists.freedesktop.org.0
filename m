Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44FBD7D70
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4059E10E553;
	Tue, 14 Oct 2025 07:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1J7tc/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA98C10E553
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426259; x=1791962259;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dWOU/YB54JB8mobRVlRMThcrVtxvMVg5AUYs7i53RBY=;
 b=D1J7tc/y378FXWYSfTZejxOfmiypZqN3hd9vIfq2STVlfiW1MrbChWdM
 9ardx6v9LJalozze/bGq4dtDzAqwMlMyMKrEWgBtowO/fjpuhHMg7BhAz
 cfTjnNqCO28yYLmR7gset8154DnMdziPWFMhdMvWo5gfgOm48h11yWJA5
 MijzoGS4ygAcUkhYlEFQTlvgTxtuRwpEVVE3hSwVj6M1STufA94iwXSSJ
 P4PqvSqCdIGNxTDpEz1M8KvQRp3QWJU1h3XLCondvqIP7f67kajFF0Q4a
 S/WFVoyJi8TVpeXv9UFqhJfTLA9PiulntW0QO754R9TAIpn0OOa/wUTUZ A==;
X-CSE-ConnectionGUID: fL5bXc9YREGYvYzUCWVk6g==
X-CSE-MsgGUID: 7DxRMAu8Qiin+zLsP2HTnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="65202022"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="65202022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:17:39 -0700
X-CSE-ConnectionGUID: PMukTlZiSA61TUVlVImqkw==
X-CSE-MsgGUID: 33XPr4omTpCo3PLWuiknlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181037697"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:17:37 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 "Wludzik, Jozef" <jozef.wludzik@intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix race condition when mapping dmabuf
Date: Tue, 14 Oct 2025 09:17:25 +0200
Message-ID: <20251014071725.3047287-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: "Wludzik, Jozef" <jozef.wludzik@intel.com>

Fix a race that can occur when multiple jobs submit the same dmabuf.
This could cause the sg_table to be mapped twice, leading to undefined
behavior.

Fixes: e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
Signed-off-by: Wludzik, Jozef <jozef.wludzik@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index e9830ad48d4b..e7277e02840a 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -46,12 +46,13 @@ static inline void ivpu_bo_unlock(struct ivpu_bo *bo)
 
 static struct sg_table *ivpu_bo_map_attachment(struct ivpu_device *vdev, struct ivpu_bo *bo)
 {
-	struct sg_table *sgt = bo->base.sgt;
+	struct sg_table *sgt;
 
 	drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach);
 
 	ivpu_bo_lock(bo);
 
+	sgt = bo->base.sgt;
 	if (!sgt) {
 		sgt = dma_buf_map_attachment(bo->base.base.import_attach, DMA_BIDIRECTIONAL);
 		if (IS_ERR(sgt))
-- 
2.43.0

