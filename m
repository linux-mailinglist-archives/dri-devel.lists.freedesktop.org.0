Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E137E4B30
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7FF10E0B1;
	Tue,  7 Nov 2023 21:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.gentoo.org (mail.gentoo.org
 [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4954E10E0B1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 21:55:50 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm: i915: Adapt to -Walloc-size
Date: Tue,  7 Nov 2023 21:55:33 +0000
Message-ID: <20231107215538.1891359-1-sam@gentoo.org>
X-Mailer: git-send-email 2.42.1
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
Cc: Sam James <sam@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GCC 14 introduces a new -Walloc-size included in -Wextra which errors out
like:
```
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c: In function ‘eb_copy_relocations’:
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1681:24: error: allocation of insufficient size ‘1’ for type ‘struct drm_i915_gem_relocation_entry’ with size ‘32’ [-Werror=alloc-size]
 1681 |                 relocs = kvmalloc_array(size, 1, GFP_KERNEL);
      |                        ^

```

So, just swap the number of members and size arguments to match the prototype, as
we're initialising 1 element of size `size`. GCC then sees we're not
doing anything wrong.

Signed-off-by: Sam James <sam@gentoo.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 683fd8d3151c..45b9d9e34b8b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1678,7 +1678,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		urelocs = u64_to_user_ptr(eb->exec[i].relocs_ptr);
 		size = nreloc * sizeof(*relocs);
 
-		relocs = kvmalloc_array(size, 1, GFP_KERNEL);
+		relocs = kvmalloc_array(1, size, GFP_KERNEL);
 		if (!relocs) {
 			err = -ENOMEM;
 			goto err;
-- 
2.42.1

