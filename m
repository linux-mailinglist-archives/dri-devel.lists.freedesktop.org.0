Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E156571BD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2F510E177;
	Wed, 28 Dec 2022 01:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687EC10E177
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9JgG18siC0zFvcxfSnzxDZkFtR9u8dpp2nx4seyvBE=;
 b=bdrRsG+cwpvkN9KM/Mz+CAJw2UQF6zKroSW2ON2DZxjx6krtOxyE/JAs59yqWrLhylX4VX
 uq9TaG5iZIjkoAGaYDQwgIBbksw0UU7ZFgQi5l6lFRK7lcYercJvRiRb4ca6D+GEcaswAm
 i7vy3wXBtfuAgZ+0VlJwdJdPy7QOIyA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-dAOKJJmxMkuFlhifTemtIw-1; Tue, 27 Dec 2022 20:48:08 -0500
X-MC-Unique: dAOKJJmxMkuFlhifTemtIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so7617695wma.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y9JgG18siC0zFvcxfSnzxDZkFtR9u8dpp2nx4seyvBE=;
 b=1pcg9TyESEjC7QJ9w8MED6Pc9Bp4MxmhqPRcqexjT4PA0Ra2/w/32qeMKVXrARph84
 yxAr2ixf+jIBhWQirBk2IR0dUsuNlmblhIvevSxsW9bufXRkEiaSND1oV+MZ1BArk+nY
 f293aVzNljGElWrj9WF5pB4ILdy/NKS4ewZSop3VayOvD+eeIG+9gaaatpCA/GV77ILp
 PPPJlJeRLDyxF8IG+CrXNMoGqGg2LdbBCYdWr+/Yt5y2NBM7SWG0dpVpt7af3lzsSdLx
 j6gPADIjnUmLM3q9O3ecN8d7ekxwEYd7BRFRPlLB/Cx2AbKRjTUfzngo4v/D/uLfmkd+
 qsWg==
X-Gm-Message-State: AFqh2kp4NYNcDkOkoSMk0K4IbWloJlbwF8QrP7NkpSb4FTzruTSgoyhF
 GMYbaYJtdEQXdHmNWu8k1/SoU7iWoKcLwie6wFONrQQ2mDFq1vycP8hPK0492aKQlsLw6WFKfuy
 eQnQyT3CsqlaN05kXb8+6Tbq3xxoJ
X-Received: by 2002:adf:ed0a:0:b0:242:142a:c8ba with SMTP id
 a10-20020adfed0a000000b00242142ac8bamr13298906wro.52.1672192087636; 
 Tue, 27 Dec 2022 17:48:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvG4ykycaEyWwwt5gYNozMEuWfW2ekORtLjj1KHz3ZIik5MWGYROBHkszCeYe0Xn9LWWOLgPw==
X-Received: by 2002:adf:ed0a:0:b0:242:142a:c8ba with SMTP id
 a10-20020adfed0a000000b00242142ac8bamr13298902wro.52.1672192087422; 
 Tue, 27 Dec 2022 17:48:07 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:07 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] drm/panel-asus-z00t-tm5p5-n35596: Drop custom DSI write
 macros
