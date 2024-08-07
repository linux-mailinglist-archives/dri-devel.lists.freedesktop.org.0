Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBD094A507
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 12:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D5D10E47E;
	Wed,  7 Aug 2024 10:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp9AzLNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994DE10E47B;
 Wed,  7 Aug 2024 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723025146; x=1754561146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JRUz79fpAWI1fNKyETRX5gvGBqzpi4m3ZbyAHMe+duE=;
 b=bp9AzLNf/zIcfJJ8JLpu3rIj8nQ0TKd+2HHesRh8lATg3oTM+h7oVYRa
 Kjs4q7AfoZeeWT4DrZ0uSNtZfPEuuQz3KEHqJxpQQGnAse3nlxL7+ICBC
 f9LYni4a01a+l/fg9Q2FJEL/v0sajjZIfXe8iwQzgNyo+e0W3Oxg6tCet
 CtVSwwXJW2u9zRssNkqWJBc8dBjleYgEkimWvfLXnomZVoZPSPU3csHvS
 vN83rZM2Dw3eX+pdgIfODEc9OR0lHoWvgPAh3cCHNF0t9YjCBX1A4bPak
 o1SRZy17X7eh493S4YV/Yw/Gm1dfLhoNuI6C5CmPoazSN8wIVSutKFCJs A==;
X-CSE-ConnectionGUID: i94kpyjHS4e3wqlhPnwqMQ==
X-CSE-MsgGUID: EPpGhlUVS4GCcD59uadGZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31659903"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="31659903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:05:46 -0700
X-CSE-ConnectionGUID: 0Z6HQRKdSuuOtmWmonI94g==
X-CSE-MsgGUID: cTDedU03TeGC6IGQvDavJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="57495677"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.245])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 03:05:43 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 1/2] drm/i915/gem: Do not look for the exact address in node
Date: Wed,  7 Aug 2024 11:05:20 +0100
Message-ID: <20240807100521.478266-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807100521.478266-1-andi.shyti@linux.intel.com>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
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
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index cac6d4184506..d3ee8ef7ea2f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -1071,9 +1071,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 
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

