Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE4AFB97A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818CC10E334;
	Mon,  7 Jul 2025 17:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DSU8wyYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF4010E502;
 Mon,  7 Jul 2025 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751907909;
 bh=akBcOMf2yaT9+54T4JiDFinAfyszlhXfN+hd5VU7pxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DSU8wyYlQCn+tAXjJkoR0l9B3baQkuzMRCWFSTvbZLnJkWcQn4EMH16aRsXZHzUjY
 vGB9yIYtgtfr6C292lr613erbe6MiXDfHNOr5vaYShYuLNaiQceSd6bsshYP/7m8Mi
 HDhqmbk4dvPLZhgVQUpryMSQMpMwMft6zrIYMxAoI2EguuCGVn84skj8rTcGab0ulV
 XUa95uZBp58lQRRN4cmxamBonkUAZyJeMv2IZIuVZbVegk95k6+VaSRgayneK3cxre
 O2UqKnSOFKjU6VmAAhdAiFaNbz8otuDUFrtUHO2Uxt3sex2GhEJa4q7oPUbVlWRbR7
 5zQBMdIRFVUig==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nanokatze)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B8EC417E04EE;
 Mon,  7 Jul 2025 19:05:07 +0200 (CEST)
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
 Caterina Shablia <caterina.shablia@collabora.com>
Subject: [PATCH v4 5/7] drm/gpuvm: Add a flags field to
 drm_gpuvm_map_req/drm_gpuva_op_map
Date: Mon,  7 Jul 2025 17:04:31 +0000
Message-ID: <20250707170442.1437009-6-caterina.shablia@collabora.com>
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

From: Asahi Lina <lina@asahilina.net>

drm_gpuva objects have a flags field. Currently, this can be managed by
drivers out-of-band, without any special handling in drm_gpuvm.

To be able to introduce flags that do affect the logic in the drm_gpuvm
core, we need to plumb it through the map calls. This will allow the
core to check the flags on map and alter the merge/split logic depending
on the requested flags and the flags of the existing drm_gpuva ranges
that are being split.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 7 +++++++
 include/drm/drm_gpuvm.h     | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index dc3c2f906400..dd949a8853b0 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2063,6 +2063,7 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	op.map.va.range = req->va.range;
 	op.map.gem.obj = req->gem.obj;
 	op.map.gem.offset = req->gem.offset;
+	op.map.flags = req->flags;
 
 	return fn->sm_step_map(&op, priv);
 }
@@ -2175,6 +2176,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.range = range - req->va.range,
 					.gem.obj = obj,
 					.gem.offset = offset + req->va.range,
+					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2193,6 +2195,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				.va.range = ls_range,
 				.gem.obj = obj,
 				.gem.offset = offset,
+				.flags = va->flags,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
@@ -2219,6 +2222,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.gem.obj = obj,
 					.gem.offset = offset + ls_range +
 						      req->va.range,
+					.flags = va->flags,
 				};
 
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
@@ -2247,6 +2251,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					.va.range = end - req_end,
 					.gem.obj = obj,
 					.gem.offset = offset + req_end - addr,
+					.flags = va->flags,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2290,6 +2295,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			prev.va.range = req_addr - addr;
 			prev.gem.obj = obj;
 			prev.gem.offset = offset;
+			prev.flags = va->flags;
 
 			prev_split = true;
 		}
@@ -2299,6 +2305,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 			next.va.range = end - req_end;
 			next.gem.obj = obj;
 			next.gem.offset = offset + (req_end - addr);
+			next.flags = va->flags;
 
 			next_split = true;
 		}
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index a6e6c33fc10b..f77a89e791f1 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -847,6 +847,11 @@ struct drm_gpuva_op_map {
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
@@ -1074,6 +1079,9 @@ struct drm_gpuvm_map_req {
 		/** @offset: offset in the GEM */
 		u64 offset;
 	} gem;
+
+	/** @flags: combination of DRM_GPUVA_ flags describing the mapping properties. */
+	enum drm_gpuva_flags flags;
 };
 
 struct drm_gpuva_ops *
@@ -1097,6 +1105,7 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
+	va->flags = op->flags;
 	va->va.addr = op->va.addr;
 	va->va.range = op->va.range;
 	va->gem.obj = op->gem.obj;
-- 
2.47.2

