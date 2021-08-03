Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECD33DEE30
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 14:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE96E84A;
	Tue,  3 Aug 2021 12:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1346E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 12:49:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d8so25168942wrm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m3MXCvzEqyo9ndGDHESV6jxPo7OYmzg239P5qATHijY=;
 b=J52wYPGV1lANlow572zAMYnlHUxBZ6xUiIZ8jdP2w0KHnT1AcXKL4E3nzFAd/0ATSO
 30X6LR5HSnH+R/8cvLvHhGDWPJyLVaDJQXVFlY/cUrum+QE7xd7C3C+5ZSCUc/QzXDAG
 2oPKdcXGc4W1H/BzswXNi6cqUwA8RtSq6Ozns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m3MXCvzEqyo9ndGDHESV6jxPo7OYmzg239P5qATHijY=;
 b=G8eLtD5Zpg9TfrIrkd6jpEzWaRnc7tcHQQgwen5+8l5t28uPK92h5AIDHKxk9r5AiJ
 BeLlg+M7cXJR2t99sFf+FepU3kTDJpyC1M76w05v/718MR/+Pm+OuK37XcP4mM7M7352
 s5cdhhkd00PVaczBWj4tBd+omtVoOZyQuewznYgBUHlr3kQslMa4LPMO2TCqVJNPdBuC
 yLF2u0KtgRDkRYjfh447W6ITcGrC8JGA0/vi9TCoCBacnOlosyAzMdSJiIAYAbnKOA6y
 ONFehZoIW3rSwsQ84NNfjE07RwNz5aauuRtLgkZnnNzYmvZ2NdIy5DH9sQe5mI7JbV9G
 YjCg==
X-Gm-Message-State: AOAM532roC8wUyslUrCcL88ScZCwSsJ9MeLOQmR9B0w0o/KxPvEHYzfq
 WIkxSU/dfUipaQA1uQI1P86q/w==
X-Google-Smtp-Source: ABdhPJwQWv+MBGD8S7cGOR5oxPkRM/EwzNAdKKl89DrUugbMuNNXnptFjkYMTCfYRw8bhzh6O41GdQ==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr22598899wrz.36.1627994950421; 
 Tue, 03 Aug 2021 05:49:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z2sm13101678wma.45.2021.08.03.05.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:49:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH 1/2] drm/i915: Disable gpu relocations
Date: Tue,  3 Aug 2021 14:48:32 +0200
Message-Id: <20210803124833.3817354-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Media userspace was the last userspace to still use them, and they
converted now too:

https://github.com/intel/media-driver/commit/144020c37770083974bedf59902b70b8f444c799

This means no reason anymore to make relocations faster than they've
been for the first 9 years of gem. This code was added in

commit 7dd4f6729f9243bd7046c6f04c107a456bda38eb
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Jun 16 15:05:24 2017 +0100

    drm/i915: Async GPU relocation processing

Furthermore there's pretty strong indications it's buggy, since the
code to use it by default as the only option had to be reverted:

commit ad5d95e4d538737ed3fa25493777decf264a3011
Author: Dave Airlie <airlied@redhat.com>
Date:   Tue Sep 8 15:41:17 2020 +1000

    Revert "drm/i915/gem: Async GPU relocations only"

This code just disables gpu relocations, leaving the garbage
collection for later patches and more importantly, much less confusing
diff. Also given how much headaches this code has caused in the past,
letting this soak for a bit seems justified.

Acked-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 43 ++++++++-----------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 25ba2765d27d..e4dc4c3b4df3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1588,7 +1588,7 @@ static int __reloc_entry_gpu(struct i915_execbuffer *eb,
 	return true;
 }
 
-static int reloc_entry_gpu(struct i915_execbuffer *eb,
+static int __maybe_unused reloc_entry_gpu(struct i915_execbuffer *eb,
 			    struct i915_vma *vma,
 			    u64 offset,
 			    u64 target_addr)
@@ -1610,32 +1610,25 @@ relocate_entry(struct i915_vma *vma,
 {
 	u64 target_addr = relocation_target(reloc, target);
 	u64 offset = reloc->offset;
-	int reloc_gpu = reloc_entry_gpu(eb, vma, offset, target_addr);
-
-	if (reloc_gpu < 0)
-		return reloc_gpu;
-
-	if (!reloc_gpu) {
-		bool wide = eb->reloc_cache.use_64bit_reloc;
-		void *vaddr;
+	bool wide = eb->reloc_cache.use_64bit_reloc;
+	void *vaddr;
 
 repeat:
-		vaddr = reloc_vaddr(vma->obj, eb,
-				    offset >> PAGE_SHIFT);
-		if (IS_ERR(vaddr))
-			return PTR_ERR(vaddr);
-
-		GEM_BUG_ON(!IS_ALIGNED(offset, sizeof(u32)));
-		clflush_write32(vaddr + offset_in_page(offset),
-				lower_32_bits(target_addr),
-				eb->reloc_cache.vaddr);
-
-		if (wide) {
-			offset += sizeof(u32);
-			target_addr >>= 32;
-			wide = false;
-			goto repeat;
-		}
+	vaddr = reloc_vaddr(vma->obj, eb,
+			    offset >> PAGE_SHIFT);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+
+	GEM_BUG_ON(!IS_ALIGNED(offset, sizeof(u32)));
+	clflush_write32(vaddr + offset_in_page(offset),
+			lower_32_bits(target_addr),
+			eb->reloc_cache.vaddr);
+
+	if (wide) {
+		offset += sizeof(u32);
+		target_addr >>= 32;
+		wide = false;
+		goto repeat;
 	}
 
 	return target->node.start | UPDATE;
-- 
2.32.0

