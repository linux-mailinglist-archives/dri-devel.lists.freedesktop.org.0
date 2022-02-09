Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBEB4AEFDC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 12:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EEA10E53C;
	Wed,  9 Feb 2022 11:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1F410E1CD;
 Wed,  9 Feb 2022 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644405422; x=1675941422;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/8ej1AJ9lDBUSnwNajY3oWEcUtB5azsbYBwrM8rFS9E=;
 b=BcqpUkPNOVtKyIX/z1jGHtF0D3X/+4klwpuikYTak5lSDheklFcrbslZ
 ZcS1DZnav/DpNZXY8GvAiiade1asmtUzlz+qUkhpdTI6mgg+5qzdW2KM/
 GFd5fUdniSkYNUixAXcL4kwbSedsFhlxp0STs2RJwj6jmLBaWNrK9pWGc
 k8GHWDWAN9YzKdDafRc30kixvgrqJOiQ2+mk0DcDZhtt2Z55SJ29VFO58
 5x/0s1ORQluvnNK/gCaoB0latc5wKgDq/8Dde2RmP7QcfRxwu+oizq9Ga
 QiuWc+7Xc2TaE2rHBT0IJA8BPahUQ2ibtWdB1zLBqWwD4SeEIav/+DRdU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249388837"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="249388837"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 03:17:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="585533237"
Received: from gbwalsh-mobl6.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 03:17:01 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: tweak priority hint selection
Date: Wed,  9 Feb 2022 11:16:52 +0000
Message-Id: <20220209111652.468762-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For some reason we are selecting PRIO_HAS_PAGES when we don't have
mm.pages, and vice versa.

v2(Thomas):
  - Add missing fixes tag

Fixes: 213d50927763 ("drm/i915/ttm: Introduce a TTM i915 gem object backend")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 84cae740b4a5..1eb2fd81c5b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -840,11 +840,9 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
 		bo->priority = I915_TTM_PRIO_PURGE;
 	} else if (!i915_gem_object_has_pages(obj)) {
-		if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
-			bo->priority = I915_TTM_PRIO_HAS_PAGES;
+		bo->priority = I915_TTM_PRIO_NO_PAGES;
 	} else {
-		if (bo->priority > I915_TTM_PRIO_NO_PAGES)
-			bo->priority = I915_TTM_PRIO_NO_PAGES;
+		bo->priority = I915_TTM_PRIO_HAS_PAGES;
 	}
 
 	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
-- 
2.34.1

