Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C4A34FBC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D446F10EB98;
	Thu, 13 Feb 2025 20:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WvtTz4wo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB1E10EB9C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739479539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiCjOiXbozOnRb7iKZEhrRmWWKrf2VGSUZwTCW9Xf1g=;
 b=WvtTz4wo8j5I6XH72aTuuXX4qorTFYCQYJmnnhfDQB+5oQq2h6MqRirO1CSNCy4RQd1Thm
 AVXRz6aLghVDnNCCKLBfR2Oxr6LnGZepmzV6WuXNFp7rFm/9izKxnikx0bI2WvTisbrjmP
 pv01qj8tE1U8oN8cS+DUA6QA79cbEvo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-Mf7HhN0YMuqbEnOaSdKG3Q-1; Thu,
 13 Feb 2025 15:45:38 -0500
X-MC-Unique: Mf7HhN0YMuqbEnOaSdKG3Q-1
X-Mimecast-MFC-AGG-ID: Mf7HhN0YMuqbEnOaSdKG3Q_1739479536
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0A7DB180034A; Thu, 13 Feb 2025 20:45:36 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C819D19373D9; Thu, 13 Feb 2025 20:45:32 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:31 -0500
Subject: [PATCH 14/20] drm/panel/s6e88a0-ams452ef01: Move to using
 mipi_dsi_*_multi() variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-14-67d94ff319cc@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=4971;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=z1eQx05PPLflMwEZMOji2UU0yu9vHQ2es8d9XIqxpLg=;
 b=f3jqWUt3yhFOERQQS4h5DvfskpOC0OLy6tn5NYIO+vmlefrIcYJcv2HZQEDCXVvvZpDzYCaIy
 S/FUiLRCHg1CAxdHGjL7MqZq61D9LfbqRZ+WONqm7xEkuDN0p9r/TFk
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
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   | 63 ++++++++--------------
 1 file changed, 21 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index d2df227abbea557acb849bfc76dd4b561158bf11..f5554a38be96a4f5635cf7bf009e1b9129b2a491 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -39,45 +39,33 @@ static void s6e88a0_ams452ef01_reset(struct s6e88a0_ams452ef01 *ctx)
 static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
-	mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c); // set Pixel Clock Divider polarity
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	msleep(120);
 
 	// set default brightness/gama
-	mipi_dsi_dcs_write_seq(dsi, 0xca,
-			       0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
-			       0x80, 0x80, 0x80,			// V203 R,G,B
-			       0x80, 0x80, 0x80,			// V151 R,G,B
-			       0x80, 0x80, 0x80,			// V87  R,G,B
-			       0x80, 0x80, 0x80,			// V51  R,G,B
-			       0x80, 0x80, 0x80,			// V35  R,G,B
-			       0x80, 0x80, 0x80,			// V23  R,G,B
-			       0x80, 0x80, 0x80,			// V11  R,G,B
-			       0x6b, 0x68, 0x71,			// V3   R,G,B
-			       0x00, 0x00, 0x00);			// V1   R,G,B
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x01, 0x00, 0x01, 0x00,
+				     0x01, 0x00, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
+				     0x80, 0x80, 0x6b, 0x68, 0x71, 0x00, 0x00,
+				     0x00);			// V1   R,G,B
 	// set default Amoled Off Ratio
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
-	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x40, 0x0a, 0x17, 0x00,
+				     0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x2c, 0x0b); // set default elvss voltage
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x03); // gamma/aor update
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display on: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	return 0;
 }
@@ -85,23 +73,14 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 static int s6e88a0_ams452ef01_off(struct s6e88a0_ams452ef01 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display off: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 	msleep(35);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 	msleep(120);
 
 	return 0;

-- 
2.47.0

