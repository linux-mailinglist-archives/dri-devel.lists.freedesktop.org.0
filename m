Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C82B87CFC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 05:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474A110E92B;
	Fri, 19 Sep 2025 03:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iOb/CEqg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50C710E929
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 03:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758252612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAkNmTJp2NJK26jQeXTwypnAgJsAqQn3/zrN49Z+2ac=;
 b=iOb/CEqgmAnGBkgm0xRnmfHo988h3L9DUkZkrUOViqtqUcHZgVe9CTNsHt/e1JlABQlNt9
 ZW6hQQ/7Avr3S/NRhxh51qOopk/7JMqmvVqN/yQ/NqLVkaFL3wk2UJr76Q4T+5gsPEp8ip
 E7em3w40aUL2RvCyAbx/Odp0BOANBoE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-Z7IHRVMNMP-EbJK946AbzQ-1; Thu, 18 Sep 2025 23:30:11 -0400
X-MC-Unique: Z7IHRVMNMP-EbJK946AbzQ-1
X-Mimecast-MFC-AGG-ID: Z7IHRVMNMP-EbJK946AbzQ_1758252610
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32eae48beaaso1726268a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 20:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758252610; x=1758857410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAkNmTJp2NJK26jQeXTwypnAgJsAqQn3/zrN49Z+2ac=;
 b=bMpkkQU3vOIS9u3ZlYsymlL19JSyXz6UIxDeVleadhNGR2+nJHDnpqHSflbGnHu8bG
 OXFpUyFhcchn5EToHd0txO3q/Ys/QmoNGI2kcFJRMOQ1oCSbqkuHDGOLsLIVTN3i1TOG
 HNLQlpFzZXi2acM2NsK0OrGIu5Z5UUbY8Dw6hqFxawWBP18PhInsSSSN+tDH44f+ZJNc
 TKnyou6xAuusahsItLl6LojOW24DalGDUbb/allPa5uKdQGxko+kTxCDQwIb9rEvaWNC
 D+4hi6ng5IqPa5frf+1xBeaUGL57hjAub+RymVrHBfOy0xXec0sLtt4fer4GrXiZtNS5
 p+Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjGmLdzjbiKi70VJIVmiPRmeeNHfuiStnLzPv16KShvRdVF3qvTqXjVLXvSYGHalKbmpyJ6dZzh/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEh3IwUylfkCn4XwciWTATbin2mD9sZEMRyU85W0Jefv/w1ABr
 zPBvNWyiq5/uvuG2fwtoY0XMNZrCN+wWJ7hvo75bsB2AHS1bzY3s4HVUC0grkPpVGBMeRbbIlih
 sNldwWOPUJv00PIo/XKejVzNFpr54tL5p30RkGzz0CgsXfly/tnWMyvB8x4EHxdtBligXyA==
X-Gm-Gg: ASbGnctMCSnPQ6l5LjcpDLYcLUAodesxj3UPjqn2Kc0X2tTUNicctoLwnS91kgOlul7
 S6i4y7dduSd7KjtwauZSzC4hePql8sCwFKh2YSX+IG2nEFo+MueQ8GKiVJuidzx3J8Xduz1brry
 2C0fF7+3Kfq7dRFEjGKh1ixQWYyxy0MGzXbXGTXQD83A5sfd5bBMHGVNUdKs2MwXaMa87PxLGXy
 EMiCE0r3q8vhpsIxGMn77KggRHofikcKEj4SA3mqffHP3K2YBLJ0kndE2urdRobE2icZ3i8+fF2
 OmoqXiJyzOLn61S0thSxiIeBAghQXNyUp14=
X-Received: by 2002:a17:90b:3b4b:b0:32e:ef4:bc7c with SMTP id
 98e67ed59e1d1-330983417ecmr2096607a91.24.1758252609815; 
 Thu, 18 Sep 2025 20:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiVbgp4sODJuf0YuLex9BXXsbUMxP4K49M04/Qd6n+eGRXU9bB1DG5bwU8gKiMf06LNd13Og==
X-Received: by 2002:a17:90b:3b4b:b0:32e:ef4:bc7c with SMTP id
 98e67ed59e1d1-330983417ecmr2096571a91.24.1758252609335; 
 Thu, 18 Sep 2025 20:30:09 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-330606509e9sm4054289a91.9.2025.09.18.20.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 20:30:08 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com, ian.forbes@broadcom.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH drm-misc-next v3 1/1] drm/vmwgfx: add drm_panic support for
 stdu mode
Date: Fri, 19 Sep 2025 12:29:30 +0900
Message-ID: <20250919032936.2267240-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919032936.2267240-1-ryasuoka@redhat.com>
References: <20250919032936.2267240-1-ryasuoka@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GfCIpuzoaVjuH1qf4OKw_AodrPhEW1gyGdOJOjy2nEo_1758252610
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

