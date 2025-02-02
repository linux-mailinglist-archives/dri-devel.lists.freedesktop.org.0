Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E3A24E67
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 14:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB13310E27D;
	Sun,  2 Feb 2025 13:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=asahilina.net header.i=@asahilina.net header.b="KDN6Tkkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CED10E27D;
 Sun,  2 Feb 2025 13:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: sendonly@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id D841F426EE;
 Sun,  2 Feb 2025 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1738503914;
 bh=vxT04nszNYnFWNQ4+iuLe6XKk4Je/y1ergi0uu+bCHg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=KDN6TkkzHhvOod6q6xg2oh/wlYnvxjXhCbKdhwi2f4dEcYHUoyDrTk5pmV9B1YF6R
 PZ1DVimctqwo0SNYcRqmbOpeD624p32Dgxyd7xJRUXa+86XbIBt0G2/oztXEaUWFmz
 iZLtbEnOL/RYwleYQRMh5tk9JpubBEE+IGj1WanGImjn0K0lTO1eOeF03Vi1vexrJd
 Ekb+wj6CelKdQbIwqYmztPxigF/CiuAX5zXg6QVpVJRj701fO8a1RVAZ2dpUdwshvn
 Q9gm/jFr90bWjNSFkD9rQr+m4/yJzoeCGvCdWunWA13e1f3P2n3mQjgm0w6Gwl4td5
 QtXSuuZszfqUA==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:34:51 +0900
Subject: [PATCH 2/4] drm/gpuvm: Plumb through flags into drm_gpuva_op_map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-gpuvm-single-page-v1-2-8cbd44fdcbd4@asahilina.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738503908; l=4333;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=vxT04nszNYnFWNQ4+iuLe6XKk4Je/y1ergi0uu+bCHg=;
 b=gq/c4I9HNcHote0XtkmkSy3/lY0B+7nyJD32jSqR5hh4eG49+tHaiYx0JhiGuUBGPUn765jVm
 oeC+6314nFjCWYQW4Gfb1UWAKiQ9jczJPEcPGDEDhYtEC1cHomvHJrT
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

Now that the map API functions take a flags argument, plumb it through
into the drm_gpuva_op_map structure so that drivers can retrieve the
value that was passed. Similarly, for remap calls, take the flags from
the existing drm_gpuva.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/drm_gpuvm.c | 22 +++++++++++++++++-----
 include/drm/drm_gpuvm.h     |  5 +++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 9733460d737667035541b488657154afb56872e3..7443be1fe4de4653ec40ca4b874df30297af7faf 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2054,7 +2054,8 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
 static int
 op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	  u64 addr, u64 range,
-	  struct drm_gem_object *obj, u64 offset)
+	  struct drm_gem_object *obj, u64 offset,
+	  enum drm_gpuva_flags flags)
 {
 	struct drm_gpuva_op op = {};
 
@@ -2063,6 +2064,7 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	op.map.va.range = range;
 	op.map.gem.obj = obj;
 	op.map.gem.offset = offset;
+	op.map.flags = flags;
 
 	return fn->sm_step_map(&op, priv);
 }
@@ -2102,7 +2104,8 @@ static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
 		   u64 req_addr, u64 req_range,
-		   struct drm_gem_object *req_obj, u64 req_offset)
+		   struct drm_gem_object *req_obj, u64 req_offset,
+		   enum drm_gpuva_flags req_flags)
 {
 	struct drm_gpuva *va, *next;
 	u64 req_end = req_addr + req_range;
@@ -2143,6 +2146,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.range = range - req_range,
 					.gem.obj = obj,
 					.gem.offset = offset + req_range,
+					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2161,6 +2165,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				.va.range = ls_range,
 				.gem.obj = obj,
 				.gem.offset = offset,
+				.flags = va->flags,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
@@ -2189,6 +2194,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.gem.obj = obj,
 					.gem.offset = offset + ls_range +
 						      req_range,
+					.flags = va->flags,
 				};
 
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
@@ -2221,6 +2227,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.range = end - req_end,
 					.gem.obj = obj,
 					.gem.offset = offset + req_end - addr,
+					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2237,7 +2244,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 
 	return op_map_cb(ops, priv,
 			 req_addr, req_range,
-			 req_obj, req_offset);
+			 req_obj, req_offset,
+			 req_flags);
 }
 
 static int
@@ -2266,6 +2274,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			prev.va.range = req_addr - addr;
 			prev.gem.obj = obj;
 			prev.gem.offset = offset;
+			prev.flags = va->flags;
 
 			prev_split = true;
 		}
@@ -2275,6 +2284,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			next.va.range = end - req_end;
 			next.gem.obj = obj;
 			next.gem.offset = offset + (req_end - addr);
+			next.flags = va->flags;
 
 			next_split = true;
 		}
@@ -2345,7 +2355,8 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 
 	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
 				  req_addr, req_range,
-				  req_obj, req_offset);
+				  req_obj, req_offset,
+				  req_flags);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
@@ -2538,7 +2549,8 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 
 	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
 				 req_addr, req_range,
-				 req_obj, req_offset);
+				 req_obj, req_offset,
+				 req_flags);
 	if (ret)
 		goto err_free_ops;
 
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index cb045378803646a9645c002c57183c915d35befb..42b29adfabdaf193b1e1a02f9ab48ab0dd0e60d4 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -851,6 +851,11 @@ struct drm_gpuva_op_map {
 		 */
 		struct drm_gem_object *obj;
 	} gem;
+
+	/**
+	 * @flags: requested flags for the &drm_gpuva for this mapping
+	 */
+	enum drm_gpuva_flags flags;
 };
 
 /**

-- 
2.47.1

