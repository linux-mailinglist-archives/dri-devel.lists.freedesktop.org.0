Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA25DB490EA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 16:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DFB10E53C;
	Mon,  8 Sep 2025 14:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i7MjPG4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8954110E538
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757340752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgO2S+dmEWRWP646lE3n7lNOg/USWSkUqgEwQKZIUMA=;
 b=i7MjPG4JTkKSOkyJ7wrK5rGe2U0pacgkxOE8HHIokkiHXKpxgWMQ/gQnAXlxs+zxWHAqHf
 pob7cOzfjY8UrH4MlDNZtfFZ52R+nFWHE/gl5Cio7k6GxtJ1NtGEJ/WKlQreJKzmfFQagO
 9e0gIDC5iOq4fXb/+rt9xGq4aV3kLwA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-3GK9ff3HPuylzYtd4TObYg-1; Mon, 08 Sep 2025 10:12:31 -0400
X-MC-Unique: 3GK9ff3HPuylzYtd4TObYg-1
X-Mimecast-MFC-AGG-ID: 3GK9ff3HPuylzYtd4TObYg_1757340750
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-329e3db861eso4143126a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 07:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757340750; x=1757945550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgO2S+dmEWRWP646lE3n7lNOg/USWSkUqgEwQKZIUMA=;
 b=B3ddSZu7xV/GnSTYsegwXAbvO/fFBVctJpkQyMtDHoxA0hyaVlGDufiJE45tm2t48y
 XlX8NGJYIeAOCul36aIkEHp3W7ptGkLn1nSd4hy8b20HgAZ5GC/9tsqFvtcLdn6F3yl2
 dfybL/cKi2wlMhK2K3A1aYSLbcA29AQG+ZVwtHEvtQOgEuE9rkxR4YAoIQjbyVtlbrQL
 mvq9lRNeYVfdRfWxOq+DRQlbxf5C1hzJADTRE7mmL8cxao02prL2YsPgfa7ntZ85guCr
 w2SLDWqqh552G/72M79vOQE3VNm2hg8fZQI1vB/KLe9+WTMgBmQ5HFrZEOAtvZibKBXb
 0FfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGFkYLKFeiahY/9u6GA7ktTjms+T1JVmyGMED0diCOgC1E9deSoO9zsowmbN5kNrjDa9Bt0D3iMls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQtJxmGdx3kMpSTw/DfocCpL5XXDmluB8msUXTt8RaFx8wBLh6
 zmC38IBJ141M3BRzjNu/lQh6HSkdB5kvKJpY0PKtGpfSDV3jTQSbnFwW6FpeztnmNrZpbBApKyo
 bK/IdbZGlimEfLHSaWPUIto+3a+yhoQY/ksgqzpt6orAIqoMEXbjK86ncWjMma93+g1xFiw==
X-Gm-Gg: ASbGnct4v+JN7eNseTqC0t8o7YDf1kgXB+lyxq9m4mqzMbWJVKSpbyB/71cqS5v1Bot
 009t/se8xTVdB9QXLYwGwGjRn1CjuO/v+KBDdBNjwmuOjRDTquJsCawW62wA9oJwUzg9zwePq1w
 HURgmIUlIt+ryvGZFTzCkwMQz9M3OD2OFYeKlefyTmTEZ6STdFW+wdHWOadthLWg5P03fQuNc9T
 54rpEvW/P4KCn8rDhNGJFConvdfbUtINGJHKw24PXoiYCnrEg2NcO1X1ecMUSP2X4Fw7YoOohu3
 9q5Rny0z1/xA3mjSziJTtpB0AOnTMGHqhnY=
X-Received: by 2002:a17:90b:3852:b0:32b:55b1:445 with SMTP id
 98e67ed59e1d1-32d43f5a5bbmr12171475a91.21.1757340750028; 
 Mon, 08 Sep 2025 07:12:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1RN07Q/Groy3ce2bkRYfYtXEA9rVHjb/aUmYiI3bQ8kQWmXsh4jbs+BJMTypC4h2EiBkEmw==
