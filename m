Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F48C5A3D
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 19:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E29510EB12;
	Tue, 14 May 2024 17:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aM0P/2X5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8102E10E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 17:22:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ed904c2280so30656725ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715707334; x=1716312134;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yW0uBlTZ3/e9woMDS24BvZUziw3iMsMdY4jNiItN/KA=;
 b=aM0P/2X5fXERM56iOky6FXC/uVZN53NVe5qENFWMtlKFbTcYG5tDvAcAx+kr50QFJI
 PXkAeDsvUfY63tAtWNrvLFrEukuzzAhQSimeP5KsnG9nmVVvDOfUQkeCYRLaYXPGSs9C
 z6s6pIgoehMA/KuVUwPPgG3iGPWI16VVVDW9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707334; x=1716312134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yW0uBlTZ3/e9woMDS24BvZUziw3iMsMdY4jNiItN/KA=;
 b=O6d+7RkbbX45DT6nFOg6QN9arEBmU6CK0Gw7XkmL/c5I0hdCL890k2STIpDBVMOfDy
 m41W9eLajOKZEsaOHmUaNMI/QiZzlndu0/77uj3Jlr4NxdqfFzle0xC8DIhtD05Ji8WY
 UFLEDIVAn9WdZJKk/LPxDqfmOGvXQ22PkzGF/Mt4OI6z5AOdE+sHWVgmnlXIngskrwzE
 Fj11/AHpsal2a1h+3CF28FStZBHuQc7mtCu+MIHPd1ftQIl2unHxrZSSezqfbeiKcFKK
 K7SZwK5gi4ovYDvRMHUGo0HPrcsaPb5C/P1V2LEu9QeidkMzo8EiOgeg13W7b35wjBbd
 mblQ==
X-Gm-Message-State: AOJu0Yx0C7n3717ppZ7OfRZvEgw6t8uxl+QJYaCMEdBwXj7UOuM5jTIb
 ZpF9LhHqxpeiKPZ1g6kO/+tUNJ29t7vOnjmC1wM/vppdZ1dTV+nbXkdDuvTPVBfGLJk9h9BoryI
 =
X-Google-Smtp-Source: AGHT+IFdOhp9yO9StSnbsxkvr+Vcmkvb5MdXfNMa2cJlvDViVyHHEcLZNjHrQO1n+yP17xrE8EwzqQ==
X-Received: by 2002:a17:903:2288:b0:1eb:dae:714f with SMTP id
 d9443c01a7336-1ef43c0ced6mr155311975ad.9.1715707334318; 
 Tue, 14 May 2024 10:22:14 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:ef10:6fdf:5041:421f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf3101csm100147575ad.121.2024.05.14.10.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:22:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] drm/panel: innolux-p079zca: Don't use a table for
 initting panels
Date: Tue, 14 May 2024 10:20:59 -0700
Message-ID: <20240514102056.v5.9.I947e28c81f9ef7dcd3add6e193be72d6f8ea086f@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240514172136.1578498-1-dianders@chromium.org>
References: <20240514172136.1578498-1-dianders@chromium.org>
MIME-Version: 1.0
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

Consensus on the mailing lists is that panels shouldn't use a table of
init commands but should instead use init functions. We'll use the
same concepts as the recently introduced
mipi_dsi_generic_write_seq_multi() to make this clean/easy and also
not bloat the driver too much. Measuring before/after this change:

$ scripts/bloat-o-meter \
  .../before/panel-innolux-p079zca.ko \
  .../after/panel-innolux-p079zca.ko
add/remove: 3/2 grow/shrink: 0/1 up/down: 2356/-1944 (412)
Function                                     old     new   delta
innolux_p097pfg_init                           -    1772   +1772
innolux_p097pfg_init.d                         -     480    +480
innolux_panel_write_multi                      -     104    +104
innolux_panel_prepare                        412     308    -104
.compoundliteral                             480       -    -480
innolux_p097pfg_init_cmds                   1360       -   -1360
Total: Before=5802, After=6214, chg +7.10%

Note that, unlike some other drivers, we actually make this panel
driver _bigger_ by using the new functions. This is because the
innolux-p079zca panel driver didn't have as complex of a table and
thus the old table was more efficient than the code. The bloat is
still not giant (only 412 bytes).

Also note that we can't direclty use
mipi_dsi_generic_write_seq_multi() here because we need to deal with
the crazy "nop" that this driver sends after all commands. This means
that we have to write code that is "inspired" by the new macros.

