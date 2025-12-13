Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CCECBB074
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 15:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974AF10E14E;
	Sat, 13 Dec 2025 14:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="njGvvMw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EBE10E14E
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 14:24:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so120804f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 06:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765635863; x=1766240663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ft2QGOpuBorYPJAx3tNK/ovhgd5WK0GHut9ZfegOTjU=;
 b=njGvvMw4IV67VwnMMDL4BPuQkDCAk3Pnx/5AhZ3Xx7FF4p+PWED5rh+BNCN5rcWHes
 9ie2yRKF/QsSNp64Bca+xuFhPXCKVKKby9mOfYM+ODy96xXUJf3jmx02rUukeK6NFHyN
 alDKV+Hc0Ll/y9b1GP1shmuPm+se9JJ2WLV136ngqwEMutlbM9vLUNGJejUhd67iAz1g
 y2ApvZdZ0vAxRWxLJef+6iTnJ9D4GVoV8UbOkv5Lq2OsRh3vim8N7BjuaukdeZgucCB7
 aMRnvXILOYEJ/WSuNJZB9myS7eP+YPn0X0hLaxtESTpC40ZNwyFJ4eavfq06fCOvGntb
 FhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765635863; x=1766240663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ft2QGOpuBorYPJAx3tNK/ovhgd5WK0GHut9ZfegOTjU=;
 b=kvnBYsG8ToJXPQDSkbSM+3n2sPUSjft8kCDWPtyzBfF0NptoJCHFDeD45Ibat/l8MJ
 FZizo32VP84u2bFFNnAO0uQttWUT4URT/p8QplMxjUpOJJxFLwl0z6UzdbzPgvvS5XpT
 imxHqClIv9RN3PZR5O2816mwIjgfSCXriEIIk8TQRdukj/S/59vBd8jCtw9xyFp863kK
 CXThNmhrKEElgTrItS3alW/rv4zZLRO9KX42TxYnvTYXICrnQIu18SSwm79zb/G/7ZQx
 odZLioYuZ8VPznvPAf1J1ryFtJnaO4a7iGR+6oY6BmhEHYqXLqVdhn/l8LWfAkQQqtLn
 w8XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW540YVpV1v1zbN3q+D12LNY0kT5jD9FdrKvZuEb2X4fSNEQJcVImz6LRRDPHZABJePPeo+HLYgq0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfFrHcU3JxtKs9lH27BBtcEbdUJ8fC2lhynuuU+znMVK9gjdNC
 IafZiG0CZDrV96n9e/KYCs/77HKVeWBiIfZ2ACO5retDmWz5nIs3nUKJ
X-Gm-Gg: AY/fxX6GrMkKerrFxA2bhjo29iwzF0RVqXzGhIwOkdw86nRBaK43xije+7wIr5xinTE
 RUqs3ubcyeZc+wAe7lsjfPJ5eTdOK+O0B2juCvRu92iZUbWfC9sQgr2NSdtC11pFSheNYYtWeQ1
 OAJmjqMlWi9JyE/zvVZOr+oIIQuFS0rtIO9yzbhpqaJVZlbU/JQ9zrrX94lDgxhG8rAmok2hkYj
 nBbzhcwGmiIZZw4UljpcqhTzxTjHi2ZW+ZApxvDvCz6438aXcOyfTJZLvbVbOtgfH2cPUjRMf+w
 KmDyoizzEq4SEc6ZXu0NdpzEnJn/gEkJFWlA7jm/qr8yujH8CrVi79qT/n0Zp3g5qvsgb7wSruS
 2BkHuj1arIy31OGsOKfm0qZyMThxRXenVSKCI3ujLSxiiezouTh5xCCCdh89bnl58ZMI380MN49
 5B0ATXJ4dtBaKFFMpig2pYPR2v4rN5OkZpXwFOnU9COtXfmpz24bRjRPISO+1ly1+aF9jpjFpDc
 Y/ar2tiWlw=