X-Received: by 2002:a17:90b:3852:b0:32b:55b1:445 with SMTP id
 98e67ed59e1d1-32d43f5a5bbmr12171433a91.21.1757340749565; 
 Mon, 08 Sep 2025 07:12:29 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32d89f32ebfsm2937596a91.0.2025.09.08.07.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 07:12:28 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, ian.forbes@broadcom.com, jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH drm-misc-next v2 1/1] drm/vmwgfx: add drm_panic support for
 stdu
Date: Mon,  8 Sep 2025 23:11:34 +0900
Message-ID: <20250908141152.221291-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908141152.221291-1-ryasuoka@redhat.com>
References: <20250908141152.221291-1-ryasuoka@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OJA1kLeKlPPHx3y1ShZ1pW1c7JNFGPyDgEz_M-oonLc_1757340750
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Add drm_panic module for vmwgfx stdu so that panic screen can be
displayed on panic.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  | 18 +++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  |  9 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 43 ++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 34 +++++++++++++
 6 files changed, 178 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
index 8fe02131a6c4..fe6275a6cc31 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
@@ -156,6 +156,16 @@ struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
 	return fifo;
 }
 
+/* For drm_panic */
+void vmw_panic_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason)
+{
+	u32 *fifo_mem = dev_priv->fifo_mem;
+
+	if (fifo_mem && cmpxchg(fifo_mem + SVGA_FIFO_BUSY, 0, 1) == 0)
+		vmw_panic_write(dev_priv, SVGA_REG_SYNC, reason);
+
+}
+
 void vmw_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason)
 {
 	u32 *fifo_mem = dev_priv->fifo_mem;
@@ -264,6 +274,46 @@ static int vmw_fifo_wait(struct vmw_private *dev_priv,
 	return ret;
 }
 
+/* For drm_panic */
+void *vmw_panic_fifo_reserve(struct vmw_private *dev_priv, uint32_t bytes)
+{
+	struct vmw_fifo_state *fifo_state = dev_priv->fifo;
+	u32  *fifo_mem = dev_priv->fifo_mem;
+	uint32_t reserveable = fifo_state->capabilities & SVGA_FIFO_CAP_RESERVE;
+
+	/*
+	 * Access to fifo registers without mutex lock because it is only called is
+	 * panic handler
+	 */
+	uint32_t max = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MAX);
+	uint32_t min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
+	uint32_t stop = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_STOP);
+	uint32_t next_cmd = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_NEXT_CMD);
+
+	if (unlikely(bytes >= (max - min)))
+		return NULL;
+
+	bool has_space;
+
+	if (next_cmd >= stop) {
+		has_space = (next_cmd + bytes < max ||
+			     (next_cmd + bytes == max && stop > min));
+	} else {
+		has_space = (next_cmd + bytes < stop);
+	}
+
+	if (unlikely(!has_space || (!reserveable && bytes > sizeof(uint32_t))))
+		return NULL;
+
+	fifo_state->reserved_size = bytes;
+	fifo_state->using_bounce_buffer = false;
+
+	if (reserveable)
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_RESERVED, bytes);
+
+	return (void __force *) (fifo_mem + (next_cmd >> 2));
+}
+
 /*
  * Reserve @bytes number of bytes in the fifo.
  *
@@ -424,6 +474,29 @@ static void vmw_fifo_slow_copy(struct vmw_fifo_state *fifo_state,
 	}
 }
 
+/* For drm_panic */
+void vmw_panic_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes)
+{
+	struct vmw_fifo_state *fifo_state = dev_priv->fifo;
+	uint32_t next_cmd = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_NEXT_CMD);
+	uint32_t max = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MAX);
+	uint32_t min = vmw_fifo_mem_read(dev_priv, SVGA_FIFO_MIN);
+	bool reserveable = fifo_state->capabilities & SVGA_FIFO_CAP_RESERVE;
+
+	fifo_state->reserved_size = 0;
+
+	if (reserveable) {
+		next_cmd += bytes;
+		if (next_cmd >= max)
+			next_cmd -= max - min;
+		mb();
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_NEXT_CMD, next_cmd);
+		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_RESERVED, 0);
+	}
+	mb();
+	vmw_panic_fifo_ping_host(dev_priv, SVGA_SYNC_GENERIC);
+}
+
 static void vmw_local_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes)
 {
 	struct vmw_fifo_state *fifo_state = dev_priv->fifo;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index eda5b6f8f4c4..a1dc6d63c079 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -635,6 +635,17 @@ static inline bool vmw_is_svga_v3(const struct vmw_private *dev)
 	return dev->pci_id == VMWGFX_PCI_ID_SVGA3;
 }
 
