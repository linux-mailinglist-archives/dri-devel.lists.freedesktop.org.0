Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA51145720
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4899D6F524;
	Wed, 22 Jan 2020 13:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CD66F4FC;
 Wed, 22 Jan 2020 12:58:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q6so7116427wro.9;
 Wed, 22 Jan 2020 04:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=bt9R4IUfdKy9S6qaalywmoVwyWqmbS9Q9iDFKXFGfA0=;
 b=cRub3YA/Rai6P2H3oWyFDT1GsKA8mAVTG7sde6pY47/kV6gpfSYoSADJ9CDBVZ4k/l
 l81MChK336ghdOmLaO7JJnpFbuYuT381sIlpoQXukr8EtblJ6i6VDkXa+oYDxPHgV8t5
 wtbSIhMs0rl3L4D4C8B4FVwFfJZX/kUNU6QcnbQnBCVSnnP8Bsmgrl3KibjSMpPKNtBU
 xFk7rBJXsWe3JjqQjasJls8/c7Nu03A5AXIbl3Jzdc6WL5qlqBEbDdb9q0okSPYGJNAG
 yXVgfvR6fbyRJ7lZx2PIGnC29CvWRdE8Sy3X49UcP4zn3FaprgCElRMtNKKnqpBY82iQ
 xm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=bt9R4IUfdKy9S6qaalywmoVwyWqmbS9Q9iDFKXFGfA0=;
 b=W+PTsO7yt9VnqzgNLPNMSFHv8JEgU4AtFmEnHYoh8m37J96qpHNnmy55yY+O4e1ZhW
 xZudMO95Glchvl+Mw9XmVdIv3omxJpTPtPI12Qv0GSu2ia/0Vv93ef6C5Vs2TLhltp2M
 SOLz9AIOBJJKs0pDXhoLea9Wh2GVSkGqqcQVmkYnVrwHYC5pySKHv7iX56FsSTrTwCY2
 hr/jh+Iz2OzoY36hD0A5xmE6IZyQVhc8gEsryStIn83Dzgz0cAIp9dpJQgb6Imy6ulxA
 bUnTGimFBekQlVK+eDqR8hnqjZOY3Z2qnoW+o/yXCF68tTmdXiSYlo9fY/xs7ivWRl1H
 XnNA==
X-Gm-Message-State: APjAAAWaAARmouO3NysjC+NrYu6rofLYSZeNAej6WvdwkN2AKVDHfiLK
 7UNK2yx2TvCCYofrTQB349k=
X-Google-Smtp-Source: APXvYqw+wqdwLcy+K87uYLnppIVhlFaiV3QIpDzvO9Qe6m5xEXnRBKNNSfxDE5S/G8NiCKpVIIZPwA==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr11450203wrw.277.1579697881606; 
 Wed, 22 Jan 2020 04:58:01 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id p26sm3736109wmc.24.2020.01.22.04.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 04:58:01 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/i915/gem: initial conversion to new logging macros
 using coccinelle
Date: Wed, 22 Jan 2020 15:57:49 +0300
Message-Id: <20200122125750.9737-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122125750.9737-1-wambui.karugax@gmail.com>
References: <20200122125750.9737-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 13:52:23 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First pass of conversion to the new struct drm_based device logging
macros in the drm/i915/gem directory. This conversion was achieved using
the following coccinelle script that transforms based on the existence
of a straightforward struct drm_i915_private device:

@rule1@
identifier fn, T;
@@

fn(struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 27 +++++----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 37 +++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 56 +++++++++++--------
 3 files changed, 70 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index a2e57e62af30..5432da2abda0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -708,8 +708,8 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
 
 		ppgtt = i915_ppgtt_create(&i915->gt);
 		if (IS_ERR(ppgtt)) {
-			DRM_DEBUG_DRIVER("PPGTT setup failed (%ld)\n",
-					 PTR_ERR(ppgtt));
+			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
+				PTR_ERR(ppgtt));
 			context_close(ctx);
 			return ERR_CAST(ppgtt);
 		}
