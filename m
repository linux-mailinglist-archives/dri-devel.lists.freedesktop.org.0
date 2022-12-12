Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECA64AB58
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A247D10E2B8;
	Mon, 12 Dec 2022 23:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025EE10E2AA;
 Mon, 12 Dec 2022 23:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670886934; x=1702422934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/VDyBUP2xXmg+UiRPuhQPHslO0IdZ/fMj9xHdT2OQMc=;
 b=VT9t3MObjrWf/gP4g+Sb7D2E4ynWFkTWSb4MKBDmaYnysby2wRL+o5Qy
 1xAB8cy/JPE2noxea68NtRtxyX4slAifhu1VOVJKGvVKqvg4jqETt1rcR
 OLtIpIHwd/tvXPmwzFK7TNG3P2j5NzyV6sZcOerh3fexftpMzswWqcLN5
 IHqVHUyw20bZssJLp1I0NNwf3adgXoAegoZqtlzn+sTNZI4yVCcJEzDob
 JD1Zwtw08y22mBhyt4QtTMhJzhJJKOCzFpY1GAsJ57f7IFP263xybpWfR
 R4Nj7TcDcanJuNVahFhMyp/IPEmkHrqx+s3mz3SwpxHQ9/0BTlMQRE2tJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380196351"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="380196351"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679090312"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="679090312"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:33 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 04/23] drm/i915/vm_bind: Support partially mapped vma
 resource
Date: Mon, 12 Dec 2022 15:15:08 -0800
Message-Id: <20221212231527.2384-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As persistent vmas can be partialled mapped to an object,
remove restriction which require vma resource sg table to
be just pointer to object's sg table.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 34f0e6c923c2..79b2e19a299f 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -2060,8 +2060,7 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
 	if (!drm_mm_node_allocated(&vma->node))
 		return NULL;
 
-	if (i915_vma_is_pinned(vma) ||
-	    &vma->obj->mm.rsgt->table != vma->resource->bi.pages)
+	if (i915_vma_is_pinned(vma))
 		return ERR_PTR(-EAGAIN);
 
 	/*
-- 
2.21.0.rc0.32.g243a4c7e27

