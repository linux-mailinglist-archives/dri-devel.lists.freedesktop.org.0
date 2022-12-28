Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE786571CE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97710E36A;
	Wed, 28 Dec 2022 01:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400E110E36A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBWsJfhSjF4lqYz4anPq3n98W47+FDRWTO/XdFMlbU8=;
 b=ggFWkR3Rvy5c5+0UQ0DcoBXBcQjcj53G2pvWoQ2DqP+ntothuZU382+eRHl0hkgh007Z7j
 dfmciKZ6W9fvVTQoYhcT9e7BkNDjSEpDAOlCPujqi59CPXR08GFhYGSaiZit6KEnBZenBC
 vKB843zdkGENXHzy7mmSCQwWeXKoRK4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-wvO2FqECNEO-P4Jy_x_6Zw-1; Tue, 27 Dec 2022 20:48:21 -0500
X-MC-Unique: wvO2FqECNEO-P4Jy_x_6Zw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h5-20020adfa4c5000000b0026755f9b55eso1912244wrb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xBWsJfhSjF4lqYz4anPq3n98W47+FDRWTO/XdFMlbU8=;
 b=Sl+j9iXA83OjIqa55QVqYI2Z8JeVMg1FuYIE8k3mpC7muaJ5oetuFp2oteg7ufjP/t
 IwdbyUhZhTrdgoxcW9Kb/onS6QZgiuxV5tO1K/yrm8kpxt9dDfU/RID+H9gN/HEaOr2S
 0YRACW1nfEfb0GjR7lyD4gLtIOJjRDi7rVzXvnGOjrkZG3RRHhJ9IQN2AFAgRIb0TRNU
 x0NyeDMtMPNMF7QbrmoaOel5YNFcqm0C7iE7ZTGNKWYj5fmOQrCRfNkkVonZw4jnOuCo
 8AgJGzxz3/TJktJTlORbcqK92UkU1iTdkm/yApwYQXIQjpSLoyyWC16M8h/B5anGC6UV
 u3dw==
X-Gm-Message-State: AFqh2kqkOr5Kv4UTgalZ8XSpPgZ968UOthw0A0r2sUGh0NTTL4f7Vpih
 2NqSvVa1tqQ9aZCmZcht/JENYaHZnMol651L4FEjJTax+SZ2ML7rNdKzffk1R1nXRdF5B5yt09a
 TQOZ3VMDjTW+LN+O49gC2xrHBCGTi
X-Received: by 2002:a05:6000:695:b0:260:6b09:fa0e with SMTP id
 bo21-20020a056000069500b002606b09fa0emr17505654wrb.31.1672192100722; 
 Tue, 27 Dec 2022 17:48:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvz6+6p8xNg+VftUEk6bb+9Eo+lwwvp+EpH24JFd41W3kiLxm5gwCaY8sNrCtQMfAOPn77qAQ==
X-Received: by 2002:a05:6000:695:b0:260:6b09:fa0e with SMTP id
 bo21-20020a056000069500b002606b09fa0emr17505641wrb.31.1672192100486; 
 Tue, 27 Dec 2022 17:48:20 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] drm/panel-mantix-mlaf057we51: Drop custom DSI write
 macro
Date: Wed, 28 Dec 2022 02:47:55 +0100
Message-Id: <20221228014757.3170486-13-javierm@redhat.com>
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
Cc: Purism Kernel Team <kernel@puri.sm>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macro defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

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

