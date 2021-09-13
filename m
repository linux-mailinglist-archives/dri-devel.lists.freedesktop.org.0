Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391C4089B5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4F46E16D;
	Mon, 13 Sep 2021 10:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296AA6E167
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:59:54 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso6165435pjq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uE5WlZJx7+XF/f8bRbtAqgsitFd74Lsy2HIzniKL4kE=;
 b=K9uQ/LfxX972OGN8S7KHCuLF4d1ydXtixvSA/URTi9kY2yJONXNsn/KCBNIsXVzyXx
 RLl6MZH2hqvkoCciZndpY4lfvCD4NhPWU/L0ZqrkE5kbw2uXWpSDZQ9FsUuOpOSrZs08
 aRvcmD7LMSnG7Hv+f7n39yJbDtqTmTafWmoVPEoGzQSTXT3Ho1rnjv7sKVDQzp6lQT3A
 +tyYIcLP2rq2+SPFR9+evbquCXYBv27v10u6QQuCre3I1QBHVs3Z8zXJoq7ANr73zYSD
 l9rcSMMEAwMECPcYW9RBnYLBxaDg/23YZEc9H2nkTMQh8QHqnGPHrPV/NsZlA5iHu/o6
 2VbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uE5WlZJx7+XF/f8bRbtAqgsitFd74Lsy2HIzniKL4kE=;
 b=K3KM+o9L5SSS5FONdfluqugKiKbTEEdH2nTvQ5v117bnTrB+umTBmoP5uTV5/t/yG9
 6+1502bl/E3yXLe+eYaSq5ZKw1ryIieHtF9i7EVvoFLNzvJGr3Fth15A1CXhQtYfZnbw
 D9zosvix03yM/VMgeCo/np91at/+v5QOiPgS7U/dsHm/R9CFE46qCcT0aJycVWZGuBU9
 /A5Qa29/uFpKbA415od9avHpLdnvZS3424G6wwhTC4xt2Mqo45rOcpMVlpDfGB/NSJ1T
 NCyjMMBWqdsMsmwkAsm+74SooriuwGD1mC+3RujbckwaGeRlChOWNebe0KbSww9jLtNA
 rdEg==
X-Gm-Message-State: AOAM532vmYmFqKybOd0uhmBW9MJL7xsi/CS8UgOLha7350e/HL4d0sNc
 BgYIdYzBFXQ6pAJON5M1sOBhBw==
X-Google-Smtp-Source: ABdhPJzLyIxvZoajaGrnQcr/x0pgcPnOqFQazMavi8LlyQYGrE9tJdA5JIDPjzNESNrqoSRDT2ZzVw==
X-Received: by 2002:a17:902:a604:b029:12c:dda2:30c4 with SMTP id
 u4-20020a170902a604b029012cdda230c4mr9828052plq.73.1631530793667; 
 Mon, 13 Sep 2021 03:59:53 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id l22sm8279641pgo.45.2021.09.13.03.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:59:53 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v5 5/5] drm/panel: Update BOE and INX init code to support touch
 function
Date: Mon, 13 Sep 2021 18:59:20 +0800
Message-Id: <20210913105920.3719525-6-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an incell IC, TDDI use time division multiplexing.
Init code effect touch sensing.
Support touch function we needed to handle were:
a) Update init code for the panel driver, adjust the porch value.
b) After update init code these two panels can support DSI HS mode.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 399 +++++-------------
 1 file changed, 110 insertions(+), 289 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 2acbb5c623d8..cb80daff3783 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -36,7 +36,6 @@ struct panel_desc {
 	const struct panel_init_cmd *init_cmds;
 	unsigned int lanes;
 	bool discharge_on_disable;
-	bool unsupport_dsi_hs_mode;
 };
 
 struct boe_panel {
@@ -84,6 +83,8 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0x07, 0x78),
 	_INIT_DCS_CMD(0x08, 0x5A),
 	_INIT_DCS_CMD(0x0D, 0x63),
+	_INIT_DCS_CMD(0x0E, 0x91),
+	_INIT_DCS_CMD(0x0F, 0x73),
 	_INIT_DCS_CMD(0x95, 0xEB),
 	_INIT_DCS_CMD(0x96, 0xEB),
 	_INIT_DCS_CMD(0x30, 0x11),
@@ -199,18 +200,15 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0x37, 0x44),
 	_INIT_DCS_CMD(0x38, 0x40),
 	_INIT_DCS_CMD(0x39, 0x00),
-	_INIT_DCS_CMD(0x3A, 0x9A),
-	_INIT_DCS_CMD(0x3B, 0xA0),
+	_INIT_DCS_CMD(0x3A, 0x5D),
+	_INIT_DCS_CMD(0x3B, 0x60),
 	_INIT_DCS_CMD(0x3D, 0x42),
-
 	_INIT_DCS_CMD(0x3F, 0x06),
 	_INIT_DCS_CMD(0x43, 0x06),
-
 	_INIT_DCS_CMD(0x47, 0x66),
