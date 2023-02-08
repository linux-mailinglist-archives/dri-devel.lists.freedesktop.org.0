Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B625A68F653
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB8510E7E5;
	Wed,  8 Feb 2023 18:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E2D10E7E5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:00:57 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 249BA3204CB;
 Wed,  8 Feb 2023 18:00:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1675879255; bh=rFBMKazwj9Lurn1cPPUSGZczAcpzPaIz4CyNt9XqYUs=;
 h=From:To:Cc:Subject:Date:From;
 b=byO9V/IazNcp+49Smh7++ZYRtZLaWpJtvoooK5BDXtLm/u976A+iorlWqXA5vsMG6
 0OeXEiZGD2Bwq6KevYXdHQShKtt6RAXhLGdRxUzAGrNC6IsFibeVzVO0i13UDdgIi5
 PJBfKq37fe3Z14VDNjewtn/+Oqq1F7TxJc81CTJBkJVv9L3TVMSZfMaqyqvOJmwv9s
 oZ13qNJOPubzPa7PY25Wxzwhmj68zXxSLcuL4gUjyFcqIBZP3rP/yUA9tPvzBkHmv1
 /M5Piqb3436YJt6JMTgs2CMstNj08wKVjuks1YdleCV445toMVijf082Gs3cQMG5bJ
 3inJmZDw9RaSQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Stop accessing buffer objects which failed init
Date: Wed,  8 Feb 2023 13:00:50 -0500
Message-Id: <20230208180050.2093426-1-zack@kde.org>
X-Mailer: git-send-email 2.38.1
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
Cc: krastevm@vmware.com, stable@vger.kernel.org, banackm@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

ttm_bo_init_reserved on failure puts the buffer object back which
causes it to be deleted, but kfree was still being called on the same
buffer in vmw_bo_create leading to a double free.

After the double free the vmw_gem_object_create_with_handle was
setting the gem function objects before checking the return status
of vmw_bo_create leading to null pointer access.

Fix the entire path by relaying on ttm_bo_init_reserved to delete the
buffer objects on failure and making sure the return status is checked
before setting the gem function objects on the buffer object.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Cc: <stable@vger.kernel.org> # v5.17+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c  | 4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 63486802c8fd..43ffa5c7acbd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -431,13 +431,15 @@ int vmw_bo_create(struct vmw_private *vmw,
 		return -ENOMEM;
 	}
 
+	/*
+	 * vmw_bo_init will delete the *p_bo object if it fails
+	 */
 	ret = vmw_bo_init(vmw, *p_bo, params, vmw_bo_free);
 	if (unlikely(ret != 0))
 		goto out_error;
 
 	return ret;
 out_error:
-	kfree(*p_bo);
 	*p_bo = NULL;
 	return ret;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index f042e22b8b59..51bd1f8c5cc4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -127,11 +127,11 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
 	};
 
 	ret = vmw_bo_create(dev_priv, &params, p_vbo);
-
-	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
 	if (ret != 0)
 		goto out_no_bo;
 
+	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
+
 	ret = drm_gem_handle_create(filp, &(*p_vbo)->tbo.base, handle);
 	/* drop reference from allocate - handle holds it now */
 	drm_gem_object_put(&(*p_vbo)->tbo.base);
-- 
2.38.1

