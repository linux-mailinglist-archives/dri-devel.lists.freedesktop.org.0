Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15854951C2E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 15:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8257C10E496;
	Wed, 14 Aug 2024 13:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3q7Fhfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E4010E490;
 Wed, 14 Aug 2024 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723643364; x=1755179364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vTqUHZqA7usgq9kgddnWezt5lRif8yqQwvYqhBZPvwQ=;
 b=l3q7FhfkTyDZtXdHFxXop7aDhEbQVzFSuXJS1rFtlNJmgIXlEo7HfLI4
 ROLylRz0a85WH9Of5mEWlhDj5UudYSOVkHhiyMvuD4qBv2zS+/b7XPZ2t
 U1aFGwgl4x+GOUwRAP6Put0H04BPhChpoUABuYKmhbNSGJ5v01/FxePwi
 V50YqehotGaCNbH7issXUSaDsbfSu4bkL7n8T5s2fvWmqe1uRTQ3JfSAV
 OD/euKlVYITETe3k9IfYpfV1tFBUVnqb/5Ad+h1WQK3pBpWOC0wiUs2OT
 0sJd15KjBKczXOeUbIILEgLhbxDNXPf5OUb2UfZJbQY+Eq+LEF2NhoFUC w==;
X-CSE-ConnectionGUID: +KyHJOobS36tS0+NEHRg9A==
X-CSE-MsgGUID: h8iYObiYTi20FuA0WJyBTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32537654"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="32537654"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:49:24 -0700
X-CSE-ConnectionGUID: 3bBMSLVYQ6+H4QhHWRE71w==
X-CSE-MsgGUID: AQktwF4/SLip961pv9nNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59154321"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 06:48:49 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sima <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 1/2] drm/i915/gem: Do not look for the exact address in node
Date: Wed, 14 Aug 2024 15:48:33 +0200
Message-ID: <20240814134837.116498-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814134837.116498-1-andi.shyti@linux.intel.com>
References: <20240814134837.116498-1-andi.shyti@linux.intel.com>
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

In preparation for the upcoming partial memory mapping feature,
we want to make sure that when looking for a node we consider
also the offset and not just the starting address of the virtual
memory node.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index e9b2424156f0..99fde0a05632 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -1079,9 +1079,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 
 	rcu_read_lock();
 	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
-	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
-						  vma->vm_pgoff,
-						  vma_pages(vma));
+	node = drm_vma_offset_lookup_locked(dev->vma_offset_manager,
+					    vma->vm_pgoff,
+					    vma_pages(vma));
 	if (node && drm_vma_node_is_allowed(node, priv)) {
 		/*
 		 * Skip 0-refcnted objects as it is in the process of being
-- 
2.45.2

