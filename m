Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E124176738
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB22E6E8C1;
	Mon,  2 Mar 2020 22:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C60A6E8B9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f15so839342wml.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=erEXF4Xm4629JWMbZ49IZaYIxRvUjIX2G6UIjBSsU7c=;
 b=jvMOXgeVcpvSdRlnos3VQCeybzeHpbVsGe9UPQB9QUAIN8JOq3fb5CSpXhW9UPHKzS
 cu1fkhFPJoBFEiOi5PJhm/ENIvbr9Te68a/AaaLjtZFbHw95Sd52mGY3JR7L/C0O8YV7
 wXyI0qhc4Yz6z0WV066LwcHujiQX7OTgT2iqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=erEXF4Xm4629JWMbZ49IZaYIxRvUjIX2G6UIjBSsU7c=;
 b=a87LeQUjlCSbO3ABlRibE91BUAPzP87An/sy8KqC4jlcY7JDJ8mfc610uP5PcqrFCD
 9OwL5wfYUbJb49pxsFdE0Hml+7iGg2Pn5DwaJOq+bQAsXe7kcacCXsDc2ZZEhwSzs9x8
 YUQwmeyyV92sECvW5KBKdUK0+c/w8bX4PjGJbrYtPeP0qfW3vD/3dWGX/QgNNnN0SWVp
 7WLhctApUl7Tqicq1hYQdMFFl8AzYp/yX+LUcudMXYYC0HKhKKL/9+eTLMvQSomyFkmd
 F1Mxop3xMRPIyEptqdy68d1mDnYkCqEbwf+eEwmT7dWGM+UtaQd+9tSrPz+Swf+OYhOJ
 b4Zw==
X-Gm-Message-State: ANhLgQ3hxD40EWc/h6qA6TrBqEiuA0I7xIt8n7VAmBzOS53qpN36dhDB
 BiYPJr42rQUAKvxLzkMLZYcEN1h+9eQ=
X-Google-Smtp-Source: ADFU+vvDS5yISWFHX4HHMxuKtDPSOL7PAFJ7bcah6ecgUCD85TlmMN9egrB90pTApb6sQl5BZzAiyQ==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr516847wml.178.1583188041786; 
 Mon, 02 Mar 2020 14:27:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:21 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/51] drm/mcde: More devm_drm_dev_init
Date: Mon,  2 Mar 2020 23:26:13 +0100
Message-Id: <20200302222631.3861340-34-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Auto-unwind ftw, now possible with the fixed drm_device related
management.

Aside, clk/regulator seem to be missing devm versions for a bunch of
functions, preventing a pile of these simpler drivers from outright
losing their ->remove hook.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 03d2e1a00810..88cc6b4a7a64 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -312,7 +312,7 @@ static int mcde_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	mcde->dev = dev;
 
-	ret = drm_dev_init(&mcde->drm, &mcde_drm_driver, dev);
+	ret = devm_drm_dev_init(dev, &mcde->drm, &mcde_drm_driver);
 	if (ret) {
 		kfree(mcde);
 		return ret;
@@ -331,12 +331,12 @@ static int mcde_probe(struct platform_device *pdev)
 	if (IS_ERR(mcde->epod)) {
 		ret = PTR_ERR(mcde->epod);
 		dev_err(dev, "can't get EPOD regulator\n");
-		goto dev_unref;
+		return ret;
 	}
 	ret = regulator_enable(mcde->epod);
 	if (ret) {
 		dev_err(dev, "can't enable EPOD regulator\n");
-		goto dev_unref;
+		return ret;
 	}
 	mcde->vana = devm_regulator_get(dev, "vana");
 	if (IS_ERR(mcde->vana)) {
@@ -487,8 +487,6 @@ static int mcde_probe(struct platform_device *pdev)
 	regulator_disable(mcde->vana);
 regulator_epod_off:
 	regulator_disable(mcde->epod);
-dev_unref:
-	drm_dev_put(drm);
 	return ret;
 
 }
@@ -502,7 +500,6 @@ static int mcde_remove(struct platform_device *pdev)
 	clk_disable_unprepare(mcde->mcde_clk);
 	regulator_disable(mcde->vana);
 	regulator_disable(mcde->epod);
-	drm_dev_put(drm);
 
 	return 0;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
