Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3293C125
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 13:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115410E1A5;
	Thu, 25 Jul 2024 11:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="lw7dhKD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB4810E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 11:53:05 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fec34f94abso6915365ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721908385; x=1722513185; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Da9MD3yGrxppGawk4m4OKKJj1T6AyG9yHhHZjp6mLsk=;
 b=lw7dhKD28cJ2D4/dSLDUFPFlsW5TwJaXPCjU4JANUkbMDMoVqRSQ7OlGWg45EiEqoe
 SRjPToKOwJFUPtlJ/Op+xwpKuEioBD/L9IA8Dyf+UfeGlalcc/hLgmxcJdORYzKIUANQ
 uHURK12lVgCr4fvOk/s8nqB/ksMp1YUjNOoGfI21X/iZg1I5vfmtU3b0djCabliwkVRI
 d4kd6Wz4bCKZ/jzdyRp+Kx0+vTANrrsw31w/0/TfWNPNzAj4I7m5WMAuXBWHDuomxlLw
 9D6HJ7HPQCpO53PEGudFoVPIVgjLZrMEPOOGjmBNYcM+QBPtuHAO133ss9KSz7Ipf2OL
 /FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721908385; x=1722513185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Da9MD3yGrxppGawk4m4OKKJj1T6AyG9yHhHZjp6mLsk=;
 b=u/MPZgQGfzHHdz2EOKOm1K1Q2AZIds9k5jQ8z7XtHPfNr+24nO8S5EFQT5Flo4gmk2
 VRkuSe5AOG+Mf+NjvPACB/AFFs9HKgmLGlJV55gQ0ZxdJJtsVfpUI/T9JG8ubVYWa5kC
 wH3PGEaZWU0zZjJiz199p1ohoEFpq9HLKOrRAoI29Zfec1R6jdc3ireF+scvySKXUqQA
 6ztOen5rNVzmfN72x5DIzLvlHV0kzu1xtNm4uw65PK1mVQLJfT8HsDP4n4a15obVL/Rf
 2jRZMU1JxKq0MfDV2Tw4yexeNcjJ5U0WqN9wNa1k9md/BphdPTcJvLkCYYzD6oL+zKb1
 rw1A==
X-Gm-Message-State: AOJu0Yx1Ru5dHv5OBTFfvh+9/oGulqAoJNPs+0rt6WMqMUAShmqKAECw
 ES1tlXs6k+xUp4qb/A4OTMY9pp3h1RSXqBxYMTw+hYtG3e3wykN5f9OAxWXGbxw=
X-Google-Smtp-Source: AGHT+IFIYgitRVGazUR81RmstH/QOKj9UwOXu5EeZn/74vAZhpeAwGZaQ6Tn8uFAPEX0Z6o9khmv7A==
X-Received: by 2002:a17:902:f681:b0:1fd:6766:6848 with SMTP id
 d9443c01a7336-1fed9202ec2mr17180365ad.17.1721908384898; 
 Thu, 25 Jul 2024 04:53:04 -0700 (PDT)
Received: from zhk-CBG100025892.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f3efdcsm12322795ad.217.2024.07.25.04.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 04:53:04 -0700 (PDT)
From: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add CSW MNB601LS1-4
Date: Thu, 25 Jul 2024 19:52:29 +0800
Message-Id: <20240725115229.3416028-1-zhouhaikun5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the CSW MNB601LS1-4, pleace the EDID here for
subsequent reference.
00 ff ff ff ff ff ff 00 0e 77 04 11 00 00 00 00
00 22 01 04 a5 1a 0e 78 03 a1 35 9b 5e 58 91 25
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30
30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 42 36 30 31 4c 53 31 2d 34 0a 20 00 20

Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9cfa05c7d193..2ef9a96f5527 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2079,6 +2079,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "Unknown"),
-- 
2.34.1

