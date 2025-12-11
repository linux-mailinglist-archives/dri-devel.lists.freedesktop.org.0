Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E44CB5EAF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691EB10E809;
	Thu, 11 Dec 2025 12:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="ZBkaYwxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F3110E806
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5He3IBcX00OB3K4N91CfxqPei2g/3zOY4D5qNRAUMIw=; b=ZBkaYwxcZ0rf1JEV3WfU6g0FSM
 49C3TpH9yNSXZfdGFV3/1XHL07ISzFn5xcxI8RI4aqip+SKaL9BBLGgQnk4iiFprWorWGvz/V4NdM
 wKvoLBmw1zNVE6cw+3qaVGulLTx+lvzFxKVgoQPG0AIYO0ZOqqEf+dpoeBPIMh6DINHevSg+VWa6b
 49xk4FIapuyjs872zofAmw27MCeWhDQnweUmMfsH+mEgfMgEm5fwvMxbvBxtolB9z3n+kQze8y8gR
 U3FppbgGJlDxefwxzeeJKdYpZkQAmTtXb0VQYIyl29cGbIGF/G99jNofOq87mSZITXN3BOohtqwBD
 oY0ZoirQ==;
Date: Thu, 11 Dec 2025 13:43:30 +0100 (CET)
Message-Id: <20251211.134330.2200695829709887915.rene@exactco.de>
To: tzimmermann@suse.de
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <34cce8e3-51c5-4d44-8f6e-592a5943aec8@suse.de>
References: <dda9846d-3893-43ab-9cce-12a7f41fb974@suse.de>
 <20251210.175635.1285090497167018958.rene@exactco.de>
 <34cce8e3-51c5-4d44-8f6e-592a5943aec8@suse.de>
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

Good morning,

On Thu, 11 Dec 2025 08:22:12 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 10.12.25 um 17:56 schrieb René Rebe:
> > Hi,
> >
> > On Wed, 10 Dec 2025 16:41:50 +0100, Thomas Zimmermann
> > <tzimmermann@suse.de> wrote:
> >
> >> Hi
> >>
> >> Am 10.12.25 um 16:33 schrieb René Rebe:
> >>> Hallo,
> >>>
> >>> On Wed, 10 Dec 2025 09:55:50 +0100, Thomas Zimmermann
> >>> <tzimmermann@suse.de> wrote:
> >>> ...
> >>>>>> Does that fix the color corruption?
> >>>>> Following your suggestions conversion does not want to just work:
> >>>>>
> >>>>> root@XCODE_SPARC_T4_1:~# dmesg  | tail
> >>>>> [  105.444761] ast 0000:0a:00.0: AST 2200 detected
> >>>>> [ 105.444947] ast 0000:0a:00.0: [drm] dram MCLK=266 Mhz type=2
> >>>>> bus_width=32
> >>>>> [  105.444963] ast 0000:0a:00.0: [drm] Using analog VGA
> >>>>> [  105.445470] [drm] Initialized ast 0.1.0 for 0000:0a:00.0 on minor 0
> >>>>> [ 105.673289] ast 0000:0a:00.0: [drm] format BX24 little-endian
> >>>>> (0x34325842) not supported
> >>>>> [  105.673302] ast 0000:0a:00.0: [drm] No compatible format found
> >>>>> [ 105.673348] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup
> >>>>> emulation (ret=-22)
> >>>>> [ 105.901306] ast 0000:0a:00.0: [drm] format BX24 little-endian
> >>>>> (0x34325842) not supported
> >>>>> [  105.901319] ast 0000:0a:00.0: [drm] No compatible format found
> >>>>> [ 105.901350] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup
> >>>>> emulation (ret=-22)
> >>>> Oh well...
> >>>>
> >>>> There's a very simple patch attach. Does it fix the problem?
> >>> Yes, only leaving the hardcoded swapping from my patch liek this fixes
> >>> the byte-swapped output as expected on the sparc64 Sun T4.
> >> Great.
> >>
> >>> How would you like me to go from here? Just use the chip_id to force
> >>> swapping and enable hw swapper for pre-AST2400 chips or fix the
> >>> generic format selection to work as you had suggested?
> >>>
> >>> Does the ast_primary_plane_formats need to byte swapped formats for it
> >>> to work?
> >> I'll send out a full patch that implements the byte swapping. Once
> >> reviewed, it can be merged quickly. Can I add your Tested-by tag to
> >> the patch?
> > I'd be happy to finish my work.
> 
> Of course, no problem.
> 
> The code for the primary plane should be fine now. But we also need
> something for the cursor plane as well. There's a
> ast_set_cursor_image() with a memcpy_toio() [1] and several additional
> writes. IIUC they all have to be swapped as well.

