Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD4CAFE04
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16F010E524;
	Tue,  9 Dec 2025 12:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="PlPw4UsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E394610E524
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3fstBY2xlbnoLhMrfa6us6h8Kki6LEWWQw4FdyGxjdE=; b=PlPw4UsQww2iAd98zcysXBofZ1
 U56oVuN4SP43er0cnVixF3F7SUlCo3fUOp/DzimclpVe3NkUiMrkzZhknDgaLKe6cDvSqTE348TgC
 qKqR23mdFKb4TnyOmBH81LBphmid+JjrKmYmbTVG09UZAs5vwiJuxgx2lXlxeAiIVkbk2JLbRTYXv
 J97EeXKwTMNs3Xr59Hgl0njMaQbxk9K3Ld5LqnDRoQEOQyGRt7ZuDaHBe8R9XJY3EcJMe1uY8SGTe
 HgvkOIBePrrd3p2fARQkJkj0Ev+2BACLZRWARWq9mHpTu6g3VuSB8wk/svEGoD/sd5IybNapo9Nx1
 YdNrC2nA==;
Date: Tue, 09 Dec 2025 13:13:29 +0100 (CET)
Message-Id: <20251209.131329.130523044849026405.rene@exactco.de>
To: tzimmermann@suse.de
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <12407aa9-a084-46a1-98cb-9649e7f24098@suse.de>
References: <9191ea89-81ce-4200-a356-39fa4a155062@suse.de>
 <A0A92AB8-FA61-4AAC-96C9-00BE93E3F6D6@exactco.de>
 <12407aa9-a084-46a1-98cb-9649e7f24098@suse.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
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

Hi,

On Mon, 8 Dec 2025 09:44:23 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> >> On the 2400-and-onwards models, ast could set
> >> drm_device.mode_config.quirk_addfb_prefer_host_byte_order. If set, the
> >> format lookup will select a different format on BE machines. [1] For
> >> example requesting XRGB8888 returns BGRX8888 instead. If ast later
> >> sees such a format in the atomic_update code, it could transparently
> >> swap bytes when writing out pixels to the video memory.  IIRC this
> >> works transparently to DRM clients and fbcon.  I think this would be
> >> the preferred way of fixing the issue.
> > Uff, I get better than nothing ;-)
> 
> Well, you can set the quirk in mode config. And then in
> ast_handle_damage(), you'll require a switch for the big-endian
> formats. [1]
> 
> ast_handle_damage(...)
> {
>     ...
> 
>     switch (fb->format->format) {
>         default:
>             drm_fb_memcyp()
>             break;
>         case DRM_FORMAT_BGRX8888:
>         case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
>             /* Swap bytes on big-endian formats */
>             drm_fb_swab(dst, fb->pitches, src, fb, clip, false,
> fmtcnv_state);
>             break;
>     }
> }
> 
> You can get that final argument fmtcnv_state from the DMR shadow-plane
> state. [2]
> 
> [1]
> https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/ast/ast_mode.c#L549
> [2]
> https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/ast/ast_mode.c#L558
> 
> Does that fix the color corruption?

Following your suggestions conversion does not want to just work:

root@XCODE_SPARC_T4_1:~# dmesg  | tail
[  105.444761] ast 0000:0a:00.0: AST 2200 detected
[  105.444947] ast 0000:0a:00.0: [drm] dram MCLK=266 Mhz type=2 bus_width=32
[  105.444963] ast 0000:0a:00.0: [drm] Using analog VGA
[  105.445470] [drm] Initialized ast 0.1.0 for 0000:0a:00.0 on minor 0
[  105.673289] ast 0000:0a:00.0: [drm] format BX24 little-endian (0x34325842) not supported
[  105.673302] ast 0000:0a:00.0: [drm] No compatible format found
[  105.673348] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)
[  105.901306] ast 0000:0a:00.0: [drm] format BX24 little-endian (0x34325842) not supported
[  105.901319] ast 0000:0a:00.0: [drm] No compatible format found
[  105.901350] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)

WIP w/ BIG_ENDIAN temp commented out to test the code-path on the
otherwise function big-endian byte-swapping SPARC64 AST:

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 2d3ad7610c2e..3f17aa263bdb 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -227,6 +227,12 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 			}
 			break;
 		}
+
+#if 0 //def __BIG_ENDIAN
+		/* Big-endian byte-swapping */
+		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE_16);
+#endif
+
 		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
 		ast_set_cursor_base(ast, dst_off);
 	}
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cd08990a10f9..1065f481ec5f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -526,12 +526,23 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
 			      struct drm_framebuffer *fb,
-			      const struct drm_rect *clip)
+			      const struct drm_rect *clip,
+			      struct drm_format_conv_state *fmtcnv_state)
 {
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
-	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+
+	switch (fb->format->format) {
+	default:
+		drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+		break;
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
+		/* Swap bytes on big-endian formats */
+		drm_fb_swab(&dst, fb->pitches, src, fb, clip, false, fmtcnv_state);
+		break;
+	}
 }
 
 static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
@@ -557,11 +568,25 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state->vmode);
 	}
 
+
 	/* if the buffer comes from another device */
 	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
+#if 0 // def __BIG_ENDIAN
+		/* Big-endian byte-swapping */
+		switch (fb->format->format) {
+		case DRM_FORMAT_RGB565:
+			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE_16);
+			break;
+		case DRM_FORMAT_XRGB8888:
+			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE);
+			break;
+		}
+#endif
+
 		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 		drm_atomic_for_each_plane_damage(&iter, &damage) {
-			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage,
+					  &shadow_plane_state->fmtcnv_state);
 		}
 
 		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
@@ -1020,6 +1045,11 @@ int ast_mode_config_init(struct ast_device *ast)
 		dev->mode_config.max_height = 1200;
 	}
 
+#ifdef __BIG_ENDIAN
+	//if (ast->chip >= AST2400)
+		dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
+#endif
+
 	dev->mode_config.helper_private = &ast_mode_config_helper_funcs;
 
 	ret = ast_primary_plane_init(ast);
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 30578e3b07e4..4e11ece9fce7 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -34,6 +34,8 @@
 #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
+#define AST_IO_VGACRA2_BE_MODE		BIT(7)
+#define AST_IO_VGACRA2_BE_MODE_16	(AST_IO_VGACRA2_BE_MODE | BIT(6))
 #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
 #define AST_IO_VGACRAA_VGAMEM_SIZE_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
-- 
2.52.0

> Thanks for sticking with it.

Of course!

   René

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