-	_INIT_DCS_CMD(0x4A, 0x9A),
-	_INIT_DCS_CMD(0x4B, 0xA0),
+	_INIT_DCS_CMD(0x4A, 0x5D),
+	_INIT_DCS_CMD(0x4B, 0x60),
 	_INIT_DCS_CMD(0x4C, 0x91),
-
 	_INIT_DCS_CMD(0x4D, 0x21),
 	_INIT_DCS_CMD(0x4E, 0x43),
 	_INIT_DCS_CMD(0x51, 0x12),
@@ -219,90 +217,68 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0x56, 0x04),
 	_INIT_DCS_CMD(0x58, 0x21),
 	_INIT_DCS_CMD(0x59, 0x30),
-	_INIT_DCS_CMD(0x5A, 0xBA),
-	_INIT_DCS_CMD(0x5B, 0xA0),
+	_INIT_DCS_CMD(0x5A, 0x60),
+	_INIT_DCS_CMD(0x5B, 0x50),
 	_INIT_DCS_CMD(0x5E, 0x00, 0x06),
 	_INIT_DCS_CMD(0x5F, 0x00),
-
 	_INIT_DCS_CMD(0x65, 0x82),
-
 	_INIT_DCS_CMD(0x7E, 0x20),
 	_INIT_DCS_CMD(0x7F, 0x3C),
 	_INIT_DCS_CMD(0x82, 0x04),
 	_INIT_DCS_CMD(0x97, 0xC0),
-
 	_INIT_DCS_CMD(0xB6, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00, 0x00),
-
-	_INIT_DCS_CMD(0x92, 0xC4),
+	_INIT_DCS_CMD(0x91, 0x44),
+	_INIT_DCS_CMD(0x92, 0xA9),
 	_INIT_DCS_CMD(0x93, 0x1A),
-	_INIT_DCS_CMD(0x94, 0x5F),
-
+	_INIT_DCS_CMD(0x94, 0x96),
 	_INIT_DCS_CMD(0xD7, 0x55),
 	_INIT_DCS_CMD(0xDA, 0x0A),
 	_INIT_DCS_CMD(0xDE, 0x08),
-
 	_INIT_DCS_CMD(0xDB, 0x05),
-	_INIT_DCS_CMD(0xDC, 0xC4),
+	_INIT_DCS_CMD(0xDC, 0xA9),
 	_INIT_DCS_CMD(0xDD, 0x22),
 
 	_INIT_DCS_CMD(0xDF, 0x05),
-	_INIT_DCS_CMD(0xE0, 0xC4),
-
+	_INIT_DCS_CMD(0xE0, 0xA9),
 	_INIT_DCS_CMD(0xE1, 0x05),
-	_INIT_DCS_CMD(0xE2, 0xC4),
-
+	_INIT_DCS_CMD(0xE2, 0xA9),
 	_INIT_DCS_CMD(0xE3, 0x05),
-	_INIT_DCS_CMD(0xE4, 0xC4),
+	_INIT_DCS_CMD(0xE4, 0xA9),
 	_INIT_DCS_CMD(0xE5, 0x05),
-	_INIT_DCS_CMD(0xE6, 0xC4),
-	_INIT_DCS_CMD(0x5C, 0x88),
-	_INIT_DCS_CMD(0x5D, 0x08),
-	_INIT_DCS_CMD(0x8D, 0x88),
-	_INIT_DCS_CMD(0x8E, 0x08),
+	_INIT_DCS_CMD(0xE6, 0xA9),
+	_INIT_DCS_CMD(0x5C, 0x00),
+	_INIT_DCS_CMD(0x5D, 0x00),
+	_INIT_DCS_CMD(0x8D, 0x00),
+	_INIT_DCS_CMD(0x8E, 0x00),
 	_INIT_DCS_CMD(0xB5, 0x90),
 	_INIT_DCS_CMD(0xFF, 0x25),
 	_INIT_DCS_CMD(0xFB, 0x01),
-
 	_INIT_DCS_CMD(0x05, 0x00),
-
 	_INIT_DCS_CMD(0x19, 0x07),
-
-	_INIT_DCS_CMD(0x1F, 0xBA),
-	_INIT_DCS_CMD(0x20, 0xA0),
-
-	_INIT_DCS_CMD(0x26, 0xBA),
-	_INIT_DCS_CMD(0x27, 0xA0),
-
-	_INIT_DCS_CMD(0x33, 0xBA),
-	_INIT_DCS_CMD(0x34, 0xA0),
-
+	_INIT_DCS_CMD(0x1F, 0x60),
+	_INIT_DCS_CMD(0x20, 0x50),
+	_INIT_DCS_CMD(0x26, 0x60),
+	_INIT_DCS_CMD(0x27, 0x50),
+	_INIT_DCS_CMD(0x33, 0x60),
+	_INIT_DCS_CMD(0x34, 0x50),
 	_INIT_DCS_CMD(0x3F, 0xE0),
-
 	_INIT_DCS_CMD(0x40, 0x00),
-
 	_INIT_DCS_CMD(0x44, 0x00),
 	_INIT_DCS_CMD(0x45, 0x40),
