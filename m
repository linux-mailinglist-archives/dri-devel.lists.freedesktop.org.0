Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D852B4781B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DD110E40D;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="3Lnb4reg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E0710E4E2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 08:27:15 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-77238cb3cbbso3737951b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 01:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1756888035; x=1757492835; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d7MyvbuehqyHPFoj0yXmMeImr3j7gjRiUhu3hTPI4Oc=;
 b=3Lnb4reg3DdpjNCy3df7/piHQTli9a+bfVB1tXd5XGvo7n8WeDEBU6srjYbrfK5Dzn
 +5cGDMDf8rVwyb4Wi3Do4KXkQgvKYZiF2N+HatY6FskIEQZEnnGIQr6x74b6esNFqhCF
 PH45n9LEMbwDqL2AR9RyMlxQdEFSjF+xszUkMrQscHsKZFUZfIXvXgj+OeuSPfLAlwyM
 flWIDkLDAe6Q5nH8MD9UjBO2MxJRTslHvazmn30rg3fB/U6zvcLktI0Y//oLbTiyXkn6
 8xiqVeEmvVAI+3u44g/Bb57shC16YQRyt2zZ5eWPIbteH4MO4Tz0hu1wolN68cRzzTDE
 clCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756888035; x=1757492835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d7MyvbuehqyHPFoj0yXmMeImr3j7gjRiUhu3hTPI4Oc=;
 b=nptQKFBLmaTuojWANqYJqWGXfWrHyISnhcq+wg7PlruQeE8CrOM/y2cm1YiIfw3P7M
 V4PFfOVUtGYlwhqxxo3UM99IG9r6N/Icc5dHCRLpDbLshchbsODgXlCgI3kt/OTG7vEE
 PpkbS5S6DilxlpMH1NlpWsFpYjc3lUNApMF3cfspdMlsQRvr63ksW5oPVGryh26k1T8v
 aeaNWhsj+++DxoNQ6lymUY5GShrwW199++1U9jdjelr0CfYc/z4lbWxvgOR50IVANZcO
 Hd5tExRfdiaFXSRT57yHOgDcw0NmKAi2zSavgR9Ys60a8+amaMSNljvTbWuefU1uxTv5
 0w+w==
X-Gm-Message-State: AOJu0YwaW8XNE5d4vecoVqtW9Ca71BUXHNWxTklPGd/6Yj5IX4UYJKnq
 oAngzGlNUEuEUvEIIWV0bQCPusjK4FyLAuLC2exUmPIn38AKaNB/6fiJLy+qwqYQ5tw=
X-Gm-Gg: ASbGnctdpo/gJhlevXrCKCq3AaHbZ4BfjN2+2fde2emy4MDoJ4J0Aqcpe2U2PJ3YT6x
 g+HKK/y/OWLajF04GXuPOrXYzid7Lob23Knv6ZH0vXsI5rneV6UMe/8X2rSzu5FaxKAGa4KjGkd
 mR9vxC2o1oi8dOqoVIAGSBZw7Yu18jHF0h3Z0zWtpdYit1jmdPCD6WObAbcjtTMyousTstdGa/Z
 FY/1JoG4jx3oFMpJPy0dWsa1jQ4DPz2sjB7G22VC0XtFZTfgOS5FMl1zrn2ojB0R5R35MqrxG+W
 BbRUHvIzRpnahIVcOgTJFk8t554KLgOGu73o5eiICupH9BYjYvvecHHs1IlDoWIkOofRKA9Rp1b
 6I/kUorkUemGE0OcA9OuOrJI56ar07tk81nnM5z7mW0dV0ncFDxolN3MX19ZrY30zvYQSM98oTJ
 3cH1KuE8sI7QO6EN7RaCZds7TPfn0fxw==
X-Google-Smtp-Source: AGHT+IEXDI+4Cxdd9GZkPAFGxSlru8Um1RtkCHB3w0+OjUmK7c2c9iaH92pRYEXqsS+1c1bSrjjkJA==
X-Received: by 2002:a05:6a00:1495:b0:770:56bf:ab5a with SMTP id
 d2e1a72fcca58-7723e36b526mr15626694b3a.19.1756888035099; 
 Wed, 03 Sep 2025 01:27:15 -0700 (PDT)
Received: from ubuntu.. (202.60.225.076.static.cyberec.com. [202.60.225.76])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b7d10sm16014435b3a.33.2025.09.03.01.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 01:27:14 -0700 (PDT)
From: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add edp panels used by mt8189 chromebooks
Date: Wed,  3 Sep 2025 16:26:28 +0800
Message-Id: <20250903082628.2847842-1-wuzhongtian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

Add a few generic edp panels used by mt8189 chromebooks. For
BOE-NV140WUM-N44 V8.2 , the enable timing required 80ms. For
CSW-MNE007QB3-1, the hpd_absent timing rquired 80,the enable timing
required 50ms.For CSW-MNE007QS3-6, the enable timing required 50ms. For
CMN-N140JCA-ELK, the enable timing required 80ms and disable timing
required 50ms.

BOE NV140WUM-N44 V8.2
edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 6a 0a 00 00 00 00
2e 20 01 04 a5 1e 13 78 03 fb f5 96 5d 5a 91 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 61 40 80 04 71 b0 3c 40 30 20
36 00 2d bc 10 00 00 1a 81 33 80 04 71 b0 3c 40
30 20 36 00 2d bc 10 00 00 1a 00 00 00 fd 00 28
3c 4c 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 57 55 4d 2d 4e 34 34 0a 01 7c

02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06

CSW MNE007QB3-1:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 6e 14 00 00 00 00
00 23 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
36 00 2d bc 10 00 00 18 2b 30 80 a0 70 b0 23 40
30 20 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28
3c 4a 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 42 33 2d 31 0a 20 01 69

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
00 3d 8a 54 cd a4 99 66 62 0f 02 45 54 40 5e 40
5e 00 44 12 78 2e 00 06 00 44 40 5e 40 5e 81 00
20 74 1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c
00 00 00 00 8d 00 e3 05 04 00 e6 06 01 00 60 60
ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 68 90

CSW MNE007QS3-6:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 3f 14 00 00 00 00
00 22 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
36 00 2e bd 10 00 00 1a 88 31 80 c8 70 b0 2e 40
30 20 36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28
3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 53 33 2d 36 0a 20 01 80

70 20 79 02 00 81 00 14 74 1a 00 00 03 01 28 3c
00 00 00 00 00 00 3c 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e 90

CMN N140JCA-ELK:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0d ae 41 14 00 00 00 00
25 21 01 04 a5 1e 13 78 03 28 65 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
a6 00 2d bc 10 00 00 18 35 30 80 a0 70 b0 24 40
30 20 a6 00 2d bc 10 00 00 18 00 00 00 fd 00 28
3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 31 34 30 4a 43 41 2d 45 4c 4b 0a 20 01 14

02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06

Signed-off-by: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9a56e208cbdd..bd7243bdccbb 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1949,6 +1949,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a6a, &delay_200_500_e80, "NV140WUM-N44 V8.2"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
@@ -1978,6 +1979,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N160JCE-ELL"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1441, &delay_200_500_e80_d50, "N140JCA-ELK"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_p2e200, "MNE007JA1-2"),
@@ -1987,6 +1989,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50, "MNE007QB3-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x143f, &delay_200_500_e50, "MNE007QS3-6"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.34.1

