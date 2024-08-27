Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C09613BB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E23210E375;
	Tue, 27 Aug 2024 16:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="hAqdx2mz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C076210E374
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:12:51 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5334a8a1b07so7051477e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1724775170; x=1725379970; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/VeZJltoLAKxh7d3cB6a8DRSH0vtTp7P9mPnF3uj0f8=;
 b=hAqdx2mzJBrnkG54BXIMG2oj7TJjordUYiriDP3maJkgbsEQ/LxglPKB0D+dDsLA0E
 z22zqHc5hU0nSmRF1gaK+gxeqqe+XmvlTXQ7cYw5G4DOOln0flyVNMgf/sQ6DaJzh+oy
 xglPrZz2F5ttChWXj7Ly75TUgsmZPHXoGkQGDj2ycYP35iGWcD/ea4CnwAJt/MW0KVLg
 j0Dp9O+ve/iQdr7o2eyep20TyQnkNjNrZpwrvIzKgY4VYgszPDnju8VkGAn/sAGFHsXH
 wvo6YE7+64khqDFxnph+AjYCQCWgFKMBHpOFRuRDKD9qOqT1AMTFtusOp7F8OBSXJkQq
 dTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724775170; x=1725379970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VeZJltoLAKxh7d3cB6a8DRSH0vtTp7P9mPnF3uj0f8=;
 b=QgYHD2V/PFSCf4SmTW24jXv5SaSZYvbRujGV+9evAr/H/12ZVPu/j5YMDTZ74Zk5TY
 U1IWEXdhNQ64hQ3ynU08j2IlkuFR0+/avBcK6a+bN5Rxys5q9CeppXXTaxj+EBSm4m+t
 VEVYICY/yA1UnDGGl+p9ApaI7zcGFe23MpEFcSPEi1MPlp+RhlFx+aVUbWWMJE2N0Phn
 dCuzaVQD9B3sGxblsb4Sn0a3A2Elic7ds3geI03SUFyhsepcGaNLOXtDEp1ut4yl6U8U
 ZHgFMpvbPZKnIuXN0N0Q1ZOGudxj+wQr0KOe7K9gbgE4gp3P8O9xnxVhbKqvMiE0HCS/
 oSTA==
X-Gm-Message-State: AOJu0YzIs9hEhlM2Tz8dKS/2au3oy3cCSVz5Uy2vrIe2hkE1YOg9gCP4
 ca0okVCTrlB3Kaect4yb7cSCw3dUkSgqGbTLWU9ns8tXvpUP+yqRrOEFo+s0WbQ=
X-Google-Smtp-Source: AGHT+IEn6EiOoC6u9T3Qh/ZYHO31b5oMxMsAnawAD7VSKPISxZfLW3mQWnzXyfQVhrfz81mditnTcg==
X-Received: by 2002:a05:6512:4004:b0:530:aa09:b6bf with SMTP id
 2adb3069b0e04-534388330bcmr10078492e87.24.1724775169565; 
 Tue, 27 Aug 2024 09:12:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54b50dbsm127893966b.93.2024.08.27.09.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 09:12:49 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: manikandan.m@microchip.com, dharma.b@microchip.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, hari.prasathge@microchip.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@tuxon.dev
Subject: [PATCH 3/3] drm/bridge: microchip-lvds: Use
 devm_platform_ioremap_resource()
Date: Tue, 27 Aug 2024 19:12:23 +0300
Message-Id: <20240827161223.4152195-4-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
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

The devm_platform_ioremap_resouce() does exactly what
devm_ioremap_resource() combined with platform_get_resouce() does.
Thus use it.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index f04831106eea..85aff8c5aaf4 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -154,8 +154,7 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 
 	lvds->dev = dev;
 
-	lvds->regs = devm_ioremap_resource(lvds->dev,
-			platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	lvds->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lvds->regs))
 		return PTR_ERR(lvds->regs);
 
-- 
2.39.2

