Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5B91CED9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 21:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8D610E089;
	Sat, 29 Jun 2024 19:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 418 seconds by postgrey-1.36 at gabe;
 Sat, 29 Jun 2024 18:32:43 UTC
Received: from mail.asbjorn.biz (mail.asbjorn.biz [185.38.24.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C910E078;
 Sat, 29 Jun 2024 18:32:43 +0000 (UTC)
Received: from x201s (space.labitat.dk [185.38.175.0])
 by mail.asbjorn.biz (Postfix) with ESMTPSA id C4C351C0A988;
 Sat, 29 Jun 2024 18:25:41 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 212A62025CC; Sat, 29 Jun 2024 18:25:27 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <asbjorn@asbjorn.st>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <asbjorn@asbjorn.st>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: implement vmap/vunmap GEM object functions
Date: Sat, 29 Jun 2024 18:25:06 +0000
Message-ID: <20240629182513.78026-1-asbjorn@asbjorn.st>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 Jun 2024 19:29:44 +0000
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

Implement i915_gem_vmap_object() and i915_gem_vunmap_object(),
based on i915_gem_dmabuf_vmap() and i915_gem_dmabuf_vunmap().

This enables a drm_client to use drm_client_buffer_vmap() and
drm_client_buffer_vunmap() on hardware using the i915 driver.

Tested with a currently out of tree pixelflut drm_client[1] on:
- Lenovo ThinkCentre M720q (CoffeeLake-S GT2 / Intel UHD Graphics 630)
- Dell Wyse N06D - 3030 LT (ValleyView on Intel Celeron N2807 SOC)

[1] XDP->DRM pixelflut: https://labitat.dk/wiki/Pixelflut-XDR

Signed-off-by: Asbjørn Sloth Tønnesen <asbjorn@asbjorn.st>
---
This patch applies on top of drm-intel/drm-intel-next (32a120f52a4c)

 drivers/gpu/drm/i915/gem/i915_gem_object.c | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 58e6c680fe0d..356530b599ce 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -873,6 +873,30 @@ bool i915_gem_object_needs_ccs_pages(struct drm_i915_gem_object *obj)
 	return lmem_placement;
 }
 
+static int i915_gem_vmap_object(struct drm_gem_object *gem_obj,
+				struct iosys_map *map)
+{
+	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
+	void *vaddr;
+
+	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+
+	iosys_map_set_vaddr(map, vaddr);
+
+	return 0;
+}
+
+static void i915_gem_vunmap_object(struct drm_gem_object *gem_obj,
+				   struct iosys_map *map)
+{
+	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
+
+	i915_gem_object_flush_map(obj);
+	i915_gem_object_unpin_map(obj);
+}
+
 void i915_gem_init__objects(struct drm_i915_private *i915)
 {
 	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
@@ -896,6 +920,8 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
 	.free = i915_gem_free_object,
 	.close = i915_gem_close_object,
 	.export = i915_gem_prime_export,
+	.vmap = i915_gem_vmap_object,
+	.vunmap = i915_gem_vunmap_object,
 };
 
 /**
-- 
2.45.2