-
-	_INIT_DCS_CMD(0x48, 0xBA),
-	_INIT_DCS_CMD(0x49, 0xA0),
-
+	_INIT_DCS_CMD(0x48, 0x60),
+	_INIT_DCS_CMD(0x49, 0x50),
 	_INIT_DCS_CMD(0x5B, 0x00),
 	_INIT_DCS_CMD(0x5C, 0x00),
 	_INIT_DCS_CMD(0x5D, 0x00),
 	_INIT_DCS_CMD(0x5E, 0xD0),
-
-	_INIT_DCS_CMD(0x61, 0xBA),
-	_INIT_DCS_CMD(0x62, 0xA0),
-
+	_INIT_DCS_CMD(0x61, 0x60),
+	_INIT_DCS_CMD(0x62, 0x50),
 	_INIT_DCS_CMD(0xF1, 0x10),
-
 	_INIT_DCS_CMD(0xFF, 0x2A),
 	_INIT_DCS_CMD(0xFB, 0x01),
 
 	_INIT_DCS_CMD(0x64, 0x16),
-
 	_INIT_DCS_CMD(0x67, 0x16),
-
 	_INIT_DCS_CMD(0x6A, 0x16),
 
 	_INIT_DCS_CMD(0x70, 0x30),
@@ -316,86 +292,79 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 
 	_INIT_DCS_CMD(0xFF, 0x26),
 	_INIT_DCS_CMD(0xFB, 0x01),
-
 	_INIT_DCS_CMD(0x00, 0xA1),
 
-	_INIT_DCS_CMD(0x0A, 0xF2),
-
+	_INIT_DCS_CMD(0x02, 0x31),
 	_INIT_DCS_CMD(0x04, 0x28),
 	_INIT_DCS_CMD(0x06, 0x30),
-	_INIT_DCS_CMD(0x0C, 0x13),
-	_INIT_DCS_CMD(0x0D, 0x0A),
-	_INIT_DCS_CMD(0x0F, 0x0A),
+	_INIT_DCS_CMD(0x0C, 0x16),
+	_INIT_DCS_CMD(0x0D, 0x0D),
+	_INIT_DCS_CMD(0x0F, 0x00),
 	_INIT_DCS_CMD(0x11, 0x00),
 	_INIT_DCS_CMD(0x12, 0x50),
-	_INIT_DCS_CMD(0x13, 0x51),
-	_INIT_DCS_CMD(0x14, 0x65),
+	_INIT_DCS_CMD(0x13, 0x56),
+	_INIT_DCS_CMD(0x14, 0x57),
 	_INIT_DCS_CMD(0x15, 0x00),
 	_INIT_DCS_CMD(0x16, 0x10),
 	_INIT_DCS_CMD(0x17, 0xA0),
 	_INIT_DCS_CMD(0x18, 0x86),
-	_INIT_DCS_CMD(0x19, 0x11),
-	_INIT_DCS_CMD(0x1A, 0x7B),
-	_INIT_DCS_CMD(0x1B, 0x10),
-	_INIT_DCS_CMD(0x1C, 0xBB),
+	_INIT_DCS_CMD(0x19, 0x0D),
+	_INIT_DCS_CMD(0x1A, 0x7F),
+	_INIT_DCS_CMD(0x1B, 0x0C),
+	_INIT_DCS_CMD(0x1C, 0xBF),
 	_INIT_DCS_CMD(0x22, 0x00),
 	_INIT_DCS_CMD(0x23, 0x00),
-	_INIT_DCS_CMD(0x2A, 0x11),
-	_INIT_DCS_CMD(0x2B, 0x7B),
+	_INIT_DCS_CMD(0x2A, 0x0D),
+	_INIT_DCS_CMD(0x2B, 0x7F),
 
 	_INIT_DCS_CMD(0x1D, 0x00),
-	_INIT_DCS_CMD(0x1E, 0xC3),
-	_INIT_DCS_CMD(0x1F, 0xC3),
+	_INIT_DCS_CMD(0x1E, 0x65),
+	_INIT_DCS_CMD(0x1F, 0x65),
 	_INIT_DCS_CMD(0x24, 0x00),
-	_INIT_DCS_CMD(0x25, 0xC3),
+	_INIT_DCS_CMD(0x25, 0x65),
 	_INIT_DCS_CMD(0x2F, 0x05),
-	_INIT_DCS_CMD(0x30, 0xC3),
-	_INIT_DCS_CMD(0x31, 0x00),
-	_INIT_DCS_CMD(0x32, 0xC3),
+	_INIT_DCS_CMD(0x30, 0x65),
+	_INIT_DCS_CMD(0x31, 0x05),
+	_INIT_DCS_CMD(0x32, 0x7D),
 	_INIT_DCS_CMD(0x39, 0x00),
-	_INIT_DCS_CMD(0x3A, 0xC3),
-
+	_INIT_DCS_CMD(0x3A, 0x65),
 	_INIT_DCS_CMD(0x20, 0x01),
-
 	_INIT_DCS_CMD(0x33, 0x11),
 	_INIT_DCS_CMD(0x34, 0x78),
 	_INIT_DCS_CMD(0x35, 0x16),
