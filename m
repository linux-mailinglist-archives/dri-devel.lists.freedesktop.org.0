Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0707CBDC7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188A410E28F;
	Tue, 17 Oct 2023 08:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E2910E28E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 08:36:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3430521D0D;
 Tue, 17 Oct 2023 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697531817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwvSsXLvh4N7/ENeq2SVasuh4X1mnxS4dtGIfpvt/Mg=;
 b=oYga/ALWWx7mzO+DqiX0lPUtvnUBOWqMVW4jF7V2Ka7fW75KqMjCCfAQgykVg0fVgKo3gk
 yMfAsoCPi1i6F32IhfvbNOkt7SYl8iqzyEKbl8pNkNiBKR6gbnoW6ducGKKxQKNQme10Yd
 lwtHwLimb5XKGHP4dGHXeeaH6eXWjN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697531817;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwvSsXLvh4N7/ENeq2SVasuh4X1mnxS4dtGIfpvt/Mg=;
 b=wpVEe1uychMy2o3ozKg9QRG5jjKxWF1+K94JHAQxSZfPUYWEA7zos1Ld9M/rbWosdrsFKe
 jJYuJR4N4QrJdcDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F128113584;
 Tue, 17 Oct 2023 08:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qMJ5OahHLmVbUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Oct 2023 08:36:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 12/12] drm/ast: Move register constants to ast_reg.h
Date: Tue, 17 Oct 2023 10:32:08 +0200
Message-ID: <20231017083653.10063-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017083653.10063-1-tzimmermann@suse.de>
References: <20231017083653.10063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL5hwym8k7wjfpcebf457xyjzi)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve readability by putting all register constants into a separate
header file. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h | 83 +----------------------------
 drivers/gpu/drm/ast/ast_reg.h | 99 +++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_reg.h

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 214bfac0798ab..2aee32344f4a2 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -39,6 +39,8 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_framebuffer.h>
 
+#include "ast_reg.h"
+
 #define DRIVER_AUTHOR		"Dave Airlie"
 
 #define DRIVER_NAME		"ast"
@@ -259,25 +261,6 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 #define IS_AST_GEN6(__ast)	__ast_gen_is_eq(__ast, 6)
 #define IS_AST_GEN7(__ast)	__ast_gen_is_eq(__ast, 7)
 
