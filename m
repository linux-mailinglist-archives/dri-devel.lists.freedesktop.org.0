Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7074A34FB3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB8910EB99;
	Thu, 13 Feb 2025 20:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BWovQkak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048AB10EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739479521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+cMoYciasSX2vRkdUHmq/g/CR80WMJ4GN9eoHQeags=;
 b=BWovQkakX8N74eQzz8Lq2I4qSVGMkKohjpirBEeenrBp6b6XnsBzQL/b67CwzA05bAFXgd
 UZvsN4qfdrpI9jTyqNl85EMgSiwTW1DkgvigPd5zJCJ/IPkj75aoFukUuh/z8wdQaVMCST
 eDToMJqqIOSQ0pgvkW9FqVtg0/gMoWE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-pKiiWcjGPyqk8P7LlUxofA-1; Thu,
 13 Feb 2025 15:45:16 -0500
X-MC-Unique: pKiiWcjGPyqk8P7LlUxofA-1
X-Mimecast-MFC-AGG-ID: pKiiWcjGPyqk8P7LlUxofA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F2430180034A; Thu, 13 Feb 2025 20:45:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8BC3819373D9; Thu, 13 Feb 2025 20:45:10 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:25 -0500
Subject: [PATCH 08/20] drm/panel/himax-hx8394: Move to using
 mipi_dsi_*_multi() variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-8-67d94ff319cc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=25486;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=F57E2h+Umkk7ghGjc2SQix3GA7o47Z+j9jzqZ6SZs/k=;
 b=8tdASyegQlf0CrRmjYjXq8EY3r9KavcF78lGQ76j0l9p6tSOYB3wYQWGE8sbIT+JBD/l18l6d
 yRL8OuGicSxBqY8HB0of4VxDHfUruIkCqrufLGIkB7srFa9Wq2S4PVe
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
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 389 +++++++++++++----------------
 1 file changed, 178 insertions(+), 211 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index 92b03a2f65a3594a43e42e9df88f824084349b61..5ea6761f900144db00f09a540b20a00a7736dd64 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -91,93 +91,93 @@ static inline struct hx8394 *panel_to_hx8394(struct drm_panel *panel)
 static int hsd060bhw4_init_sequence(struct hx8394 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* 5.19.8 SETEXTC: Set extension command (B9h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
-			       0xff, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETEXTC, 0xff, 0x83,
+				     0x94);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x48, 0x11, 0x71, 0x09, 0x32, 0x24, 0x71, 0x31, 0x55, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPOWER, 0x48,
+				     0x11, 0x71, 0x09, 0x32, 0x24, 0x71, 0x31,
+				     0x55, 0x30);
 
 	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
