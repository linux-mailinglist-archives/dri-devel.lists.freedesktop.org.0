Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D32A1B14A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDE810E906;
	Fri, 24 Jan 2025 08:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iFlJDD3i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q5jhpZ18";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iFlJDD3i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q5jhpZ18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544A510E8FA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A8AA21166;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwUsF7DSuflAU+YxkRspQ3cXAOXMiu28SvaQb64T9L8=;
 b=iFlJDD3i3iiMrVL6STTOCwx906TaRnTgki15AID9qKcAYmNsJxgyxhkKHD/rODk0TqpYBE
 F/WeuVSN50h4nHMSAzWKR+L4B0q84LNBODaYlSzMFgFRE69yhQaqWZDqdbt+kiq4vPzgKv
 hYZsJbsXtD8B/bE/zcKHXNUvhZnyfn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwUsF7DSuflAU+YxkRspQ3cXAOXMiu28SvaQb64T9L8=;
 b=Q5jhpZ18QstsX6Vcf/0GgEcJTqjqyqtOuMs5XLtiLxjLpOwQU+HJJauVcxEsatjXfBegcE
 ueuGi6H2qDo+APDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwUsF7DSuflAU+YxkRspQ3cXAOXMiu28SvaQb64T9L8=;
 b=iFlJDD3i3iiMrVL6STTOCwx906TaRnTgki15AID9qKcAYmNsJxgyxhkKHD/rODk0TqpYBE
 F/WeuVSN50h4nHMSAzWKR+L4B0q84LNBODaYlSzMFgFRE69yhQaqWZDqdbt+kiq4vPzgKv
 hYZsJbsXtD8B/bE/zcKHXNUvhZnyfn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwUsF7DSuflAU+YxkRspQ3cXAOXMiu28SvaQb64T9L8=;
 b=Q5jhpZ18QstsX6Vcf/0GgEcJTqjqyqtOuMs5XLtiLxjLpOwQU+HJJauVcxEsatjXfBegcE
 ueuGi6H2qDo+APDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA0B613AA3;
 Fri, 24 Jan 2025 08:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iODwN+NJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/15] drm/ast: Add helpers for VBIOS mode lookup
Date: Fri, 24 Jan 2025 08:57:48 +0100
Message-ID: <20250124080546.9956-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

Mode lines are independent from hardware Gen or TX chip, so hide all
VBIOS mode tables in ast_vbios.c.

Move the look-up code for VBIOS modes from ast_vbios_get_mode_info()
to ast_vbios_find_mode(). The new look-up function respects the
supported-mode flags in struct ast_device. For example, if a device
does not have struct ast_device.support_fullhd set, the helper does
not return a valid mode for 1920x1080. Taking the supported-mode flags
into account allows for making the VBIOS tables the single reference
for validating and setting display modes against hardware capabilities.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile     |   1 +
 drivers/gpu/drm/ast/ast_dp.c     |   1 +
 drivers/gpu/drm/ast/ast_drv.h    |  18 +--
 drivers/gpu/drm/ast/ast_mode.c   |  77 +--------
 drivers/gpu/drm/ast/ast_tables.h | 177 ---------------------
 drivers/gpu/drm/ast/ast_vbios.c  | 261 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_vbios.h  | 108 +++++++++++++
 7 files changed, 380 insertions(+), 263 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.c
 create mode 100644 drivers/gpu/drm/ast/ast_vbios.h

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 47da848fa3fc1..3107ea9c7bf55 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -13,6 +13,7 @@ ast-y := \
 	ast_mode.o \
 	ast_post.o \
 	ast_sil164.o \
+	ast_vbios.o \
 	ast_vga.o
 
 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 0e282b7b167c6..08c811f3ce342 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -12,6 +12,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "ast_drv.h"
