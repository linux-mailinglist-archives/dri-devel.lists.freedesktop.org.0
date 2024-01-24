Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8D683AA6D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 13:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A2110F72F;
	Wed, 24 Jan 2024 12:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099FC10F6E8;
 Wed, 24 Jan 2024 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706101038; x=1737637038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zcIhCi4x6+7l74AH2vYFwwEcOums63f448w2QQfkNWc=;
 b=is9+nl0B5tos5ZSXxMonryuvAmp220zevjJiFt2es3KHf4+WXqauI6DI
 8VK34guRcM5/jkt67u+K9F0wVgpFyKwAbC2adyWAAZ1GgnDOXQiJ2xkxL
 HFXjbLcdSlkVI2BORf440JWYKSl1V5eVz7l4uZi9Nh2WkiDcLYQ1bzF+F
 VuljZo+f1bFOYURMqzf6jwaPsFE2RylvhtAceiZDXf62om+QeV2mbRSTa
 TLtiMy0m/4ikGBuYu7bqDWrf3zJXzd1KODFBRVTagpidDbTbDJGiKI2UX
 1Qb6C4iJ6cYJ4mEn1zReUzXkfg22EQwqKC56e5IM882+vktTq+UELqDQO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8594383"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8594383"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1898651"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.0.254])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:57:15 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/3] Revert "drm/i915: Wait for active retire before
 i915_active_fini()"
Date: Wed, 24 Jan 2024 13:43:08 +0100
Message-ID: <20240124125643.590072-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
References: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 7a2280e8dcd2f1f436db9631287c0b21cf6a92b0, obsoleted
by "drm/i915/vma: Fix UAF on destroy against retire race".

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 604d420b9e1fd..09b8a6b52d065 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1752,8 +1752,6 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
 	if (vm_ddestroy)
 		i915_vm_resv_put(vma->vm);
 
-	/* Wait for async active retire */
-	i915_active_wait(&vma->active);
 	i915_active_fini(&vma->active);
 	GEM_WARN_ON(vma->resource);
 	i915_vma_free(vma);
-- 
2.43.0

