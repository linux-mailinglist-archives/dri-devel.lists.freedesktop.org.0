Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02F2459D2C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 08:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3F16E0C4;
	Tue, 23 Nov 2021 07:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E016E0C4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 07:52:15 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id g28so17603568pgg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 23:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVbU0c9IdrY522BCvsaXslnlPipdbEhVYBOGx1ugzH8=;
 b=coKfosrUOBKdPeNA4ljSydTj+X1a8hy4cA9eOt3wvP3/kL7WytPoyKmNRYs8h5tF/7
 2lzGxZW1vbhuFvZviPTdRRZgJCXYpZwsZt19BlPjJF2sR+ukcXufaxeA5gMOEyM5Wufp
 lRaEUD9ZJTcsM7lxoZGbs9qfWuw5DfiloGGEkW2HYwQqY+H79H/p7U3ZDlFXJtJb+fFL
 pKkUKiGhxbnqQ/YEOpJnKGzaSm/qAH4c87r00lXG2b03+B62kY5hzDHJDr1Yxf1NigxC
 OVqKNHTvLrt7kxjVHudmJur21JVGvMBrXEY15vOQJTHiMI08+0yROSPiFlwZaeOa/Hit
 L4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVbU0c9IdrY522BCvsaXslnlPipdbEhVYBOGx1ugzH8=;
 b=EQHaL+pTx3bW4fxLulyYpqUNKxJvA0O/3H3pYPJerAietPzUopK2fxpN6raM1Du8Sg
 zEjZtovOc6ODkW1FyDGkJto1W04/BntlLKoNqgxsTZjjcnmXBSEz0nVXs1MIg//DXJ87
 uvDNygWvpoYxfqeyGKIw5D/c8abIsBwKF3wrafu4PK4amX3mcxCXbtvzJUa8RmXS1FLD
 rRkuK5BZx8xU1RAoLQtrB5mhOx09Ikbc4ANsqcmyJ/cSR1mEXZG43iLn3CClC7pXVYtZ
 fySNE9fzFQbxZXf5eiNyCS+CV4dBewJN9Ci7UhmfhUO7iArv+Fc2eg7GeRQTxAXL4w5r
 Ekzw==
X-Gm-Message-State: AOAM5330jyrBL9aQaoU8YP4sQuhK4dpW4VS2iPOHu14D7YuQfj6D5T9q
 lGLYbh6IGoaC6GPwDibnM1xRQA==
X-Google-Smtp-Source: ABdhPJydv653Cl0dgjExAK5jG9fL4K7gSBhRuO5o8XkFQNGKZ4BmsK1CfyV4j2IfomSBRgd/9/1HgQ==
X-Received: by 2002:a05:6a00:2405:b0:3e1:9f65:9703 with SMTP id
 z5-20020a056a00240500b003e19f659703mr3189886pfh.6.1637653935004; 
 Mon, 22 Nov 2021 23:52:15 -0800 (PST)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id l6sm6832692pfc.30.2021.11.22.23.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 23:52:14 -0800 (PST)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Subject: [PATCH] drm/panel: Update BOE and INX initial code
Date: Tue, 23 Nov 2021 15:52:05 +0800
Message-Id: <20211123075205.2457975-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At present, we have enough panel to confirm the effect,
update the initial code to achieve the best effect.
such as gamma, Gtp timing. They are all minor modifications
and doesn't affect the lighting of the panel.

a)Boe panel Optimized touch horizontal grain.
b)Inx panel Optimized GOP timming and gamma.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 108 ++++++++++++------
 1 file changed, 71 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 529561b4fbbc..cc5990dd24a3 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -84,8 +84,8 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0x0D, 0x63),
 	_INIT_DCS_CMD(0x0E, 0x91),
 	_INIT_DCS_CMD(0x0F, 0x73),
-	_INIT_DCS_CMD(0x95, 0xEB),
-	_INIT_DCS_CMD(0x96, 0xEB),
+	_INIT_DCS_CMD(0x95, 0xE6),
+	_INIT_DCS_CMD(0x96, 0xF0),
 	_INIT_DCS_CMD(0x30, 0x11),
 	_INIT_DCS_CMD(0x6D, 0x66),
 	_INIT_DCS_CMD(0x75, 0xA2),
