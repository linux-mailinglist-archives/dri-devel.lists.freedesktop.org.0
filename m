Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114BE43FAFB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 12:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E996EA48;
	Fri, 29 Oct 2021 10:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC816EA48;
 Fri, 29 Oct 2021 10:41:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="316839209"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="316839209"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 03:41:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="665789624"
Received: from hohiggin-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.197.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 03:41:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 7/8] drm/i915: Drain the ttm delayed workqueue too
Date: Fri, 29 Oct 2021 11:40:25 +0100
Message-Id: <20211029104026.3472621-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211029104026.3472621-1-matthew.auld@intel.com>
References: <20211029104026.3472621-1-matthew.auld@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Lets be thorough here. Users of the TTM backend would likely expect this
behaviour.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 57f2f8da931e..1dc30ee26771 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1818,6 +1818,7 @@ static inline void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
 	 */
 	while (atomic_read(&i915->mm.free_count)) {
 		flush_work(&i915->mm.free_work);
+		flush_delayed_work(&i915->bdev.wq);
 		rcu_barrier();
 	}
 }
-- 
2.26.3

