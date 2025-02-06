Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D400EA2B3DD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF08810E961;
	Thu,  6 Feb 2025 21:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="arhEQ9YQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8E10E958
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738876002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/UhG9vle5FlwgqCrHh16UYubGe5efDjOrrlvsHsEq8=;
 b=arhEQ9YQMG/z81XcQ37MqUNoivF9HdxWd4SpEFvKst/CClyrIicqadbpOBj6I+ORCDOYfB
 WZZ0PURcq1IIwsH3EPV5gr0BNrV6d25ugEQrUvtrIgafb3OokY5TB4KMUis8a81W0rrupT
 mkAF28YraBBkJIDbjEaJLBO5kY8/8eI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-F_XVZp4ENem0mdFPQHBsJw-1; Thu,
 06 Feb 2025 16:06:35 -0500
X-MC-Unique: F_XVZp4ENem0mdFPQHBsJw-1
X-Mimecast-MFC-AGG-ID: F_XVZp4ENem0mdFPQHBsJw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BC04A19560B5; Thu,  6 Feb 2025 21:06:33 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A0CBE1800115; Thu,  6 Feb 2025 21:06:30 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:00 -0500
Subject: [PATCH 05/14] drm/panel/samsung-s6d7aa0: Move to using
 mipi_dsi_dcs_write_seq_multi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-5-4ff0c69e8897@redhat.com>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=7376;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=U89i+DA88VcxSD1PykNrx22CaQnRllVlhhQni/zEhYk=;
 b=hs1fFQ2uWtD5bsImBN+zNhuVQxO27AqFGXhfh012E9QcnTd+2P8fA9/HN3y5imgmqSMqx7hyK
 mi99ZVavQEkAC0E43wpQ9w+lN3+d+3RcEKjH7l4KPPXQa11/wKW67LA
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

Use mipi_dsi_dcs_write_seq_multi() instead of
mipi_dsi_dcs_write_seq()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier dsi_var;
expression dsi_device;
expression list es;
@@
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
...+>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 88 ++++++++++++++++-----------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index f23d8832a1ad055483b1f513557cb3d2807e3692..b7cc98163db601a3c4c30c39818eb036f825001c 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -65,17 +65,24 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
 static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	if (lock) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0xa5, 0xa5);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0xa5,
+					     0xa5);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0xa5,
+					     0xa5);
 		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0x5a, 0x5a);
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD3,
+						     0x5a, 0x5a);
 	} else {
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0x5a, 0x5a);
-		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD2, 0x5a, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD1, 0x5a,
+					     0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD2, 0x5a,
+					     0x5a);
 		if (ctx->desc->use_passwd3)
-			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_PASSWD3,
+						     0xa5, 0xa5);
 	}
 
 	return 0;
@@ -231,6 +238,7 @@ s6d7aa0_create_backlight(struct mipi_dsi_device *dsi)
 static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -242,18 +250,19 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, MCS_OTP_RELOAD, 0x00, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_OTP_RELOAD, 0x00, 0x10);
 	usleep_range(1000, 1500);
 
 	/* SEQ_B6_PARAM_8_R01 */
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x10);
 
 	/* BL_CTL_ON */
-	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x28);
 
 	usleep_range(5000, 6000);
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE,
+				     0x04);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -262,7 +271,8 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 	}
 
 	msleep(120);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE,
+				     0x00);
 
 	ret = s6d7aa0_lock(ctx, true);
 	if (ret < 0) {
@@ -282,9 +292,10 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 static int s6d7aa0_lsl080al02_off(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* BL_CTL_OFF */
-	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x20);
 
 	return 0;
 }
@@ -320,6 +331,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -332,35 +344,38 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 	}
 
 	if (ctx->desc->panel_type == S6D7AA0_PANEL_LSL080AL03) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0xc7, 0x00, 0x29);
-		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0xa0);
-		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
-				       0x09);
-		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
-				       0x80, 0x78);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0xc7, 0x00,
+					     0x29);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x01, 0x4e, 0xa0);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x16, 0x10, 0x11,
+					     0x23, 0x09);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00, 0x02, 0x03,
+					     0x21, 0x80, 0x78);
 	} else if (ctx->desc->panel_type == S6D7AA0_PANEL_LTL101AT01) {
-		mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x08);
-		mipi_dsi_dcs_write_seq(dsi, 0xbc, 0x01, 0x4e, 0x0b);
-		mipi_dsi_dcs_write_seq(dsi, 0xfd, 0x16, 0x10, 0x11, 0x23,
-				       0x09);
-		mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00, 0x02, 0x03, 0x21,
-				       0x80, 0x68);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0x40, 0x00,
+					     0x08);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x01, 0x4e, 0x0b);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x16, 0x10, 0x11,
+					     0x23, 0x09);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00, 0x02, 0x03,
+					     0x21, 0x80, 0x68);
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x51);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x02, 0x08, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x02, 0x08, 0x08);
 
 	usleep_range(10000, 11000);
 
-	mipi_dsi_dcs_write_seq(dsi, 0xc0, 0x80, 0x80, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xcd,
-			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e,
-			       0x2e, 0x2e, 0x2e, 0x2e, 0x2e);
-	mipi_dsi_dcs_write_seq(dsi, 0xce,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x80, 0x80, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x2e, 0x2e, 0x2e, 0x2e,
+				     0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e, 0x2e,
+				     0x2e, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xce, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x03);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -386,8 +401,9 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 static int s6d7aa0_lsl080al03_off(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x00);
 
 	return 0;
 }

-- 
2.47.0

