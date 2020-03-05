Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07517B7F1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE99D6EC7E;
	Fri,  6 Mar 2020 08:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EC66EBCB;
 Thu,  5 Mar 2020 13:25:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g83so5731945wme.1;
 Thu, 05 Mar 2020 05:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gzph3wV2q67mGjKj0zDqaIZolRUvv6IUrHrSZD4Fr9M=;
 b=kZHG++MkaV4tXDa5k+oChnS1Jsoddl2BbxG0vHA6u3TT9PrsUd7HorM4EMvjuaZMzo
 KaPl4bsPZjOkoZeMprY9GB5hg8GLOIxoCBQhoNW+fKqdtqbYwlDYrshfTbaC1RfWVaDY
 Pea55fRv8yb9QafJv29zAuMd7Yp0CSUwAWZOclIVftpnzQXmPDNzk3Ch9GjzYtXkDDKd
 9h3XXT3BcCJmXogwrTgxG7Fy/cCmpZ9m0bQ3k5Cj7Cn42MdrTF67VDbsrCH7JhgR/k75
 0WAmOPpq7tx8pHoMg77///oBazQ5UH8VxGrfdCf5YScbJy06pflWdkkNqLW2zKdv25cz
 gayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gzph3wV2q67mGjKj0zDqaIZolRUvv6IUrHrSZD4Fr9M=;
 b=ObwrdUgwkBxD7YudjKQQP02et4md8IJfXUvJt+85Ud9n+yryOA91biw+9GrTE//hRz
 FITdkOitGr1qzNn2WvT/TARIKHPiNtcTozxMkHmndc3Wvq+XC91i+O0vpbldso0hL1Hd
 GlxpA3opOtOSkpWrO2PmHyBOI7ycg8nvF+z9+dlez/GDKgtSvy1B9M5RD9U6L7Ud3d+z
 ay6OYJqCdtKSP3f3hwUZ25fZGRIrp7n/r2p6qorPKvdV7RfYJiFAGOupEQy3NnK8ygfY
 jteE07y1YzDUjjfhlwYiTa2MORKHiAWhoWEJpZcQHDT6mIGfvj33LUA9YEmC8OLlvzU4
 P4Ow==
X-Gm-Message-State: ANhLgQ087uQvcNgoidZmJYo2jJ1q/wexUBiY1TKcDrlBddzPe0tzE/yQ
 8NZeYUy3Fs/CwqcgvwVyhVVUwXwhI5hIUA==
X-Google-Smtp-Source: ADFU+vvtZZ5sTfCaewm4r7vbgHSNywwcuZfQgwEKkuYX6jQRVQE34JJ+UCseir0TpufKkmXBFUV8jA==
X-Received: by 2002:a05:600c:286:: with SMTP id
 6mr5046004wmk.101.1583414754112; 
 Thu, 05 Mar 2020 05:25:54 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2EA5001F22CF19908511A1.dip0.t-ipconnect.de.
 [2003:c5:8f2e:a500:1f22:cf19:9085:11a1])
 by smtp.gmail.com with ESMTPSA id g14sm45424819wrv.58.2020.03.05.05.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:25:53 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/nouveau: don't use ttm bo->offset v3
Date: Thu,  5 Mar 2020 14:29:06 +0100
Message-Id: <20200305132910.17515-5-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200305132910.17515-1-nirmoy.das@amd.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store ttm bo->offset in struct nouveau_bo instead.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c     |  6 +++---
 drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c  |  6 +++---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c     |  8 ++++----
 drivers/gpu/drm/nouveau/nouveau_bo.c        |  8 ++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.h        |  3 +++
 drivers/gpu/drm/nouveau/nouveau_chan.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 10 +++++-----
 15 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 1f08de4241e0..d06a93f2b38a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -845,7 +845,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 		fb = nouveau_framebuffer(crtc->primary->fb);
 	}
 
-	nv_crtc->fb.offset = fb->nvbo->bo.offset;
+	nv_crtc->fb.offset = fb->nvbo->offset;
 
 	if (nv_crtc->lut.depth != drm_fb->format->depth) {
 		nv_crtc->lut.depth = drm_fb->format->depth;
@@ -1013,7 +1013,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		nv04_cursor_upload(dev, cursor, nv_crtc->cursor.nvbo);
 
 	nouveau_bo_unmap(cursor);
-	nv_crtc->cursor.offset = nv_crtc->cursor.nvbo->bo.offset;
+	nv_crtc->cursor.offset = nv_crtc->cursor.nvbo->offset;
 	nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset);
 	nv_crtc->cursor.show(nv_crtc, true);
 out:
