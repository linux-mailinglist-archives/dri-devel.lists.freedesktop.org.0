Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9044689FA1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 17:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BDB10E736;
	Fri,  3 Feb 2023 16:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B61A10E20A;
 Fri,  3 Feb 2023 16:49:36 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id be8so5809162plb.7;
 Fri, 03 Feb 2023 08:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxBhOPG/5pySGuFA3AXJKh8shAfrqvPwNp+MdcGvCaQ=;
 b=WZNFhp4rpQwO+9vVqFuSjSxPZ6uwAcZhY2spaSy/Glnr7tddG/Ds+pZJk/u61rUpMA
 Dog6+GShxg6wkdMbc+WelJFE781uy3LkeFqQ8Zxo6dIjLkQqleZlPr+TEX+ALQjU3Yxj
 qQaghVLr/pqr3NUr7xsFS218IYrRTHMOhGJWw1nJCRIt2isP59J1nQ1tEZJUd5C9Gq4W
 4PvSQQlRIlGjglslZB9fgKH+NMgyS5Ks8L/CxLB40FKuPywbejNWSLotvnwjBoyVa9bS
 Ck/lCeKljt6xHT8goZoa7gIavcAvTN7Fl/XAlP9ue3myro7v4nZyaxokr/ZVaoV9msze
 35ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZxBhOPG/5pySGuFA3AXJKh8shAfrqvPwNp+MdcGvCaQ=;
 b=7Q14raz76lnue2mHa/UAYhv0Puy5hZf00mmkKfWL2Zp1dr952zp4I2a+fvRQZG5Eft
 zhlLdNZ+9Zoj7Nw2kreGrEMs+g9wSNRc1cA9bhWYcGARrE2Fcow0qsURz6tZYmIUbuBY
 IDGfGj4qnz4cjzczk+8zTW6XxxZqDztXOtSAFijy2eNRXXAnCVlzxO8B8qsRExiSc0Io
 0zhXVSIY04aLaunkIxwurGoqwJvlGE6HDGELtuQ07uFirgK9h50MQCTBjGXSnjv8mMo7
 1KDBitW925x0sA89UsEqiGyOHKExdwtkQVJQ+3992Ri18gBvUm0pQwU8yP/RXnFmwcFA
 r4Fw==
X-Gm-Message-State: AO0yUKWoXnERvX/F6tAGZ9gGNDbyJZrZsgBGT7Zr1CNTX4u5IENAGmNn
 qM+/eQQXauMP+WzO+VpywBr0qVaCJcI=
X-Google-Smtp-Source: AK7set8DxXpK2VangZwWy6FpeOmhKOqZmgxtdo0d55o8p4znij0GVVRZYJ41RQvd3X+/rIxf2jRUvg==
X-Received: by 2002:a17:902:da8c:b0:194:6f3b:3aa1 with SMTP id
 j12-20020a170902da8c00b001946f3b3aa1mr6590659plx.55.1675442975476; 
 Fri, 03 Feb 2023 08:49:35 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a170902a38d00b0019602263feesm1822084pla.90.2023.02.03.08.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 08:49:34 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Move fd_install after last use of fence
Date: Fri,  3 Feb 2023 08:49:20 -0800
Message-Id: <20230203164937.4035503-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Because eb_composite_fence_create() drops the fence_array reference
after creation of the sync_file, only the sync_file holds a ref to the
fence.  But fd_install() makes that reference visable to userspace, so
it must be the last thing we do with the fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index f266b68cf012..0f2e056c02dd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3476,38 +3476,38 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 
 err_request:
 	eb_requests_get(&eb);
 	err = eb_requests_add(&eb, err);
 
 	if (eb.fences)
 		signal_fence_array(&eb, eb.composite_fence ?
 				   eb.composite_fence :
 				   &eb.requests[0]->fence);
 
+	if (unlikely(eb.gem_context->syncobj)) {
+		drm_syncobj_replace_fence(eb.gem_context->syncobj,
+					  eb.composite_fence ?
+					  eb.composite_fence :
+					  &eb.requests[0]->fence);
+	}
+
 	if (out_fence) {
 		if (err == 0) {
 			fd_install(out_fence_fd, out_fence->file);
 			args->rsvd2 &= GENMASK_ULL(31, 0); /* keep in-fence */
 			args->rsvd2 |= (u64)out_fence_fd << 32;
 			out_fence_fd = -1;
 		} else {
 			fput(out_fence->file);
 		}
 	}
 
-	if (unlikely(eb.gem_context->syncobj)) {
-		drm_syncobj_replace_fence(eb.gem_context->syncobj,
-					  eb.composite_fence ?
-					  eb.composite_fence :
-					  &eb.requests[0]->fence);
-	}
-
 	if (!out_fence && eb.composite_fence)
 		dma_fence_put(eb.composite_fence);
 
 	eb_requests_put(&eb);
 
 err_vma:
 	eb_release_vmas(&eb, true);
 	WARN_ON(err == -EDEADLK);
 	i915_gem_ww_ctx_fini(&eb.ww);
 
-- 
2.38.1

