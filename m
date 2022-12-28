Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B056571C8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DE810E367;
	Wed, 28 Dec 2022 01:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2765A10E364
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3zNujiFj3yLofalQ468fJjqEb+VryQvUoblSG4qto8=;
 b=VaLf3KT8D7Jq15O9YCyxtsszBWpxLjzsWl8STDVMidDSiJaFiszHsz9TBhnKm5oNq9/6HS
 2TjSi6zfdjKc3g5DALSFAef2Bh4FH9RI17K6/cB1i3C8T3QVw2vq17b8O2jSxe/otOK4xT
 PFTBz8m/R1G4OV655EsnV5Poy8vPjGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-480jVGBKOcSa4UY2pLecBQ-1; Tue, 27 Dec 2022 20:48:12 -0500
X-MC-Unique: 480jVGBKOcSa4UY2pLecBQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso7369606wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3zNujiFj3yLofalQ468fJjqEb+VryQvUoblSG4qto8=;
 b=lU5aiS1mOb0GNKBpQ9dHp45ROGUORwBXIZNytyhIJqSx6U051wBhTWFgwGs/5bJ3TF
 Ri8ABV2lkYz1CQgYGZzGbC0llU39yTtyGVXdHmIdOUI7RNEy7YEOIEUm8OpnZWgWxKwc
 ZYfONU4u9o+GN6EVHdbHqqErHNRppBXXHGiSSAttINj70Y9mWuhUR1yIFVz7nmLipu8k
 QJl04BJgh4kPiuYsI/+7l9a+g4QJwSK4c02PHoRJe5COtW49nhxHwXi+fVdD3ZQoafQk
 /GDFgF1kEQJtJCTuPTXT2nR7lTtODEXl41V1a5HxU/mYP/TSzB+UERHb/pCY/qIO6yp8
 uUhg==
X-Gm-Message-State: AFqh2kqqj/vVQger4SRSTOYy9V9toBfPQlBbptGvIDIGurd7eUhSrNoI
 bFvCEjk4zouP2T8bEpAVowVYW3SRyLrduPTLpeYCLPWcbvY8NVD72F6qPU+vMSJiRnhbK7w7q33
 DRnI9WQZ1GpFmCXS6z7FKOwtYqID5
X-Received: by 2002:a05:600c:1509:b0:3d2:17a5:17fe with SMTP id
 b9-20020a05600c150900b003d217a517femr16573129wmg.18.1672192091724; 
 Tue, 27 Dec 2022 17:48:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspfH/t9hYVfL/CoCHFa0Z1pRLmWZ9qGIX9X9C+FhjVQIDoxI5o6qh6BstWlE6yV+CGQoT4yg==
X-Received: by 2002:a05:600c:1509:b0:3d2:17a5:17fe with SMTP id
 b9-20020a05600c150900b003d217a517femr16573123wmg.18.1672192091540; 
 Tue, 27 Dec 2022 17:48:11 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] drm/panel-elida-kd35t133: Drop custom DSI write macro
Date: Wed, 28 Dec 2022 02:47:48 +0100
Message-Id: <20221228014757.3170486-6-javierm@redhat.com>
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

 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 34 ++++++++------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index eee714cf3f49..48535ea3f1d3 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -51,14 +51,6 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
 	return container_of(panel, struct kd35t133, panel);
 }
 
-#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 b[] = { cmd, seq };			\
-		int ret;						\
-		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static int kd35t133_init_sequence(struct kd35t133 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
@@ -68,24 +60,24 @@ static int kd35t133_init_sequence(struct kd35t133 *ctx)
 	 * Init sequence was supplied by the panel vendor with minimal
 	 * documentation.
 	 */
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POSITIVEGAMMA,
 			  0x00, 0x13, 0x18, 0x04, 0x0f, 0x06, 0x3a, 0x56,
 			  0x4d, 0x03, 0x0a, 0x06, 0x30, 0x3e, 0x0f);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_NEGATIVEGAMMA,
 			  0x00, 0x13, 0x18, 0x01, 0x11, 0x06, 0x38, 0x34,
 			  0x4d, 0x06, 0x0d, 0x0b, 0x31, 0x37, 0x0f);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
-	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL1, 0x18, 0x17);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_POWERCONTROL2, 0x41);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_VCOMCONTROL, 0x00, 0x1a, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x48);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_INTERFACEMODECTRL, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_FRAMERATECTRL, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYINVERSIONCTRL, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_DISPLAYFUNCTIONCTRL,
 			  0x20, 0x02);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
-	dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_SETIMAGEFUNCTION, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, KD35T133_CMD_ADJUSTCONTROL3,
 			  0xa9, 0x51, 0x2c, 0x82);
 	mipi_dsi_dcs_write(dsi, MIPI_DCS_ENTER_INVERT_MODE, NULL, 0);
 
-- 
2.38.1

