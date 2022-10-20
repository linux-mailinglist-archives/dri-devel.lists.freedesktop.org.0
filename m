Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E2605608
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 05:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D34010E2FE;
	Thu, 20 Oct 2022 03:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF3710E2EF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 03:41:47 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E42AB33EF65;
 Thu, 20 Oct 2022 04:41:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666237306; bh=yFkxNmJrm5V8zjuZE5xI3HVSGvEeM0v0x9DDjUD/yLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ahOGTWW+Bgl6f73Vqg6Hax3LRXoe1d4tFkIISydw6Wi5YhzYdo8MmrIQFMOSU9qJC
 Su3o8DSYnAX+kLYjVB8sWkVdSbo/Jgq07Rkv9XwaQce+9EA5zJh+TKdn6/IrPo1rwu
 jf5DNEHBVI3YW1iSk9Db0Jpi3SXf1ppi+6pwbl+kl6oAZbpzJjc27XPxcPKwUYDubY
 Xa74Blx9YCq8Gj6coTJEADE0a7hteBohVEk9OHiiRwsVQ7UmYqT5GaCyTBQ9YbQN6J
 iIto8KHKvH6sIcWWDoAEfjtx9S/VA616EvCWD2xt5y0AysWL1KSQXtuwtIWnVMoBGe
 Be4d3E6e63Xrg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/16] drm/vmwgfx: Do not allow invalid bpp's for dumb
 buffers
Date: Wed, 19 Oct 2022 23:41:27 -0400
Message-Id: <20221020034131.491973-13-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020034131.491973-1-zack@kde.org>
References: <20221020034131.491973-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Dumb buffers allow a very limited set of formats. Basically everything
apart from 1, 2 and 4 is expected to return an error. Make vmwgfx
follow those guidelines.

This fixes igt's dumb_buffer invalid_bpp test on vmwgfx.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 822251aaab0a..d218b15953e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -807,9 +807,23 @@ int vmw_dumb_create(struct drm_file *file_priv,
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct vmw_buffer_object *vbo;
+	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	int ret;
 
-	args->pitch = args->width * ((args->bpp + 7) / 8);
+	switch (cpp) {
+	case 1: /* DRM_FORMAT_C8 */
+	case 2: /* DRM_FORMAT_RGB565 */
+	case 4: /* DRM_FORMAT_XRGB8888 */
+		break;
+	default:
+		/*
+		 * Dumb buffers don't allow anything else.
+		 * This is tested via IGT's dumb_buffers
+		 */
+		return -EINVAL;
+	}
+
+	args->pitch = args->width * cpp;
 	args->size = ALIGN(args->pitch * args->height, PAGE_SIZE);
 
 	ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
-- 
2.34.1

