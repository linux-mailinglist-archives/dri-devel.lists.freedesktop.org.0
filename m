Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB8C38FE5
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 04:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC46A10E310;
	Thu,  6 Nov 2025 03:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErGzO9Tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2987510E310;
 Thu,  6 Nov 2025 03:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762400153; x=1793936153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zgNTFpCXM3o9g2ZXsFBLXyEVmzMgXOrMc94PnKAGIk4=;
 b=ErGzO9TpEgJcIzowgQW0hZOVFzq7goc0tFreBFSgD+mliayLMDRqAsc/
 7G8ZvIEQz04Pg8osSDmDoo3ksJ0vb1wiUolJbCiSOwoQr+kTwCpbGCoYp
 MaKvAXwd4zbyNYumPkswtcv+qfpYuQFeSnC8+7S8ZTPUD+o0c6UQQDWE+
 DLewftXlsPnCFO2VKg2eqGPnqgPayaHUlu+YRV6YkVCICJzFC0/vBT2+4
 66Q8NAcelDMHHvqcuo0kDQSgDblTE/yTA0DtYGYVv5K9I+bsc32IJn850
 CQFk9YmWK+CpHD0t2LyJ2Bhnvev6R63jTUTYt2/a6aRlSZZJKpczUtXsB g==;
X-CSE-ConnectionGUID: 5xQVDF3zS9KzGknaqVLryA==
X-CSE-MsgGUID: u6PXnHzOSzWQGJYuik6H3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68367886"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68367886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 19:35:53 -0800
X-CSE-ConnectionGUID: 8eewTtwKTtSfZG6ABkdL9A==
X-CSE-MsgGUID: 9FhqImc5SwqqvQ0/2wOfbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="187351125"
Received: from junxiao.bj.intel.com ([10.238.152.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 19:35:49 -0800
From: Junxiao Chang <junxiao.chang@intel.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 daniele.ceraolospurio@intel.com, alexander.usyskin@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: baoli.zhang@intel.com,
	junxiao.chang@intel.com
Subject: [PATCH] drm/me/gsc: mei interrupt top half should be in irq disabled
 context
Date: Fri,  7 Nov 2025 11:31:52 +0800
Message-ID: <20251107033152.834960-1-junxiao.chang@intel.com>
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

MEI GSC interrupt comes from i915 or xe driver. It has top half and
bottom half. Top half is called from i915/xe interrupt handler. It
should be in irq disabled context.

With RT kernel(PREEMPT_RT enabled), by default IRQ handler is in
threaded IRQ. MEI GSC top half might be in threaded IRQ context.
generic_handle_irq_safe API could be called from either IRQ or
process context, it disables local IRQ then calls MEI GSC interrupt
top half.

This change fixes B580 GPU boot issue with RT enabled.

Fixes: e02cea83d32d ("drm/xe/gsc: add Battlemage support")
Tested-by: Baoli Zhang <baoli.zhang@intel.com>
Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index a415ca4887914..32d509b113915 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -221,7 +221,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 	if (xe->heci_gsc.irq < 0)
 		return;
 
-	ret = generic_handle_irq(xe->heci_gsc.irq);
+	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
 	if (ret)
 		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
 }
@@ -241,7 +241,7 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
 	if (xe->heci_gsc.irq < 0)
 		return;
 
-	ret = generic_handle_irq(xe->heci_gsc.irq);
+	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
 	if (ret)
 		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
 }
-- 
2.43.0

