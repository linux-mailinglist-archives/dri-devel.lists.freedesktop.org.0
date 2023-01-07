Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D054166114C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5010E35F;
	Sat,  7 Jan 2023 19:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0609D10E362
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpnPFBzRW6eHCPCk8Ls0t1EZjEyRqRYmlX28Isym++A=;
 b=he0hPdRcG/HVoYCV3S4vM9D7MS/6oYkZLAAR6F43Uv3wUGnt6DhchRMaYSSenttn8eb+SX
 0x97tf/ImSYqvNCpw852KEl8KIQ5uNoxND3ZaUi5sw4kKwJ6QMr9bGwZLBn2dLlkFPZKo0
 CVTb9guVFLu4wDfUHBfbWfGUEaEaAAE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-5-5O1cn2SCPQOV9gh0fETlsg-1; Sat, 07 Jan 2023 14:18:46 -0500
X-MC-Unique: 5O1cn2SCPQOV9gh0fETlsg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so2710011wma.6
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpnPFBzRW6eHCPCk8Ls0t1EZjEyRqRYmlX28Isym++A=;
 b=HZ95bssVOTzEI+yxjMUo/tBmoyrzwzgkJyGOITCHoFnpCDmw6OElNu/PbXUtGS8VqU
 v/iM8QP6lR+Ag1hsy44NWDe2e3InAOtUbeVy2FxulBcDSGAT8oGF4mKUua6ERhYzjenp
 NOVp1u7fwxyxvrkQAFAeYItK2Y3+Ylhk4xWN1uq5Joz4SwL/EZeznOd63Lcbcx3HbhED
 Dt7h9H2HuS0CQJ9lTMCYWbXsfdqsjyS9aDiSiMMigAJWJ6aqQdNAHtyafnc5HPcW8qMr
 dTKm+8KNNVfrcxZtT+tOjb4+SZQp8azuP38mdpx107pRhoMUaWDPqbGsCjC7fNCpj7g8
 EcsQ==
X-Gm-Message-State: AFqh2kpBurliShjYjCs7dSXrO/qwozN6s8GgxYkYUOkalbDoplIpBxcC
 dmXg0dfVCiiG3KLfn0pdvjjD/XCZpFPcgs7vZxUqEZE8Lr0kiuWuZ75rio02J/MZxofOphCQmJ1
 7dQBdkwz0SGx6v1gzGMVZyO1sAE9X
X-Received: by 2002:a5d:620f:0:b0:242:9e3:72b8 with SMTP id
 y15-20020a5d620f000000b0024209e372b8mr43020251wru.31.1673119125784; 
 Sat, 07 Jan 2023 11:18:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGRowZHlkk4D63NFUoqF99EB2JPISpBuBanleVv/OAGREuj85b6r46NB2BstsyZH7AAsnhZQ==
X-Received: by 2002:a5d:620f:0:b0:242:9e3:72b8 with SMTP id
 y15-20020a5d620f000000b0024209e372b8mr43020244wru.31.1673119125605; 
 Sat, 07 Jan 2023 11:18:45 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] drm/panel-mantix-mlaf057we51: Drop custom DSI write
 macro
Date: Sat,  7 Jan 2023 20:18:20 +0100
Message-Id: <20230107191822.3787147-12-javierm@redhat.com>
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
Cc: Purism Kernel Team <kernel@puri.sm>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
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

 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index 772e3b6acece..9243b2ad828d 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -45,14 +45,6 @@ static inline struct mantix *panel_to_mantix(struct drm_panel *panel)
 	return container_of(panel, struct mantix, panel);
 }
 
-#define dsi_generic_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static int mantix_init_sequence(struct mantix *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
@@ -61,18 +53,18 @@ static int mantix_init_sequence(struct mantix *ctx)
 	/*
 	 * Init sequence was supplied by the panel vendor.
 	 */
-	dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
+	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
 
-	dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
-	dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
-	dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
+	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
+	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
+	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
 
-	dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
-	dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
+	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
+	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
 	msleep(20);
 
-	dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
-	dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
+	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
+	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
 	msleep(20);
 
 	dev_dbg(dev, "Panel init sequence done\n");
-- 
2.38.1

