Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A81661143
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F85110E357;
	Sat,  7 Jan 2023 19:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B780A10E1C1
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zYg/QL5tJjzhXTn4477dEVWRyv2kVQSAl3jZfVLzv0=;
 b=XF45AGFUzebMO9/EqfpZLZzdRi1OGf33juw4zD/jYMFex21XnxOhi+shqsBo6TmkKvpGGb
 v0OryUfL2Ljp2QmEOs07ouuZdE4ERwpYFd9fAbNSgsxm3T4M/+HbYD11gYfA7M63AC4IYH
 eJPW88T4G2mn6FNV+q9X/UO2QTZsegg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-KLqexzP0Ox-oBU0FclqvTA-1; Sat, 07 Jan 2023 14:18:36 -0500
X-MC-Unique: KLqexzP0Ox-oBU0FclqvTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso4638785wms.7
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zYg/QL5tJjzhXTn4477dEVWRyv2kVQSAl3jZfVLzv0=;
 b=6MtaoNIy69zDHNIBQKoIvo+X3JnYOI3PpqJfH7RcWcCnh0C+f0mu8zbkfknN5zokEx
 ZSIJBmYKTMhMwlFPi3cNpTYrxLSx6frTulFNQ7JebAjkUJyxhxRJYdgQuBFI2XURiOgg
 q8fF+dT7LsrJ/4EI/v1WOC71ruTEChkzHHy9rJ2XHinA4mwEErB/lQ4ysF8SdPvjbieY
 lxZ2R7PpFE3jaJx6mLWPL7jyanaqqEpAWK0O7NJpQ2KdejxxsRvtYdpt4kxUKTw4oLyh
 qGV0uT15GiGY1GvKKwGLXy3i4smY45GdLa3J6ry9kksKKa/1h7lKShS91/DUTVJfgLif
 1z5Q==
X-Gm-Message-State: AFqh2kqadeX5VFOk+sC2ZnWlrfemsXrYurNpZfgqyNzUyP7n1dD6qxit
 81SlP/4bzd64tI/ihSx3EqiMQEpkE+hK8I/2fWbJERYFfJJPp5fly/V19QeWyjfw+0+7gbLhP97
 wbH5vNEB+To+X6YHob3TYz+5sau+8
X-Received: by 2002:a5d:610c:0:b0:298:4baf:ac90 with SMTP id
 v12-20020a5d610c000000b002984bafac90mr13475566wrt.57.1673119115337; 
 Sat, 07 Jan 2023 11:18:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXua74oQHWAH/8OePWJMn+DrJj0yE1hc3dEeBReQXZp1oaElN/Pj5AFK5B1cutcQrisGMyzEYg==
X-Received: by 2002:a5d:610c:0:b0:298:4baf:ac90 with SMTP id
 v12-20020a5d610c000000b002984bafac90mr13475562wrt.57.1673119115128; 
 Sat, 07 Jan 2023 11:18:35 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] drm/panel-leadtek-ltk050h3146w: Drop custom DSI
 write macro
