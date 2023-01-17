Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606C66E54A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDF410E309;
	Tue, 17 Jan 2023 17:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8506710E30D;
 Tue, 17 Jan 2023 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673977979; x=1705513979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DuMGS/G4LTVxHNIrzri/UqAockVZVc0JJsaHfXElEPY=;
 b=fvmHzG9F4ZP54rDiyf3OxMm8Y8LRSFne3YNl8j5/3i9A31PFYoT5Cdtb
 jXlRZfe5R7IwgfWkUwgntJkZNbaVZ+uA5b5ktoXNLj2UV43/1FRnRQvL3
 w9RxWhC80DDwZAaNBZV9uIC9jTwW9ICFRsyFE2aqNdRdvc1gizrNFFJrT
 FQXgeSMTVGEhG35ieMKfVKTX1+Airjvb8mob9IDPYf3XPVmRaOFI9rafp
 aI0jfPt5JYhJSYm99pqorQpAAF8R8xUGIYBEOcn9S/FKacqQ9FU887Ba6
 aDoVug8e0U504Iyu1y5R+Fa7O0HtCJVWRfQrA1bT/C+6Q/fG9xkUQxKDg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="389263498"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="389263498"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:52:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783326937"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="783326937"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 09:52:51 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Fix a memory leak with reused mmap_offset
Date: Tue, 17 Jan 2023 18:52:36 +0100
Message-Id: <20230117175236.22317-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117175236.22317-1-nirmoy.das@intel.com>
References: <20230117175236.22317-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_vma_node_allow() and drm_vma_node_revoke() should be called in
balanced pairs. We call drm_vma_node_allow() once per-file everytime a
user calls mmap_offset, but only call drm_vma_node_revoke once per-file
on each mmap_offset. As the mmap_offset is reused by the client, the
per-file vm_count may remain non-zero and the rbtree leaked.

Call drm_vma_node_allow_once() instead to prevent that memory leak.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 4f69bff63068..2aac6bf78740 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -697,7 +697,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
 	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
 out:
 	if (file)
-		drm_vma_node_allow(&mmo->vma_node, file);
+		drm_vma_node_allow_once(&mmo->vma_node, file);
 	return mmo;
 
 err:
-- 
2.39.0