X-Google-Smtp-Source: AGHT+IE++CxyBe0w1M6D4mjWyc7UanuZPlaHfmD0BP6hZRj3ZmkwssaNoWvKdGlcRolhMIQitWFBOQ==
X-Received: by 2002:a05:6000:4203:b0:429:f050:adbb with SMTP id
 ffacd0b85a97d-42fb44c8b92mr6341368f8f.26.1765635862561; 
 Sat, 13 Dec 2025 06:24:22 -0800 (PST)
Received: from gattout.local
 (2a01cb0012bffa0095e8f1983555767e.ipv6.abo.wanadoo.fr.
 [2a01:cb00:12bf:fa00:95e8:f198:3555:767e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fbc6e3392sm5924854f8f.13.2025.12.13.06.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 06:24:22 -0800 (PST)
From: Amin GATTOUT <amin.gattout@gmail.com>
To: neil.armstrong@linaro.org
Cc: jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 dianders@chromium.org, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Amin GATTOUT <amin.gattout@gmail.com>
Subject: [PATCH v3] drm/panel: otm8009a: Switch to mipi_dsi_multi_context
 helpers
Date: Sat, 13 Dec 2025 15:24:21 +0100
Message-ID: <20251213142421.6762-1-amin.gattout@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD=FV=Ub2xYsLcOzL2_AQ+JreWVVd2F1n+meL1NH7ztC1=jZmw@mail.gmail.com>
References: <CAD=FV=Ub2xYsLcOzL2_AQ+JreWVVd2F1n+meL1NH7ztC1=jZmw@mail.gmail.com>
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

Update the driver to use the non-deprecated mipi_dsi_*_multi()
helpers, as recommended in Documentation/gpu/todo.rst. The multi
variants provide proper error accumulation and handle the required
DCS NOP insertions, which suits the OTM8009A command sequences.

Refactor otm8009a_dcs_write_buf() and the dcs_write_seq/dcs_write_cmd_at
macros to take a mipi_dsi_multi_context pointer, passing it through
from callers. This ensures consistent error handling throughout the
driver.

Replace all mdelay() and msleep() calls within DSI command sequences
with mipi_dsi_msleep() for proper error accumulation.

The init, disable, and backlight update paths now return dsi_ctx.accum_err,
ensuring errors are propagated to callers.

Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
---
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 183 +++++++-----------
 1 file changed, 74 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index a0f58c3b73f6..60701521c3b1 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -109,177 +109,140 @@ static inline struct otm8009a *panel_to_otm8009a(struct drm_panel *panel)
 	return container_of(panel, struct otm8009a, panel);
 }
 
-static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
-				   size_t len)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-
-	if (mipi_dsi_dcs_write_buffer(dsi, data, len) < 0)
-		dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
-}
-
-#define dcs_write_seq(ctx, seq...)			\
-({							\
-	static const u8 d[] = { seq };			\
-	otm8009a_dcs_write_buf(ctx, d, ARRAY_SIZE(d));	\
-})
-
 #define dcs_write_cmd_at(ctx, cmd, seq...)		\
 ({							\
-	dcs_write_seq(ctx, MCS_ADRSFT, (cmd) & 0xFF);	\
-	dcs_write_seq(ctx, (cmd) >> 8, seq);		\
+	mipi_dsi_dcs_write_seq_multi(ctx, MCS_ADRSFT, (cmd) & 0xFF);	\
+	mipi_dsi_dcs_write_seq_multi(ctx, (cmd) >> 8, seq);		\
 })
 
 static int otm8009a_init_sequence(struct otm8009a *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* Enter CMD2 */
-	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
+	dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA1, 0x80, 0x09, 0x01);
 
 	/* Enter Orise Command2 */
