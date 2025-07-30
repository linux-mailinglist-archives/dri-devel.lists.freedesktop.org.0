Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60AB15972
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 09:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0969710E13C;
	Wed, 30 Jul 2025 07:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="crVOxzjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A784F10E13C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:16:40 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-76a3818eb9bso1069012b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1753859800; x=1754464600; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O/xW139xXV+Dslq7ni50YTdI0qCF7BjPpZKwdp+PaqY=;
 b=crVOxzjmOwtYJSLBuheJyfL9usw3W1u971sjN80j9SszcpvFQiu3o+JVlHuTSS3TUn
 bgS7ZjTuB+eqGBIAHsxbiJUoEKqZPNjP83PphNlSr9bBrt+v2vb5PZRBOdkt/vB/3rp/
 vRJL6TO9da5MZC+iMHsTpgzKhAvUttCXZuU9wKsN2THmE3FRQlSQokLKMNQiGym80ilK
 87PZuJILdB1yd5bVxifzvN2RBeiczNxxjKsrfHQGzk6DishYdKEvVXZC+iIOP217La3P
 oxkfzzDO0FVaViS0b9H6EV/82srosnO7wx7SLRJmyECCKZSZe2fjTwm6TKyqd9tI01qK
 G6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753859800; x=1754464600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O/xW139xXV+Dslq7ni50YTdI0qCF7BjPpZKwdp+PaqY=;
 b=aLwOvzBcsYDeBWndMj3Y8fxAb2mYuSG5g8JgYrbZe/nmSIDKa6Itw7sJYylyh0VLJt
 6lpl0JvgLzfeiSnjB9/4OAUput7zryDtc+JgeBNnkdlEJJTj37Mbj3wDrMNxwCDDxy+D
 egsz4nJGa1e2GZdRTNSXYoJOhLxBz916b+niE8Ao4klD6bPeeH8mEYWUIAyTzyry6QEQ
 P62Aerfrmm0Qzp7FvTxCrgxvXSMdyn5nWMcD0fgZpGNZPIoL9FxoGvemXvhcboqlM3Xi
 gxFirvb13h3fZbjz/BC1LNUnmNNdcua2gxkv2ghxvWbs3dNYY2EGBhJysrhHtg0dXwL4
 8Buw==
X-Gm-Message-State: AOJu0YwMPaTbH3KysTDogvHsQPoMP0DvVsAXTRG6feLPvUQcTycIgTcE
 wiLIC0hxl471lS/8vLWK72gcuzJgyv4wjCAo5qucwRFdmFvHqA2HoMCTN7IG4VzUF/U=
X-Gm-Gg: ASbGncunNxgCgLtxS1gPZwdrYEj+Jh6h+X4kPsUaLAH2ohzffOTT+oq78HKpMg4NHoJ
 9AWpKm4GRZRnZSSrIH9zpFFn5eu0geqM0tWYYtWe04LEMMLIQQLRMZJuZBmWutMvXDlFWQ8oN19
 dumiYRYLftudNLDOjmGLFaqlqeejd6QfIdz2OanHNwWEyldadSMPCvY2WZEQkrI3215m6HNWALz
 R69KAIfT5O3kTUbUUgBbzBHONgbdECqoVXnOk6s+RzYqeswGvXYgbnT41b8ypH7my43y7ml7odq
 YVl+Vea3zjb1dVIAbwtvgRxVNVOzmLlUt9Wn90h2iae2UT7o6JKSXzEz6/+E/dkmcStS691P0HR
 TFQ8xZpGCDaVAMIjDFzeJEYMtLg04EQn5rZuNYyMhAKh4vK/G2QZJYEbHowx1MK4=
X-Google-Smtp-Source: AGHT+IGnVIY1635A1RWlmZABzr9jpP8GTjiA0Dy5g3GrL7EjdlDZzB/3QYONtWoQhLpPIbA+EZJU8w==
X-Received: by 2002:a05:6a21:33a7:b0:220:ace9:193c with SMTP id
 adf61e73a8af0-23dc0eb9e63mr3859624637.38.1753859800069; 
 Wed, 30 Jul 2025 00:16:40 -0700 (PDT)
