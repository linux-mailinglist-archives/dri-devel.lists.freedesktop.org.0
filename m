Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A467EF2C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 21:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C102D10E1AD;
	Fri, 27 Jan 2023 20:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125110E1A6;
 Fri, 27 Jan 2023 20:05:51 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id x5so2644579plr.2;
 Fri, 27 Jan 2023 12:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lmNlTw6/hGVpApNMZq1gzzgAdrxXUdhCjEWwQxehEq8=;
 b=Q+nhlvBpWrP0fqHx3sgjPqQLGxq0tosbU3mQwlm/TZsauYDDCx8XNZyf53kYrQ3zMx
 BWPHLU1vWzPvaaXK5AJ3yTa14ZwMQmKlInPT8Ol8hXyVhNZrnZ7hNU2OkyH3gr915LxC
 SSVDPg0f+VBlpjs8ywlpRNXKXa4W3rDBx/KYQf01Fg/Q4r6FHOcuQd1oKYRYjBvroK9z
 bDAhQb+n6zbPGdWTiXTkS5qQ9tORBmn7dfmnBqkA5B46S31udvwKbbHQ2n16O52effaJ
 IBLjsScvH4CC6r/8FACqAESUM+EW27qmsYqbqE7HUscYT3r2JTjGx/XRbIuVxPNJAA/V
 R0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lmNlTw6/hGVpApNMZq1gzzgAdrxXUdhCjEWwQxehEq8=;
 b=oHEqBH1sbpuWy1sa+Shanh+uEIo63PbQZGwrpMsK9Jmw8HzaOs2sq7h31qcyXAw45Y
 KR2XPNaE1jx6PlTPcaPssjN4cW7s4ssjsuBsyq2jh6f+6knsd3fiKHdDEFWcGLM5eKGP
 SD2Sd19QY+QkUytSoLksVCI5rTOPHAHB5l6rjLq630dLyVcvbetkaBPB+jh13nWsFVuK
 Zi66oH085sOXOdwk7eAxgj7AoFPesDLdsbwINbYkvkxLXthmzWtii7Hq2x/d4LtwYLrQ
 XKCZ28MLz6XO0g43F0KR2qE0/pNFgBM9N5UpPwSXe4hC8dMA/6lSQp8n1hZEpsqz3LtB
 peIQ==
X-Gm-Message-State: AFqh2kro0T8hxWmci9ZIZVTtyxRIGDQnpD9eRk+NOBe4T8CnMrLyxHJI
 kcVGQPVlDZunyjO3CbGHqCAxm7ZS4yU=
X-Google-Smtp-Source: AMrXdXuhrtE5oPMK7SmyRQ5hCrj8OtvVjREYjt+cwrgbWas3tcp5lOPInofTWTWUh/nkRXnRVQPqGA==
X-Received: by 2002:a17:902:a40f:b0:194:5ff8:a3b0 with SMTP id
 p15-20020a170902a40f00b001945ff8a3b0mr37288703plq.7.1674849950312; 
 Fri, 27 Jan 2023 12:05:50 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a170902d64200b001961608d74bsm3223200plh.299.2023.01.27.12.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 12:05:49 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix potential bit_17 double-free
Date: Fri, 27 Jan 2023 12:05:31 -0800
Message-Id: <20230127200550.3531984-1-robdclark@gmail.com>
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
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A userspace with multiple threads racing I915_GEM_SET_TILING to set the
tiling to I915_TILING_NONE could trigger a double free of the bit_17
bitmask.  (Or conversely leak memory on the transition to tiled.)  Move
allocation/free'ing of the bitmask within the section protected by the
obj lock.

Fixes: e9b73c67390a ("drm/i915: Reduce memory pressure during shrinker by preallocating swizzle pages")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index fd42b89b7162..bc21b1c2350a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -298,36 +298,37 @@ i915_gem_object_set_tiling(struct drm_i915_gem_object *obj,
 		vma->fence_alignment =
 			i915_gem_fence_alignment(i915,
 						 vma->size, tiling, stride);
 
 		if (vma->fence)
 			vma->fence->dirty = true;
 	}
 	spin_unlock(&obj->vma.lock);
 
 	obj->tiling_and_stride = tiling | stride;
-	i915_gem_object_unlock(obj);
-
-	/* Force the fence to be reacquired for GTT access */
-	i915_gem_object_release_mmap_gtt(obj);
 
 	/* Try to preallocate memory required to save swizzling on put-pages */
 	if (i915_gem_object_needs_bit17_swizzle(obj)) {
 		if (!obj->bit_17) {
 			obj->bit_17 = bitmap_zalloc(obj->base.size >> PAGE_SHIFT,
 						    GFP_KERNEL);
 		}
 	} else {
 		bitmap_free(obj->bit_17);
 		obj->bit_17 = NULL;
 	}
 
+	i915_gem_object_unlock(obj);
+
+	/* Force the fence to be reacquired for GTT access */
+	i915_gem_object_release_mmap_gtt(obj);
+
 	return 0;
 }
 
 /**
  * i915_gem_set_tiling_ioctl - IOCTL handler to set tiling mode
  * @dev: DRM device
  * @data: data pointer for the ioctl
  * @file: DRM file for the ioctl call
  *
  * Sets the tiling mode of an object, returning the required swizzling of
-- 
2.38.1

