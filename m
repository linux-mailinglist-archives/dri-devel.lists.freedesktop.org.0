Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB16571C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3010E365;
	Wed, 28 Dec 2022 01:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20C510E364
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXfjPPHZw4rW2dJuaHE6vMotKORYIvVnfzyhFGZZlV4=;
 b=dXrwzwhtPIITWWdW4ukMTapEcZ+3sKRt27bLyJ304EAnbEjFbflIY8zWUwmDxv6jHKgi7O
 FcTRmuhL8eAYc29AWt9Hapl9xFokAgZe49Me61z6Qah81VfRguO/vOsxYQl7KLBQj+meHH
 Y08sLxtgDkA27owLQE4+XqAySv+1Dec=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-hWnGBp2qODSqExsNN9pPHQ-1; Tue, 27 Dec 2022 20:48:14 -0500
X-MC-Unique: hWnGBp2qODSqExsNN9pPHQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 i26-20020adfaada000000b0027c76c49445so680976wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXfjPPHZw4rW2dJuaHE6vMotKORYIvVnfzyhFGZZlV4=;
 b=rEev7wWDKBKsukMiHhmb3i8eaGFWgaf/aMHBZecTRZHxo3FmaM+mYvLnODPa82DBPW
 KUF11avqztsjF4y750i31/FZ7YFihqdgYz8eeXwAazTY4wtk5HfbvJc726EmT0IniV4+
 fJEbm+ZQpfc3Lapdl98tWk5bMzuu+AGdbTxnyKRgrnocVapwlzZ0x9sQ5zsK3V3ZA2LO
 nyCGBke57eH/d6EKffrEkaq9A2QuqaQFqb873b0d+/Ga4h7mYazH+s84GFU1F3Himbqu
 UVVw476uRgC4YptDm2dGnlT8ZhCXY9EZ/6G86xUOw3gWRsIvAA9PMLRvIlM3Xee0DAcg
 COPQ==
X-Gm-Message-State: AFqh2konCWyADdgLacikpZurtURC9VjcIsBuHbgCE46XnMV40NQcHmgc
 BrN3EIYONwun28iI0JE8mjpx9HnzM1Jbv9Hyv9St6yPbXRm8IwKE1bRW87i6o8N9ukYNhX1Crza
 0xTTge/5BzUvIJF+5uSxscyhr24zc
X-Received: by 2002:adf:ce0a:0:b0:242:4dd8:a7ee with SMTP id
 p10-20020adfce0a000000b002424dd8a7eemr14834778wrn.12.1672192092972; 
 Tue, 27 Dec 2022 17:48:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuVU0qxNP41uhFQe4//isG5cOB01i4P/PiMbpSj6Lb6FnL/80fWWAMgOyG8kmuuxs2KNRpt/Q==
X-Received: by 2002:adf:ce0a:0:b0:242:4dd8:a7ee with SMTP id
 p10-20020adfce0a000000b002424dd8a7eemr14834772wrn.12.1672192092735; 
 Tue, 27 Dec 2022 17:48:12 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] drm/panel-boe-bf060y8m-aj0: Drop custom DSI write macro
Date: Wed, 28 Dec 2022 02:47:49 +0100
Message-Id: <20221228014757.3170486-7-javierm@redhat.com>
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

 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 28 +++++++------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index ad58840eda41..7fff89cb1cd3 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -43,14 +43,6 @@ struct boe_bf060y8m_aj0 *to_boe_bf060y8m_aj0(struct drm_panel *panel)
 	return container_of(panel, struct boe_bf060y8m_aj0, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
 {
 	gpiod_set_value_cansleep(boe->reset_gpio, 0);
@@ -67,11 +59,11 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 	struct device *dev = &dsi->dev;
 	int ret;
 
-	dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
-	dsi_dcs_write_seq(dsi, 0xf8,
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
+	mipi_dsi_dcs_write_seq(dsi, 0xf8,
 			  0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
@@ -81,17 +73,17 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
 	}
 	msleep(30);
 
-	dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
-	dsi_dcs_write_seq(dsi, 0xc0,
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xc0,
 			  0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
 			  0x2a, 0x31, 0x39, 0x20, 0x09);
-	dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
+	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
 			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
 			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
-	dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
+	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
 			  0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
 			  0x5c, 0x5c, 0x5c);
-	dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
+	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
 
 	msleep(30);
 
-- 
2.38.1

