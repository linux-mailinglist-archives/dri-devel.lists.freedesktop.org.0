Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBFBAFB97E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80610E504;
	Mon,  7 Jul 2025 17:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eNsXYVk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1922A10E506;
 Mon,  7 Jul 2025 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751907911;
 bh=G3A5FBsbv4BYX27PARvCtZt9U4rLROG1uyOLU0aWViQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eNsXYVk7jC3tmwdIhNzjhJWQ4DR6sct7O1/M+jaR590v7SgivZJszQt2H3kkd7C6q
 DaPzGjtaf9CR3lp6LjtBO6ZtC8FEBY7fYs6nPJqGCjphDx/acZB92t4Ve2n3S61KIO
 k8BU6aZn09iU2aNXpxbP1a99V2GBtEDuEfU34JllEUyZjVMiiQEdELaodI1qxIG3Py
 s7uRXHBzW6FUS+yxhGtb2LUkVXIGbiS8O8HJW0uxFe63zwYX1qKDDkk8dUwdZcVf1R
 g6tFD/c90V987OHeqJ9oGfouXoFonQE7DvPGd68yQ3e2/ulTndEih0m8anV2RdzKyM
 fk62V20igRNmQ==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nanokatze)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F31317E10D0;
 Mon,  7 Jul 2025 19:05:10 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Frank Binns" <frank.binns@imgtec.com>,
 "Matt Coster" <matt.coster@imgtec.com>,
 "Karol Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>
Subject: [PATCH v4 6/7] drm/gpuvm: Add DRM_GPUVA_REPEAT flag and logic
Date: Mon,  7 Jul 2025 17:04:32 +0000
Message-ID: <20250707170442.1437009-7-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707170442.1437009-1-caterina.shablia@collabora.com>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
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

From: Asahi Lina <lina+kernel@asahilina.net>

To be able to support "fake sparse" mappings without relying on GPU page
fault handling, drivers may need to create large (e.g. 4GiB) mappings of
the same page repeatedly (or same range of pages). Doing this through
individual mappings would be very wasteful. This can be handled better
by using a flag on map creation, but to do it safely, drm_gpuvm needs to
be aware of this special case.

Add a flag that signals that a given mapping is a page mapping, which is
repeated all over the entire requested VA range. This tweaks the
sm_map() logic to treat the GEM offsets differently when mappings are
a repeated ones so they are not incremented as they would be with regular
mappings.

The size of the GEM portion to repeat is passed through
drm_gpuva::gem::range. Most of the time it will be a page size, but
it can be bigger as long as it's less that drm_gpuva::va::range, and
drm_gpuva::gem::range is a multiple of drm_gpuva::va::range.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 72 +++++++++++++++++++++++++++++++++----
 include/drm/drm_gpuvm.h     | 43 +++++++++++++++++++++-
 2 files changed, 108 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index dd949a8853b0..817393596149 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2063,6 +2063,7 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	op.map.va.range = req->va.range;
 	op.map.gem.obj = req->gem.obj;
 	op.map.gem.offset = req->gem.offset;
+	op.map.gem.range = req->gem.range;
 	op.map.flags = req->flags;
 
 	return fn->sm_step_map(&op, priv);
@@ -2122,12 +2123,53 @@ static bool can_merge(struct drm_gpuvm *gpuvm, const struct drm_gpuva *a,
 	if (drm_WARN_ON(gpuvm->drm, b->va.addr > a->va.addr + a->va.range))
 		return false;
 
+	if (a->flags & DRM_GPUVA_REPEAT) {
+		u64 va_diff = b->va.addr - a->va.addr;
+
+		/* If this is a repeated mapping, both the GEM range
+		 * and offset must match.
+		 */
+		if (a->gem.range != b->gem.range ||
+		    a->gem.offset != b->gem.offset)
+			return false;
+
+		/* The difference between the VA addresses must be a
+		 * multiple of the repeated range, otherwise there's
+		 * a shift.
+		 */
+		if (do_div(va_diff, a->gem.range))
+			return false;
+
+		return true;
+	}
+
 	/* We intentionally ignore u64 underflows because all we care about
 	 * here is whether the VA diff matches the GEM offset diff.
 	 */
 	return b->va.addr - a->va.addr == b->gem.offset - a->gem.offset;
 }
 
