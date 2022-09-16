Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE0E5BA957
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 11:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A5110ED0F;
	Fri, 16 Sep 2022 09:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAA410E2CE;
 Fri, 16 Sep 2022 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663320278; x=1694856278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vV6j1rx86g5hJHxWDoqFdng4mIpPMQDNCjE9yuGTSic=;
 b=ZrZ+LDDitCE8S7xar7BQ0WgakQx0aeOmf+jDHXhXWE/KJvKrNO4+6wC7
 uM2QmvYsoVkgF3vWFaXZ27x1IdfAkSKygwPMTwVDG74CIBRwCBpfpEkIG
 3ZhR/VdoZ/h9mzbPSyKQ1ARUlPlw5GRrvy50vzSCpqaQmnecwOjnAZuko
 /WB1E9hD+AUZfF9Mr0pYKJOoApkAUE2X1+kT+3e60B1lz1h4S+YbYU60V
 jOz/V0VNUi5gDT/Z+I8LhrPwZ842S1szEgy1wZeEhKwowUtS/TdGqt0Q+
 QQQPrspFisElcxWICn8sAXlRAzEl+kKFutOy0m5+UBkp4OoR7whSrq7cQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="296540770"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="296540770"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:24:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="743277646"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO jkrzyszt-mobl1.lan)
 ([10.213.25.54])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:24:35 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/i915/gem: Flush contexts on driver release
Date: Fri, 16 Sep 2022 11:24:02 +0200
Message-Id: <20220916092403.201355-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916092403.201355-1-janusz.krzysztofik@linux.intel.com>
References: <20220916092403.201355-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to i915_perf assuming that it can use the i915_gem_context reference
to protect its i915->gem.contexts.list iteration, we need to defer removal
of the context from the list until last reference to the context is put.
However, there is a risk of triggering kernel warning on contexts list not
empty at driver release time if we deleagate that task to a worker for
i915_gem_context_release_work(), unless that work is flushed first.
Unfortunately, it is not flushed on driver release.  Fix it.

Instead of additionally calling flush_workqueue(), either directly or via
a new dedicated wrapper around it, replace last call to
i915_gem_drain_freed_objects() with existing i915_gem_drain_workqueue()
that performs both tasks.

Fixes: 75eefd82581f ("drm/i915: Release i915_gem_context from a worker")
Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@kernel.org # v5.16+
---
 drivers/gpu/drm/i915/i915_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index c8e14ed9c2a96..172c29a15f118 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1195,7 +1195,8 @@ void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 
 	intel_uc_cleanup_firmwares(&to_gt(dev_priv)->uc);
 
-	i915_gem_drain_freed_objects(dev_priv);
+	/* Flush any outstanding work, including i915_gem_context.release_work. */
+	i915_gem_drain_workqueue(dev_priv);
 
 	drm_WARN_ON(&dev_priv->drm, !list_empty(&dev_priv->gem.contexts.list));
 }
-- 
2.25.1

