Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B188B0CF61
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF8C10E5CD;
	Tue, 22 Jul 2025 01:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="k9FJMs7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4F10E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 01:53:22 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-23aeac7d77aso41526135ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 18:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753149202; x=1753754002;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhbZBxYOxAxOj+ASLf2XiGQ1wG1EuQWzZVRpU0tSFFQ=;
 b=k9FJMs7VLjV+znva/oPep7YuZ72fZJsrIhsKbgbuUCIqqCgnNfr8hwirqomEGEWuAX
 eIT8OCpP+V8o7h2oTyreX2gchLXzVIxOhs3jORt0pt+prm6vgvIDb3LX9LEYiV6VSe3j
 RjFZnKFFnuThMtRE3mRs0QvNUfIq4b9S5gJ/9GS9MoAfQuCSG/9YI9npHv2WXiUsfZJX
 dzLMeIUYtZuRjEg952MPH1A2iBPusPMTw5/dat5qeZ7wpjzzlmJ5BZg++xJijxItlP3H
 iW6yerXXqo/xZRf7lECw8/U2FtoUaY4xBUM3fmpXVEwJxaodXf3n45nfe1JM3UmWTuoa
 DG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753149202; x=1753754002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhbZBxYOxAxOj+ASLf2XiGQ1wG1EuQWzZVRpU0tSFFQ=;
 b=JuZHz41X7xm32KBT7xJ/VC/7Uw/Tcafd7pXtg2nVm2ToXVFAqfwyblxviuIJMh6Tgp
 ZxteSp8hQfvmTFWFSiaivbQRBNbz2S1SHSvCYDRwxsWpL+ln5dV5RfiYEHLOb+2VzZAo
 8B0qd8eXV1IMf4W8lnX2eXv9U2W/fKHhoTJEv+ppN4B8vc84p4u6haCP9SnrRx5o63JD
 To1/ssK0y01Fatt0TIJipBEuuLFHUYq4FdDLVosWt4Ual0R0tM/GHfKMQ3H6miRNlG4e
 vyaqA14p16/jESqcyLF6uQyHUEqXlI6NWEhl7j/5/aZ0pCDI/NnS9UaFENzNBBuQzjjO
 Fd3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAWMNktDXnoUjySDpcBWzJC5YgbqpIa4gc+2lAMsjwMek611PRNy0gRx1jnJ0xkM0kGKxESKOR2QA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj6l5DXswzV+roC/e6dFr+EMLc/Ad1MJfVlBr7sACLG30x4A/e
 qqzACoGYH5r1jcBBZQfQW8gve+CjA9EVjbsnAkggM+kMAfG6M9ZetHazprCiTqnkicI=
X-Gm-Gg: ASbGncs4ZlLqZfmFSyWM0nk3YBOBRv27sL87zlnTo8OV86Ce5thJT+K9BGxa5onzZSb
 c+JsRPOCCUhoVjOhJgtV1Rd9KS0oEckZru7QtLsAVFomfjWfJWh/DNi2kth3Vwjbk/W3e6eCLWL
 eSzyrzWi64y6SOZZdPPA64mLi/cBKD/Fu1gJ3SClu/krrsgQPEioqolGmeME6kyyITOdeH4EBJI
 UZ+Ko8lgk3+Nun18drTPT/JTVQQuGwzBUzyaa1oV8SZn+k+BpROFkoTb/xiOLKZbt/F6nv2uVB3
 l6sTBMUlyXGvyIP3SP2pN2nHbUL5c81z/828Uez/HswhC4wZJjS34KEqj9SgNSjxNoifxDZcFQg
 aCTsG9O40t0bzDyO2+Ins4InWqbBuUqga6q/s7pHl9FTzWuw0gL6/24zil1eM
X-Google-Smtp-Source: AGHT+IFxgDmBui7nkYPaUwxp7tm84aBS1BmPL5bdkZnEGGSzlelMRe7WM696+/QTqxuvoyrXRFJ8gQ==
X-Received: by 2002:a17:903:1a0c:b0:235:f3b0:ae81 with SMTP id
 d9443c01a7336-23e24fbf7a5mr307100155ad.27.1753149201586; 
 Mon, 21 Jul 2025 18:53:21 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 18:53:20 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jianhua Lu <lujianhua000@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Brigham Campbell <me@brighamcampbell.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 1/4] drm: Create mipi_dsi_dual* macros
