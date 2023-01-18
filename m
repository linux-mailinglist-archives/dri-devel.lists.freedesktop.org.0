Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BF6714CA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15D110E6BC;
	Wed, 18 Jan 2023 07:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699DB10E1E2;
 Wed, 18 Jan 2023 07:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026175; x=1705562175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/VDyBUP2xXmg+UiRPuhQPHslO0IdZ/fMj9xHdT2OQMc=;
 b=FtdOTgCc1ArJTuNO6591fsln0mcyekP6CptvZHZwFfS5m0Xrle6AQse2
 y5POeXmCmxbLrpQnnS7y1IMDz4+TuJ8gYVuvxjdPG8YK7Lo/Co5TkZt08
 1lFCoUiqH85kYCgXlqKQg3836BpbvGAPnAowpI98KD/QISFbo2OjCel3W
 PBdPVDdIK5HrWja9rUxNnIPVFKVmm/oCBOzpQl/EgdktFAdDNrIEmBYw0
 Xt4D447gSnINjMNmpaLCz5q/ymaFX98BW2K5gwROnn97J0vkfKKeJ3b+C
 Gzh9ygQNX+opBpKvk9jG4JN9m/wjnFGZ5iwPCloDSpCYZJ1k2NNIz2njP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482034"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482034"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661609972"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661609972"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:13 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 04/23] drm/i915/vm_bind: Support partially mapped vma
 resource
Date: Tue, 17 Jan 2023 23:15:50 -0800
Message-Id: <20230118071609.17572-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
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