@@ -1191,7 +1191,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	/* Initialize a page flip struct */
 	*s = (struct nv04_page_flip_state)
 		{ { }, event, crtc, fb->format->cpp[0] * 8, fb->pitches[0],
-		  new_bo->bo.offset };
+		  new_bo->offset };
 
 	/* Keep vblanks on during flip, for the target crtc of this flip */
 	drm_crtc_vblank_get(crtc);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 44ee82d0c9b6..89a4ddfcc55f 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -151,7 +151,7 @@ nv04_display_init(struct drm_device *dev, bool resume, bool runtime)
 			continue;
 
 		if (nv_crtc->cursor.set_offset)
-			nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.nvbo->bo.offset);
+			nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.nvbo->offset);
 		nv_crtc->cursor.set_pos(nv_crtc, nv_crtc->cursor_saved_x,
 						 nv_crtc->cursor_saved_y);
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index a3a0a73ae8ab..9529bd9053e7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -150,7 +150,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
 
 	nvif_wr32(dev, NV_PVIDEO_BASE(flip), 0);
-	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->bo.offset);
+	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->offset);
 	nvif_wr32(dev, NV_PVIDEO_SIZE_IN(flip), src_h << 16 | src_w);
 	nvif_wr32(dev, NV_PVIDEO_POINT_IN(flip), src_y << 16 | src_x);
 	nvif_wr32(dev, NV_PVIDEO_DS_DX(flip), (src_w << 20) / crtc_w);
@@ -172,7 +172,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	if (format & NV_PVIDEO_FORMAT_PLANAR) {
 		nvif_wr32(dev, NV_PVIDEO_UVPLANE_BASE(flip), 0);
 		nvif_wr32(dev, NV_PVIDEO_UVPLANE_OFFSET_BUFF(flip),
-			nv_fb->nvbo->bo.offset + fb->offsets[1]);
+			nv_fb->nvbo->offset + fb->offsets[1]);
 	}
 	nvif_wr32(dev, NV_PVIDEO_FORMAT(flip), format | fb->pitches[0]);
 	nvif_wr32(dev, NV_PVIDEO_STOP, 0);
@@ -396,7 +396,7 @@ nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 
 	for (i = 0; i < 2; i++) {
 		nvif_wr32(dev, NV_PVIDEO_BUFF0_START_ADDRESS + 4 * i,
-			  nv_fb->nvbo->bo.offset);
+			  nv_fb->nvbo->offset);
 		nvif_wr32(dev, NV_PVIDEO_BUFF0_PITCH_LENGTH + 4 * i,
 			  fb->pitches[0]);
 		nvif_wr32(dev, NV_PVIDEO_BUFF0_OFFSET + 4 * i, 0);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 00a85f1e1a4a..67829f04b2c7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -274,7 +274,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 
 	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
 			       &oclass, head, &args, sizeof(args),
