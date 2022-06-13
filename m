Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C0549B52
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 20:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E5410F609;
	Mon, 13 Jun 2022 18:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5D310F604;
 Mon, 13 Jun 2022 18:20:31 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id f65so6257020pgc.7;
 Mon, 13 Jun 2022 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HPIFmqCq08/SpFCwk6A8CEBBfhPP5/Wk5un3Ts1xf9s=;
 b=E+wZjHmzh6EFZ9vKKG60lhqV9ZhJSRLQp2p8vF8yQi4Je1eGft2sy33hBoAmrBsGSA
 X+a6C0rVHwzy99s9ZjqLnj+XDUnhTzAQBZsG01edG+So9XfvQrvAgBL96y+R1ejuSFsx
 x3yViwfQT7IFJ6pt/1+k8s23lwJMdtNZEHe4UnDg5W6JndgtKkmGrKXoeDr5SI5lhtRS
 j6Knod7c94L7jH4fi3bb8yG6CyiXRYMlw8H7vswIff9sGaWOCRbSyR8yJsUC4+dNFtIL
 yYv6rEISd3QnsoBtHnUaT/Z1R2ftY2pPB5WUY6Y/ez5Dxlonzaziy/zWgyK1Xenvtpwk
 a71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HPIFmqCq08/SpFCwk6A8CEBBfhPP5/Wk5un3Ts1xf9s=;
 b=GRXgHV3w87p8hEZbtyEzvD9R6if0H+EHy85rSo0zielABMzb0AYVd250TWCnwIYjPD
 c56fpr0xYXR1y+H1YKh5XrzBlrXJidnaFOUyQkJdfi0ECFrk8aeSqzTLs+vmKdLq8uTS
 F6QjekMK3u/PtERNwSTHfhn5svCjrUgJgXH5Ne2gBwS0bJZAFWqdat5vOo4Q3pQ6n29P
 fEsVmjA0GLSnYUO/a67iH2Mr/m4IVBTB2z6MenyP4b7GhBba90ZHh5vcskTq4i/leCtK
 eKNHRyd+MTza8gmHbdG4FN+HOZum+RJVlQhHOesxYbjzo+JIXsCL6HGpbr4aKahHBwvw
 QJVA==
X-Gm-Message-State: AOAM5323DfEi2NgxBbhROlAJ50h/IbWBp8F5IKg6gbVAzWBTutEeWbdM
 yOjffjY5c20JxpTY8dYtWNdLkdqhLVM=
X-Google-Smtp-Source: ABdhPJwoCFy7Fg7AXQdm2sHljb364JgGjZxqDMO5nnl8BckmDA+So8WCDRoR5nCyZC6DzDAyDDrvcg==
X-Received: by 2002:a63:483:0:b0:3fc:9128:60a5 with SMTP id
 125-20020a630483000000b003fc912860a5mr790658pge.606.1655144430244; 
 Mon, 13 Jun 2022 11:20:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 z11-20020aa7958b000000b0051bdb735647sm5737882pfj.159.2022.06.13.11.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 11:20:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: Defer enabling runpm until hw_init()
Date: Mon, 13 Jun 2022 11:20:30 -0700
Message-Id: <20220613182036.2567963-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

To avoid preventing the display from coming up before the rootfs is
mounted, without resorting to packing fw in the initrd, the GPU has
this limbo state where the device is probed, but we aren't ready to
start sending commands to it.  This is particularly problematic for
a6xx, since the GMU (which requires fw to be loaded) is the one that
is controlling the power/clk/icc votes.

So defer enabling runpm until we are ready to call gpu->hw_init(),
as that is a point where we know we have all the needed fw and are
ready to start sending commands to the coproc's.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 8706bcdd1472..7cef8ae73c71 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -415,6 +415,12 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	if (ret)
 		return NULL;
 
+	/*
+	 * Now that we have firmware loaded, and are ready to begin
+	 * booting the gpu, go ahead and enable runpm:
+	 */
+	pm_runtime_enable(&pdev->dev);
+
 	/* Make sure pm runtime is active and reset any previous errors */
 	pm_runtime_set_active(&pdev->dev);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4e665c806a14..e1aef4875e2f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1042,7 +1042,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	pm_runtime_set_autosuspend_delay(dev,
 		adreno_gpu->info->inactive_period);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_enable(dev);
 
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
 			gpu_name, &adreno_gpu_config);
-- 
2.36.1

