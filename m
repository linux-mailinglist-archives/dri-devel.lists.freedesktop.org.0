Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A168CC923
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07710E00E;
	Wed, 22 May 2024 22:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="zufPyIJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0014710E2B2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 11:39:50 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5b3241a69f4so2266898eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 04:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1716377990; x=1716982790; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aIxX5cYsFW4f3fFIPe4gQfExTk/C+UC6nEk+3Rg1xtA=;
 b=zufPyIJ9sRgnuvOtuvkFrf7BztfAaW45b8HEqBgIzhUP0pphOVTz7SoUmeOiwNYcQW
 JGH+i+TiMOD+y5L55YXFkVxkoiwr30ZwgcNsl9PC3wW7srT7Xcq6CIIk6PFOhO2eP9D7
 KMmKAdlbcgE7OwES3cdBRh3r7ZuxtwNaeP0TgyhfAziwZqPMEYEanm0+iYNl1pMDRpSs
 NR75/38x86tOnB9YUwc39sugKJdYRP7K5VdeK0OY6e178jCkyvBe7/bJOTKQpBuyR79I
 hH8W8B/I2TcLzAbHhZJVSolhrntb4naTlGnL0HnobFg6us06m2sepVMjME2BsdtBT2nH
 OuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716377990; x=1716982790;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aIxX5cYsFW4f3fFIPe4gQfExTk/C+UC6nEk+3Rg1xtA=;
 b=i8dvgQwswGc/oyW7PLwRPhXxmJmJOcRoKWa9MMADvLfs04U+izr67iBKJrCwmhF4hS
 Rl1nsOOm6/mv0VErfSS6v4Sqay/YftQr/qXLh0VbNip8zh0So/1NCy4VbaB5IoIs1auj
 QDoeuv4uLmQL+uRIP1euwyQSpRo3s+6Q9WROQcQitCDR7S4OL62OaQ4V8l2CzajjaLQI
 kTbRzfNfVC2TgUPuCYu6rQlX6Io1KF7SooNDMoakGBhs1ljopwwg+9E3NvVRLng2PtX4
 BGaUpxmURDgpOwGM9XbRdoVU9yb+8L8CrH7o3IOgg3OWgYQWWVNwVM1QNDHL1s6idgfW
 So5g==
X-Gm-Message-State: AOJu0YwbeRCW1BDl9GrH4J1mY7Bi4FyFD69Wglkg8n7p5xB5POnlTfmJ
 nCULFysChefS13/LIUFbSgnVnip8LKTa+DueZg4EXb7Psb+QmzI2Zb1knD5lR+g=
X-Google-Smtp-Source: AGHT+IF+P4KyA0qjF0rkpmEN0Vv2c2+hJAzEpAN3LvQxG9cmwuN9k2OO7RBXuctIQ6eYQkrLtbRRkA==
X-Received: by 2002:a05:6359:678a:b0:197:3d6f:ccf6 with SMTP id
 e5c5f4694b2df-19791ddc7e9mr183809255d.1.1716377989841; 
 Wed, 22 May 2024 04:39:49 -0700 (PDT)
Received: from zhk-CBG100025892.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-676fc4c98d6sm924437a12.81.2024.05.22.04.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 04:39:49 -0700 (PDT)
From: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com,
 Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add CMN N116BCJ-EAK
Date: Wed, 22 May 2024 19:39:24 +0800
Message-Id: <20240522113924.1261683-1-zhouhaikun5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 May 2024 22:38:44 +0000
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

Add support for the CMN N116BCJ-EAK, place the raw EDID here for
subsequent reference.
00 ff ff ff ff ff ff 00 0d ae 60 11 00 00 00 00
04 22 01 04 95 1a 0e 78 02 67 75 98 59 53 90 27
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
a6 00 00 90 10 00 00 18 00 00 00 fe 00 4e 31 31
36 42 43 4a 2d 45 41 4b 0a 20 00 00 00 fe 00 43
4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 4e 31 31 36 42 43 4a 2d 45 41 4b 0a 20 00 98

Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9cfa05c7d193..01e26b5a2388 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2067,6 +2067,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N116BCA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
-- 
2.34.1

