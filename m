Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58210661147
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFC610E918;
	Sat,  7 Jan 2023 19:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6A310E35C
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UbmEV+kUDRxsVEHZ8LXGuydtVY+f4VLUneyt4KaPUA=;
 b=e312pDWvQnkD/OicTKYe3tRtUSGHJV4ZNnK2/KYAQi6v5EFOVolGcjUmnPQYBgPkLVR+gN
 Kh2gdr6A90I+e921eWGmPp2ECHpxVRH5GQmCS2LHK7hKxjSsdL0EYA0UprxOXGJLwbICcv
 48xian6piwdbZkMjnXX4giYHhvamweQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-bB6Y3_Q4PU6RMGGEHKJbbQ-1; Sat, 07 Jan 2023 14:18:42 -0500
X-MC-Unique: bB6Y3_Q4PU6RMGGEHKJbbQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 c21-20020adfa315000000b0029ae4de27efso583995wrb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UbmEV+kUDRxsVEHZ8LXGuydtVY+f4VLUneyt4KaPUA=;
 b=dIlqyi9/G+TuYj7T3li8KLdUFDomBIli8SEkBo3m9XbcpaPBLyhAHBp/tBye2J1lK0
 qpRIH0EnERd5aGNoMgGrO9+m4DPvnUl85CBOVkc9lGq1R7Fx3tICkOlA95QncEWbWLFR
 KAGtrrmMYSxJIOHboq08tATEIt/Ry5CSslMt4Oijz3z9dF4NHSPMJ/gIJ9ejDgb+I3lS
 gFaOZSnICMWzKKwEdEPwEtoda3aqL06u95F58oL6F2YzjA9sWKU7GZGBDgq/DRKeJL7U
 +3fuOVY5U83F35sYBnD4sbkGjIyWbjlO+Y2AIkXjERpF0qWQYusP9rl0NpoatvjOpcOC
 jxAg==
X-Gm-Message-State: AFqh2kqZMuHzMl+MSy4eIAtY6B2usBfxqfJAxBzDW66wi+PIn/qXbp7D
 kAkyeJKoiFN4u/ZsczaQFrp6DnynOZqotosUsP3n5sbZvU4xPOOuveTJBye7p6c2hn0tRHdLSs6
 LVbhm5O5scfQLo6rJ1Xj1MUE2vKGd
X-Received: by 2002:a5d:5965:0:b0:27f:1c70:58c3 with SMTP id
 e37-20020a5d5965000000b0027f1c7058c3mr28918824wri.24.1673119121754; 
 Sat, 07 Jan 2023 11:18:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvn3/NsWtFEC4rkLPj22mr95+5FOn9c8MbeYB/J6hRruQBMnje0oECXATpAR/FApVyushGPog==
X-Received: by 2002:a5d:5965:0:b0:27f:1c70:58c3 with SMTP id
 e37-20020a5d5965000000b0027f1c7058c3mr28918817wri.24.1673119121594; 
 Sat, 07 Jan 2023 11:18:41 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:41 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/13] drm/panel-samsung-s6e88a0-ams452ef01: Drop custom
 DSI write macro
Date: Sat,  7 Jan 2023 20:18:17 +0100
Message-Id: <20230107191822.3787147-9-javierm@redhat.com>
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

 .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 44 ++++++++-----------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index 97ff7a18545c..7431cae7427e 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -28,14 +28,6 @@ s6e88a0_ams452ef01 *to_s6e88a0_ams452ef01(struct drm_panel *panel)
 	return container_of(panel, struct s6e88a0_ams452ef01, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void s6e88a0_ams452ef01_reset(struct s6e88a0_ams452ef01 *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
@@ -54,8 +46,8 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
-	dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
+	mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
@@ -65,23 +57,23 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 	msleep(120);
 
 	// set default brightness/gama
-	dsi_dcs_write_seq(dsi, 0xca,
-			  0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
-			  0x80, 0x80, 0x80,			// V203 R,G,B
-			  0x80, 0x80, 0x80,			// V151 R,G,B
-			  0x80, 0x80, 0x80,			// V87  R,G,B
-			  0x80, 0x80, 0x80,			// V51  R,G,B
-			  0x80, 0x80, 0x80,			// V35  R,G,B
-			  0x80, 0x80, 0x80,			// V23  R,G,B
-			  0x80, 0x80, 0x80,			// V11  R,G,B
-			  0x6b, 0x68, 0x71,			// V3   R,G,B
-			  0x00, 0x00, 0x00);			// V1   R,G,B
+	mipi_dsi_dcs_write_seq(dsi, 0xca,
+			       0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
+			       0x80, 0x80, 0x80,			// V203 R,G,B
+			       0x80, 0x80, 0x80,			// V151 R,G,B
+			       0x80, 0x80, 0x80,			// V87  R,G,B
+			       0x80, 0x80, 0x80,			// V51  R,G,B
+			       0x80, 0x80, 0x80,			// V35  R,G,B
+			       0x80, 0x80, 0x80,			// V23  R,G,B
+			       0x80, 0x80, 0x80,			// V11  R,G,B
+			       0x6b, 0x68, 0x71,			// V3   R,G,B
+			       0x00, 0x00, 0x00);			// V1   R,G,B
 	// set default Amoled Off Ratio
-	dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
-	dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
-	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
-- 
2.38.1

