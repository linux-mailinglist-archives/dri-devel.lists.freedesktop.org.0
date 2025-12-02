Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD4C9E289
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7836210E731;
	Wed,  3 Dec 2025 08:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="mOu2Nx9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E892410E187
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
 :Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1b9beKAMUvt3Y0X2f/GaVweFtITJA+mqgChFfuxKx58=; b=m
 Ou2Nx9RLJs9ePen15l/wdIBHvG/kLhQ7zjiGwhbyTFinXRDHmo2kmPa3EmmSEYQ0MWwu1KvmIlSjf
 aDAtwWkpE7XSR2AiuEIkE3eNr6B4+F5G2OPXsuhuvCZ72UmbIinuq4EfDGyN0nv6eD1YANzjQp7sA
 HBCU2c3UNPflfChBmyo8KTroKLCIJM8NOanw037s2qxrHyoNbC88RTi22Mxy5Fq/55fvlKtyrDfom
 uD4Ks/WetbDIFuqVSDjLECwLRWUEz4gdNDRLYNvyft9KWhLHPu1azATTA0vdbnIvCPlNkr2hkieuW
 j1EiE7pOHhEhblzXrQqDSS4BRgvSDZySA==;
Date: Tue, 02 Dec 2025 17:06:26 +0100 (CET)
Message-Id: <20251202.170626.2134482663677806825.rene@exactco.de>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Dec 2025 08:11:25 +0000
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

The Aspeed ast drm driver has the frame-buffer RGBX swapped on
big-endian RISC systems. Fix by enabling byte swapping for any
__BIG_ENDIAN config.

Fixes: 12fec1405dd5 ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
Signed-off-by: René Rebe <rene@exactco.de>
---
Tested on Oracle T4-1 running sparc64 T2/Linux.
---
 drivers/gpu/drm/ast/ast_mode.c | 14 ++++++++++++++
 drivers/gpu/drm/ast/ast_reg.h  |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 30b011ed0a05..155ae35470d9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -708,6 +708,20 @@ static void ast_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
 	ast_set_dclk_reg(ast, adjusted_mode, vmode);
 	ast_set_crtthd_reg(ast);
 	ast_set_sync_reg(ast, adjusted_mode, vmode);
+
+#ifdef __BIG_ENDIAN
+	/* Big-endian byte-swapping */
+	switch (ast_crtc_state->format->format) {
+	case DRM_FORMAT_RGB565:
+		ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f, 0x40);
+		break;
+	case DRM_FORMAT_XRGB8888:
+		ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f, 0x80);
+		break;
+	default:
+		break;
+	}
+#endif
 }
 
 static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 30578e3b07e4..5c8c0fd2e229 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -75,4 +75,10 @@
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
 
+/*
+ * PCI Control
+ */
+
+#define AST_IO_VGACRA2			(0xA2) /* PCI control & big-endian */
+
 #endif
-- 
2.52.0


-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
