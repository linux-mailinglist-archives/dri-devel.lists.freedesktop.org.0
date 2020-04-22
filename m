Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F61B4F4E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 23:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADF989CBE;
	Wed, 22 Apr 2020 21:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC94F89C99
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:25:39 +0000 (UTC)
IronPort-SDR: LfEtRmYUQl1MTMHrhlnAZkCBEbcYQLtW37fp6BzdZ6e9gk2W+Q0UaSQrDjOJysmtE9gChKiPyu
 TAZXl/Ai8pRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 14:25:39 -0700
IronPort-SDR: PqY+Cx1Hf0daeeDPHf2FanzBKsgsDRcbD5yX9VWBk79JlEnAVBBDfbApZ0hilRIZsB35bd6kkY
 +i0T5VX9/m2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259208517"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 14:25:39 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/dmabuf: Use scatterlist for_each_sg API
Date: Wed, 22 Apr 2020 17:25:16 -0400
Message-Id: <20200422212519.36276-3-michael.j.ruhl@intel.com>
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

Update open coded for loop to use the standard scatterlist
for_each_sg API.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 0d9124ad549a..7ea4abb6a896 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -7,6 +7,7 @@
 #include <linux/dma-buf.h>
 #include <linux/highmem.h>
 #include <linux/dma-resv.h>
+#include <linux/scatterlist.h>
 
 #include "i915_drv.h"
 #include "i915_gem_object.h"
@@ -40,12 +41,10 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	if (ret)
 		goto err_free;
 
-	src = obj->mm.pages->sgl;
 	dst = sgt->sgl;
-	for (i = 0; i < obj->mm.pages->nents; i++) {
+	for_each_sg(obj->mm.pages->sgl, src, obj->mm.pages->nents, i) {
 		sg_set_page(dst, sg_page(src), src->length, 0);
 		dst = sg_next(dst);
-		src = sg_next(src);
 	}
 
 	if (!dma_map_sg_attrs(attach->dev,
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
