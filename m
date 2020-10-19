Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F892292FBD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23236EAA6;
	Mon, 19 Oct 2020 20:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6B16EAA6;
 Mon, 19 Oct 2020 20:45:48 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id e7so659711pfn.12;
 Mon, 19 Oct 2020 13:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
 b=bmzm4rvdVc0FLaxQTSGAk/qiwOyjhcoupgB5tSrmQrQFujkxbkIK3EjvXzLGowRROd
 rhuvPjTy7LFIpDHISKdvy+55RbO+w1ElfMOsxlWMBsGRG29YZ4JNY+zp+OUf+PqAKs4h
 Q1DJC1J6Y0VvtjFmzHKCveP0KQaiDUSgEu7//u+y6meSBNQjm29aadXUo3D7KV4loxS8
 Ucn13vLLgGyJa7L8NZVF7Zd/maxQclUhbLswskMRSEgBlAXIs1abXkdh9hY4v4QKZEP3
 fNVvhj6gsriIAofLRLx2SOcQ+ARdEtaHHXXt5fB7nQ7uF11GiTmOIEgA6gkLmytlBmVP
 Friw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
 b=tZj5G2UbG1tduNw0yqGXPeMcq06KmOyiiCwp3IdTcB/0xz39x8MDV+GJCBG6bT9YJ1
 ch7fwFVJZ4IHQVoe8ONtdQWSK6M9K0x+lJr5LCbs5y/7b8W5k/WYvXEGlwNwD0W1k0EP
 56W7uK4kpMgCPSrZxRbNenF03tx/gRfenVA/SNRDUsdYegp5qTTcPTwx0gcGWsIz6J5L
 zAo1/ucSSPqFZx0duUnWjyAUM/2zz/Hk1mu4oib9xEDo23P1wzAUBzKp0ONzfIHbDwBw
 11mdk/o6UQegFNHiRQ0+7ClM2nDyFACbh00TMU4GWBFqeeid6w0gUZg/9fy06hg4QNzg
 WZtA==
X-Gm-Message-State: AOAM531/1QkzR25S1GWUs9fiPqLZ+GdGtUAx9Ul/Q+uGZW21DvPGF0/H
 bpCv8Jk17oJwSBYxVkW4BisowTWTEz5DYw==
X-Google-Smtp-Source: ABdhPJzhXNzkAEZLMxJ0jIMcOrqAtXTdCMiRioH5V6wLNqieqHhykmoBwyeBDpqxkFSN38NHpriFYg==
X-Received: by 2002:a62:1806:0:b029:152:4311:a19d with SMTP id
 6-20020a6218060000b02901524311a19dmr1468674pfy.20.1603140347391; 
 Mon, 19 Oct 2020 13:45:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 n5sm627341pfq.46.2020.10.19.13.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/23] drm/msm: Do rpm get sooner in the submit path
Date: Mon, 19 Oct 2020 13:46:09 -0700
Message-Id: <20201019204636.139997-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Unfortunately, due to an dev_pm_opp locking interaction with
mm->mmap_sem, we need to do pm get before aquiring obj locks,
otherwise we can have anger lockdep with the chain:

  opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex

For an explicit fencing userspace, the impact should be minimal
as we do all the fence waits before this point.  It could result
in some needless resumes in error cases, etc.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 002130d826aa..a9422d043bfe 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -744,11 +744,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = submit_lookup_objects(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
 
 	ret = submit_lookup_cmds(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
+
+	/*
+	 * Thanks to dev_pm_opp opp_table_lock interactions with mm->mmap_sem
+	 * in the resume path, we need to to rpm get before we lock objs.
+	 * Which unfortunately might involve powering up the GPU sooner than
+	 * is necessary.  But at least in the explicit fencing case, we will
+	 * have already done all the fence waiting.
+	 */
+	pm_runtime_get_sync(&gpu->pdev->dev);
 
 	/* copy_*_user while holding a ww ticket upsets lockdep */
 	ww_acquire_init(&submit->ticket, &reservation_ww_class);
@@ -825,6 +834,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 
 out:
+	pm_runtime_put(&gpu->pdev->dev);
+out_pre_pm:
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