-			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETMIPI, 0x63, 0x03,
+				     0x68, 0x6b, 0xb2, 0xc0);
 
 	/* 5.19.3 SETDISP: Set display related register (B2h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
-			       0x00, 0x80, 0x78, 0x0c, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETDISP, 0x00, 0x80,
+				     0x78, 0x0c, 0x07);
 
 	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
-			       0x12, 0x63, 0x12, 0x63, 0x12, 0x63, 0x01, 0x0c, 0x7c, 0x55,
-			       0x00, 0x3f, 0x12, 0x6b, 0x12, 0x6b, 0x12, 0x6b, 0x01, 0x0c,
-			       0x7c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETCYC, 0x12, 0x63,
+				     0x12, 0x63, 0x12, 0x63, 0x01, 0x0c, 0x7c,
+				     0x55, 0x00, 0x3f, 0x12, 0x6b, 0x12, 0x6b,
+				     0x12, 0x6b, 0x01, 0x0c, 0x7c);
 
 	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
-			       0x00, 0x00, 0x00, 0x00, 0x3c, 0x1c, 0x00, 0x00, 0x32, 0x10,
-			       0x09, 0x00, 0x09, 0x32, 0x15, 0xad, 0x05, 0xad, 0x32, 0x00,
-			       0x00, 0x00, 0x00, 0x37, 0x03, 0x0b, 0x0b, 0x37, 0x00, 0x00,
-			       0x00, 0x0c, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP0, 0x00, 0x00,
+				     0x00, 0x00, 0x3c, 0x1c, 0x00, 0x00, 0x32,
+				     0x10, 0x09, 0x00, 0x09, 0x32, 0x15, 0xad,
+				     0x05, 0xad, 0x32, 0x00, 0x00, 0x00, 0x00,
+				     0x37, 0x03, 0x0b, 0x0b, 0x37, 0x00, 0x00,
+				     0x00, 0x0c, 0x40);
 
 	/* 5.19.20 Set GIP Option1 (D5h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
-			       0x19, 0x19, 0x18, 0x18, 0x1b, 0x1b, 0x1a, 0x1a, 0x00, 0x01,
-			       0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x20, 0x21, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x24, 0x25, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP1, 0x19, 0x19,
+				     0x18, 0x18, 0x1b, 0x1b, 0x1a, 0x1a, 0x00,
+				     0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+				     0x20, 0x21, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x24, 0x25, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.21 Set GIP Option2 (D6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
-			       0x18, 0x18, 0x19, 0x19, 0x1b, 0x1b, 0x1a, 0x1a, 0x07, 0x06,
-			       0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x25, 0x24, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP2, 0x18, 0x18,
+				     0x19, 0x19, 0x1b, 0x1b, 0x1a, 0x1a, 0x07,
+				     0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
+				     0x25, 0x24, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
-			       0x00, 0x04, 0x0c, 0x12, 0x14, 0x18, 0x1a, 0x18, 0x31, 0x3f,
-			       0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f, 0x82, 0x7e, 0x8a,
-			       0x99, 0x4a, 0x48, 0x49, 0x4b, 0x4a, 0x4c, 0x4b, 0x7f, 0x00,
-			       0x04, 0x0c, 0x11, 0x13, 0x17, 0x1a, 0x18, 0x31,
-			       0x3f, 0x4d, 0x4c, 0x54, 0x65, 0x6b, 0x70, 0x7f,
-			       0x82, 0x7e, 0x8a, 0x99, 0x4a, 0x48, 0x49, 0x4b,
-			       0x4a, 0x4c, 0x4b, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGAMMA, 0x00,
+				     0x04, 0x0c, 0x12, 0x14, 0x18, 0x1a, 0x18,
+				     0x31, 0x3f, 0x4d, 0x4c, 0x54, 0x65, 0x6b,
+				     0x70, 0x7f, 0x82, 0x7e, 0x8a, 0x99, 0x4a,
+				     0x48, 0x49, 0x4b, 0x4a, 0x4c, 0x4b, 0x7f,
+				     0x00, 0x04, 0x0c, 0x11, 0x13, 0x17, 0x1a,
+				     0x18, 0x31, 0x3f, 0x4d, 0x4c, 0x54, 0x65,
+				     0x6b, 0x70, 0x7f, 0x82, 0x7e, 0x8a, 0x99,
+				     0x4a, 0x48, 0x49, 0x4b, 0x4a, 0x4c, 0x4b,
+				     0x7f);
 
 	/* 5.19.17 SETPANEL (CCh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
-			       0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPANEL, 0x0b);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
-			       0x1f, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN1, 0x1f,
+				     0x31);
 
 	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
-			       0x7d, 0x7d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETVCOM, 0x7d, 0x7d);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN3, 0x02);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x01);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPOWER, 0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x00);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0xed);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN3, 0xed);
 
 	return 0;
 }
@@ -208,109 +208,108 @@ static const struct hx8394_panel_desc hsd060bhw4_desc = {
 static int powkiddy_x55_init_sequence(struct hx8394 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* 5.19.8 SETEXTC: Set extension command (B9h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
-			       0xff, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETEXTC, 0xff, 0x83,
+				     0x94);
 
 	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
-			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETMIPI, 0x63, 0x03,
+				     0x68, 0x6b, 0xb2, 0xc0);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPOWER, 0x48,
+				     0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71,
+				     0x57, 0x47);
 
 	/* 5.19.3 SETDISP: Set display related register (B2h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
-			       0x00, 0x80, 0x64, 0x2c, 0x16, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETDISP, 0x00, 0x80,
+				     0x64, 0x2c, 0x16, 0x2f);
 
 	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
-			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
-			       0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
-			       0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETCYC, 0x73, 0x74,
+				     0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86,
+				     0x75, 0x00, 0x3f, 0x73, 0x74, 0x73, 0x74,
+				     0x73, 0x74, 0x01, 0x0c, 0x86);
 
 	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
-			       0x6e, 0x6e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETVCOM, 0x6e, 0x6e);
 
 	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
-			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
-			       0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
-			       0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
-			       0x07, 0x0c, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP0, 0x00, 0x00,
+				     0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08,
+				     0x10, 0x08, 0x00, 0x08, 0x54, 0x15, 0x0a,
+				     0x05, 0x0a, 0x02, 0x15, 0x06, 0x05, 0x06,
+				     0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+				     0x07, 0x0c, 0x40);
 
 	/* 5.19.20 Set GIP Option1 (D5h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
-			       0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
-			       0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
-			       0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP1, 0x1c, 0x1c,
+				     0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04,
+				     0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b,
+				     0x24, 0x25, 0x18, 0x18, 0x26, 0x27, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.21 Set GIP Option2 (D6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
-			       0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
-			       0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
-			       0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP2, 0x1c, 0x1c,
+				     0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03,
+				     0x02, 0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08,
+				     0x21, 0x20, 0x18, 0x18, 0x27, 0x26, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x25, 0x24, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
-			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56,
-			       0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 0x98, 0xa8,
-			       0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
-			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56, 0x65,
-			       0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
-			       0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGAMMA, 0x00,
+				     0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22,
+				     0x47, 0x56, 0x65, 0x66, 0x6e, 0x82, 0x88,
+				     0x8b, 0x9a, 0x9d, 0x98, 0xa8, 0xb9, 0x5d,
+				     0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f,
+				     0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24,
+				     0x22, 0x47, 0x56, 0x65, 0x65, 0x6e, 0x81,
+				     0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
+				     0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f,
+				     0x7f);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
-			       0x1f, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN1, 0x1f,
+				     0x31);
 
 	/* 5.19.17 SETPANEL (CCh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
-			       0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPANEL, 0x0b);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN3, 0x02);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x02);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
-			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-			       0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN4, 0xff,
+				     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff, 0xff, 0xff);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x01);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPOWER, 0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x00);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN5,
-			       0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN5, 0x40,
+				     0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
 
 	/* Unknown command, not listed in the HX8394-F datasheet */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