Received: from yc.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4215a79146sm1735599a12.47.2025.07.30.00.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 00:16:39 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, treapking@chromium.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add several generic edp panels
Date: Wed, 30 Jul 2025 15:16:29 +0800
Message-Id: <20250730071629.495840-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

Add a few generic edp panels used by mt8189 chromebooks, most of them use
the same general timing. For CMN-N116BCA-EAK, the enable timing should be
200ms. For TMA-TL140VDMS03-01, the enable timing should be 80ms and the
disable timing should be 100ms.

1. AUO B122UAN01.0
2. AUO B116XAK02.0
3. AUO B140UAN08.5
4. AUO B140UAX01.2
5. BOE NV116WHM-N4B
6. BOE NV116WHM-T01
7. CMN N122JCA-ENK
8. CMN N140JCA-ELP
9. CMN N116BCA-EAK
10. CSW MNE007QS5-2
11. SCW MNE007QB2-2
12. TMA TM140VDXP01-04
13. TMA TL140VDMS03-01

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d0aa602ecc9d..41ea9f65892e 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1757,6 +1757,14 @@ static const struct panel_delay delay_200_500_e80_d50 = {
 	.disable = 50,
 };
 
+
+static const struct panel_delay delay_200_500_e80_d100 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 80,
+	.disable = 100,
+};
+
 static const struct panel_delay delay_80_500_e50 = {
 	.hpd_absent = 80,
 	.unprepare = 500,
@@ -1796,6 +1804,13 @@ static const struct panel_delay delay_200_500_e200_d10 = {
 	.disable = 10,
 };
 
+static const struct panel_delay delay_200_500_e200_d50 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 200,
+	.disable = 50,
+};
+
 static const struct panel_delay delay_200_150_e200 = {
 	.hpd_absent = 200,
 	.unprepare = 150,
@@ -1865,6 +1880,7 @@ static const struct panel_delay delay_200_500_e50_d100 = {
  * Sort first by vendor, then by product ID.
  */
 static const struct edp_panel_entry edp_panels[] = {
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x04a4, &delay_200_500_e50, "B122UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x105c, &delay_200_500_e50, "B116XTN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x125c, &delay_200_500_e50, "Unknown"),
@@ -1883,6 +1899,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
 			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unknown"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x52b0, &delay_200_500_e80_d50, "B116XAK02.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
@@ -1890,10 +1907,12 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e80_d50, "B140UAN08.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xcdba, &delay_200_500_e80_d50, "B140UAX01.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
@@ -1956,7 +1975,9 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d45, &delay_200_500_e80_d50, "NV116WHM-N4B"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ddf, &delay_200_500_e80_d50, "NV116WHM-T01"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
@@ -1978,14 +1999,17 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116BCP-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x124c, &delay_200_500_e80_d50, "N122JCA-ENK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140HGA-EA1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14a8, &delay_200_500_e80_d50, "N140JCA-ELP"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x162b, &delay_200_500_e80_d50, "N160JCE-ELL"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x7402, &delay_200_500_e200_d50, "N116BCA-EAK"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_d50_p2e200, "MNC207QS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1413, &delay_200_500_e50_d50_p2e200, "MNE007JA1-2"),
@@ -1995,6 +2019,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50_d100, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1462, &delay_200_500_e80_d50, "MNE007QS5-2"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1468, &delay_200_500_e80_d50, "MNE007QB2-2"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
@@ -2041,6 +2067,9 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0009, &delay_200_500_e250, "116QHD024002"),
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
 
+	EDP_PANEL_ENTRY('T', 'M', 'A', 0x0811, &delay_200_500_e80_d50, "TM140VDXP01-04"),
+	EDP_PANEL_ENTRY('T', 'M', 'A', 0x2094, &delay_200_500_e80_d100, "TL140VDMS03-01"),
+
 	{ /* sentinal */ }
 };
 
-- 
2.25.1

