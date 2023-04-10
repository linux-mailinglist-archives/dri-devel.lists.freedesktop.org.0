Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967966DC9A2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B65C10E137;
	Mon, 10 Apr 2023 16:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6130F10E0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 16:59:11 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m4so6972666lfj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681145949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gXiDfkYfooUpnGwSKLtfoTSJftcs9O4vAnZuQK+rVXk=;
 b=samIoF+YB5snEF+a3K6pJ7Fvv8KyMFQS6m5d8amu0tuVsz1wcybNfUgZT1kb5KrJg9
 97FF/Iv41Zy2XAaDN1/9nQTUSXf2/y5dp3PteYszD1xU8pGqYtQitVEIrwNXXAy9k3cc
 mk4rvhz0QMcO/Wc6qU3C9W/Lw7y3bNlwIl6A0oJntelOTNOGiaBEePIXQJm1TKsmZFpX
 Mrt6EqtM1bpkpLhGELe/Jr1oSYdcoYOGzixZoHqHAtKXxCjVMkj/3UBysVip5cIf8lGG
 LqwT6GSMsbTKbAu37sJWIxIUAaxUgK1RdXdCLyHt4CF4vP7UDcsd+Cl60EpQovC0LjW8
 uvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681145949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gXiDfkYfooUpnGwSKLtfoTSJftcs9O4vAnZuQK+rVXk=;
 b=WtQYfWEcAVy86EqeiscbXyLDEhcAIMWoBNUG4KO7AWz3o3/OyHVfTd7nvb/z1tj3q/
 sAO+AmwhavZhNh4i0XUYbeN1nWvTTXfvXwVNvwVSvTriAUlw/i2f3SvZcuUAnQALeh5J
 bvnAxvIIOBTt17syLCM6iZ9+Dw74QOBNbSy50g0EueqYyQYvqS2iJtIdFoiZsg15PcRP
 zQZYhWNA0BzyWd22BrQCSwX9zNQYaTDi5Kyagjzb9YoUv3U+azFCB5aHZB94xmZIweBq
 Sn4lntb/gMgWIIQa4N36Pz+23su4fM3cBgNCv+daNt+CtFLkiVp7LnIYBzOnPI/K7mY6
 93Bw==
X-Gm-Message-State: AAQBX9dZM1uL6fMYcxpAFBePQRFqPh3/tF7tTowS8VR5otJSqNNjWKVZ
 irD3GMP6HgIvmwWvnYzjGDiktA==
X-Google-Smtp-Source: AKy350ZVb1HfUp3DQ/E3dDvpUEpQUWhF9zdvorkds3bZqaSJgmKlYgbl9I8fEflSQBXUF5J7399d4w==
X-Received: by 2002:ac2:4d1a:0:b0:4db:28ce:e5ef with SMTP id
 r26-20020ac24d1a000000b004db28cee5efmr3309996lfi.0.1681145948928; 
 Mon, 10 Apr 2023 09:59:08 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 u26-20020ac243da000000b004e84896253asm2177886lfl.251.2023.04.10.09.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 09:59:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/a6xx: initialize GMU mutex earlier
Date: Mon, 10 Apr 2023 19:59:08 +0300
Message-Id: <20230410165908.3094626-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move GMU mutex initialization earlier to make sure that it is always
initialized. a6xx_destroy can be called from ther failure path before
GMU initialization.

This fixes the following backtrace:

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 58 at kernel/locking/mutex.c:582 __mutex_lock+0x1ec/0x3d0
Modules linked in:
CPU: 0 PID: 58 Comm: kworker/u16:1 Not tainted 6.3.0-rc5-00155-g187c06436519 #565
Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __mutex_lock+0x1ec/0x3d0
lr : __mutex_lock+0x1ec/0x3d0
sp : ffff800008993620
x29: ffff800008993620 x28: 0000000000000002 x27: ffff47b253c52800
x26: 0000000001000606 x25: ffff47b240bb2810 x24: fffffffffffffff4
x23: 0000000000000000 x22: ffffc38bba15ac14 x21: 0000000000000002
x20: ffff800008993690 x19: ffff47b2430cc668 x18: fffffffffffe98f0
x17: 6f74616c75676572 x16: 20796d6d75642067 x15: 0000000000000038
x14: 0000000000000000 x13: ffffc38bbba050b8 x12: 0000000000000666
x11: 0000000000000222 x10: ffffc38bbba603e8 x9 : ffffc38bbba050b8
x8 : 00000000ffffefff x7 : ffffc38bbba5d0b8 x6 : 0000000000000222
x5 : 000000000000bff4 x4 : 40000000fffff222 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff47b240cb1880
Call trace:
 __mutex_lock+0x1ec/0x3d0
 mutex_lock_nested+0x2c/0x38
 a6xx_destroy+0xa0/0x138
 a6xx_gpu_init+0x41c/0x618
 adreno_bind+0x188/0x290
 component_bind_all+0x118/0x248
 msm_drm_bind+0x1c0/0x670
 try_to_bring_up_aggregate_device+0x164/0x1d0
 __component_add+0xa8/0x16c
 component_add+0x14/0x20
 dsi_dev_attach+0x20/0x2c
 dsi_host_attach+0x9c/0x144
 devm_mipi_dsi_attach+0x34/0xac
 lt9611uxc_attach_dsi.isra.0+0x84/0xfc
 lt9611uxc_probe+0x5b8/0x67c
 i2c_device_probe+0x1ac/0x358
 really_probe+0x148/0x2ac
 __driver_probe_device+0x78/0xe0
 driver_probe_device+0x3c/0x160
 __device_attach_driver+0xb8/0x138
 bus_for_each_drv+0x84/0xe0
 __device_attach+0x9c/0x188
 device_initial_probe+0x14/0x20
 bus_probe_device+0xac/0xb0
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x2bc/0x594
 worker_thread+0x228/0x438
 kthread+0x108/0x10c
 ret_from_fork+0x10/0x20
irq event stamp: 299345
hardirqs last  enabled at (299345): [<ffffc38bb9ba61e4>] put_cpu_partial+0x1c8/0x22c
hardirqs last disabled at (299344): [<ffffc38bb9ba61dc>] put_cpu_partial+0x1c0/0x22c
softirqs last  enabled at (296752): [<ffffc38bb9890434>] _stext+0x434/0x4e8
softirqs last disabled at (296741): [<ffffc38bb989669c>] ____do_softirq+0x10/0x1c
---[ end trace 0000000000000000 ]---

Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 --
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 7f5bc73b2040..611311b65b16 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1514,8 +1514,6 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (!pdev)
 		return -ENODEV;
 
-	mutex_init(&gmu->lock);
-
 	gmu->dev = &pdev->dev;
 
 	of_dma_configure(gmu->dev, node, true);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6faea5049f76..2942d2548ce6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1998,6 +1998,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a6xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
+	mutex_init(&a6xx_gpu->gmu.lock);
+
 	adreno_gpu->registers = NULL;
 
 	/*
-- 
2.39.2

