Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F3A24E68
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 14:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E0210E287;
	Sun,  2 Feb 2025 13:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="dODRLE/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B5B10E258;
 Sun,  2 Feb 2025 13:52:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: sendonly@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 2040542A28;
 Sun,  2 Feb 2025 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1738503917;
 bh=OLGzWIkyIZHxUGup6PI174LIKXzrBy2ulBvLvPIQBVU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=dODRLE/YYhpd1VLINJf+HOKqWPI6mmFrs7q7hUhu0i27Tqczy0ZhuyURvQWYbmMW6
 tqUj3T9wCleVIM5I6kAWvzbPjtR5hnd81k18bucIhD5uG1wfrLf8BONRJWzV9pzI8q
 Zu0YyCqg6kWW5EQcAcFNeSdPMYncNoZkbaFV8h1IYPSBi8lIeGqvudnBmNGPCHxCV6
 aojGx3PX8rzeU2xQjS7fgYcQ9oVTKaz50GEFJpkJgAgdGfbIxlQ2B+50b0zZWYm+lN
 tPcNks7AtZb4kej3KjvT26Y9mqcUCN0efvoakw6Yxn8YP55bRo512VEN0B1DFkhfwS
 ZCPtH5kE0paXA==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:34:52 +0900
Subject: [PATCH 3/4] drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-gpuvm-single-page-v1-3-8cbd44fdcbd4@asahilina.net>
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
In-Reply-To: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738503908; l=5308;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=OLGzWIkyIZHxUGup6PI174LIKXzrBy2ulBvLvPIQBVU=;
 b=yHAWee7eKfU/M+siam2O4ZurfxGe7VrVpVlxV/3l/qgXoL/GSNoRZlwmnckTKPVaKRYnqfcN8
 d0RhFTj/uVzC+NljuXzK9PCUP8z0302kuahenSXQB0FEMqee/8Xff2R
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=
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

To be able to support "fake sparse" mappings without relying on GPU page
fault handling, drivers may need to create large (e.g. 4GiB) mappings of
the same page repeatedly. Doing this through individual single-page
mappings would be very wasteful. This can be handled better by using a
flag on map creation, but to do it safely, drm_gpuvm needs to be aware
of this special case.

Add a flag that signals that a given mapping is a single page mapping,
which is repeated all over the entire requested VA range. This does two
things in drm_gpuvm:
- Restricts the merge logic, so only drm_gpuvas with the same flag state
  are considered "mergeable" (both SINGLE_PAGE or both not)
- Removes the GEM buffer offset logic for SINGLE_PAGE mappings. Since
  a single page from the buffer is repeatedly mapped across the entire
  VA range, the offset never needs to have an offset added to it when
  mappings are split.

Note that this does not require drm_gpuva to know anything about the
page size.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/drm_gpuvm.c | 44 ++++++++++++++++++++++++++++++++++----------
 include/drm/drm_gpuvm.h     |  9 ++++++++-
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 7443be1fe4de4653ec40ca4b874df30297af7faf..51429d90875e3f2370c4f8975d6fd813842b8976 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -670,6 +670,12 @@
  *	}
  */
 
+/**
+ * Mask of flags which must match to consider a drm_gpuva eligible for merging
+ * with a new overlaid mapping.
+ */
+#define DRM_GPUVA_UNMERGEABLE_FLAGS DRM_GPUVA_SINGLE_PAGE
+
 /**
  * get_next_vm_bo_from_list() - get the next vm_bo element
  * @__gpuvm: the &drm_gpuvm
@@ -2121,6 +2127,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 range = va->va.range;
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
+		bool single_page = va->flags & DRM_GPUVA_SINGLE_PAGE;
+
+		merge &= !((va->flags ^ req_flags) & DRM_GPUVA_UNMERGEABLE_FLAGS);
 
 		if (addr == req_addr) {
 			merge &= obj == req_obj &&
@@ -2145,7 +2154,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.addr = req_end,
 					.va.range = range - req_range,
 					.gem.obj = obj,
-					.gem.offset = offset + req_range,
+					.gem.offset = offset +
+						(single_page ? 0 : req_range),
 					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
@@ -2169,8 +2179,12 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
-			merge &= obj == req_obj &&
-				 offset + ls_range == req_offset;
+			merge &= obj == req_obj;
+			if (single_page)
+				merge &= offset == req_offset;
+			else
+				merge &= offset + ls_range == req_offset;
+
 			u.keep = merge;
 
 			if (end == req_end) {
@@ -2192,8 +2206,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.addr = req_end,
 					.va.range = end - req_end,
 					.gem.obj = obj,
-					.gem.offset = offset + ls_range +
-						      req_range,
+					.gem.offset = offset +
+						(single_page ? 0 :
+						 ls_range + req_range),
 					.flags = va->flags,
 				};
 
@@ -2203,9 +2218,13 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				break;
 			}
 		} else if (addr > req_addr) {
-			merge &= obj == req_obj &&
-				 offset == req_offset +
-					   (addr - req_addr);
+			merge &= obj == req_obj;
+
+			if (single_page)
+				merge &= offset == req_offset;
+			else
+				merge &= offset == req_offset +
+					 (addr - req_addr);
 
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
@@ -2226,7 +2245,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.addr = req_end,
 					.va.range = end - req_end,
 					.gem.obj = obj,
-					.gem.offset = offset + req_end - addr,
+					.gem.offset = offset +
+						(single_page ? 0 :
+						 req_end - addr),
 					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
@@ -2268,6 +2289,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 		u64 addr = va->va.addr;
 		u64 range = va->va.range;
 		u64 end = addr + range;
+		bool single_page = va->flags & DRM_GPUVA_SINGLE_PAGE;
 
 		if (addr < req_addr) {
 			prev.va.addr = addr;
@@ -2283,7 +2305,9 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			next.va.addr = req_end;
 			next.va.range = end - req_end;
 			next.gem.obj = obj;
-			next.gem.offset = offset + (req_end - addr);
+			next.gem.offset = offset;
+			if (!single_page)
+				next.gem.offset += req_end - addr;
 			next.flags = va->flags;
 
 			next_split = true;
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 42b29adfabdaf193b1e1a02f9ab48ab0dd0e60d4..dfeec61908b1a8295ae08b26bef211d3d4fda85b 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -56,10 +56,17 @@ enum drm_gpuva_flags {
 	 */
 	DRM_GPUVA_SPARSE = (1 << 1),
 
+	/**
+	 * @DRM_GPUVA_SINGLE_PAGE:
+	 *
+	 * Flag indicating that the &drm_gpuva is a single-page mapping.
+	 */
+	DRM_GPUVA_SINGLE_PAGE = (1 << 2),
+
 	/**
 	 * @DRM_GPUVA_USERBITS: user defined bits
 	 */
-	DRM_GPUVA_USERBITS = (1 << 2),
+	DRM_GPUVA_USERBITS = (1 << 3),
 };
 
 /**

-- 
2.47.1

