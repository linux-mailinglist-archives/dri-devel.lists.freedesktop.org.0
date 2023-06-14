Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57170EFC4
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F09E10E57E;
	Wed, 24 May 2023 07:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8175810E587
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:45:18 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d30ab1f89so430606b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 00:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684914317; x=1687506317; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHFyXbVxT+ByBWsXQ617wmi3BUvoSFwNbCdboPImjUY=;
 b=XXDy6lzLEBIcYuug9p2+U2Q7Vhfx27QS/ZV7Zpm+hcawoHPt7oNmnjzYKTBhSbrtMh
 LZkSlX+Y1t6dhEZVgb2LLT66WrjAooK9l9tdSFR0B6Tf4y6IrTtfrRTuP585/NABJxak
 fAY7UeWcOVAzw0TzdOphHoUkU1Cl4PH884lsiaWUe4YMoePfNiH4VE4gD/359GSlzGyB
 qXxsOySsBueOamcMhdPk5Wz5hCGEclQ5dKP+66YmZsxl0JAK88Rab/3j1ljeFVbegzK8
 qTO75EcKhscszXWA+mIFeHeH3uIktCOx0cwtP2EVtKtzAf2Za10H0aACHUbt9dd5Z+1t
 h2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684914317; x=1687506317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qHFyXbVxT+ByBWsXQ617wmi3BUvoSFwNbCdboPImjUY=;
 b=GRGwZEwwk4JABkVHAdmoid7ZAHXU8lKGrz9cT8Q6j+MIH+pDaj2hPVoL9vUKACNSpr
 fImfhPwOqI0gr45uHzXg1+btBx0+QusD6RLEpZ+zndsbcK/X95Z162+AJCBqGhGalyfr
 PMBgPQ6rajNFCj4xjZA773n7nJooUguJOSAvDMV/6XliNq7FFApAOg10zBe8RQvmaxos
 LSZAfCVTX9+9vbt045kJ61n2Fde2Y6KIldykP0WDTMFD9Vls8OLBq5Vmc3QDSftXKDOX
 3p2hJbmFOImRg+0qQCo4GBehrCY8qQ6RRdvaTbu0WAS+Hq9sOSfWiPluMaqb4E0TMZ7o
 OL4w==
X-Gm-Message-State: AC+VfDzo4grUt/8olYhUXDnT03mzOfVb/0W9DK8601qnfflyA7y8s+SJ
 5DtE89mXBqKSr2KD7XuF3r6z5Q==
X-Google-Smtp-Source: ACHHUZ4qanfJSAH7c1KsjUI6dRHhsEZBKvGsRy9QHuhkelx87nYRNCXvzH+cCy95D8ivOrUz4Dzj9g==
X-Received: by 2002:a05:6a00:a1a:b0:64a:f8c9:a421 with SMTP id
 p26-20020a056a000a1a00b0064af8c9a421mr2703413pfh.32.1684914317439; 
 Wed, 24 May 2023 00:45:17 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a62e906000000b0063d29df1589sm6801336pfh.136.2023.05.24.00.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 00:45:16 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Subject: [v2 3/4] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
Date: Wed, 24 May 2023 15:44:54 +0800
Message-Id: <20230524074455.1172064-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
 <20230524074455.1172064-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Starry-ili9882 is a 10.51" WUXGA TFT panel. which fits in nicely with
the existing panel-boe-tv101wum-nl6 driver. From the datasheet,MIPI need
to keep the LP11 state before the lcm_reset pin is pulled high. So add
lp11_before_reset flag.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ++++++++++++++++++
 1 file changed, 371 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 5c8ec263e11f..896c8f4f1278 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -145,6 +145,346 @@ static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] = {
 	{},
 };
 
