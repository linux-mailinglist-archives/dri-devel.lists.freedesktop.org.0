Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5676CC0BC8A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 05:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66C10E343;
	Mon, 27 Oct 2025 04:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbHNJshL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B3910E340;
 Mon, 27 Oct 2025 04:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761540518; x=1793076518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CvW8mMopgiskI6nzqkjC/nTU7/cwciLyHgd8H3wgFT4=;
 b=QbHNJshLsFEJLyDT7ajPyJqV06up/joj7Z33Gzh8Jgc8yxZtzoJe8iet
 sFO9wDaItV0nt4nzatJTd31hAyMGF84otfCAbmF4EziJFHfX/MWEYh0FH
 uqw65mi5aF79ZP4agAPE9hPCn1fHDPxRaWlP5tNv84XAJ/eO5qSDGVDO9
 gDezEMw177+VYrAmPULvwofOQHsuBJTyP60o8yjn78lvv6bDfNRVktswP
 dFGCJfMilrtJfeRCQr40TBwrvdkzcLF0XqibTGUuzjLQTW9bycskiaRlW
 PL/db/S3xlV1nYICGrZjdjBmOIJuNHPRE4na1jZ1/TP3RHVXjqfi5uYdc A==;
X-CSE-ConnectionGUID: ApQoXmiMRDyEKiRorifocQ==
X-CSE-MsgGUID: TTmEV3kYRpCebeODz0xHrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63515633"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63515633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: dfCdQDeUSoSv6/ji/OIq3Q==
X-CSE-MsgGUID: pIZwa8pPTX+bPw3NeLngRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="188992989"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC v2 5/8] drm/xe/dma_buf: Add support for IOV interconnect
Date: Sun, 26 Oct 2025 21:44:17 -0700
Message-ID: <20251027044712.1676175-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
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

Provide a callback for supports_interconnects() to indicate to
the dma-buf core and to the exporter that Xe supports interconnects.
Note that Xe would support IOV interconnect only if the buffer
is located in VRAM region.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index a7d67725c3ee..4a1aa47efbc6 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -13,6 +13,7 @@
 #include <drm/drm_prime.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include "regs/xe_bars.h"
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -274,9 +275,23 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	XE_WARN_ON(xe_bo_evict(bo, exec));
 }
 
+static bool
+xe_dma_buf_supports_interconnects(struct dma_buf_attachment *attach,
+				  const struct dma_buf_interconnect_match *exp,
+				  unsigned int exp_ics)
+{
+	const struct dma_buf_interconnect_match supports_ics[] = {
+		MATCH_INTERCONNECT(iov_interconnect, attach->dev, LMEM_BAR),
+	};
+
+	return dma_buf_match_interconnects(attach, exp, exp_ics, supports_ics,
+					   ARRAY_SIZE(supports_ics));
+}
+
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
 	.allow_peer2peer = true,
-	.move_notify = xe_dma_buf_move_notify
+	.move_notify = xe_dma_buf_move_notify,
+	.supports_interconnects = xe_dma_buf_supports_interconnects,
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-- 
2.50.1