-			       disp->sync->bo.offset, &wndw->wndw);
+			       disp->sync->offset, &wndw->wndw);
 	if (ret) {
 		NV_ERROR(drm, "base%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index e7fcfa6e6467..793dcb2ea196 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -99,7 +99,7 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
 
 	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
 			       &oclass, 0, &args, sizeof(args),
-			       disp->sync->bo.offset, &core->chan);
+			       disp->sync->offset, &core->chan);
 	if (ret) {
 		NV_ERROR(drm, "core%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index 8ccd96113bad..4cce1078140a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -186,7 +186,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 
 	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
 			       &oclass, 0, &args, sizeof(args),
-			       disp->sync->bo.offset, &wndw->wndw);
+			       disp->sync->offset, &wndw->wndw);
 	if (ret) {
 		NV_ERROR(drm, "ovly%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 890315291b01..e90ffa4a5230 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -509,7 +509,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	}
 
 	asyw->state.fence = dma_resv_get_excl_rcu(fb->nvbo->bo.base.resv);
-	asyw->image.offset[0] = fb->nvbo->bo.offset;
+	asyw->image.offset[0] = fb->nvbo->offset;
 
 	if (wndw->func->prepare) {
 		asyh = nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index b92dc3461bbd..bb84e4d54a33 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -298,7 +298,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 
 	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
 			       &oclass, 0, &args, sizeof(args),
-			       disp->sync->bo.offset, &wndw->wndw);
+			       disp->sync->offset, &wndw->wndw);
 	if (ret) {
 		NV_ERROR(drm, "qndw%04x allocation failed: %d\n", oclass, ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index e2bae1424502..c32a8ca67f82 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -558,13 +558,13 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	if (drm->agp.bridge) {
 		args.target = NV_DMA_V0_TARGET_AGP;
 		args.access = NV_DMA_V0_ACCESS_RDWR;
-		args.start += drm->agp.base + chan->ntfy->bo.offset;
-		args.limit += drm->agp.base + chan->ntfy->bo.offset;
+		args.start += drm->agp.base + chan->ntfy->offset;
+		args.limit += drm->agp.base + chan->ntfy->offset;
 	} else {
 		args.target = NV_DMA_V0_TARGET_VM;
 		args.access = NV_DMA_V0_ACCESS_RDWR;
-		args.start += chan->ntfy->bo.offset;
-		args.limit += chan->ntfy->bo.offset;
+		args.start += chan->ntfy->offset;
+		args.limit += chan->ntfy->offset;
 	}
 
 	client->route = NVDRM_OBJECT_ABI16;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 2b4b21b02e40..b7a9b9e85355 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1317,6 +1317,14 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
 			nouveau_vma_unmap(vma);
 		}
 	}
+
+	if(new_reg) {
+		if (new_reg->mm_node)
+			nvbo->offset = (new_reg->start << PAGE_SHIFT);
+		else
+			nvbo->offset = 0;
+	}
+
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 38f9d8350963..e944b4aa5547 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -24,6 +24,9 @@ struct nouveau_bo {
 	int pbbo_index;
 	bool validate_mapped;
 
+	/* GPU address space is independent of CPU word size */
+	uint64_t offset;
+
 	struct list_head vma_list;
 
 	unsigned contig:1;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index d9381a053169..3d71dfcb2fde 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -162,7 +162,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 	 * pushbuf lives in, this is because the GEM code requires that
 	 * we be able to call out to other (indirect) push buffers
 	 */
-	chan->push.addr = chan->push.buffer->bo.offset;
+	chan->push.addr = chan->push.buffer->offset;
 
 	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		ret = nouveau_vma_new(chan->push.buffer, chan->vmm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 0ad5d87b5a8e..475ed53b99f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -89,7 +89,7 @@ static unsigned long nouveau_dmem_page_addr(struct page *page)
 	struct nouveau_dmem_chunk *chunk = page->zone_device_data;
 	unsigned long idx = page_to_pfn(page) - chunk->pfn_first;
 
-	return (idx << PAGE_SHIFT) + chunk->bo->bo.offset;
+	return (idx << PAGE_SHIFT) + chunk->bo->offset;
 }
 
 static void nouveau_dmem_page_free(struct page *page)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 0c5cdda3c336..508b118c0953 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
 
 	/* To allow resizeing without swapping buffers */
 	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
-		fb->base.width, fb->base.height, fb->nvbo->bo.offset, nvbo);
+		fb->base.width, fb->base.height, fb->nvbo->offset, nvbo);
 
 	vga_switcheroo_client_fb_set(dev->pdev, info);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f5ece1f94973..cadff37eade8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -232,7 +232,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 		rep->domain = NOUVEAU_GEM_DOMAIN_GART;
 	else
 		rep->domain = NOUVEAU_GEM_DOMAIN_VRAM;
-	rep->offset = nvbo->bo.offset;
+	rep->offset = nvbo->offset;
 	if (vmm->vmm.object.oclass >= NVIF_CLASS_VMM_NV50) {
 		vma = nouveau_vma_find(nvbo, vmm);
 		if (!vma)
@@ -516,7 +516,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 		}
 
 		if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
-			if (nvbo->bo.offset == b->presumed.offset &&
+			if (nvbo->offset == b->presumed.offset &&
 			    ((nvbo->bo.mem.mem_type == TTM_PL_VRAM &&
 			      b->presumed.domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
 			     (nvbo->bo.mem.mem_type == TTM_PL_TT &&
@@ -527,7 +527,7 @@ validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
 				b->presumed.domain = NOUVEAU_GEM_DOMAIN_GART;
 			else
 				b->presumed.domain = NOUVEAU_GEM_DOMAIN_VRAM;
-			b->presumed.offset = nvbo->bo.offset;
+			b->presumed.offset = nvbo->offset;
 			b->presumed.valid = 0;
 			relocs++;
 		}
@@ -805,7 +805,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 			struct nouveau_bo *nvbo = (void *)(unsigned long)
 				bo[push[i].bo_index].user_priv;
 
-			OUT_RING(chan, (nvbo->bo.offset + push[i].offset) | 2);
+			OUT_RING(chan, (nvbo->offset + push[i].offset) | 2);
 			OUT_RING(chan, 0);
 		}
 	} else {
@@ -840,7 +840,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 			}
 
 			OUT_RING(chan, 0x20000000 |
-				      (nvbo->bo.offset + push[i].offset));
+				      (nvbo->offset + push[i].offset));
 			OUT_RING(chan, 0);
 			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
 				OUT_RING(chan, 0);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
