Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0C6F395C
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 22:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072D310E323;
	Mon,  1 May 2023 20:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986CD10E31E;
 Mon,  1 May 2023 20:49:02 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-51f597c975fso2621693a12.0; 
 Mon, 01 May 2023 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682974141; x=1685566141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yrpkk3Sln1BfUzTLrfKS+qGalYKNceGYbt+PajDz7JE=;
 b=LwMOlCkHS/IvZss0JuI//8/N2tvJrdWeJnNbCL1pIvd19VBHN1UzVzplmYl3xroLCU
 JR4czU2kpH88dxIT5OYfmI4z9TkVvkz3vNoge5f8M5TOALCCIX2F2T/M7N/fTSahihK2
 LtYravaK1W3Walt+xHZnTXT8Y6G8zW0dNSRKzJ0QzqDmyqTzYKsqqge9fclK8OMD4fks
 8bkHzOTG5u8c1VTCJI0tBqtRIWW2X7L6GmqnoDFfyokXpsie7SF8pT35pSEymK9CfGev
 ra2IJP11u0Z5MFJ7KJ5ll4LisZQ+nKbIKPM7v6fIPrlkNahR94GNhTwPO6T9oQcVc61U
 3CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682974141; x=1685566141;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yrpkk3Sln1BfUzTLrfKS+qGalYKNceGYbt+PajDz7JE=;
 b=TcjEOUcTpOZ45dvTIdEco183xBNeFCNXJzJhm1TZl1ZSDMzKHhvTikUyNFeXqj+Xt2
 SC/DGH1ZpahEJ8RiFGP0DkI1+JFDXILyg7XtQeDO77R/ziP+QIwo3GrGeBvqxXxFHX90
 bRDpb/dFRNlTug7KFtg4Hg0DcTxo1Xh5XKjD3Gr9Eu8bndUAoA4F7C1WFyTPf5119D9R
 lRJQBUeZpAtapZZjB1yQ9VoLrJwmS5Zm7nTnrpV0MxF/891rT8rrquGRBArZLkYOQNoV
 DhwiInRjtQ28g4iSdXsFs+qVAcokLPV9FndoRl1c3CfMLjNZoev27aImARzHSKJZSJ9W
 MltA==
X-Gm-Message-State: AC+VfDzV5SZMKfMiaZqzru87hGEHdKbJOAdiHU8fltfWCchS/0xohoeA
 FdLxHbXy/23jJkUuwu1KMA7a0dRuK3o=
X-Google-Smtp-Source: ACHHUZ4CpF61pOumZppCHf855z3eVwAfKeK/Eq8QSFabGphIKLWcJpN6RSjIsrLEOni4ZxAKXiuVPQ==
X-Received: by 2002:a17:90b:617:b0:24b:5a08:5cb6 with SMTP id
 gb23-20020a17090b061700b0024b5a085cb6mr15493832pjb.19.1682974141485; 
 Mon, 01 May 2023 13:49:01 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a63c145000000b0051ba9d772f9sm17721910pgi.59.2023.05.01.13.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 13:49:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Set max segment size earlier
