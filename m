Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA218F79E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565776E25F;
	Mon, 23 Mar 2020 14:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AEF6E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l20so15140646wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TwIKaoFfSnQk2NkTWDCKAzmUuFCPuVd1OMqVtV6CuJo=;
 b=ZcgwHJQTh/nunwDSuu00bHnX0xMy+wf7KqDYkMEsZFJ4Uk99IOAXY4MkaXvd4QJGlr
 Wd/8Y3i46dJwat/MFVOtpcZzOKv8Nu+GbOSXgAYZPWCNIoFd5S4RgI+ZPkjXdjKNWUG0
 ymb6BocOsM+/Eb9d7A9usllxnsGUqW8EAlYCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TwIKaoFfSnQk2NkTWDCKAzmUuFCPuVd1OMqVtV6CuJo=;
 b=XPUclfJbbdVsVCzHTmcgnDePN8pJlJy/wI+fL40bnK3GkDmzrWaduH1H5+xg9sh4j0
 1Zxih4FmfXojFzxbXmuICmByCT1G5kiSYmeoPQ9UAPYhPH97wbIs4FF9J2x7LQJAXQXY
 O1fNcuPFD8WBFmBPsYDPwNQXARMcnZpyftpgnaHK87V4P7UlcrTbvEdX1wJ+xy0bIVWx
 N914FHMZDKV1zg4DHdsRrd2jDlPcnlXWBvgX0J11n8/8gfgGYhJBb9SmPNinv0zmCZBv
 5t6SQwWTCASQl1cTSydrwFQEWfKQT0IHwphmSakErNBnUlhJEdEvyVkwPRe4WBCYm8YA
 gSZg==
X-Gm-Message-State: ANhLgQ11pI1QKG6SUUBlA9jXOR7E17u58lFehas8G+lj9/9Gml91MiCZ
 Rr5T/aRS8P98MnpxQENMewUs3/CJFFysKw==
X-Google-Smtp-Source: ADFU+vtyxUMvJFS2AR8iQeCZV0+q51I3mVA29jaLKRlAH7EUli/4Gg11iUXCoGhyYagovb+d1HUMnw==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
 l14mr13065992wmd.161.1584975043007; 
 Mon, 23 Mar 2020 07:50:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 33/51] drm/mcde: More devm_drm_dev_init
Date: Mon, 23 Mar 2020 15:49:32 +0100
Message-Id: <20200323144950.3018436-34-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
