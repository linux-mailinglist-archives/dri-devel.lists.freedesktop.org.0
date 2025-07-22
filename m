Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB7B0CFD6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 04:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A69210E272;
	Tue, 22 Jul 2025 02:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="rfyqArqu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55C410E272
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 02:45:20 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-234d3261631so39598255ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 19:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1753152320; x=1753757120; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SgR5lyoK6/GJ41X9p2+Joh61MHj8cPp4obeeP6rb+Do=;
 b=rfyqArqujeoOiJlulC3Jj1E/Y7wCYM7BlsUYPfGqp/l0eMJf9RZzNT/Ob0IQfyaSiO
 azkF4op2QeH4im2eay2q3p0ch8Bl5SlbfkJtDU/mzhAoy0ewAuclNdmY42oN+4luvu8n
 ML/OrChAe716jnWwADZIDBOfnmQsEFguptjFKDS/dFSaMDlsnIX7AmznYYrj8LUwcR4c
 sNvUZ2rwMu/dQ0bjoRxcw1STaeNI+Xj68rNgcNHm0IuR+l0YRzrMRMmf+/pV6lwFcGiA
 1izOwqfoATpyehdikAmFdMx2XPPG5wlnY9KHIcc3/DFRTPe80xz4TBjsC+3ENAdh142D
 oBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753152320; x=1753757120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgR5lyoK6/GJ41X9p2+Joh61MHj8cPp4obeeP6rb+Do=;
 b=XH2vy+cM1K4Kt++h59zNMa24uh7lBAPCTqBq/vRVw1IlTi+Pu+AmovuFSsOx3J/UO6
 XFmshVdP2pnLF3PgixkIgCzi6AxcD+RIcz4JoR2zuRurF2AU2oac0tq1+qMERFNNfSr5
 krD1Klx2NdXyBJ15wmOd0MJuHc9BLzN8QHZ8ENFxYWjQKyO83pVwQekhNZ9wgjxMq9tI
 yPSYE+vl7KGsgYvYIyyJRQCqG7BPCH/eXgEmBNXx9ceC4y9H/hiAa4X2ucmP4EPi3R3d
 UgsGxNUaJzFPNQURaWdRoocWZp/YRGC7L/VutmYA9l2i9sOIZ+0aox1uJJBSeN5X24PD
 Vl4Q==
X-Gm-Message-State: AOJu0YzhV95A7NC4MrJe77O3T8b0YJASlMmkDcVyH7Oy5pBW5DMTxHJR
 ocJPreyFv+trX3hCLs3BmrDw+9k//oxTqLTyzFWdzX8A+j/Tud46c4V/eijuZtmJCI4=
X-Gm-Gg: ASbGncuNYSyKoKw1Dcb11cEVzaFK6C+5ApAJPP+dljxvktICjXz0H2dMhFeHsqGo/tT
 Mp5y0uWDk4dQHTOjF/O6Rj/TDhIa9NhZAFJHzE94aEq7n7vfDtlgM5zDL4Wun9nM/ByeDkDY9XF
 xQmU4e7Qg7wSGckxE1mwoZ6VV0gHrHLrGnCYk0+iqmd7Y5bBT+i4o7cKYO5kfqXAEHOwdMBXN64
 1Do04kSljpNQtu8WNojoX4k/JTkySKLIXA9rbhI+DiytbpXgk7YSFpuqNo2FvVSknTj/AiASdnr
 vd9h3G6Z/RVRnNaD6ZraSivDiBgH4urNhh/7nBBSfh+lRHaFyHCe9cm70VjaqZHRMUiHp27DXK6
 z9+I8CnpN7f9/h6ZUTkO+AIkpnvocIT4mrnEmBzoFQX0Pfzcr4fUb2tqkrhLWIsId9/SVkQ==
X-Google-Smtp-Source: AGHT+IH/Q+dX34w1vgsvL0us1ncK+GZVoY6ee3ZuaokqA8D2OA9tnAnpdE9lvFFBdQr6D4JmaqIx3g==
X-Received: by 2002:a17:902:ef4e:b0:237:ec18:eab9 with SMTP id
 d9443c01a7336-23e3b80c3femr189211675ad.32.1753152320172; 
 Mon, 21 Jul 2025 19:45:20 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b4adeb8sm66117965ad.0.2025.07.21.19.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 19:45:19 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add 50ms disable delay for three panels
Date: Tue, 22 Jul 2025 10:45:12 +0800
Message-Id: <20250722024512.983313-1-yelangyan@huaqin.corp-partner.google.com>
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
to satisfy T9+T10 timing.

Fixes: 0547692ac146 ("drm/panel-edp: Add several generic edp panels")
Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 09170470b3ef..742a83fa4da1 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1743,6 +1743,14 @@ static const struct panel_delay delay_200_500_e50_p2e200 = {
 	.prepare_to_enable = 200,
 };
 
+static const struct panel_delay delay_200_500_e50_d50_p2e200 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 50,
+	.disable = 50,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_200_500_e80 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -1941,13 +1949,13 @@ static const struct edp_panel_entry edp_panels[] = {
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
@@ -1986,7 +1994,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N160JCE-ELL"),
 
-	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_d50_p2e200, "MNC207QS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_p2e200, "MNE007JA1-2"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
-- 
2.34.1

