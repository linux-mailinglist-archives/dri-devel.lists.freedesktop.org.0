Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F866114D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930010E361;
	Sat,  7 Jan 2023 19:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9110E362
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deWthXcTON7t66x4tziVex8yFWTz8gUPIMDdjgbvK2o=;
 b=C9kYJBsjROjXfF+v9UVRKiwhalWQ7SFiWsBenygls3rk2+oPYKS0W/fRdseota5oX24Rmk
 Tv+hwqlbJEfY+5T5WNToJ4CHqXXrE4VM65uzjj29ltJDxVfFrwBvBnAJ0wvijuBoYiuKCd
 ANp/WZohx5xqfqjuRBcR/rvFxsi4lf8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-280-ucrVAEr4NVWQQS0BrHcHZw-1; Sat, 07 Jan 2023 14:18:49 -0500
X-MC-Unique: ucrVAEr4NVWQQS0BrHcHZw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so2725423wmq.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=deWthXcTON7t66x4tziVex8yFWTz8gUPIMDdjgbvK2o=;
 b=rw7vlzbHkd4s0tGzkfsp5OZe4+Dn7QF0fMAfhUykooR3O7t5FbYAkRAYvb8l/JalcB
 CGkSbNX6PqINaNp6s503La9Yvd2wLNew0OZR/jbF57QiGi8FLbtexsE03La7Va9X1p4/
 1JuSPb443n+CB/TUKSa/jFP7Aux2vm58VBwTkGwT2o8aBXl6WBp+jAVCZ0vfzBSLStBF
 4Z4PB7cy3FgaL6H/Ms4kOgOV8258yOiArbj6jEJ1BPGZeeY3DHHCackvKeAwqWKvV40h
 vfvgp9xB6U8oIfAvx6iAADeRXl+2Bvf+xTfvMfPldpM4nd1O23DUi2YkLD5pMPtE4uZh
 8oXw==
X-Gm-Message-State: AFqh2koYDtINlygQhyjdUOtmJdNXBl2jdeSutBxB1JE2ZPs5DV/AW474
 L5r1H1ye+xERs2lTBP2QlCOHTyHrvn3mdjlC9+jUrRGV9hf+clUzUnlh0GfLZI06BO72QncP+Eu
 vwUyCooi0975IzpoR2qpjfBlthC2F
X-Received: by 2002:a5d:5910:0:b0:27c:7c2a:f700 with SMTP id
 v16-20020a5d5910000000b0027c7c2af700mr25242856wrd.8.1673119128604; 
 Sat, 07 Jan 2023 11:18:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsGBkBD1CsnybBCNLEDbnkha+PRHO1FTA17G+lmd3rkuDh20smPXVuDqRUNb1X9pNidHM51Ig==
X-Received: by 2002:a5d:5910:0:b0:27c:7c2a:f700 with SMTP id
 v16-20020a5d5910000000b0027c7c2af700mr25242852wrd.8.1673119128415; 
 Sat, 07 Jan 2023 11:18:48 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] drm/panel-xinpeng-xpp055c272: Drop custom DSI write
 macro
Date: Sat,  7 Jan 2023 20:18:22 +0100
Message-Id: <20230107191822.3787147-14-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230107191822.3787147-1-javierm@redhat.com>
References: <20230107191822.3787147-1-javierm@redhat.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macro defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2:
- Add Sam Ravnborg's Reviewed-by tag.
- Fix identation on macro usage (Sam Ravnborg).
- Fix generic DSI and DCS commands write discrepancy (Sam Ravnborg).

 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 112 ++++++++----------
 1 file changed, 52 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 2c54733ee241..8670386498a4 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -60,14 +60,6 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
 	return container_of(panel, struct xpp055c272, panel);
 }
 
-#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 b[] = { cmd, seq };			\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
@@ -77,60 +69,60 @@ static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
-			      0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
-			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
-			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
-			      0x00, 0x00, 0x37);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
-			      0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
-			      0x00, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETSCR,
-			      0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
-			      0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEQ,
-			      0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
-			      0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER,
-			      0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
-			      0x67, 0x77, 0x33, 0x33);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
-			      0xff, 0x01, 0xff);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETMIPI,
+			       0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
+			       0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
+			       0x00, 0x00, 0x37);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
+			       0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
+			       0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETSCR,
+			       0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
+			       0x00);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEQ,
+			       0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
+			       0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER,
+			       0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
+			       0x67, 0x77, 0x33, 0x33);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
+			       0xff, 0x01, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
 	msleep(20);
 
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP1,
-			      0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
-			      0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
-			      0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
-			      0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
-			      0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
-			      0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
-			      0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
-			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP2,
-			      0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
-			      0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
-			      0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
-			      0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
-			      0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
-			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
-			      0xa0, 0x00, 0x00, 0x00, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
-			      0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
-			      0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
-			      0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
-			      0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
-			      0x11, 0x18);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP1,
+			       0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
+			       0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
+			       0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
+			       0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
+			       0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
+			       0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
+			       0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP2,
+			       0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
+			       0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
+			       0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
+			       0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
+			       0xa0, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
+			       0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
+			       0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
+			       0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
+			       0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
+			       0x11, 0x18);
 
 	msleep(60);
 
-- 
2.38.1

