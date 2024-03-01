Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD786DD3B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC4010EC0B;
	Fri,  1 Mar 2024 08:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="TahqapRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8A610EC0B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 08:40:18 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6da4a923b1bso1615430b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 00:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1709282418; x=1709887218; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5gSJCZo7ixIJLnhON1L26aJ3aOWrknxiAlTJBVJYsQ=;
 b=TahqapRSJKMHuVaroI28IaZiREOOFyFlf6Y+DcKSaQDOHBKNtIOeFyienBpuF0SAqP
 z5mhBHF00rOXjooRc/59iQCkH5NaNztv8FqCKc3QLPHP0uWi6RKQlF8sTFXlt4ZByJl6
 wPtjSToQYH9ZmUkP5Z2T4KCx4XErw0a3t2AHDkN1AtARL245a6m0azEQnpdWnJlR7WB5
 l3FHCDMq6GUI+FpzMMh+MsIFAj5rKe3beDJCOB5el+rvCY1dILZNG+V066oQj9T9p7pb
 /oswgnHSwrNSUfc/+Fzt0zMovIz8HYIi8l4jZ1IYOaiOzjtjKeLgK0voLpvfMhcQcXlC
 bAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709282418; x=1709887218;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5gSJCZo7ixIJLnhON1L26aJ3aOWrknxiAlTJBVJYsQ=;
 b=HC2UKRZHINgv8aszAL4zMy94wq1wYFz64xe0rY6J+pjvXvBhKDzz+un/WedDUEo/cB
 NBrkjgiaJzSaHyURpuNk9vmBX6AfxXTFOAJ6POqhpQyCIxYwD6hIHiabYXP1mAjjPEjh
 Ft5D2z53QV14j4LVgJwaTSSPuYK1RdQKQI6To4FjTapcvmDMYB4YC5sLOKQShoBYpACN
 9WWsTfOOm4J1VOEgss/XfbeuCCK5Z951guX2UlDi6eDxRh1sbqfHQOoMWjsteAFPhxKT
 27a7XNqm4GQKEVWBnsNcM+4lPE6pGq7JXU5DMyHkhWOk4CFAQqc0GWS4mXIGkoChwf4N
 X/bA==
X-Gm-Message-State: AOJu0Yxf0m1y0IcpByv0ePJn3maRC1zw2+atpq1Vj9wedwsh9kYikKnD
 EBpve0u802ycJhKNvgX9MqOBNa8AFkIIzfb89GHn2l7PTF67iGkFbJRvdFdA+7i55pwq1NgRyWU
 vkn0=
X-Google-Smtp-Source: AGHT+IFZeXSCqVXABlYyhd2dNoXuwhIgTgSE4/dK5a/e0RBUrLN1/e7UrxY0KflVMxJ8ZHEU3IoG4w==
X-Received: by 2002:aa7:8896:0:b0:6e4:fc2b:5f69 with SMTP id
 z22-20020aa78896000000b006e4fc2b5f69mr1596061pfe.4.1709282417746; 
 Fri, 01 Mar 2024 00:40:17 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 u23-20020aa78497000000b006e5092fb3efsm2450021pfn.159.2024.03.01.00.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 00:40:17 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel: panel-edp: Add prepare_to_enable to 200ms for
 MNC207QS1-1
Date: Fri,  1 Mar 2024 16:40:06 +0800
Message-Id: <20240301084006.14422-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

For MNC207QS1-1 panel, Splash screen occur when switch from VT1 to VT2.
The BL_EN signal does not conform to the VESA protocol.
BL_EN signal needs to be pulled high after video signal.
So add prepare_to_enable to 200ms.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d58f90bc48fb..745f3e48f02a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1865,6 +1865,13 @@ static const struct panel_delay delay_200_500_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_200_500_e50_p2e200 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 50,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_200_500_e80 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -2034,7 +2041,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N140BGA-EA4"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N140HGA-EA1"),
 
-	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50, "MNC207QS1-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
 
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "Unknown"),
-- 
2.17.1