Date: Mon,  1 May 2023 13:44:41 -0700
Message-Id: <20230501204441.1642741-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes the following splat on a6xx gen2+ (a640, a650, a660 families),
a6xx gen1 has smaller GMU allocations so they fit under the default
64K max segment size.

   ------------[ cut here ]------------
   DMA-API: msm_dpu ae01000.display-controller: mapping sg segment longer than device claims to support [len=126976] [max=65536]
   WARNING: CPU: 5 PID: 9 at kernel/dma/debug.c:1160 debug_dma_map_sg+0x288/0x314
   Modules linked in:
   CPU: 5 PID: 9 Comm: kworker/u16:0 Not tainted 6.3.0-rc2-debug+ #629
   Hardware name: Google Villager (rev1+) with LTE (DT)
   Workqueue: events_unbound deferred_probe_work_func
   pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : debug_dma_map_sg+0x288/0x314
   lr : debug_dma_map_sg+0x288/0x314
   sp : ffffffc00809b560
   x29: ffffffc00809b560 x28: 0000000000000060 x27: 0000000000000000
   x26: 0000000000010000 x25: 0000000000000004 x24: 0000000000000004
   x23: ffffffffffffffff x22: ffffffdb31693cc0 x21: ffffff8080935800
   x20: ffffff8087417400 x19: ffffff8087a45010 x18: 0000000000000000
   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000010000
   x14: 0000000000000001 x13: ffffffffffffffff x12: ffffffffffffffff
   x11: 0000000000000000 x10: 000000000000000a x9 : ffffffdb2ff05e14
   x8 : ffffffdb31275000 x7 : ffffffdb2ff08908 x6 : 0000000000000000
   x5 : 0000000000000001 x4 : ffffffdb2ff08a74 x3 : ffffffdb31275008
   x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff80803a9a80
   Call trace:
    debug_dma_map_sg+0x288/0x314
    __dma_map_sg_attrs+0x80/0xe4
    dma_map_sgtable+0x30/0x4c
    get_pages+0x1d4/0x1e4
    msm_gem_pin_pages_locked+0xbc/0xf8
    msm_gem_pin_vma_locked+0x58/0xa0
    msm_gem_get_and_pin_iova_range+0x98/0xac
    a6xx_gmu_memory_alloc+0x7c/0x128
    a6xx_gmu_init+0x16c/0x9b0
    a6xx_gpu_init+0x38c/0x3e4
    adreno_bind+0x214/0x264
    component_bind_all+0x128/0x1f8
    msm_drm_bind+0x2b8/0x608
    try_to_bring_up_aggregate_device+0x88/0x1a4
    __component_add+0xec/0x13c
    component_add+0x1c/0x28
    dp_display_probe+0x3f8/0x43c
    platform_probe+0x70/0xc4
    really_probe+0x148/0x280
    __driver_probe_device+0xc8/0xe0
    driver_probe_device+0x44/0x100
    __device_attach_driver+0x64/0xdc
    bus_for_each_drv+0xb0/0xd8
    __device_attach+0xd8/0x168
    device_initial_probe+0x1c/0x28
    bus_probe_device+0x44/0xb0
    deferred_probe_work_func+0xc8/0xe0
    process_one_work+0x2e0/0x488
    process_scheduled_works+0x4c/0x50
    worker_thread+0x218/0x274
    kthread+0xf0/0x100
    ret_from_fork+0x10/0x20
   irq event stamp: 293712
   hardirqs last  enabled at (293711): [<ffffffdb2ff0893c>] vprintk_emit+0x160/0x25c
   hardirqs last disabled at (293712): [<ffffffdb30b48130>] el1_dbg+0x24/0x80
   softirqs last  enabled at (279520): [<ffffffdb2fe10420>] __do_softirq+0x21c/0x4bc
   softirqs last disabled at (279515): [<ffffffdb2fe16708>] ____do_softirq+0x18/0x24
   ---[ end trace 0000000000000000 ]---

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3a74b5653e96..6dec1a3534f2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -440,27 +440,27 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	fs_reclaim_acquire(GFP_KERNEL);
 	might_lock(&priv->lru.lock);
 	fs_reclaim_release(GFP_KERNEL);
 
 	drm_mode_config_init(ddev);
 
 	ret = msm_init_vram(ddev);
 	if (ret)
 		goto err_drm_dev_put;
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	/* Bind all our sub-components: */
 	ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_drm_dev_put;
 
-	dma_set_max_seg_size(dev, UINT_MAX);
-
 	msm_gem_shrinker_init(ddev);
 
 	if (priv->kms_init) {
 		ret = priv->kms_init(ddev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to load kms\n");
 			priv->kms = NULL;
 			goto err_msm_uninit;
 		}
 		kms = priv->kms;
-- 
2.39.2

