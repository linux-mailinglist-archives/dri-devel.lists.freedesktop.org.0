Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049516E54D3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 00:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B798110E630;
	Mon, 17 Apr 2023 22:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEBC10E630;
 Mon, 17 Apr 2023 22:55:11 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id la15so4409372plb.11;
 Mon, 17 Apr 2023 15:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681772110; x=1684364110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IkA9wnRbo5w7C60BTKvxyOVQM93T/mRdGRMWtweWrTo=;
 b=q/yzCx2K043mqFDqjj0WM/4OzkUAmFNdBT/a8SMmW2A/EmwUaXNzAZpnxdK4WOh5YN
 q2vgsr31qOUI/+EC6tEFp1kHH0HjPsva2nFnwfca6Jx6BLm6tNntfzP08ZNTXcDHl4AK
 IdaaDjH38wRuntwP4pVFY848alLct1vQbaAlAa9Upy4ZU0edg6bdP7L0uqm5Gfpjzm3u
 SGhxG4AfVtcCOD9ugLSWzODdm/FZ5xea6/DYp6ePBI7nquEtBKnA6+CQ9mGxCxfgKfj3
 e5M9n/+lW7i+GyQHAjbPg4YbH2Sq8qmYOl4neVesYeO8hJLSRt6nLnRFb/286Hgj+Ja4
 Oh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681772110; x=1684364110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IkA9wnRbo5w7C60BTKvxyOVQM93T/mRdGRMWtweWrTo=;
 b=KyuGSuWFdnd9N64NQf1KxJfLnnBxqU3QlbmuDbEw0+gqQ3OhAlmYxJoAzP7Ubsu9fi
 mQvkQwuIxDd5945dL681dOxCzHk1RFpc9uFFd3yLu9q6cybXSWCcKAQ69XVZScsH3sa1
 O9EAYBRJRcR/kB5oBk6zc2yftlmQdX43U9y51DGKxO11fDoCSToEYFhqQdbUcvRfklqh
 DLTb4o9kEJmcFlLuWZJhougGk/aO/eelmg8YRKUTDD2x+Sc/JpgiX/+308PfqTYw0FBq
 A0CsCVjjHQkd2n4mOvnNbn6Ws5AhqfGR+GKAr721AdHDc7dbejw1m60ajj6Z83kKQXNk
 hq2g==
X-Gm-Message-State: AAQBX9fvCSRtPV0UqD00kQvaU7OMYTZhA0JvmqX6WRwl/qlk5Pj6fHc+
 mMkDDX3no+kUUn/WFdTwlyuCL8hyZ40=
X-Google-Smtp-Source: AKy350bsqttjkFoxN4aClYncUVFHdeiJpJuM4f30fWPgWn6e7CVbVFHW+2DBpXifcM0pL+jPjbUWSw==
X-Received: by 2002:a05:6a20:8419:b0:d8:bed9:33cf with SMTP id
 c25-20020a056a20841900b000d8bed933cfmr19558887pzd.17.1681772110125; 
 Mon, 17 Apr 2023 15:55:10 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 132-20020a63058a000000b0051ba16c35cfsm3117276pgf.29.2023.04.17.15.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 15:55:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix vmap madv warning
