Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B941B4F51
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 23:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F4E6E143;
	Wed, 22 Apr 2020 21:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B4089CF4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:25:42 +0000 (UTC)
IronPort-SDR: qoEpUP0li4FIyjSMThflix+uVAykSDmA9r027u62zbzAOQAqyTiZ6obwOnwE10bGMdhvnLk0EW
 JBpieKtg21dg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 14:25:42 -0700
IronPort-SDR: I91SHvx9U7ZexsI52aq7+fsCDfIVOizVTWHkCuUI4Xr9VYkMN1u1UWGSHAR1+hejhZlcmuTEui
 mgZInRj5sh4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259208530"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 14:25:42 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915/dmabuf: Add LMEM support for cpu access and vmap
 interfaces
Date: Wed, 22 Apr 2020 17:25:18 -0400
Message-Id: <20200422212519.36276-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200422212519.36276-1-michael.j.ruhl@intel.com>
References: <20200422212519.36276-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
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
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, jianxin.xiong@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LMEM backed buffer objects do not have struct page information, and
are not WB compatible.  Currently the cpu access and vmap interfaces
only support struct page backed objects.

Update the dma-buf interfaces begin/end_cpu_access and vmap/vunmap
to be LMEM aware.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 402c989cc23d..988778cc8539 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -155,7 +155,10 @@ static void *i915_gem_dmabuf_vmap(struct dma_buf *dma_buf)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 
-	return i915_gem_object_pin_map(obj, I915_MAP_WB);
+	if (i915_gem_object_has_struct_page(obj))
+		return i915_gem_object_pin_map(obj, I915_MAP_WB);
+	else
+		return i915_gem_object_pin_map(obj, I915_MAP_WC);
 }
 
 static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
@@ -201,7 +204,11 @@ static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_dire
 	if (err)
 		goto out;
 
-	err = i915_gem_object_set_to_cpu_domain(obj, write);
+	if (i915_gem_object_has_struct_page(obj))
+		err = i915_gem_object_set_to_cpu_domain(obj, write);
+	else
+		err = i915_gem_object_set_to_wc_domain(obj, write);
+
 	i915_gem_object_unlock(obj);
 
 out:
@@ -222,7 +229,9 @@ static int i915_gem_end_cpu_access(struct dma_buf *dma_buf, enum dma_data_direct
 	if (err)
 		goto out;
 
-	err = i915_gem_object_set_to_gtt_domain(obj, false);
+	if (i915_gem_object_has_struct_page(obj))
+		err = i915_gem_object_set_to_gtt_domain(obj, false);
+
 	i915_gem_object_unlock(obj);
 
 out:
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