Date: Sat,  7 Jan 2023 20:18:12 +0100
Message-Id: <20230107191822.3787147-4-javierm@redhat.com>
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

 .../drm/panel/panel-leadtek-ltk050h3146w.c    | 106 ++++++++----------
 1 file changed, 49 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 5619f186d28c..d2efd887484b 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -244,14 +244,6 @@ struct ltk050h3146w *panel_to_ltk050h3146w(struct drm_panel *panel)
 	return container_of(panel, struct ltk050h3146w, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 b[] = { cmd, seq };			\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
@@ -261,55 +253,55 @@ static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	dsi_dcs_write_seq(dsi, 0xdf, 0x93, 0x65, 0xf8);
-	dsi_dcs_write_seq(dsi, 0xb0, 0x01, 0x03, 0x02, 0x00, 0x64, 0x06,
-			  0x01);
-	dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0xb5);
-	dsi_dcs_write_seq(dsi, 0xb3, 0x00, 0xb5);
-	dsi_dcs_write_seq(dsi, 0xb7, 0x00, 0xbf, 0x00, 0x00, 0xbf, 0x00);
-
-	dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xc4, 0x23, 0x07);
-	dsi_dcs_write_seq(dsi, 0xbb, 0x02, 0x01, 0x24, 0x00, 0x28, 0x0f,
-			  0x28, 0x04, 0xcc, 0xcc, 0xcc);
-	dsi_dcs_write_seq(dsi, 0xbc, 0x0f, 0x04);
-	dsi_dcs_write_seq(dsi, 0xbe, 0x1e, 0xf2);
-	dsi_dcs_write_seq(dsi, 0xc0, 0x26, 0x03);
-	dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x12);
-	dsi_dcs_write_seq(dsi, 0xc3, 0x04, 0x02, 0x02, 0x76, 0x01, 0x80,
-			  0x80);
-	dsi_dcs_write_seq(dsi, 0xc4, 0x24, 0x80, 0xb4, 0x81, 0x12, 0x0f,
-			  0x16, 0x00, 0x00);
-	dsi_dcs_write_seq(dsi, 0xc8, 0x7f, 0x72, 0x67, 0x5d, 0x5d, 0x50,
-			  0x56, 0x41, 0x59, 0x57, 0x55, 0x70, 0x5b, 0x5f,
-			  0x4f, 0x47, 0x38, 0x23, 0x08, 0x7f, 0x72, 0x67,
-			  0x5d, 0x5d, 0x50, 0x56, 0x41, 0x59, 0x57, 0x55,
-			  0x70, 0x5b, 0x5f, 0x4f, 0x47, 0x38, 0x23, 0x08);
-	dsi_dcs_write_seq(dsi, 0xd0, 0x1e, 0x1f, 0x57, 0x58, 0x48, 0x4a,
-			  0x44, 0x46, 0x40, 0x1f, 0x42, 0x1f, 0x1f, 0x1f,
-			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	dsi_dcs_write_seq(dsi, 0xd1, 0x1e, 0x1f, 0x57, 0x58, 0x49, 0x4b,
-			  0x45, 0x47, 0x41, 0x1f, 0x43, 0x1f, 0x1f, 0x1f,
-			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	dsi_dcs_write_seq(dsi, 0xd2, 0x1f, 0x1e, 0x17, 0x18, 0x07, 0x05,
-			  0x0b, 0x09, 0x03, 0x1f, 0x01, 0x1f, 0x1f, 0x1f,
-			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	dsi_dcs_write_seq(dsi, 0xd3, 0x1f, 0x1e, 0x17, 0x18, 0x06, 0x04,
-			  0x0a, 0x08, 0x02, 0x1f, 0x00, 0x1f, 0x1f, 0x1f,
-			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	dsi_dcs_write_seq(dsi, 0xd4, 0x00, 0x00, 0x00, 0x0c, 0x06, 0x20,
-			  0x01, 0x02, 0x00, 0x60, 0x15, 0xb0, 0x30, 0x03,
-			  0x04, 0x00, 0x60, 0x72, 0x0a, 0x00, 0x60, 0x08);
-	dsi_dcs_write_seq(dsi, 0xd5, 0x00, 0x06, 0x06, 0x00, 0x30, 0x00,
-			  0x00, 0x00, 0x00, 0x00, 0xbc, 0x50, 0x00, 0x05,
-			  0x21, 0x00, 0x60);
-	dsi_dcs_write_seq(dsi, 0xdd, 0x2c, 0xa3, 0x00);
-	dsi_dcs_write_seq(dsi, 0xde, 0x02);
-	dsi_dcs_write_seq(dsi, 0xb2, 0x32, 0x1c);
-	dsi_dcs_write_seq(dsi, 0xb7, 0x3b, 0x70, 0x00, 0x04);
-	dsi_dcs_write_seq(dsi, 0xc1, 0x11);
-	dsi_dcs_write_seq(dsi, 0xbb, 0x21, 0x22, 0x23, 0x24, 0x36, 0x37);
-	dsi_dcs_write_seq(dsi, 0xc2, 0x20, 0x38, 0x1e, 0x84);
-	dsi_dcs_write_seq(dsi, 0xde, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x93, 0x65, 0xf8);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x01, 0x03, 0x02, 0x00, 0x64, 0x06,
+			       0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0xb5);
+	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x00, 0xb5);
+	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x00, 0xbf, 0x00, 0x00, 0xbf, 0x00);
+
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xc4, 0x23, 0x07);
+	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x02, 0x01, 0x24, 0x00, 0x28, 0x0f,
+			       0x28, 0x04, 0xcc, 0xcc, 0xcc);
+	mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x0f, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0xbe, 0x1e, 0xf2);
+	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x26, 0x03);
+	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x12);
+	mipi_dsi_dcs_write_seq(dsi, 0xc3, 0x04, 0x02, 0x02, 0x76, 0x01, 0x80,
+			       0x80);
+	mipi_dsi_dcs_write_seq(dsi, 0xc4, 0x24, 0x80, 0xb4, 0x81, 0x12, 0x0f,
+			       0x16, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xc8, 0x7f, 0x72, 0x67, 0x5d, 0x5d, 0x50,
+			       0x56, 0x41, 0x59, 0x57, 0x55, 0x70, 0x5b, 0x5f,
+			       0x4f, 0x47, 0x38, 0x23, 0x08, 0x7f, 0x72, 0x67,
+			       0x5d, 0x5d, 0x50, 0x56, 0x41, 0x59, 0x57, 0x55,
+			       0x70, 0x5b, 0x5f, 0x4f, 0x47, 0x38, 0x23, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xd0, 0x1e, 0x1f, 0x57, 0x58, 0x48, 0x4a,
+			       0x44, 0x46, 0x40, 0x1f, 0x42, 0x1f, 0x1f, 0x1f,
+			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq(dsi, 0xd1, 0x1e, 0x1f, 0x57, 0x58, 0x49, 0x4b,
+			       0x45, 0x47, 0x41, 0x1f, 0x43, 0x1f, 0x1f, 0x1f,
+			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x1f, 0x1e, 0x17, 0x18, 0x07, 0x05,
+			       0x0b, 0x09, 0x03, 0x1f, 0x01, 0x1f, 0x1f, 0x1f,
+			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq(dsi, 0xd3, 0x1f, 0x1e, 0x17, 0x18, 0x06, 0x04,
+			       0x0a, 0x08, 0x02, 0x1f, 0x00, 0x1f, 0x1f, 0x1f,
+			       0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x00, 0x00, 0x00, 0x0c, 0x06, 0x20,
+			       0x01, 0x02, 0x00, 0x60, 0x15, 0xb0, 0x30, 0x03,
+			       0x04, 0x00, 0x60, 0x72, 0x0a, 0x00, 0x60, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xd5, 0x00, 0x06, 0x06, 0x00, 0x30, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0xbc, 0x50, 0x00, 0x05,
+			       0x21, 0x00, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x2c, 0xa3, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x32, 0x1c);
+	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x3b, 0x70, 0x00, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x11);
+	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x21, 0x22, 0x23, 0x24, 0x36, 0x37);
+	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x20, 0x38, 0x1e, 0x84);
+	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x00);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, 1);
 	if (ret < 0) {
-- 
2.38.1