+static const struct panel_init_cmd starry_ili9882t_init_cmd[] = {
+	_INIT_DELAY_CMD(5),
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x01),
+	_INIT_DCS_CMD(0x00, 0x42),
+	_INIT_DCS_CMD(0x01, 0x11),
+	_INIT_DCS_CMD(0x02, 0x00),
+	_INIT_DCS_CMD(0x03, 0x00),
+
+	_INIT_DCS_CMD(0x04, 0x01),
+	_INIT_DCS_CMD(0x05, 0x11),
+	_INIT_DCS_CMD(0x06, 0x00),
+	_INIT_DCS_CMD(0x07, 0x00),
+
+	_INIT_DCS_CMD(0x08, 0x80),
+	_INIT_DCS_CMD(0x09, 0x81),
+	_INIT_DCS_CMD(0x0A, 0x71),
+	_INIT_DCS_CMD(0x0B, 0x00),
+
+	_INIT_DCS_CMD(0x0C, 0x00),
+	_INIT_DCS_CMD(0x0E, 0x1A),
+
+	_INIT_DCS_CMD(0x24, 0x00),
+	_INIT_DCS_CMD(0x25, 0x00),
+	_INIT_DCS_CMD(0x26, 0x00),
+	_INIT_DCS_CMD(0x27, 0x00),
+
+	_INIT_DCS_CMD(0x2C, 0xD4),
+	_INIT_DCS_CMD(0xB9, 0x40),
+
+	_INIT_DCS_CMD(0xB0, 0x11),
+
+	_INIT_DCS_CMD(0xE6, 0x32),
+	_INIT_DCS_CMD(0xD1, 0x30),
+
+	_INIT_DCS_CMD(0xD6, 0x55),
+
+	_INIT_DCS_CMD(0xD0, 0x01),
+	_INIT_DCS_CMD(0xE3, 0x93),
+	_INIT_DCS_CMD(0xE4, 0x00),
+	_INIT_DCS_CMD(0xE5, 0x80),
+
+	_INIT_DCS_CMD(0x31, 0x07),
+	_INIT_DCS_CMD(0x32, 0x07),
+	_INIT_DCS_CMD(0x33, 0x07),
+	_INIT_DCS_CMD(0x34, 0x07),
+	_INIT_DCS_CMD(0x35, 0x07),
+	_INIT_DCS_CMD(0x36, 0x01),
+	_INIT_DCS_CMD(0x37, 0x00),
+	_INIT_DCS_CMD(0x38, 0x28),
+	_INIT_DCS_CMD(0x39, 0x29),
+	_INIT_DCS_CMD(0x3A, 0x11),
+	_INIT_DCS_CMD(0x3B, 0x13),
+	_INIT_DCS_CMD(0x3C, 0x15),
+	_INIT_DCS_CMD(0x3D, 0x17),
+	_INIT_DCS_CMD(0x3E, 0x09),
+	_INIT_DCS_CMD(0x3F, 0x0D),
+	_INIT_DCS_CMD(0x40, 0x02),
+	_INIT_DCS_CMD(0x41, 0x02),
+	_INIT_DCS_CMD(0x42, 0x02),
+	_INIT_DCS_CMD(0x43, 0x02),
+	_INIT_DCS_CMD(0x44, 0x02),
+	_INIT_DCS_CMD(0x45, 0x02),
+	_INIT_DCS_CMD(0x46, 0x02),
+
+	_INIT_DCS_CMD(0x47, 0x07),
+	_INIT_DCS_CMD(0x48, 0x07),
+	_INIT_DCS_CMD(0x49, 0x07),
+	_INIT_DCS_CMD(0x4A, 0x07),
+	_INIT_DCS_CMD(0x4B, 0x07),
+	_INIT_DCS_CMD(0x4C, 0x01),
+	_INIT_DCS_CMD(0x4D, 0x00),
+	_INIT_DCS_CMD(0x4E, 0x28),
+	_INIT_DCS_CMD(0x4F, 0x29),
+	_INIT_DCS_CMD(0x50, 0x10),
+	_INIT_DCS_CMD(0x51, 0x12),
+	_INIT_DCS_CMD(0x52, 0x14),
+	_INIT_DCS_CMD(0x53, 0x16),
+	_INIT_DCS_CMD(0x54, 0x08),
+	_INIT_DCS_CMD(0x55, 0x0C),
+	_INIT_DCS_CMD(0x56, 0x02),
+	_INIT_DCS_CMD(0x57, 0x02),
+	_INIT_DCS_CMD(0x58, 0x02),
+	_INIT_DCS_CMD(0x59, 0x02),
+	_INIT_DCS_CMD(0x5A, 0x02),
+	_INIT_DCS_CMD(0x5B, 0x02),
+	_INIT_DCS_CMD(0x5C, 0x02),
+
+	_INIT_DCS_CMD(0x61, 0x07),
+	_INIT_DCS_CMD(0x62, 0x07),
+	_INIT_DCS_CMD(0x63, 0x07),
+	_INIT_DCS_CMD(0x64, 0x07),
+	_INIT_DCS_CMD(0x65, 0x07),
+	_INIT_DCS_CMD(0x66, 0x01),
+	_INIT_DCS_CMD(0x67, 0x00),
+	_INIT_DCS_CMD(0x68, 0x28),
+	_INIT_DCS_CMD(0x69, 0x29),
+	_INIT_DCS_CMD(0x6A, 0x16),
+	_INIT_DCS_CMD(0x6B, 0x14),
+	_INIT_DCS_CMD(0x6C, 0x12),
+	_INIT_DCS_CMD(0x6D, 0x10),
+	_INIT_DCS_CMD(0x6E, 0x0C),
+	_INIT_DCS_CMD(0x6F, 0x08),
+	_INIT_DCS_CMD(0x70, 0x02),
+	_INIT_DCS_CMD(0x71, 0x02),
+	_INIT_DCS_CMD(0x72, 0x02),
+	_INIT_DCS_CMD(0x73, 0x02),
+	_INIT_DCS_CMD(0x74, 0x02),
+	_INIT_DCS_CMD(0x75, 0x02),
+	_INIT_DCS_CMD(0x76, 0x02),
+
+	_INIT_DCS_CMD(0x77, 0x07),
+	_INIT_DCS_CMD(0x78, 0x07),
+	_INIT_DCS_CMD(0x79, 0x07),
+	_INIT_DCS_CMD(0x7A, 0x07),
+	_INIT_DCS_CMD(0x7B, 0x07),
+	_INIT_DCS_CMD(0x7C, 0x01),
+	_INIT_DCS_CMD(0x7D, 0x00),
+	_INIT_DCS_CMD(0x7E, 0x28),
+	_INIT_DCS_CMD(0x7F, 0x29),
+	_INIT_DCS_CMD(0x80, 0x17),
+	_INIT_DCS_CMD(0x81, 0x15),
+	_INIT_DCS_CMD(0x82, 0x13),
+	_INIT_DCS_CMD(0x83, 0x11),
+	_INIT_DCS_CMD(0x84, 0x0D),
+	_INIT_DCS_CMD(0x85, 0x09),
+	_INIT_DCS_CMD(0x86, 0x02),
+	_INIT_DCS_CMD(0x87, 0x07),
+	_INIT_DCS_CMD(0x88, 0x07),
+	_INIT_DCS_CMD(0x89, 0x07),
+	_INIT_DCS_CMD(0x8A, 0x07),
+	_INIT_DCS_CMD(0x8B, 0x07),
+	_INIT_DCS_CMD(0x8C, 0x07),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x02),
+	_INIT_DCS_CMD(0x29, 0x3A),
+	_INIT_DCS_CMD(0x2A, 0x3B),
+
+	_INIT_DCS_CMD(0x06, 0x01),
+	_INIT_DCS_CMD(0x07, 0x01),
+	_INIT_DCS_CMD(0x08, 0x0C),
+	_INIT_DCS_CMD(0x09, 0x44),
+
+	_INIT_DCS_CMD(0x3C, 0x0A),
+	_INIT_DCS_CMD(0x39, 0x11),
+	_INIT_DCS_CMD(0x3D, 0x00),
+	_INIT_DCS_CMD(0x3A, 0x0C),
+	_INIT_DCS_CMD(0x3B, 0x44),
+
+	_INIT_DCS_CMD(0x53, 0x1F),
+	_INIT_DCS_CMD(0x5E, 0x40),
+	_INIT_DCS_CMD(0x84, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x03),
+	_INIT_DCS_CMD(0x20, 0x01),
+	_INIT_DCS_CMD(0x21, 0x3C),
+	_INIT_DCS_CMD(0x22, 0xFA),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0A),
+	_INIT_DCS_CMD(0xE0, 0x01),
+	_INIT_DCS_CMD(0xE2, 0x01),
+	_INIT_DCS_CMD(0xE5, 0x91),
+	_INIT_DCS_CMD(0xE6, 0x3C),
+	_INIT_DCS_CMD(0xE7, 0x00),
+	_INIT_DCS_CMD(0xE8, 0xFA),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x12),
+	_INIT_DCS_CMD(0x87, 0x2C),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x05),
+	_INIT_DCS_CMD(0x73, 0xE5),
+	_INIT_DCS_CMD(0x7F, 0x6B),
+	_INIT_DCS_CMD(0x6D, 0xA4),
+	_INIT_DCS_CMD(0x79, 0x54),
+	_INIT_DCS_CMD(0x69, 0x97),
+	_INIT_DCS_CMD(0x6A, 0x97),
+	_INIT_DCS_CMD(0xA5, 0x3F),
+	_INIT_DCS_CMD(0x61, 0xDA),
+	_INIT_DCS_CMD(0xA7, 0xF1),
+	_INIT_DCS_CMD(0x5F, 0x01),
+	_INIT_DCS_CMD(0x62, 0x3F),
+	_INIT_DCS_CMD(0x1D, 0x90),
+	_INIT_DCS_CMD(0x86, 0x87),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x06),
+	_INIT_DCS_CMD(0xC0, 0x80),
+	_INIT_DCS_CMD(0xC1, 0x07),
+	_INIT_DCS_CMD(0xCA, 0x58),
+	_INIT_DCS_CMD(0xCB, 0x02),
+	_INIT_DCS_CMD(0xCE, 0x58),
+	_INIT_DCS_CMD(0xCF, 0x02),
+	_INIT_DCS_CMD(0x67, 0x60),
+	_INIT_DCS_CMD(0x10, 0x00),
+	_INIT_DCS_CMD(0x92, 0x22),
+	_INIT_DCS_CMD(0xD3, 0x08),
+	_INIT_DCS_CMD(0xD6, 0x55),
+	_INIT_DCS_CMD(0xDC, 0x38),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x08),
+	_INIT_DCS_CMD(0xE0, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0x56, 0x6A, 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6, 0xBD, 0xD5, 0xE2, 0xE8),
+	_INIT_DCS_CMD(0xE1, 0x00, 0x10, 0x2A, 0x4D, 0x61, 0x56, 0x6A, 0x6E, 0x79, 0x76, 0x8F, 0x95, 0x98, 0xAE, 0xAA, 0xB2, 0xBB, 0xCE, 0xC6, 0xBD, 0xD5, 0xE2, 0xE8),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x04),
+	_INIT_DCS_CMD(0xBA, 0x81),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0C),
+	_INIT_DCS_CMD(0x00, 0x02),
+	_INIT_DCS_CMD(0x01, 0x00),
+	_INIT_DCS_CMD(0x02, 0x03),
+	_INIT_DCS_CMD(0x03, 0x01),
+	_INIT_DCS_CMD(0x04, 0x03),
+	_INIT_DCS_CMD(0x05, 0x02),
+	_INIT_DCS_CMD(0x06, 0x04),
+	_INIT_DCS_CMD(0x07, 0x03),
+	_INIT_DCS_CMD(0x08, 0x03),
+	_INIT_DCS_CMD(0x09, 0x04),
+	_INIT_DCS_CMD(0x0A, 0x04),
+	_INIT_DCS_CMD(0x0B, 0x05),
+	_INIT_DCS_CMD(0x0C, 0x04),
+	_INIT_DCS_CMD(0x0D, 0x06),
+	_INIT_DCS_CMD(0x0E, 0x05),
+	_INIT_DCS_CMD(0x0F, 0x07),
+	_INIT_DCS_CMD(0x10, 0x04),
+	_INIT_DCS_CMD(0x11, 0x08),
+	_INIT_DCS_CMD(0x12, 0x05),
+	_INIT_DCS_CMD(0x13, 0x09),
+	_INIT_DCS_CMD(0x14, 0x05),
+	_INIT_DCS_CMD(0x15, 0x0A),
+	_INIT_DCS_CMD(0x16, 0x06),
+	_INIT_DCS_CMD(0x17, 0x0B),
+	_INIT_DCS_CMD(0x18, 0x05),
+	_INIT_DCS_CMD(0x19, 0x0C),
+	_INIT_DCS_CMD(0x1A, 0x06),
+	_INIT_DCS_CMD(0x1B, 0x0D),
+	_INIT_DCS_CMD(0x1C, 0x06),
+	_INIT_DCS_CMD(0x1D, 0x0E),
+	_INIT_DCS_CMD(0x1E, 0x07),
+	_INIT_DCS_CMD(0x1F, 0x0F),
+	_INIT_DCS_CMD(0x20, 0x06),
+	_INIT_DCS_CMD(0x21, 0x10),
+	_INIT_DCS_CMD(0x22, 0x07),
+	_INIT_DCS_CMD(0x23, 0x11),
+	_INIT_DCS_CMD(0x24, 0x07),
+	_INIT_DCS_CMD(0x25, 0x12),
+	_INIT_DCS_CMD(0x26, 0x08),
+	_INIT_DCS_CMD(0x27, 0x13),
+	_INIT_DCS_CMD(0x28, 0x07),
+	_INIT_DCS_CMD(0x29, 0x14),
+	_INIT_DCS_CMD(0x2A, 0x08),
+	_INIT_DCS_CMD(0x2B, 0x15),
+	_INIT_DCS_CMD(0x2C, 0x08),
+	_INIT_DCS_CMD(0x2D, 0x16),
+	_INIT_DCS_CMD(0x2E, 0x09),
+	_INIT_DCS_CMD(0x2F, 0x17),
+	_INIT_DCS_CMD(0x30, 0x08),
+	_INIT_DCS_CMD(0x31, 0x18),
+	_INIT_DCS_CMD(0x32, 0x09),
+	_INIT_DCS_CMD(0x33, 0x19),
+	_INIT_DCS_CMD(0x34, 0x09),
+	_INIT_DCS_CMD(0x35, 0x1A),
+	_INIT_DCS_CMD(0x36, 0x0A),
+	_INIT_DCS_CMD(0x37, 0x1B),
+	_INIT_DCS_CMD(0x38, 0x0A),
+	_INIT_DCS_CMD(0x39, 0x1C),
+	_INIT_DCS_CMD(0x3A, 0x0A),
+	_INIT_DCS_CMD(0x3B, 0x1D),
+	_INIT_DCS_CMD(0x3C, 0x0A),
+	_INIT_DCS_CMD(0x3D, 0x1E),
+	_INIT_DCS_CMD(0x3E, 0x0A),
+	_INIT_DCS_CMD(0x3F, 0x1F),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x04),
+	_INIT_DCS_CMD(0xBA, 0x01),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0E),
+	_INIT_DCS_CMD(0x02, 0x0C),
+	_INIT_DCS_CMD(0x20, 0x10),
+	_INIT_DCS_CMD(0x25, 0x16),
+	_INIT_DCS_CMD(0x26, 0xE0),
+	_INIT_DCS_CMD(0x27, 0x00),
+	_INIT_DCS_CMD(0x29, 0x71),
+	_INIT_DCS_CMD(0x2A, 0x46),
+	_INIT_DCS_CMD(0x2B, 0x1F),
+	_INIT_DCS_CMD(0x2D, 0xC7),
+	_INIT_DCS_CMD(0x31, 0x02),
+	_INIT_DCS_CMD(0x32, 0xDF),
+	_INIT_DCS_CMD(0x33, 0x5A),
+	_INIT_DCS_CMD(0x34, 0xC0),
+	_INIT_DCS_CMD(0x35, 0x5A),
+	_INIT_DCS_CMD(0x36, 0xC0),
+	_INIT_DCS_CMD(0x38, 0x65),
+	_INIT_DCS_CMD(0x80, 0x3E),
+	_INIT_DCS_CMD(0x81, 0xA0),
+	_INIT_DCS_CMD(0xB0, 0x01),
+	_INIT_DCS_CMD(0xB1, 0xCC),
+	_INIT_DCS_CMD(0xC0, 0x12),
+	_INIT_DCS_CMD(0xC2, 0xCC),
+	_INIT_DCS_CMD(0xC3, 0xCC),
+	_INIT_DCS_CMD(0xC4, 0xCC),
+	_INIT_DCS_CMD(0xC5, 0xCC),
+	_INIT_DCS_CMD(0xC6, 0xCC),
+	_INIT_DCS_CMD(0xC7, 0xCC),
+	_INIT_DCS_CMD(0xC8, 0xCC),
+	_INIT_DCS_CMD(0xC9, 0xCC),
+	_INIT_DCS_CMD(0x30, 0x00),
+	_INIT_DCS_CMD(0x00, 0x81),
+	_INIT_DCS_CMD(0x08, 0x02),
+	_INIT_DCS_CMD(0x09, 0x00),
+	_INIT_DCS_CMD(0x07, 0x21),
+	_INIT_DCS_CMD(0x04, 0x10),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x1E),
+	_INIT_DCS_CMD(0x60, 0x00),
+	_INIT_DCS_CMD(0x64, 0x00),
+	_INIT_DCS_CMD(0x6D, 0x00),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x0B),
+	_INIT_DCS_CMD(0xA6, 0x44),
+	_INIT_DCS_CMD(0xA7, 0xB6),
+	_INIT_DCS_CMD(0xA8, 0x03),
+	_INIT_DCS_CMD(0xA9, 0x03),
+	_INIT_DCS_CMD(0xAA, 0x51),
+	_INIT_DCS_CMD(0xAB, 0x51),
+	_INIT_DCS_CMD(0xAC, 0x04),
+	_INIT_DCS_CMD(0xBD, 0x92),
+	_INIT_DCS_CMD(0xBE, 0xA1),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x05),
+	_INIT_DCS_CMD(0x86, 0x87),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x06),
+	_INIT_DCS_CMD(0x92, 0x22),
+
+	_INIT_DCS_CMD(0xFF, 0x98, 0x82, 0x00),
+	_INIT_DCS_CMD(0x11),
+	_INIT_DELAY_CMD(120),
+	_INIT_DCS_CMD(0x29),
+	_INIT_DELAY_CMD(20),
+	{},
+};
+
 static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0xFF, 0x20),
 	_INIT_DCS_CMD(0xFB, 0x01),