@@ -111,18 +111,16 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0xB0, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
 	_INIT_DCS_CMD(0xB1, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
 	_INIT_DCS_CMD(0xB2, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
-	_INIT_DCS_CMD(0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xF7),
-
+	_INIT_DCS_CMD(0xB3, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xA7, 0x03, 0xCF, 0x03, 0xDE, 0x03, 0xE0),
 	_INIT_DCS_CMD(0xB4, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
 	_INIT_DCS_CMD(0xB5, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
 	_INIT_DCS_CMD(0xB6, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
-	_INIT_DCS_CMD(0xB7, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xF7),
+	_INIT_DCS_CMD(0xB7, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xA7, 0x03, 0xCF, 0x03, 0xDE, 0x03, 0xE0),
 
 	_INIT_DCS_CMD(0xB8, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00, 0x99, 0x00, 0xAE, 0x00, 0xC1),
 	_INIT_DCS_CMD(0xB9, 0x00, 0xD2, 0x01, 0x0B, 0x01, 0x34, 0x01, 0x76, 0x01, 0xA3, 0x01, 0xEF, 0x02, 0x27, 0x02, 0x29),
 	_INIT_DCS_CMD(0xBA, 0x02, 0x5F, 0x02, 0x9E, 0x02, 0xC9, 0x03, 0x00, 0x03, 0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73),
-	_INIT_DCS_CMD(0xBB, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xAF, 0x03, 0xDF, 0x03, 0xF5, 0x03, 0xF7),
-
+	_INIT_DCS_CMD(0xBB, 0x03, 0x86, 0x03, 0x9A, 0x03, 0xA7, 0x03, 0xCF, 0x03, 0xDE, 0x03, 0xE0),
 	_INIT_DCS_CMD(0xFF, 0x24),
 	_INIT_DCS_CMD(0xFB, 0x01),
 
@@ -332,12 +330,38 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0x34, 0x78),
 	_INIT_DCS_CMD(0x35, 0x16),
 	_INIT_DCS_CMD(0xC8, 0x04),
-	_INIT_DCS_CMD(0xC9, 0x80),
+	_INIT_DCS_CMD(0xC9, 0x9E),
 	_INIT_DCS_CMD(0xCA, 0x4E),
 	_INIT_DCS_CMD(0xCB, 0x00),
-	_INIT_DCS_CMD(0xA9, 0x4C),
-	_INIT_DCS_CMD(0xAA, 0x47),
-
+	_INIT_DCS_CMD(0xA9, 0x49),
+	_INIT_DCS_CMD(0xAA, 0x4B),
+	_INIT_DCS_CMD(0xAB, 0x48),
+	_INIT_DCS_CMD(0xAC, 0x43),
+	_INIT_DCS_CMD(0xAD, 0x40),
+	_INIT_DCS_CMD(0xAE, 0x50),
+	_INIT_DCS_CMD(0xAF, 0x44),
+	_INIT_DCS_CMD(0xB0, 0x54),
+	_INIT_DCS_CMD(0xB1, 0x4E),
+	_INIT_DCS_CMD(0xB2, 0x4D),
+	_INIT_DCS_CMD(0xB3, 0x4C),
+	_INIT_DCS_CMD(0xB4, 0x41),
+	_INIT_DCS_CMD(0xB5, 0x47),
+	_INIT_DCS_CMD(0xB6, 0x53),
+	_INIT_DCS_CMD(0xB7, 0x3E),
+	_INIT_DCS_CMD(0xB8, 0x51),
+	_INIT_DCS_CMD(0xB9, 0x3C),
+	_INIT_DCS_CMD(0xBA, 0x3B),
+	_INIT_DCS_CMD(0xBB, 0x46),
+	_INIT_DCS_CMD(0xBC, 0x45),
+	_INIT_DCS_CMD(0xBD, 0x55),
+	_INIT_DCS_CMD(0xBE, 0x3D),
+	_INIT_DCS_CMD(0xBF, 0x3F),
+	_INIT_DCS_CMD(0xC0, 0x52),
+	_INIT_DCS_CMD(0xC1, 0x4A),
+	_INIT_DCS_CMD(0xC2, 0x39),
+	_INIT_DCS_CMD(0xC3, 0x4F),
+	_INIT_DCS_CMD(0xC4, 0x3A),
+	_INIT_DCS_CMD(0xC5, 0x42),
 	_INIT_DCS_CMD(0xFF, 0x27),
 	_INIT_DCS_CMD(0xFB, 0x01),
 
@@ -428,10 +452,10 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x08, 0x4B),
 	_INIT_DCS_CMD(0x0E, 0x91),
 	_INIT_DCS_CMD(0x0F, 0x69),
-	_INIT_DCS_CMD(0x95, 0xFF),
-	_INIT_DCS_CMD(0x96, 0xFF),
-	_INIT_DCS_CMD(0x9D, 0x0A),
-	_INIT_DCS_CMD(0x9E, 0x0A),
+	_INIT_DCS_CMD(0x95, 0xF5),
+	_INIT_DCS_CMD(0x96, 0xF5),
+	_INIT_DCS_CMD(0x9D, 0x00),
+	_INIT_DCS_CMD(0x9E, 0x00),
 	_INIT_DCS_CMD(0x69, 0x98),
 	_INIT_DCS_CMD(0x75, 0xA2),
 	_INIT_DCS_CMD(0x77, 0xB3),
@@ -493,17 +517,17 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x2A, 0x03),
 	_INIT_DCS_CMD(0x2B, 0x03),
 
-	_INIT_DCS_CMD(0x2F, 0x06),
+	_INIT_DCS_CMD(0x2F, 0x05),
 	_INIT_DCS_CMD(0x30, 0x32),
 	_INIT_DCS_CMD(0x31, 0x43),
-	_INIT_DCS_CMD(0x33, 0x06),
+	_INIT_DCS_CMD(0x33, 0x05),
 	_INIT_DCS_CMD(0x34, 0x32),
 	_INIT_DCS_CMD(0x35, 0x43),
 	_INIT_DCS_CMD(0x37, 0x44),
 	_INIT_DCS_CMD(0x38, 0x40),
 	_INIT_DCS_CMD(0x39, 0x00),
-	_INIT_DCS_CMD(0x3A, 0x01),
-	_INIT_DCS_CMD(0x3B, 0x48),
+	_INIT_DCS_CMD(0x3A, 0x18),
+	_INIT_DCS_CMD(0x3B, 0x00),
 	_INIT_DCS_CMD(0x3D, 0x93),
 	_INIT_DCS_CMD(0xAB, 0x44),
 	_INIT_DCS_CMD(0xAC, 0x40),
@@ -520,8 +544,8 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x56, 0x08),
 	_INIT_DCS_CMD(0x58, 0x21),
 	_INIT_DCS_CMD(0x59, 0x40),
-	_INIT_DCS_CMD(0x5A, 0x09),
-	_INIT_DCS_CMD(0x5B, 0x48),
+	_INIT_DCS_CMD(0x5A, 0x00),
+	_INIT_DCS_CMD(0x5B, 0x2C),
 	_INIT_DCS_CMD(0x5E, 0x00, 0x10),
 	_INIT_DCS_CMD(0x5F, 0x00),
 
@@ -557,34 +581,35 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0xEE, 0x7A),
 	_INIT_DCS_CMD(0xEF, 0x01),
 	_INIT_DCS_CMD(0xF0, 0x7A),
