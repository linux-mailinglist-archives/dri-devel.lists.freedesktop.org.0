Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B26571C1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED7710E36D;
	Wed, 28 Dec 2022 01:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D7D10E369
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzhOyd87pzqH2lLPP8bW2hUWTvEpAwSTndaCbjcNTpo=;
 b=Hy8tyawUBS3tN3UKWVcaYdTJQKII5dT7lG/1f1SL2jrz0UeglEevtf6aJIdg/RSICBGNEa
 j3zaKUYamx2AJWi2/r9WXCd2JdtFqv7dpgncVFmc0YL4uT16j9m2a19u8e512QUG2yNm54
 HjLqKw6EGwMeqdkqf077S2cdD/zPEAw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-i6btzsNXPdC0lsfzGjAr4w-1; Tue, 27 Dec 2022 20:48:18 -0500
X-MC-Unique: i6btzsNXPdC0lsfzGjAr4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso7617131wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UzhOyd87pzqH2lLPP8bW2hUWTvEpAwSTndaCbjcNTpo=;
 b=GPBHeOH/pJ8V8Fec4CSyzKNeeIUZrvXok5knfhGafbimr1stZxsVq2FtWqH2BUiwnQ
 C1aUikiBzDvi2HhYw1ZxemuhmoG1VjgGYL+xIDJqkjuGb4ojQNspLPMOrOYkN+Jlhx+X
 Czm/i101dXUuiNHH71oDQL2AIr6MIZIv7jud839by5gRfbNf7UxVjeJIYltDNtBnYKxW
 l9KTucCpaKRliWZYP9vYGulNs9khY7n0YpCacm+Db/4//GioI1t2CTx+c4WsegqkuAX0
 EUjxBmmfZ2sQVLVPNUHKZuXT2ZtXx7k024/10yECKsdp9Sd2eArAdCq+6aZyMFaW9Iw0
 XQ2A==
X-Gm-Message-State: AFqh2kr4nNJDHhQiMmhpy+BCPy5VyMqYGkFVxuGVj/exMw2xLvaHt796
 vtSnAEBZT6RHeMooj+7JYuWQnTRwzFGq+vTQftHwnfKMZdcoBI8hlEt1qCkNeyJxr/BPOXEhkGk
 XixJMh6VVlLAZLxQ7u/Zs/kYgZkQG
X-Received: by 2002:a5d:6244:0:b0:242:eb5:254f with SMTP id
 m4-20020a5d6244000000b002420eb5254fmr13630611wrv.48.1672192096896; 
 Tue, 27 Dec 2022 17:48:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs8CwqFT9w2GCJT0hpiJ5lnmv6UiA/bcKXFdt9OP764WinkWZC0pn6kDbgah1SaCPsH72jgNA==
X-Received: by 2002:a5d:6244:0:b0:242:eb5:254f with SMTP id
 m4-20020a5d6244000000b002420eb5254fmr13630603wrv.48.1672192096692; 
 Tue, 27 Dec 2022 17:48:16 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/14] drm/panel-samsung-s6e88a0-ams452ef01: Drop custom DSI
 write macro
Date: Wed, 28 Dec 2022 02:47:52 +0100
Message-Id: <20221228014757.3170486-10-javierm@redhat.com>
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

 .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index 97ff7a18545c..e94d88fed4f3 100644
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
@@ -65,7 +57,7 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 	msleep(120);
 
 	// set default brightness/gama
-	dsi_dcs_write_seq(dsi, 0xca,
+	mipi_dsi_dcs_write_seq(dsi, 0xca,
 			  0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
 			  0x80, 0x80, 0x80,			// V203 R,G,B
 			  0x80, 0x80, 0x80,			// V151 R,G,B
@@ -77,11 +69,11 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
 			  0x6b, 0x68, 0x71,			// V3   R,G,B
 			  0x00, 0x00, 0x00);			// V1   R,G,B
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