+static int check_map_req(struct drm_gpuvm *gpuvm,
+			 const struct drm_gpuvm_map_req *req)
+{
+	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
+		return -EINVAL;
+
+	if (req->flags & DRM_GPUVA_REPEAT) {
+		u64 va_range = req->va.range;
+
+		/* For a repeated mapping, GEM range must be > 0
+		 * and a multiple of the VA range.
+		 */
+		if (unlikely(!req->gem.range ||
+			     va_range < req->gem.range ||
+			     do_div(va_range, req->gem.range)))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
@@ -2137,6 +2179,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 	struct drm_gpuva reqva = {
 		.va.addr = req->va.addr,
 		.va.range = req->va.range,
+		.gem.range = req->gem.range,
 		.gem.offset = req->gem.offset,
 		.gem.obj = req->gem.obj,
 		.flags = req->flags,
@@ -2144,7 +2187,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 	u64 req_end = req->va.addr + req->va.range;
 	int ret;
 
-	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
+	ret = check_map_req(gpuvm, req);
+	if (unlikely(ret))
 		return -EINVAL;
 
 	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->va.addr, req_end) {
@@ -2175,7 +2219,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.addr = req_end,
 					.va.range = range - req->va.range,
 					.gem.obj = obj,
-					.gem.offset = offset + req->va.range,
+					.gem.range = va->gem.range,
+					.gem.offset = offset,
 					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
@@ -2183,6 +2228,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.keep = merge,
 				};
 
+				if (!(va->flags & DRM_GPUVA_REPEAT))
+					n.gem.offset += req->va.range;
+
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
@@ -2194,6 +2242,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				.va.addr = addr,
 				.va.range = ls_range,
 				.gem.obj = obj,
+				.gem.range = va->gem.range,
 				.gem.offset = offset,
 				.flags = va->flags,
 			};
@@ -2220,11 +2269,14 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.addr = req_end,
 					.va.range = end - req_end,
 					.gem.obj = obj,
-					.gem.offset = offset + ls_range +
-						      req->va.range,
+					.gem.range = va->gem.range,
+					.gem.offset = offset,
 					.flags = va->flags,
 				};
 
+				if (!(va->flags & DRM_GPUVA_REPEAT))
+					n.gem.offset += ls_range + req->va.range;
+
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
 				if (ret)
 					return ret;
@@ -2250,7 +2302,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.addr = req_end,
 					.va.range = end - req_end,
 					.gem.obj = obj,
-					.gem.offset = offset + req_end - addr,
+					.gem.range = va->gem.range,
+					.gem.offset = offset,
 					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
@@ -2258,6 +2311,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.keep = merge,
 				};
 
+				if (!(va->flags & DRM_GPUVA_REPEAT))
+					n.gem.offset += req_end - addr;
+
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
@@ -2294,6 +2350,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			prev.va.addr = addr;
 			prev.va.range = req_addr - addr;
 			prev.gem.obj = obj;
+			prev.gem.range = va->gem.range;
 			prev.gem.offset = offset;
 			prev.flags = va->flags;
 
@@ -2304,7 +2361,10 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			next.va.addr = req_end;
 			next.va.range = end - req_end;
 			next.gem.obj = obj;
-			next.gem.offset = offset + (req_end - addr);
+			prev.gem.range = va->gem.range;
+			next.gem.offset = offset;
+			if (!(va->flags & DRM_GPUVA_REPEAT))
+				next.gem.offset += req_end - addr;
 			next.flags = va->flags;
 
 			next_split = true;
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index f77a89e791f1..629e8508f99f 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -56,10 +56,19 @@ enum drm_gpuva_flags {
 	 */
 	DRM_GPUVA_SPARSE = (1 << 1),
 
+	/**
+	 * @DRM_GPUVA_REPEAT:
+	 *
+	 * Flag indicating that the &drm_gpuva is a mapping of a GEM
+	 * portion repeated multiple times to fill the virtual address
+	 * range.
+	 */
+	DRM_GPUVA_REPEAT = (1 << 2),
+
 	/**
 	 * @DRM_GPUVA_USERBITS: user defined bits
 	 */
-	DRM_GPUVA_USERBITS = (1 << 2),
+	DRM_GPUVA_USERBITS = (1 << 3),
 };
 
 /**
@@ -111,6 +120,18 @@ struct drm_gpuva {
 		 */
 		u64 offset;
 
+		/*
+		 * @gem.range: the range of the GEM that is mapped
+		 *
+		 * When dealing with normal mappings, this must be zero.
+		 * When flags has DRM_GPUVA_REPEAT set, this field must be
+		 * smaller than va.range and va.range must be a multiple of
+		 * gem.range.
+		 * This is a u32 not a u64 because we expect repeated mappings
+		 * to be pointing to relatively small portions of a GEM object.
+		 */
+		u32 range;
+
 		/**
 		 * @gem.obj: the mapped &drm_gem_object
 		 */
@@ -842,6 +863,17 @@ struct drm_gpuva_op_map {
 		 */
 		u64 offset;
 
+		/*
+		 * @gem.range: the range of the GEM that is mapped
+		 *
+		 * When dealing with normal mappings, this must be zero.
+		 * When flags has DRM_GPUVA_REPEAT set, it must be smaller
+		 * and be a multiple of va.range. This is a u32 not a u64
+		 * because we expect repeated mappings to be pointing to
+		 * a relatively small portion of a GEM object.
+		 */
+		u32 range;
+
 		/**
 		 * @gem.obj: the &drm_gem_object to map
 		 */
@@ -1078,6 +1110,15 @@ struct drm_gpuvm_map_req {
 
 		/** @offset: offset in the GEM */
 		u64 offset;
+
+		/**
+		 * @range: size of the range of the GEM object to map
+		 *
+		 * Must be zero unless flags has DRM_GPUVA_REPEAT set.
+		 * If DRM_GPUVA_REPEAT is set, this field must be less than va.range,
+		 * and va.range must be a multiple of gem.range.
+		 */
+		u32 range;
 	} gem;
 
 	/** @flags: combination of DRM_GPUVA_ flags describing the mapping properties. */
-- 
2.47.2