-
+	_INIT_DCS_CMD(0xB6, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00),
 	_INIT_DCS_CMD(0xFF, 0x25),
 	_INIT_DCS_CMD(0xFB, 0x01),
 
 	_INIT_DCS_CMD(0x05, 0x00),
-
+	_INIT_DCS_CMD(0x13, 0x02),
+	_INIT_DCS_CMD(0x14, 0xDF),
 	_INIT_DCS_CMD(0xF1, 0x10),
 	_INIT_DCS_CMD(0x1E, 0x00),
-	_INIT_DCS_CMD(0x1F, 0x09),
-	_INIT_DCS_CMD(0x20, 0x46),
+	_INIT_DCS_CMD(0x1F, 0x00),
+	_INIT_DCS_CMD(0x20, 0x2C),
 	_INIT_DCS_CMD(0x25, 0x00),
-	_INIT_DCS_CMD(0x26, 0x09),
-	_INIT_DCS_CMD(0x27, 0x46),
+	_INIT_DCS_CMD(0x26, 0x00),
+	_INIT_DCS_CMD(0x27, 0x2C),
 	_INIT_DCS_CMD(0x3F, 0x80),
 	_INIT_DCS_CMD(0x40, 0x00),
 	_INIT_DCS_CMD(0x43, 0x00),
 