Since we're touching all the tables, let's also convert hex numbers to
lower case as per kernel conventions.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v4)

Changes in v4:
- Test to see if init is non-NULL before using it.

Changes in v3:
- New

 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 284 +++++++++---------
 1 file changed, 140 insertions(+), 144 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 485178a99910..ade8bf7491ee 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -17,14 +17,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
-struct panel_init_cmd {
-	size_t len;
-	const char *data;
-};
-
-#define _INIT_CMD(...) { \
-	.len = sizeof((char[]){__VA_ARGS__}), \
-	.data = (char[]){__VA_ARGS__} }
+struct innolux_panel;
 
 struct panel_desc {
 	const struct drm_display_mode *mode;
@@ -36,7 +29,7 @@ struct panel_desc {
 
 	unsigned long flags;
 	enum mipi_dsi_pixel_format format;
-	const struct panel_init_cmd *init_cmds;
+	int (*init)(struct innolux_panel *innolux);
 	unsigned int lanes;
 	const char * const *supply_names;
 	unsigned int num_supplies;
@@ -132,32 +125,10 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	/* p079zca: t4, p097pfg: t5 */
 	usleep_range(20000, 21000);
 
-	if (innolux->desc->init_cmds) {
-		const struct panel_init_cmd *cmds =
-					innolux->desc->init_cmds;
-		unsigned int i;
-
-		for (i = 0; cmds[i].len != 0; i++) {
-			const struct panel_init_cmd *cmd = &cmds[i];
-
-			err = mipi_dsi_generic_write(innolux->link, cmd->data,
-						     cmd->len);
-			if (err < 0) {
-				dev_err(panel->dev, "failed to write command %u\n", i);
-				goto poweroff;
-			}
-
-			/*
-			 * Included by random guessing, because without this
-			 * (or at least, some delay), the panel sometimes
-			 * didn't appear to pick up the command sequence.
-			 */
-			err = mipi_dsi_dcs_nop(innolux->link);
-			if (err < 0) {
-				dev_err(panel->dev, "failed to send DCS nop: %d\n", err);
-				goto poweroff;
-			}
-		}
+	if (innolux->desc->init) {
+		err = innolux->desc->init(innolux);
+		if (err < 0)
+			goto poweroff;
 	}
 
 	err = mipi_dsi_dcs_exit_sleep_mode(innolux->link);
@@ -250,119 +221,144 @@ static const struct drm_display_mode innolux_p097pfg_mode = {
 	.vtotal = 2048 + 100 + 2 + 18,
 };
 
+static void innolux_panel_write_multi(struct mipi_dsi_multi_context *ctx,
+				      const void *payload, size_t size)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+
+	mipi_dsi_generic_write_multi(ctx, payload, size);
+	if (ctx->accum_err)
+		return;
+
+	/*
+	 * Included by random guessing, because without this
+	 * (or at least, some delay), the panel sometimes
+	 * didn't appear to pick up the command sequence.
+	 */
+	ctx->accum_err = mipi_dsi_dcs_nop(ctx->dsi);
+	if (ctx->accum_err)
+		dev_err(dev, "failed to send DCS nop: %d\n", ctx->accum_err);
+}
+
+#define innolux_panel_init_cmd_multi(ctx, seq...)                 \
+	do {                                                      \
+		static const u8 d[] = { seq };                    \
+		innolux_panel_write_multi(ctx, d, ARRAY_SIZE(d)); \
+	} while (0)
+
+#define innolux_panel_switch_page(ctx, page) \
+	innolux_panel_init_cmd_multi(ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, (page))
+
 /*
  * Display manufacturer failed to provide init sequencing according to
  * https://chromium-review.googlesource.com/c/chromiumos/third_party/coreboot/+/892065/
  * so the init sequence stems from a register dump of a working panel.
  */
-static const struct panel_init_cmd innolux_p097pfg_init_cmds[] = {
-	/* page 0 */
-	_INIT_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x00),
-	_INIT_CMD(0xB1, 0xE8, 0x11),
-	_INIT_CMD(0xB2, 0x25, 0x02),
-	_INIT_CMD(0xB5, 0x08, 0x00),
-	_INIT_CMD(0xBC, 0x0F, 0x00),
-	_INIT_CMD(0xB8, 0x03, 0x06, 0x00, 0x00),
-	_INIT_CMD(0xBD, 0x01, 0x90, 0x14, 0x14),
-	_INIT_CMD(0x6F, 0x01),
-	_INIT_CMD(0xC0, 0x03),
-	_INIT_CMD(0x6F, 0x02),
-	_INIT_CMD(0xC1, 0x0D),
-	_INIT_CMD(0xD9, 0x01, 0x09, 0x70),
-	_INIT_CMD(0xC5, 0x12, 0x21, 0x00),
-	_INIT_CMD(0xBB, 0x93, 0x93),
-
-	/* page 1 */
-	_INIT_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x01),
-	_INIT_CMD(0xB3, 0x3C, 0x3C),
-	_INIT_CMD(0xB4, 0x0F, 0x0F),
-	_INIT_CMD(0xB9, 0x45, 0x45),
-	_INIT_CMD(0xBA, 0x14, 0x14),
-	_INIT_CMD(0xCA, 0x02),
-	_INIT_CMD(0xCE, 0x04),
-	_INIT_CMD(0xC3, 0x9B, 0x9B),
-	_INIT_CMD(0xD8, 0xC0, 0x03),
-	_INIT_CMD(0xBC, 0x82, 0x01),
-	_INIT_CMD(0xBD, 0x9E, 0x01),
-
-	/* page 2 */
-	_INIT_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x02),
-	_INIT_CMD(0xB0, 0x82),
-	_INIT_CMD(0xD1, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x82, 0x00, 0xA5,
-		  0x00, 0xC1, 0x00, 0xEA, 0x01, 0x0D, 0x01, 0x40),
-	_INIT_CMD(0xD2, 0x01, 0x6A, 0x01, 0xA8, 0x01, 0xDC, 0x02, 0x29,
-		  0x02, 0x67, 0x02, 0x68, 0x02, 0xA8, 0x02, 0xF0),
-	_INIT_CMD(0xD3, 0x03, 0x19, 0x03, 0x49, 0x03, 0x67, 0x03, 0x8C,
-		  0x03, 0xA6, 0x03, 0xC7, 0x03, 0xDE, 0x03, 0xEC),
-	_INIT_CMD(0xD4, 0x03, 0xFF, 0x03, 0xFF),
-	_INIT_CMD(0xE0, 0x00, 0x00, 0x00, 0x86, 0x00, 0xC5, 0x00, 0xE5,
-		  0x00, 0xFF, 0x01, 0x26, 0x01, 0x45, 0x01, 0x75),
-	_INIT_CMD(0xE1, 0x01, 0x9C, 0x01, 0xD5, 0x02, 0x05, 0x02, 0x4D,
-		  0x02, 0x86, 0x02, 0x87, 0x02, 0xC3, 0x03, 0x03),
-	_INIT_CMD(0xE2, 0x03, 0x2A, 0x03, 0x56, 0x03, 0x72, 0x03, 0x94,
-		  0x03, 0xAC, 0x03, 0xCB, 0x03, 0xE0, 0x03, 0xED),
-	_INIT_CMD(0xE3, 0x03, 0xFF, 0x03, 0xFF),
-
-	/* page 3 */
-	_INIT_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x03),
-	_INIT_CMD(0xB0, 0x00, 0x00, 0x00, 0x00),
-	_INIT_CMD(0xB1, 0x00, 0x00, 0x00, 0x00),
-	_INIT_CMD(0xB2, 0x00, 0x00, 0x06, 0x04, 0x01, 0x40, 0x85),
-	_INIT_CMD(0xB3, 0x10, 0x07, 0xFC, 0x04, 0x01, 0x40, 0x80),
-	_INIT_CMD(0xB6, 0xF0, 0x08, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01,
-		  0x40, 0x80),
-	_INIT_CMD(0xBA, 0xC5, 0x07, 0x00, 0x04, 0x11, 0x25, 0x8C),
-	_INIT_CMD(0xBB, 0xC5, 0x07, 0x00, 0x03, 0x11, 0x25, 0x8C),
-	_INIT_CMD(0xC0, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x80, 0x80),
-	_INIT_CMD(0xC1, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x80, 0x80),
-	_INIT_CMD(0xC4, 0x00, 0x00),
-	_INIT_CMD(0xEF, 0x41),
-
-	/* page 4 */
-	_INIT_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x04),
-	_INIT_CMD(0xEC, 0x4C),
-
-	/* page 5 */
-	_INIT_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x05),
-	_INIT_CMD(0xB0, 0x13, 0x03, 0x03, 0x01),
-	_INIT_CMD(0xB1, 0x30, 0x00),
-	_INIT_CMD(0xB2, 0x02, 0x02, 0x00),
-	_INIT_CMD(0xB3, 0x82, 0x23, 0x82, 0x9D),
-	_INIT_CMD(0xB4, 0xC5, 0x75, 0x24, 0x57),
-	_INIT_CMD(0xB5, 0x00, 0xD4, 0x72, 0x11, 0x11, 0xAB, 0x0A),
-	_INIT_CMD(0xB6, 0x00, 0x00, 0xD5, 0x72, 0x24, 0x56),
-	_INIT_CMD(0xB7, 0x5C, 0xDC, 0x5C, 0x5C),
-	_INIT_CMD(0xB9, 0x0C, 0x00, 0x00, 0x01, 0x00),
-	_INIT_CMD(0xC0, 0x75, 0x11, 0x11, 0x54, 0x05),
-	_INIT_CMD(0xC6, 0x00, 0x00, 0x00, 0x00),
-	_INIT_CMD(0xD0, 0x00, 0x48, 0x08, 0x00, 0x00),
-	_INIT_CMD(0xD1, 0x00, 0x48, 0x09, 0x00, 0x00),
-
-	/* page 6 */
-	_INIT_CMD(0xF0, 0x55, 0xAA, 0x52, 0x08, 0x06),
-	_INIT_CMD(0xB0, 0x02, 0x32, 0x32, 0x08, 0x2F),
-	_INIT_CMD(0xB1, 0x2E, 0x15, 0x14, 0x13, 0x12),
-	_INIT_CMD(0xB2, 0x11, 0x10, 0x00, 0x3D, 0x3D),
-	_INIT_CMD(0xB3, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D),
-	_INIT_CMD(0xB4, 0x3D, 0x32),
-	_INIT_CMD(0xB5, 0x03, 0x32, 0x32, 0x09, 0x2F),
-	_INIT_CMD(0xB6, 0x2E, 0x1B, 0x1A, 0x19, 0x18),
-	_INIT_CMD(0xB7, 0x17, 0x16, 0x01, 0x3D, 0x3D),
-	_INIT_CMD(0xB8, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D),
-	_INIT_CMD(0xB9, 0x3D, 0x32),
-	_INIT_CMD(0xC0, 0x01, 0x32, 0x32, 0x09, 0x2F),
-	_INIT_CMD(0xC1, 0x2E, 0x1A, 0x1B, 0x16, 0x17),
-	_INIT_CMD(0xC2, 0x18, 0x19, 0x03, 0x3D, 0x3D),
-	_INIT_CMD(0xC3, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D),
-	_INIT_CMD(0xC4, 0x3D, 0x32),
-	_INIT_CMD(0xC5, 0x00, 0x32, 0x32, 0x08, 0x2F),
-	_INIT_CMD(0xC6, 0x2E, 0x14, 0x15, 0x10, 0x11),
-	_INIT_CMD(0xC7, 0x12, 0x13, 0x02, 0x3D, 0x3D),
-	_INIT_CMD(0xC8, 0x3D, 0x3D, 0x3D, 0x3D, 0x3D),
-	_INIT_CMD(0xC9, 0x3D, 0x32),
-
-	{},
-};
+static int innolux_p097pfg_init(struct innolux_panel *innolux)
+{
+	struct mipi_dsi_multi_context ctx = { .dsi = innolux->link };
+
+	innolux_panel_switch_page(&ctx, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xb1, 0xe8, 0x11);
+	innolux_panel_init_cmd_multi(&ctx, 0xb2, 0x25, 0x02);
+	innolux_panel_init_cmd_multi(&ctx, 0xb5, 0x08, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xbc, 0x0f, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xb8, 0x03, 0x06, 0x00, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xbd, 0x01, 0x90, 0x14, 0x14);
+	innolux_panel_init_cmd_multi(&ctx, 0x6f, 0x01);
+	innolux_panel_init_cmd_multi(&ctx, 0xc0, 0x03);
+	innolux_panel_init_cmd_multi(&ctx, 0x6f, 0x02);
+	innolux_panel_init_cmd_multi(&ctx, 0xc1, 0x0d);
+	innolux_panel_init_cmd_multi(&ctx, 0xd9, 0x01, 0x09, 0x70);
+	innolux_panel_init_cmd_multi(&ctx, 0xc5, 0x12, 0x21, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xbb, 0x93, 0x93);
+
+	innolux_panel_switch_page(&ctx, 0x01);
+	innolux_panel_init_cmd_multi(&ctx, 0xb3, 0x3c, 0x3c);
+	innolux_panel_init_cmd_multi(&ctx, 0xb4, 0x0f, 0x0f);
+	innolux_panel_init_cmd_multi(&ctx, 0xb9, 0x45, 0x45);
+	innolux_panel_init_cmd_multi(&ctx, 0xba, 0x14, 0x14);
+	innolux_panel_init_cmd_multi(&ctx, 0xca, 0x02);
+	innolux_panel_init_cmd_multi(&ctx, 0xce, 0x04);
+	innolux_panel_init_cmd_multi(&ctx, 0xc3, 0x9b, 0x9b);
+	innolux_panel_init_cmd_multi(&ctx, 0xd8, 0xc0, 0x03);
+	innolux_panel_init_cmd_multi(&ctx, 0xbc, 0x82, 0x01);
+	innolux_panel_init_cmd_multi(&ctx, 0xbd, 0x9e, 0x01);
+
+	innolux_panel_switch_page(&ctx, 0x02);
+	innolux_panel_init_cmd_multi(&ctx, 0xb0, 0x82);
+	innolux_panel_init_cmd_multi(&ctx, 0xd1, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x82, 0x00, 0xa5,
+				     0x00, 0xc1, 0x00, 0xea, 0x01, 0x0d, 0x01, 0x40);
+	innolux_panel_init_cmd_multi(&ctx, 0xd2, 0x01, 0x6a, 0x01, 0xa8, 0x01, 0xdc, 0x02, 0x29,
+				     0x02, 0x67, 0x02, 0x68, 0x02, 0xa8, 0x02, 0xf0);
+	innolux_panel_init_cmd_multi(&ctx, 0xd3, 0x03, 0x19, 0x03, 0x49, 0x03, 0x67, 0x03, 0x8c,
+				     0x03, 0xa6, 0x03, 0xc7, 0x03, 0xde, 0x03, 0xec);
+	innolux_panel_init_cmd_multi(&ctx, 0xd4, 0x03, 0xff, 0x03, 0xff);
+	innolux_panel_init_cmd_multi(&ctx, 0xe0, 0x00, 0x00, 0x00, 0x86, 0x00, 0xc5, 0x00, 0xe5,
+				     0x00, 0xff, 0x01, 0x26, 0x01, 0x45, 0x01, 0x75);
+	innolux_panel_init_cmd_multi(&ctx, 0xe1, 0x01, 0x9c, 0x01, 0xd5, 0x02, 0x05, 0x02, 0x4d,
+				     0x02, 0x86, 0x02, 0x87, 0x02, 0xc3, 0x03, 0x03);
+	innolux_panel_init_cmd_multi(&ctx, 0xe2, 0x03, 0x2a, 0x03, 0x56, 0x03, 0x72, 0x03, 0x94,
+				     0x03, 0xac, 0x03, 0xcb, 0x03, 0xe0, 0x03, 0xed);
+	innolux_panel_init_cmd_multi(&ctx, 0xe3, 0x03, 0xff, 0x03, 0xff);
+
+	innolux_panel_switch_page(&ctx, 0x03);
+	innolux_panel_init_cmd_multi(&ctx, 0xb0, 0x00, 0x00, 0x00, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xb1, 0x00, 0x00, 0x00, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xb2, 0x00, 0x00, 0x06, 0x04, 0x01, 0x40, 0x85);
+	innolux_panel_init_cmd_multi(&ctx, 0xb3, 0x10, 0x07, 0xfc, 0x04, 0x01, 0x40, 0x80);
+	innolux_panel_init_cmd_multi(&ctx, 0xb6, 0xf0, 0x08, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01,
+				     0x40, 0x80);
+	innolux_panel_init_cmd_multi(&ctx, 0xba, 0xc5, 0x07, 0x00, 0x04, 0x11, 0x25, 0x8c);
+	innolux_panel_init_cmd_multi(&ctx, 0xbb, 0xc5, 0x07, 0x00, 0x03, 0x11, 0x25, 0x8c);
+	innolux_panel_init_cmd_multi(&ctx, 0xc0, 0x00, 0x3c, 0x00, 0x00, 0x00, 0x80, 0x80);
+	innolux_panel_init_cmd_multi(&ctx, 0xc1, 0x00, 0x3c, 0x00, 0x00, 0x00, 0x80, 0x80);
+	innolux_panel_init_cmd_multi(&ctx, 0xc4, 0x00, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xef, 0x41);
+
+	innolux_panel_switch_page(&ctx, 0x04);
+	innolux_panel_init_cmd_multi(&ctx, 0xec, 0x4c);
+
+	innolux_panel_switch_page(&ctx, 0x05);
+	innolux_panel_init_cmd_multi(&ctx, 0xb0, 0x13, 0x03, 0x03, 0x01);
+	innolux_panel_init_cmd_multi(&ctx, 0xb1, 0x30, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xb2, 0x02, 0x02, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xb3, 0x82, 0x23, 0x82, 0x9d);
+	innolux_panel_init_cmd_multi(&ctx, 0xb4, 0xc5, 0x75, 0x24, 0x57);
+	innolux_panel_init_cmd_multi(&ctx, 0xb5, 0x00, 0xd4, 0x72, 0x11, 0x11, 0xab, 0x0a);
+	innolux_panel_init_cmd_multi(&ctx, 0xb6, 0x00, 0x00, 0xd5, 0x72, 0x24, 0x56);
+	innolux_panel_init_cmd_multi(&ctx, 0xb7, 0x5c, 0xdc, 0x5c, 0x5c);
+	innolux_panel_init_cmd_multi(&ctx, 0xb9, 0x0c, 0x00, 0x00, 0x01, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xc0, 0x75, 0x11, 0x11, 0x54, 0x05);
+	innolux_panel_init_cmd_multi(&ctx, 0xc6, 0x00, 0x00, 0x00, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xd0, 0x00, 0x48, 0x08, 0x00, 0x00);
+	innolux_panel_init_cmd_multi(&ctx, 0xd1, 0x00, 0x48, 0x09, 0x00, 0x00);
+
+	innolux_panel_switch_page(&ctx, 0x06);
+	innolux_panel_init_cmd_multi(&ctx, 0xb0, 0x02, 0x32, 0x32, 0x08, 0x2f);
+	innolux_panel_init_cmd_multi(&ctx, 0xb1, 0x2e, 0x15, 0x14, 0x13, 0x12);
+	innolux_panel_init_cmd_multi(&ctx, 0xb2, 0x11, 0x10, 0x00, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xb3, 0x3d, 0x3d, 0x3d, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xb4, 0x3d, 0x32);
+	innolux_panel_init_cmd_multi(&ctx, 0xb5, 0x03, 0x32, 0x32, 0x09, 0x2f);
+	innolux_panel_init_cmd_multi(&ctx, 0xb6, 0x2e, 0x1b, 0x1a, 0x19, 0x18);
+	innolux_panel_init_cmd_multi(&ctx, 0xb7, 0x17, 0x16, 0x01, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xb8, 0x3d, 0x3d, 0x3d, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xb9, 0x3d, 0x32);
+	innolux_panel_init_cmd_multi(&ctx, 0xc0, 0x01, 0x32, 0x32, 0x09, 0x2f);
+	innolux_panel_init_cmd_multi(&ctx, 0xc1, 0x2e, 0x1a, 0x1b, 0x16, 0x17);
+	innolux_panel_init_cmd_multi(&ctx, 0xc2, 0x18, 0x19, 0x03, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xc3, 0x3d, 0x3d, 0x3d, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xc4, 0x3d, 0x32);
+	innolux_panel_init_cmd_multi(&ctx, 0xc5, 0x00, 0x32, 0x32, 0x08, 0x2f);
+	innolux_panel_init_cmd_multi(&ctx, 0xc6, 0x2e, 0x14, 0x15, 0x10, 0x11);
+	innolux_panel_init_cmd_multi(&ctx, 0xc7, 0x12, 0x13, 0x02, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xc8, 0x3d, 0x3d, 0x3d, 0x3d, 0x3d);
+	innolux_panel_init_cmd_multi(&ctx, 0xc9, 0x3d, 0x32);
+
+	return ctx.accum_err;
+}
 
 static const struct panel_desc innolux_p097pfg_panel_desc = {
 	.mode = &innolux_p097pfg_mode,
@@ -374,7 +370,7 @@ static const struct panel_desc innolux_p097pfg_panel_desc = {
 	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		 MIPI_DSI_MODE_LPM,
 	.format = MIPI_DSI_FMT_RGB888,
-	.init_cmds = innolux_p097pfg_init_cmds,
+	.init = innolux_p097pfg_init,
 	.lanes = 4,
 	.supply_names = innolux_p097pfg_supply_names,
 	.num_supplies = ARRAY_SIZE(innolux_p097pfg_supply_names),
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