@@ -751,9 +751,9 @@ static void init_contexts(struct i915_gem_contexts *gc)
 void i915_gem_init__contexts(struct drm_i915_private *i915)
 {
 	init_contexts(&i915->gem.contexts);
-	DRM_DEBUG_DRIVER("%s context support initialized\n",
-			 DRIVER_CAPS(i915)->has_logical_contexts ?
-			 "logical" : "fake");
+	drm_dbg(&i915->drm, "%s context support initialized\n",
+		DRIVER_CAPS(i915)->has_logical_contexts ?
+		"logical" : "fake");
 }
 
 void i915_gem_driver_release__contexts(struct drm_i915_private *i915)
@@ -1624,6 +1624,7 @@ static int
 set_engines(struct i915_gem_context *ctx,
 	    const struct drm_i915_gem_context_param *args)
 {
+	struct drm_i915_private *i915 = ctx->i915;
 	struct i915_context_param_engines __user *user =
 		u64_to_user_ptr(args->value);
 	struct set_engines set = { .ctx = ctx };
@@ -1645,8 +1646,8 @@ set_engines(struct i915_gem_context *ctx,
 	BUILD_BUG_ON(!IS_ALIGNED(sizeof(*user), sizeof(*user->engines)));
 	if (args->size < sizeof(*user) ||
 	    !IS_ALIGNED(args->size, sizeof(*user->engines))) {
-		DRM_DEBUG("Invalid size for engine array: %d\n",
-			  args->size);
+		drm_dbg(&i915->drm, "Invalid size for engine array: %d\n",
+			args->size);
 		return -EINVAL;
 	}
 
@@ -1682,8 +1683,9 @@ set_engines(struct i915_gem_context *ctx,
 						  ci.engine_class,
 						  ci.engine_instance);
 		if (!engine) {
-			DRM_DEBUG("Invalid engine[%d]: { class:%d, instance:%d }\n",
-				  n, ci.engine_class, ci.engine_instance);
+			drm_dbg(&i915->drm,
+				"Invalid engine[%d]: { class:%d, instance:%d }\n",
+				n, ci.engine_class, ci.engine_instance);
 			__free_engines(set.engines, n);
 			return -ENOENT;
 		}
@@ -2197,8 +2199,9 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 
 	ext_data.fpriv = file->driver_priv;
 	if (client_is_banned(ext_data.fpriv)) {
-		DRM_DEBUG("client %s[%d] banned from creating ctx\n",
-			  current->comm, task_pid_nr(current));
+		drm_dbg(&i915->drm,
+			"client %s[%d] banned from creating ctx\n",
+			current->comm, task_pid_nr(current));
 		return -EIO;
 	}
 
@@ -2220,7 +2223,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 		goto err_ctx;
 
 	args->ctx_id = id;
-	DRM_DEBUG("HW context %d created\n", args->ctx_id);
+	drm_dbg(&i915->drm, "HW context %d created\n", args->ctx_id);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 60c984e10c4a..61c0a837f163 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -420,6 +420,7 @@ eb_validate_vma(struct i915_execbuffer *eb,
 		struct drm_i915_gem_exec_object2 *entry,
 		struct i915_vma *vma)
 {
+	struct drm_i915_private *i915 = eb->i915;
 	if (unlikely(entry->flags & eb->invalid_flags))
 		return -EINVAL;
 
@@ -443,8 +444,9 @@ eb_validate_vma(struct i915_execbuffer *eb,
 	}
 
 	if (unlikely(vma->exec_flags)) {
-		DRM_DEBUG("Object [handle %d, index %d] appears more than once in object list\n",
-			  entry->handle, (int)(entry - eb->exec));
+		drm_dbg(&i915->drm,
+			"Object [handle %d, index %d] appears more than once in object list\n",
+			entry->handle, (int)(entry - eb->exec));
 		return -EINVAL;
 	}
 
@@ -1330,6 +1332,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 		  struct i915_vma *vma,
 		  const struct drm_i915_gem_relocation_entry *reloc)
 {
+	struct drm_i915_private *i915 = eb->i915;
 	struct i915_vma *target;
 	int err;
 
@@ -1340,7 +1343,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 
 	/* Validate that the target is in a valid r/w GPU domain */
 	if (unlikely(reloc->write_domain & (reloc->write_domain - 1))) {
-		DRM_DEBUG("reloc with multiple write domains: "
+		drm_dbg(&i915->drm, "reloc with multiple write domains: "
 			  "target %d offset %d "
 			  "read %08x write %08x",
 			  reloc->target_handle,
@@ -1351,7 +1354,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 	}
 	if (unlikely((reloc->write_domain | reloc->read_domains)
 		     & ~I915_GEM_GPU_DOMAINS)) {
-		DRM_DEBUG("reloc with read/write non-GPU domains: "
+		drm_dbg(&i915->drm, "reloc with read/write non-GPU domains: "
 			  "target %d offset %d "
 			  "read %08x write %08x",
 			  reloc->target_handle,
@@ -1391,7 +1394,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 	/* Check that the relocation address is valid... */
 	if (unlikely(reloc->offset >
 		     vma->size - (eb->reloc_cache.use_64bit_reloc ? 8 : 4))) {
-		DRM_DEBUG("Relocation beyond object bounds: "
+		drm_dbg(&i915->drm, "Relocation beyond object bounds: "
 			  "target %d offset %d size %d.\n",
 			  reloc->target_handle,
 			  (int)reloc->offset,
@@ -1399,7 +1402,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 		return -EINVAL;
 	}
 	if (unlikely(reloc->offset & 3)) {
-		DRM_DEBUG("Relocation not 4-byte aligned: "
+		drm_dbg(&i915->drm, "Relocation not 4-byte aligned: "
 			  "target %d offset %d.\n",
 			  reloc->target_handle,
 			  (int)reloc->offset);
@@ -2075,6 +2078,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
 
 static int eb_parse(struct i915_execbuffer *eb)
 {
+	struct drm_i915_private *i915 = eb->i915;
 	struct intel_engine_pool_node *pool;
 	struct i915_vma *shadow, *trampoline;
 	unsigned int len;
@@ -2090,7 +2094,8 @@ static int eb_parse(struct i915_execbuffer *eb)
 		 * post-scan tampering
 		 */
 		if (!eb->context->vm->has_read_only) {
-			DRM_DEBUG("Cannot prevent post-scan tampering without RO capable vm\n");
+			drm_dbg(&i915->drm,
+				"Cannot prevent post-scan tampering without RO capable vm\n");
 			return -EINVAL;
 		}
 	} else {
@@ -2371,8 +2376,9 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
 
 	if (user_ring_id != I915_EXEC_BSD &&
 	    (args->flags & I915_EXEC_BSD_MASK)) {
-		DRM_DEBUG("execbuf with non bsd ring but with invalid "
-			  "bsd dispatch flags: %d\n", (int)(args->flags));
+		drm_dbg(&i915->drm,
+			"execbuf with non bsd ring but with invalid "
+			"bsd dispatch flags: %d\n", (int)(args->flags));
 		return -1;
 	}
 
@@ -2386,8 +2392,9 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
 			bsd_idx >>= I915_EXEC_BSD_SHIFT;
 			bsd_idx--;
 		} else {
-			DRM_DEBUG("execbuf with unknown bsd ring: %u\n",
-				  bsd_idx);
+			drm_dbg(&i915->drm,
+				"execbuf with unknown bsd ring: %u\n",
+				bsd_idx);
 			return -1;
 		}
 
@@ -2395,7 +2402,8 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
 	}
 
 	if (user_ring_id >= ARRAY_SIZE(user_ring_map)) {
-		DRM_DEBUG("execbuf with unknown ring: %u\n", user_ring_id);
+		drm_dbg(&i915->drm, "execbuf with unknown ring: %u\n",
+			user_ring_id);
 		return -1;
 	}
 
@@ -2669,13 +2677,14 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 	}
 
 	if (unlikely(*eb.batch->exec_flags & EXEC_OBJECT_WRITE)) {
-		DRM_DEBUG("Attempting to use self-modifying batch buffer\n");
+		drm_dbg(&i915->drm,
+			"Attempting to use self-modifying batch buffer\n");
 		err = -EINVAL;
 		goto err_vma;
 	}
 	if (eb.batch_start_offset > eb.batch->size ||
 	    eb.batch_len > eb.batch->size - eb.batch_start_offset) {
-		DRM_DEBUG("Attempting to use out-of-bounds batch\n");
+		drm_dbg(&i915->drm, "Attempting to use out-of-bounds batch\n");
 		err = -EINVAL;
 		goto err_vma;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 451f3078d60d..52c92f4fcb56 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -110,8 +110,11 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 
 		if (stolen[0].start != stolen[1].start ||
 		    stolen[0].end != stolen[1].end) {
-			DRM_DEBUG_DRIVER("GTT within stolen memory at %pR\n", &ggtt_res);
-			DRM_DEBUG_DRIVER("Stolen memory adjusted to %pR\n", dsm);
+			drm_dbg(&i915->drm,
+				"GTT within stolen memory at %pR\n",
+				&ggtt_res);
+			drm_dbg(&i915->drm, "Stolen memory adjusted to %pR\n",
+				dsm);
 		}
 	}
 
@@ -142,8 +145,9 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
 		 * range. Apparently this works.
 		 */
 		if (!r && !IS_GEN(i915, 3)) {
-			DRM_ERROR("conflict detected with stolen region: %pR\n",
-				  dsm);
+			drm_err(&i915->drm,
+				"conflict detected with stolen region: %pR\n",
+				dsm);
 
 			return -EBUSY;
 		}
@@ -171,8 +175,8 @@ static void g4x_get_stolen_reserved(struct drm_i915_private *i915,
 					ELK_STOLEN_RESERVED);
 	resource_size_t stolen_top = i915->dsm.end + 1;
 
-	DRM_DEBUG_DRIVER("%s_STOLEN_RESERVED = %08x\n",
-			 IS_GM45(i915) ? "CTG" : "ELK", reg_val);
+	drm_dbg(&i915->drm, "%s_STOLEN_RESERVED = %08x\n",
+		IS_GM45(i915) ? "CTG" : "ELK", reg_val);
 
 	if ((reg_val & G4X_STOLEN_RESERVED_ENABLE) == 0)
 		return;
@@ -200,7 +204,7 @@ static void gen6_get_stolen_reserved(struct drm_i915_private *i915,
 {
 	u32 reg_val = intel_uncore_read(uncore, GEN6_STOLEN_RESERVED);
 
-	DRM_DEBUG_DRIVER("GEN6_STOLEN_RESERVED = %08x\n", reg_val);
+	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = %08x\n", reg_val);
 
 	if (!(reg_val & GEN6_STOLEN_RESERVED_ENABLE))
 		return;
@@ -234,7 +238,7 @@ static void vlv_get_stolen_reserved(struct drm_i915_private *i915,
 	u32 reg_val = intel_uncore_read(uncore, GEN6_STOLEN_RESERVED);
 	resource_size_t stolen_top = i915->dsm.end + 1;
 
-	DRM_DEBUG_DRIVER("GEN6_STOLEN_RESERVED = %08x\n", reg_val);
+	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = %08x\n", reg_val);
 
 	if (!(reg_val & GEN6_STOLEN_RESERVED_ENABLE))
 		return;
@@ -262,7 +266,7 @@ static void gen7_get_stolen_reserved(struct drm_i915_private *i915,
 {
 	u32 reg_val = intel_uncore_read(uncore, GEN6_STOLEN_RESERVED);
 
-	DRM_DEBUG_DRIVER("GEN6_STOLEN_RESERVED = %08x\n", reg_val);
+	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = %08x\n", reg_val);
 
 	if (!(reg_val & GEN6_STOLEN_RESERVED_ENABLE))
 		return;
@@ -289,7 +293,7 @@ static void chv_get_stolen_reserved(struct drm_i915_private *i915,
 {
 	u32 reg_val = intel_uncore_read(uncore, GEN6_STOLEN_RESERVED);
 
-	DRM_DEBUG_DRIVER("GEN6_STOLEN_RESERVED = %08x\n", reg_val);
+	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = %08x\n", reg_val);
 
 	if (!(reg_val & GEN6_STOLEN_RESERVED_ENABLE))
 		return;
@@ -323,7 +327,7 @@ static void bdw_get_stolen_reserved(struct drm_i915_private *i915,
 	u32 reg_val = intel_uncore_read(uncore, GEN6_STOLEN_RESERVED);
 	resource_size_t stolen_top = i915->dsm.end + 1;
 
-	DRM_DEBUG_DRIVER("GEN6_STOLEN_RESERVED = %08x\n", reg_val);
+	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = %08x\n", reg_val);
 
 	if (!(reg_val & GEN6_STOLEN_RESERVED_ENABLE))
 		return;
@@ -342,7 +346,7 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
 {
 	u64 reg_val = intel_uncore_read64(uncore, GEN6_STOLEN_RESERVED);
 
-	DRM_DEBUG_DRIVER("GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
+	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
 
 	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
 
@@ -453,8 +457,9 @@ static int i915_gem_init_stolen(struct drm_i915_private *i915)
 	 * it likely means we failed to read the registers correctly.
 	 */
 	if (!reserved_base) {
-		DRM_ERROR("inconsistent reservation %pa + %pa; ignoring\n",
-			  &reserved_base, &reserved_size);
+		drm_err(&i915->drm,
+			"inconsistent reservation %pa + %pa; ignoring\n",
+			&reserved_base, &reserved_size);
 		reserved_base = stolen_top;
 		reserved_size = 0;
 	}
@@ -463,8 +468,9 @@ static int i915_gem_init_stolen(struct drm_i915_private *i915)
 		(struct resource)DEFINE_RES_MEM(reserved_base, reserved_size);
 
 	if (!resource_contains(&i915->dsm, &i915->dsm_reserved)) {
-		DRM_ERROR("Stolen reserved area %pR outside stolen memory %pR\n",
-			  &i915->dsm_reserved, &i915->dsm);
+		drm_err(&i915->drm,
+			"Stolen reserved area %pR outside stolen memory %pR\n",
+			&i915->dsm_reserved, &i915->dsm);
 		return 0;
 	}
 
@@ -472,9 +478,10 @@ static int i915_gem_init_stolen(struct drm_i915_private *i915)
 	 * memory, so just consider the start. */
 	reserved_total = stolen_top - reserved_base;
 
-	DRM_DEBUG_DRIVER("Memory reserved for graphics device: %lluK, usable: %lluK\n",
-			 (u64)resource_size(&i915->dsm) >> 10,
-			 ((u64)resource_size(&i915->dsm) - reserved_total) >> 10);
+	drm_dbg(&i915->drm,
+		"Memory reserved for graphics device: %lluK, usable: %lluK\n",
+		(u64)resource_size(&i915->dsm) >> 10,
+		((u64)resource_size(&i915->dsm) - reserved_total) >> 10);
 
 	i915->stolen_usable_size =
 		resource_size(&i915->dsm) - reserved_total;
@@ -690,8 +697,9 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 	if (!drm_mm_initialized(&i915->mm.stolen))
 		return ERR_PTR(-ENODEV);
 
-	DRM_DEBUG_DRIVER("creating preallocated stolen object: stolen_offset=%pa, gtt_offset=%pa, size=%pa\n",
-			 &stolen_offset, &gtt_offset, &size);
+	drm_dbg(&i915->drm,
+		"creating preallocated stolen object: stolen_offset=%pa, gtt_offset=%pa, size=%pa\n",
+		&stolen_offset, &gtt_offset, &size);
 
 	/* KISS and expect everything to be page-aligned */
 	if (WARN_ON(size == 0) ||
@@ -709,14 +717,14 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 	ret = drm_mm_reserve_node(&i915->mm.stolen, stolen);
 	mutex_unlock(&i915->mm.stolen_lock);
 	if (ret) {
-		DRM_DEBUG_DRIVER("failed to allocate stolen space\n");
+		drm_dbg(&i915->drm, "failed to allocate stolen space\n");
 		kfree(stolen);
 		return ERR_PTR(ret);
 	}
 
 	obj = __i915_gem_object_create_stolen(mem, stolen);
 	if (IS_ERR(obj)) {
-		DRM_DEBUG_DRIVER("failed to allocate stolen object\n");
+		drm_dbg(&i915->drm, "failed to allocate stolen object\n");
 		i915_gem_stolen_remove_node(i915, stolen);
 		kfree(stolen);
 		return obj;
@@ -746,7 +754,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 				   size, gtt_offset, obj->cache_level,
 				   0);
 	if (ret) {
-		DRM_DEBUG_DRIVER("failed to allocate stolen GTT space\n");
+		drm_dbg(&i915->drm, "failed to allocate stolen GTT space\n");
 		mutex_unlock(&ggtt->vm.mutex);
 		goto err_pages;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