-	_INIT_DCS_CMD(0x44, 0x09),
-	_INIT_DCS_CMD(0x45, 0x46),
+	_INIT_DCS_CMD(0x44, 0x18),
+	_INIT_DCS_CMD(0x45, 0x00),
 
-	_INIT_DCS_CMD(0x48, 0x09),
-	_INIT_DCS_CMD(0x49, 0x46),
+	_INIT_DCS_CMD(0x48, 0x00),
+	_INIT_DCS_CMD(0x49, 0x2C),
 	_INIT_DCS_CMD(0x5B, 0x80),
 	_INIT_DCS_CMD(0x5C, 0x00),
-	_INIT_DCS_CMD(0x5D, 0x01),
-	_INIT_DCS_CMD(0x5E, 0x46),
-	_INIT_DCS_CMD(0x61, 0x01),
-	_INIT_DCS_CMD(0x62, 0x46),
+	_INIT_DCS_CMD(0x5D, 0x00),
+	_INIT_DCS_CMD(0x5E, 0x00),
+	_INIT_DCS_CMD(0x61, 0x00),
+	_INIT_DCS_CMD(0x62, 0x2C),
 	_INIT_DCS_CMD(0x68, 0x10),
 	_INIT_DCS_CMD(0xFF, 0x26),
 	_INIT_DCS_CMD(0xFB, 0x01),
@@ -700,16 +725,22 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0xA3, 0x30),
 	_INIT_DCS_CMD(0xA4, 0xC0),
 	_INIT_DCS_CMD(0xE8, 0x00),
+	_INIT_DCS_CMD(0x97, 0x3C),
+	_INIT_DCS_CMD(0x98, 0x02),
+	_INIT_DCS_CMD(0x99, 0x95),
+	_INIT_DCS_CMD(0x9A, 0x06),
+	_INIT_DCS_CMD(0x9B, 0x00),
+	_INIT_DCS_CMD(0x9C, 0x0B),
+	_INIT_DCS_CMD(0x9D, 0x0A),
+	_INIT_DCS_CMD(0x9E, 0x90),
 	_INIT_DCS_CMD(0xFF, 0xF0),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x3A, 0x08),
 	_INIT_DCS_CMD(0xFF, 0xD0),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x00, 0x33),
-	_INIT_DCS_CMD(0x02, 0x77),
 	_INIT_DCS_CMD(0x08, 0x01),
 	_INIT_DCS_CMD(0x09, 0xBF),
-	_INIT_DCS_CMD(0x28, 0x30),
 	_INIT_DCS_CMD(0x2F, 0x33),
 	_INIT_DCS_CMD(0xFF, 0x23),
 	_INIT_DCS_CMD(0xFB, 0x01),
@@ -718,6 +749,9 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0xFF, 0x20),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x30, 0x00),
+	_INIT_DCS_CMD(0xFF, 0x24),
+	_INIT_DCS_CMD(0x5C, 0x88),
+	_INIT_DCS_CMD(0x5D, 0x08),
 	_INIT_DCS_CMD(0xFF, 0x10),
 	_INIT_DCS_CMD(0xB9, 0x01),
 	_INIT_DCS_CMD(0xFF, 0x20),
-- 
2.25.1

