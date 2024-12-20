Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 515379FA03B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2024 11:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9151110E037;
	Sat, 21 Dec 2024 10:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wEmU+Yb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A625E10E382
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 12:21:08 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ef70c7efa5so1314863a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 04:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1734697268; x=1735302068; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I460Zfb9GJ30+SZUTiSrDZTxITxe/2dmjjutqQhXtdg=;
 b=wEmU+Yb12VzsFENDb/IxjIPC8TzFQP47KRU+6VjfmoSrjg7m/tU8FpsdzRn29leAvs
 acJBu0HI2uh5x584FCT7qoKBxqh3Q/0wDasB5HHT+C3lqAXbgBmpNjdlLTRbJinAa8OC
 LMpO6Bx/tUZ2nDY7/FS1qyCKBbZOBLH0lvv0mbkqQjExoqCvJUQuI7pUgor45tAvL0Xo
 fVsXp+2HCCx1zv1Ggj/F83paBi0+xmd1Yc6GWk3I7EgGQB8a82B3i9nS3/Rf+vuWOyIm
 ev6nVStBoZ1kPcdyDr6Vwvz0Y2b1xuiA3nPg01LSib+cHuy5c6DiZ7ywbuk6j2fa3wuP
 kgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734697268; x=1735302068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I460Zfb9GJ30+SZUTiSrDZTxITxe/2dmjjutqQhXtdg=;
 b=IBP2O3BY/s8W68QI8LWD+K/mdAMIBHrWg2MVc8M2zUzaezjg2CPdW64+rY0EE16y7H
 7eK7N8na8lMnX4q/JgjVL5KITZLkOENH3mXRiOGHRbJsHd00sqXh20hSfibcJSZBauF+
 zAYzbDrrH/RULYK3u7Sl+T5XdqPrF+ZBNRGR8kI29i3S5/F/IjDZO9TxLIwjpMtYQN3X
 swUmEircgI6X+USrTehrsxMinUa7FvRAP6evM36zDF2YYhSIW51L7LgokJm/U5a7zJI5
 4cGad83X+ytVXmFoYrNibMvvFPdwdlRGLNKhtdJIIZ7i261qbFqufHy0jehJL1WiuAbN
 l4Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2YgsupTPLHKjrmTAv20MKF0kOJ7yatqsZU09CN5RwBu5mg7DRlZ9Zio2miiEZ1dhGSTcHc6kWSZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrimQ/SdU/U52GJaXJG3U4jNrY3CYG0kxpPgdNuwzERiFWAbx3
 8EJtgoFPyX2pykHo103bVlF46zdFf7ksRXsnVs0jYl8qQQ6k6gmOeSGz1oJwnk0=
X-Gm-Gg: ASbGnctQ+L+QeU3naL5hM//N/HMFrYBojMuS5pCNzoxe2HASvx/YoxpWO5ifuSlGCvR
 j8qmqM9WrpBevpwT6uhS2DBtnoX6+ffcGJlLnDsSaHZLb9hZskrcPFCPfisuNR3ekLF0jZIa5NE
 S1DZG72Sv+TGJ40Igxt4kuQEqF2yGDRRNJo3oyYeGh+UCS6IXZPE57FQzFfX3nWAOEGoJOZ3m0v
 wsi0mQY5cw7ZgL4rsCyJe8G86sPSUtZx8iU0ixjbGVc6QffifIC7CS7kB2hhdsIfZZYmSkV3tQx
 gqL4CzoNHOvUAMb9LSKUTPvQt8vv
X-Google-Smtp-Source: AGHT+IFpgOPZCIYWFfF1naOpvQ1EAJXyQ8ZYEbbL0mA4a75lW9oLj/dgwKoHKlMVRtts8kupzG8Fig==
X-Received: by 2002:a17:90b:534b:b0:2ee:c91a:ad05 with SMTP id
 98e67ed59e1d1-2f452dfb0c0mr3778652a91.3.1734697268118; 
 Fri, 20 Dec 2024 04:21:08 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee06dd77sm5570145a91.33.2024.12.20.04.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 04:21:07 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dianders@google.com, Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add support for 2 panels
Date: Fri, 20 Dec 2024 20:20:58 +0800
Message-Id: <20241220122058.132843-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Dec 2024 10:51:26 +0000
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

Add support for the following 2 panels:
1. B140UAN04.4
2. CXOT T9

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

The raw edid for CXOT T9 panel is:

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
index f8511fe5fb0d..f41a9077c633 100644
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
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "CXOT T9"),
 
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
-- 
2.34.1