-#define AST_IO_VGAARI_W			(0x40)
-#define AST_IO_VGAMR_W			(0x42)
-#define AST_IO_VGAER			(0x43)
-#define AST_IO_VGASRI			(0x44)
-#define AST_IO_VGADRR			(0x47)
-#define AST_IO_VGADWR			(0x48)
-#define AST_IO_VGAPDR		        (0x49)
-#define AST_IO_VGAGRI			(0x4E)
-#define AST_IO_VGACRI			(0x54)
-#define AST_IO_VGAIR1_R			(0x5A)
-#define AST_IO_VGAMR_R			(0x4C)
-
-#define AST_IO_MM_OFFSET		(0x380)
-
-#define AST_IO_VGAIR1_VREFRESH		BIT(3)
-
-#define AST_IO_VGACRCB_HWC_ENABLED     BIT(1)
-#define AST_IO_VGACRCB_HWC_16BPP       BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
-
 static inline u32 ast_read32(struct ast_device *ast, u32 reg)
 {
 	return ioread32(ast->regs + reg);
@@ -399,71 +382,9 @@ int ast_mode_config_init(struct ast_device *ast);
 #define AST_DP501_LINKRATE	0xf014
 #define AST_DP501_EDID_DATA	0xf020
 
-/*
- * Display Transmitter Type:
- */
-#define TX_TYPE_MASK				GENMASK(3, 1)
-#define NO_TX						(0 << 1)
-#define ITE66121_VBIOS_TX			(1 << 1)
-#define SI164_VBIOS_TX				(2 << 1)
-#define CH7003_VBIOS_TX			(3 << 1)
-#define DP501_VBIOS_TX				(4 << 1)
-#define ANX9807_VBIOS_TX			(5 << 1)
-#define TX_FW_EMBEDDED_FW_TX		(6 << 1)
-#define ASTDP_DPMCU_TX				(7 << 1)
-
-#define AST_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
-//#define AST_VRAM_INIT_BY_BMC		BIT(7)
-//#define AST_VRAM_INIT_READY		BIT(6)
-
-/* Define for Soc scratched reg used on ASTDP */
-#define AST_DP_PHY_SLEEP			BIT(4)
-#define AST_DP_VIDEO_ENABLE		BIT(0)
-
 #define AST_DP_POWER_ON			true
 #define AST_DP_POWER_OFF			false
 
-/*
- * CRD1[b5]: DP MCU FW is executing
- * CRDC[b0]: DP link success
- * CRDF[b0]: DP HPD
- * CRE5[b0]: Host reading EDID process is done
- */
-#define ASTDP_MCU_FW_EXECUTING			BIT(5)
-#define ASTDP_LINK_SUCCESS				BIT(0)
-#define ASTDP_HPD						BIT(0)
-#define ASTDP_HOST_EDID_READ_DONE		BIT(0)
-#define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
-
-/*
- * CRB8[b1]: Enable VSYNC off
- * CRB8[b0]: Enable HSYNC off
- */
-#define AST_DPMS_VSYNC_OFF				BIT(1)
-#define AST_DPMS_HSYNC_OFF				BIT(0)
-
-/*
- * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
- * Precondition:	A. ~AST_DP_PHY_SLEEP  &&
- *			B. DP_HPD &&
- *			C. DP_LINK_SUCCESS
- */
-#define ASTDP_MIRROR_VIDEO_ENABLE		BIT(4)
-
-#define ASTDP_EDID_READ_POINTER_MASK	GENMASK(7, 0)
-#define ASTDP_EDID_VALID_FLAG_MASK		GENMASK(0, 0)
-#define ASTDP_EDID_READ_DATA_MASK		GENMASK(7, 0)
-
-/*
- * ASTDP setmode registers:
- * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
- * CRE1[7:0]: MISC1 (default: 0x00)
- * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
- */
-#define ASTDP_MISC0_24bpp			BIT(5)
-#define ASTDP_MISC1				0
-#define ASTDP_AND_CLEAR_MASK		0x00
-
 /*
  * ASTDP resoultion table:
  * EX:	ASTDP_A_B_C:
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
new file mode 100644
index 0000000000000..555286ecf5209
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __AST_REG_H__
+#define __AST_REG_H__
+
+#include <linux/bits.h>
+
+/*
+ * Modesetting
+ */
+
+#define AST_IO_MM_OFFSET		(0x380)
+
+#define AST_IO_VGAARI_W			(0x40)
+#define AST_IO_VGAMR_W			(0x42)
+#define AST_IO_VGAER			(0x43)
+#define AST_IO_VGASRI			(0x44)
+#define AST_IO_VGADRR			(0x47)
+#define AST_IO_VGADWR			(0x48)
+#define AST_IO_VGAPDR		        (0x49)
+#define AST_IO_VGAGRI			(0x4E)
+
+#define AST_IO_VGACRI			(0x54)
+#define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
+#define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
+
+#define AST_IO_VGAIR1_R			(0x5A)
+#define AST_IO_VGAIR1_VREFRESH		BIT(3)
+
+#define AST_IO_VGAMR_R			(0x4C)
+
+/*
+ * Display Transmitter Type
+ */
+
+#define TX_TYPE_MASK			GENMASK(3, 1)
+#define NO_TX				(0 << 1)
+#define ITE66121_VBIOS_TX		(1 << 1)
+#define SI164_VBIOS_TX			(2 << 1)
+#define CH7003_VBIOS_TX			(3 << 1)
+#define DP501_VBIOS_TX			(4 << 1)
+#define ANX9807_VBIOS_TX		(5 << 1)
+#define TX_FW_EMBEDDED_FW_TX		(6 << 1)
+#define ASTDP_DPMCU_TX			(7 << 1)
+
+#define AST_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
+//#define AST_VRAM_INIT_BY_BMC		BIT(7)
+//#define AST_VRAM_INIT_READY		BIT(6)
+
+/*
+ * AST DisplayPort
+ */
+
+/* Define for Soc scratched reg used on ASTDP */
+#define AST_DP_PHY_SLEEP		BIT(4)
+#define AST_DP_VIDEO_ENABLE		BIT(0)
+
+/*
+ * CRD1[b5]: DP MCU FW is executing
+ * CRDC[b0]: DP link success
+ * CRDF[b0]: DP HPD
+ * CRE5[b0]: Host reading EDID process is done
+ */
+#define ASTDP_MCU_FW_EXECUTING		BIT(5)
+#define ASTDP_LINK_SUCCESS		BIT(0)
+#define ASTDP_HPD			BIT(0)
+#define ASTDP_HOST_EDID_READ_DONE	BIT(0)
+#define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
+
+/*
+ * CRB8[b1]: Enable VSYNC off
+ * CRB8[b0]: Enable HSYNC off
+ */
+#define AST_DPMS_VSYNC_OFF		BIT(1)
+#define AST_DPMS_HSYNC_OFF		BIT(0)
+
+/*
+ * CRDF[b4]: Mirror of AST_DP_VIDEO_ENABLE
+ * Precondition:	A. ~AST_DP_PHY_SLEEP  &&
+ *			B. DP_HPD &&
+ *			C. DP_LINK_SUCCESS
+ */
+#define ASTDP_MIRROR_VIDEO_ENABLE	BIT(4)
+
+#define ASTDP_EDID_READ_POINTER_MASK	GENMASK(7, 0)
+#define ASTDP_EDID_VALID_FLAG_MASK	GENMASK(0, 0)
+#define ASTDP_EDID_READ_DATA_MASK	GENMASK(7, 0)
+
+/*
+ * ASTDP setmode registers:
+ * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
+ * CRE1[7:0]: MISC1 (default: 0x00)
+ * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
+ */
+#define ASTDP_MISC0_24bpp		BIT(5)
+#define ASTDP_MISC1			0
+#define ASTDP_AND_CLEAR_MASK		0x00
+
+#endif
-- 
2.42.0