Add drm_panic module for vmwgfx stdu mode so that panic screen can be
displayed on panic. Since implemented by writing to VRAM and switching
back to legacy mode, it would expect to work in all DU modes.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |   4 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 165 +++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   2 +
 3 files changed, 171 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index eda5b6f8f4c4..1259112ee2c2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -16,6 +16,7 @@
 #include <drm/drm_auth.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_rect.h>
 
 #include <drm/ttm/ttm_execbuf_util.h>
@@ -1046,6 +1047,9 @@ void vmw_kms_lost_device(struct drm_device *dev);
 extern int vmw_resource_pin(struct vmw_resource *res, bool interruptible);
 extern void vmw_resource_unpin(struct vmw_resource *res);
 extern enum vmw_res_type vmw_res_type(const struct vmw_resource *res);
+int vmw_primary_plane_get_scanout_buffer(struct drm_plane *plane,
+					 struct drm_scanout_buffer *sb);
+void vmw_primary_plane_panic_flush(struct drm_plane *plane);
 
 /**
  * Overlay control - vmwgfx_overlay.c
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 54ea1b513950..c79e39c1845e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2022,3 +2022,168 @@ bool vmw_user_object_is_null(struct vmw_user_object *uo)
 {
 	return !uo->buffer && !uo->surface;
 }
+
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
+/* For drm_panic */
+static void
+vmw_kms_panic_write_svga(struct vmw_private *vmw_priv, unsigned int width,
+			 unsigned int height, unsigned int pitch)
+{
+	vmw_panic_write(vmw_priv, SVGA_REG_PITCHLOCK, pitch);
+	vmw_panic_write(vmw_priv, SVGA_REG_WIDTH, width);
+	vmw_panic_write(vmw_priv, SVGA_REG_HEIGHT, height);
+}
+
+/* For drm_panic */
+static void *vmw_panic_fifo_reserve(struct vmw_private *dev_priv, uint32_t bytes)
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
+/* For drm_panic */
+static void
+vmw_panic_fifo_ping_host(struct vmw_private *dev_priv, uint32_t reason)
+{
+	u32 *fifo_mem = dev_priv->fifo_mem;
+
+	if (fifo_mem && cmpxchg(fifo_mem + SVGA_FIFO_BUSY, 0, 1) == 0)
+		vmw_panic_write(dev_priv, SVGA_REG_SYNC, reason);
+
+}
+
+/* For drm_panic */
+static void vmw_panic_fifo_commit(struct vmw_private *dev_priv, uint32_t bytes)
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
+/* For drm_panic */
+static int vmw_kms_panic_do_bo_dirty(struct vmw_private *dev_priv)
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
+	cmd[0].body.width = dev_priv->initial_width;
+	cmd[0].body.height = dev_priv->initial_height;
+
+	vmw_panic_fifo_commit(dev_priv, fifo_size);
+	return 0;
+}
+
+int vmw_primary_plane_get_scanout_buffer(struct drm_plane *plane,
+					 struct drm_scanout_buffer *sb)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_crtc *crtc = state->crtc;
+	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+
+	if (!plane->state || !plane->state->fb || !plane->state->visible || du->unit != 0)
+		return -ENODEV;
+
+	sb->format = state->fb->format;
+	sb->width = dev_priv->initial_width;
+	sb->height = dev_priv->initial_height;
+	sb->pitch[0] = dev_priv->initial_width * state->fb->format->cpp[0];
+
+	u64 size = sb->height * sb->pitch[0];
+
+	sb->map[0].vaddr = memremap(dev_priv->vram_start, size, MEMREMAP_WB | MEMREMAP_DEC);
+
+	if (!sb->map[0].vaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/* For drm_panic */
+void vmw_primary_plane_panic_flush(struct drm_plane *plane)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_crtc *crtc = state->crtc;
+	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
+	struct drm_framebuffer *fb = state->fb;
+	unsigned int pitch = dev_priv->initial_width * fb->format->cpp[0];
+	int ret;
+
+	vmw_kms_panic_write_svga(dev_priv, dev_priv->initial_width,
+				 dev_priv->initial_height, pitch);
+
+	ret = vmw_kms_panic_do_bo_dirty(dev_priv);
+	if (ret)
+		pr_warn("Failed to vmw_kms_ldu_panic_do_bo_dirty\n");
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 20aab725e53a..93c02308d44b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1506,6 +1506,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
 	.atomic_update = vmw_stdu_primary_plane_atomic_update,
 	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
 	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
+	.get_scanout_buffer = vmw_primary_plane_get_scanout_buffer,
+	.panic_flush = vmw_primary_plane_panic_flush,
 };
 
 static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
-- 
2.51.0