-	dcs_write_cmd_at(ctx, MCS_CMD2_ENA2, 0x80, 0x09);
-
-	dcs_write_cmd_at(ctx, MCS_SD_PCH_CTRL, 0x30);
-	mdelay(10);
-
-	dcs_write_cmd_at(ctx, MCS_NO_DOC1, 0x40);
-	mdelay(10);
-
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL4 + 1, 0xA9);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 1, 0x34);
-	dcs_write_cmd_at(ctx, MCS_P_DRV_M, 0x50);
-	dcs_write_cmd_at(ctx, MCS_VCOMDC, 0x4E);
-	dcs_write_cmd_at(ctx, MCS_OSC_ADJ, 0x66); /* 65Hz */
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 2, 0x01);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 5, 0x34);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL2 + 4, 0x33);
-	dcs_write_cmd_at(ctx, MCS_GVDDSET, 0x79, 0x79);
-	dcs_write_cmd_at(ctx, MCS_SD_CTRL + 1, 0x1B);
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL1 + 2, 0x83);
-	dcs_write_cmd_at(ctx, MCS_SD_PCH_CTRL + 1, 0x83);
-	dcs_write_cmd_at(ctx, MCS_RGB_VID_SET, 0x0E);
-	dcs_write_cmd_at(ctx, MCS_PANSET, 0x00, 0x01);
-
-	dcs_write_cmd_at(ctx, MCS_GOAVST, 0x85, 0x01, 0x00, 0x84, 0x01, 0x00);
-	dcs_write_cmd_at(ctx, MCS_GOACLKA1, 0x18, 0x04, 0x03, 0x39, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA2, 0x80, 0x09);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_SD_PCH_CTRL, 0x30);
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC1, 0x40);
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL4 + 1, 0xA9);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 1, 0x34);
+	dcs_write_cmd_at(&dsi_ctx, MCS_P_DRV_M, 0x50);
+	dcs_write_cmd_at(&dsi_ctx, MCS_VCOMDC, 0x4E);
+	dcs_write_cmd_at(&dsi_ctx, MCS_OSC_ADJ, 0x66); /* 65Hz */
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 2, 0x01);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 5, 0x34);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL2 + 4, 0x33);
+	dcs_write_cmd_at(&dsi_ctx, MCS_GVDDSET, 0x79, 0x79);
+	dcs_write_cmd_at(&dsi_ctx, MCS_SD_CTRL + 1, 0x1B);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL1 + 2, 0x83);
+	dcs_write_cmd_at(&dsi_ctx, MCS_SD_PCH_CTRL + 1, 0x83);
+	dcs_write_cmd_at(&dsi_ctx, MCS_RGB_VID_SET, 0x0E);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANSET, 0x00, 0x01);
+
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOAVST, 0x85, 0x01, 0x00, 0x84, 0x01, 0x00);
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOACLKA1, 0x18, 0x04, 0x03, 0x39, 0x00, 0x00,
 			 0x00, 0x18, 0x03, 0x03, 0x3A, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_GOACLKA3, 0x18, 0x02, 0x03, 0x3B, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOACLKA3, 0x18, 0x02, 0x03, 0x3B, 0x00, 0x00,
 			 0x00, 0x18, 0x01, 0x03, 0x3C, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_GOAECLK, 0x01, 0x01, 0x20, 0x20, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GOAECLK, 0x01, 0x01, 0x20, 0x20, 0x00, 0x00,
 			 0x01, 0x02, 0x00, 0x00);
 
-	dcs_write_cmd_at(ctx, MCS_NO_DOC2, 0x00);
+	dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC2, 0x00);
 
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 			 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 			 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET5, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET5, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0,
 			 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET6, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET6, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4,
 			 4, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-	dcs_write_cmd_at(ctx, MCS_PANCTRLSET8, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANCTRLSET8, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
 			 0xFF, 0xFF, 0xFF, 0xFF, 0xFF);
 
-	dcs_write_cmd_at(ctx, MCS_PANU2D1, 0x00, 0x26, 0x09, 0x0B, 0x01, 0x25,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D1, 0x00, 0x26, 0x09, 0x0B, 0x01, 0x25,
 			 0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_PANU2D2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x0A, 0x0C, 0x02);
