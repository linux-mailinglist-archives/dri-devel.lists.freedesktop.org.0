Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1995BA004
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 18:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7455410EB7F;
	Thu, 15 Sep 2022 16:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7080F10E21E;
 Thu, 15 Sep 2022 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663260751; x=1694796751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7fTWy8K9hDvb/d8jlsXGPYJn9MBqEN7CWCphbo6fxS0=;
 b=QcDWWYjLaQc//MT+r+dd1rAtDpo3dEYVIDqEgwwWybgclA2DxAYiGodp
 S1AMyjeOaiLcKKXMq2Dzr8WuHTFrk06+YxFIM4u4akjOG72IE5sL6zADE
 NOJKICxAe02J26ZSXUqW5FfG4oqpLDXtviwBW7W8eVvWe0M6lEVKoO9nE
 xJQdZFeVZK55rqtRA5RnKA/g7bjSMKqmNF5YGmE5UZCw+93y77NyNbNkQ
 oWMcU25xop+Qt9xF54vEaxJI4L527emxqUqSunPuJDXUa9+LFObkpZQdZ
 Y8YxAw/sFmwUfAlqP0EtuilJmoiYWUP878qLKs11ggUyC5M2mrz6rcAET Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="297497960"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="297497960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 09:52:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; d="scan'208";a="568501604"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO jkrzyszt-mobl1.lan)
 ([10.213.25.71])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 09:52:28 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gem: Flush contexts on driver release
Date: Thu, 15 Sep 2022 18:52:09 +0200
Message-Id: <20220915165210.193197-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915165210.193197-1-janusz.krzysztofik@linux.intel.com>
References: <20220915165210.193197-1-janusz.krzysztofik@linux.intel.com>
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
index f18cc6270b2be..2bdddb61ebd7a 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1231,7 +1231,8 @@ void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 
 	intel_uc_cleanup_firmwares(&to_gt(dev_priv)->uc);
 
-	i915_gem_drain_freed_objects(dev_priv);
+	/* Flush any outstanding work, including i915_gem_context.release_work. */
+	i915_gem_drain_workqueue(dev_priv);
 
 	drm_WARN_ON(&dev_priv->drm, !list_empty(&dev_priv->gem.contexts.list));
 }
-- 
2.25.1

