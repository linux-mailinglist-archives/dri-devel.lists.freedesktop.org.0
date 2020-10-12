Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6628ABAD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC646E215;
	Mon, 12 Oct 2020 02:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F1F6E216;
 Mon, 12 Oct 2020 02:09:03 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x16so12832091pgj.3;
 Sun, 11 Oct 2020 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
 b=cYOdqk6JAEyJPNarImCdXuJLSaTP5hF3m1LbjGxMAKM4MFzOh/QWL4z8r0onTZixmv
 yYkmmpQDdFX0OwxHTLU8XHVitUgxmHbY+VgNmfTHJh0WSrMa/xANqnLQuTOcWIInbzDw
 UfcxFAepPMoCFtwEzdSyf2Ye3iKQUTWpwtNijBFPh0bmxE62Swxqg7NXW9H1c2cIZ+gs
 5q7uX9NGAwR5FW5q/lEs1s+TzByAGZcWfIF+LWklwrapace46kSUKaz+J1Ups9zY5HXt
 mcdofmZpHFDCXRkEXSYV8gza5oxh222MiaZcqqSrb1mB18AGlDIOYvKvOJ8DhpnrTJbT
 KycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
 b=tEiK2EQGRQBAB8iju6SZIwSvCDyh+FvZWP9lqvrgdVgUauVjckUSAQ0dlvTWz6qcah
 o89aXf4QiUZyjdm8sVPiPd0TBcEA+H5opswBQd2HUBnE8EuQbMQ0XWpLvuoImmkh0RcL
 NU/tEr+zrIPwcT8HIyRF2oD5LGR6vxIitAizX4ifEvX9I7WcH7AwJJpE7ZPgbTrhDLxM
 mzdsO0B1AxZN1y44D+/ehHW9bF0HEOF/TKVlQU86EP9yR0j3RISZsXxVn8C4mOe0ITEx
 t8sTjNnkk5+A1WJOm5Hbs/r3/evrNQkpwSZvBuIyItiFGZtj+EzmuqBEo4ccBTx8w81M
 2/uw==
X-Gm-Message-State: AOAM531YFKLfj1Pbf9wthGNIZRnAD3zJMlq+7PU4TqOIXZKMRio+yiWE
 Ic/JuJQu6K8wIW3DflhNs5bFbcJU/72oJBWC
X-Google-Smtp-Source: ABdhPJxO6HzuIjY5oyjtW2Q9UuwL21khrzejoxEMJIqlzoRA6aoWAf2AHjFZUW1waNpmmy9hyrFHAA==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr17790795pja.36.1602468542200; 
 Sun, 11 Oct 2020 19:09:02 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 g4sm17835780pgg.75.2020.10.11.19.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Date: Sun, 11 Oct 2020 19:09:34 -0700
Message-Id: <20201012020958.229288-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