+#include "ast_vbios.h"
 
 static bool ast_astdp_is_connected(struct ast_device *ast)
 {
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 4e3a88f8a85ca..9309cc5e81b0f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -39,6 +39,8 @@
 
 #include "ast_reg.h"
 
+struct ast_vbios_enhtable;
+
 #define DRIVER_AUTHOR		"Dave Airlie"
 
 #define DRIVER_NAME		"ast"
@@ -350,22 +352,6 @@ struct ast_vbios_stdtable {
 	u8 gr[9];
 };
 
-struct ast_vbios_enhtable {
-	u32 ht;
-	u32 hde;
-	u32 hfp;
-	u32 hsync;
-	u32 vt;
-	u32 vde;
-	u32 vfp;
-	u32 vsync;
-	u32 dclk_index;
-	u32 flags;
-	u32 refresh_rate;
-	u32 refresh_rate_index;
-	u32 mode_id;
-};
-
 struct ast_vbios_dclk_info {
 	u8 param1;
 	u8 param2;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e91a93050212e..e3d15d30aeeae 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -47,6 +47,7 @@
 
 #include "ast_drv.h"
 #include "ast_tables.h"
+#include "ast_vbios.h"
 
 #define AST_LUT_SIZE 256
 
@@ -106,14 +107,12 @@ static void ast_crtc_set_gamma(struct ast_device *ast,
 	}
 }
 
-static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
+static bool ast_get_vbios_mode_info(struct ast_device *ast,
+				    const struct drm_format_info *format,
 				    const struct drm_display_mode *mode,
 				    struct drm_display_mode *adjusted_mode,
 				    struct ast_vbios_mode_info *vbios_mode)
 {
-	u32 refresh_rate_index = 0, refresh_rate;
-	const struct ast_vbios_enhtable *best = NULL;
-	const struct ast_vbios_enhtable *loop;
 	u32 hborder, vborder;
 
 	switch (format->cpp[0] * 8) {
@@ -131,73 +130,10 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 		return false;
 	}
 
-	switch (mode->hdisplay) {
-	case 640:
-		vbios_mode->enh_table = &res_640x480[refresh_rate_index];
-		break;
-	case 800:
-		vbios_mode->enh_table = &res_800x600[refresh_rate_index];
-		break;
-	case 1024:
-		vbios_mode->enh_table = &res_1024x768[refresh_rate_index];
-		break;
-	case 1152:
-		vbios_mode->enh_table = &res_1152x864[refresh_rate_index];
-		break;
-	case 1280:
-		if (mode->vdisplay == 800)
-			vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
-		else
-			vbios_mode->enh_table = &res_1280x1024[refresh_rate_index];
-		break;
-	case 1360:
-		vbios_mode->enh_table = &res_1360x768[refresh_rate_index];
-		break;
-	case 1440:
-		vbios_mode->enh_table = &res_1440x900[refresh_rate_index];
-		break;
-	case 1600:
-		if (mode->vdisplay == 900)
-			vbios_mode->enh_table = &res_1600x900[refresh_rate_index];
-		else
-			vbios_mode->enh_table = &res_1600x1200[refresh_rate_index];
-		break;
-	case 1680:
-		vbios_mode->enh_table = &res_1680x1050[refresh_rate_index];
-		break;
-	case 1920:
-		if (mode->vdisplay == 1080)
-			vbios_mode->enh_table = &res_1920x1080[refresh_rate_index];
-		else
-			vbios_mode->enh_table = &res_1920x1200[refresh_rate_index];
-		break;
-	default:
-		return false;
-	}
-
-	refresh_rate = drm_mode_vrefresh(mode);
-
-	loop = vbios_mode->enh_table;
-
-	while (ast_vbios_mode_is_valid(loop)) {
-		if (((mode->flags & DRM_MODE_FLAG_NVSYNC) && (loop->flags & PVSync))  ||
-		    ((mode->flags & DRM_MODE_FLAG_PVSYNC) && (loop->flags & NVSync))  ||
-		    ((mode->flags & DRM_MODE_FLAG_NHSYNC) && (loop->flags & PHSync))  ||
-		    ((mode->flags & DRM_MODE_FLAG_PHSYNC) && (loop->flags & NHSync))) {
-			loop++;
-			continue;
-		}
-		if (loop->refresh_rate <= refresh_rate &&
-		    (!best || loop->refresh_rate > best->refresh_rate))
-			best = loop;
-		loop++;
-	}
-
-	if (!best)
+	vbios_mode->enh_table = ast_vbios_find_mode(ast, mode);
+	if (!vbios_mode->enh_table)
 		return false;
 
-	vbios_mode->enh_table = best;
-
 	hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
 	vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;
 
@@ -1109,6 +1045,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
 	struct drm_device *dev = crtc->dev;
+	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
 	bool succ;
@@ -1143,7 +1080,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 		}
 	}
 
