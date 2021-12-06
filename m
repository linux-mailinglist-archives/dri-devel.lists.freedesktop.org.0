Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F3F46A2D5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8473AA3;
	Mon,  6 Dec 2021 17:26:41 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DBD73AE5
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:38 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 9658729F82C;
 Mon,  6 Dec 2021 17:26:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811597; bh=R+wNNa3hzAUg3hVhWr/Cga8ZV/xMaxWvbjEWIYpM7zI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UN54XODhpLRCjUKxlag7zF2MHFas8n1vy4E4CBBy7S9S70G0Os0nwfA48wRnQz+JM
 LpV0xNAHVEFuMzy1UjPHBHPzBFK/uoKfPTot+FSBrjEcb4OVfiOsOc7OmD2Bz3tTaL
 03bL2plMSKkBL/9Xa8tCZxC9rKvmrchZu9GWj50ZoKFH+Skj6xAg0HAhqzFwhusGD3
 eltfpbqVjxZEO4gK28JTzK8FM069LSNhlGgWvGnPGQlQ/Kj/3IbFbM16aBEeGPtmkJ
 LuXhlhHLTbPsZ3np+7W3b1TjQkUER7TNkrBUEuw5eHvKpmfmW42s4/agD7Lqd0uNYB
 plFWFDRwLPQqQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 05/12] drm/vmwgfx: Implement create_handle on
 drm_framebuffer_funcs
Date: Mon,  6 Dec 2021 12:26:13 -0500
Message-Id: <20211206172620.3139754-6-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-1-zack@kde.org>
References: <20211206172620.3139754-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

The fb handle code assumes it deals with GEM objects. Because vmwgfx
buffer objects were not actually GEM objects we were not able to
implement that interface. Now that vmwgfx supports GEM buffer objects
we can trivially implement create_handle for buffer object backed
framebuffers.
Among others this gets IGT's kms_getfb test passing.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index b4bbb5c47bdd..4e693e8de2c3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -987,6 +987,16 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
  * Buffer-object framebuffer code
  */
 
+static int vmw_framebuffer_bo_create_handle(struct drm_framebuffer *fb,
+					    struct drm_file *file_priv,
+					    unsigned int *handle)
+{
+	struct vmw_framebuffer_bo *vfbd =
+			vmw_framebuffer_to_vfbd(fb);
+
+	return drm_gem_handle_create(file_priv, &vfbd->buffer->base.base, handle);
+}
+
 static void vmw_framebuffer_bo_destroy(struct drm_framebuffer *framebuffer)
 {
 	struct vmw_framebuffer_bo *vfbd =
@@ -1059,6 +1069,7 @@ static int vmw_framebuffer_bo_dirty_ext(struct drm_framebuffer *framebuffer,
 }
 
 static const struct drm_framebuffer_funcs vmw_framebuffer_bo_funcs = {
+	.create_handle = vmw_framebuffer_bo_create_handle,
 	.destroy = vmw_framebuffer_bo_destroy,
 	.dirty = vmw_framebuffer_bo_dirty_ext,
 };
-- 
2.32.0