Of course, any obvious style issue or endianess swapping linux-kernel
would like to see differently? You did not answer if I should just
conditionalize on the chip id. I used a bool to avoid intermangled
#ifdef conditionals to hopefully match kernel style.
Btw. checkpatch.pl warns:

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1

I could add this if desired while at it.

Only compile tested, will do a final hw test once patch is approved in
general.

Thanks!
	René
---
 drivers/gpu/drm/ast/ast_cursor.c | 20 +++++++++++++++++-
 drivers/gpu/drm/ast/ast_mode.c   | 35 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/ast/ast_reg.h    |  2 ++
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 2d3ad7610c2e..a16745cff83e 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -92,12 +92,30 @@ static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
 				 unsigned int width, unsigned int height)
 {
 	u8 __iomem *dst = ast_plane_vaddr(&ast->cursor_plane.base);
+	bool sw_swab = false;
+	int i;
 	u32 csum;
 
 	csum = ast_cursor_calculate_checksum(src, width, height);
 
+#ifdef __BIG_ENDIAN
+	/* HW swap bytes on big-endian formats, if possible */
+	if (ast->chip < AST2400)
+		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE_16);
+	else
+		sw_swab = true;
+#endif
+
 	/* write pixel data */
-	memcpy_toio(dst, src, AST_HWC_SIZE);
+	if (!sw_swab)
+		memcpy_toio(dst, src, AST_HWC_SIZE);
+	else {
+		for (i = 0; i < AST_HWC_SIZE / 2; i += 2) {
+			const u16 *src16 = (const u16 *)(src + i);
+
+			writel(*src16, dst + i);
+		}
+	}
 
 	/* write checksum + signature */
 	dst += AST_HWC_SIZE;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cd08990a10f9..9a18f0dc1a99 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -526,12 +526,24 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
 			      struct drm_framebuffer *fb,
-			      const struct drm_rect *clip)
+			      const struct drm_rect *clip,
+			      struct drm_format_conv_state *fmtcnv_state)
 {
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
+	bool sw_swab = false;
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
-	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+
+#ifdef __BIG_ENDIAN
+	/* Swap bytes on big-endian formats */
+	if (ast->chip >= AST2400)
+		sw_swab = true;
+#endif
+
+	if (sw_swab)
+		drm_fb_swab(&dst, fb->pitches, src, fb, clip, false, fmtcnv_state);
+	else
+		drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
 }
 
 static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
@@ -559,9 +571,26 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 	/* if the buffer comes from another device */
 	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
+#ifdef __BIG_ENDIAN
+		/* HW swap bytes on big-endian formats, if possible */
+		if (ast->chip < AST2400) {
+			switch (fb->format->format) {
+			case DRM_FORMAT_RGB565:
+				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f,
+						       AST_IO_VGACRA2_BE_MODE_16);
+				break;
+			case DRM_FORMAT_XRGB8888:
+				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f,
+						       AST_IO_VGACRA2_BE_MODE);
+				break;
+			}
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
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 30578e3b07e4..bcd39d7438b9 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -34,6 +34,8 @@
 #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
+#define AST_IO_VGACRA2_BE_MODE		BIT(7)
+#define AST_IO_VGACRA2_BE_MODE_16	(BIT(7) | BIT(6))
 #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
 #define AST_IO_VGACRAA_VGAMEM_SIZE_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
-- 
2.52.0



> [1]
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ast/ast_cursor.c#L101
> 
> Best regards
> Thomas

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