-	succ = ast_get_vbios_mode_info(format, &crtc_state->mode,
+	succ = ast_get_vbios_mode_info(ast, format, &crtc_state->mode,
 				       &crtc_state->adjusted_mode,
 				       &ast_state->vbios_mode_info);
 	if (!succ)
diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index 4367817b2f806..f1c9f7e1f1fcd 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -33,54 +33,6 @@
 #define HiCModeIndex		3
 #define TrueCModeIndex		4
 
-#define Charx8Dot               0x00000001
-#define HalfDCLK                0x00000002
-#define DoubleScanMode          0x00000004
-#define LineCompareOff          0x00000008
-#define HBorder                 0x00000020
-#define VBorder                 0x00000010
-#define WideScreenMode		0x00000100
-#define NewModeInfo		0x00000200
-#define NHSync			0x00000400
-#define PHSync			0x00000800
-#define NVSync			0x00001000
-#define PVSync			0x00002000
-#define SyncPP			(PVSync | PHSync)
-#define SyncPN			(PVSync | NHSync)
-#define SyncNP			(NVSync | PHSync)
-#define SyncNN			(NVSync | NHSync)
-#define AST2500PreCatchCRT		0x00004000
-
-/* DCLK Index */
-#define VCLK25_175     		0x00
-#define VCLK28_322     		0x01
-#define VCLK31_5       		0x02
-#define VCLK36         		0x03
-#define VCLK40         		0x04
-#define VCLK49_5       		0x05
-#define VCLK50         		0x06
-#define VCLK56_25      		0x07
-#define VCLK65		 	0x08
-#define VCLK75	        	0x09
-#define VCLK78_75      		0x0A
-#define VCLK94_5       		0x0B
-#define VCLK108        		0x0C
-#define VCLK135        		0x0D
-#define VCLK157_5      		0x0E
-#define VCLK162        		0x0F
-/* #define VCLK193_25     		0x10 */
-#define VCLK154     		0x10
-#define VCLK83_5    		0x11
-#define VCLK106_5   		0x12
-#define VCLK146_25  		0x13
-#define VCLK148_5   		0x14
-#define VCLK71      		0x15
-#define VCLK88_75   		0x16
-#define VCLK119     		0x17
-#define VCLK85_5     		0x18
-#define VCLK97_75     		0x19
-#define VCLK118_25			0x1A
-
 static const struct ast_vbios_dclk_info dclk_table[] = {
 	{0x2C, 0xE7, 0x03},			/* 00: VCLK25_175	*/
 	{0x95, 0x62, 0x03},			/* 01: VCLK28_322	*/
@@ -214,133 +166,4 @@ static const struct ast_vbios_stdtable vbios_stdtable[] = {
 	},
 };
 
-#define AST_VBIOS_INVALID_MODE \
-	{0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u}
-
-static inline bool ast_vbios_mode_is_valid(const struct ast_vbios_enhtable *vmode)
-{
-	return vmode->ht && vmode->vt && vmode->refresh_rate;
-}
-
-static const struct ast_vbios_enhtable res_640x480[] = {
-	{ 800, 640, 8, 96, 525, 480, 2, 2, VCLK25_175,	/* 60Hz */
-	  (SyncNN | HBorder | VBorder | Charx8Dot), 60, 1, 0x2E },
-	{ 832, 640, 16, 40, 520, 480, 1, 3, VCLK31_5,	/* 72Hz */
-	  (SyncNN | HBorder | VBorder | Charx8Dot), 72, 2, 0x2E  },
-	{ 840, 640, 16, 64, 500, 480, 1, 3, VCLK31_5,	/* 75Hz */
-	  (SyncNN | Charx8Dot) , 75, 3, 0x2E },
-	{ 832, 640, 56, 56, 509, 480, 1, 3, VCLK36,	/* 85Hz */
-	  (SyncNN | Charx8Dot) , 85, 4, 0x2E },
-	AST_VBIOS_INVALID_MODE,				/* end */
-};
-
-static const struct ast_vbios_enhtable res_800x600[] = {
-	{1024, 800, 24, 72, 625, 600, 1, 2, VCLK36,	/* 56Hz */
-	 (SyncPP | Charx8Dot), 56, 1, 0x30 },
-	{1056, 800, 40, 128, 628, 600, 1, 4, VCLK40,	/* 60Hz */
-	 (SyncPP | Charx8Dot), 60, 2, 0x30 },
-	{1040, 800, 56, 120, 666, 600, 37, 6, VCLK50,	/* 72Hz */
-	 (SyncPP | Charx8Dot), 72, 3, 0x30 },
-	{1056, 800, 16, 80, 625, 600, 1, 3, VCLK49_5,	/* 75Hz */
-	 (SyncPP | Charx8Dot), 75, 4, 0x30 },
-	{1048, 800, 32, 64, 631, 600, 1, 3, VCLK56_25,	/* 85Hz */
-	 (SyncPP | Charx8Dot), 84, 5, 0x30 },
-	AST_VBIOS_INVALID_MODE,				/* end */
-};
-
-
-static const struct ast_vbios_enhtable res_1024x768[] = {
-	{1344, 1024, 24, 136, 806, 768, 3, 6, VCLK65,	/* 60Hz */
-	 (SyncNN | Charx8Dot), 60, 1, 0x31 },
-	{1328, 1024, 24, 136, 806, 768, 3, 6, VCLK75,	/* 70Hz */
-	 (SyncNN | Charx8Dot), 70, 2, 0x31 },
-	{1312, 1024, 16, 96, 800, 768, 1, 3, VCLK78_75,	/* 75Hz */
-	 (SyncPP | Charx8Dot), 75, 3, 0x31 },
-	{1376, 1024, 48, 96, 808, 768, 1, 3, VCLK94_5,	/* 85Hz */
-	 (SyncPP | Charx8Dot), 84, 4, 0x31 },
-	AST_VBIOS_INVALID_MODE,				/* end */
-};
-
-static const struct ast_vbios_enhtable res_1280x1024[] = {
-	{1688, 1280, 48, 112, 1066, 1024, 1, 3, VCLK108,	/* 60Hz */
-	 (SyncPP | Charx8Dot), 60, 1, 0x32 },
-	{1688, 1280, 16, 144, 1066, 1024, 1, 3, VCLK135,	/* 75Hz */
-	 (SyncPP | Charx8Dot), 75, 2, 0x32 },
-	{1728, 1280, 64, 160, 1072, 1024, 1, 3, VCLK157_5,	/* 85Hz */
-	 (SyncPP | Charx8Dot), 85, 3, 0x32 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-static const struct ast_vbios_enhtable res_1600x1200[] = {
-	{2160, 1600, 64, 192, 1250, 1200, 1, 3, VCLK162,	/* 60Hz */
-	 (SyncPP | Charx8Dot), 60, 1, 0x33 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-static const struct ast_vbios_enhtable res_1152x864[] = {
-	{1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* 75Hz */
-	 (SyncPP | Charx8Dot | NewModeInfo), 75, 1, 0x3B },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-/* 16:9 */
-static const struct ast_vbios_enhtable res_1360x768[] = {
-	{1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,		/* 60Hz */
-	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x39 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-static const struct ast_vbios_enhtable res_1600x900[] = {
-	{1760, 1600, 48, 32, 926, 900, 3, 5, VCLK97_75,		/* 60Hz CVT RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
-	  AST2500PreCatchCRT), 60, 1, 0x3A },
-	{2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60Hz CVT */
-	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x3A },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-static const struct ast_vbios_enhtable res_1920x1080[] = {
-	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
-	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
-	  AST2500PreCatchCRT), 60, 1, 0x38 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-
-/* 16:10 */
-static const struct ast_vbios_enhtable res_1280x800[] = {
-	{1440, 1280, 48, 32,  823,  800, 3, 6, VCLK71,		/* 60Hz RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
-	  AST2500PreCatchCRT), 60, 1, 0x35 },
-	{1680, 1280, 72,128,  831,  800, 3, 6, VCLK83_5,	/* 60Hz */
-	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x35 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-
-};
-
-static const struct ast_vbios_enhtable res_1440x900[] = {
-	{1600, 1440, 48, 32,  926,  900, 3, 6, VCLK88_75,	/* 60Hz RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
-	  AST2500PreCatchCRT), 60, 1, 0x36 },
-	{1904, 1440, 80,152,  934,  900, 3, 6, VCLK106_5,	/* 60Hz */
-	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x36 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-static const struct ast_vbios_enhtable res_1680x1050[] = {
-	{1840, 1680, 48, 32, 1080, 1050, 3, 6, VCLK119,		/* 60Hz RB */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
-	  AST2500PreCatchCRT), 60, 1, 0x37 },
-	{2240, 1680,104,176, 1089, 1050, 3, 6, VCLK146_25,	/* 60Hz */
-	 (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x37 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
-static const struct ast_vbios_enhtable res_1920x1200[] = {
-	{2080, 1920, 48, 32, 1235, 1200, 3, 6, VCLK154,		/* 60Hz RB*/
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
-	  AST2500PreCatchCRT), 60, 1, 0x34 },
-	AST_VBIOS_INVALID_MODE,					/* end */
-};
-
 #endif
diff --git a/drivers/gpu/drm/ast/ast_vbios.c b/drivers/gpu/drm/ast/ast_vbios.c
new file mode 100644
index 0000000000000..ddbcf12c1f461
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_vbios.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2005 ASPEED Technology Inc.
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that
+ * copyright notice and this permission notice appear in supporting
+ * documentation, and that the name of the authors not be used in
+ * advertising or publicity pertaining to distribution of the software without
+ * specific, written prior permission.  The authors makes no representations
+ * about the suitability of this software for any purpose.  It is provided
+ * "as is" without express or implied warranty.
+ *
+ * THE AUTHORS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE AUTHORS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+ * PERFORMANCE OF THIS SOFTWARE.
+ */
+
+#include "ast_drv.h"
+#include "ast_vbios.h"
+
+/* 4:3 */
+
+static const struct ast_vbios_enhtable res_640x480[] = {
+	{ 800, 640, 8, 96, 525, 480, 2, 2, VCLK25_175,		/* 60 Hz */
+	  (SyncNN | HBorder | VBorder | Charx8Dot), 60, 1, 0x2e },
+	{ 832, 640, 16, 40, 520, 480, 1, 3, VCLK31_5,		/* 72 Hz */
+	  (SyncNN | HBorder | VBorder | Charx8Dot), 72, 2, 0x2e  },
+	{ 840, 640, 16, 64, 500, 480, 1, 3, VCLK31_5,		/* 75 Hz */
+	  (SyncNN | Charx8Dot), 75, 3, 0x2e },
+	{ 832, 640, 56, 56, 509, 480, 1, 3, VCLK36,		/* 85 Hz */
+	  (SyncNN | Charx8Dot), 85, 4, 0x2e },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_800x600[] = {
+	{ 1024, 800, 24, 72, 625, 600, 1, 2, VCLK36,		/* 56 Hz */
+	  (SyncPP | Charx8Dot), 56, 1, 0x30 },
+	{ 1056, 800, 40, 128, 628, 600, 1, 4, VCLK40,		/* 60 Hz */
+	  (SyncPP | Charx8Dot), 60, 2, 0x30 },
+	{ 1040, 800, 56, 120, 666, 600, 37, 6, VCLK50,		/* 72 Hz */
+	  (SyncPP | Charx8Dot), 72, 3, 0x30 },
+	{ 1056, 800, 16, 80, 625, 600, 1, 3, VCLK49_5,		/* 75 Hz */
+	  (SyncPP | Charx8Dot), 75, 4, 0x30 },
+	{ 1048, 800, 32, 64, 631, 600, 1, 3, VCLK56_25,		/* 85 Hz */
+	  (SyncPP | Charx8Dot), 84, 5, 0x30 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1024x768[] = {
+	{ 1344, 1024, 24, 136, 806, 768, 3, 6, VCLK65,		/* 60 Hz */
+	  (SyncNN | Charx8Dot), 60, 1, 0x31 },
+	{ 1328, 1024, 24, 136, 806, 768, 3, 6, VCLK75,		/* 70 Hz */
+	  (SyncNN | Charx8Dot), 70, 2, 0x31 },
+	{ 1312, 1024, 16, 96, 800, 768, 1, 3, VCLK78_75,	/* 75 Hz */
+	  (SyncPP | Charx8Dot), 75, 3, 0x31 },
+	{ 1376, 1024, 48, 96, 808, 768, 1, 3, VCLK94_5,		/* 85 Hz */
+	  (SyncPP | Charx8Dot), 84, 4, 0x31 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1152x864[] = {
+	{ 1600, 1152, 64, 128,  900,  864, 1, 3, VCLK108,	/* 75 Hz */
+	  (SyncPP | Charx8Dot | NewModeInfo), 75, 1, 0x3b },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1280x1024[] = {
+	{ 1688, 1280, 48, 112, 1066, 1024, 1, 3, VCLK108,	/* 60 Hz */
+	  (SyncPP | Charx8Dot), 60, 1, 0x32 },
+	{ 1688, 1280, 16, 144, 1066, 1024, 1, 3, VCLK135,	/* 75 Hz */
+	  (SyncPP | Charx8Dot), 75, 2, 0x32 },
+	{ 1728, 1280, 64, 160, 1072, 1024, 1, 3, VCLK157_5,	/* 85 Hz */
+	  (SyncPP | Charx8Dot), 85, 3, 0x32 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1600x1200[] = {
+	{ 2160, 1600, 64, 192, 1250, 1200, 1, 3, VCLK162,	/* 60 Hz */
+	  (SyncPP | Charx8Dot), 60, 1, 0x33 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+/* 16:9 */
+
+static const struct ast_vbios_enhtable res_1360x768[] = {
+	{ 1792, 1360, 64, 112, 795, 768, 3, 6, VCLK85_5,	/* 60 Hz */
+	  (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 1, 0x39 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1600x900[] = {
+	{ 1760, 1600, 48, 32, 926, 900, 3, 5, VCLK97_75,	/* 60 Hz CVT RB */
+	  (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  AST2500PreCatchCRT), 60, 1, 0x3a },
+	{ 2112, 1600, 88, 168, 934, 900, 3, 5, VCLK118_25,	/* 60 Hz CVT */
+	  (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x3a },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1920x1080[] = {
+	{ 2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60 Hz */
+	  (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  AST2500PreCatchCRT), 60, 1, 0x38 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+/* 16:10 */
+
+static const struct ast_vbios_enhtable res_1280x800[] = {
+	{ 1440, 1280, 48, 32, 823, 800, 3, 6, VCLK71,		/* 60 Hz RB */
+	  (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  AST2500PreCatchCRT), 60, 1, 0x35 },
+	{ 1680, 1280, 72, 128, 831, 800, 3, 6, VCLK83_5,	/* 60 Hz */
+	  (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x35 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1440x900[] = {
+	{ 1600, 1440, 48, 32, 926, 900, 3, 6, VCLK88_75,	/* 60 Hz RB */
+	  (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  AST2500PreCatchCRT), 60, 1, 0x36 },
+	{ 1904, 1440, 80, 152, 934, 900, 3, 6, VCLK106_5,	/* 60 Hz */
+	  (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x36 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1680x1050[] = {
+	{ 1840, 1680, 48, 32, 1080, 1050, 3, 6, VCLK119,	/* 60 Hz RB */
+	  (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  AST2500PreCatchCRT), 60, 1, 0x37 },
+	{ 2240, 1680, 104, 176, 1089, 1050, 3, 6, VCLK146_25,	/* 60 Hz */
+	  (SyncPN | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 2, 0x37 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable res_1920x1200[] = {
+	{ 2080, 1920, 48, 32, 1235, 1200, 3, 6, VCLK154,	/* 60 Hz RB*/
+	  (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	  AST2500PreCatchCRT), 60, 1, 0x34 },
+	AST_VBIOS_INVALID_MODE,					/* end */
+};
+
+static const struct ast_vbios_enhtable *ast_vbios_find_mode_table(const struct ast_device *ast,
+								  unsigned int hdisplay,
+								  unsigned int vdisplay)
+{
+	if (ast->support_wuxga) {
+		switch (hdisplay) {
+		case 1920:
+			if (vdisplay == 1200)
+				return &res_1920x1200[0];
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (ast->support_fullhd) {
+		switch (hdisplay) {
+		case 1920:
+			if (vdisplay == 1080)
+				return &res_1920x1080[0];
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (ast->support_wsxga_p) {
+		switch (hdisplay) {
+		case 1280:
+			if (vdisplay == 800)
+				return &res_1280x800[0];
+			break;
+		case 1360:
+			if (vdisplay == 768)
+				return &res_1360x768[0];
+			break;
+		case 1440:
+			if (vdisplay == 900)
+				return &res_1440x900[0];
+			break;
+		case 1600:
+			if (vdisplay == 900)
+				return &res_1600x900[0];
+			break;
+		case 1680:
+			if (vdisplay == 1050)
+				return &res_1680x1050[0];
+			break;
+		default:
+			break;
+		}
+	}
+
+	switch (hdisplay) {
+	case 640:
+		if (vdisplay == 480)
+			return &res_640x480[0];
+		break;
+	case 800:
+		if (vdisplay == 600)
+			return &res_800x600[0];
+		break;
+	case 1024:
+		if (vdisplay == 768)
+			return &res_1024x768[0];
+		break;
+	case 1152:
+		if (vdisplay == 864)
+			return &res_1152x864[0];
+		break;
+	case 1280:
+		if (vdisplay == 1024)
+			return &res_1280x1024[0];
+		break;
+	case 1600:
+		if (vdisplay == 1200)
+			return &res_1600x1200[0];
+		break;
+	default:
+		break;
+	}
+
+	return NULL;
+}
+
+const struct ast_vbios_enhtable *ast_vbios_find_mode(const struct ast_device *ast,
+						     const struct drm_display_mode *mode)
+{
+	const struct ast_vbios_enhtable *best_vmode = NULL;
+	const struct ast_vbios_enhtable *vmode_table;
+	const struct ast_vbios_enhtable *vmode;
+	u32 refresh_rate;
+
+	vmode_table = ast_vbios_find_mode_table(ast, mode->hdisplay, mode->vdisplay);
+	if (!vmode_table)
+		return NULL;
+
+	refresh_rate = drm_mode_vrefresh(mode);
+
+	for (vmode = vmode_table; ast_vbios_mode_is_valid(vmode); ++vmode) {
+		if (((mode->flags & DRM_MODE_FLAG_NVSYNC) && (vmode->flags & PVSync)) ||
+		    ((mode->flags & DRM_MODE_FLAG_PVSYNC) && (vmode->flags & NVSync)) ||
+		    ((mode->flags & DRM_MODE_FLAG_NHSYNC) && (vmode->flags & PHSync)) ||
+		    ((mode->flags & DRM_MODE_FLAG_PHSYNC) && (vmode->flags & NHSync))) {
+			continue;
+		}
+		if (vmode->refresh_rate <= refresh_rate &&
+		    (!best_vmode || vmode->refresh_rate > best_vmode->refresh_rate))
+			best_vmode = vmode;
+	}
+
+	return best_vmode;
+}
diff --git a/drivers/gpu/drm/ast/ast_vbios.h b/drivers/gpu/drm/ast/ast_vbios.h
new file mode 100644
index 0000000000000..8cf025010594c
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_vbios.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2005 ASPEED Technology Inc.
+ *
+ * Permission to use, copy, modify, distribute, and sell this software and its
+ * documentation for any purpose is hereby granted without fee, provided that
+ * the above copyright notice appear in all copies and that both that
+ * copyright notice and this permission notice appear in supporting
+ * documentation, and that the name of the authors not be used in
+ * advertising or publicity pertaining to distribution of the software without
+ * specific, written prior permission.  The authors makes no representations
+ * about the suitability of this software for any purpose.  It is provided
+ * "as is" without express or implied warranty.
+ *
+ * THE AUTHORS DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
+ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
+ * EVENT SHALL THE AUTHORS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+ * PERFORMANCE OF THIS SOFTWARE.
+ */
+/* Ported from xf86-video-ast driver */
+
+#ifndef AST_VBIOS_H
+#define AST_VBIOS_H
+
+#include <linux/types.h>
+
+struct ast_device;
+struct drm_display_mode;
+
+#define Charx8Dot               0x00000001
+#define HalfDCLK                0x00000002
+#define DoubleScanMode          0x00000004
+#define LineCompareOff          0x00000008
+#define HBorder                 0x00000020
+#define VBorder                 0x00000010
+#define WideScreenMode		0x00000100
+#define NewModeInfo		0x00000200
+#define NHSync			0x00000400
+#define PHSync			0x00000800
+#define NVSync			0x00001000
+#define PVSync			0x00002000
+#define SyncPP			(PVSync | PHSync)
+#define SyncPN			(PVSync | NHSync)
+#define SyncNP			(NVSync | PHSync)
+#define SyncNN			(NVSync | NHSync)
+#define AST2500PreCatchCRT		0x00004000
+
+/* DCLK Index */
+#define VCLK25_175		0x00
+#define VCLK28_322		0x01
+#define VCLK31_5		0x02
+#define VCLK36			0x03
+#define VCLK40			0x04
+#define VCLK49_5		0x05
+#define VCLK50			0x06
+#define VCLK56_25		0x07
+#define VCLK65			0x08
+#define VCLK75			0x09
+#define VCLK78_75		0x0a
+#define VCLK94_5		0x0b
+#define VCLK108			0x0c
+#define VCLK135			0x0d
+#define VCLK157_5		0x0e
+#define VCLK162			0x0f
+/* #define VCLK193_25		0x10 */
+#define VCLK154			0x10
+#define VCLK83_5		0x11
+#define VCLK106_5		0x12
+#define VCLK146_25		0x13
+#define VCLK148_5		0x14
+#define VCLK71			0x15
+#define VCLK88_75		0x16
+#define VCLK119			0x17
+#define VCLK85_5		0x18
+#define VCLK97_75		0x19
+#define VCLK118_25		0x1a
+
+struct ast_vbios_enhtable {
+	u32 ht;
+	u32 hde;
+	u32 hfp;
+	u32 hsync;
+	u32 vt;
+	u32 vde;
+	u32 vfp;
+	u32 vsync;
+	u32 dclk_index;
+	u32 flags;
+	u32 refresh_rate;
+	u32 refresh_rate_index;
+	u32 mode_id;
+};
+
+#define AST_VBIOS_INVALID_MODE \
+	{0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u}
+
+static inline bool ast_vbios_mode_is_valid(const struct ast_vbios_enhtable *vmode)
+{
+	return vmode->ht && vmode->vt && vmode->refresh_rate;
+}
+
+const struct ast_vbios_enhtable *ast_vbios_find_mode(const struct ast_device *ast,
+						     const struct drm_display_mode *mode);
+
+#endif
-- 
2.47.1