+/*
+ * For drm_panic
+ * Lockless vmw_write() because drm_panic calls this in panic handler
+ */
+static inline void vmw_panic_write(struct vmw_private *dev_priv,
+				   unsigned int offset, uint32_t value)
+{
+	outl(offset, dev_priv->io_start + SVGA_INDEX_PORT);
+	outl(value, dev_priv->io_start + SVGA_VALUE_PORT);
+}
+
 /*
  * The locking here is fine-grained, so that it is performed once
  * for every read- and write operation. This is of course costly, but we
@@ -854,16 +865,19 @@ extern void vmw_fifo_destroy(struct vmw_private *dev_priv);
 extern bool vmw_cmd_supported(struct vmw_private *vmw);
 extern void *
 vmw_cmd_ctx_reserve(struct vmw_private *dev_priv, uint32_t bytes, int ctx_id);
+extern void vmw_panic_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes);
 extern void vmw_cmd_commit(struct vmw_private *dev_priv, uint32_t bytes);
 extern void vmw_cmd_commit_flush(struct vmw_private *dev_priv, uint32_t bytes);
 extern int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno);
 extern bool vmw_supports_3d(struct vmw_private *dev_priv);
+extern void vmw_panic_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason);
 extern void vmw_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason);
 extern bool vmw_fifo_have_pitchlock(struct vmw_private *dev_priv);
 extern int vmw_cmd_emit_dummy_query(struct vmw_private *dev_priv,
 				    uint32_t cid);
 extern int vmw_cmd_flush(struct vmw_private *dev_priv,
 			 bool interruptible);
+extern void *vmw_panic_fifo_reserve(struct vmw_private *dev_priv, uint32_t bytes);
 
 #define VMW_CMD_CTX_RESERVE(__priv, __bytes, __ctx_id)                        \
 ({                                                                            \
@@ -1027,6 +1041,8 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 			  struct ttm_object_file *tfile,
 			  struct ttm_buffer_object *bo,
 			  SVGA3dCmdHeader *header);
+void vmw_kms_panic_write_svga(struct vmw_private *vmw_priv,
+			      unsigned int width, unsigned int height, unsigned int pitch);
 int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 		       unsigned width, unsigned height, unsigned pitch,
 		       unsigned bpp, unsigned depth);
@@ -1349,6 +1365,8 @@ int vmw_mksstat_remove_ioctl(struct drm_device *dev, void *data,
 		      struct drm_file *file_priv);
 int vmw_mksstat_remove_all(struct vmw_private *dev_priv);
 
+void vmw_ldu_primary_plane_panic_flush(struct drm_plane *plane);
+
 /* VMW logging */
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 54ea1b513950..89d04d6be83e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1203,6 +1203,15 @@ int vmw_kms_close(struct vmw_private *dev_priv)
 	return ret;
 }
 
+/* For drm_panic */
+void vmw_kms_panic_write_svga(struct vmw_private *vmw_priv,
+			      unsigned int width, unsigned int height, unsigned int pitch)
+{
+	vmw_panic_write(vmw_priv, SVGA_REG_PITCHLOCK, pitch);
+	vmw_panic_write(vmw_priv, SVGA_REG_WIDTH, width);
+	vmw_panic_write(vmw_priv, SVGA_REG_HEIGHT, height);
+}
+
 int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 			unsigned width, unsigned height, unsigned pitch,
 			unsigned bpp, unsigned depth)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 445471fe9be6..e6299390ffea 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -499,6 +499,7 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
 			  struct drm_crtc *crtc);
 
 int vmw_du_helper_plane_update(struct vmw_du_update_plane *update);
