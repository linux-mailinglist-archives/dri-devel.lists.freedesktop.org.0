Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67BC8E396
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 13:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037AA10E673;
	Thu, 27 Nov 2025 12:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Cyp54ggS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E7210E673
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 12:16:09 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2984dfae043so7089595ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 04:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1764245769; x=1764850569; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o3hxwctHNUdCarFW6P5wDgmvCHnQslCanT7sActyeKM=;
 b=Cyp54ggSgL3cSmjmcxhO84L1UG78faNvKmcF6NSYiFuQvYiSOhJZgtE2TxE9UTDJsS
 eKfF8Z4TmeA8X2wivqMAdFj0rry9/1b6R/flJraIBNkNupIimLp5+5uqZ4FG5u3jTNgF
 tLra7ctXuIc2h5T96lCcdL/wND6eXBpPhT1ygrR1cv1YDIhMlprbil1ktWGtp/Ir4GRl
 1Cc/XS8j+xV+z7OCMq1A+gXZi5if/rFT068hMN5B3vyuDXf83SIDK+K+oK2EIPfZSwrg
 4KY4ASdm7h/frW7qUis3i3NAYSahuM3GGvJsnNWmM6K7GTUmfPxgM/KiEoaeZD+NzhMk
 9BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764245769; x=1764850569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o3hxwctHNUdCarFW6P5wDgmvCHnQslCanT7sActyeKM=;
 b=I9QBOaTGtrmYvcEjpcgfLO/avqDzhYmD60Xhgh54hVisksswRO0sN8OtAeYfR3KnY3
 jz7VLIbdHvH7M5D0L2ZaO41zNyAt3ILYtwyf39o+tCf7887VeUZhhtg5FFTPPLBP5kjz
 XvEepZrDPFopXKkC1V+1crAoht+pABMF5oaP6jlqdKIUZSzSSsNwCLjzOJTapmQPTPZa
 FfikDLH6SEZ04Z451Ugy9oatTwgYEk5J7C3PKksD1S7jVr0vdLwT2kCvSlsbj/0Xu0Y6
 UBTiHu916nctHM8RKJZMlIZg4JT2O04HhLSu9qdxfCvT88onyrIanuRfYWn7+npUk3DB
 U4Dw==
X-Gm-Message-State: AOJu0YzOq7XfJ8tUajQS0XgkKlCiFSLkx7ODoFfbPa8QxCp0KyW1dDkP
 95GkldQ7jMaP3BEjN9O8IZHOrYUnzcGUvZeqKLUFbSGlie7m7VMZ+iR51Q6wDk1pgv4=
X-Gm-Gg: ASbGncsFkRisFhZOgFWtPQRuV/iA/hvAHITpgieI5KPzKeCVpsI+E+8iJF2tOd2AZj2
 pnQyC3PMtO0ST8ZYpMbycuIzfbL6MftVBSoDRi5JvxBpiXFCJwkoCa/CgyNxQ3LK5Ggpp7Zc1xS
 vHI7xIFE3GcKTddQcY2qYhYGCzxdRYGsqwdr3PxzQqGqMmB9rHG69CvKVKWGbsZNaEPgDgogDjv
 75BBL0TmwI8olikZVLu0YtrK/VHjsIbbxjm8KC33GpWDFd/9jcQeCwvtKOZoB35RMR8z+qXBykc
 lBv8g0VqeAttGCbRNHmx1QZrBm30UU8XlDinWvNCG3QCxCeDqux6V+iRmAv6YovpF8tHOqR8rQw
 n8ovH0LR819Rg/cwCwWe5eht2QsZN71Ug5wVO41RE8eGHkwTz6MF8x8+m4ZzztjiD6MlCTtlsQT
 J103fchmEcHAPC6uJ4JwRGGVWtLc/tdc3m0AepjbPKSonUjum/2jZUYSEPYg==
X-Google-Smtp-Source: AGHT+IH3crpbJjkunYtle/ef5kNW9hHmsi9e1weF9nYXS6bBnR63NKI39K06U1UJvcvRPrrmLp8HPQ==
X-Received: by 2002:a17:902:cccf:b0:295:7b8c:6622 with SMTP id
 d9443c01a7336-29b6c3c2908mr274549205ad.11.1764245768661; 
 Thu, 27 Nov 2025 04:16:08 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce4142f4sm17363475ad.10.2025.11.27.04.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 04:16:08 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add CSW MNE007QB3-1
Date: Thu, 27 Nov 2025 20:16:01 +0800
Message-Id: <20251127121601.1608379-1-yelangyan@huaqin.corp-partner.google.com>
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

Add support for the CSW MNE007QB3-1, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 0e 77 7c 14 00 00 00 00
00 23 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
36 00 2d bc 10 00 00 18 2b 30 80 a0 70 b0 23 40
30 20 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28
3c 4a 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 42 33 2d 31 0a 20 01 5b

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
00 3d 8a 54 cd a4 99 66 62 0f 02 45 54 40 5e 40
5e 00 44 12 78 2e 00 06 00 44 40 5e 40 5e 81 00
20 74 1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c
00 00 00 00 8d 00 e3 05 04 00 e6 06 01 00 60 60
ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 68 90

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..023fbbb10eb4 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2033,6 +2033,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e50, "MNE007QS5-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e50, "MNE007QB2-2"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x147c, &delay_200_500_e50_d100, "MNE007QB3-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1519, &delay_200_500_e80_d50, "MNF601BS1-3"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
-- 
2.34.1