-
 	_INIT_DCS_CMD(0xC8, 0x04),
-	_INIT_DCS_CMD(0xC9, 0x82),
+	_INIT_DCS_CMD(0xC9, 0x80),
 	_INIT_DCS_CMD(0xCA, 0x4E),
 	_INIT_DCS_CMD(0xCB, 0x00),
 	_INIT_DCS_CMD(0xA9, 0x4C),
 	_INIT_DCS_CMD(0xAA, 0x47),
+
 	_INIT_DCS_CMD(0xFF, 0x27),
 	_INIT_DCS_CMD(0xFB, 0x01),
-	_INIT_DCS_CMD(0x56, 0x06),
 
+	_INIT_DCS_CMD(0x56, 0x06),
 	_INIT_DCS_CMD(0x58, 0x80),
-	_INIT_DCS_CMD(0x59, 0x53),
+	_INIT_DCS_CMD(0x59, 0x75),
 	_INIT_DCS_CMD(0x5A, 0x00),
-	_INIT_DCS_CMD(0x5B, 0x14),
+	_INIT_DCS_CMD(0x5B, 0x02),
 	_INIT_DCS_CMD(0x5C, 0x00),
-	_INIT_DCS_CMD(0x5D, 0x01),
+	_INIT_DCS_CMD(0x5D, 0x00),
 	_INIT_DCS_CMD(0x5E, 0x20),
 	_INIT_DCS_CMD(0x5F, 0x10),
 	_INIT_DCS_CMD(0x60, 0x00),
-	_INIT_DCS_CMD(0x61, 0x1D),
+	_INIT_DCS_CMD(0x61, 0x2E),
 	_INIT_DCS_CMD(0x62, 0x00),
 	_INIT_DCS_CMD(0x63, 0x01),
-	_INIT_DCS_CMD(0x64, 0x24),
-	_INIT_DCS_CMD(0x65, 0x1C),
+	_INIT_DCS_CMD(0x64, 0x43),
+	_INIT_DCS_CMD(0x65, 0x2D),
 	_INIT_DCS_CMD(0x66, 0x00),
 	_INIT_DCS_CMD(0x67, 0x01),
-	_INIT_DCS_CMD(0x68, 0x25),
+	_INIT_DCS_CMD(0x68, 0x44),
 
 	_INIT_DCS_CMD(0x00, 0x00),
 	_INIT_DCS_CMD(0x78, 0x00),
 	_INIT_DCS_CMD(0xC3, 0x00),
 
-	_INIT_DCS_CMD(0xD1, 0x24),
-	_INIT_DCS_CMD(0xD2, 0x30),
-
 	_INIT_DCS_CMD(0xFF, 0x2A),
 	_INIT_DCS_CMD(0xFB, 0x01),
 
@@ -403,7 +372,7 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0x23, 0x08),
 
 	_INIT_DCS_CMD(0x24, 0x00),
-	_INIT_DCS_CMD(0x25, 0xC3),
+	_INIT_DCS_CMD(0x25, 0x65),
 	_INIT_DCS_CMD(0x26, 0xF8),
 	_INIT_DCS_CMD(0x27, 0x00),
 	_INIT_DCS_CMD(0x28, 0x1A),
@@ -416,105 +385,34 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 	_INIT_DCS_CMD(0xFB, 0x01),
 
 	_INIT_DCS_CMD(0x00, 0x80),
-
 	_INIT_DCS_CMD(0x07, 0x00),
 
