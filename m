Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23541641CE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D746EB93;
	Wed, 19 Feb 2020 10:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB276EB67
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so5842093wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=25vbzSayYz4tsCja4oEl0jjU6qa/C5eQdgPoX3+bMwY=;
 b=aJdVPPvsEUM5Tgxf6K0zcH/K52kY4hhceMEQd6fmmXDplDdNIW2TMRK/3nZealgjUC
 iAycdS/aUX6Bx+cYjK1wtrgGx2Tsza/vsP8Sizag6bJMMhZCA9flNGWITQl7uAdyEFjW
 QokwF2+JtveLHWv0RitgROB4rCbY58l3E5bcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=25vbzSayYz4tsCja4oEl0jjU6qa/C5eQdgPoX3+bMwY=;
 b=kq1YD2M2ckz6/38GVADP/aPNrW8XxSI61o6hrsS8bU0Lu44J2eLrqrNLtTFcQjhvGx
 UGdlVfQj+u3h9MukO9gE5cbF0NYWRvNrXTribyGoJDCCx5oqQRtNm49uUbOR+wsXIfv3
 WnL6J589hytQc3tmVionXTIHkEBHC8T7J/XNhf7UacDbQmkh/+McP1xsFU07KPonbX1R
 0wFAqM5x7TR1bSQd8BhGaNytqVw4EXCqqftWbMV+6U+dS+XYbqd0WdMRrn9pHAiSZf8T
 sQFHBl5/+ONwuU/F5tm3ZNcyIgRtkg1ZIAzC580PKaJfQuWC7fK6Y7/sT/jUJxZvIIAG
 bJGQ==
X-Gm-Message-State: APjAAAUuJcar0AaESOrIWtdnr8TR48ch8s301UZsC8HWFJe0FAT8vpdy
 k5+Gm98v5cpibGXEnLYT0CIm7/FReco=
X-Google-Smtp-Source: APXvYqxXa0sdtFfSIHju33zRj3mM4bQHwhFa/kr5DYYF2IAo2ujg6UM+ukDH4e9O8EdGCR92VeC2ZA==
X-Received: by 2002:a1c:df09:: with SMTP id w9mr8646262wmg.143.1582107731751; 
 Wed, 19 Feb 2020 02:22:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:11 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/52] drm/mcde: More devm_drm_dev_init
Date: Wed, 19 Feb 2020 11:21:04 +0100
Message-Id: <20200219102122.1607365-35-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index b8ca99995e51..3e92a44397cf 100644
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
