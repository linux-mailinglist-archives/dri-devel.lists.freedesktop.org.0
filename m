Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE13EA4D6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 14:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095616E3EF;
	Thu, 12 Aug 2021 12:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 7717 seconds by postgrey-1.36 at gabe;
 Thu, 12 Aug 2021 12:44:56 UTC
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2244D6E092;
 Thu, 12 Aug 2021 12:44:56 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/2] drm/i915: Add pci ids and uapi for DG1
Date: Thu, 12 Aug 2021 14:44:52 +0200
Message-Id: <20210812124452.622233-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812124452.622233-1-maarten.lankhorst@linux.intel.com>
References: <20210812124452.622233-1-maarten.lankhorst@linux.intel.com>
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

DG1 has support for local memory, which requires the usage of the
lmem placement extension for creating bo's, and memregion queries
to obtain the size. Because of this, those parts of the uapi are
no longer guarded behind FAKE_LMEM.

According to the pull request referenced below, mesa should be mostly
ready for DG1. VK_EXT_memory_budget is not hooked up yet, but we
should definitely just enable the uapi parts by default.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11584
Cc: Jordan Justen jordan.l.justen@intel.com
Cc: Jason Ekstrand jason@jlekstrand.net
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 3 ---
 drivers/gpu/drm/i915/i915_pci.c            | 1 +
 drivers/gpu/drm/i915/i915_query.c          | 3 ---
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 23fee13a3384..1d341b8c47c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -347,9 +347,6 @@ static int ext_set_placements(struct i915_user_extension __user *base,
 {
 	struct drm_i915_gem_create_ext_memory_regions ext;
 
-	if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
-		return -ENODEV;
-
 	if (copy_from_user(&ext, base, sizeof(ext)))
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 1bbd09ad5287..93ccdc6bbd03 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1115,6 +1115,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_RKL_IDS(&rkl_info),
 	INTEL_ADLS_IDS(&adl_s_info),
 	INTEL_ADLP_IDS(&adl_p_info),
+	INTEL_DG1_IDS(&dg1_info),
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index e49da36c62fb..5e2b909827f4 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -432,9 +432,6 @@ static int query_memregion_info(struct drm_i915_private *i915,
 	u32 total_length;
 	int ret, id, i;
 
-	if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
-		return -ENODEV;
-
 	if (query_item->flags != 0)
 		return -EINVAL;
 
-- 
2.32.0

