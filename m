Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102FAF7C19
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE9F10E89B;
	Thu,  3 Jul 2025 15:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EMyyij1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6B310E88B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751556693;
 bh=jgZFgX8f1lmIrMc9XkXVrobKxZOqQe3AE+a8f3uEcYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EMyyij1bWsxEvUMBeKfc9eOYwpG2WIHU7PBods5UiMSGJN2OyL/SLDDw2dtErkITj
 3oq4I7EAF3zpXGIIZ57cucq2lkCivXlcsuXMbGND76jggNPtXIvH4d6y6GaUT0KTKo
 KHyVZVDXq58P23ODO8YAil8hbXEBslKWjcW8PJdTYYzhoz0pjROAWMOHWIWIwbbJ8C
 DvrjKXhNRIFsieKjaxaCPnLS/AfToUol7uxb2p1Q+h6JexahdhjIQ5zWAi7aA7oFYW
 qktmh7BxFbxEj3h7XqQNHUo7sUVu4mp62wH2TXU0xvIjYSyYc2q+u/sbLVbPUose2m
 5nAef8Na4wfvg==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nanokatze)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7858B17E09C6;
 Thu,  3 Jul 2025 17:31:32 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Caterina Shablia <caterina.shablia@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] drm/gpuvm: Add a helper to check if two VA can be
 merged
Date: Thu,  3 Jul 2025 15:28:57 +0000
Message-ID: <20250703152908.16702-6-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250703152908.16702-2-caterina.shablia@collabora.com>
References: <20250703152908.16702-2-caterina.shablia@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

We are going to add flags/properties that will impact the VA merging
ability. Instead of sprinkling tests all over the place in
__drm_gpuvm_sm_map(), let's add a helper aggregating all these checks
can call it for every existing VA we walk through in the
__drm_gpuvm_sm_map() loop.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 47 +++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index ae201d45e6b8..2df04dfcb6ef 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2098,12 +2098,48 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	return fn->sm_step_unmap(&op, priv);
 }
 
+static bool can_merge(struct drm_gpuvm *gpuvm, const struct drm_gpuva *a,
+		      const struct drm_gpuva *b)
+{
+	/* Only GEM-based mappings can be merged, and they must point to
+	 * the same GEM object.
+	 */
+	if (a->gem.obj != b->gem.obj || !a->gem.obj)
+		return false;
+
+	/* Let's keep things simple for now and force all flags to match. */
+	if (a->flags != b->flags)
+		return false;
+
+	/* Order VAs for the rest of the checks. */
+	if (a->va.addr > b->va.addr)
+		swap(a, b);
+
+	/* We assume the caller already checked that VAs overlap or are
+	 * contiguous.
+	 */
+	if (drm_WARN_ON(gpuvm->drm, b->va.addr > a->va.addr + a->va.range))
+		return false;
+
+	/* We intentionally ignore u64 underflows because all we care about
+	 * here is whether the VA diff matches the GEM offset diff.
+	 */
+	return b->va.addr - a->va.addr == b->gem.offset - a->gem.offset;
+}
+
 static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
 		   const struct drm_gpuvm_map_req *req)
 {
 	struct drm_gpuva *va, *next;
+	struct drm_gpuva reqva = {
+		.va.addr = req->va.addr,
+		.va.range = req->va.range,
+		.gem.offset = req->gem.offset,
+		.gem.obj = req->gem.obj,
+		.flags = req->flags,
+	};
 	u64 req_end = req->va.addr + req->va.range;
 	int ret;
 
@@ -2116,12 +2152,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 addr = va->va.addr;
 		u64 range = va->va.range;
 		u64 end = addr + range;
-		bool merge = !!va->gem.obj;
+		bool merge = can_merge(gpuvm, va, &reqva);
 
 		if (addr == req->va.addr) {
-			merge &= obj == req->gem.obj &&
-				 offset == req->gem.offset;
-
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
@@ -2163,8 +2196,6 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
-			merge &= obj == req->gem.obj &&
-				 offset + ls_range == req->gem.offset;
 			u.keep = merge;
 
 			if (end == req_end) {
@@ -2196,10 +2227,6 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				break;
 			}
 		} else if (addr > req->va.addr) {
-			merge &= obj == req->gem.obj &&
-				 offset == req->gem.offset +
-					   (addr - req->va.addr);
-
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
-- 
2.47.2