-	dcs_write_cmd_at(ctx, MCS_PANU2D3, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PANU2D3, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_PAND2U1, 0x00, 0x25, 0x0C, 0x0A, 0x02, 0x26,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U1, 0x00, 0x25, 0x0C, 0x0A, 0x02, 0x26,
 			 0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_at(ctx, MCS_PAND2U2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x0B, 0x09, 0x01);
-	dcs_write_cmd_at(ctx, MCS_PAND2U3, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00,
+	dcs_write_cmd_at(&dsi_ctx, MCS_PAND2U3, 0x26, 0x00, 0x00, 0x00, 0x00, 0x00,
 			 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
 
-	dcs_write_cmd_at(ctx, MCS_PWR_CTRL1 + 1, 0x66);
+	dcs_write_cmd_at(&dsi_ctx, MCS_PWR_CTRL1 + 1, 0x66);
 
-	dcs_write_cmd_at(ctx, MCS_NO_DOC3, 0x06);
+	dcs_write_cmd_at(&dsi_ctx, MCS_NO_DOC3, 0x06);
 
-	dcs_write_cmd_at(ctx, MCS_GMCT2_2P, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GMCT2_2P, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
 			 0x0B, 0x0A, 0x04, 0x07, 0x0B, 0x08, 0x0F, 0x10, 0x0A,
 			 0x01);
-	dcs_write_cmd_at(ctx, MCS_GMCT2_2N, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
+	dcs_write_cmd_at(&dsi_ctx, MCS_GMCT2_2N, 0x00, 0x09, 0x0F, 0x0E, 0x07, 0x10,
 			 0x0B, 0x0A, 0x04, 0x07, 0x0B, 0x08, 0x0F, 0x10, 0x0A,
 			 0x01);
 
 	/* Exit CMD2 */
-	dcs_write_cmd_at(ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
+	dcs_write_cmd_at(&dsi_ctx, MCS_CMD2_ENA1, 0xFF, 0xFF, 0xFF);
 
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
-	/* Wait for sleep out exit */
-	mdelay(120);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	/* Default portrait 480x800 rgb24 */
-	dcs_write_seq(ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
-	ret = mipi_dsi_dcs_set_column_address(dsi, 0, OTM8009A_HDISPLAY - 1);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0, OTM8009A_HDISPLAY - 1);
 
-	ret = mipi_dsi_dcs_set_page_address(dsi, 0, OTM8009A_VDISPLAY - 1);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, OTM8009A_VDISPLAY - 1);
 
 	/* See otm8009a driver documentation for pixel format descriptions */
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT |
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT |
 					    MIPI_DCS_PIXEL_FMT_24BIT << 4);
-	if (ret)
-		return ret;
 
 	/* Disable CABC feature */
-	dcs_write_seq(ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_nop(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_nop_multi(&dsi_ctx);
 
 	/* Send Command GRAM memory write (no parameters) */
-	dcs_write_seq(ctx, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START);
 
 	/* Wait a short while to let the panel be ready before the 1st frame */
-	mdelay(10);
+	mipi_dsi_msleep(&dsi_ctx, 10);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int otm8009a_disable(struct drm_panel *panel)
 {
 	struct otm8009a *ctx = panel_to_otm8009a(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	backlight_disable(ctx->bl_dev);
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret)
-		return ret;
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	msleep(120);
-
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int otm8009a_unprepare(struct drm_panel *panel)
@@ -383,6 +346,8 @@ static const struct drm_panel_funcs otm8009a_drm_funcs = {
 static int otm8009a_backlight_update_status(struct backlight_device *bd)
 {
 	struct otm8009a *ctx = bl_get_data(bd);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	u8 data[2];
 
 	if (!ctx->prepared) {
@@ -397,7 +362,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 		 */
 		data[0] = MIPI_DCS_SET_DISPLAY_BRIGHTNESS;
 		data[1] = bd->props.brightness;
-		otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, data, ARRAY_SIZE(data));
 
 		/* set Brightness Control & Backlight on */
 		data[1] = 0x24;
@@ -409,9 +374,9 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 
 	/* Update Brightness Control & Backlight */
 	data[0] = MIPI_DCS_WRITE_CONTROL_DISPLAY;
-	otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
+	mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, data, ARRAY_SIZE(data));
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static const struct backlight_ops otm8009a_backlight_ops = {
-- 
2.43.0

