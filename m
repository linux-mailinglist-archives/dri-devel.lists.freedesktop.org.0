Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE435BA334
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 01:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E9510EC1B;
	Thu, 15 Sep 2022 23:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12C510EC14;
 Thu, 15 Sep 2022 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663284420; x=1694820420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gX+8Yo6Hwg9hXCeGfYgrFgNMD+o/F/NbZDxyewWeGCw=;
 b=fdzhR7ZZaH3Lzwo2W59f3QVPapVi5rwiLsmtV1masiNpFkHY41FYyTT2
 TFh5Ygalu1dknSUpyKdphydS9J5G/51D1mifxg/PVr852k2uk/32pXMzJ
 g6XNgpJAH8Z96dblgRvVr5VYOJetsxrJlftPKxyaupmMcVYlkLOy9P7Ta
 FSr7bltnC9IaM8aweqF1XyjU583l3rcRUlOn09ddky0FYd9tRFFtOXwjY
 cnBb6lJVUQJKpUYgokBpepZgyVkyMO0oE0fIwB9Z2YaMZXpICQTUkQCqI
 ziRj1b6xEqVNMk3htQNNkq/k1FIhiM6POz6pzozGcpavIc8Jhcy35RO4E g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299689109"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299689109"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="685923302"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/i915: Make GEM resume all engines
Date: Thu, 15 Sep 2022 16:26:52 -0700
Message-Id: <20220915232654.3283095-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915232654.3283095-1-matthew.d.roper@intel.com>
References: <20220915232654.3283095-1-matthew.d.roper@intel.com>
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
Cc: Andi Shyti <andi.shyti@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Walk all GTs from i915_gem_resume when resuming engines.

Cc: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 3428f735e786..2c80cc8362b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -212,7 +212,8 @@ int i915_gem_freeze_late(struct drm_i915_private *i915)
 
 void i915_gem_resume(struct drm_i915_private *i915)
 {
-	int ret;
+	struct intel_gt *gt;
+	int ret, i, j;
 
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
 
@@ -224,8 +225,25 @@ void i915_gem_resume(struct drm_i915_private *i915)
 	 * guarantee that the context image is complete. So let's just reset
 	 * it and start again.
 	 */
-	intel_gt_resume(to_gt(i915));
+	for_each_gt(gt, i915, i)
+		if (intel_gt_resume(gt))
+			goto err_wedged;
 
 	ret = lmem_restore(i915, I915_TTM_BACKUP_ALLOW_GPU);
 	GEM_WARN_ON(ret);
+
+	return;
+
+err_wedged:
+	for_each_gt(gt, i915, j) {
+		if (!intel_gt_is_wedged(gt)) {
+			dev_err(i915->drm.dev,
+				"Failed to re-initialize GPU[%u], declaring it wedged!\n",
+				j);
+			intel_gt_set_wedged(gt);
+		}
+
+		if (j == i)
+			break;
+	}
 }
-- 
2.37.3