@@ -1795,6 +2135,34 @@ static const struct panel_desc starry_himax83102_j02_desc = {
 	.lp11_before_reset = true,
 };
 
+static const struct drm_display_mode starry_ili9882t_default_mode = {
+	.clock = 165280,
+	.hdisplay = 1200,
+	.hsync_start = 1200 + 32,
+	.hsync_end = 1200 + 32 + 30,
+	.htotal = 1200 + 32 + 30 + 32,
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 68,
+	.vsync_end = 1920 + 68 + 2,
+	.vtotal = 1920 + 68 + 2 + 10,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct panel_desc starry_ili9882t_desc = {
+	.modes = &starry_ili9882t_default_mode,
+	.bpc = 8,
+	.size = {
+		.width_mm = 141,
+		.height_mm = 226,
+	},
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM,
+	.init_cmds = starry_ili9882t_init_cmd,
+	.lp11_before_reset = true,
+};
+
 static int boe_panel_get_modes(struct drm_panel *panel,
 			       struct drm_connector *connector)
 {
@@ -1971,6 +2339,9 @@ static const struct of_device_id boe_of_match[] = {
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_himax83102_j02_desc
 	},
+	{ .compatible = "starry,ili9882t",
+	  .data = &starry_ili9882t_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, boe_of_match);
-- 
2.25.1

