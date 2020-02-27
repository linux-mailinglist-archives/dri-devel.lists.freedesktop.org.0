Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E41726BA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AAF6ED20;
	Thu, 27 Feb 2020 18:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663886E96D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p18so4607663wre.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nbkcQmHjcnN5+weCBzORnysUX3jWPwOIJlR7jZYk5A=;
 b=M5s+yCTumasc++lLFEYfl9Hfsm7Rkit6kMwr1LkOsK2+hvdyBuEZp/TNcn0UnFgPVD
 WuTUEXjWlJXxNLsbE/ovEkdqTfLqHG7ho/0jXoZ406DFm3abdn9mkUPzlGrYsonkahsY
 WSp4TG7LlShsf9tDmu60xwuX3FTScIejhdqds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nbkcQmHjcnN5+weCBzORnysUX3jWPwOIJlR7jZYk5A=;
 b=YxpnHqaueoEw6zFVfC6Lep38HnviOkCHmFqG+/VHhjLcTBNYckbDf/Pj1JVSCUhRTV
 nd8mrVSnhP01ByAWaxjbrmMntQzlkPSXDvPtbvVskcCcvX7X50ON/HpE1JoDsZ2K6q8S
 OExRoOqqh38yQ7kvCPgk94TCK8SlktchpdsdifbmL3IxLy/QbzmDGwzgLA9vnk6/YyFw
 moWuVRh0Rxbq9/tSma0IS7rJPv1QbUoKOuJHIssJN0Zft81GcMRED0Vh4tWTpeRqJQko
 GoUR9Y300OSWHoktPHaoqefhQOKzh34JnyLhcV0gcFeAA+fUeiozvC5NGKz0kZgXnAle
 13vw==
X-Gm-Message-State: APjAAAXyJ1JWPCxdzc1AK7JSZY3Hcym3sTMNX37SDgouplJHdZ8yULhk
 egBm/aJ/OKva9N33Pa4RfWppBHonLR4=
X-Google-Smtp-Source: APXvYqzw3J7BBL7p6DywPG3CFcO6rWDUnN5m82YBtt4eSLgde0yEX+3oPCHwCMG8XwDZW/2kSIrQJw==
X-Received: by 2002:adf:db84:: with SMTP id u4mr99029wri.317.1582827380741;
 Thu, 27 Feb 2020 10:16:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:20 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 40/51] drm/mtk: Drop explicit drm_mode_config_cleanup call
Date: Thu, 27 Feb 2020 19:15:11 +0100
Message-Id: <20200227181522.2711142-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 m.felsch@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

v2: Explain why this cleanup is possible (Laurent).

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0563c6813333..947b2cbe2836 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -162,7 +162,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 	private->mutex_dev = &pdev->dev;
 
-	drm_mode_config_init(drm);
+	ret = drm_mode_config_init(drm);
+	if (ret)
+		return ret;
 
 	drm->mode_config.min_width = 64;
 	drm->mode_config.min_height = 64;
@@ -179,7 +181,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
-		goto err_config_cleanup;
+		return ret;
 
 	/*
 	 * We currently support two fixed data streams, each optional,
@@ -255,8 +257,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		dma_dev->dma_parms = NULL;
 err_component_unbind:
 	component_unbind_all(drm->dev, drm);
-err_config_cleanup:
-	drm_mode_config_cleanup(drm);
 
 	return ret;
 }
@@ -272,7 +272,6 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 		private->dma_dev->dma_parms = NULL;
 
 	component_unbind_all(drm->dev, drm);
-	drm_mode_config_cleanup(drm);
 }
 
 static const struct file_operations mtk_drm_fops = {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
