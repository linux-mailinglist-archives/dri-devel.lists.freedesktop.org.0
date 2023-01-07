Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE68661149
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2928E10E35C;
	Sat,  7 Jan 2023 19:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322310E37A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5ujAZitOZbP2puOeLODSdf7lrppmKAKMcwgyMXAuXA=;
 b=cOXRtkNZL77mAYcCFSx0aJie29jgNvfbOPV4agotUo/CKIjBNEf96j7IqBTd1XvAlk1C2k
 gW39bKNUYHljwbC3dE/vRtjiU1RcUcqqC0BieOxOIQ4vIuWqU9xc4ImS0pivsb9ysA3iBo
 gynW/s8tu6S87OCdUjvquu4jiBOg3qI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-cKEgq1gVO3qYl_zGicMiqw-1; Sat, 07 Jan 2023 14:18:44 -0500
X-MC-Unique: cKEgq1gVO3qYl_zGicMiqw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so4636394wms.8
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z5ujAZitOZbP2puOeLODSdf7lrppmKAKMcwgyMXAuXA=;
 b=0yx1vkNkGF8Qgf6pzl5d7lKoiiaz9zLpZkyaldZdaTw5azKtN2m8Oau1jzJwUA1uW2
 db7zRruea7L55yvFIxSjpuniB7OFHh//GsvjnnlXhpZf0aavwFFWl3t4aaAQiYlrHl9B
 oa4njQ1E0/RJQDB2TMw/oUmsjIIZj2OuDzl/uijw1PSISwAsuauYUQXNB/I2Wwu78EnM
 TH9HXRMNboPNkUDKokiOAYKFfLWLBPikZPyP2ETL1x6QJWqHGqRCu+cZNKzoQWtcV0ke
 vUzNlPdFoCN0J9BYZbOPKH/lg7rsDnGXOrSnnz0euY4Hc4o6Vcz9P+rFdZw2pE1hmTZD
 QHDA==
X-Gm-Message-State: AFqh2kpMP0YRLgqZHTnKfsvupKott1zEcM+6fPp+radAMewVZcI4H5KW
 a5cIupp+SiiuQXp57IQRq9vTD6VRgFRM7/u1ceruiRctkFMMMjV3SAPcyhK95ZxjCatnzI1wQQV
 V756JgHtvRoZk69kWRkxc+Oz3guS8
X-Received: by 2002:a05:600c:54ef:b0:3d0:5254:8a43 with SMTP id
 jb15-20020a05600c54ef00b003d052548a43mr52375488wmb.38.1673119122958; 
 Sat, 07 Jan 2023 11:18:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuv3SFkN1BZjacT8KalmsIEXaMxI/TG40bGBxvzNZy7X+fmcWJdSZrf1MPJY091RCqPgDX4mQ==
X-Received: by 2002:a05:600c:54ef:b0:3d0:5254:8a43 with SMTP id
 jb15-20020a05600c54ef00b003d052548a43mr52375482wmb.38.1673119122796; 
 Sat, 07 Jan 2023 11:18:42 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] drm/panel-samsung-sofef00: Drop custom DSI write
 macro
Date: Sat,  7 Jan 2023 20:18:18 +0100
Message-Id: <20230107191822.3787147-10-javierm@redhat.com>
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

 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 1a0d24595faa..9db49a028930 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -34,14 +34,6 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
 	return container_of(panel, struct sofef00_panel, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void sofef00_panel_reset(struct sofef00_panel *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -67,7 +59,7 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 	}
 	usleep_range(10000, 11000);
 
-	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret < 0) {
@@ -75,13 +67,13 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 		return ret;
 	}
 
-	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
-	dsi_dcs_write_seq(dsi, 0xb0, 0x07);
-	dsi_dcs_write_seq(dsi, 0xb6, 0x12);
-	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
+	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
+	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
-- 
2.38.1

