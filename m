Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5401A661148
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2779710E35A;
	Sat,  7 Jan 2023 19:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D47910E50C
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWoU2jTRjKSY+Qo+tb2CBqwxtQSMhlldhpuQhSNUC9M=;
 b=PVg1Cc9n9HnkMjZreWHUklhCrSW0JsvNeYQt5vPKU+Jhj5E0/9MbwM6AM3agQAa04NmrX5
 CDj2GEPxhH8Q1ZGmTl5I9AAXW0rjXahPSre0g9jWQyz6sJHUHiUMYaT8Phu1jURlPmw8M8
 y3oCWDvtsbKIPua0WhVs+iL1US49uHE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-tgs0KoPaNVSxp_q8p80RRQ-1; Sat, 07 Jan 2023 14:18:40 -0500
X-MC-Unique: tgs0KoPaNVSxp_q8p80RRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so4646971wmq.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WWoU2jTRjKSY+Qo+tb2CBqwxtQSMhlldhpuQhSNUC9M=;
 b=oi659j5RZ/OzwQE3HU8SMLFhTMUg645hAUUbDaqJcyJ5A5c336qKW1tZviZuGoNws5
 11SAu0x2fqBr6gT4L0h6TKjSW/3BUaxMKf0tKK3D9yXHunpdsfoI7u4Sok3m0sxiUAdJ
 OFUgPuSMLiemCANJQ80ZOfrnDD7usRUH/ndg/m+wGXubWqTqLKtcuFc5uxlWIC0S9a8w
 p1413paf+TiaxSIVfnU0MFSYGSZbHIPuJ0kkgh8gEuI1LtW60xej1BAMJQoWDu58gBrD
 Uk+mAt8N4BCCUOXeRjha+T1Kon6FDgCCkeoPK0z9bPuacGAPyDmktxQNk1tpgL0JK8lc
 qguw==
X-Gm-Message-State: AFqh2krhda6B8lgFmweu7nHfwRZMr5EjIZfIkEVxVQMbhz0LPqs4T8hJ
 WlzAqMtAP5P4XslmAeHpiOcKNrsNdTQOMii4CO5LGkXChDUsPJyforF24RDjZN1lW7xNfu4ubep
 alKCoXFbnQQtLzFbceHjOKPDbaj2j
X-Received: by 2002:a5d:624d:0:b0:242:4d70:7882 with SMTP id
 m13-20020a5d624d000000b002424d707882mr36919655wrv.15.1673119119646; 
 Sat, 07 Jan 2023 11:18:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXslQosbrbw6pw/4AHiDYKneqeQtd0nCtwjU8AvmIMFQQ96Mo+Yg9sRxu263Nao8IzQ210H4jA==
X-Received: by 2002:a5d:624d:0:b0:242:4d70:7882 with SMTP id
 m13-20020a5d624d000000b002424d707882mr36919642wrv.15.1673119119489; 
 Sat, 07 Jan 2023 11:18:39 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] drm/panel-novatek-nt35950: Drop custom DSI write
 macro
Date: Sat,  7 Jan 2023 20:18:15 +0100
Message-Id: <20230107191822.3787147-7-javierm@redhat.com>
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

 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 3a844917da07..abf752b36a52 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -89,14 +89,6 @@ static inline struct nt35950 *to_nt35950(struct drm_panel *panel)
 	return container_of(panel, struct nt35950, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static void nt35950_reset(struct nt35950 *nt)
 {
 	gpiod_set_value_cansleep(nt->reset_gpio, 1);
@@ -338,7 +330,7 @@ static int nt35950_on(struct nt35950 *nt)
 		return ret;
 
 	/* Unknown command */
-	dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
+	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
 
 	/* CMD2 Page 7 */
 	ret = nt35950_set_cmd2_page(nt, 7);
@@ -346,10 +338,10 @@ static int nt35950_on(struct nt35950 *nt)
 		return ret;
 
 	/* Enable SubPixel Rendering */
-	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
 
 	/* SPR Mode: YYG Rainbow-RGB */
-	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
+	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
 
 	/* CMD3 */
 	ret = nt35950_inject_black_image(nt);
-- 
2.38.1

