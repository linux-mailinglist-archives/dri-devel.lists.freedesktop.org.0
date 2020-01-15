Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1918913B880
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 04:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC6C6E843;
	Wed, 15 Jan 2020 03:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D9C6E843;
 Wed, 15 Jan 2020 03:58:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 19:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; 
 d="scan'208,217";a="242720255"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by orsmga002.jf.intel.com with ESMTP; 14 Jan 2020 19:51:45 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@intel.com, daniel@ffwll.ch, sam@ravnborg.org,
 sudeep.dutt@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [[Intel-gfx] [PATCH v2 05/10] drm/i915/gem: Make WARN* drm specific
 where drm_priv ptr is available
Date: Wed, 15 Jan 2020 09:14:49 +0530
Message-Id: <20200115034455.17658-6-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200115034455.17658-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

command: spatch --sp-file <script> --dir drivers/gpu/drm/i915/gem \
					--linux-spacing --in-place

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c       |  3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c    |  3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 13 ++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c   | 15 +++++++++------
 4 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index c8264eb036bf..3d215164dd5a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -85,7 +85,8 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
 
 			i915_gem_object_lock(obj);
-			WARN_ON(i915_gem_object_set_to_gtt_domain(obj, false));
+			drm_WARN_ON(&i915->drm,
+			    i915_gem_object_set_to_gtt_domain(obj, false));
 			i915_gem_object_unlock(obj);
 			i915_gem_object_put(obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index a2a980d9d241..5d5d7eef3f43 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -148,7 +148,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
 		last_pfn = page_to_pfn(page);
 
 		/* Check that the i965g/gm workaround works. */
-		WARN_ON((gfp & __GFP_DMA32) && (last_pfn >= 0x00100000UL));
+		drm_WARN_ON(&i915->drm,
+			    (gfp & __GFP_DMA32) && (last_pfn >= 0x00100000UL));
 	}
 	if (sg) { /* loop terminated early; short sg table */
 		sg_page_sizes |= sg->length;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index f7e4b39c734f..7eaa2ab01de3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -403,19 +403,22 @@ void i915_gem_driver_register__shrinker(struct drm_i915_private *i915)
 	i915->mm.shrinker.count_objects = i915_gem_shrinker_count;
 	i915->mm.shrinker.seeks = DEFAULT_SEEKS;
 	i915->mm.shrinker.batch = 4096;
-	WARN_ON(register_shrinker(&i915->mm.shrinker));
+	drm_WARN_ON(&i915->drm, register_shrinker(&i915->mm.shrinker));
 
 	i915->mm.oom_notifier.notifier_call = i915_gem_shrinker_oom;
-	WARN_ON(register_oom_notifier(&i915->mm.oom_notifier));
+	drm_WARN_ON(&i915->drm, register_oom_notifier(&i915->mm.oom_notifier));
 
 	i915->mm.vmap_notifier.notifier_call = i915_gem_shrinker_vmap;
-	WARN_ON(register_vmap_purge_notifier(&i915->mm.vmap_notifier));
+	drm_WARN_ON(&i915->drm,
+		    register_vmap_purge_notifier(&i915->mm.vmap_notifier));
 }
 
 void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 {
-	WARN_ON(unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
-	WARN_ON(unregister_oom_notifier(&i915->mm.oom_notifier));
+	drm_WARN_ON(&i915->drm,
+		    unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
+	drm_WARN_ON(&i915->drm,
+		    unregister_oom_notifier(&i915->mm.oom_notifier));
 	unregister_shrinker(&i915->mm.shrinker);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 451f3078d60d..62320ae5e646 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -181,14 +181,16 @@ static void g4x_get_stolen_reserved(struct drm_i915_private *i915,
 	 * Whether ILK really reuses the ELK register for this is unclear.
 	 * Let's see if we catch anyone with this supposedly enabled on ILK.
 	 */
-	WARN(IS_GEN(i915, 5), "ILK stolen reserved found? 0x%08x\n",
-	     reg_val);
+	drm_WARN(&i915->drm, IS_GEN(i915, 5),
+		 "ILK stolen reserved found? 0x%08x\n",
+		 reg_val);
 
 	if (!(reg_val & G4X_STOLEN_RESERVED_ADDR2_MASK))
 		return;
 
 	*base = (reg_val & G4X_STOLEN_RESERVED_ADDR2_MASK) << 16;
-	WARN_ON((reg_val & G4X_STOLEN_RESERVED_ADDR1_MASK) < *base);
+	drm_WARN_ON(&i915->drm,
+		    (reg_val & G4X_STOLEN_RESERVED_ADDR1_MASK) < *base);
 
 	*size = stolen_top - *base;
 }
@@ -694,9 +696,10 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 			 &stolen_offset, &gtt_offset, &size);
 
 	/* KISS and expect everything to be page-aligned */
-	if (WARN_ON(size == 0) ||
-	    WARN_ON(!IS_ALIGNED(size, I915_GTT_PAGE_SIZE)) ||
-	    WARN_ON(!IS_ALIGNED(stolen_offset, I915_GTT_MIN_ALIGNMENT)))
+	if (drm_WARN_ON(&i915->drm, size == 0) ||
+	    drm_WARN_ON(&i915->drm, !IS_ALIGNED(size, I915_GTT_PAGE_SIZE)) ||
+	    drm_WARN_ON(&i915->drm,
+			!IS_ALIGNED(stolen_offset, I915_GTT_MIN_ALIGNMENT)))
 		return ERR_PTR(-EINVAL);
 
 	stolen = kzalloc(sizeof(*stolen), GFP_KERNEL);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
