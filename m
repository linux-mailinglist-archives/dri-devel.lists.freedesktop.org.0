Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BFA5A70F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 23:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943DB10E0EA;
	Mon, 10 Mar 2025 22:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dE6W90Jw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6281F10E0EA;
 Mon, 10 Mar 2025 22:24:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D07EA464C9;
 Mon, 10 Mar 2025 22:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA8AC4CEE5;
 Mon, 10 Mar 2025 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741645440;
 bh=CTv6x1iwe7lNlBx7Ev52FAfLLDsbcv7enQTrxI7zsyo=;
 h=From:To:Cc:Subject:Date:From;
 b=dE6W90JwOo6aVDSFYATuN8T0XBAFnZHt2qM3uwGDsKfNoDN4uaxGne8JYEVQPNRqS
 9lHrAgwG+XkDZNsLNfMvrOBewxc7Nv7M04JJkX/VdIGLVdDjTf2jgdvAiKiVOq9t6T
 lKji9oROUTDf5D2z/W8G9y2qnbShoKuESVejF1FlGoZCvO8XAe5KcmZ4UTPitWuccb
 tC2QD0d3Ce9Bd3piBI5trgHv/xxhbNomEDoTyMnWhis/TkHpqtP/nK2dRhhIzVMjt4
 DuiHj06xiqAFUqhILrPfPrgOEQkju4ceAR1ui6yWHIcNQ26QCyI1zj5/VHlCbrdLyL
 F+TQ/taWgOU6Q==
From: Kees Cook <kees@kernel.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Add __nonstring annotations for unterminated
 strings
Date: Mon, 10 Mar 2025 15:23:56 -0700
Message-Id: <20250310222355.work.417-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815; i=kees@kernel.org;
 h=from:subject:message-id; bh=CTv6x1iwe7lNlBx7Ev52FAfLLDsbcv7enQTrxI7zsyo=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDOnn06qZjaSni/V38P2dmxCtJXbfUFFs/iOzbZunHhYqZ
 DvGPaOno5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCJZZxgZelmUT+/S4yirMam0
 8Vur2ylbJH50ZlRwfeGly9OP8bRPZvhfWSbEu0dt9enTP9bU1fPe5FKS3c/t27JwwYqVa80ZhVw
 ZAQ==
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

When a character array without a terminating NUL character has a static
initializer, GCC 15's -Wunterminated-string-initialization will only
warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
with __nonstring to and correctly identify the char array as "not a C
string" and thereby eliminate the warning.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117178 [1]
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <kees@kernel.org>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 509f9ccae3a9..f701638d3145 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -43,7 +43,7 @@
 #define DEVICE_TYPE_EFP4   0x10
 
 struct opregion_header {
-	u8 signature[16];
+	u8 signature[16] __nonstring;
 	u32 size;
 	u32 opregion_ver;
 	u8 bios_ver[32];
@@ -222,7 +222,7 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
 	u8 *buf;
 	struct opregion_header *header;
 	struct vbt v;
-	const char opregion_signature[16] = OPREGION_SIGNATURE;
+	const char opregion_signature[16] __nonstring = OPREGION_SIGNATURE;
 
 	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
 	vgpu_opregion(vgpu)->va = (void *)__get_free_pages(GFP_KERNEL |
-- 
2.34.1

