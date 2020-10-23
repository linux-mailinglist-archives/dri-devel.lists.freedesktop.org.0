Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8671829751D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E0A6F8E2;
	Fri, 23 Oct 2020 16:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF8B6F8EF;
 Fri, 23 Oct 2020 16:51:09 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id h2so1205937pll.11;
 Fri, 23 Oct 2020 09:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZButkyF/GaInfh9Hmb9ywY7tT0fYvah1q73Sv4+lT8=;
 b=sXtjrbzfkYQvrfjr3zL0uuJzC9ek8b3OGqkGU2HW1MwDpUR0gg8uMK9y5Lm+q9dOGE
 6o/bQ15eQR3VoOwnM+A01v7WAuxAi8l4FVoSFW/hZD2FonDlwEDPXR4btVVboQJSdcWn
 Y4oekw90qn7FGh+zbLuk6WAgP0cgOw7DGn3lw6cOg8qwYkpB7u2IykkHJ4zdWfBDeuEQ
 C+tXnng8tPUQMfUNHx/1ijmRc2WVx5tdK8MDRHUKEOiXQ7oNy9TNJ2uoGniIVTl3VJ66
 rRHagoab/ceV0VUBgEteX6PzcYosNyRx9tnaTrmogo8Ks9uMkCvJC/clViKNKmTB6NCD
 czvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZButkyF/GaInfh9Hmb9ywY7tT0fYvah1q73Sv4+lT8=;
 b=arqtXuHStA5VbaNcFIflY5Iwm8V0CTQkSEOVA+OBwh090hEP/RidzLHHlqNu4Ri0Hc
 YcDaY+zCnJli5sGOjEwUOjskHK7Ctbm2Gye24nI96lbDJI2A2DiYWrPOEXtCvsQxd+CX
 gkYHipuIHC0tZX8Bhhwo/BdJmPA6sWcmJAhQNo8oTI+8Yw2yfJ8cM+7VQ4eO8fB9XIdo
 G6yP1EvxtSadRF0H3ND448t3Rkei0SEpP49uuxaWmT83/XGORnR+szNKIRnmjVEu3jp7
 0bVc9eE/0vZ2EEouZxcjcQOiobpL1YyEaA0juUFIUASgOLeJU5KU19D8CTcQG+RFY8Wp
 xvBw==
X-Gm-Message-State: AOAM533G9G4OjMuAypFZ6ivF4PFHviK+TTBIt+4tW4X1SaKvaWbEvs/T
 gmxYjxlKiTgAi/MASrLA44+douT73ofaiA==
X-Google-Smtp-Source: ABdhPJz7W7twine0CZiWQPxl1uDo6NOAvvpvr9BrcmqP82wpMVrayYrN0o3GK0pR8TO+1aMw0Xjuow==
X-Received: by 2002:a17:902:ab92:b029:d5:d5f4:5118 with SMTP id
 f18-20020a170902ab92b02900d5d5f45118mr3297409plr.21.1603471868616; 
 Fri, 23 Oct 2020 09:51:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 j8sm2696025pfr.121.2020.10.23.09.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:51:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single ring
Date: Fri, 23 Oct 2020 09:51:24 -0700
Message-Id: <20201023165136.561680-24-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If there is only a single ring (no-preemption), everything is FIFO order
and there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d04c349d8112..b6babc7f9bb8 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
 {
 	int i, ret = 0;
 
@@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		if (!implicit_sync)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
@@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
+	ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
+			!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
 	if (ret)
 		goto out;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
