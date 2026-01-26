Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lh4IvB0eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF491001
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B446E10E4D4;
	Tue, 27 Jan 2026 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kGXDrL4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876ED10E105
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:59:26 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-34b75fba315so2467832a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 00:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769417966; x=1770022766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXDjBlJc4nC9tIg8M6rHwWYuOcDKS6IrCHK8L8lQUno=;
 b=kGXDrL4ljU3WIQfyoezLOif06V2cJESnxhMMsl8E7X0rxCIoOgxBzQ2xaykkax2rlj
 TR9dmkz090iqlZ/gJazKY4w4fjXZpZaGbPUUH3UDvJMlj3T5Wb9zBSceCJm2zGGdS2Fg
 0bwXIAed1ZZfhojoEB8yvrB4WN1LGtLS8h1tDCxBmGYD/MuiF1jDZb53wYQjd2rMEmlH
 6GC8y4EncoqaxwMp5LJNZiSlYceJSPJ3WVfEMNmObZUhh22fb0vHdCu2GzuYBa3Rz5Qy
 mb8/AzSJdWlsbpUB7btwW1y0Ih8pKeFSprahkI6+s8Gu7AOx2UvQ7K9mCxNrVQ65MLtZ
 02Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769417966; x=1770022766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VXDjBlJc4nC9tIg8M6rHwWYuOcDKS6IrCHK8L8lQUno=;
 b=jf8JZMvY4LvNjc81imG7PCWliMdfqdNm6IgqzzpWC3MnEmAsGZRBPAWZ5T9+RKJPYD
 bVT7Ch2EtGPtgnivJnQT1XqRTnTTOerb3PgNgaTi/HRbcREpsHn5R59Y56c9rMMNSn+t
 1IpOSVM2HQPjxNShCYVQGVdBbGFotk0bbiIRFed2gZwldeTR6/djWPR2nxKZ/4iP8sM8
 xs/7CS2SPFb/vEToLJw5Bqi3SUueEvyUWdMRpqdZJG7JRFCEVllpUlDwWPtHFzX0K1xA
 xBir8eaM5OCADfeFd1R/8lB3gkdYpQyZ5n5WAUQliw7lGC6F0X8q0Zuv/6EswWNjxRKG
 lSCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIrVVt3Mxity1ikYRoxy3tDGiQ7LlB2l70D6YfXBb/o2OpALTbs6vmVHTyUn64M39wZltRPiyouP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWHZfhTF7FYvlPnmry8HjaO+ZPcp9MyoJorNOnt+JmCGLDFFlQ
 e/bsX1SF/WKwDGoBcRPonbzjTpo47PH5ZNKTyjDYOMUnQNPej1UV6/Ew
X-Gm-Gg: AZuq6aLSsamLgZIp0h7RDaz0v943ua+AK0MHw3pAGoVQC4iQ+JXJcoikwLh1vM4CgX7
 XUUGYmzxBTWKluwpbSBcogW77t3/UQV4yJ6nQ6hRZqIRM5b+wRaGQwIDVsfmbUbVsj/lO1uLkQh
 IottS8/XpdwgSy6ce2TVY/PEyO8vL8cIANmyylCGDLyC6V59XQau/8Sme+6yTn2haHu6PDH5Eie
 nFYxRQ7TR8ROoxniww6vNr012F6UCqbdwAMJT/pk6ztVz4cIHWWAycEYjCSvV3fXBnPtixiVl52
 e3jI/kmJEisyvCZvz5y0bLYqdItjpIzqFML0Q8/008OLySU+tWpXed8apK3QXJuUUEFzt887cJi
 T1ncp/CxLuvoLKxfrHZyWSHE50qDFIIJQwv33hp3NubtvlMvL3Rafra+HFZd7VU+C83EMbq/y33
 frX2ESl/MpzY3HlrBR8JEzChve87FopSVCEv+aZExWMwEanba2AKFO2aDfV6C30u+20Szt8fZa
X-Received: by 2002:a17:90b:4c8b:b0:353:100:2f20 with SMTP id
 98e67ed59e1d1-353c40e6493mr2979848a91.10.1769417965652; 
 Mon, 26 Jan 2026 00:59:25 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536dc3e0ecsm8251798a91.10.2026.01.26.00.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 00:59:24 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Date: Mon, 26 Jan 2026 16:57:27 +0800
Message-ID: <20260126085727.2568958-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126085727.2568958-1-a0987203069@gmail.com>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:a0987203069@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 10EF491001
X-Rspamd-Action: no action

Add DRM driver support for the Display Control Unit (DCU)
found in Nuvoton MA35D1 SoCs.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/Kconfig                  |   1 +
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/nuvoton/Kconfig          |  21 +
 drivers/gpu/drm/nuvoton/Makefile         |   7 +
 drivers/gpu/drm/nuvoton/ma35_crtc.c      | 445 +++++++++++
 drivers/gpu/drm/nuvoton/ma35_crtc.h      |  78 ++
 drivers/gpu/drm/nuvoton/ma35_drm.c       | 389 ++++++++++
 drivers/gpu/drm/nuvoton/ma35_drm.h       |  48 ++
 drivers/gpu/drm/nuvoton/ma35_interface.c | 192 +++++
 drivers/gpu/drm/nuvoton/ma35_interface.h |  30 +
 drivers/gpu/drm/nuvoton/ma35_plane.c     | 904 +++++++++++++++++++++++
 drivers/gpu/drm/nuvoton/ma35_plane.h     | 226 ++++++
 drivers/gpu/drm/nuvoton/ma35_regs.h      |  88 +++
 13 files changed, 2430 insertions(+)
 create mode 100644 drivers/gpu/drm/nuvoton/Kconfig
 create mode 100644 drivers/gpu/drm/nuvoton/Makefile
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_regs.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index a33b90251530..3645255bc458 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -309,6 +309,7 @@ source "drivers/gpu/drm/msm/Kconfig"
 source "drivers/gpu/drm/mxsfb/Kconfig"
 source "drivers/gpu/drm/nouveau/Kconfig"
 source "drivers/gpu/drm/nova/Kconfig"
+source "drivers/gpu/drm/nuvoton/Kconfig"
 source "drivers/gpu/drm/omapdrm/Kconfig"
 source "drivers/gpu/drm/panel/Kconfig"
 source "drivers/gpu/drm/panfrost/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0e1c668b46d2..4ded9547d7ff 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -235,6 +235,7 @@ obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
 obj-$(CONFIG_DRM_POWERVR) += imagination/
+obj-$(CONFIG_DRM_MA35) += nuvoton/
 
 # Ensure drm headers are self-contained and pass kernel-doc
 hdrtest-files := \
