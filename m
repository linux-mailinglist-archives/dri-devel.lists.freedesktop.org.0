Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C412E9AE2F4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 12:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8A10E8F4;
	Thu, 24 Oct 2024 10:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WzQSOCLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4D110E8F7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 10:47:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c96936065dso792816a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 03:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1729766825; x=1730371625;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9ybzaQqZA8Pvjk1KH4zw/EHpgyxOggbtBG60Qj3t28=;
 b=WzQSOCLLW75WwVePvHW4lXzjLHE2bpGVYsscLphoCUO7MgktcVvSsDH3FXlAlD1dxV
 GEGGY9ZKAy61mOlML6gcMIj8o4vEFm4KSs9zUbP/NRhTr0MvDShEmtfbT01Gb3xEyK/i
 /PBYvURuVQyG90LbjopTGpxZ4JJnKN22Yinc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729766825; x=1730371625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9ybzaQqZA8Pvjk1KH4zw/EHpgyxOggbtBG60Qj3t28=;
 b=GHgtm2UMcMt7w55U3PwN+cDAaOrebHhJHMndwuV3Nhp7f7SCsri0xIwkJqcvpaUp4G
 NHJmHhC7qZg3jDnl4DME60cJXKpM1Z8yRLHnvE3jset+V5QF07eWNsqWs7eNDlmNpDmA
 lomaRk5chE18sQ8aD9DYEC+kubOUHnMRgh7/PPhw5C439d77Q344bUXAWowrkV+S5ACg
 5b1SaOi0SKPpIf5zSaD9f79OoJRJV8gglyLobjgc3YS6p4e9QSoyKxPmz6bctCDBCsHO
 j0MD+c8ngLgak/HA5dQkoAoLr/B5yM3aSMONIc9e35MdNwrpxCH3ynxyZ66dzHZqjjpE
 H+sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG+AQ3rvUsk6nhwLLbAWt4ICouFOUIwXF91TyRkWhjXSeVj5ubUcdT32eJ7XQus1hIe/iOCCiaRjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1YU3urRyxi0AU7JO/yRThXUH6V/RVJGRWy5J9OesclqUr2Woc
 L++FBDRoxRmdoXq4UHo9TUkJYlhetboSVRdSkGHRF7JggMb3H8La4Ji1gMlWwmI=
X-Google-Smtp-Source: AGHT+IGhRRSH+oniiEMk6gBxA1VDr8hXYtyBVOVbECHZq5NiyEASc4rpB50zkmMNgG6T0wMWjBuJiA==
X-Received: by 2002:a05:6402:278c:b0:5c9:709c:247f with SMTP id
 4fb4d7f45d1cf-5cb8ac380damr4405184a12.2.1729766825261; 
 Thu, 24 Oct 2024 03:47:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72866sm5525261a12.95.2024.10.24.03.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:47:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mxsfb: Remove generic DRM drivers in probe function
Date: Thu, 24 Oct 2024 12:46:49 +0200
Message-ID: <20241024104654.3483125-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Use aperture helpers to remove all generic graphics drivers before
loading mxsfb. Makes mxsfb compatible with simpledrm.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index cb5ce4e81fc7..a8d6dffcd02c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -360,6 +361,15 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	/*
+	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
+	 * located anywhere in RAM
+	 */
+	ret = drm_aperture_remove_framebuffers(&mxsfb_driver);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't kick out existing framebuffers\n");
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
-- 
2.43.0