-	_INIT_DCS_CMD(0xFF, 0x24),
-	_INIT_DCS_CMD(0xFB, 0x01),
-
-	_INIT_DCS_CMD(0x3A, 0x5D),
-	_INIT_DCS_CMD(0x3B, 0x60),
-
-	_INIT_DCS_CMD(0x4A, 0x5D),
-	_INIT_DCS_CMD(0x4B, 0x60),
-
-	_INIT_DCS_CMD(0x5A, 0x70),
-	_INIT_DCS_CMD(0x5B, 0x60),
-
-	_INIT_DCS_CMD(0x91, 0x44),
-	_INIT_DCS_CMD(0x92, 0x75),
-
-	_INIT_DCS_CMD(0xDB, 0x05),
-	_INIT_DCS_CMD(0xDC, 0x75),
-	_INIT_DCS_CMD(0xDD, 0x22),
-
-	_INIT_DCS_CMD(0xDF, 0x05),
-	_INIT_DCS_CMD(0xE0, 0x75),
-
-	_INIT_DCS_CMD(0xE1, 0x05),
-	_INIT_DCS_CMD(0xE2, 0x75),
-
-	_INIT_DCS_CMD(0xE3, 0x05),
-	_INIT_DCS_CMD(0xE4, 0x75),
-
-	_INIT_DCS_CMD(0xE5, 0x05),
-	_INIT_DCS_CMD(0xE6, 0x75),
-
-	_INIT_DCS_CMD(0x5C, 0x00),
-	_INIT_DCS_CMD(0x5D, 0x00),
-
-	_INIT_DCS_CMD(0x8D, 0x00),
-	_INIT_DCS_CMD(0x8E, 0x00),
-
-	_INIT_DCS_CMD(0xFF, 0x25),
-	_INIT_DCS_CMD(0xFB, 0x01),
-
-	_INIT_DCS_CMD(0x1F, 0x70),
-	_INIT_DCS_CMD(0x20, 0x60),
-
-	_INIT_DCS_CMD(0x26, 0x70),
-	_INIT_DCS_CMD(0x27, 0x60),
-	_INIT_DCS_CMD(0x33, 0x70),
-	_INIT_DCS_CMD(0x34, 0x60),
-	_INIT_DCS_CMD(0x48, 0x70),
-	_INIT_DCS_CMD(0x49, 0x60),
-	_INIT_DCS_CMD(0x5B, 0x00),
-	_INIT_DCS_CMD(0x61, 0x70),
-	_INIT_DCS_CMD(0x62, 0x60),
-	_INIT_DCS_CMD(0xFF, 0x26),
-	_INIT_DCS_CMD(0xFB, 0x01),
-	_INIT_DCS_CMD(0x02, 0x31),
-	_INIT_DCS_CMD(0x19, 0x0A),
-	_INIT_DCS_CMD(0x1A, 0x7F),
-	_INIT_DCS_CMD(0x1B, 0x0A),
-	_INIT_DCS_CMD(0x1C, 0x0C),
-	_INIT_DCS_CMD(0x2A, 0x0A),
-	_INIT_DCS_CMD(0x2B, 0x7F),
-	_INIT_DCS_CMD(0x1E, 0x75),
-	_INIT_DCS_CMD(0x1F, 0x75),
-	_INIT_DCS_CMD(0x25, 0x75),
-	_INIT_DCS_CMD(0x30, 0x75),
-	_INIT_DCS_CMD(0x31, 0x05),
-	_INIT_DCS_CMD(0x32, 0x8D),
-	_INIT_DCS_CMD(0x3A, 0x75),
-	_INIT_DCS_CMD(0xFF, 0x2A),
-	_INIT_DCS_CMD(0xFB, 0x01),
-	_INIT_DCS_CMD(0x25, 0x75),
 	_INIT_DCS_CMD(0xFF, 0xE0),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x14, 0x60),
 	_INIT_DCS_CMD(0x16, 0xC0),
+
 	_INIT_DCS_CMD(0xFF, 0xF0),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x3A, 0x08),
+
 	_INIT_DCS_CMD(0xFF, 0x10),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0xB9, 0x01),
 	_INIT_DCS_CMD(0xFF, 0x20),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x18, 0x40),
-	_INIT_DCS_CMD(0xFF, 0x24),
-	_INIT_DCS_CMD(0xC2, 0x06),
+
 	_INIT_DCS_CMD(0xFF, 0x10),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0xB9, 0x02),
-	_INIT_DCS_CMD(0x3B, 0x03, 0x5F, 0x1A, 0x04, 0x04),
 	_INIT_DCS_CMD(0x35, 0x00),
 	_INIT_DCS_CMD(0x51, 0x00, 0xFF),
 	_INIT_DCS_CMD(0x53, 0x24),
 	_INIT_DCS_CMD(0x55, 0x00),
 	_INIT_DCS_CMD(0xBB, 0x13),
-
+	_INIT_DCS_CMD(0x3B, 0x03, 0x96, 0x1A, 0x04, 0x04),
+	_INIT_DELAY_CMD(100),
 	_INIT_DCS_CMD(0x11),
 	_INIT_DELAY_CMD(200),
 	_INIT_DCS_CMD(0x29),
@@ -523,12 +421,7 @@ static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
 };
 
 static const struct panel_init_cmd inx_init_cmd[] = {
-
-	_INIT_DCS_CMD(0xFF, 0x26),
-	_INIT_DCS_CMD(0xA7, 0x03),
-
 	_INIT_DCS_CMD(0xFF, 0x20),
-	_INIT_DELAY_CMD(100),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x05, 0xD1),
 	_INIT_DCS_CMD(0x0D, 0x63),
@@ -536,37 +429,26 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x08, 0x4B),
 	_INIT_DCS_CMD(0x0E, 0x91),
 	_INIT_DCS_CMD(0x0F, 0x69),
-
-	_INIT_DCS_CMD(0x95, 0xF5),
-	_INIT_DCS_CMD(0x96, 0xF5),
-
-	_INIT_DCS_CMD(0x9D, 0x14),
-	_INIT_DCS_CMD(0x9E, 0x14),
-	_INIT_DCS_CMD(0x6D, 0x33),
+	_INIT_DCS_CMD(0x95, 0xFF),
+	_INIT_DCS_CMD(0x96, 0xFF),
+	_INIT_DCS_CMD(0x9D, 0x0A),
+	_INIT_DCS_CMD(0x9E, 0x0A),
 	_INIT_DCS_CMD(0x69, 0x98),
 	_INIT_DCS_CMD(0x75, 0xA2),
 	_INIT_DCS_CMD(0x77, 0xB3),
-
 	_INIT_DCS_CMD(0xFF, 0x24),