diff --git a/drivers/gpu/drm/nuvoton/Kconfig b/drivers/gpu/drm/nuvoton/Kconfig
new file mode 100644
index 000000000000..6bb970b9890c
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/Kconfig
@@ -0,0 +1,21 @@
+config DRM_MA35
+	tristate "Nuvoton MA35D1 LCD Display Controller"
+	default ARCH_MA35
+	depends on DRM
+	depends on OF && (ARCH_MA35 || COMPILE_TEST)
+	select DRM_KMS_HELPER
+	select DRM_KMS_DMA_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_BRIDGE
+	select DRM_PANEL_BRIDGE
+	select VIDEOMODE_HELPERS
+	select REGMAP_MMIO
+	help
+	  Choose this option to enable support for the Display Controller Unit (DCU)
+	  found in Nuvoton MA35D1 SoCs.
+
+	  This driver supports the DRM/KMS API for the MA35 display subsystem,
+	  handling display output via hardware composition layers.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called ma35-drm.
\ No newline at end of file
diff --git a/drivers/gpu/drm/nuvoton/Makefile b/drivers/gpu/drm/nuvoton/Makefile
new file mode 100644
index 000000000000..aac4113106b2
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/Makefile
@@ -0,0 +1,7 @@
+ma35-drm-y += \
+	ma35_drm.o \
+	ma35_plane.o \
+	ma35_crtc.o \
+	ma35_interface.o
+
+obj-$(CONFIG_DRM_MA35)	+= ma35-drm.o
diff --git a/drivers/gpu/drm/nuvoton/ma35_crtc.c b/drivers/gpu/drm/nuvoton/ma35_crtc.c
new file mode 100644
index 000000000000..d168351dcdbe
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_crtc.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#include "ma35_drm.h"
+
+#define ma35_crtc(c) \
+	container_of(c, struct ma35_crtc, drm_crtc)
+
+static const struct drm_prop_enum_list ma35_dpi_format[] = {
+	{ MA35_DPI_D16CFG1, "D16CFG1" },
+	{ MA35_DPI_D16CFG2, "D16CFG2" },
+	{ MA35_DPI_D16CFG3, "D16CFG3" },
+	{ MA35_DPI_D18CFG1, "D18CFG1" },
+	{ MA35_DPI_D18CFG2, "D18CFG2" },
+	{ MA35_DPI_D24, "D24" },
+};
+
+static enum drm_mode_status
+ma35_crtc_mode_valid(struct drm_crtc *drm_crtc,
+			const struct drm_display_mode *mode)
+{
+	struct drm_device *drm_dev = drm_crtc->dev;
+	struct drm_mode_config *mode_config = &drm_dev->mode_config;
+
+	/* check drm_mode_status for some limitations */
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_NO_INTERLACE;
+
+	if (mode->hdisplay > mode_config->max_width || mode->hdisplay < mode_config->min_width)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay > mode_config->max_height || mode->vdisplay < mode_config->min_height)
+		return MODE_BAD_VVALUE;
+
+	if (mode->clock > MA35_MAX_PIXEL_CLK)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static int ma35_crtc_atomic_check(struct drm_crtc *drm_crtc,
+					 struct drm_atomic_state *state)
+{
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, drm_crtc);
+	struct drm_display_mode *mode = &crtc_state->mode;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	int clk_rate;
+
+	if (mode->clock > MA35_MAX_PIXEL_CLK)
+		return MODE_CLOCK_HIGH;
+
+	/* check rounded pixel clock */
+	clk_rate = clk_round_rate(priv->dcupclk, mode->clock * 1000);
+	if (clk_rate <= 0)
+		return MODE_CLOCK_RANGE;
+
+	adjusted_mode->clock = DIV_ROUND_UP(clk_rate, 1000);
+
+	return 0;
+}
+
+static void ma35_crtc_atomic_enable(struct drm_crtc *drm_crtc,
+				       struct drm_atomic_state *state)
+{
+	struct ma35_crtc *crtc = ma35_crtc(drm_crtc);
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+	struct drm_crtc_state *new_state =
+		drm_atomic_get_new_crtc_state(state, drm_crtc);
+	struct drm_display_mode *mode = &new_state->adjusted_mode;
+	struct ma35_interface *interface = priv->interface;
+	struct drm_color_lut *lut;
+	int i, size;
+	u32 reg;
+
+	/* Timings */
+	reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->htotal) |
+		  FIELD_PREP(MA35_DISPLAY_ACTIVE_MASK, mode->hdisplay);
+	regmap_write(priv->regmap, MA35_HDISPLAY, reg);
+
+	reg = MA35_SYNC_PULSE_ENABLE |
+		  FIELD_PREP(MA35_SYNC_START_MASK, mode->hsync_start) |
+		  FIELD_PREP(MA35_SYNC_END_MASK, mode->hsync_end);
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		reg |= MA35_SYNC_POLARITY_BIT;
+	regmap_write(priv->regmap, MA35_HSYNC, reg);
+
+	reg = FIELD_PREP(MA35_DISPLAY_TOTAL_MASK, mode->vtotal) |
+		  FIELD_PREP(MA35_DISPLAY_ACTIVE_MASK, mode->vdisplay);
+	regmap_write(priv->regmap, MA35_VDISPLAY, reg);
+
+	reg = MA35_SYNC_PULSE_ENABLE |
+		  FIELD_PREP(MA35_SYNC_START_MASK, mode->vsync_start) |
+		  FIELD_PREP(MA35_SYNC_END_MASK, mode->vsync_end);
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		reg |= MA35_SYNC_POLARITY_BIT;
+	regmap_write(priv->regmap, MA35_VSYNC, reg);
+
+	/* Signals */
+	reg = MA35_PANEL_DATA_ENABLE_ENABLE | MA35_PANEL_DATA_ENABLE |
+		  MA35_PANEL_DATA_CLOCK_ENABLE;
+	if (interface->bus_flags & DRM_BUS_FLAG_DE_LOW)
+		reg |= MA35_PANEL_DATA_ENABLE_POLARITY;
+
+	if (interface->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+		reg |= MA35_PANEL_DATA_POLARITY;
+	regmap_write(priv->regmap, MA35_PANEL_CONFIG, reg);
+
+	/* Gamma */
+	if (new_state->gamma_lut) {
+		if (new_state->color_mgmt_changed) {
+			lut = new_state->gamma_lut->data;
+			size = new_state->gamma_lut->length / sizeof(struct drm_color_lut);
+
+			for (i = 0; i < size; i++) {
+				regmap_write(priv->regmap, MA35_GAMMA_INDEX, i);
+				/* shift DRM gamma 16-bit values to 10-bit */
+				reg = FIELD_PREP(MA35_GAMMA_RED_MASK, lut[i].red >> 6) |
+					  FIELD_PREP(MA35_GAMMA_GREEN_MASK, lut[i].green >> 6) |
+					  FIELD_PREP(MA35_GAMMA_BLUE_MASK, lut[i].blue >> 6);
+				regmap_write(priv->regmap, MA35_GAMMA_DATA, reg);
+			}
+		}
+		/* Enable gamma */
+		regmap_update_bits(priv->regmap, MA35_FRAMEBUFFER_CONFIG,
+						   MA35_PRIMARY_GAMMA, MA35_PRIMARY_GAMMA);
+	} else {
+		/* Disable gamma */
+		regmap_update_bits(priv->regmap, MA35_FRAMEBUFFER_CONFIG,
+						   MA35_PRIMARY_GAMMA, 0);
+	}
+
+	/* DPI format */
+	reg = FIELD_PREP(MA35_DPI_FORMAT_MASK, crtc->dpi_format);
+	regmap_write(priv->regmap, MA35_DPI_CONFIG, reg);
+
+	/* Dither */
+	if (crtc->dither_enable) {
+		for (i = 0, reg = 0; i < MA35_DITHER_TABLE_ENTRY / 2; i++)
+			reg |= (crtc->dither_depth & MA35_DITHER_TABLE_MASK) << (i * 4);
+
+		regmap_write(priv->regmap, MA35_DISPLAY_DITHER_TABLE_LOW, reg);
+		regmap_write(priv->regmap, MA35_DISPLAY_DITHER_TABLE_HIGH, reg);
+		regmap_write(priv->regmap, MA35_DISPLAY_DITHER_CONFIG, MA35_DITHER_ENABLE);
+	} else {
+		regmap_write(priv->regmap, MA35_DISPLAY_DITHER_CONFIG, 0);
+	}
+
+	drm_crtc_vblank_on(drm_crtc);
+}
+
+static void ma35_crtc_atomic_disable(struct drm_crtc *drm_crtc,
+					struct drm_atomic_state *state)
+{
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+	struct drm_device *drm_dev = drm_crtc->dev;
+
+	drm_crtc_vblank_off(drm_crtc);
+
+	/* Disable and clear CRTC bits. */
+	regmap_update_bits(priv->regmap, MA35_PANEL_CONFIG,
+					   MA35_PANEL_DATA_ENABLE_ENABLE, 0);
+	regmap_update_bits(priv->regmap, MA35_FRAMEBUFFER_CONFIG,
+					   MA35_PRIMARY_GAMMA, 0);
+	regmap_write(priv->regmap, MA35_DISPLAY_DITHER_CONFIG, 0);
+
+	/* Consume any leftover event since vblank is now disabled. */
+	if (drm_crtc->state->event && !drm_crtc->state->active) {
+		spin_lock_irq(&drm_dev->event_lock);
+
+		drm_crtc_send_vblank_event(drm_crtc, drm_crtc->state->event);
+		drm_crtc->state->event = NULL;
+		spin_unlock_irq(&drm_dev->event_lock);
+	}
+}
+
+static void ma35_crtc_atomic_flush(struct drm_crtc *drm_crtc,
+	struct drm_atomic_state *state)
+{
+	spin_lock_irq(&drm_crtc->dev->event_lock);
+	if (drm_crtc->state->event) {
+		if (drm_crtc_vblank_get(drm_crtc) == 0)
+			drm_crtc_arm_vblank_event(drm_crtc, drm_crtc->state->event);
+		else
+			drm_crtc_send_vblank_event(drm_crtc, drm_crtc->state->event);
+
+		drm_crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&drm_crtc->dev->event_lock);
+}
+
+static bool ma35_crtc_get_scanout_position(struct drm_crtc *drm_crtc,
+					   bool in_vblank_irq,
+					   int *vpos,
+					   int *hpos,
+					   ktime_t *stime,
+					   ktime_t *etime,
+					   const struct drm_display_mode *mode)
+{
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+	u32 reg;
+
+	if (stime)
+		*stime = ktime_get();
+
+	regmap_read(priv->regmap, MA35_DISPLAY_CURRENT_LOCATION, &reg);
+
+	*hpos = FIELD_GET(MA35_DISPLAY_CURRENT_X, reg);
+	*vpos = FIELD_GET(MA35_DISPLAY_CURRENT_Y, reg);
+
+	if (etime)
+		*etime = ktime_get();
+
+	return true;
+}
+
+static const struct drm_crtc_helper_funcs ma35_crtc_helper_funcs = {
+	.mode_valid		= ma35_crtc_mode_valid,
+	.atomic_check		= ma35_crtc_atomic_check,
+	.atomic_enable		= ma35_crtc_atomic_enable,
+	.atomic_disable		= ma35_crtc_atomic_disable,
+	.atomic_flush		= ma35_crtc_atomic_flush,
+	.get_scanout_position	= ma35_crtc_get_scanout_position,
+};
+
+static int ma35_crtc_enable_vblank(struct drm_crtc *drm_crtc)
+{
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+
+	regmap_write(priv->regmap, MA35_DISPLAY_INTRENABLE,
+			  MA35_CRTC_VBLANK);
+
+	return 0;
+}
+
+static void ma35_crtc_disable_vblank(struct drm_crtc *drm_crtc)
+{
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+
+	regmap_write(priv->regmap, MA35_DISPLAY_INTRENABLE, 0);
+}
+
+static u32 ma35_crtc_get_vblank_counter(struct drm_crtc *drm_crtc)
+{
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+
+	return atomic_read(&priv->crtc->vblank_counter);
+}
+
+static int ma35_crtc_gamma_set(struct drm_crtc *drm_crtc,
+		  u16 *r, u16 *g, u16 *b, uint32_t size,
+		  struct drm_modeset_acquire_ctx *ctx)
+{
+	struct ma35_drm *priv = ma35_drm(drm_crtc->dev);
+	u32 reg;
+	int i;
+
+	if (size != MA35_GAMMA_TABLE_SIZE)
+		return -EINVAL;
+
+	regmap_write(priv->regmap, MA35_GAMMA_INDEX, 0); // auto increment
+
+	for (i = 0; i < size; i++) {
+		reg = FIELD_PREP(MA35_GAMMA_RED_MASK, r[i]) |
+			  FIELD_PREP(MA35_GAMMA_GREEN_MASK, g[i]) |
+			  FIELD_PREP(MA35_GAMMA_BLUE_MASK, b[i]);
+		regmap_write(priv->regmap, MA35_GAMMA_DATA, reg);
+	}
+
+	return 0;
+}
+
+static int ma35_crtc_atomic_set_property(struct drm_crtc *drm_crtc,
+					 struct drm_crtc_state *state,
+					 struct drm_property *property,
+					 uint64_t value)
+{
+	struct ma35_crtc *crtc = ma35_crtc(drm_crtc);
+
+	if (property == crtc->dpi_format_prop)
+		crtc->dpi_format = value;
+	else if (property == crtc->dither_enable_prop)
+		crtc->dither_enable = value;
+	else if (property == crtc->dither_depth_prop)
+		crtc->dither_depth = value;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ma35_crtc_atomic_get_property(struct drm_crtc *drm_crtc,
+					 const struct drm_crtc_state *state,
+					 struct drm_property *property,
+					 uint64_t *value)
+{
+	struct ma35_crtc *crtc = ma35_crtc(drm_crtc);
+
+	if (property == crtc->dpi_format_prop)
+		*value = crtc->dpi_format;
+	else if (property == crtc->dither_enable_prop)
+		*value = crtc->dither_enable;
+	else if (property == crtc->dither_depth_prop)
+		*value = crtc->dither_depth;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct drm_crtc_funcs ma35_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= ma35_crtc_enable_vblank,
+	.disable_vblank		= ma35_crtc_disable_vblank,
+	.get_vblank_counter = ma35_crtc_get_vblank_counter,
+	.gamma_set      = ma35_crtc_gamma_set,
+	.atomic_set_property = ma35_crtc_atomic_set_property,
+	.atomic_get_property = ma35_crtc_atomic_get_property,
+};
+
+void ma35_crtc_vblank_handler(struct ma35_drm *priv)
+{
+	struct ma35_crtc *crtc = priv->crtc;
+
+	if (!crtc)
+		return;
+
+	atomic_inc(&crtc->vblank_counter);
+
+	drm_crtc_handle_vblank(&crtc->drm_crtc);
+}
+
+static int ma35_crtc_create_properties(struct ma35_drm *priv)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct ma35_crtc *crtc = priv->crtc;
+	struct drm_crtc *drm_crtc = &crtc->drm_crtc;
+
+	crtc->dpi_format_prop = drm_property_create_enum(drm_dev, 0,
+						"dpi-format",
+						ma35_dpi_format,
+						ARRAY_SIZE(ma35_dpi_format));
+	if (!crtc->dpi_format_prop) {
+		drm_err(drm_dev, "Failed to create dpi format property\n");
+		return -ENOMEM;
+	}
+	drm_object_attach_property(&drm_crtc->base, crtc->dpi_format_prop, MA35_DPI_D24);
+	crtc->dpi_format = MA35_DPI_D24;
+
+	crtc->dither_enable_prop = drm_property_create_bool(drm_dev, 0, "dither-enable");
+	if (!crtc->dither_enable_prop) {
+		drm_err(drm_dev, "Failed to create dither enable property\n");
+		return -ENOMEM;
+	}
+	drm_object_attach_property(&drm_crtc->base, crtc->dither_enable_prop, false);
+	crtc->dither_enable = false;
+
+	crtc->dither_depth_prop = drm_property_create_range(drm_dev, 0, "dither-depth",
+							0, 0xf);
+	if (!crtc->dither_depth_prop) {
+		drm_err(drm_dev, "Failed to create dither depth property\n");
+		return -ENOMEM;
+	}
+	drm_object_attach_property(&drm_crtc->base, crtc->dither_depth_prop, 0);
+	crtc->dither_depth = 0;
+
+	return 0;
+}
+
+int ma35_crtc_init(struct ma35_drm *priv)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct ma35_crtc *crtc;
+	struct ma35_layer *layer_primary, *layer_cursor;
+	struct drm_plane *cursor_plane = NULL;
+	int ret;
+
+	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
+	if (!crtc)
+		return -ENOMEM;
+
+	priv->crtc = crtc;
+	atomic_set(&crtc->vblank_counter, 0);
+
+	layer_primary = ma35_layer_get_from_type(priv, DRM_PLANE_TYPE_PRIMARY);
+	if (!layer_primary) {
+		drm_err(drm_dev, "Failed to get primary layer\n");
+		return -EINVAL;
+	}
+
+	layer_cursor = ma35_layer_get_from_type(priv, DRM_PLANE_TYPE_CURSOR);
+	if (layer_cursor)
+		cursor_plane = &layer_cursor->drm_plane;
+
+	/* attach primary and cursor */
+	ret = drm_crtc_init_with_planes(drm_dev, &crtc->drm_crtc,
+					&layer_primary->drm_plane, cursor_plane,
+					&ma35_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize CRTC\n");
+		return ret;
+	}
+
+	/* attach overlay */
+	ma35_overlay_attach_crtc(priv);
+
+	/* dither & gamma */
+	ret = ma35_crtc_create_properties(priv);
+	if (ret)
+		return ret;
+	ret = drm_mode_crtc_set_gamma_size(&crtc->drm_crtc, MA35_GAMMA_TABLE_SIZE);
+	if (ret)
+		return ret;
+	drm_crtc_enable_color_mgmt(&crtc->drm_crtc, 0, false, MA35_GAMMA_TABLE_SIZE);
+
+	drm_crtc_helper_add(&crtc->drm_crtc, &ma35_crtc_helper_funcs);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nuvoton/ma35_crtc.h b/drivers/gpu/drm/nuvoton/ma35_crtc.h
new file mode 100644
index 000000000000..71a41da21df7
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_crtc.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#ifndef _MA35_CRTC_H_
+#define _MA35_CRTC_H_
+
+#include <drm/drm_crtc.h>
+
+struct drm_pending_vblank_event;
+struct ma35_drm;
+
+enum ma35_dpi_format_enum {
+	MA35_DPI_D16CFG1,
+	MA35_DPI_D16CFG2,
+	MA35_DPI_D16CFG3,
+	MA35_DPI_D18CFG1,
+	MA35_DPI_D18CFG2,
+	MA35_DPI_D24,
+};
+
+#define MA35_DPI_FORMAT_MASK GENMASK(2, 0)
+
+struct ma35_crtc {
+	struct drm_crtc drm_crtc;
+	struct drm_property *dpi_format_prop;
+	struct drm_property *dither_depth_prop;
+	struct drm_property *dither_enable_prop;
+	atomic_t vblank_counter;
+	u32 dpi_format;
+	u16 dither_depth;
+	bool dither_enable;
+};
+
+#define MA35_DEFAULT_CRTC_ID	0
+
+#define MA35_MAX_PIXEL_CLK		150000
+
+#define MA35_GAMMA_TABLE_SIZE	256
+#define MA35_GAMMA_RED_MASK		GENMASK(29, 20)
+#define MA35_GAMMA_GREEN_MASK	GENMASK(19, 10)
+#define MA35_GAMMA_BLUE_MASK	GENMASK(9, 0)
+
+#define MA35_DITHER_TABLE_ENTRY	16
+#define MA35_DITHER_ENABLE		BIT(31)
+#define MA35_DITHER_TABLE_MASK	GENMASK(3, 0)
+
+#define MA35_CRTC_VBLANK		BIT(0)
+
+#define MA35_DEBUG_COUNTER_MASK		GENMASK(31, 0)
+
+#define MA35_PANEL_DATA_ENABLE_ENABLE	BIT(0)
+#define MA35_PANEL_DATA_ENABLE_POLARITY	BIT(1)
+#define MA35_PANEL_DATA_ENABLE			BIT(4)
+#define MA35_PANEL_DATA_POLARITY		BIT(5)
+#define MA35_PANEL_DATA_CLOCK_ENABLE	BIT(8)
+#define MA35_PANEL_DATA_CLOCK_POLARITY	BIT(9)
+
+#define MA35_DISPLAY_TOTAL_MASK		GENMASK(30, 16)
+#define MA35_DISPLAY_ACTIVE_MASK	GENMASK(14, 0)
+
+#define MA35_SYNC_POLARITY_BIT	BIT(31)
+#define MA35_SYNC_PULSE_ENABLE	BIT(30)
+#define MA35_SYNC_END_MASK		GENMASK(29, 15)
+#define MA35_SYNC_START_MASK	GENMASK(14, 0)
+
+#define MA35_DISPLAY_CURRENT_X	GENMASK(15, 0)
+#define MA35_DISPLAY_CURRENT_Y	GENMASK(31, 16)
+
+void ma35_crtc_vblank_handler(struct ma35_drm *priv);
+int ma35_crtc_init(struct ma35_drm *priv);
+
+#endif
diff --git a/drivers/gpu/drm/nuvoton/ma35_drm.c b/drivers/gpu/drm/nuvoton/ma35_drm.c
new file mode 100644
index 000000000000..b675f6d346b1
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_drm.c
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "ma35_drm.h"
+
+DEFINE_DRM_GEM_DMA_FOPS(ma35_drm_fops);
+
+static int ma35_drm_gem_dma_dumb_create(struct drm_file *file_priv,
+					   struct drm_device *drm_dev,
+					   struct drm_mode_create_dumb *args)
+{
+	struct drm_mode_config *mode_config = &drm_dev->mode_config;
+	u32 pixel_align;
+
+	if (args->width < mode_config->min_width ||
+		args->height < mode_config->min_height)
+		return -EINVAL;
+
+	/* check for alignment */
+	pixel_align = MA35_DISPLAY_ALIGN_PIXELS * args->bpp / 8;
+	args->pitch = ALIGN(args->width * args->bpp / 8, pixel_align);
+
+	return drm_gem_dma_dumb_create_internal(file_priv, drm_dev, args);
+}
+
+static struct drm_driver ma35_drm_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC |
+						  DRIVER_CURSOR_HOTSPOT,
+
+	.fops				= &ma35_drm_fops,
+	.name				= "ma35-drm",
+	.desc				= "Nuvoton MA35 series DRM driver",
+	.major				= DRIVER_MAJOR,
+	.minor				= DRIVER_MINOR,
+
+	DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(ma35_drm_gem_dma_dumb_create),
+};
+
+static const struct regmap_config ma35_drm_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x2000,
+	.name		= "ma35-drm",
+};
+
+static irqreturn_t ma35_drm_irq_handler(int irq, void *data)
+{
+	struct ma35_drm *priv = data;
+	irqreturn_t ret = IRQ_NONE;
+	u32 stat = 0;
+
+	/* Get pending interrupt sources (RO) */
+	regmap_read(priv->regmap, MA35_INT_STATE, &stat);
+
+	if (stat & MA35_INT_STATE_DISP0) {
+		ma35_crtc_vblank_handler(priv);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+static const struct drm_mode_config_funcs ma35_mode_config_funcs = {
+	.fb_create		= drm_gem_fb_create,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+};
+
+static const struct drm_mode_config_helper_funcs ma35_mode_config_helper_funcs = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail,
+};
+
+static int ma35_mode_init(struct ma35_drm *priv)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct drm_mode_config *mode_config = &drm_dev->mode_config;
+	int ret;
+
+	ret = drmm_mode_config_init(drm_dev);
+	if (ret) {
+		drm_err(drm_dev, "Failed to init mode config\n");
+		return -EINVAL;
+	}
+
+	drm_dev->max_vblank_count = MA35_DEBUG_COUNTER_MASK;
+	ret = drm_vblank_init(drm_dev, 1);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize vblank\n");
+		return ret;
+	}
+
+	mode_config->min_width = 32;
+	mode_config->max_width = 1920;
+	mode_config->min_height = 1;
+	mode_config->max_height = 1080;
+	mode_config->preferred_depth = 24;
+	mode_config->cursor_width = MA35_CURSOR_WIDTH;
+	mode_config->cursor_height = MA35_CURSOR_HEIGHT;
+	mode_config->funcs = &ma35_mode_config_funcs;
+	mode_config->helper_private = &ma35_mode_config_helper_funcs;
+
+	return 0;
+}
+
+static void ma35_mode_fini(struct ma35_drm *priv)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+
+	drm_kms_helper_poll_fini(drm_dev);
+}
+
+static int ma35_clocks_prepare(struct ma35_drm *priv)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct device *dev = drm_dev->dev;
+	int ret;
+
+	priv->dcuclk = devm_clk_get(dev, "dcu_gate");
+	if (IS_ERR(priv->dcuclk)) {
+		dev_err(dev, "Failed to get display core clock\n");
+		return PTR_ERR(priv->dcuclk);
+	}
+
+	ret = clk_prepare_enable(priv->dcuclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable display core clock\n");
+		return ret;
+	}
+
+	priv->dcupclk = devm_clk_get(dev, "dcup_div");
+	if (IS_ERR(priv->dcupclk)) {
+		dev_err(dev, "Failed to get display pixel clock\n");
+		return PTR_ERR(priv->dcupclk);
+	}
+
+	ret = clk_prepare_enable(priv->dcupclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable display pixel clock\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ma35_clocks_unprepare(struct ma35_drm *priv)
+{
+	struct clk **clocks[] = {
+		&priv->dcuclk,
+		&priv->dcupclk,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(clocks); i++) {
+		if (!*clocks[i])
+			continue;
+
+		clk_disable_unprepare(*clocks[i]);
+		*clocks[i] = NULL;
+	}
+
+	return 0;
+}
+
+static int ma35_drm_probe(struct platform_device *pdev)
+{
+	struct device_node *of_node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *mem_node;
+	struct resource res;
+	struct ma35_drm *priv;
+	struct drm_device *drm_dev;
+	void __iomem *base;
+	struct regmap *regmap = NULL;
+	int irq;
+	int ret;
+
+	/* Check for reserved memory. Fallback to dynamic allocation if undefined */
+	mem_node = of_parse_phandle(of_node, "memory-region", 0);
+	if (mem_node) {
+		ret = of_address_to_resource(mem_node, 0, &res);
+		if (ret) {
+			dev_err(dev, "Failed to parse reserved memory resource: %d\n", ret);
+			of_node_put(mem_node);
+			return ret;
+		}
+		of_node_put(mem_node);
+		dev_info(dev, "registering reserved memory %pR\n", &res);
+
+		ret = of_reserved_mem_device_init(dev);
+		if (ret && ret != -ENODEV) {
+			dev_err(dev, "Failed to init memory region\n");
+			goto error_early;
+		}
+	}
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "Failed to map I/O base\n");
+		ret = PTR_ERR(base);
+		goto error_reserved_mem;
+	}
+	regmap = devm_regmap_init_mmio(dev, base, &ma35_drm_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "Failed to create regmap for I/O\n");
+		ret = PTR_ERR(regmap);
+		goto error_reserved_mem;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = -ENODEV;
+		goto error_reserved_mem;
+	}
+
+	priv = devm_drm_dev_alloc(dev, &ma35_drm_driver,
+				     struct ma35_drm, drm_dev);
+	if (IS_ERR(priv)) {
+		ret = PTR_ERR(priv);
+		goto error_reserved_mem;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	drm_dev = &priv->drm_dev;
+	priv->regmap = regmap;
+	INIT_LIST_HEAD(&priv->layers_list);
+
+	ret = ma35_clocks_prepare(priv);
+	if (ret) {
+		drm_err(drm_dev, "Failed to prepare clocks\n");
+		goto error_reserved_mem;
+	}
+
+	ret = devm_request_irq(dev, irq, ma35_drm_irq_handler, 0,
+			       dev_name(dev), priv);
+	if (ret) {
+		drm_err(drm_dev, "Failed to request IRQ\n");
+		goto error_clocks;
+	}
+
+	/* modeset */
+	ret = ma35_mode_init(priv);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize KMS\n");
+		goto error_clocks;
+	}
+
+	/* plane */
+	ret = ma35_plane_init(priv);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize layers\n");
+		goto error_clocks;
+	}
+
+	/* crtc */
+	ret = ma35_crtc_init(priv);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize CRTC\n");
+		goto error_clocks;
+	}
+
+	/* interface */
+	ret = ma35_interface_init(priv);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			drm_err(drm_dev, "Failed to initialize interface\n");
+
+		goto error_clocks;
+	}
+
+	drm_mode_config_reset(drm_dev);
+
+	ret = drm_dev_register(drm_dev, 0);
+	if (ret) {
+		drm_err(drm_dev, "Failed to register DRM device\n");
+		goto error_mode;
+	}
+
+	drm_client_setup(drm_dev, NULL);
+
+	return 0;
+
+error_mode:
+	ma35_mode_fini(priv);
+
+error_clocks:
+	ma35_clocks_unprepare(priv);
+
+error_reserved_mem:
+	of_reserved_mem_device_release(dev);
+
+error_early:
+	return ret;
+}
+
+static void ma35_drm_remove(struct platform_device *pdev)
+{
+	struct ma35_drm *priv = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct drm_device *drm_dev = &priv->drm_dev;
+
+	drm_dev_unregister(drm_dev);
+	drm_atomic_helper_shutdown(drm_dev);
+
+	ma35_mode_fini(priv);
+
+	ma35_clocks_unprepare(priv);
+
+	of_reserved_mem_device_release(dev);
+}
+
+static void ma35_drm_shutdown(struct platform_device *pdev)
+{
+	struct ma35_drm *priv = platform_get_drvdata(pdev);
+	struct drm_device *drm_dev = &priv->drm_dev;
+
+	drm_atomic_helper_shutdown(drm_dev);
+}
+
+static __maybe_unused int ma35_drm_suspend(struct device *dev)
+{
+	struct ma35_drm *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = &priv->drm_dev;
+
+	return drm_mode_config_helper_suspend(drm_dev);
+}
+
+static __maybe_unused int ma35_drm_resume(struct device *dev)
+{
+	struct ma35_drm *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = &priv->drm_dev;
+
+	return drm_mode_config_helper_resume(drm_dev);
+}
+
+static const struct of_device_id ma35_drm_of_table[] = {
+	{ .compatible = "nuvoton,ma35d1-dcu" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ma35_drm_of_table);
+
+static const struct dev_pm_ops ma35_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(ma35_drm_suspend, ma35_drm_resume)
+};
+
+static struct platform_driver ma35_drm_platform_driver = {
+	.probe		= ma35_drm_probe,
+	.remove		= ma35_drm_remove,
+	.shutdown	= ma35_drm_shutdown,
+	.driver		= {
+		.name		= "ma35-drm",
+		.of_match_table	= ma35_drm_of_table,
+		.pm = &ma35_pm_ops,
+	},
+};
+
+module_platform_driver(ma35_drm_platform_driver);
+
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton MA35 series DRM driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/nuvoton/ma35_drm.h b/drivers/gpu/drm/nuvoton/ma35_drm.h
new file mode 100644
index 000000000000..68da6b11a323
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_drm.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#ifndef _MA35_DRM_H_
+#define _MA35_DRM_H_
+
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <drm/drm_device.h>
+
+#include "ma35_regs.h"
+#include "ma35_plane.h"
+#include "ma35_crtc.h"
+#include "ma35_interface.h"
+
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+#define MA35_INT_STATE_DISP0	BIT(0)
+
+#define MA35_DISPLAY_ALIGN_PIXELS	32
+#define MA35_DISPLAY_PREFER_DEPTH	32
+
+#define MA35_CURSOR_WIDTH	32
+#define MA35_CURSOR_HEIGHT	32
+
+#define MA35_DISPLAY_MAX_ZPOS	3
+
+#define ma35_drm(d) \
+	container_of(d, struct ma35_drm, drm_dev)
+
+struct ma35_drm {
+	struct drm_device drm_dev;
+	struct regmap *regmap;
+	struct list_head layers_list;
+	struct ma35_crtc *crtc;
+	struct ma35_interface *interface;
+	struct clk *dcuclk;
+	struct clk *dcupclk;
+};
+
+#endif
diff --git a/drivers/gpu/drm/nuvoton/ma35_interface.c b/drivers/gpu/drm/nuvoton/ma35_interface.c
new file mode 100644
index 000000000000..48d1535ace2f
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_interface.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/types.h>
+#include <linux/clk.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "ma35_drm.h"
+
+#define ma35_encoder(e) \
+	container_of(e, struct ma35_interface, drm_encoder)
+#define ma35_connector(c) \
+	container_of(c, struct ma35_interface, drm_connector)
+
+static void ma35_encoder_mode_set(struct drm_encoder *encoder,
+	struct drm_crtc_state *crtc_state,
+	struct drm_connector_state *conn_state)
+{
+	struct drm_device *drm_dev = encoder->dev;
+	struct ma35_drm *priv = ma35_drm(drm_dev);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	int result;
+
+	clk_set_rate(priv->dcupclk, adjusted_mode->clock * 1000);
+	result = DIV_ROUND_UP(clk_get_rate(priv->dcupclk), 1000);
+	drm_dbg(drm_dev, "Pixel clock: %d kHz; request : %d kHz\n", result, adjusted_mode->clock);
+}
+
+static int ma35_encoder_atomic_check(struct drm_encoder *encoder,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct ma35_interface *interface = ma35_encoder(encoder);
+	struct drm_display_info *display_info = &conn_state->connector->display_info;
+
+	interface->bus_flags = display_info->bus_flags;
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs ma35_encoder_helper_funcs = {
+	.atomic_mode_set	= ma35_encoder_mode_set,
+	.atomic_check		= ma35_encoder_atomic_check,
+};
+
+static const struct drm_connector_funcs ma35_connector_funcs = {
+	.reset			= drm_atomic_helper_connector_reset,
+	.fill_modes		= drm_helper_probe_single_connector_modes,
+	.destroy		= drm_connector_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+};
+
+static int ma35_connector_get_modes(struct drm_connector *drm_connector)
+{
+	struct ma35_drm *priv = ma35_drm(drm_connector->dev);
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct drm_mode_config *mode_config = &drm_dev->mode_config;
+	struct ma35_interface *interface = ma35_connector(drm_connector);
+	int count;
+
+	if (!interface->drm_panel) {
+		/* Use the default modes */
+		count = drm_add_modes_noedid(drm_connector,
+				mode_config->max_width, mode_config->max_height);
+		drm_set_preferred_mode(drm_connector,
+				mode_config->max_width, mode_config->max_height);
+
+		return count;
+	} else {
+		return drm_panel_get_modes(interface->drm_panel, drm_connector);
+	}
+}
+
+static const struct drm_connector_helper_funcs ma35_connector_helper_funcs = {
+	.get_modes		= ma35_connector_get_modes,
+};
+
+static void ma35_encoder_attach_crtc(struct ma35_drm *priv)
+{
+	uint32_t possible_crtcs = drm_crtc_mask(&priv->crtc->drm_crtc);
+
+	priv->interface->drm_encoder.possible_crtcs = possible_crtcs;
+}
+
+static int ma35_bridge_try_attach(struct ma35_drm *priv, struct ma35_interface *interface)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct device_node *of_node = dev->of_node;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(of_node, 0, 0, &panel, &bridge);
+
+	if (ret) {
+		drm_info(drm_dev, "No panel or bridge found\n");
+		return ret;
+	}
+
+	if (panel) {
+		bridge = drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DPI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	}
+
+	interface->drm_panel = panel;
+	interface->drm_bridge = bridge;
+
+	ret = drm_bridge_attach(&interface->drm_encoder, bridge,
+				NULL, 0);
+	if (ret) {
+		drm_err(drm_dev, "Failed to attach bridge to encoder\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+int ma35_interface_init(struct ma35_drm *priv)
+{
+	struct ma35_interface *interface;
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct drm_encoder *drm_encoder;
+	int ret;
+
+	/* encoder */
+	interface = drmm_simple_encoder_alloc(drm_dev,
+					struct ma35_interface, drm_encoder, DRM_MODE_ENCODER_DPI);
+	if (!interface) {
+		drm_err(drm_dev, "Failed to initialize encoder\n");
+		goto error_early;
+	}
+	priv->interface = interface;
+	drm_encoder = &interface->drm_encoder;
+	drm_encoder_helper_add(drm_encoder,
+			       &ma35_encoder_helper_funcs);
+
+	/* attach encoder to crtc */
+	ma35_encoder_attach_crtc(priv);
+
+	/* attach bridge to encoder if found one in device tree */
+	ret = ma35_bridge_try_attach(priv, interface);
+	if (!ret)
+		return 0;
+
+	/* fallback to raw dpi connector */
+	ret = drm_connector_init(drm_dev, &interface->drm_connector,
+					&ma35_connector_funcs,
+					DRM_MODE_CONNECTOR_DPI);
+	if (ret) {
+		drm_err(drm_dev, "Failed to initialize connector\n");
+		goto error_encoder;
+	}
+	drm_connector_helper_add(&interface->drm_connector,
+						&ma35_connector_helper_funcs);
+	ret = drm_connector_attach_encoder(&interface->drm_connector,
+						drm_encoder);
+	if (ret) {
+		drm_err(drm_dev,
+			"Failed to attach connector to encoder\n");
+		goto error_encoder;
+	}
+
+	return ret;
+
+error_encoder:
+	drm_encoder_cleanup(drm_encoder);
+
+error_early:
+	return ret;
+}
diff --git a/drivers/gpu/drm/nuvoton/ma35_interface.h b/drivers/gpu/drm/nuvoton/ma35_interface.h
new file mode 100644
index 000000000000..db7ed41bee45
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_interface.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#ifndef _MA35_INTERFACE_H_
+#define _MA35_INTERFACE_H_
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+
+struct ma35_drm;
+
+struct ma35_interface {
+	struct drm_encoder drm_encoder;
+	struct drm_connector drm_connector;
+	struct drm_panel *drm_panel;
+	struct drm_bridge *drm_bridge;
+
+	u32 bus_flags;
+};
+
+int ma35_interface_init(struct ma35_drm *priv);
+
+#endif
diff --git a/drivers/gpu/drm/nuvoton/ma35_plane.c b/drivers/gpu/drm/nuvoton/ma35_plane.c
new file mode 100644
index 000000000000..3449cd33059a
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_plane.c
@@ -0,0 +1,904 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/of.h>
+#include <linux/types.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#include "ma35_drm.h"
+
+#define ma35_layer(p) \
+	container_of(p, struct ma35_layer, drm_plane)
+
+static uint32_t ma35_layer_formats[] = {
+	/* rgb32 */
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB2101010,
+	/* rgb16 */
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_RGB565,
+	/* yuv */
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_P010,
+};
+
+static uint32_t ma35_cursor_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static struct ma35_plane_property ma35_plane_properties[] = {
+	{ /* overlay */
+		.fb_addr    = { MA35_OVERLAY_ADDRESS,
+						MA35_OVERLAY_UPLANAR_ADDRESS,
+						MA35_OVERLAY_VPLANAR_ADDRESS },
+		.fb_stride  = { MA35_OVERLAY_STRIDE,
+						MA35_OVERLAY_USTRIDE,
+						MA35_OVERLAY_VSTRIDE },
+		.alpha      = true,
+		.swizzle    = true,
+		.colorkey   = true, // ARGB only, replaced with primary
+		.background = false,
+		.foreground = false,
+	},
+	{ /* primary */
+		.fb_addr    = { MA35_FRAMEBUFFER_ADDRESS,
+						MA35_FRAMEBUFFER_UPLANAR_ADDRESS,
+						MA35_FRAMEBUFFER_VPLANAR_ADDRESS },
+		.fb_stride  = { MA35_FRAMEBUFFER_STRIDE,
+						MA35_FRAMEBUFFER_USTRIDE,
+						MA35_FRAMEBUFFER_VSTRIDE },
+		.alpha      = false,
+		.swizzle    = true,
+		.colorkey   = true, // ARGB only, replaced with background
+		.background = true,
+		.foreground = false,
+	},
+	{ /* cursor */
+		.alpha      = false,
+		.swizzle    = false,
+		.colorkey   = false,
+		.background = true,
+		.foreground = true,
+	},
+};
+
+static const struct drm_prop_enum_list ma35_blend_modes[] = {
+	{ MA35_ALPHA_CLEAR, "CLEAR" },
+	{ MA35_ALPHA_SRC, "SRC" },
+	{ MA35_ALPHA_DST, "DST" },
+	{ MA35_ALPHA_SRC_OVER, "SRC_OVER" },
+	{ MA35_ALPHA_DST_OVER, "DST_OVER" },
+	{ MA35_ALPHA_SRC_IN, "SRC_IN" },
+	{ MA35_ALPHA_DST_IN, "DST_IN" },
+	{ MA35_ALPHA_SRC_OUT, "SRC_OUT" },
+	{ MA35_ALPHA_DST_OUT, "DST_OUT" },
+	{ MA35_ALPHA_SRC_ATOP, "SRC_ATOP" },
+	{ MA35_ALPHA_DST_ATOP, "DST_ATOP" },
+	{ MA35_ALPHA_XOR, "XOR" },
+};
+
+static const struct drm_prop_enum_list ma35_alpha_modes[] = {
+	{ MA35_ALPHA_MODE_NONE, "None" },
+	{ MA35_ALPHA_MODE_GLOBAL, "Coverage" },
+};
+
+static const struct drm_prop_enum_list ma35_swizzles[] = {
+	{ MA35_SWIZZLE_ARGB, "ARGB" },
+	{ MA35_SWIZZLE_RGBA, "RGBA" },
+	{ MA35_SWIZZLE_ABGR, "ABGR" },
+	{ MA35_SWIZZLE_BGRA, "BGRA" },
+	{ MA35_SWIZZLE_UV, "UV" },
+};
+
+static int ma35_layer_format_validate(u32 fourcc, u32 *format)
+{
+	switch (fourcc) {
+	case DRM_FORMAT_XRGB4444:
+		*format = MA35_FORMAT_X4R4G4B4;
+		break;
+	case DRM_FORMAT_ARGB4444:
+		*format = MA35_FORMAT_A4R4G4B4;
+		break;
+	case DRM_FORMAT_XRGB1555:
+		*format = MA35_FORMAT_X1R5G5B5;
+		break;
+	case DRM_FORMAT_ARGB1555:
+		*format = MA35_FORMAT_A1R5G5B5;
+		break;
+	case DRM_FORMAT_RGB565:
+		*format = MA35_FORMAT_R5G6B5;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		*format = MA35_FORMAT_X8R8G8B8;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		*format = MA35_FORMAT_A8R8G8B8;
+		break;
+	case DRM_FORMAT_ARGB2101010:
+		*format = MA35_FORMAT_A2R10G10B10;
+		break;
+	case DRM_FORMAT_YUYV:
+		*format = MA35_FORMAT_YUY2;
+		break;
+	case DRM_FORMAT_UYVY:
+		*format = MA35_FORMAT_UYVY;
+		break;
+	case DRM_FORMAT_YVU420:
+		*format = MA35_FORMAT_YV12;
+		break;
+	case DRM_FORMAT_NV12:
+		*format = MA35_FORMAT_NV12;
+		break;
+	case DRM_FORMAT_NV16:
+		*format = MA35_FORMAT_NV16;
+		break;
+	case DRM_FORMAT_P010:
+		*format = MA35_FORMAT_P010;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ma35_layer_blend_mode_select(u32 mode, u32 *reg)
+{
+	u32 ret = 0;
+
+	switch (mode) {
+	case MA35_ALPHA_CLEAR:
+		*reg = MA35_BLEND_MODE_CLEAR;
+		break;
+	case MA35_ALPHA_SRC:
+		*reg = MA35_BLEND_MODE_SRC;
+		break;
+	case MA35_ALPHA_DST:
+		*reg = MA35_BLEND_MODE_DST;
+		break;
+	case MA35_ALPHA_SRC_OVER:
+		*reg = MA35_BLEND_MODE_SRC_OVER;
+		break;
+	case MA35_ALPHA_DST_OVER:
+		*reg = MA35_BLEND_MODE_DST_OVER;
+		break;
+	case MA35_ALPHA_SRC_IN:
+		*reg = MA35_BLEND_MODE_SRC_IN;
+		break;
+	case MA35_ALPHA_DST_IN:
+		*reg = MA35_BLEND_MODE_DST_IN;
+		break;
+	case MA35_ALPHA_SRC_OUT:
+		*reg = MA35_BLEND_MODE_SRC_OUT;
+		break;
+	case MA35_ALPHA_DST_OUT:
+		*reg = MA35_BLEND_MODE_DST_OUT;
+		break;
+	case MA35_ALPHA_SRC_ATOP:
+		*reg = MA35_BLEND_MODE_SRC_ATOP;
+		break;
+	case MA35_ALPHA_DST_ATOP:
+		*reg = MA35_BLEND_MODE_DST_ATOP;
+		break;
+	case MA35_ALPHA_XOR:
+		*reg = MA35_BLEND_MODE_XOR;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int ma35_plane_atomic_check(struct drm_plane *drm_plane,
+				      struct drm_atomic_state *state)
+{
+	struct drm_device *drm_dev = drm_plane->dev;
+	struct ma35_layer *layer = ma35_layer(drm_plane);
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, drm_plane);
+	struct drm_crtc *crtc = new_state->crtc;
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_crtc_state *crtc_state;
+	bool can_position;
+	u32 format;
+
+	if (!crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	if (new_state->crtc_x < 0 || new_state->crtc_y < 0) {
+		drm_err(drm_dev,
+			"Negative on-CRTC positions are not supported.\n");
+		return -EINVAL;
+	}
+
+	if (layer->config.blend_mode > MA35_ALPHA_XOR) {
+		drm_err(drm_dev, "Invalid blend mode\n");
+		return -EINVAL;
+	}
+
+	if (layer->config.swizzle > MA35_SWIZZLE_UV) {
+		drm_err(drm_dev, "Invalid swizzle mode\n");
+		return -EINVAL;
+	}
+
+	if ((layer->config.swizzle & MA35_SWIZZLE_ARGB_MASK) &&
+		fb->format->is_yuv) {
+		drm_err(drm_dev, "Invalid swizzle mode for RGB format\n");
+		return -EINVAL;
+	}
+
+	if ((layer->config.swizzle & MA35_SWIZZLE_UV_MASK) &&
+		!fb->format->is_yuv) {
+		drm_err(drm_dev, "Invalid swizzle mode for YUV format\n");
+		return -EINVAL;
+	}
+
+	if (ma35_layer_format_validate(fb->format->format, &format) < 0) {
+		drm_err(drm_dev, "Unsupported format\n");
+		return -EINVAL;
+	}
+
+	can_position = (drm_plane->type != DRM_PLANE_TYPE_PRIMARY);
+	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						  DRM_PLANE_NO_SCALING, DRM_PLANE_NO_SCALING,
+						  can_position, true);
+}
+
+static int ma35_cursor_plane_atomic_check(struct drm_plane *drm_plane,
+				      struct drm_atomic_state *state)
+{
+	struct drm_device *drm_dev = drm_plane->dev;
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, drm_plane);
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_crtc *crtc = new_state->crtc;
+	struct drm_crtc_state *crtc_state;
+
+	if (!fb)
+		return 0;
+
+	if (!crtc)
+		return -EINVAL;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	if (fb->format->format != DRM_FORMAT_XRGB8888) {
+		drm_err(drm_dev, "Invalid cursor format\n");
+		return -EINVAL;
+	}
+
+	if (new_state->crtc_w != MA35_CURSOR_SIZE || new_state->crtc_h != MA35_CURSOR_SIZE) {
+		drm_err(drm_dev, "Unsupported cursor size: %ux%u\n",
+				new_state->crtc_w, new_state->crtc_h);
+		return -EINVAL;
+	}
+
+	if (new_state->hotspot_x >= 32 || new_state->hotspot_x < 0 ||
+		new_state->hotspot_y >= 32 || new_state->hotspot_y < 0) {
+		drm_err(drm_dev, "Invalid cursor hotspot offset\n");
+		return -EINVAL;
+	}
+
+	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
+						  DRM_PLANE_NO_SCALING, DRM_PLANE_NO_SCALING,
+						  true, true);
+}
+
+static int ma35_cursor_plane_atomic_async_check(struct drm_plane *drm_plane,
+				      struct drm_atomic_state *state, bool flip)
+{
+	return ma35_cursor_plane_atomic_check(drm_plane, state);
+}
+
+static void ma35_overlay_position_update(struct ma35_drm *priv,
+						int x, int y, uint32_t w, uint32_t h)
+{
+	u32 reg;
+	int right, bottom;
+
+	right = x + w;
+	bottom = y + h;
+
+	x = (x < 0) ? 0 : x;
+	y = (y < 0) ? 0 : y;
+	right = (right < 0) ? 0 : right;
+	bottom = (bottom < 0) ? 0 : bottom;
+
+	reg = FIELD_PREP(MA35_OVERLAY_POSITION_X_MASK, x) |
+		  FIELD_PREP(MA35_OVERLAY_POSITION_Y_MASK, y);
+	regmap_write(priv->regmap, MA35_OVERLAY_TL, reg);
+
+	reg = FIELD_PREP(MA35_OVERLAY_POSITION_X_MASK, right) |
+		  FIELD_PREP(MA35_OVERLAY_POSITION_Y_MASK, bottom);
+	regmap_write(priv->regmap, MA35_OVERLAY_BR, reg);
+}
+
+static void ma35_plane_atomic_update(struct drm_plane *drm_plane,
+					struct drm_atomic_state *state)
+{
+	struct ma35_layer *layer = ma35_layer(drm_plane);
+	struct ma35_drm *priv = ma35_drm(drm_plane->dev);
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, drm_plane);
+	struct drm_framebuffer *fb = new_state->fb;
+	u32 format, reg;
+	u32 *preg;
+
+	ma35_layer_format_validate(fb->format->format, &format);
+
+	if (drm_plane->type == DRM_PLANE_TYPE_PRIMARY) {
+		reg = FIELD_PREP(MA35_PRIMARY_FORMAT_MASK, format) |
+			  FIELD_PREP(MA35_PRIMARY_SWIZZLE_MASK, layer->config.swizzle) |
+			  MA35_PRIMARY_RESET | MA35_PRIMARY_ENABLE;
+		if (layer->config.colorkeylo || layer->config.colorkeyup)
+			reg |= FIELD_PREP(MA35_PRIMARY_TRANSPARENCY_MASK, MA35_COLORKEY_ENABLE);
+		else
+			reg |= FIELD_PREP(MA35_PRIMARY_TRANSPARENCY_MASK, MA35_COLORKEY_DISABLE);
+
+		regmap_write(priv->regmap, MA35_FRAMEBUFFER_CONFIG, reg);
+
+		reg = FIELD_PREP(MA35_LAYER_FB_HEIGHT, fb->height) |
+			  FIELD_PREP(MA35_LAYER_FB_WIDTH, fb->width);
+		regmap_write(priv->regmap, MA35_FRAMEBUFFER_SIZE, reg);
+
+		/* background */
+		regmap_write(priv->regmap, MA35_FRAMEBUFFER_BGCOLOR, layer->config.background);
+
+		/* clear value */
+		regmap_write(priv->regmap, MA35_FRAMEBUFFER_CLEARVALUE, 0);
+
+		/* colorkey */
+		regmap_write(priv->regmap, MA35_FRAMEBUFFER_COLORKEY, layer->config.colorkeylo);
+		regmap_write(priv->regmap, MA35_FRAMEBUFFER_COLORHIGHKEY, layer->config.colorkeyup);
+	} else if (drm_plane->type == DRM_PLANE_TYPE_OVERLAY) {
+		reg = FIELD_PREP(MA35_OVERLAY_FORMAT_MASK, format) |
+			  FIELD_PREP(MA35_OVERLAY_SWIZZLE_MASK, layer->config.swizzle) |
+			  MA35_OVERLAY_ENABLE;
+		if (layer->config.colorkeylo || layer->config.colorkeyup)
+			reg |= FIELD_PREP(MA35_OVERLAY_TRANSPARENCY_MASK, MA35_COLORKEY_ENABLE);
+		else
+			reg |= FIELD_PREP(MA35_OVERLAY_TRANSPARENCY_MASK, MA35_COLORKEY_DISABLE);
+
+		regmap_write(priv->regmap, MA35_OVERLAY_CONFIG, reg);
+
+		reg = FIELD_PREP(MA35_LAYER_FB_HEIGHT, fb->height) |
+			FIELD_PREP(MA35_LAYER_FB_WIDTH, fb->width);
+		regmap_write(priv->regmap, MA35_OVERLAY_SIZE, reg);
+		/* can_position */
+		ma35_overlay_position_update(priv, new_state->crtc_x, new_state->crtc_y,
+			new_state->crtc_w, new_state->crtc_h);
+		/* alpha blending */
+		if (fb->format->format == DRM_FORMAT_ARGB8888) {
+			ma35_layer_blend_mode_select(layer->config.blend_mode, &reg);
+			reg |= FIELD_PREP(MA35_SRC_ALPHA_MODE, (u32)layer->config.alpha_mode[0]) |
+				FIELD_PREP(MA35_DST_ALPHA_MODE, (u32)layer->config.alpha_mode[1]);
+			regmap_write(priv->regmap, MA35_OVERLAY_ALPHA_BLEND_CONFIG, reg);
+
+			regmap_write(priv->regmap, MA35_OVERLAY_SRC_GLOBAL_COLOR,
+						 layer->config.src_color);
+			regmap_write(priv->regmap, MA35_OVERLAY_DST_GLOBAL_COLOR,
+						 layer->config.dst_color);
+		} else {
+			regmap_update_bits(priv->regmap, MA35_OVERLAY_ALPHA_BLEND_CONFIG,
+				MA35_ALPHA_BLEND_DISABLE, MA35_ALPHA_BLEND_DISABLE);
+		}
+
+		/* clear value */
+		regmap_write(priv->regmap, MA35_OVERLAY_CLEAR_VALUE, 0);
+
+		/* colorkey */
+		regmap_write(priv->regmap, MA35_OVERLAY_COLOR_KEY, layer->config.colorkeylo);
+		regmap_write(priv->regmap, MA35_OVERLAY_COLOR_KEY_HIGH, layer->config.colorkeyup);
+	}
+
+	/* retrieves DMA address set by userspace */
+	for (int i = 0; i < fb->format->num_planes; i++) {
+		layer->fb_base[i] = drm_fb_dma_get_gem_addr(fb, new_state, i);
+		preg = ma35_plane_properties[drm_plane->type].fb_addr;
+		regmap_write(priv->regmap, preg[i], layer->fb_base[i]);
+		preg = ma35_plane_properties[drm_plane->type].fb_stride;
+		regmap_write(priv->regmap, preg[i], fb->pitches[i]);
+	}
+}
+
+static void ma35_cursor_position_update(struct ma35_drm *priv, int x, int y)
+{
+	u32 reg;
+
+	x = (x < 0) ? 0 : x;
+	y = (y < 0) ? 0 : y;
+
+	reg = FIELD_PREP(MA35_CURSOR_X_MASK, x) |
+		  FIELD_PREP(MA35_CURSOR_Y_MASK, y);
+	regmap_write(priv->regmap, MA35_CURSOR_LOCATION, reg);
+}
+
+static void ma35_cursor_plane_atomic_update(struct drm_plane *drm_plane,
+					struct drm_atomic_state *state)
+{
+	struct ma35_layer *layer = ma35_layer(drm_plane);
+	struct ma35_drm *priv = ma35_drm(drm_plane->dev);
+	struct drm_plane_state *old_state =
+		drm_atomic_get_old_plane_state(state, drm_plane);
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, drm_plane);
+	struct drm_framebuffer *old_fb = old_state->fb;
+	struct drm_framebuffer *new_fb = new_state->fb;
+	u32 reg;
+
+	if (!new_state->visible) {
+		regmap_update_bits(priv->regmap, MA35_CURSOR_CONFIG,
+			MA35_CURSOR_FORMAT_MASK, MA35_CURSOR_FORMAT_DISABLE);
+		return;
+	}
+
+	/* update position */
+	ma35_cursor_position_update(priv, new_state->crtc_x, new_state->crtc_y);
+
+	/* check new_state is different from old_state for dimensions or format changed */
+	if (!old_fb || old_fb != new_fb) {
+		layer->fb_base[0] = drm_fb_dma_get_gem_addr(new_fb, new_state, 0);
+		regmap_write(priv->regmap, MA35_CURSOR_ADDRESS, layer->fb_base[0]);
+
+		regmap_write(priv->regmap, MA35_CURSOR_BACKGROUND, layer->config.background);
+		regmap_write(priv->regmap, MA35_CURSOR_FOREGROUND, layer->config.foreground);
+		regmap_update_bits(priv->regmap, MA35_CURSOR_CONFIG,
+			MA35_CURSOR_FORMAT_MASK, MA35_CURSOR_FORMAT_A8R8G8B8);
+	}
+
+	/* update hotspot offset & format */
+	if (old_state->hotspot_x != new_state->hotspot_x ||
+		old_state->hotspot_y != new_state->hotspot_y) {
+		reg = MA35_CURSOR_FORMAT_A8R8G8B8 |
+			FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
+			FIELD_PREP(MA35_CURSOR_HOTSPOT_Y_MASK, new_state->hotspot_y);
+		regmap_write(priv->regmap, MA35_CURSOR_CONFIG, reg);
+	}
+}
+
+static void ma35_cursor_plane_atomic_async_update(struct drm_plane *drm_plane,
+					struct drm_atomic_state *state)
+{
+	struct ma35_layer *layer = ma35_layer(drm_plane);
+	struct ma35_drm *priv = ma35_drm(drm_plane->dev);
+	struct drm_plane_state *old_state = drm_plane->state;
+	struct drm_plane_state *new_state =
+		drm_atomic_get_new_plane_state(state, drm_plane);
+	struct drm_framebuffer *old_fb = old_state->fb;
+	struct drm_framebuffer *new_fb = new_state->fb;
+	u32 reg;
+
+	/* update the current one with the new plane state */
+	old_state->crtc_x = new_state->crtc_x;
+	old_state->crtc_y = new_state->crtc_y;
+	old_state->crtc_h = new_state->crtc_h;
+	old_state->crtc_w = new_state->crtc_w;
+	old_state->src_x = new_state->src_x;
+	old_state->src_y = new_state->src_y;
+	old_state->src_h = new_state->src_h;
+	old_state->src_w = new_state->src_w;
+	/* swap current and new framebuffers */
+	swap(old_fb, new_fb);
+
+	if (!new_state->visible) {
+		regmap_update_bits(priv->regmap, MA35_CURSOR_CONFIG,
+			MA35_CURSOR_FORMAT_MASK, MA35_CURSOR_FORMAT_DISABLE);
+		return;
+	}
+
+	/* update position */
+	ma35_cursor_position_update(priv, new_state->crtc_x, new_state->crtc_y);
+
+	/* check new_state is different from old_state for dimensions or format changed */
+	if (!old_fb || old_fb != new_fb) {
+		layer->fb_base[0] = drm_fb_dma_get_gem_addr(new_fb, new_state, 0);
+		regmap_write(priv->regmap, MA35_CURSOR_ADDRESS, layer->fb_base[0]);
+
+		regmap_write(priv->regmap, MA35_CURSOR_BACKGROUND, layer->config.background);
+		regmap_write(priv->regmap, MA35_CURSOR_FOREGROUND, layer->config.foreground);
+		regmap_update_bits(priv->regmap, MA35_CURSOR_CONFIG,
+			MA35_CURSOR_FORMAT_MASK, MA35_CURSOR_FORMAT_A8R8G8B8);
+	}
+
+	/* update hotspot offset & format */
+	if (old_state->hotspot_x != new_state->hotspot_x ||
+		old_state->hotspot_y != new_state->hotspot_y) {
+		reg = MA35_CURSOR_FORMAT_A8R8G8B8 |
+			FIELD_PREP(MA35_CURSOR_HOTSPOT_X_MASK, new_state->hotspot_x) |
+			FIELD_PREP(MA35_CURSOR_HOTSPOT_Y_MASK, new_state->hotspot_y);
+		regmap_write(priv->regmap, MA35_CURSOR_CONFIG, reg);
+		old_state->hotspot_x = new_state->hotspot_x;
+		old_state->hotspot_y = new_state->hotspot_y;
+	}
+}
+
+static void ma35_plane_atomic_disable(struct drm_plane *drm_plane,
+					 struct drm_atomic_state *state)
+{
+	struct ma35_drm *priv = ma35_drm(drm_plane->dev);
+
+	regmap_update_bits(priv->regmap, MA35_FRAMEBUFFER_CONFIG,
+		MA35_PRIMARY_ENABLE, 0);
+}
+
+static void ma35_cursor_plane_atomic_disable(struct drm_plane *drm_plane,
+					 struct drm_atomic_state *state)
+{
+	struct ma35_drm *priv = ma35_drm(drm_plane->dev);
+
+	regmap_update_bits(priv->regmap, MA35_CURSOR_CONFIG,
+		MA35_CURSOR_FORMAT_MASK, MA35_CURSOR_FORMAT_DISABLE);
+}
+
+static struct drm_plane_helper_funcs ma35_plane_helper_funcs = {
+	.atomic_check		= ma35_plane_atomic_check,
+	.atomic_update		= ma35_plane_atomic_update,
+	.atomic_disable		= ma35_plane_atomic_disable,
+};
+
+static struct drm_plane_helper_funcs ma35_cursor_plane_helper_funcs = {
+	.atomic_check		= ma35_cursor_plane_atomic_check,
+	.atomic_update		= ma35_cursor_plane_atomic_update,
+	.atomic_disable		= ma35_cursor_plane_atomic_disable,
+	.atomic_async_check		= ma35_cursor_plane_atomic_async_check,
+	.atomic_async_update	= ma35_cursor_plane_atomic_async_update,
+};
+
+static int ma35_plane_set_property(struct drm_plane *drm_plane,
+	struct drm_plane_state *state, struct drm_property *property,
+	uint64_t val)
+{
+	struct ma35_layer *layer = ma35_layer(drm_plane);
+
+	if (property == layer->blend_mode_prop)
+		layer->config.blend_mode = val;
+	else if (property == layer->src_alpha_mode_prop)
+		layer->config.alpha_mode[0] = val;
+	else if (property == layer->dst_alpha_mode_prop)
+		layer->config.alpha_mode[1] = val;
+	else if (property == layer->src_color_prop)
+		layer->config.src_color = val;
+	else if (property == layer->dst_color_prop)
+		layer->config.dst_color = val;
+	else if (property == layer->swizzle_prop)
+		layer->config.swizzle = val;
+	else if (property == layer->colorkeylo_prop)
+		layer->config.colorkeylo = val;
+	else if (property == layer->colorkeyup_prop)
+		layer->config.colorkeyup = val;
+	else if (property == layer->background_prop)
+		layer->config.background = val;
+	else if (property == layer->foreground_prop)
+		layer->config.foreground = val;
+	else if (property == drm_plane->hotspot_x_property)
+		state->hotspot_x = val;
+	else if (property == drm_plane->hotspot_y_property)
+		state->hotspot_y = val;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ma35_plane_get_property(struct drm_plane *drm_plane,
+	const struct drm_plane_state *state, struct drm_property *property,
+	uint64_t *val)
+{
+	struct ma35_layer *layer = ma35_layer(drm_plane);
+
+	if (property == layer->blend_mode_prop)
+		*val = layer->config.blend_mode;
+	else if (property == layer->src_alpha_mode_prop)
+		*val = layer->config.alpha_mode[0];
+	else if (property == layer->dst_alpha_mode_prop)
+		*val = layer->config.alpha_mode[1];
+	else if (property == layer->src_color_prop)
+		*val = layer->config.src_color;
+	else if (property == layer->dst_color_prop)
+		*val = layer->config.dst_color;
+	else if (property == layer->swizzle_prop)
+		*val = layer->config.swizzle;
+	else if (property == layer->colorkeylo_prop)
+		*val = layer->config.colorkeylo;
+	else if (property == layer->colorkeyup_prop)
+		*val = layer->config.colorkeyup;
+	else if (property == layer->background_prop)
+		*val = layer->config.background;
+	else if (property == layer->foreground_prop)
+		*val = layer->config.foreground;
+	else if (property == drm_plane->hotspot_x_property)
+		*val = state->hotspot_x;
+	else if (property == drm_plane->hotspot_y_property)
+		*val = state->hotspot_y;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct drm_plane_funcs ma35_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_set_property = ma35_plane_set_property,
+	.atomic_get_property = ma35_plane_get_property,
+};
+
+static int ma35_layer_create_properties(struct ma35_drm *priv,
+				      struct ma35_layer *layer)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct drm_plane *drm_plane = &layer->drm_plane;
+	int ret = 0;
+
+	if (ma35_plane_properties[drm_plane->type].alpha) {
+		layer->blend_mode_prop = drm_property_create_enum(drm_dev, 0,
+							"porter-duff-blend-mode",
+							ma35_blend_modes,
+							ARRAY_SIZE(ma35_blend_modes));
+		if (!layer->blend_mode_prop) {
+			drm_err(drm_dev, "Failed to create blend mode property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->blend_mode_prop,
+								   MA35_ALPHA_SRC_OVER);
+		layer->config.blend_mode = MA35_ALPHA_SRC_OVER;
+
+		layer->src_alpha_mode_prop = drm_property_create_enum(drm_dev, 0,
+							"source-alpha-mode",
+							ma35_alpha_modes,
+							ARRAY_SIZE(ma35_alpha_modes));
+		if (!layer->src_alpha_mode_prop) {
+			drm_err(drm_dev, "Failed to create source alpha property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->src_alpha_mode_prop,
+								   MA35_ALPHA_MODE_NONE);
+		layer->config.alpha_mode[0] = MA35_ALPHA_MODE_NONE;
+
+		layer->dst_alpha_mode_prop = drm_property_create_enum(drm_dev, 0,
+							"destination-alpha-mode",
+							ma35_alpha_modes,
+							ARRAY_SIZE(ma35_alpha_modes));
+		if (!layer->dst_alpha_mode_prop) {
+			drm_err(drm_dev, "Failed to create destination alpha property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->dst_alpha_mode_prop,
+								   MA35_ALPHA_MODE_NONE);
+		layer->config.alpha_mode[1] = MA35_ALPHA_MODE_NONE;
+
+		layer->src_color_prop = drm_property_create_range(drm_dev, 0,
+							"source-global-color",
+							0, 0xffffffff);
+		if (!layer->src_color_prop) {
+			drm_err(drm_dev, "Failed to create source color property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->src_color_prop, 0);
+		layer->config.src_color = 0;
+
+		layer->dst_color_prop = drm_property_create_range(drm_dev, 0,
+							"destination-global-color",
+							0, 0xffffffff);
+		if (!layer->dst_color_prop) {
+			drm_err(drm_dev, "Failed to create destination color property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->dst_color_prop, 0);
+		layer->config.dst_color = 0;
+	}
+
+	if (ma35_plane_properties[drm_plane->type].swizzle) {
+		layer->swizzle_prop = drm_property_create_enum(drm_dev, 0,
+							"swizzle",
+							ma35_swizzles,
+							ARRAY_SIZE(ma35_swizzles));
+		if (!layer->swizzle_prop) {
+			drm_err(drm_dev, "Failed to create swizzle property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->swizzle_prop,
+								   MA35_SWIZZLE_ARGB);
+		layer->config.swizzle = MA35_SWIZZLE_ARGB;
+	}
+
+	if (ma35_plane_properties[drm_plane->type].colorkey) {
+		layer->colorkeylo_prop = drm_property_create_range(drm_dev, 0,
+							"colorkey-lower-bound",
+							0, 0xffffffff);
+		if (!layer->colorkeylo_prop) {
+			drm_err(drm_dev, "Failed to create colorkey property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->colorkeylo_prop, 0);
+		layer->config.colorkeylo = 0;
+
+		layer->colorkeyup_prop = drm_property_create_range(drm_dev, 0,
+							"colorkey-upper-bound",
+							0, 0xffffffff);
+		if (!layer->colorkeyup_prop) {
+			drm_err(drm_dev, "Failed to create colorkey property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->colorkeyup_prop, 0);
+		layer->config.colorkeyup = 0;
+	}
+
+	if (ma35_plane_properties[drm_plane->type].background) {
+		layer->background_prop = drm_property_create_range(drm_dev, 0,
+							"background",
+							0, 0xffffffff);
+		if (!layer->background_prop) {
+			drm_err(drm_dev, "Failed to create background property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->background_prop, 0);
+		layer->config.background = 0;
+	}
+
+	if (ma35_plane_properties[drm_plane->type].foreground) {
+		layer->foreground_prop = drm_property_create_range(drm_dev, 0,
+							"foreground",
+							0, 0xffffffff);
+		if (!layer->foreground_prop) {
+			drm_err(drm_dev, "Failed to create foreground property\n");
+			return -ENOMEM;
+		}
+		drm_object_attach_property(&drm_plane->base, layer->foreground_prop,
+							0xffffff);
+		layer->config.foreground = 0xffffff;
+	}
+
+	return ret;
+}
+
+struct ma35_layer *ma35_layer_get_from_type(struct ma35_drm *priv, enum drm_plane_type type)
+{
+	struct ma35_layer *layer;
+	struct drm_plane *drm_plane;
+
+	list_for_each_entry(layer, &priv->layers_list, list) {
+		drm_plane = &layer->drm_plane;
+		if (drm_plane->type == type)
+			return layer;
+	}
+
+	return NULL;
+}
+
+static int ma35_layer_create(struct ma35_drm *priv,
+			      struct device_node *of_node, u32 index,
+			      enum drm_plane_type type)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	struct device *dev = drm_dev->dev;
+	struct ma35_layer *layer;
+	int ret;
+
+	layer = devm_kzalloc(dev, sizeof(*layer), GFP_KERNEL);
+	if (!layer) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	layer->of_node = of_node;
+
+	if (type == DRM_PLANE_TYPE_CURSOR) {
+		ret = drm_universal_plane_init(drm_dev, &layer->drm_plane,
+			1 << MA35_DEFAULT_CRTC_ID,
+			&ma35_plane_funcs, ma35_cursor_formats,
+			ARRAY_SIZE(ma35_cursor_formats), NULL, type, NULL);
+		if (ret) {
+			drm_err(drm_dev, "Failed to initialize layer plane\n");
+			return ret;
+		}
+
+		drm_plane_helper_add(&layer->drm_plane, &ma35_cursor_plane_helper_funcs);
+	} else {
+		ret = drm_universal_plane_init(drm_dev, &layer->drm_plane,
+			1 << MA35_DEFAULT_CRTC_ID,
+			&ma35_plane_funcs, ma35_layer_formats,
+			ARRAY_SIZE(ma35_layer_formats), NULL, type, NULL);
+		if (ret) {
+			drm_err(drm_dev, "Failed to initialize layer plane\n");
+			return ret;
+		}
+
+		drm_plane_helper_add(&layer->drm_plane, &ma35_plane_helper_funcs);
+	}
+
+	if (ma35_layer_create_properties(priv, layer)) {
+		drm_err(drm_dev, "Failed to parse config for layer #%d\n",
+			index);
+		goto error;
+	}
+
+	drm_plane_create_zpos_immutable_property(&layer->drm_plane, index);
+
+	list_add_tail(&layer->list, &priv->layers_list);
+
+	return 0;
+
+error:
+	if (layer) {
+		list_del(&layer->list);
+		devm_kfree(dev, layer);
+	}
+
+	return ret;
+}
+
+void ma35_overlay_attach_crtc(struct ma35_drm *priv)
+{
+	uint32_t possible_crtcs = drm_crtc_mask(&priv->crtc->drm_crtc);
+	struct ma35_layer *layer;
+	struct drm_plane *drm_plane;
+
+	list_for_each_entry(layer, &priv->layers_list, list) {
+		drm_plane = &layer->drm_plane;
+		if (drm_plane->type != DRM_PLANE_TYPE_OVERLAY)
+			continue;
+
+		drm_plane->possible_crtcs = possible_crtcs;
+	}
+}
+
+int ma35_plane_init(struct ma35_drm *priv)
+{
+	struct drm_device *drm_dev = &priv->drm_dev;
+	int ret;
+
+	ret = ma35_layer_create(priv, NULL, 0, DRM_PLANE_TYPE_PRIMARY);
+	if (ret) {
+		drm_err(drm_dev, "Failed to create primary layer\n");
+		return ret;
+	}
+
+	ret = ma35_layer_create(priv, NULL, 1, DRM_PLANE_TYPE_OVERLAY);
+	if (ret) {
+		drm_err(drm_dev, "Failed to create overlay layer\n");
+		return ret;
+	}
+
+	ret = ma35_layer_create(priv, NULL, 2, DRM_PLANE_TYPE_CURSOR);
+	if (ret) {
+		drm_err(drm_dev, "Failed to create cursor layer\n");
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nuvoton/ma35_plane.h b/drivers/gpu/drm/nuvoton/ma35_plane.h
new file mode 100644
index 000000000000..b975590e03a5
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_plane.h
@@ -0,0 +1,226 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#ifndef _MA35_LAYER_H_
+#define _MA35_LAYER_H_
+
+#include <linux/of.h>
+#include <linux/types.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_property.h>
+
+#define MA35_MAX_PLANES	3
+
+struct ma35_drm;
+
+struct ma35_plane_property {
+	u32 fb_addr[MA35_MAX_PLANES];
+	u32 fb_stride[MA35_MAX_PLANES];
+	bool alpha;
+	bool swizzle;
+	bool colorkey;
+	bool background;
+	bool foreground;
+};
+
+struct ma35_layer_config {
+	u32 blend_mode;
+	u16 alpha_mode[2];
+	u32 src_color;
+	u32 dst_color;
+	u32 swizzle;
+	u32 colorkeylo;
+	u32 colorkeyup;
+	u32 background;
+	u32 foreground;
+	int32_t hotspot_x;
+	int32_t hotspot_y;
+};
+
+struct ma35_layer {
+	struct drm_plane drm_plane;
+	struct list_head list;
+	struct device_node *of_node;
+	struct ma35_layer_config config;
+	phys_addr_t fb_base[MA35_MAX_PLANES];
+
+	struct drm_property *blend_mode_prop;
+	struct drm_property *src_alpha_mode_prop;
+	struct drm_property *dst_alpha_mode_prop;
+	struct drm_property *src_color_prop;
+	struct drm_property *dst_color_prop;
+	struct drm_property *swizzle_prop;
+	struct drm_property *colorkeylo_prop;
+	struct drm_property *colorkeyup_prop;
+	struct drm_property *background_prop;
+	struct drm_property *foreground_prop;
+};
+
+enum ma35_format_enum {
+	MA35_FORMAT_X4R4G4B4,	// DRM_FORMAT_XRGB4444
+	MA35_FORMAT_A4R4G4B4,	// DRM_FORMAT_ARGB4444
+	MA35_FORMAT_X1R5G5B5,	// DRM_FORMAT_XRGB1555
+	MA35_FORMAT_A1R5G5B5,	// DRM_FORMAT_ARGB1555
+	MA35_FORMAT_R5G6B5,		// DRM_FORMAT_RGB565
+	MA35_FORMAT_X8R8G8B8,	// DRM_FORMAT_XRGB8888
+	MA35_FORMAT_A8R8G8B8,	// DRM_FORMAT_ARGB8888
+	MA35_FORMAT_YUY2,		// YUV422, DRM_FORMAT_YUYV
+	MA35_FORMAT_UYVY,		// YUV422, DRM_FORMAT_UYVY
+	MA35_FORMAT_INDEX8,
+	MA35_FORMAT_MONOCHROME,
+	MA35_FORMAT_YV12,		// YUV420, DRM_FORMAT_YVU420
+	MA35_FORMAT_A8,
+	MA35_FORMAT_NV12,		// YUV420, DRM_FORMAT_NV12
+	MA35_FORMAT_NV16,		// YUV422, DRM_FORMAT_NV16
+	MA35_FORMAT_RG16,
+	MA35_FORMAT_R8,
+	MA35_FORMAT_NV12_10BIT,
+	MA35_FORMAT_A2R10G10B10, // DRM_FORMAT_ARGB2101010
+	MA35_FORMAT_NV16_10BIT,
+	MA35_FORMAT_INDEX1,
+	MA35_FORMAT_INDEX2,
+	MA35_FORMAT_INDEX4,
+	MA35_FORMAT_P010,		// YUV420, DRM_FORMAT_P010
+	MA35_FORMAT_NV12_10BIT_L1,
+	MA35_FORMAT_NV16_10BIT_L1,
+};
+
+/* output = src * a + dst * b */
+enum ma35_blend_mode_enum { // (a, b)
+	MA35_ALPHA_CLEAR,	// (0, 0)
+	MA35_ALPHA_SRC,		// (1, 0)
+	MA35_ALPHA_DST,		// (0, 1)
+	MA35_ALPHA_SRC_OVER,	// (1, 1-alpha_s)
+	MA35_ALPHA_DST_OVER,	// (1-alpha_d, 1)
+	MA35_ALPHA_SRC_IN,	// (alpha_d, 0)
+	MA35_ALPHA_DST_IN,	// (0, alpha_s)
+	MA35_ALPHA_SRC_OUT,	// (1-alpha_d, 0)
+	MA35_ALPHA_DST_OUT,	// (0, 1-alpha_s)
+	MA35_ALPHA_SRC_ATOP,	// (alpha_d, 1-alpha_s)
+	MA35_ALPHA_DST_ATOP,	// (1-alpha_d, alpha_s)
+	MA35_ALPHA_XOR,		// (1-alpha_d, 1-alpha_s)
+};
+
+#define MA35_ALPHA_BLEND_DISABLE		BIT(1)
+
+#define MA35_SRC_ALPHA_MODE_INVERSED	BIT(0)
+#define MA35_DST_ALPHA_MODE_INVERSED	BIT(9)
+
+enum ma35_alpha_mode_enum {
+	MA35_ALPHA_MODE_NONE, // pass-through
+	MA35_ALPHA_MODE_GLOBAL, // substitute by global color
+};
+#define MA35_SRC_ALPHA_MODE		GENMASK(4, 3)
+#define MA35_DST_ALPHA_MODE		GENMASK(11, 10)
+
+enum ma35_alpha_blend_enum {
+	MA35_ALPHA_BLEND_ZERO,
+	MA35_ALPHA_BLEND_ONE,
+	MA35_ALPHA_BLEND_NORMAL,
+	MA35_ALPHA_BLEND_INVERSED,
+	MA35_ALPHA_BLEND_COLOR,
+	MA35_ALPHA_BLEND_COLOR_INVERSED,
+	MA35_ALPHA_BLEND_SATURATED_ALPHA,
+	MA35_ALPHA_BLEND_SATURATED_DEST_ALPHA,
+};
+#define MA35_SRC_BLENDING_MODE		GENMASK(7, 5)
+#define MA35_DST_BLENDING_MODE		GENMASK(14, 12)
+
+#define MA35_SRC_ALPHA_FACTOR_EN		BIT(8)
+#define MA35_DST_ALPHA_FACTOR_EN		BIT(15)
+
+/* configs for blend modes */
+#define MA35_BLEND_MODE_CLEAR	0
+#define MA35_BLEND_MODE_SRC	\
+	FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
+#define MA35_BLEND_MODE_DST \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE)
+#define MA35_BLEND_MODE_SRC_OVER \
+	(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_ONE) | \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
+#define MA35_BLEND_MODE_DST_OVER \
+	(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_ONE))
+#define MA35_BLEND_MODE_SRC_IN \
+	FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
+#define MA35_BLEND_MODE_DST_IN \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL)
+#define MA35_BLEND_MODE_SRC_OUT \
+	FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
+#define MA35_BLEND_MODE_DST_OUT \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED)
+#define MA35_BLEND_MODE_SRC_ATOP \
+	(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL) | \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
+#define MA35_BLEND_MODE_DST_ATOP \
+	(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_NORMAL))
+#define MA35_BLEND_MODE_XOR \
+	(FIELD_PREP(MA35_SRC_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED) | \
+	FIELD_PREP(MA35_DST_BLENDING_MODE, MA35_ALPHA_BLEND_INVERSED))
+
+/* colorkey */
+#define MA35_COLORKEY_ENABLE	2
+#define MA35_COLORKEY_DISABLE	0
+
+#define MA35_CURSOR_SIZE		32
+#define MA35_CURSOR_DEPTH		24
+
+enum ma35_cursor_formats_enum {
+	MA35_CURSOR_FORMAT_DISABLE,
+	MA35_CURSOR_FORMAT_MASKED,
+	MA35_CURSOR_FORMAT_A8R8G8B8,
+};
+
+#define MA35_CURSOR_FORMAT_MASK		GENMASK(1, 0)
+
+#define MA35_CURSOR_HOTSPOT_X_MASK	GENMASK(20, 16)
+#define MA35_CURSOR_HOTSPOT_Y_MASK	GENMASK(12, 8)
+#define MA35_CURSOR_FORMAT_MASK		GENMASK(1, 0)
+#define MA35_CURSOR_OWNER_MASK		BIT(4)
+#define MA35_CURSOR_X_MASK		GENMASK(14, 0)
+#define MA35_CURSOR_Y_MASK		GENMASK(30, 16)
+
+#define MA35_PRIMARY_ENABLE		BIT(0)
+#define MA35_PRIMARY_GAMMA		BIT(2)
+#define MA35_PRIMARY_RESET		BIT(4)
+#define MA35_PRIMARY_CLEAR		BIT(8)
+#define MA35_PRIMARY_TRANSPARENCY_MASK	GENMASK(10, 9)
+#define MA35_PRIMARY_SWIZZLE_MASK		GENMASK(25, 23)
+#define MA35_PRIMARY_FORMAT_MASK		GENMASK(31, 26)
+
+#define MA35_OVERLAY_ENABLE		BIT(24)
+#define MA35_OVERLAY_CLEAR		BIT(25)
+#define MA35_OVERLAY_FORMAT_MASK	GENMASK(21, 16)
+#define MA35_OVERLAY_SWIZZLE_MASK	GENMASK(15, 13)
+#define MA35_OVERLAY_TRANSPARENCY_MASK	GENMASK(1, 0)
+
+#define MA35_SWIZZLE_ARGB_MASK		GENMASK(1, 0)
+#define MA35_SWIZZLE_UV_MASK		BIT(2)
+
+enum ma35_swizzles_enum {
+	MA35_SWIZZLE_ARGB,
+	MA35_SWIZZLE_RGBA,
+	MA35_SWIZZLE_ABGR,
+	MA35_SWIZZLE_BGRA,
+	MA35_SWIZZLE_UV,
+};
+
+#define MA35_LAYER_FB_HEIGHT	GENMASK(29, 15)
+#define MA35_LAYER_FB_WIDTH		GENMASK(14, 0)
+
+#define MA35_OVERLAY_POSITION_Y_MASK	MA35_LAYER_FB_HEIGHT
+#define MA35_OVERLAY_POSITION_X_MASK	MA35_LAYER_FB_WIDTH
+
+struct ma35_layer *ma35_layer_get_from_type(struct ma35_drm *priv,
+							enum drm_plane_type type);
+void ma35_overlay_attach_crtc(struct ma35_drm *priv);
+int ma35_plane_init(struct ma35_drm *priv);
+
+#endif
diff --git a/drivers/gpu/drm/nuvoton/ma35_regs.h b/drivers/gpu/drm/nuvoton/ma35_regs.h
new file mode 100644
index 000000000000..0f4a7a13e7d8
--- /dev/null
+++ b/drivers/gpu/drm/nuvoton/ma35_regs.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Nuvoton DRM driver
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#ifndef _MA35_REGS_H_
+#define _MA35_REGS_H_
+
+#define MA35_FRAMEBUFFER_CONFIG                   0x1518
+#define MA35_FRAMEBUFFER_ADDRESS                  0x1400
+#define MA35_FRAMEBUFFER_STRIDE                   0x1408
+#define MA35_HDISPLAY                             0x1430
+#define MA35_HSYNC                                0x1438
+#define MA35_VDISPLAY                             0x1440
+#define MA35_VSYNC                                0x1448
+#define MA35_PANEL_CONFIG                         0x1418
+#define MA35_DPI_CONFIG                           0x14B8
+#define MA35_CURSOR_ADDRESS                       0x146C
+#define MA35_CURSOR_CONFIG                        0x1468
+#define MA35_CURSOR_LOCATION                      0x1470
+#define MA35_CURSOR_BACKGROUND                    0x1474
+#define MA35_CURSOR_FOREGROUND                    0x1478
+#define MA35_FRAMEBUFFER_UPLANAR_ADDRESS          0x1530
+#define MA35_FRAMEBUFFER_VPLANAR_ADDRESS          0x1538
+#define MA35_FRAMEBUFFER_USTRIDE                  0x1800
+#define MA35_FRAMEBUFFER_VSTRIDE                  0x1808
+#define MA35_INDEXCOLOR_TABLEINDEX                0x1818
+#define MA35_INDEXCOLOR_TABLEDATA                 0x1820
+#define MA35_FRAMEBUFFER_SIZE                     0x1810
+#define MA35_FRAMEBUFFER_SCALEFACTORX             0x1828
+#define MA35_FRAMEBUFFER_SCALEFACTORY             0x1830
+#define MA35_FRAMEBUFFER_SCALEFCONFIG             0x1520
+#define MA35_HORIFILTER_KERNELINDEX               0x1838
+#define MA35_HORIFILTER_KERNEL                    0x1A00
+#define MA35_VERTIFILTER_KERNELINDEX              0x1A08
+#define MA35_VERTIFILTER_KERNEL                   0x1A10
+#define MA35_FRAMEBUFFER_INITIALOFFSET            0x1A20
+#define MA35_FRAMEBUFFER_COLORKEY                 0x1508
+#define MA35_FRAMEBUFFER_COLORHIGHKEY             0x1510
+#define MA35_FRAMEBUFFER_BGCOLOR                  0x1528
+#define MA35_FRAMEBUFFER_CLEARVALUE               0x1A18
+#define MA35_DISPLAY_INTRENABLE                   0x1480
+#define MA35_INT_STATE                            0x147C
+#define MA35_PANEL_DEST_ADDRESS                   0x14F0
+#define MA35_MEM_DEST_ADDRESS                     0x14E8
+#define MA35_DEST_CONFIG                          0x14F8
+#define MA35_DEST_STRIDE                          0x1500
+#define MA35_DBI_CONFIG                           0x1488
+#define MA35_AQHICLOCKCONTROL                     0x0000
+#define MA35_OVERLAY_CONFIG                       0x1540
+#define MA35_OVERLAY_STRIDE                       0x1600
+#define MA35_OVERLAY_USTRIDE                      0x18C0
+#define MA35_OVERLAY_VSTRIDE                      0x1900
+#define MA35_OVERLAY_TL                           0x1640
+#define MA35_OVERLAY_BR                           0x1680
+#define MA35_OVERLAY_ALPHA_BLEND_CONFIG           0x1580
+#define MA35_OVERLAY_SRC_GLOBAL_COLOR             0x16C0
+#define MA35_OVERLAY_DST_GLOBAL_COLOR             0x1700
+#define MA35_OVERLAY_CLEAR_VALUE                  0x1940
+#define MA35_OVERLAY_SIZE                         0x17C0
+#define MA35_OVERLAY_COLOR_KEY                    0x1740
+#define MA35_OVERLAY_COLOR_KEY_HIGH               0x1780
+#define MA35_OVERLAY_ADDRESS                      0x15C0
+#define MA35_OVERLAY_UPLANAR_ADDRESS              0x1840
+#define MA35_OVERLAY_VPLANAR_ADDRESS              0x1880
+#define MA35_OVERLAY_SCALE_CONFIG                 0x1C00
+#define MA35_OVERLAY_SCALE_FACTOR_X               0x1A40
+#define MA35_OVERLAY_SCALE_FACTOR_Y               0x1A80
+#define MA35_OVERLAY_HORI_FILTER_KERNEL_INDEX     0x1AC0
+#define MA35_OVERLAY_HORI_FILTER_KERNEL           0x1B00
+#define MA35_OVERLAY_VERTI_FILTER_KERNEL_INDEX    0x1B40
+#define MA35_OVERLAY_VERTI_FILTER_KERNEL          0x1B80
+#define MA35_OVERLAY_INITIAL_OFFSET               0x1BC0
+#define MA35_GAMMA_EX_INDEX                       0x1CF0
+#define MA35_GAMMA_EX_DATA                        0x1CF8
+#define MA35_GAMMA_EX_ONE_DATA                    0x1D80
+#define MA35_GAMMA_INDEX                          0x1458
+#define MA35_GAMMA_DATA                           0x1460
+#define MA35_DISPLAY_DITHER_TABLE_LOW             0x1420
+#define MA35_DISPLAY_DITHER_TABLE_HIGH            0x1428
+#define MA35_DISPLAY_DITHER_CONFIG                0x1410
+#define MA35_DISPLAY_CURRENT_LOCATION             0x1450
+
+#endif
-- 
2.43.0

