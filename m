Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959376ABB05
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C7D10E206;
	Mon,  6 Mar 2023 10:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B0F10E1EB;
 Mon,  6 Mar 2023 10:09:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2226560D39;
 Mon,  6 Mar 2023 10:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA50C433D2;
 Mon,  6 Mar 2023 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678097358;
 bh=O0hTTeG0QACttF+fPXxT6uAirlSnSJBFPVa+P9Yvy/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qpjXXYZIym9UdjFV6O62sj5OjqtochKZULP2b69pLqWSCTZNQTzEejftf/Z7xMj0K
 qfsZ4PZpmX+tYN3oYGAB2oDZuHylS83gOPYBaUoyh5HF7MgG9uT3qsSugcjOfe+vy4
 VswTjv9xErBdJ8T3bzmaBp5lmGsn4cZRspEuUdIbnT8+1bjgMHrFuSxSPWO6J4wUhv
 NE+MnaJlKa4TFAoTOwRp7xETj1Mr/hyYDrqIZ/Tvwzv3citvV+MgJO2Y5xKyMN/L4F
 WHqUgVUdAR55D3A7M7Ppo+yJA15ZEmQqmwnWQDnaaB0nWraF0ECtvVM58FV5A90vBN
 n7dfvW3Y41CJQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pZ7n5-0007Qd-4T; Mon, 06 Mar 2023 11:09:59 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 02/10] Revert "drm/msm: Fix failure paths in msm_drm_init()"
Date: Mon,  6 Mar 2023 11:07:14 +0100
Message-Id: <20230306100722.28485-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306100722.28485-1-johan+linaro@kernel.org>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 8636500300a01740d92b345c680b036b94555b1b.

A recent commit tried to address a drm device leak in the early
msm_drm_uninit() error paths but ended up making things worse.

Specifically, it moved the drm device reference put in msm_drm_uninit()
to msm_drm_init() which means that the drm would now be leaked on normal
unbind.

For reasons that were never spelled out, it also added kms NULL pointer
checks to a couple of helper functions that had nothing to do with the
paths modified by the patch.

Instead of trying to salvage this incrementally, let's revert the bad
commit so that clean and backportable fixes can be added in its place.

Fixes: 8636500300a0 ("drm/msm: Fix failure paths in msm_drm_init()")
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c |  3 ---
 drivers/gpu/drm/msm/msm_drv.c                | 11 ++++-------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index b73031cd48e4..e75b97127c0d 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -129,9 +129,6 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
 	}
 
 	priv = drm_dev->dev_private;
-	if (!priv->kms)
-		return;
-
 	kms = priv->kms;
 
 	if (kms->dump_worker)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b7f5a78eadd4..9ded384acba4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -150,9 +150,6 @@ static void msm_irq_uninstall(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 
-	if (!priv->kms)
-		return;
-
 	kms->funcs->irq_uninstall(kms);
 	if (kms->irq_requested)
 		free_irq(kms->irq, dev);
@@ -270,6 +267,8 @@ static int msm_drm_uninit(struct device *dev)
 	component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
+	drm_dev_put(ddev);
+
 	destroy_workqueue(priv->wq);
 
 	return 0;
@@ -442,12 +441,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_drm_dev_put;
+		return ret;
 
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
-		goto err_drm_dev_put;
+		return ret;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -542,8 +541,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_msm_uninit:
 	msm_drm_uninit(dev);
-err_drm_dev_put:
-	drm_dev_put(ddev);
 	return ret;
 }
 
-- 
2.39.2

