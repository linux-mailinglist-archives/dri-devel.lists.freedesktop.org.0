Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A0A34FB9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3168910EB9B;
	Thu, 13 Feb 2025 20:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fPsTuLo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9D810EB9B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739479537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhlsWximTz7SM0eXj6/ntZGY/brqFKDtzIbgKalU1c0=;
 b=fPsTuLo8Bglbq+26r4mzTmCYWZhqnEDmkjdbOaGCULwzFk1py2KCSqHZfxhkGACFwIStGU
 uA0vXEEb8Jdpz1m2xNRFuMBOGSeL/SKES7cPtcw/XDrnSV6NtdxbuVfiKAMO50jVki6/AR
 Dzeylg3izF1Pky6Fn6Z4e5NcEMHkkiY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-199-ZeCav7lZM_WT0AlM83Wntg-1; Thu,
 13 Feb 2025 15:45:34 -0500
X-MC-Unique: ZeCav7lZM_WT0AlM83Wntg-1
X-Mimecast-MFC-AGG-ID: ZeCav7lZM_WT0AlM83Wntg_1739479532
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 22CD91800871; Thu, 13 Feb 2025 20:45:32 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E203719373D9; Thu, 13 Feb 2025 20:45:28 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:30 -0500
Subject: [PATCH 13/20] drm/panel/samsung-s6d7aa0:Move to using
 mipi_dsi_*_multi() variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-13-67d94ff319cc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=8860;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=s7pkylKj9Id4dUrLKbPumaUbKjaG4N7AczlbfdWejBw=;
 b=xwoKSFa+Sr+JD9ljrYv5QeATeHYpxSMfK0AIgL6f9p87bHCo5P+vL/7d/W9vGKGHfRm+tqwDC
 6SIod3dWci2CD3ZPQ1DdpCcpELY8oKbl7GLiNtFNSLAVUTUeS81eqlA
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
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 101 ++++++++++++++------------
 1 file changed, 56 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index f23d8832a1ad055483b1f513557cb3d2807e3692..c451b2f7e9843a109767516f3138718a1345297f 100644
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
@@ -84,6 +91,7 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 static int s6d7aa0_on(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -94,11 +102,7 @@ static int s6d7aa0_on(struct s6d7aa0 *ctx)
 		return ret;
 	}
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	return 0;
 }
@@ -184,12 +188,10 @@ static int s6d7aa0_unprepare(struct drm_panel *panel)
 static int s6d7aa0_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	u16 brightness = backlight_get_brightness(bl);
-	int ret;
 
-	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);
 
 	return 0;
 }
@@ -231,6 +233,7 @@ s6d7aa0_create_backlight(struct mipi_dsi_device *dsi)
 static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -242,18 +245,19 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
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
@@ -262,7 +266,8 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 	}
 
 	msleep(120);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_ADDRESS_MODE,
+				     0x00);
 
 	ret = s6d7aa0_lock(ctx, true);
 	if (ret < 0) {
@@ -282,9 +287,10 @@ static int s6d7aa0_lsl080al02_init(struct s6d7aa0 *ctx)
 static int s6d7aa0_lsl080al02_off(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	/* BL_CTL_OFF */
-	mipi_dsi_dcs_write_seq(dsi, MCS_BL_CTL, 0x40, 0x00, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_BL_CTL, 0x40, 0x00, 0x20);
 
 	return 0;
 }
@@ -320,6 +326,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = &dsi->dev;
 	int ret;
 
@@ -332,35 +339,38 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
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
@@ -386,8 +396,9 @@ static int s6d7aa0_lsl080al03_init(struct s6d7aa0 *ctx)
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