+int vmw_du_panic_helper_plane_update(struct vmw_du_update_plane *update);
 
 /**
  * vmw_du_translate_to_crtc - Translate a rect from framebuffer to crtc
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index c23c9195f0dc..b7c3dfbab541 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -304,6 +304,49 @@ static int vmw_kms_ldu_do_bo_dirty(struct vmw_private *dev_priv,
 				   struct drm_mode_rect *clips,
 				   unsigned int num_clips);
 
+/* For drm_panic */
+static int vmw_kms_ldu_panic_do_bo_dirty(struct vmw_private *dev_priv,
+					 struct drm_framebuffer *fb)
+{
+	size_t fifo_size;
+	struct {
+		uint32_t header;
+		SVGAFifoCmdUpdate body;
+	} *cmd;
+
+	fifo_size = sizeof(*cmd);
+	cmd = vmw_panic_fifo_reserve(dev_priv, fifo_size);
+	if (IS_ERR_OR_NULL(cmd))
+		return -ENOMEM;
+
+	memset(cmd, 0, fifo_size);
+
+	cmd[0].header = SVGA_CMD_UPDATE;
+	cmd[0].body.x = 0;
+	cmd[0].body.y = 0;
+	cmd[0].body.width = fb->width;
+	cmd[0].body.height = fb->height;
+
+	vmw_panic_fifo_commit(dev_priv, fifo_size);
+	return 0;
+}
+
+/* For drm_panic */
+void vmw_ldu_primary_plane_panic_flush(struct drm_plane *plane)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_crtc *crtc = state->crtc;
+	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+	struct drm_framebuffer *fb = state->fb;
+	int ret;
+
+	vmw_kms_panic_write_svga(dev_priv, fb->width, fb->height, fb->pitches[0]);
+
+	ret = vmw_kms_ldu_panic_do_bo_dirty(dev_priv, fb);
+	if (ret)
+		pr_warn("Failed to vmw_kms_ldu_panic_do_bo_dirty\n");
+}
+
 /*
  * Legacy Display Plane Functions
  */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 20aab725e53a..faa7135bd699 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -36,6 +36,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_vblank.h>
 
 #define vmw_crtc_to_stdu(x) \
@@ -1458,6 +1459,37 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
 		vmw_fence_obj_unreference(&fence);
 }
 
+static int
+vmw_stdu_primary_plane_get_scanout_buffer(struct drm_plane *plane,
+					  struct drm_scanout_buffer *sb)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_crtc *crtc = state->crtc;
+	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+
+	if (!plane->state || !plane->state->fb || !plane->state->visible)
+		return -ENODEV;
+
+	sb->format = plane->state->fb->format;
+	sb->width = plane->state->fb->width;
+	sb->height = plane->state->fb->height;
+	sb->pitch[0] = plane->state->fb->pitches[0];
+
+	u64 size = sb->height * sb->pitch[0];
+
+	sb->map[0].vaddr = memremap(dev_priv->vram_start, size, MEMREMAP_WT);
+
+	if (!sb->map[0].vaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void vmw_stdu_primary_plane_panic_flush(struct drm_plane *plane)
+{
+	vmw_ldu_primary_plane_panic_flush(plane);
+}
+
 static void
 vmw_stdu_crtc_atomic_flush(struct drm_crtc *crtc,
 			   struct drm_atomic_state *state)
@@ -1506,6 +1538,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
 	.atomic_update = vmw_stdu_primary_plane_atomic_update,
 	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
 	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
+	.get_scanout_buffer = vmw_stdu_primary_plane_get_scanout_buffer,
+	.panic_flush = vmw_stdu_primary_plane_panic_flush,
 };
 
 static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
-- 
2.51.0

