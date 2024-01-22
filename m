Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0908E83652C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF43210EF66;
	Mon, 22 Jan 2024 14:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C929B10EF6E;
 Mon, 22 Jan 2024 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705932645; x=1737468645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mnGFbOuRezsBJQxDAiRKkOdpxMhJ/wEc8kzpYMt4wz4=;
 b=G8mDXsFs1B6Wn96nbFeUCjO0R2Yc5zbVvGAOkB5pPIAzEte9gpC5HWEv
 OHfjL5qkXh36Gf9mrVvmQTy19GJWoFouSbLKJd+c/an04vB0awxJuyy+T
 bA/9xbQqzVX8KQUQMCs6djtjXaJpQ6UYMQDOiTlHo5H0CpmsjKd0pPCPg
 1k1AgrMBSJuTdDfw7a16+lLn0nxbigiH4CLuGKg0MDfrtX6O9XyF6J0kK
 IkHxSehW3CgLh5rtHXsZzJ4FZDXC7k5/Q5AZiRTMLEtPSYZhQ3wNZYrjT
 nsBMzcSm08D/x98dkc09YqkXLg2eTj/HFzwpmrSJ6otPD73dLJm5qDZU6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8313839"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8313839"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="855943864"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="855943864"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.20.214])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:10:39 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/3] Revert "drm/i915: Wait for active retire before
 i915_active_fini()"
Date: Mon, 22 Jan 2024 15:04:44 +0100
Message-ID: <20240122141007.401490-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
References: <20240122141007.401490-5-janusz.krzysztofik@linux.intel.com>
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

This reverts commit 7a2280e8dcd2f1f436db9631287c0b21cf6a92b0, obsoleted by
"drm/i915/vma: Fix UAF on destroy against retire race".

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
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

