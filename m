Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697076571C5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CCC10E372;
	Wed, 28 Dec 2022 01:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3993010E36A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hmJG1EQCcWrXtV6d3Al7nh8+VaY4Dt6NOgL2LFmlf+I=;
 b=GBjjDnbyWv4AKUs39AZB/+CtBopNAL2FP6HOljtyYJCMS0foT5vdx4VYjlJZ3GrLPy9r7+
 0FOQaYP4xwiN03/Oht95UU8GohTFsM7ANoRvWYU7v6tlUYleOpE+mM5JYVUvgX4e2YGftB
 AmPA+411+1KOnBKLkumVyHGLAD+Da4w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-3Dm3nwrENQaqjmHgSN0u3w-1; Tue, 27 Dec 2022 20:48:16 -0500
X-MC-Unique: 3Dm3nwrENQaqjmHgSN0u3w-1
Received: by mail-wm1-f70.google.com with SMTP id
 q6-20020a05600c2e4600b003d211775a99so6023176wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmJG1EQCcWrXtV6d3Al7nh8+VaY4Dt6NOgL2LFmlf+I=;
 b=SKWRg01sXc5qTOK8rJ8T5NKpNn2pbqKzdfG30Mi8egQzc6sNfh+m96EIDz01MmnWNl
 dTcH5f56MJk7mUodrThEFDXiAJFSmv6zekjwyuG1y7n4xoPdGVusbT80Xry8DAD+KLGu
 NbNB7jljdNnxGbfRaMF3CnKQoJ9DXJqjBV0OE2PCnWaHw7kuBq7F1YhwVSvH592EHoCx
 HIeLuihJP/plJ82HQlRQi9PGcLJhj8dNhEvA2JyGUucNZB4GDI+2Q8EFmxvmUnEro9Qu
 dSNndx2HTJjCpTQKcESWi2PjEqWzEib8pJ8eAk9CZ9oXZGzvg4E55dJBEJbZ4M8rsSt9
 d3Sg==
X-Gm-Message-State: AFqh2kpMkSd0T3j7NSKp3N7lh8zAs53Wcwgf4cNq3Mz7Cdf3G2bkAnOK
 fZ3DHJZe0+Yv+fcrqcHljSluS9GV9BfYeU5U/btPxmHZDA7RsKb9TbEy+Q8xncYT7s2tH/l3d/y
 MlCQGfN2KfJHg0C0Br0ls3/Ssdb2f
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr21465766wmo.36.1672192095483; 
 Tue, 27 Dec 2022 17:48:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvE039uOLT+JN8vfvtYuN2+Wum9q322X6qb0mg5MVp6KJm5OqUaUJPFPONLpc3nVXyzRZciQA==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr21465759wmo.36.1672192095255; 
 Tue, 27 Dec 2022 17:48:15 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:14 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] drm/panel-jdi-fhd-r63452: Drop custom DSI write macros
Date: Wed, 28 Dec 2022 02:47:51 +0100
Message-Id: <20221228014757.3170486-9-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228014757.3170486-1-javierm@redhat.com>
References: <20221228014757.3170486-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are macros for these already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macros defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 50 +++++++-------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index d8765b2294fb..e3f0e59b5e36 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -29,22 +29,6 @@ static inline struct jdi_fhd_r63452 *to_jdi_fhd_r63452(struct drm_panel *panel)
 	return container_of(panel, struct jdi_fhd_r63452, panel);
 }
 
-#define dsi_generic_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void jdi_fhd_r63452_reset(struct jdi_fhd_r63452 *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -63,12 +47,12 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	dsi_generic_write_seq(dsi, 0xb0, 0x00);
-	dsi_generic_write_seq(dsi, 0xd6, 0x01);
-	dsi_generic_write_seq(dsi, 0xec,
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xec,
 			      0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
 			      0x13, 0x15, 0x68, 0x0b, 0xb5);
-	dsi_generic_write_seq(dsi, 0xb0, 0x03);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret < 0) {
@@ -76,7 +60,7 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
 	if (ret < 0) {
@@ -108,10 +92,10 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
-	dsi_dcs_write_seq(dsi, 0x84, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
@@ -127,10 +111,10 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
 	}
 	msleep(80);
 
-	dsi_generic_write_seq(dsi, 0xb0, 0x04);
-	dsi_dcs_write_seq(dsi, 0x84, 0x00);
-	dsi_generic_write_seq(dsi, 0xc8, 0x11);
-	dsi_generic_write_seq(dsi, 0xb0, 0x03);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x11);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
 
 	return 0;
 }
@@ -143,12 +127,12 @@ static int jdi_fhd_r63452_off(struct jdi_fhd_r63452 *ctx)
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	dsi_generic_write_seq(dsi, 0xb0, 0x00);
-	dsi_generic_write_seq(dsi, 0xd6, 0x01);
-	dsi_generic_write_seq(dsi, 0xec,
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xec,
 			      0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
 			      0x13, 0x15, 0x68, 0x0b, 0x95);
-	dsi_generic_write_seq(dsi, 0xb0, 0x03);
+	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
 
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0) {
-- 
2.38.1

