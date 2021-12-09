Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87946EF55
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F04C10E4EA;
	Thu,  9 Dec 2021 16:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B9C10E11D;
 Thu,  9 Dec 2021 13:26:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="262199663"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="262199663"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:26:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="480335571"
Received: from achlenov-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.252.52.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 05:26:02 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 06/11] drm/i915/gvt: Use to_gt() helper
Date: Thu,  9 Dec 2021 15:25:07 +0200
Message-Id: <20211209132512.47241-7-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211209132512.47241-1-andi.shyti@linux.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

Use to_gt() helper consistently throughout the codebase.
Pure mechanical s/i915->gt/to_gt(i915). No functional changes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.c       | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index cbac409f6c8a..f0b69e4dcb52 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -205,7 +205,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	spin_lock_init(&gvt->scheduler.mmio_context_lock);
 	mutex_init(&gvt->lock);
 	mutex_init(&gvt->sched_lock);
-	gvt->gt = &i915->gt;
+	gvt->gt = to_gt(i915);
 	i915->gvt = gvt;
 
 	init_device_info(gvt);
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 6c804102528b..42a0c9ae0a73 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1386,7 +1386,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 	enum intel_engine_id i;
 	int ret;
 
-	ppgtt = i915_ppgtt_create(&i915->gt, I915_BO_ALLOC_PM_EARLY);
+	ppgtt = i915_ppgtt_create(to_gt(i915), I915_BO_ALLOC_PM_EARLY);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
-- 
2.34.1