Date: Wed, 28 Dec 2022 02:47:45 +0100
Message-Id: <20221228014757.3170486-3-javierm@redhat.com>
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

 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 96 ++++++++-----------
 1 file changed, 40 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index b3235781e6ba..075a7af81eff 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -24,22 +24,6 @@ static inline struct tm5p5_nt35596 *to_tm5p5_nt35596(struct drm_panel *panel)
 	return container_of(panel, struct tm5p5_nt35596, panel);
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
 static void tm5p5_nt35596_reset(struct tm5p5_nt35596 *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
@@ -54,46 +38,46 @@ static int tm5p5_nt35596_on(struct tm5p5_nt35596 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
 
-	dsi_generic_write_seq(dsi, 0xff, 0x05);
-	dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	dsi_generic_write_seq(dsi, 0xc5, 0x31);
-	dsi_generic_write_seq(dsi, 0xff, 0x04);
-	dsi_generic_write_seq(dsi, 0x01, 0x84);
-	dsi_generic_write_seq(dsi, 0x05, 0x25);
-	dsi_generic_write_seq(dsi, 0x06, 0x01);
-	dsi_generic_write_seq(dsi, 0x07, 0x20);
-	dsi_generic_write_seq(dsi, 0x08, 0x06);
-	dsi_generic_write_seq(dsi, 0x09, 0x08);
-	dsi_generic_write_seq(dsi, 0x0a, 0x10);
-	dsi_generic_write_seq(dsi, 0x0b, 0x10);
-	dsi_generic_write_seq(dsi, 0x0c, 0x10);
-	dsi_generic_write_seq(dsi, 0x0d, 0x14);
-	dsi_generic_write_seq(dsi, 0x0e, 0x14);
-	dsi_generic_write_seq(dsi, 0x0f, 0x14);
-	dsi_generic_write_seq(dsi, 0x10, 0x14);
-	dsi_generic_write_seq(dsi, 0x11, 0x14);
-	dsi_generic_write_seq(dsi, 0x12, 0x14);
-	dsi_generic_write_seq(dsi, 0x17, 0xf3);
-	dsi_generic_write_seq(dsi, 0x18, 0xc0);
-	dsi_generic_write_seq(dsi, 0x19, 0xc0);
-	dsi_generic_write_seq(dsi, 0x1a, 0xc0);
-	dsi_generic_write_seq(dsi, 0x1b, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1c, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1d, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1e, 0xb3);
-	dsi_generic_write_seq(dsi, 0x1f, 0xb3);
-	dsi_generic_write_seq(dsi, 0x20, 0xb3);
-	dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	dsi_generic_write_seq(dsi, 0xff, 0x00);
-	dsi_generic_write_seq(dsi, 0xfb, 0x01);
-	dsi_generic_write_seq(dsi, 0x35, 0x01);
-	dsi_generic_write_seq(dsi, 0xd3, 0x06);
-	dsi_generic_write_seq(dsi, 0xd4, 0x04);
-	dsi_generic_write_seq(dsi, 0x5e, 0x0d);
-	dsi_generic_write_seq(dsi, 0x11, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x05);
+	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xc5, 0x31);
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x04);
+	mipi_dsi_generic_write_seq(dsi, 0x01, 0x84);
+	mipi_dsi_generic_write_seq(dsi, 0x05, 0x25);
+	mipi_dsi_generic_write_seq(dsi, 0x06, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0x07, 0x20);
+	mipi_dsi_generic_write_seq(dsi, 0x08, 0x06);
+	mipi_dsi_generic_write_seq(dsi, 0x09, 0x08);
+	mipi_dsi_generic_write_seq(dsi, 0x0a, 0x10);
+	mipi_dsi_generic_write_seq(dsi, 0x0b, 0x10);
+	mipi_dsi_generic_write_seq(dsi, 0x0c, 0x10);
+	mipi_dsi_generic_write_seq(dsi, 0x0d, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x0e, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x0f, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x10, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x11, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x12, 0x14);
+	mipi_dsi_generic_write_seq(dsi, 0x17, 0xf3);
+	mipi_dsi_generic_write_seq(dsi, 0x18, 0xc0);
+	mipi_dsi_generic_write_seq(dsi, 0x19, 0xc0);
+	mipi_dsi_generic_write_seq(dsi, 0x1a, 0xc0);
+	mipi_dsi_generic_write_seq(dsi, 0x1b, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1c, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1d, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1e, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x1f, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0x20, 0xb3);
+	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xff, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0x35, 0x01);
+	mipi_dsi_generic_write_seq(dsi, 0xd3, 0x06);
+	mipi_dsi_generic_write_seq(dsi, 0xd4, 0x04);
+	mipi_dsi_generic_write_seq(dsi, 0x5e, 0x0d);
+	mipi_dsi_generic_write_seq(dsi, 0x11, 0x00);
 	msleep(100);
-	dsi_generic_write_seq(dsi, 0x29, 0x00);
-	dsi_generic_write_seq(dsi, 0x53, 0x24);
+	mipi_dsi_generic_write_seq(dsi, 0x29, 0x00);
+	mipi_dsi_generic_write_seq(dsi, 0x53, 0x24);
 
 	return 0;
 }
@@ -117,7 +101,7 @@ static int tm5p5_nt35596_off(struct tm5p5_nt35596 *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, 0x4f, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x4f, 0x01);
 
 	return 0;
 }
-- 
2.38.1

