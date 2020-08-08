Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05623F95B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 00:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDA56E2AF;
	Sat,  8 Aug 2020 22:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A116E2AF
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 22:43:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v9so5833843ljk.6
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyRYAAosTPHfICqU6xbVT2RtBtStioZtMcci7LezLaQ=;
 b=fDZiOjqSQCMwezd46e74wpZAsXsgK5wMUVUSE+N6rZ1YNhljEL1vnZOTNIX3b87hcF
 fGNNvBKn+H/ccvWoIEVoQGTYrfYY8TrSi9KxMBNOGOgQOxaIw1bicvcn6xtvXJOcczNg
 zK3bBZSxL2p1bFhoW3f3dkmdMPiGmDJcOn4ld+/zi5smHmKy4+GRWNFY5sQauSSZxvfA
 yp+c3CV6doPaI7jMVb3VU02zRQNrl6iA+jgOXcOaNF8444S15fNXhXAhvbLKxqwOTelt
 d9ijHsRoBd+zmyipSCW1dEQX1oOMaXrARFSpzVXdLeFscHUcUqmUDHD9dm33+Y3wVvk4
 YNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyRYAAosTPHfICqU6xbVT2RtBtStioZtMcci7LezLaQ=;
 b=atYaESCw9pM4GbZRzeQw4zfLy2nvRYSdLy7ntVWWOznA6hQj1pTHSYxa+djXUUkenT
 EoHXw+8oc3ybQNnf8ebgMUuQL8uoiny5mDGdBsGX/r9zTEXMs6zC+gP0FuKnzeTuyFuT
 FfsXyS/AWC0jsjt3U2cdCZo1m4ZeaDtVIOvSCOxQxJHKcGXzygDNHgN1orLwDUWySkXi
 pMBAOVmnrEfZsIDJYfodkDWjg81wx8UGf1ucS+s95C7F3FImhDmJ1Jdnsyf7YN3NghqU
 8vwUAy+Y07NH8YFqzPszJLeOq72TJuFXWkZnF9uPrwoeoC87fScHczCU/vzKhlRBkBFm
 ayvA==
X-Gm-Message-State: AOAM532zmYPt8sjQuXs6lcdYXk8RmuqO5+GSRiL/XZU5CvABeGlOK8Iy
 CpLswAgwAHFD7hCgg1PTXAT0BA==
X-Google-Smtp-Source: ABdhPJyfDx1ZRBNempgrDaaP4+rcaMJXPi6/f+PBkZDfTCor/FHPYQ4bGvkvAQVrXwYZqiOtVdKH/g==
X-Received: by 2002:a2e:910b:: with SMTP id m11mr9199317ljg.159.1596926604429; 
 Sat, 08 Aug 2020 15:43:24 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 203sm6577878lfk.49.2020.08.08.15.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 15:43:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-notatek-nt35510: Fix MTP read init
Date: Sun,  9 Aug 2020 00:43:22 +0200
Message-Id: <20200808224322.1507713-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to successfully read ID of the MTP panel the
panel MTP control page must be unlocked. Previously
this wasn't encountered because in the setup with this
panel the power wasn't ever really dropped. When power
gets dropped from the panel, MTP needs to be unlocked.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 4a8fa908a2cf..d0cd2128df1d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -376,6 +376,10 @@ struct nt35510 {
 };
 
 /* Manufacturer command has strictly this byte sequence */
+static const u8 nt35510_mauc_mtp_read_param[] = { 0xAA, 0x55, 0x25, 0x01 };
+static const u8 nt35510_mauc_mtp_read_setting[] = { 0x01, 0x02, 0x00, 0x20,
+						    0x33, 0x13, 0x00, 0x40,
+						    0x00, 0x00, 0x23, 0x02 };
 static const u8 nt35510_mauc_select_page_0[] = { 0x55, 0xAA, 0x52, 0x08, 0x00 };
 static const u8 nt35510_mauc_select_page_1[] = { 0x55, 0xAA, 0x52, 0x08, 0x01 };
 static const u8 nt35510_vgh_on[] = { 0x01 };
@@ -698,6 +702,18 @@ static int nt35510_power_on(struct nt35510 *nt)
 		usleep_range(120000, 140000);
 	}
 
+	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_PARAM,
+				ARRAY_SIZE(nt35510_mauc_mtp_read_param),
+				nt35510_mauc_mtp_read_param);
+	if (ret)
+		return ret;
+
+	ret = nt35510_send_long(nt, dsi, MCS_CMD_MTP_READ_SETTING,
+				ARRAY_SIZE(nt35510_mauc_mtp_read_setting),
+				nt35510_mauc_mtp_read_setting);
+	if (ret)
+		return ret;
+
 	ret = nt35510_read_id(nt);
 	if (ret)
 		return ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
