Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7B80386F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 16:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3A610E1E8;
	Mon,  4 Dec 2023 15:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CB310E1D0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 15:14:13 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B72466071C9;
 Mon,  4 Dec 2023 15:14:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701702852;
 bh=hBZjpee69qC1h3SEpxVcbRYUq9jfEyZjWsgNXrIki4w=;
 h=From:To:Cc:Subject:Date:From;
 b=ITQOgLSu6sdBkkTJ97nbtUT+yZCQDhVblb7obn9D6wsex+5rGPJ6N9iTQxWJQITZ9
 Om3JZ55kydfpFxqFRpBpCAjiWN/HSoGyUIWeLZJt/NXRgyePYU6v8Ad7TGx08HlrKY
 KaWQLPsDV+XBeFwjt56S5v13xlzm5KEuRAuhNQdJ4JyXguppKWlqRywh6vRV2qpPpm
 dEHdSJ3Duf0zQ5arak4AkS8NW4KW7Hj9HdSHF4n52Gd5yUqnMkrDm/MxZRyUrhkNgW
 1/rGh88cOJzspJJJ4xZkFpjCU0iUirHI8kT1O3/uMhsoY7NFU5fitSVbYSqtHTHz+H
 oAL/8srJCJuJQ==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] drm/gpuvm: Let drm_gpuvm_bo_put() report when the vm_bo
 object is destroyed
Date: Mon,  4 Dec 2023 16:14:06 +0100
Message-ID: <20231204151406.1977285-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some users need to release resources attached to the vm_bo object when
it's destroyed. In Panthor's case, we need to release the pin ref so
BO pages can be returned to the system when all GPU mappings are gone.

This could be done through a custom drm_gpuvm::vm_bo_free() hook, but
this has all sort of locking implications that would force us to expose
a drm_gem_shmem_unpin_locked() helper, not to mention the fact that
having a ::vm_bo_free() implementation without a ::vm_bo_alloc() one
seems odd. So let's keep things simple, and extend drm_gpuvm_bo_put()
to report when the object is destroyed.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 8 ++++++--
 include/drm/drm_gpuvm.h     | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 54f5e8851de5..ae13e2d63637 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1502,14 +1502,18 @@ drm_gpuvm_bo_destroy(struct kref *kref)
  * hold the dma-resv or driver specific GEM gpuva lock.
  *
  * This function may only be called from non-atomic context.
+ *
+ * Returns: true if vm_bo was destroyed, false otherwise.
  */
-void
+bool
 drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
 {
 	might_sleep();
 
 	if (vm_bo)
-		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
+		return !!kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
+
+	return false;
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
 
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index f94fec9a8517..7cc41a7d86d5 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -738,7 +738,7 @@ drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
 	return vm_bo;
 }
 
-void drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
+bool drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
 
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
-- 
2.43.0

