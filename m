Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39431688F0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07C56F580;
	Fri, 21 Feb 2020 21:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201C76F528
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:04:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g3so3511649wrs.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nbkcQmHjcnN5+weCBzORnysUX3jWPwOIJlR7jZYk5A=;
 b=TeiTIYgWktvBHQCOikl6FDJX2ACvSjXxZ4SsCclbfP7ibVuCw5FMCD8fylA4sVJTqq
 GjG5d8P7Ss9wywe2WAhMYhOtmLpw2Gic/lMMqj8IpaJuoX/LUoAoupLedaM9nIC03fHe
 N6+LpOJimU12spz+iYzrwhala/72K+4OT9VE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nbkcQmHjcnN5+weCBzORnysUX3jWPwOIJlR7jZYk5A=;
 b=JLSxnoL1pKmLctATcIS/BYgDFACzuAEcoeK3PPsIjPi2/PbWC6+wbqVw5h/k2ALdig
 ds44oi5d+Q6i5XzqENWqI9S0l/v4KDNmjMIBX6pHcV/lB59hk161RfwvRvDdPnT652Mm
 Lu8iemL8bGPmI/lmU+OM9E5OFSDTH8rpgrvysyyZfGAzy90B7wgEV6towLVQPs8sdG+D
 Fl+IW3FDz3vsJ4r4z7MrNuQWulV5vv/gM6f+mhqH0I7Zpne/ny2MVYm9lIMBSd3Z/GYL
 jmwloNAH+LrvgeG8l/EKaEL8e2yvO0A1TKxcdExWgxGCIYnbTV6YMz9t0XAU4DPHDKnh
 6fYA==
X-Gm-Message-State: APjAAAWQ1LFW1FbzGUd5N8dqB5Cxfh8ic+LtW7wvzRlrci/7lNL7smCn
 qtZZBjow+q4C7ZyEgNRgi8CRZ39CN4s=
X-Google-Smtp-Source: APXvYqyNzD4vBsy29EfuymYbabbsGjCGwNJw/WbSbmAZtcAKjek6u8qI/+mIws8LC8TRAnSsfvMPGw==
X-Received: by 2002:a5d:5221:: with SMTP id i1mr47142624wra.44.1582319061278; 
 Fri, 21 Feb 2020 13:04:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:20 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 40/51] drm/mtk: Drop explicit drm_mode_config_cleanup call
Date: Fri, 21 Feb 2020 22:03:08 +0100
Message-Id: <20200221210319.2245170-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
