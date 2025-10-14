Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC259BD7D22
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510D010E562;
	Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K79XS+vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8259710E556;
 Tue, 14 Oct 2025 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426039; x=1791962039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yIboQlk5tTaUI55jQ3YOqfrmnwFIGE4cxawB+2dEVu4=;
 b=K79XS+vbLtWz6lSaLKPZyueRZVwkshw1k8MEkAwOC4yAkJpvLtNVDJUT
 v7OXDEYOL/yP8Q+hrmXAeLMxH1fjCFJ7sfgSuPQDLns77qMAW+4Utghb4
 lry5lRlQY5X8cs17xiufbbWJNznF8LPquSuA9tFx/vHSS9AqvJIGpsQ2/
 8uLFLstDZdbxjWtbdYlBe0WWyp2SwxvqN5+N4AAVHgzOFULMwzkMVj3BL
 54/WxOQ0z46XbFm+CbwQzx3M5rb6743zUVYzcV51RcjwdzOjcnjSQcuYb
 b9nXjt+b1FWNMd6XXJiUPKqMpTyqVIdSx3U2I+jZ0bIvPW5+Ms3cFSjsE w==;
X-CSE-ConnectionGUID: ZVtgDrSoRzeZ3jakKI601w==
X-CSE-MsgGUID: dC+sL3DnRxu4ZlJuPUmbpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257139"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257139"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
X-CSE-ConnectionGUID: Qj9972weSA2T1fz3qDmX2A==
X-CSE-MsgGUID: HUAh1kp1Sk2NRbxj6t2KWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369866"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC 5/8] drm/xe/dma_buf: Add support for IOV interconnect
Date: Tue, 14 Oct 2025 00:08:55 -0700
Message-ID: <20251014071243.811884-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
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

Provide an op for supports_interconnects() to indicate to the
dma-buf core and to the exporter that Xe supports interconnects.
Note that Xe would support IOV interconnect only if the buffer
is located in LMEM region.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index a7d67725c3ee..2d63dd86a249 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -13,6 +13,7 @@
 #include <drm/drm_prime.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include "regs/xe_bars.h"
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -274,9 +275,25 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	XE_WARN_ON(xe_bo_evict(bo, exec));
 }
 
+static bool
+xe_dma_buf_supports_interconnects(struct dma_buf_attachment *attach,
+				  const struct dma_buf_interconnect_match *exp,
+				  unsigned int exp_ics)
+{
+	struct pci_dev *pdev = to_pci_dev(attach->dev);
+	unsigned int bar = LMEM_BAR;
+	const struct dma_buf_interconnect_match supports_ics[] = {
+		CREATE_IOV_INTERCONNECT(pdev, bar),
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

