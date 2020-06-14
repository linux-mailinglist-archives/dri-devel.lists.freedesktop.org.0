Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CE1F8FDD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6726E293;
	Mon, 15 Jun 2020 07:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEC06E0E4;
 Sun, 14 Jun 2020 06:46:08 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id p20so14467350iop.11;
 Sat, 13 Jun 2020 23:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kNRgWSDrAxCQwXvPM8GfVhkSvHW0aGR2LY+D+JUgFPs=;
 b=tpz6lloDe6hYvlh6jsWmIipsRXWnPP0UiedPptwWGRKELFOHp/S4yk/xo3VPtk7RBd
 b8BFXR91yWxOWHo61kM6nPkTbM42uoBFw9J9MkGRlwsK++gjZyLouPCkub8FImugIyHD
 gQjzKQI8AU15T1efls+KhXfuI7SJm/+61arQDI1rwg80tqlkK3ojzpFaaHplhjzAWxxH
 qFdeORV4dtDSkk3i0W8wPQ1LR0WFdLrLCXWjQ4lqnaD+NOx5lYGizDu4Jng23mrTwoD+
 35vusyT4LgYIvIyLsCA3X3CVASUFkJSCVowZ7588w2xOJiYWn+WtI+MShm6sx1TzcyvN
 jh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kNRgWSDrAxCQwXvPM8GfVhkSvHW0aGR2LY+D+JUgFPs=;
 b=JxkheDoVG6INO85yhgeZD81idx7WsEI08jRrWESuZzC3AePoZw+GE7k+Ck0uS4Nba7
 SPxsXYpvSVHHoAUw98smD21AFaOf/axYgo2rXFQSgKx2lAtiXzdTqVa7yaRBktsGVTkV
 ptz2ZIHPrMLi+CYtmYrBxrOlqlOWiKm2Dwx3NN5d9OcABmYUJMMmjwAIHKramMH49HT0
 C6ibF8zNyR8oEGSDxO8l2SbPNr15GCeNE2UWznNGEWlmdRxeNB19L2Nyp3iWwpjVAn8S
 rkjQErDIjV9qiP5Zr0kd2lB4nInx30JjYRltCouj+oYQkxfs3hjZW7nqcC8wmh5gRaSO
 9O5w==
X-Gm-Message-State: AOAM532QPnQGAIB6fiXd+dRx3DfE2hDOCCkS13CfMD2xK5gcyyeQfjxk
 I53XwZKisob058LMypFnRFfI9et3dSo=
X-Google-Smtp-Source: ABdhPJxsK9CUvgdKD6ZCZBAqfWYD1gdpJNSlmVez8DOhmPECL9S8rEWBfYR3H4BqgrwtUNAZdstTGw==
X-Received: by 2002:a05:6602:22d6:: with SMTP id
 e22mr21867513ioe.128.1592117167830; 
 Sat, 13 Jun 2020 23:46:07 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id m5sm5744932ioj.52.2020.06.13.23.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:46:07 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: fix ref count leak via pm_runtime_get_sync
Date: Sun, 14 Jun 2020 01:46:01 -0500
Message-Id: <20200614064601.7872-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in etnaviv_gpu_submit, etnaviv_gpu_recover_hang, etnaviv_gpu_debugfs,
and etnaviv_gpu_init the call to pm_runtime_get_sync increments the
counter even in case of failure, leading to incorrect ref count.
In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a31eeff2b297..16f5bc65771a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -722,7 +722,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	ret = pm_runtime_get_sync(gpu->dev);
 	if (ret < 0) {
 		dev_err(gpu->dev, "Failed to enable GPU power domain\n");
-		return ret;
+		goto pm_put;
 	}
 
 	etnaviv_hw_identify(gpu);
@@ -819,6 +819,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 
 fail:
 	pm_runtime_mark_last_busy(gpu->dev);
+pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 
 	return ret;
@@ -859,7 +860,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 	ret = pm_runtime_get_sync(gpu->dev);
 	if (ret < 0)
-		return ret;
+		goto pm_put;
 
 	dma_lo = gpu_read(gpu, VIVS_FE_DMA_LOW);
 	dma_hi = gpu_read(gpu, VIVS_FE_DMA_HIGH);
@@ -1003,6 +1004,7 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
 	ret = 0;
 
 	pm_runtime_mark_last_busy(gpu->dev);
+pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 
 	return ret;
@@ -1016,7 +1018,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
 	dev_err(gpu->dev, "recover hung GPU!\n");
 
 	if (pm_runtime_get_sync(gpu->dev) < 0)
-		return;
+		goto pm_put;
 
 	mutex_lock(&gpu->lock);
 
@@ -1035,6 +1037,7 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
 
 	mutex_unlock(&gpu->lock);
 	pm_runtime_mark_last_busy(gpu->dev);
+pm_put:
 	pm_runtime_put_autosuspend(gpu->dev);
 }
 
@@ -1308,8 +1311,10 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 
 	if (!submit->runtime_resumed) {
 		ret = pm_runtime_get_sync(gpu->dev);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put(gpu->dev);
 			return NULL;
+		}
 		submit->runtime_resumed = true;
 	}
 
@@ -1326,6 +1331,7 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 	ret = event_alloc(gpu, nr_events, event);
 	if (ret) {
 		DRM_ERROR("no free events\n");
+		pm_runtime_put(gpu->dev);
 		return NULL;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
