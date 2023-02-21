Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A92A69DDAA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 11:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2190010E159;
	Tue, 21 Feb 2023 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984C510E15A;
 Tue, 21 Feb 2023 10:16:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAEBE60FC1;
 Tue, 21 Feb 2023 10:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57961C433EF;
 Tue, 21 Feb 2023 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676974605;
 bh=rsIBiufyPVeN/iiBVMiUsYKGl4amMszJEzKK1e3KNPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UxVTeCgQv7nr7fYeRtAYvutvyfzn2nEPwWXUgm5gZhaSUjA5fv+/yLOaoWghcY3gw
 Jo0MgAIQgCMPKgLsPh6eCP5d1g8ZZyXEYFZvoPLom5oeoEtXstfg54huEzCDIU2IMK
 SO8XmIZukdkDZDbt7ZGjA6IfildbkNuJPq9fydFZ3N1YTxYd6F7i8v+0E/xSuEPQl4
 7VgVHwizHTh6QBb5IM4bnoM6kKdvXlubmLzUhY+xGJzD6+TqtWDaGOr1+e7tZ2ImzN
 SmafOtsH99Wa2sH/tDjbJ37zsyJbgJauoNmdk1TIPU6kUc8oegUBXWLvgKYeDDGufB
 /NkwxzCndLo2Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pUPhX-0003oF-WE; Tue, 21 Feb 2023 11:16:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/4] drm/msm/adreno: fix runtime PM imbalance at unbind
Date: Tue, 21 Feb 2023 11:14:27 +0100
Message-Id: <20230221101430.14546-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221101430.14546-1-johan+linaro@kernel.org>
References: <20230221101430.14546-1-johan+linaro@kernel.org>
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A recent commit moved enabling of runtime PM from adreno_gpu_init() to
adreno_load_gpu() (called on first open()), which means that unbind()
may now be called with runtime PM disabled in case the device was never
opened in between.

Make sure to only forcibly suspend and disable runtime PM at unbind() in
case runtime PM has been enabled to prevent a disable count imbalance.

This specifically avoids leaving runtime PM disabled when the device
is later opened after a successful bind:

	msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* Couldn't power up the GPU: -13

Fixes: 4b18299b3365 ("drm/msm/adreno: Defer enabling runpm until hw_init()")
Reported-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Link: https://lore.kernel.org/lkml/20230203181245.3523937-1-quic_bjorande@quicinc.com
Cc: stable@vger.kernel.org	# 6.0
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..c5c4c93b3689 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -558,7 +558,8 @@ static void adreno_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 
-	WARN_ON_ONCE(adreno_system_suspend(dev));
+	if (pm_runtime_enabled(dev))
+		WARN_ON_ONCE(adreno_system_suspend(dev));
 	gpu->funcs->destroy(gpu);
 
 	priv->gpu_pdev = NULL;
-- 
2.39.2