-	_INIT_DELAY_CMD(100),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x91, 0x44),
-
 	_INIT_DCS_CMD(0x92, 0x7A),
-
 	_INIT_DCS_CMD(0x93, 0x1A),
-
 	_INIT_DCS_CMD(0x94, 0x40),
 	_INIT_DCS_CMD(0x9A, 0x08),
 	_INIT_DCS_CMD(0x60, 0x96),
 	_INIT_DCS_CMD(0x61, 0xD0),
 	_INIT_DCS_CMD(0x63, 0x70),
-	_INIT_DCS_CMD(0xC2, 0xC6),
+	_INIT_DCS_CMD(0xC2, 0xCF),
 	_INIT_DCS_CMD(0x9B, 0x0F),
 	_INIT_DCS_CMD(0x9A, 0x08),
-	_INIT_DCS_CMD(0xA5, 0x00),
-	_INIT_DCS_CMD(0xA6, 0x41),
-
 	_INIT_DCS_CMD(0x00, 0x03),
 	_INIT_DCS_CMD(0x01, 0x03),
 	_INIT_DCS_CMD(0x02, 0x03),
@@ -654,11 +536,7 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x81, 0x00),
 	_INIT_DCS_CMD(0x82, 0x08),
 	_INIT_DCS_CMD(0x97, 0x02),
-
 	_INIT_DCS_CMD(0xC5, 0x10),
-	_INIT_DCS_CMD(0xD7, 0x55),
-	_INIT_DCS_CMD(0xD8, 0x55),
-	_INIT_DCS_CMD(0xD9, 0x23),
 	_INIT_DCS_CMD(0xDA, 0x05),
 	_INIT_DCS_CMD(0xDB, 0x01),
 	_INIT_DCS_CMD(0xDC, 0x7A),
@@ -703,20 +581,13 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 
 	_INIT_DCS_CMD(0x48, 0x09),
 	_INIT_DCS_CMD(0x49, 0x46),
-
 	_INIT_DCS_CMD(0x5B, 0x80),
-
 	_INIT_DCS_CMD(0x5C, 0x00),
 	_INIT_DCS_CMD(0x5D, 0x01),
 	_INIT_DCS_CMD(0x5E, 0x46),
-
 	_INIT_DCS_CMD(0x61, 0x01),
 	_INIT_DCS_CMD(0x62, 0x46),
 	_INIT_DCS_CMD(0x68, 0x10),
-
-	_INIT_DCS_CMD(0x13, 0x02),
-	_INIT_DCS_CMD(0x14, 0xF2),
-
 	_INIT_DCS_CMD(0xFF, 0x26),
 	_INIT_DCS_CMD(0xFB, 0x01),
 
@@ -724,28 +595,26 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x02, 0x31),
 	_INIT_DCS_CMD(0x0A, 0xF2),
 	_INIT_DCS_CMD(0x04, 0x28),
-	_INIT_DCS_CMD(0x06, 0x20),
-	_INIT_DCS_CMD(0x0C, 0x13),
-	_INIT_DCS_CMD(0x0D, 0x0A),
-	_INIT_DCS_CMD(0x0F, 0x0A),
+	_INIT_DCS_CMD(0x06, 0x30),
+	_INIT_DCS_CMD(0x0C, 0x16),
+	_INIT_DCS_CMD(0x0D, 0x0D),
+	_INIT_DCS_CMD(0x0F, 0x00),
 	_INIT_DCS_CMD(0x11, 0x00),
 	_INIT_DCS_CMD(0x12, 0x50),
-	_INIT_DCS_CMD(0x13, 0x51),
-	_INIT_DCS_CMD(0x14, 0x65),
+	_INIT_DCS_CMD(0x13, 0x56),
+	_INIT_DCS_CMD(0x14, 0x57),
 	_INIT_DCS_CMD(0x15, 0x00),
 	_INIT_DCS_CMD(0x16, 0x10),
 	_INIT_DCS_CMD(0x17, 0xA0),
 	_INIT_DCS_CMD(0x18, 0x86),
 	_INIT_DCS_CMD(0x22, 0x00),
 	_INIT_DCS_CMD(0x23, 0x00),
-
-	_INIT_DCS_CMD(0x19, 0x30),
-	_INIT_DCS_CMD(0x1A, 0x00),
-	_INIT_DCS_CMD(0x1B, 0x09),
-	_INIT_DCS_CMD(0x1C, 0xC0),
-	_INIT_DCS_CMD(0x2A, 0x30),
-	_INIT_DCS_CMD(0x2B, 0x00),
-
+	_INIT_DCS_CMD(0x19, 0x0D),
+	_INIT_DCS_CMD(0x1A, 0x7F),
+	_INIT_DCS_CMD(0x1B, 0x0C),
+	_INIT_DCS_CMD(0x1C, 0xBF),
+	_INIT_DCS_CMD(0x2A, 0x0D),
+	_INIT_DCS_CMD(0x2B, 0x7F),
 	_INIT_DCS_CMD(0x20, 0x00),
 
 	_INIT_DCS_CMD(0x1D, 0x00),
