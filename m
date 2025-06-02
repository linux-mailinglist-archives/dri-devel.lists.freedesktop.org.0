Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE105ACB1C2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FDC10E2D3;
	Mon,  2 Jun 2025 14:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nb9MNeYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE0B10E2DF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:23:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 428876111C;
 Mon,  2 Jun 2025 14:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4782AC4CEEB;
 Mon,  2 Jun 2025 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1748874202;
 bh=iUzlmyuE3KzGN6EwcgbeLBTuduXBTYp2vKPAEfXyhYs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nb9MNeYXH3litdvJnm8HXo7tl6aQBXO6/iQiTbcxGmDKnkaAU0GQOeDL6OPuDD8yt
 kZXkY2/XWMX2MkUj53VwQCBs5QMbr9H+OFTRr39zOMOtMV9Ae42Cp4R9VFrsxkP0mk
 gXC+jJMoT5kcbDOv5o2PtI0Fx61caSVhLs3t0UOs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andyshrk@163.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH 6.6 391/444] drm/gem: Internally test import_attach for
 imported objects
Date: Mon,  2 Jun 2025 15:47:35 +0200
Message-ID: <20250602134356.780212081@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602134340.906731340@linuxfoundation.org>
References: <20250602134340.906731340@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 8260731ccad0451207b45844bb66eb161a209218 upstream.

Test struct drm_gem_object.import_attach to detect imported objects.

During object clenanup, the dma_buf field might be NULL. Testing it in
an object's free callback then incorrectly does a cleanup as for native
objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
clears the dma_buf field in drm_gem_object_exported_dma_buf_free().

v3:
- only test for import_attach (Boris)
v2:
- use import_attach.dmabuf instead of dma_buf (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
Reported-by: Andy Yan <andyshrk@163.com>
Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
Tested-by: Andy Yan <andyshrk@163.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/r/20250416065820.26076-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/drm_gem.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -567,8 +567,7 @@ static inline bool drm_gem_object_is_sha
  */
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
-	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return !!obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP


