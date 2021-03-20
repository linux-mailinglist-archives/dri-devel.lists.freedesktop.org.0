Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA0342C97
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 12:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145D96EB5B;
	Sat, 20 Mar 2021 11:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960606EB5B;
 Sat, 20 Mar 2021 11:56:25 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id h3so6371054qvh.8;
 Sat, 20 Mar 2021 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wi+S5VMJREJDbl21ELqDJlUC16J30YLmvglN8TZts90=;
 b=Dp/Z8+w+UW0E+GsIVF9VOGLuq9p0CSrzNHBs3vYGqs2gG+u68PpNmH9toa3uuqBWoE
 ekRRwGTetcEK+lGLWaKBxQVo73LYgnlzvyV/zaWLGwN7f4najQR/KvR6uFTA65ze2Fz4
 m3dFhYjJC3v8fdnC5W2+Z/8UTfoGvl2mY77aRorn7907vIhY+sdRUwXuPPOWibmO/6fF
 LGRV73rYUJAKct1+72yT8ZO0U0+doh7GV2BvuNpd1BLZTDFkusks7FM7AnVHVuLj0av5
 +cAPFiedv0CsGhn4/N/nB981GaPeMfZQRN0I1lXFKDLdZRGo1aSRh8iTZVGiuOc0l/u4
 iYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wi+S5VMJREJDbl21ELqDJlUC16J30YLmvglN8TZts90=;
 b=Y+tiCZKq8rXlHd0Jnxr57g15tLXezaN582+icHsLsR9hO79qtVvxV7zQzRKW5JiGNG
 3DXT1Dld51jBny5xThF1mp6A5RL0GAMzqKzGOkQml5qDdj96Blmu+mGTHdLbBk6tE4nE
 VrGbU02JWptwShjvpDTLQeGjYiTkyn6jA1koH2pOE0wfyZ+6Byd7CZ25C/2c/mvt26+G
 /c7QAAAHvCUBw31DJIXJ2+Y0VFuE8PsYdeDgBiXhSdNo3+yofVy394ObxNkiy9wvN8t5
 OuUT2nUEu7WQeVMl0rq5SHvNUiAYyK/uWXReTtkTJLB8BQ9v0LUhvSqIcQiaaTTLqHGi
 134g==
X-Gm-Message-State: AOAM530bVKQs/V+Ah7N0Jk8qw9JayIxJGc6RlfEYgf1nrPXEXtriSjT+
 +QiDeI53Cr0WowvquzNhvtE=
X-Google-Smtp-Source: ABdhPJz1rwgdXyJxayEiiJGkgMU+Sk4VanRZLI2tKbcNjT+ekEYsg4tZqodRp8b50Bu/FRu45IMjCw==
X-Received: by 2002:a0c:ea81:: with SMTP id d1mr13497106qvp.57.1616241384563; 
 Sat, 20 Mar 2021 04:56:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:d77f:dedf:c165:89a3:1374:f96a])
 by smtp.gmail.com with ESMTPSA id j30sm5720233qtv.90.2021.03.20.04.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 04:56:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2 1/2] drm/msm: fix shutdown hook in case GPU components
 failed to bind
Date: Sat, 20 Mar 2021 08:56:02 -0300
Message-Id: <20210320115603.183083-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 sean@poorly.run, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

If GPU components have failed to bind, shutdown callback would fail with
the following backtrace. Add safeguard check to stop that oops from
happening and allow the board to reboot.

[   66.617046] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   66.626066] Mem abort info:
[   66.628939]   ESR = 0x96000006
[   66.632088]   EC = 0x25: DABT (current EL), IL = 32 bits
[   66.637542]   SET = 0, FnV = 0
[   66.640688]   EA = 0, S1PTW = 0
[   66.643924] Data abort info:
[   66.646889]   ISV = 0, ISS = 0x00000006
[   66.650832]   CM = 0, WnR = 0
[   66.653890] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107f81000
[   66.660505] [0000000000000000] pgd=0000000100bb2003, p4d=0000000100bb2003, pud=0000000100897003, pmd=0000000000000000
[   66.671398] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   66.677115] Modules linked in:
[   66.680261] CPU: 6 PID: 352 Comm: reboot Not tainted 5.11.0-rc2-00309-g79e3faa756b2 #38
[   66.688473] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   66.695347] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[   66.701507] pc : msm_atomic_commit_tail+0x78/0x4e0
[   66.706437] lr : commit_tail+0xa4/0x184
[   66.710381] sp : ffff8000108f3af0
[   66.713791] x29: ffff8000108f3af0 x28: ffff418c44337000
[   66.719242] x27: 0000000000000000 x26: ffff418c40a24490
[   66.724693] x25: ffffd3a842a4f1a0 x24: 0000000000000008
[   66.730146] x23: ffffd3a84313f030 x22: ffff418c444ce000
[   66.735598] x21: ffff418c408a4980 x20: 0000000000000000
[   66.741049] x19: 0000000000000000 x18: ffff800010710fbc
[   66.746500] x17: 000000000000000c x16: 0000000000000001
[   66.751954] x15: 0000000000010008 x14: 0000000000000068
[   66.757405] x13: 0000000000000001 x12: 0000000000000000
[   66.762855] x11: 0000000000000001 x10: 00000000000009b0
[   66.768306] x9 : ffffd3a843192000 x8 : ffff418c44337000
[   66.773757] x7 : 0000000000000000 x6 : 00000000a401b34e
[   66.779210] x5 : 00ffffffffffffff x4 : 0000000000000000
[   66.784660] x3 : 0000000000000000 x2 : ffff418c444ce000
[   66.790111] x1 : ffffd3a841dce530 x0 : ffff418c444cf000
[   66.795563] Call trace:
[   66.798075]  msm_atomic_commit_tail+0x78/0x4e0
[   66.802633]  commit_tail+0xa4/0x184
[   66.806217]  drm_atomic_helper_commit+0x160/0x390
[   66.811051]  drm_atomic_commit+0x4c/0x60
[   66.815082]  drm_atomic_helper_disable_all+0x1f4/0x210
[   66.820355]  drm_atomic_helper_shutdown+0x80/0x130
[   66.825276]  msm_pdev_shutdown+0x14/0x20
[   66.829303]  platform_shutdown+0x28/0x40
[   66.833330]  device_shutdown+0x158/0x330
[   66.837357]  kernel_restart+0x40/0xa0
[   66.841122]  __do_sys_reboot+0x228/0x250
[   66.845148]  __arm64_sys_reboot+0x28/0x34
[   66.849264]  el0_svc_common.constprop.0+0x74/0x190
[   66.854187]  do_el0_svc+0x24/0x90
[   66.857595]  el0_svc+0x14/0x20
[   66.860739]  el0_sync_handler+0x1a4/0x1b0
[   66.864858]  el0_sync+0x174/0x180
[   66.868269] Code: 1ac020a0 2a000273 eb02007f 54ffff01 (f9400285)
[   66.874525] ---[ end trace 20dedb2a3229fec8 ]---

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None, only added freedreno@lists.freedesktop.org on Cc

 drivers/gpu/drm/msm/msm_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 94525ac76d4e..fd2ac54caf9f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_device *pdev)
 static void msm_pdev_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
+
+	if (!priv || !priv->kms)
+		return;
 
 	drm_atomic_helper_shutdown(drm);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