@@ -773,32 +642,29 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0xAC, 0x4A),
 	_INIT_DCS_CMD(0xAD, 0x48),
 	_INIT_DCS_CMD(0xAE, 0x46),
-
 	_INIT_DCS_CMD(0xFF, 0x27),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0xC0, 0x18),
 	_INIT_DCS_CMD(0xC1, 0x00),
 	_INIT_DCS_CMD(0xC2, 0x00),
-
 	_INIT_DCS_CMD(0x56, 0x06),
 	_INIT_DCS_CMD(0x58, 0x80),
-	_INIT_DCS_CMD(0x59, 0x53),
+	_INIT_DCS_CMD(0x59, 0x75),
 	_INIT_DCS_CMD(0x5A, 0x00),
-	_INIT_DCS_CMD(0x5B, 0x14),
+	_INIT_DCS_CMD(0x5B, 0x02),
 	_INIT_DCS_CMD(0x5C, 0x00),
 	_INIT_DCS_CMD(0x5D, 0x00),
 	_INIT_DCS_CMD(0x5E, 0x20),
 	_INIT_DCS_CMD(0x5F, 0x10),
 	_INIT_DCS_CMD(0x60, 0x00),
-	_INIT_DCS_CMD(0x61, 0x1C),
+	_INIT_DCS_CMD(0x61, 0x2E),
 	_INIT_DCS_CMD(0x62, 0x00),
 	_INIT_DCS_CMD(0x63, 0x01),
-	_INIT_DCS_CMD(0x64, 0x24),
-	_INIT_DCS_CMD(0x65, 0x1B),
+	_INIT_DCS_CMD(0x64, 0x43),
+	_INIT_DCS_CMD(0x65, 0x2D),
 	_INIT_DCS_CMD(0x66, 0x00),
 	_INIT_DCS_CMD(0x67, 0x01),
-	_INIT_DCS_CMD(0x68, 0x25),
-
+	_INIT_DCS_CMD(0x68, 0x43),
 	_INIT_DCS_CMD(0x98, 0x01),
 	_INIT_DCS_CMD(0xB4, 0x03),
 	_INIT_DCS_CMD(0x9B, 0xBD),
@@ -814,7 +680,7 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x23, 0x08),
 
 	_INIT_DCS_CMD(0x24, 0x00),
-	_INIT_DCS_CMD(0x25, 0x79),
+	_INIT_DCS_CMD(0x25, 0x65),
 	_INIT_DCS_CMD(0x26, 0xF8),
 	_INIT_DCS_CMD(0x27, 0x00),
 	_INIT_DCS_CMD(0x28, 0x1A),
@@ -832,89 +698,42 @@ static const struct panel_init_cmd inx_init_cmd[] = {
 	_INIT_DCS_CMD(0x70, 0x92),
 	_INIT_DCS_CMD(0x71, 0x00),
 	_INIT_DCS_CMD(0x72, 0x00),
-
 	_INIT_DCS_CMD(0xA2, 0x33),
 	_INIT_DCS_CMD(0xA3, 0x30),
 	_INIT_DCS_CMD(0xA4, 0xC0),
-
 	_INIT_DCS_CMD(0xE8, 0x00),
-
-	_INIT_DCS_CMD(0x97, 0x3C),
-	_INIT_DCS_CMD(0x98, 0x02),
-	_INIT_DCS_CMD(0x99, 0x95),
-	_INIT_DCS_CMD(0x9A, 0x06),
-	_INIT_DCS_CMD(0x9B, 0x00),
-	_INIT_DCS_CMD(0x9C, 0x0B),
-	_INIT_DCS_CMD(0x9D, 0x0A),
-	_INIT_DCS_CMD(0x9E, 0x90),
-
-	_INIT_DCS_CMD(0xFF, 0x27),
-	_INIT_DCS_CMD(0xFB, 0x01),
-	_INIT_DCS_CMD(0xD0, 0x13),
-	_INIT_DCS_CMD(0xD1, 0x54),
-	_INIT_DCS_CMD(0xD2, 0x30),
-	_INIT_DCS_CMD(0xDE, 0x43),
-	_INIT_DCS_CMD(0xDF, 0x02),
-
 	_INIT_DCS_CMD(0xFF, 0xF0),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x3A, 0x08),
-
 	_INIT_DCS_CMD(0xFF, 0xD0),
 	_INIT_DCS_CMD(0xFB, 0x01),
+	_INIT_DCS_CMD(0x00, 0x33),
 	_INIT_DCS_CMD(0x02, 0x77),
+	_INIT_DCS_CMD(0x08, 0x01),
 	_INIT_DCS_CMD(0x09, 0xBF),
-	_INIT_DCS_CMD(0x00, 0x22),
-	_INIT_DCS_CMD(0x2F, 0x22),
-
+	_INIT_DCS_CMD(0x28, 0x30),
+	_INIT_DCS_CMD(0x2F, 0x33),
 	_INIT_DCS_CMD(0xFF, 0x23),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x00, 0x80),
 	_INIT_DCS_CMD(0x07, 0x00),
-
 	_INIT_DCS_CMD(0xFF, 0x20),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0x30, 0x00),
