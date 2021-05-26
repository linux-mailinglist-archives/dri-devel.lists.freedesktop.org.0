Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98541391D31
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 18:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888416E3BB;
	Wed, 26 May 2021 16:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D410B6E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 16:37:37 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g7so2313564edm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7j7ZufiiTOqzVpKZdemVCOGwdsjbZKVtKpD5Om67Ua8=;
 b=Ww7HhkJb3QLyvOFvYPcOwG8HpIgTuHowg3wFIs5RBvC5UjILC9xJ+2rXietplVbID4
 dfYTk0Cwnm9M2CIxasOzgxHhmEZP218CbSFRuSNUPXGCr2i1RotdaNu/52rN6j8zJa59
 zKk2WROp+Kne4nIRl0HcDI7ABIPu4VOCMSOfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7j7ZufiiTOqzVpKZdemVCOGwdsjbZKVtKpD5Om67Ua8=;
 b=iyxsN3SVpiIYLyXZs0QSi75CmXTUeuctZjb/bWISEVPjnOttG8if2RK6J93ZHaQ05K
 UBjv2GkEhLy1jcvuWhZ9rWlz6flzMB8gOa/rghhPrL8jvN8Cf9c5znJMSqlTb0It1sk9
 zy7t412p+3opXGVYgevr8FMa2hx7OzXeBvCK0++77NJ3Xh1SqRvyeAbwSDdfPMJ17bON
 6upTUt4IZ5FzvtaBxZI3EQqCZtlQCljbdXkDvqzSvnQBiyGj+s4MN0zNZeIMBIfVWD0j
 uYbs4CfzE40UBjZy3ygBmS7ry5Yw4Eggq87pi/P62dCJochEqyhwyTLhvGvmiSKY3cRP
 +2eg==
X-Gm-Message-State: AOAM531fzFbd9o3wOIPde00eBjuMC7QCR1TNiHCtLVmQSUpgrE5GImIq
 HUSwAA0xYVrC4IdI1zhHiD33Pw==
X-Google-Smtp-Source: ABdhPJz9MXWowukPtGUGiDeQDRFv+ZlDAUYjAp4oW4QmS2DyWYMbPfQwy5K/oPLKfQzEmr7LzRnJ0w==
X-Received: by 2002:aa7:cf19:: with SMTP id a25mr26117084edy.336.1622047056191; 
 Wed, 26 May 2021 09:37:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l19sm12712038edv.17.2021.05.26.09.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 09:37:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Disable gpu relocations
Date: Wed, 26 May 2021 18:37:30 +0200
Message-Id: <20210526163730.3423181-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
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

Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
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
index 297143511f99..31e904f79d0a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1571,7 +1571,7 @@ static int __reloc_entry_gpu(struct i915_execbuffer *eb,
 	return true;
 }
 
-static int reloc_entry_gpu(struct i915_execbuffer *eb,
+static int __maybe_unused reloc_entry_gpu(struct i915_execbuffer *eb,
 			    struct i915_vma *vma,
 			    u64 offset,
 			    u64 target_addr)
@@ -1593,32 +1593,25 @@ relocate_entry(struct i915_vma *vma,
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
2.31.0

