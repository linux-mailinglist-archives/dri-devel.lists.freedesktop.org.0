Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30269470AEE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6723910ECB0;
	Fri, 10 Dec 2021 19:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A883C10EC9E;
 Fri, 10 Dec 2021 19:50:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id EAE491F47AE9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639165820; bh=+JjpwsA0iv+3XffZuyV/VazyWAtMyRYIaD9EZA5fc6Q=;
 h=From:To:Cc:Subject:Date:From;
 b=D/MG1D7XvnvG+d73Yw42hFJJZMy9MXG6wTEX3qYEwpq0s8r/ZJw+4U3huBvcDLKWx
 o4c1v6430kr96fPsAv5Nkhmhz4SMsGGfqpwBHj/yBK8kGAcbQLZf+Tl9CBoIxysgNT
 +2ChF7X6DXkcnXoKjm9oSHh393aFZ5fVkHZJlsNTZgCnETR7EESZbPpzCnB7J2o0us
 zP3oujweUWDZ8n2BctTzOvvku07DIHTiNiUWLRvhtx+7shEN7MuKHMMTjsXG2UTSaU
 tFHmslLdYcJhVOfF8S1ZOQDnKO9mY7p5tyeFAY2ck0Nx/BY1gRv5Ml8FI+944NnuLD
 W7lCptV/V8/pQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH] drm/i915/ttm: fix large buffer population trucation
Date: Fri, 10 Dec 2021 19:50:05 +0000
Message-Id: <20211210195005.2582884-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Robert Beckett <bob.beckett@collabora.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm->num_pages is uint32_t which was causing very large buffers to
only populate a truncated size.

This fixes gem_create@create-clear igt test on large memory systems.

Fixes: 7ae034590cea ("drm/i915/ttm: add tt shmem backend")
Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 218a9b3037c7..923cc7ad8d70 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -166,7 +166,7 @@ static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
 	struct intel_memory_region *mr = i915->mm.regions[INTEL_MEMORY_SYSTEM];
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
 	const unsigned int max_segment = i915_sg_segment_size();
-	const size_t size = ttm->num_pages << PAGE_SHIFT;
+	const size_t size = (size_t)ttm->num_pages << PAGE_SHIFT;
 	struct file *filp = i915_tt->filp;
 	struct sgt_iter sgt_iter;
 	struct sg_table *st;
-- 
2.25.1