Date: Mon, 21 Jul 2025 19:53:08 -0600
Message-ID: <20250722015313.561966-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
References: <20250722015313.561966-1-me@brighamcampbell.com>
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

Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
by two parallel serial interfaces. This allows for the reduction of code
duplication in drivers for these panels.

Remove mipi_dsi_dual_dcs_write_seq_multi definition from
panel-novatek-nt36523.c to avoid the duplicate definition. Make novatek
driver pass mipi_dsi_context struct as a pointer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c                |  48 ++
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
 include/drm/drm_mipi_dsi.h                    |  95 +++
 3 files changed, 541 insertions(+), 406 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..5b387543de28 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -827,6 +827,30 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
 
+/**
+ * mipi_dsi_dual_generic_write_multi() - mipi_dsi_generic_write_multi() for
+ * two dsi channels, one after the other
+ * @ctx: Context for multiple DSI transactions
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @payload: Buffer containing the payload
+ * @size: Size of payload buffer
+ *
+ * A wrapper around mipi_dsi_generic_write_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_multi_context *ctx,
+				       struct mipi_dsi_device *dsi1,
+				       struct mipi_dsi_device *dsi2,
+				       const void *payload, size_t size)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_generic_write_multi(ctx, payload, size);
+	ctx->dsi = dsi2;
+	mipi_dsi_generic_write_multi(ctx, payload, size);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_generic_write_multi);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
@@ -1006,6 +1030,30 @@ void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_multi);
 
+/**
+ * mipi_dsi_dual_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer_multi() for
+ * two dsi channels, one after the other
+ * @ctx: Context for multiple DSI transactions
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @data: Buffer containing data to be transmitted
+ * @len: Size of transmission buffer
+ *
+ * A wrapper around mipi_dsi_dcs_write_buffer_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
+					  struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  const void *data, size_t len)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+	ctx->dsi = dsi2;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_dcs_write_buffer_multi);
+
 /**
  * mipi_dsi_dcs_write() - send DCS write command
  * @dsi: DSI peripheral device
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 32cf64c7c18b..226d91daf8c7 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -23,14 +23,6 @@
 
 #define DSI_NUM_MIN 1
 
-#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq...)	\
-		do {								\
-			dsi_ctx.dsi = dsi0;					\
-			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
-			dsi_ctx.dsi = dsi1;					\
-			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
-		} while (0)
-
 struct panel_info {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi[2];
@@ -71,217 +63,217 @@ static int elish_boe_init_sequence(struct panel_info *pinfo)
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x25, 0x47);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x30, 0x47);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x39, 0x47);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd2, 0x30);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x74, 0x49);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x76, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x77, 0x49);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb9, 0x49);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xba, 0x49);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbb, 0x49);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbe, 0x04);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbf, 0x49);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc0, 0x04);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc1, 0x59);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc6, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc7, 0x48);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xca, 0x43);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xcb, 0x3c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xcf, 0x43);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd0, 0x3c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd3, 0x43);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd4, 0x3c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd7, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xdc, 0x43);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xdd, 0x3c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xe1, 0x43);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xe2, 0x3c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xf2, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xf3, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xf4, 0x48);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x13, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x14, 0x23);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbd, 0x23);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x97, 0x3c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x98, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x99, 0x95);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9b, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9c, 0x0b);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9d, 0x0a);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9e, 0x90);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xa3, 0x50);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x14, 0x60);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x16, 0xc0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x11);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x25, 0x47);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x30, 0x47);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x39, 0x47);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd2, 0x30);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x74, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x76, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x77, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb9, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xba, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbb, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbe, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbf, 0x49);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc0, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc1, 0x59);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc6, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc7, 0x48);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xca, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xcb, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xcf, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd0, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd3, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd4, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd7, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xdc, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xdd, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xe1, 0x43);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xe2, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xf2, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xf3, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xf4, 0x48);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x13, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x14, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbd, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x97, 0x3c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x98, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x99, 0x95);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9b, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9c, 0x0b);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9d, 0x0a);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9e, 0x90);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xa3, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x14, 0x60);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x16, 0xc0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x11);
 	mipi_dsi_msleep(&dsi_ctx, 70);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x29);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x29);
 
 	return dsi_ctx.accum_err;
 }
@@ -292,195 +284,195 @@ static int elish_csot_init_sequence(struct panel_info *pinfo)
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x00, 0x30);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x58, 0x40);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x55, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x25, 0x46);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x30, 0x46);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x39, 0x46);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x74, 0x4d);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xb9, 0x4b);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xba, 0x96);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbb, 0x4b);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbe, 0x07);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbf, 0x4b);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc0, 0x07);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc1, 0x5c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc6, 0x3f);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xc7, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xca, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xcb, 0x40);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xcf, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd0, 0x40);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd3, 0x08);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xd4, 0x40);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xbd, 0x1c);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x11);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x00, 0x30);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x58, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x55, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x25, 0x46);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x30, 0x46);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x39, 0x46);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x74, 0x4d);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xb9, 0x4b);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xba, 0x96);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbb, 0x4b);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbe, 0x07);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbf, 0x4b);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc0, 0x07);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc1, 0x5c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc6, 0x3f);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xc7, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xca, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xcb, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xcf, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd0, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd3, 0x08);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xd4, 0x40);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xbd, 0x1c);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x11);
 	mipi_dsi_msleep(&dsi_ctx, 70);
-	mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, 0x29);
+	mipi_dsi_dual_dcs_write_seq_multi(&dsi_ctx, dsi0, dsi1, 0x29);
 
 	return dsi_ctx.accum_err;
 }
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..f1dc822f69d6 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -289,6 +289,10 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
+void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_multi_context *ctx,
+				       struct mipi_dsi_device *dsi1,
+				       struct mipi_dsi_device *dsi2,
+				       const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format);
@@ -329,6 +333,10 @@ int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
 				     const void *data, size_t len);
 void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 				     const void *data, size_t len);
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
+					  struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  const void *data, size_t len);
 ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
@@ -431,6 +439,93 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that the _func parameter cannot accept a macro such as
+ * mipi_dsi_generic_write_multi() or mipi_dsi_dcs_write_buffer_multi(). See
+ * mipi_dsi_dual_generic_write_multi() and
+ * mipi_dsi_dual_dcs_write_buffer_multi() instead.
+ *
+ * WARNING: This macro reuses the _func argument and the optional trailing
+ * arguments twice each, which may cause unintended side effects. For example,
+ * adding the postfix increment ++ operator to one of the arguments to be
+ * passed to _func will cause the variable to be incremented twice instead of
+ * once and the variable will be its original value + 1 when sent to _dsi2.
+ *
+ * @_func: MIPI DSI function to pass context and arguments into
+ * @_ctx: Context for multiple DSI transactions
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+
+#define mipi_dsi_dual(_func, _ctx, _dsi1, _dsi2, ...)		 \
+	do {							 \
+		struct mipi_dsi_multi_context *_ctxcpy = (_ctx); \
+		_ctxcpy->dsi = (_dsi1);				 \
+		(_func)(_ctxcpy, ##__VA_ARGS__);		 \
+		_ctxcpy->dsi = (_dsi2);				 \
+		(_func)(_ctxcpy, ##__VA_ARGS__);		 \
+	} while (0)
+
+/**
+ * mipi_dsi_dual_generic_write_seq_multi - transmit data using a generic write
+ * packet to two dsi interfaces, one after the other
+ *
+ * This macro will send the specified generic packet twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the packet to the first DSI
+ * interface, the packet will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_ctx: Context for multiple DSI transactions
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_generic_write_seq_multi(_ctx, _dsi1, _dsi2, _seq...) \
+	do {								   \
+		static const u8 d[] = { _seq };				   \
+		mipi_dsi_dual_generic_write_multi(_ctx, _dsi1, _dsi2, d,   \
+						  ARRAY_SIZE(d));	   \
+	} while (0)
+
+/**
+ * mipi_dsi_dual_dcs_write_seq_multi - transmit a DCS command with payload to
+ * two dsi interfaces, one after the other
+ *
+ * This macro will send the specified DCS command with payload twice, once per
+ * each of the two interfaces supplied. This is useful for reducing duplication
+ * of code in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the payload to the first DSI
+ * interface, the payload will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_ctx: Context for multiple DSI transactions
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_cmd: Command
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_dcs_write_seq_multi(_ctx, _dsi1, _dsi2, _cmd, _seq...) \
+	do {								     \
+		static const u8 d[] = { _cmd, _seq };			     \
+		mipi_dsi_dual_dcs_write_buffer_multi(_ctx, _dsi1, _dsi2, d,  \
+						     ARRAY_SIZE(d));	     \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1

