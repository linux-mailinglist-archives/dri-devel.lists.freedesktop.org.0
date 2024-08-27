Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D727A9613B9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF9210E374;
	Tue, 27 Aug 2024 16:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="iPV7CVAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48A710E374
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:12:49 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so4849550e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1724775168; x=1725379968; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9b40ZG6wtpXNDRIbJ+N027Dbp0WF4n42iEPhKoROnQ8=;
 b=iPV7CVAL9dFGzhidDQi2w+9gbvZusqCyWX/rEgLesw19eo7hpzqO4BAk4JAWprFyvj
 5cGpIR3Frn18MjFJMaAkppKrOlOIwY1abvzWUpVLj33Vufx2DOOidD8PXUCFtZIK3mLe
 GH+uLvbhdpsvrfJixcXkGZbhljVWDEbc2X98XzS9ej58XBAjA2EGGF7CqUKkTgLEZnzV
 pIOqKwOLnX0a/7F65turZZyweQhQdzv2mnmu7C1osuEiYjCJIsp2FDSsRJh2BIBK21IG
 zk/1Mxos6hz02ihj7zRlpweEHqAzhkj28yeaf/wqcqaSB5trFEbLKDX0mA6F/73Y2MlF
 uLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724775168; x=1725379968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9b40ZG6wtpXNDRIbJ+N027Dbp0WF4n42iEPhKoROnQ8=;
 b=vm/GQ6FM+JuPID/SrlGi3RSTuP0+q1IsZVBP5twN5qE5qSIu21iQIvjTFh4pkYFQIv
 sASCk9vla5z/W2euY42X+gsoCCiIjKUghaW41INt0TD8lZNXiM2X+RZjEt9FHGJK2qQh
 pL/UvWd/yZ8Ci77gJMUW9Q9t15/+iABLFTmDCe1MAA/06pV7A5vOTceQBFD/hz+58kLJ
 6zk8c2DtM3Quqn2vLDPfagtBWeBMM+7AhPDz0Igo9BuDWIo28zNceOGBKGd9EvzLNAH/
 arRyY/Y02syOK5YsbGWhxvA7xbeNmw1g77Fw04v3Xi8BMnctVtSZCIGppY4SbKNYfzHY
 wamg==
X-Gm-Message-State: AOJu0Ywfo0EFJwd1C7e+UuJ+jJcKJygEIYl48ECS0i3DUqQjHuKdo1Mu
 KzTocjA/fcN+Lfi3EdqzRxeTIJk/HvdJBqxnN5Mc8Cn5wHhDc+csfSINPCUUe2Q=
X-Google-Smtp-Source: AGHT+IGztyO/vXFJhZ5is4NuBcc0I5gssmVDfjip0FHP6sjWxirKEM36B5impi0ie7i98OY5jl3r6g==
X-Received: by 2002:a05:6512:e89:b0:52e:767a:ada7 with SMTP id
 2adb3069b0e04-53438868d57mr9236836e87.50.1724775167458; 
 Tue, 27 Aug 2024 09:12:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54b50dbsm127893966b.93.2024.08.27.09.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 09:12:47 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: manikandan.m@microchip.com, dharma.b@microchip.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, hari.prasathge@microchip.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@tuxon.dev
Subject: [PATCH 2/3] drm/bridge: microchip-lvds: Drop unused headers
Date: Tue, 27 Aug 2024 19:12:22 +0300
Message-Id: <20240827161223.4152195-3-claudiu.beznea@tuxon.dev>
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

Drop unused headers. With this code becomes simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index 027292ab0197..f04831106eea 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -8,25 +8,16 @@
  */
 
 #include <linux/clk.h>
-#include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
-#include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/pinctrl/devinfo.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
-#include <linux/regmap.h>
-#include <linux/reset.h>
 
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define LVDS_POLL_TIMEOUT_MS 1000
 
-- 
2.39.2