-			       0xed);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN2, 0xed);
 
 	return 0;
 }
@@ -342,126 +341,111 @@ static const struct hx8394_panel_desc powkiddy_x55_desc = {
 static int mchp_ac40t08a_init_sequence(struct hx8394 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* DCS commands do not seem to be sent correclty without this delay */
 	msleep(20);
 
 	/* 5.19.8 SETEXTC: Set extension command (B9h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
-			       0xff, 0x83, 0x94);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETEXTC, 0xff, 0x83,
+				     0x94);
 
 	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
-			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETMIPI, 0x63, 0x03,
+				     0x68, 0x6b, 0xb2, 0xc0);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54,
-			       0x71, 0x71, 0x57, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPOWER, 0x48,
+				     0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71,
+				     0x57, 0x47);
 
 	/* 5.19.3 SETDISP: Set display related register (B2h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
-			       0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETDISP, 0x00, 0x80,
+				     0x64, 0x0c, 0x0d, 0x2f);
 
 	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
-			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
-			       0x01, 0x0c, 0x86, 0x75, 0x00, 0x3f,
-			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74,
-			       0x01, 0x0c, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETCYC, 0x73, 0x74,
+				     0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86,
+				     0x75, 0x00, 0x3f, 0x73, 0x74, 0x73, 0x74,
+				     0x73, 0x74, 0x01, 0x0c, 0x86);
 
 	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
-			       0x6e, 0x6e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETVCOM, 0x6e, 0x6e);
 
 	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
-			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07,
-			       0x0c, 0x00, 0x08, 0x10, 0x08, 0x00,
-			       0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a,
-			       0x02, 0x15, 0x06, 0x05, 0x06, 0x47,
-			       0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
-			       0x07, 0x0c, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP0, 0x00, 0x00,
+				     0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08,
+				     0x10, 0x08, 0x00, 0x08, 0x54, 0x15, 0x0a,
+				     0x05, 0x0a, 0x02, 0x15, 0x06, 0x05, 0x06,
+				     0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+				     0x07, 0x0c, 0x40);
 
 	/* 5.19.20 Set GIP Option1 (D5h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01,
-			       0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
-			       0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25,
-			       0x18, 0x18, 0x26, 0x27, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x20, 0x21, 0x18, 0x18,
-			       0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP1, 0x1c, 0x1c,
+				     0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04,
+				     0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b,
+				     0x24, 0x25, 0x18, 0x18, 0x26, 0x27, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.21 Set GIP Option2 (D6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
-			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06,
-			       0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
-			       0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20,
-			       0x18, 0x18, 0x27, 0x26, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
-			       0x18, 0x18, 0x25, 0x24, 0x18, 0x18,
-			       0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGIP2, 0x1c, 0x1c,
+				     0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03,
+				     0x02, 0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08,
+				     0x21, 0x20, 0x18, 0x18, 0x27, 0x26, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x25, 0x24, 0x18, 0x18, 0x18, 0x18);
 
 	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
-			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21,
-			       0x24, 0x22, 0x47, 0x56, 0x65, 0x66,
-			       0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d,
-			       0x98, 0xa8, 0xb9, 0x5d, 0x5c, 0x61,
-			       0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
-			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24,
-			       0x22, 0x47, 0x56, 0x65, 0x65, 0x6e,
-			       0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99,
-			       0xa8, 0xba, 0x5d, 0x5d, 0x62, 0x67,
-			       0x6b, 0x72, 0x7f, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETGAMMA, 0x00,
+				     0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22,
+				     0x47, 0x56, 0x65, 0x66, 0x6e, 0x82, 0x88,
+				     0x8b, 0x9a, 0x9d, 0x98, 0xa8, 0xb9, 0x5d,
+				     0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f,
+				     0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24,
+				     0x22, 0x47, 0x56, 0x65, 0x65, 0x6e, 0x81,
+				     0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
+				     0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f,
+				     0x7f);
 
 	/* Unknown command, not listed in the HX8394-F datasheet (C0H) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
-			       0x1f, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN1, 0x1f,
+				     0x73);
 
 	/* Set CABC control (C9h)*/
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCABC,
-			       0x76, 0x00, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETCABC, 0x76, 0x00,
+				     0x30);
 
 	/* 5.19.17 SETPANEL (CCh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
-			       0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPANEL, 0x0b);
 
 	/* Unknown command, not listed in the HX8394-F datasheet (D4h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN3, 0x02);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x02);
 
 	/* 5.19.11 Set register bank (D8h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
-			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN4, 0xff,
+				     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xff, 0xff, 0xff, 0xff);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x01);
 
 	/* 5.19.2 SETPOWER: Set power (B1h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETPOWER, 0x00);
 
 	/* 5.19.11 Set register bank (BDh) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
-			       0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_SETREGBANK, 0x00);
 
 	/* Unknown command, not listed in the HX8394-F datasheet (C6h) */
-	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
-			       0xed);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX8394_CMD_UNKNOWN2, 0xed);
 
 	return 0;
 }
@@ -493,6 +477,7 @@ static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	int ret;
 
 	ret = ctx->desc->init_sequence(ctx);
@@ -501,42 +486,24 @@ static int hx8394_enable(struct drm_panel *panel)
 		return ret;
 	}
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret) {
-		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	/* Panel is operational 120 msec after reset */
 	msleep(120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret) {
-		dev_err(ctx->dev, "Failed to turn on the display: %d\n", ret);
-		goto sleep_in;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	return 0;
 
-sleep_in:
-	/* This will probably fail, but let's try orderly power off anyway. */
-	if (!mipi_dsi_dcs_enter_sleep_mode(dsi))
-		msleep(50);
-
-	return ret;
 }
 
 static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret) {
-		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	msleep(50); /* about 3 frames */
 

-- 
2.47.0

