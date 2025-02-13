Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F5EA34FA7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F085E10E12A;
	Thu, 13 Feb 2025 20:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NQdEGSXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDF110E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739479494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxIudAwiodXu+efjkuYGkw8mYQ0EhVAO/dg0ccmUYRc=;
 b=NQdEGSXpIuhkAFOLT8yC0um8S0qqi70VDZom6gKiaszW7vjkYttE67SNr3StBXrNG8uyJQ
 eZxqfWK9+7jYEXi4zX11BQUAYAmiDGsUPCqZ0jh6gZHbKsA97ExI3Q4cjZkksR88WA/d/5
 BIrEm/MhVu8Ue9yiiJru7nw/5L16FUo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-2IBAofguN3q2KvTzfbzHyQ-1; Thu,
 13 Feb 2025 15:44:48 -0500
X-MC-Unique: 2IBAofguN3q2KvTzfbzHyQ-1
X-Mimecast-MFC-AGG-ID: 2IBAofguN3q2KvTzfbzHyQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5991918EB2C6; Thu, 13 Feb 2025 20:44:46 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6FA22190C541; Thu, 13 Feb 2025 20:44:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:18 -0500
Subject: [PATCH 01/20] drm/panel/xpp055c272: Move to using
 mipi_dsi_*_multi() variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-1-67d94ff319cc@redhat.com>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
In-Reply-To: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=9544;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Ji1IMwfX0RgwbuCUinW5nqB8cLw/NdTKOwX7McI533E=;
 b=rNCSfwojFqzcR39hUTeSFiiSDPMbORUXrvPJFaTGMVjKV7YG/umKOcMczsiP81vwtxYCwvU43
 qKWzSoWU7Y9CGK5fN22VbrjY0reDeWkCLirk2CT71NnVlZ41PPbaMfn
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Stop using deprecated API.
Used Coccinelle to make the change.

@rule_3@
identifier dsi_var;
identifier r;
identifier func;
type t;
position p;
expression dsi_device;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
(
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_set_display_off(dsi_var)@p;
+mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
|
.....//rest of the mipi APIs with _multi variant
)
<+...
-if(r < 0) {
-...
-}
...+>
}

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c | 138 +++++++++++------------
 1 file changed, 67 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 22a14006765ed23da23da9cb39c637913c4f3090..ccd8659f30529f58fb8ed013ccb792f2040b2f51 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -62,66 +62,75 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
 static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = ctx->dev;
 
 	/*
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETMIPI,
-			       0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
-			       0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
-			       0x00, 0x00, 0x37);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
-			       0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
-			       0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETSCR,
-			       0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
-			       0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEQ,
-			       0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
-			       0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER,
-			       0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
-			       0x67, 0x77, 0x33, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
-			       0xff, 0x01, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETEXTC, 0xf1,
+				     0x12, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETMIPI, 0x33,
+				     0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44,
+				     0x25, 0x00, 0x91, 0x0a, 0x00, 0x00, 0x02,
+				     0x4f, 0x01, 0x00, 0x00, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPOWER_EXT,
+				     0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPCR, 0x02,
+				     0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETRGBIF, 0x0c,
+				     0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETSCR, 0x73,
+				     0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETVDC, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPANEL, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETDISP, 0xc8,
+				     0x12, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETEQ, 0x07,
+				     0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
+				     0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPOWER, 0x53,
+				     0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
+				     0x67, 0x77, 0x33, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETECO, 0x00,
+				     0x00, 0xff, 0xff, 0x01, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETBGP, 0x09,
+				     0x09);
 	msleep(20);
 
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP1,
-			       0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
-			       0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
-			       0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
-			       0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
-			       0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
-			       0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
-			       0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP2,
-			       0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
-			       0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
-			       0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
-			       0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
-			       0xa0, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
-			       0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
-			       0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
-			       0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
-			       0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
-			       0x11, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETVCOM, 0x87,
+				     0x95);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETGIP1, 0xc2,
+				     0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
+				     0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37,
+				     0x18, 0x00, 0x80, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x48,
+				     0xf8, 0x86, 0x42, 0x08, 0x88, 0x88, 0x80,
+				     0x88, 0x88, 0x88, 0x58, 0xf8, 0x87, 0x53,
+				     0x18, 0x88, 0x88, 0x81, 0x88, 0x88, 0x88,
+				     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETGIP2, 0x00,
+				     0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81,
+				     0x35, 0x78, 0x88, 0x88, 0x85, 0x88, 0x88,
+				     0x88, 0x0f, 0x88, 0x80, 0x24, 0x68, 0x88,
+				     0x88, 0x84, 0x88, 0x88, 0x88, 0x23, 0x10,
+				     0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x30, 0x05, 0xa0,
+				     0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETGAMMA, 0x00,
+				     0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
+				     0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
+				     0x11, 0x18, 0x00, 0x06, 0x08, 0x2a, 0x31,
+				     0x3f, 0x38, 0x36, 0x07, 0x0c, 0x0d, 0x11,
+				     0x13, 0x12, 0x13, 0x11, 0x18);
 
 	msleep(60);
 
@@ -133,17 +142,11 @@ static int xpp055c272_unprepare(struct drm_panel *panel)
 {
 	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vci);
@@ -155,6 +158,7 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 {
 	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	int ret;
 
 	dev_dbg(ctx->dev, "Resetting the panel\n");
@@ -183,20 +187,12 @@ static int xpp055c272_prepare(struct drm_panel *panel)
 		goto disable_iovcc;
 	}
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
-		goto disable_iovcc;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	/* T9: 120ms */
 	msleep(120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
-		goto disable_iovcc;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	msleep(50);
 

-- 
2.47.0