-
-	_INIT_DCS_CMD(0xFF, 0x25),
-	_INIT_DCS_CMD(0xFB, 0x01),
-	_INIT_DCS_CMD(0x17, 0xCF),
-	_INIT_DCS_CMD(0x19, 0x1F),
-	_INIT_DCS_CMD(0x1B, 0x5B),
-	_INIT_DCS_CMD(0x1D, 0x00),
-
-	_INIT_DCS_CMD(0xFF, 0x10),
-	_INIT_DCS_CMD(0xB0, 0x01),
-
 	_INIT_DCS_CMD(0xFF, 0x10),
-	_INIT_DELAY_CMD(10),
 	_INIT_DCS_CMD(0xB9, 0x01),
-
 	_INIT_DCS_CMD(0xFF, 0x20),
-	_INIT_DELAY_CMD(10),
 	_INIT_DCS_CMD(0x18, 0x40),
-
 	_INIT_DCS_CMD(0xFF, 0x10),
-	_INIT_DELAY_CMD(10),
 	_INIT_DCS_CMD(0xB9, 0x02),
-
 	_INIT_DCS_CMD(0xFF, 0x10),
-	_INIT_DELAY_CMD(100),
 	_INIT_DCS_CMD(0xFB, 0x01),
 	_INIT_DCS_CMD(0xBB, 0x13),
-
-	_INIT_DCS_CMD(0x3B, 0x03, 0x5F, 0x1A, 0x04, 0x04),
+	_INIT_DCS_CMD(0x3B, 0x03, 0x96, 0x1A, 0x04, 0x04),
 	_INIT_DCS_CMD(0x35, 0x00),
-
-	_INIT_DCS_CMD(0xFF, 0x24),
-	_INIT_DCS_CMD(0xC2, 0x06),
-
-	_INIT_DCS_CMD(0xFF, 0x10),
-	_INIT_DCS_CMD(0xFB, 0x01),
-	_INIT_DCS_CMD(0x51, 0x00, 0xFF),
+	_INIT_DCS_CMD(0x51, 0x0F, 0xFF),
 	_INIT_DCS_CMD(0x53, 0x24),
-	_INIT_DCS_CMD(0x55, 0x00),
-
+	_INIT_DELAY_CMD(100),
 	_INIT_DCS_CMD(0x11),
 	_INIT_DELAY_CMD(200),
 	_INIT_DCS_CMD(0x29),
@@ -1323,8 +1142,7 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
 	struct mipi_dsi_device *dsi = boe->dsi;
 	int ret;
 
-	if (!boe->desc->unsupport_dsi_hs_mode)
-		dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
@@ -1442,15 +1260,15 @@ static int boe_panel_enable(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode boe_tv110c9m_default_mode = {
-	.clock = 162383,
+	.clock = 166594,
 	.hdisplay = 1200,
 	.hsync_start = 1200 + 40,
 	.hsync_end = 1200 + 40 + 8,
 	.htotal = 1200 + 40 + 8 + 28,
 	.vdisplay = 2000,
 	.vsync_start = 2000 + 26,
-	.vsync_end = 2000 + 26 + 1,
-	.vtotal = 2000 + 26 + 1 + 94,
+	.vsync_end = 2000 + 26 + 2,
+	.vtotal = 2000 + 26 + 2 + 148,
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
@@ -1463,14 +1281,15 @@ static const struct panel_desc boe_tv110c9m_desc = {
 	},
 	.lanes = 4,
 	.format = MIPI_DSI_FMT_RGB888,
-	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-		      MIPI_DSI_MODE_LPM,
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO
+			| MIPI_DSI_MODE_VIDEO_HSE
+			| MIPI_DSI_CLOCK_NON_CONTINUOUS
+			| MIPI_DSI_MODE_VIDEO_BURST,
 	.init_cmds = boe_tv110c9m_init_cmd,
-	.unsupport_dsi_hs_mode = true,
 };
 
 static const struct drm_display_mode inx_hj110iz_default_mode = {
-	.clock = 162383,
+	.clock = 166594,
 	.hdisplay = 1200,
 	.hsync_start = 1200 + 40,
 	.hsync_end = 1200 + 40 + 8,
@@ -1478,7 +1297,7 @@ static const struct drm_display_mode inx_hj110iz_default_mode = {
 	.vdisplay = 2000,
 	.vsync_start = 2000 + 26,
 	.vsync_end = 2000 + 26 + 1,
-	.vtotal = 2000 + 26 + 1 + 94,
+	.vtotal = 2000 + 26 + 1 + 149,
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
@@ -1491,8 +1310,10 @@ static const struct panel_desc inx_hj110iz_desc = {
 	},
 	.lanes = 4,
 	.format = MIPI_DSI_FMT_RGB888,
-	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-		      MIPI_DSI_MODE_LPM,
+	.mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO
+			| MIPI_DSI_MODE_VIDEO_HSE
+			| MIPI_DSI_CLOCK_NON_CONTINUOUS
+			| MIPI_DSI_MODE_VIDEO_BURST,
 	.init_cmds = inx_init_cmd,
 };
 
-- 
2.25.1

