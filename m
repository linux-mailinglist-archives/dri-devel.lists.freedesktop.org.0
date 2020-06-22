Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F46420411F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 22:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311A36E8FB;
	Mon, 22 Jun 2020 20:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF086E8FA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 20:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592856552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7C1bvhKIMiYzddlJ1ZuNBtepNAvWmR1RXVY31OOfdQ=;
 b=D0GjGq4JBVCZ+hqCHxVUwnJi4zkvd87BFEfgyl0z2kX2S6wwqD6aUFBtWXKCM+o4OzYGvB
 Qz/4WRaKvxG1rXgjgNaqLE1SWxIknCRwba1+I6AeVFOdUgu7yFRKi83Y7N++PA1/daZRCh
 vnJEzblt73K49P/E9I7PEiDhhWCbGuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-eRefG5xFNzOHDBETJn7a7g-1; Mon, 22 Jun 2020 16:09:11 -0400
X-MC-Unique: eRefG5xFNzOHDBETJn7a7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7486184D15A;
 Mon, 22 Jun 2020 20:08:32 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-166.rdu2.redhat.com
 [10.10.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F7035C1BD;
 Mon, 22 Jun 2020 20:08:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [RFC v5 09/10] drm/nouveau/kms/nv50-: Move hard-coded object handles
 into header
Date: Mon, 22 Jun 2020 16:07:29 -0400
Message-Id: <20200622200730.120716-10-lyude@redhat.com>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While most of the functionality on Nvidia GPUs doesn't require using an
explicit handle instead of the main VRAM handle + offset, there are a
couple of places that do require explicit handles, such as CRC
functionality. Since this means we're about to add another
nouveau-chosen handle, let's just go ahead and move any hard-coded
handles into a single header. This is just to keep things slightly
organized, and to make it a little bit easier if we need to add more
handles in the future.

This patch should contain no functional changes.

Changes since v3:
* Correct SPDX license identifier (checkpatch)

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c    |  7 +++++--
 drivers/gpu/drm/nouveau/dispnv50/handles.h | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c    |  3 ++-
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/handles.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 090882794f7d6..bf7ba1e1c0f74 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -26,6 +26,7 @@
 #include "core.h"
 #include "head.h"
 #include "wndw.h"
+#include "handles.h"
 
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
@@ -154,7 +155,8 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (!syncbuf)
 		return 0;
 
-	ret = nvif_object_init(&dmac->base.user, 0xf0000000, NV_DMA_IN_MEMORY,
+	ret = nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_SYNCBUF,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
@@ -165,7 +167,8 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_init(&dmac->base.user, 0xf0000001, NV_DMA_IN_MEMORY,
+	ret = nvif_object_init(&dmac->base.user, NV50_DISP_HANDLE_VRAM,
+			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/handles.h b/drivers/gpu/drm/nouveau/dispnv50/handles.h
new file mode 100644
index 0000000000000..d1beeb9a444db
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/handles.h
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: MIT
+#ifndef __NV50_KMS_HANDLES_H__
+#define __NV50_KMS_HANDLES_H__
+
+/*
+ * Various hard-coded object handles that nouveau uses. These are made-up by
+ * nouveau developers, not Nvidia. The only significance of the handles chosen
+ * is that they must all be unique.
+ */
+#define NV50_DISP_HANDLE_SYNCBUF                                        0xf0000000
+#define NV50_DISP_HANDLE_VRAM                                           0xf0000001
+
+#define NV50_DISP_HANDLE_WNDW_CTX(kind)                        (0xfb000000 | kind)
+
+#endif /* !__NV50_KMS_HANDLES_H__ */
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index cfee61f14aa49..9d963ecdd34e8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -21,6 +21,7 @@
  */
 #include "wndw.h"
 #include "wimm.h"
+#include "handles.h"
 
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
@@ -59,7 +60,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 	int ret;
 
 	nouveau_framebuffer_get_layout(fb, &unused, &kind);
-	handle = 0xfb000000 | kind;
+	handle = NV50_DISP_HANDLE_WNDW_CTX(kind);
 
 	list_for_each_entry(ctxdma, &wndw->ctxdma.list, head) {
 		if (ctxdma->object.handle == handle)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
