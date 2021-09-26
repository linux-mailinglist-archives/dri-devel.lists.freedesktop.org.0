Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12E6418A9D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 21:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F328A89D89;
	Sun, 26 Sep 2021 19:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C77389D89;
 Sun, 26 Sep 2021 19:01:15 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id s16so13831514pfk.0;
 Sun, 26 Sep 2021 12:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YpW3MI6iw3Oxd5NOrsE2ej3i7oWt4Lvf7C0mm1vXsEQ=;
 b=X0rbqYOiPa8TR+xNbKQ11zADEYeGWxHP8OrJ6G2orV+nrn4Y5kg47k6ijU9zijsWf0
 qEPDgpYVkCkU1T/snvGOIFcLFQcDb7Zep2AxLIOX5obxq6Dv4QLHg/SfdzlY4fqVNex7
 klkvLSVc8ApN6L9RY2fTs11WLvhHwp3rIT2amnqsnQIEtsgF6Jez/gAi7ebTegxyOEtf
 QCVk8VFA4UD6ua1YKS8riL4/kAHEc+X2ZWo+sHXDhwKgMsgWjmh8XHT1vROTrvR+zpgF
 5j7MtQvIbP1VhY/9nuPeI2v5QbpQkZ9wk/hTnkxLcn+++qJQzcgotbUB/6q/ggBo+1Na
 oE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YpW3MI6iw3Oxd5NOrsE2ej3i7oWt4Lvf7C0mm1vXsEQ=;
 b=vmOvdqY4+JK3HRwRb4yAxlbWguRQkVD2S0IpGxd0wNIXZMce7poTkGATC72aO4fB6U
 N0TziWwdjSebjhpEhvP6LTY7OXb8VKaFI05GdCAYEjEIZ7B/y7eHiv7inQV0sFY0voq8
 tCM6lGjDn+j9wkYl3Sklc/kdk8u8vj8Jl9aFca94ccj9wghGzRtdG40jzE7gHvG+RRul
 zXw/lS1iIxqb4NtbRISz+d6iDCUAZLzUwJdH4mdXtoCjoVw7DzZh3uHvjShg8itxAldu
 SFuN70VR6g2iyIhGnhFK5PbuiRHdm8kKoR0MjZInCVTcMSiIxXwHtsq54al2gw7Og3Xl
 wkhw==
X-Gm-Message-State: AOAM530Q1KAJ/WBp2JpM1GO05XDKhlZO1bYAlsKENNUDm7I2OzfFu5QC
 y1HzhU1G+JVZdfx7kRBcscGEdHXkhkA=
X-Google-Smtp-Source: ABdhPJziMIVXsDt1wHLIZ0sD+nbLaA+w0AdpOWqm07mpgjbKHrCTLoKQaWVZiVySBMgA1ThaAk1GeA==
X-Received: by 2002:a63:7784:: with SMTP id
 s126mr13408029pgc.264.1632682873670; 
 Sun, 26 Sep 2021 12:01:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id q4sm9781104pfl.50.2021.09.26.12.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 12:01:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix crash on dev file close
Date: Sun, 26 Sep 2021 12:05:54 -0700
Message-Id: <20210926190554.761482-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If the device file was opened prior to fw being available (such as from
initrd before rootfs is mounted, when the initrd does not contain GPU
fw), that would cause a later crash when the dev file is closed due to
unitialized submitqueues list:

   CPU: 4 PID: 263 Comm: plymouthd Tainted: G        W         5.15.0-rc2-next-20210924 #2
   Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
   pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : msm_submitqueue_close+0x30/0x190 [msm]
   lr : msm_postclose+0x54/0xf0 [msm]
   sp : ffff80001074bb80
   x29: ffff80001074bb80 x28: ffff03ad80c4db80 x27: ffff03ad80dc5ab0
   x26: 0000000000000000 x25: ffff03ad80dc5af8 x24: ffff03ad81e90800
   x23: 0000000000000000 x22: ffff03ad81e90800 x21: ffff03ad8b35e788
   x20: ffff03ad81e90878 x19: 0000000000000000 x18: 0000000000000000
   x17: 0000000000000000 x16: ffffda15f14f7940 x15: 0000000000000000
   x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000040
   x11: 0000000000000000 x10: 0000000000000000 x9 : ffffda15cd18ff88
   x8 : ffff03ad80c4db80 x7 : 0000000000000228 x6 : 0000000000000000
   x5 : 1793a4e807e636bd x4 : ffff03ad80c4db80 x3 : ffff03ad81e90878
   x2 : 0000000000000000 x1 : ffff03ad80c4db80 x0 : 0000000000000000
   Call trace:
    msm_submitqueue_close+0x30/0x190 [msm]
    msm_postclose+0x54/0xf0 [msm]
    drm_file_free.part.0+0x1cc/0x2e0 [drm]
    drm_close_helper.isra.0+0x74/0x84 [drm]
    drm_release+0x78/0x120 [drm]
    __fput+0x78/0x23c
    ____fput+0x1c/0x30
    task_work_run+0xcc/0x22c
    do_exit+0x304/0x9f4
    do_group_exit+0x44/0xb0
    __wake_up_parent+0x0/0x3c
    invoke_syscall+0x50/0x120
    el0_svc_common.constprop.0+0x4c/0xf4
    do_el0_svc+0x30/0x9c
    el0_svc+0x20/0x60
    el0t_64_sync_handler+0xe8/0xf0
    el0t_64_sync+0x1a0/0x1a4
   Code: aa0003f5 a90153f3 f8408eb3 aa1303e0 (f85e8674)
   ---[ end trace 39b2fa37509a2be2 ]---
   Fixing recursive fault but reboot is needed!

Fixes: 86c2a0f000c1 drm/msm: ("Small submitqueue creation cleanup")
Reported-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c         | 3 +++
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f350de754f84..938765ad7109 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -689,6 +689,9 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+	rwlock_init(&ctx->queuelock);
+
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 32a55d81b58b..7ce0771b5582 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -140,10 +140,6 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	 */
 	default_prio = DIV_ROUND_UP(max_priority, 2);
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-
-	rwlock_init(&ctx->queuelock);
-
 	return msm_submitqueue_create(drm, ctx, default_prio, 0, NULL);
 }
 
-- 
2.31.1

