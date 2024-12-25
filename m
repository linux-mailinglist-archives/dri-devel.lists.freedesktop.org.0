Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CF39FC33C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 03:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A4910E34A;
	Wed, 25 Dec 2024 02:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="1ykscqLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBC210E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 02:02:20 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-216728b1836so51454835ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 18:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1735092080; x=1735696880; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pzj5ySVsNUyrEzrsBzjWcUyTfRv5CV00k5gl4ogV7gU=;
 b=1ykscqLl9C2CNP8e1DSOp8uqK9y5Nu798n3aSvZ2Qd86TjWsyD9UAU/tBtjVaO/LYO
 3HkA/Bt5soIGyXmruRSFiDXpCkf8Hd9j2Enyg3zGifQnAsmtJXZR7cma4HT+01Ae09wA
 bir81daENvySI1twMN9+T0zXu06y2ovuZ66aAVxv1qLReJUzIaoKKmNVwGkhVHB6LJQz
 MJPaj5HUKRt6uFt9sAJ+qJ11J9C2JXrqYB3QZn/Fna1DoVbblEvrduoKQxQCHVse0hLW
 Q3eU8vrpwonT4FSNHQaMSRMwL3YFulDXrFrsWg9F06cx7JwvJ3Gyp9pv7BVCWV+bblpx
 +bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735092080; x=1735696880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pzj5ySVsNUyrEzrsBzjWcUyTfRv5CV00k5gl4ogV7gU=;
 b=C5Xj/kD9lBvKcr1O6czOtqk6wZu1zAaXsKYPYys9aaQ15OPfae5V5/C6fVFz6jLp3G
 SBCsO4wPZCicNuoSGflY2oIkUjH+eTDH1VS8t+s+PqeHVQgu7KqoPPpoHTLUEhNcnBBG
 ImSTuCJ5dP4juq5hYFqLlNzc6BMqGVT3LUk2Hxm8GXY2DahEnu2zvRqvTTwqo+ButduX
 IEPFMoa75OJpWb5w+ieNWY1INC4ar3aIgpzIjIw5YjvFVboUra2TNwNQdOY23TfJI8QX
 akqADjDi2mBV/jwTGITCm/qGFmDxXE11Mm+5bt3pZs4CPubdNVKqgffqDrD5RZ1s99u3
 8JRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKEX3GRkh4n/rbePwGu1ZO+QiAU2sJc1xIy/CvR3sX53bsP19c1sXVeiSN2nMdH3IZF2ZahFSINgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw68NXYOjIR3/X/CYuPwQTmZs/ELIWh2oPY8grAg75EIufUZJOK
 2SREtFlLBS95XpZEkgYpVZ4HT9ZRJn+3q6Jav8AHUyAw9y4JJ22imBHpxlJJnCg=
X-Gm-Gg: ASbGncuASipAo1Ae3GX+/YJyaMBpJpz9pXv2lJNs8PGNcIpqPLLzesgl4ZiBW3oQuzj
 U6cvNFQXfnhOrDV8BwKTlUf/8PvzxQGVL55xWYxDsFGzTbVb6M5YrZ1CPNkQ9rzj/MFB12GCWwz
 PjaRB1oDEZaPktkBco4NzBk1IH4NOpPmsPphqimFvc7z0P8fnLlvyCqQl53Q224ZrNBS4ON/n4d
 3ayNWndw6PIQqsT8ugmsr5Z9QatJvD/P4Mcesr33YApgrGFHNtdZVbIqXmnXk0JYkxQavvSBuUC
 6IwC0E4h44pIuLhatlI3QhVZHCfR
X-Google-Smtp-Source: AGHT+IGdOvSjlcRVJIz6FlpF8a9LA/mwmpmpoNxzHcBtTPcwZuUvAzAi23SMffnDVfyi0H8AsEtezw==
X-Received: by 2002:a05:6a20:9144:b0:1e0:d169:ee4b with SMTP id
 adf61e73a8af0-1e5e045d6c5mr28948508637.12.1735092078200; 
 Tue, 24 Dec 2024 18:01:18 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8163fdsm10332520b3a.6.2024.12.24.18.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 18:01:17 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dianders@google.com, Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add B140UAN04.4 and MNE007QS3-7
Date: Wed, 25 Dec 2024 10:01:09 +0800
Message-Id: <20241225020109.1051449-1-yelangyan@huaqin.corp-partner.google.com>
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

The raw edid for B140UAN04.4 panel is:

00 ff ff ff ff ff ff 00 06 af b3 a7 00 00 00 00
0c 22 01 04 a5 1e 13 78 03 cb 55 91 57 5a 91 29
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 f4 3c 80 b8 70 b0 24 40 10 10
3e 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 55 41 4e 30 34 2e 34 20 0a 01 46

70 20 79 02 00 22 00 14 87 61 02 85 7f 07 b7 00
0f 80 0f 00 af 04 23 00 02 00 0d 00 25 01 09 87
61 02 87 61 02 28 3c 80 81 00 15 74 1a 00 00 03
01 28 3c 00 00 53 50 53 50 3c 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 0b 90

The raw edid for MNE007QS3-7 panel is:

00 ff ff ff ff ff ff 00 0e 77 48 14 00 00 00 00
34 20 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28 3c 4b
4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 45 30 30 37 51 53 33 2d 37 0a 20 00 df

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f8511fe5fb0d..e9434a0cc37a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1865,6 +1865,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
@@ -1954,6 +1955,7 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
 
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
-- 
2.34.1

