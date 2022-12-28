Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE06571D0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9361710E370;
	Wed, 28 Dec 2022 01:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66A10E36A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFLyXnnWWLV2WFqSFA8goZjk6zRci0Sl+99Zm9465ac=;
 b=O0Bff68YJELQ1RgvQy4zwEMXnIHRXu93B9rkJev4RkTIRkUAlcOTi3WoebKgncm+YSvtNR
 JB/ArxB30XpDX30H1IJ14r4cOE13OYuKhy91ulUcccXaCmyBkBOSRo6wPQFHcqAx703tum
 LZXhpcBzPjktB+ocQ12nW7xBgbnmW84=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-jC9Ag7qzOjKGFxIfwFqxeg-1; Tue, 27 Dec 2022 20:48:24 -0500
X-MC-Unique: jC9Ag7qzOjKGFxIfwFqxeg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso7617209wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFLyXnnWWLV2WFqSFA8goZjk6zRci0Sl+99Zm9465ac=;
 b=2boavlTzNArFkgwfDvv54N3bEm380cUYuxLQ4C5/WNZXTZE+1hcK/wE6UZRDFyfsCE
 Qur4O/UjmLHBSWj1SnYZX2sBiChSwkcS8cwrkV/qK7ObetUIJcU9fuTQ0WrhoMqcvs7k
 h8qXr82v0CVMI3tZFHJvX5ScRiddor+wKV6t/x8SAXUyBp/ajKNlZsd9jhswvFPlk3kp
 87ieLb/3GYmSl1BJ+QkIuCPD5r6RLFanE/OELdRH0K22EKfOgzyFy9JzTUt8Udt6RxGg
 HR3eb9kvP0AdsqNy6umAVemmJ37PNpnkREROL3YDtgNhQgBWU7UVC3YdC6JnyGvQxmQB
 xbgA==
X-Gm-Message-State: AFqh2koRDB4qViEPdSJvWZCFU3ZruK9OUI98FNwoRtM4wsDCtKQt9o4O
 V1car9fTcLP/PrOhfTcFy/jK20ElcOASCt/DJsLC13PuxCSQ0D6bwFVpzpwxj7UMy0ZA4PCc57T
 PdvudMYiB16bRAdfXKUVZpMKlccYp
X-Received: by 2002:adf:f243:0:b0:26d:798f:ab8a with SMTP id
 b3-20020adff243000000b0026d798fab8amr12795225wrp.68.1672192103554; 
 Tue, 27 Dec 2022 17:48:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvN08ikHqxEdwe0XuYcR9XedLDUgccllFpcGIC3jMI8Eb83v8+q0wvMG7cAIKpa5v3FBH8MNA==
X-Received: by 2002:adf:f243:0:b0:26d:798f:ab8a with SMTP id
 b3-20020adff243000000b0026d798fab8amr12795224wrp.68.1672192103369; 
 Tue, 27 Dec 2022 17:48:23 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] drm/panel-xinpeng-xpp055c272: Drop custom DSI write
 macro
Date: Wed, 28 Dec 2022 02:47:57 +0100
Message-Id: <20221228014757.3170486-15-javierm@redhat.com>
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

There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macro defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 44 ++++++++-----------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 2c54733ee241..230d87ba139a 100644
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
@@ -77,37 +69,37 @@ static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
 			      0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
 			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
 			      0x00, 0x00, 0x37);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
 			      0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
 			      0x00, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETSCR,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETSCR,
 			      0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
 			      0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEQ,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEQ,
 			      0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
 			      0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER,
 			      0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
 			      0x67, 0x77, 0x33, 0x33);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
 			      0xff, 0x01, 0xff);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
 	msleep(20);
 
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP1,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP1,
 			      0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
 			      0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
 			      0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
@@ -116,7 +108,7 @@ static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
 			      0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
 			      0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP2,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP2,
 			      0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
 			      0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
 			      0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
@@ -125,7 +117,7 @@ static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
 			      0xa0, 0x00, 0x00, 0x00, 0x00);
-	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
+	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
 			      0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
 			      0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
 			      0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
-- 
2.38.1

