Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C29B0EBDA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF94F10E762;
	Wed, 23 Jul 2025 07:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="n6LMVasq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D244410E762
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:25:21 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-23e210ebd5dso4715985ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1753255521; x=1753860321; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FbVvJ/dl2UFKOk7clhbTp0K7aqaTWpr5zaoIRguIYZA=;
 b=n6LMVasq4kWYyXpN82YDHq7OtEVcwvaEU92hX/99enkTP0YJLMQNBlwexqzX93Bzo5
 Upix8rw4BaXEH4Mo10/CcTsG3JCtRU18tC6KhvZ2ErhJW8jNTomYDOfhLSLT8PURMCSs
 KjWOfkLAFr9PC61kfzVdDW9F/eHakw2acPiK43vG91Wxdf0tR/oww+lxyIOZM/ERdeLi
 ElCRoCW94GdnenMo5EOhCKuemHuz810pU/OLbuAywOA4zNq8yNn7oLRvUxRg2dL1xTE1
 Y2neKIHfc1ysXd07FLlG8RHMZPwoY25hXIMHbTckpvzFYRqpfU4GXzCWV438XgBpnOkD
 eJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753255521; x=1753860321;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FbVvJ/dl2UFKOk7clhbTp0K7aqaTWpr5zaoIRguIYZA=;
 b=PJzU6oEu8v7en4eIoaI0AOYvfS/CTOJx5WmliOWse6AwFohlSYYwQay5PbqHZ4EYS4
 fxe4rHSB4w4V/tfU3GYKamKn+a0WywT6IqG7/mRLQJzmnT5cQAxUoLd1GqURzFuYsR4R
 fwiAA+I4LJd0tkeg2/YWzXv+VcYKNvMlGwgWatFtcDZ+Tk9+N64qYypzdgm44oMCBCvO
 j1DIJfToLVbG5TNitJ+77KQddsx4oVKNkXFj1f8RUmOyKMQOxZsm+GuGN5YcHc2hPd+P
 SsvFNlQ3l/a0DXm5rfWRkZoNfiGK3yC93odfv12vy1p2sloRqXPlcIM+cpBWcIaGcpPg
 7PGg==
X-Gm-Message-State: AOJu0YzB2oYwexJ9OJyim4Nh9RCwJ/+tnfyxdzrc1l0DHiC3JAeiP6gR
 0Ypwt81t4dtJn7X+2nN53ZbeS0ncFs62D7FJ1jzIixTZ7mIFBmraYrueBQ3VxdVCNtw=
X-Gm-Gg: ASbGnctVNoo9HZfR9ye72y/fUZOu4XPWDanEBH3ufygL0syXPegxjV2poEatVABdVBE
 O3bL2Z1vILBpD3q1G1cXRFdqThZIVb0pNVlw7eTjzsq8yv6nUMy4EgJ5dcu4mAlvCVpxxtk+9IZ
 +SttVWV+LFsHq8HzwTeqYEf34XoeWVIOhX3HjXgkqwnqGV/fb9q/1iwy7LkQEm8D6M1/lC675oa
 B0IgwRYUSEEQLUGKE0FecVAY0RFO5/6xmkx55bfcAeLxdGy8OZhJe5F6A6I678xK7K6co5wvGqY
 RzdccXZpuT5BWEymn9q1QWO5oIGfLukRBFypx02tRhgaDap5O2HAQi44U4nsJgyoVLfy148m4jI
 7nvvl6gjStVRy4usfBu7EuZDM3DQ32BNCuxoRMsV5D4FRYhq+OX2epIKYCVn3KBIuPyG+pQIQvu
 CD9/kB
X-Google-Smtp-Source: AGHT+IFINmSfyMA860ygGntKNOpi4Ot+pzj3Tn4lpfMlC1W1Ze9XP6Rd+l9jS1YOTv/Ti5UF8dwxxQ==
X-Received: by 2002:a17:902:d4d1:b0:235:e1d6:2ac0 with SMTP id
 d9443c01a7336-23f8ace63afmr92233655ad.24.1753255521187; 
 Wed, 23 Jul 2025 00:25:21 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b491bsm89749575ad.126.2025.07.23.00.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 00:25:20 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2] drm/panel-edp: Add 50ms disable delay for four panels
Date: Wed, 23 Jul 2025 15:25:13 +0800
Message-Id: <20250723072513.2880369-1-yelangyan@huaqin.corp-partner.google.com>
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

Add 50ms disable delay for NV116WHM-N49, NV122WUM-N41, and MNC207QS1-1
to satisfy T9+T10 timing. Add 50ms disable delay for MNE007JA1-2
as well, since MNE007JA1-2 copies the timing of MNC207QS1-1.

Specifically, it should be noted that the MNE007JA1-2 panel was added
by someone who did not have the panel documentation, so they simply
copied the timing from the MNC207QS1-1 panel. Adding an extra 50 ms
of delay should be safe.

Fixes: 0547692ac146 ("drm/panel-edp: Add several generic edp panels")
Fixes: 50625eab3972 ("drm/edp-panel: Add panel used by T14s Gen6 Snapdragon")
Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
v2:
  - Deleted "delay_200_500_e50_d50_p2e200" structure and renamed/replaced "delay_200_500_e50_p2e200"
  - Link to v1: https://lore.kernel.org/all/20250722024512.983313-1-yelangyan@huaqin.corp-partner.google.com/
---
---
 drivers/gpu/drm/panel/panel-edp.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 09170470b3ef..d0aa602ecc9d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1736,10 +1736,11 @@ static const struct panel_delay delay_200_500_e50 = {
 	.enable = 50,
 };
 
-static const struct panel_delay delay_200_500_e50_p2e200 = {
+static const struct panel_delay delay_200_500_e50_d50_p2e200 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
 	.enable = 50,
+	.disable = 50,
 	.prepare_to_enable = 200,
 };
 
@@ -1941,13 +1942,13 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a1b, &delay_200_500_e50, "NV133WUM-N63"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a36, &delay_200_500_e200, "Unknown"),
-	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116WHM-N49"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80_d50, "NV116WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140QDM-N6A"),
-	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80_d50, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
@@ -1986,8 +1987,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N160JCE-ELL"),
 
-	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
-	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_p2e200, "MNE007JA1-2"),
+	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_d50_p2e200, "MNC207QS1-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_d50_p2e200, "MNE007JA1-2"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
-- 
2.34.1

