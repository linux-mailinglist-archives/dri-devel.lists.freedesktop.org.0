Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BA691AC0F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B2F10EB18;
	Thu, 27 Jun 2024 15:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8989316;
 Thu, 27 Jun 2024 15:57:54 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org
Subject: [RFC PATCH 6/6] drm/xe: Hack to test with mapped pages instead of
 vram.
Date: Thu, 27 Jun 2024 17:47:25 +0200
Message-ID: <20240627154754.74828-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will probably want to make this a proper region in TTM for
everything, so that we can charge VRAM twice, once for mapped
in sysmem, once for mapped in vram. That way we don't need to
deal with evict failing from lack of available memory in mapped.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe1..20fa8ec8925e 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -101,6 +101,18 @@ static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, NULL);
 }
 
+static inline void apply_cg(struct xe_device *xe,
+			    struct ttm_resource_manager *man,
+			    u64 gtt_size)
+{
+	int cgregion = xe->cg.num_regions++;
+
+	xe->cg.regions[cgregion].size = gtt_size;
+	xe->cg.regions[cgregion].name = "mapped";
+	man->cgdev = &xe->cg;
+	man->cgidx = cgregion;
+
+}
 int xe_ttm_sys_mgr_init(struct xe_device *xe)
 {
 	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
@@ -116,6 +128,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	man->func = &xe_ttm_sys_mgr_func;
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
+	apply_cg(xe, man, gtt_size);
+
 	ttm_resource_manager_set_used(man, true);
 	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
 }
-- 
2.45.2

