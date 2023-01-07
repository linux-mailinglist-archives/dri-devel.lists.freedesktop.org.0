Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A666114B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605A610E35E;
	Sat,  7 Jan 2023 19:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2486510E363
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohrbxQv6h3PG5DHv8u6fpyUTGyDJJgNcSIIf21QBvAc=;
 b=cfesXPwbV9PZttI9/OH9EJh6knioGcyIZyEtTqd99DA21+JKauPQ4U/iuMcL/rOiARDZ2q
 CGD/Od0azgbuhCicXxmK1ORy8FhP4Vow/nXAexyDIGqOspge3xKQZ7ka4H6JQHiG08QXDj
 M+aIiwmh3bx6NHiXzf6lZfSuK+4VQu0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-b3cXEWzJOHuIdac3GqBGuw-1; Sat, 07 Jan 2023 14:18:45 -0500
X-MC-Unique: b3cXEWzJOHuIdac3GqBGuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l9-20020a7bc349000000b003d35aa4ed8eso999944wmj.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohrbxQv6h3PG5DHv8u6fpyUTGyDJJgNcSIIf21QBvAc=;
 b=PIGXiiwR4uNdM1sXyVxMZKHF/RhQniCysfng4TTZ5PHA74LLtuMa6J9vGtpIAyrNIJ
 L5rC9lQdqcrrcpquMR2iQe8yGLs2y6Ttr3NaOy/7OzKiCC/m8ZFcYnV0MwwXJFl4NT3Q
 eJQASV1RSBE7LJz8mwjXcm+8NVXn00RT1N9BG0+6KM2TPNCIp7knkVvXOr1uYJI0KTpq
 t/JG7hf+HrY6zfuVibNB05yWMO1gmuFTWHQr0QDUIoHSVw+BDNuJBTEH8AbUsGjBq9Wo
 J497a1j5bTdJkzQdWVGAglgvvkbAeFuPBKdMekizi0vM9E5Ii4gfNd//m1d6o2tVQExp
 q6ww==
X-Gm-Message-State: AFqh2kp8CKd7JglD48OAlChPUdGkMkoUMp8BpcOfzLiu8nCXUmAZ0ca9
 QzWPyD4uYpT+XAI+QeSwq4n9lI2B8ouJPeo13N0KR1Btk8QPO4QG20ZAMG99huW2pgmVGfnC8K0
 iurcx32KpiMIQNTgOrPd7W9zAXw5z
X-Received: by 2002:adf:f701:0:b0:2bb:1b2f:a1c0 with SMTP id
 r1-20020adff701000000b002bb1b2fa1c0mr3257687wrp.3.1673119124542; 
 Sat, 07 Jan 2023 11:18:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsevxsa04SlPZ2Vk1dvrP8Hj/YN2EMVPmlBsTKISQMZmGZE2TJABC9oo+kDkGHsmPPutOYx8Q==
X-Received: by 2002:adf:f701:0:b0:2bb:1b2f:a1c0 with SMTP id
 r1-20020adff701000000b002bb1b2fa1c0mr3257680wrp.3.1673119124343; 
 Sat, 07 Jan 2023 11:18:44 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] drm/panel-sharp-ls060t1sx01: Drop custom DSI write
 macro
Date: Sat,  7 Jan 2023 20:18:19 +0100
Message-Id: <20230107191822.3787147-11-javierm@redhat.com>
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

 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
index 8a4e0c1fe73f..68f52eaaf4fa 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c
@@ -32,12 +32,6 @@ static inline struct sharp_ls060 *to_sharp_ls060(struct drm_panel *panel)
 	return container_of(panel, struct sharp_ls060, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) ({				\
-		static const u8 d[] = { seq };				\
-									\
-		mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-	})
-
 static void sharp_ls060_reset(struct sharp_ls060 *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -56,17 +50,8 @@ static int sharp_ls060_on(struct sharp_ls060 *ctx)
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	if (ret < 0) {
-		dev_err(dev, "Failed to send command: %d\n", ret);
-		return ret;
-	}
-
-	ret = dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
-	if (ret < 0) {
-		dev_err(dev, "Failed to send command: %d\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_MEMORY_START);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
-- 
2.38.1