Date: Mon, 17 Apr 2023 15:55:04 -0700
Message-Id: <20230417225504.494934-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Commit d6ae7d1cd58e ("drm/msm/gem: Simplify vmap vs LRU tracking")
introduced a splat in the pin_pages_locked() path for buffers that
had been MADV_DONTNEED.

   ------------[ cut here ]------------
   msm_obj->madv != 0
   WARNING: CPU: 1 PID: 144 at drivers/gpu/drm/msm/msm_gem.c:230 msm_gem_pin_pages_locked+0x9c/0xd4
   Modules linked in: lzo_rle cros_ec_lid_angle cros_ec_sensors cros_ec_sensors_core venus_dec venus_enc videobuf2_dma_contig cdc_ether usbnet mii uvcvideo videobuf2_vmalloc hci_uart btqca qcom_spmi_adc5 uvc qcom_spmi_temp_alarm qcom_vadc_common cros_ec_sensorhub videobuf2_memops cros_ec_typec sx9324 sx_common typec joydev bluetooth industrialio_triggered_buffer ecdh_generic kfifo_buf ecc venus_core qcom_stats v4l2_mem2mem videobuf2_v4l2 videobuf2_common ath11k_ahb ath11k mac80211 cfg80211 fuse zram zsmalloc
   CPU: 1 PID: 144 Comm: ring0 Tainted: G        W          6.3.0-rc2-debug+ #622
   Hardware name: Google Villager (rev1+) with LTE (DT)
   pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : msm_gem_pin_pages_locked+0x9c/0xd4
   lr : msm_gem_pin_pages_locked+0x9c/0xd4
   sp : ffffffc009ffbab0
   x29: ffffffc009ffbab0 x28: ffffffee8da75008 x27: ffffff80a10274d0
   x26: ffffff8087fe3bf8 x25: ffffff8087fe3c08 x24: 0000000000000001
   x23: ffffff80891d5800 x22: ffffff809d0de480 x21: ffffff8081e5a080
   x20: 0000000000000002 x19: ffffff80a3564c00 x18: 0000000000000000
   x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000a9620
   x14: 0000000000000000 x13: 2d2d2d2d2d2d2d2d x12: 2d2d2d2d5d206572
   x11: 656820747563205b x10: 2d2d2d2d2d2d2d2d x9 : ffffffee8c705dfc
   x8 : ffffffee8da75000 x7 : ffffffee8d34e6d0 x6 : 0000000000000000
   x5 : 00000000000affa8 x4 : 000000000000000d x3 : ffffffee8da75008
   x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff8088048040
   Call trace:
    msm_gem_pin_pages_locked+0x9c/0xd4
    get_vaddr+0xb0/0x150
    msm_gem_get_vaddr_active+0x1c/0x28
    snapshot_buf+0x90/0x10c
    msm_rd_dump_submit+0x30c/0x380
    msm_gpu_submit+0x88/0x174
    msm_job_run+0x68/0x118
    drm_sched_main+0x2b8/0x3a0
    kthread+0xf0/0x100
    ret_from_fork+0x10/0x20
   irq event stamp: 3358
   hardirqs last  enabled at (3357): [<ffffffee8c7051f4>] __up_console_sem+0x7c/0x80
   hardirqs last disabled at (3358): [<ffffffee8d3480b0>] el1_dbg+0x24/0x80
   softirqs last  enabled at (3330): [<ffffffee8c610420>] __do_softirq+0x21c/0x4bc
   softirqs last disabled at (3325): [<ffffffee8c616708>] ____do_softirq+0x18/0x24
   ---[ end trace 0000000000000000 ]---

But, as with msm_gem_get_vaddr_active(), this is a special case
because we know that the buffer won't be purged evicted until it's
fence is signaled.  We just forgot to propagate the logic get_vaddr()
to pin_pages_locked().

Fixes: d6ae7d1cd58e ("drm/msm/gem: Simplify vmap vs LRU tracking")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c32264234ea1..20cfd86d2b32 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -219,7 +219,8 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
+static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj,
+					      unsigned madv)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
@@ -227,7 +228,9 @@ static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(obj);
 
-	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
+	if (GEM_WARN_ON(msm_obj->madv > madv)) {
+		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
+			msm_obj->madv, madv);
 		return ERR_PTR(-EBUSY);
 	}
 
@@ -248,7 +251,7 @@ struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
 	struct page **p;
 
 	msm_gem_lock(obj);
-	p = msm_gem_pin_pages_locked(obj);
+	p = msm_gem_pin_pages_locked(obj, MSM_MADV_WILLNEED);
 	msm_gem_unlock(obj);
 
 	return p;
@@ -473,10 +476,7 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct msm_gem_vma *vma)
 
 	msm_gem_assert_locked(obj);
 
-	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
-		return -EBUSY;
-
-	pages = msm_gem_pin_pages_locked(obj);
+	pages = msm_gem_pin_pages_locked(obj, MSM_MADV_WILLNEED);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
@@ -699,13 +699,7 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	if (obj->import_attach)
 		return ERR_PTR(-ENODEV);
 
-	if (GEM_WARN_ON(msm_obj->madv > madv)) {
-		DRM_DEV_ERROR(obj->dev->dev, "Invalid madv state: %u vs %u\n",
-			msm_obj->madv, madv);
-		return ERR_PTR(-EBUSY);
-	}
-
-	pages = msm_gem_pin_pages_locked(obj);
+	pages = msm_gem_pin_pages_locked(obj, madv);
 	if (IS_ERR(pages))
 		return ERR_CAST(pages);
 
-- 
2.39.2

