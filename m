Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F65282D21
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 21:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7520E89FA0;
	Sun,  4 Oct 2020 19:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2262089FAC;
 Sun,  4 Oct 2020 19:21:40 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id i3so3950221pjz.4;
 Sun, 04 Oct 2020 12:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jz4QzEAhEdO6lBCU1QoQ4yhqxZSfud3TeRKgBoZBDXA=;
 b=h0DfyK2y1SjSYpaHFHMtPvB92RnRZePuaoTdB5xxz0thjvfqQP7Siztchi+qNfr4kh
 XMePXwcGcvYZ+5xcurEpjvcLycdlS3PkbdwN3GgdoTeg5o2zHEqBoKFBjwaam79OQGXg
 3YoqTN7w5QcQlTdvJyKGPEx2vewYpRKJpHdYKgYk5qXv2dLNGdQN5Ug8dVe1Vf09jaWa
 NctNaw/rVfTU56JuSIPI8q6JSzSqM17jP4t3Fpdxje/RKaFKiBrXrXzEuykq0DVxP2l3
 GMla73CBHlbIm/VNXUwZuVh1Zx19xRbr6TLqFSD9lxsm9VBldSRUEQJziY11Qj8hC0OK
 /iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jz4QzEAhEdO6lBCU1QoQ4yhqxZSfud3TeRKgBoZBDXA=;
 b=Xp3oo0x3gAidTqXXrKzR4j5+7J7n4bKnr8U7nyCt4TpkH3K02m6Mnw3tZ0FWBsCtCt
 La1EEvorGlINwvB1x3fg44OWpLe6hxYD0Lsd8xbELuWeEUAwiqW3oqKjV2g6QKGnhCwi
 zThVuiOPVuxHTciLM8rMWr4xZpgWQ3czoqSQGTIeB68wVtWydjV3yeHVZ2vQ/I0rUOLx
 JRf0FkM/prCDYxy3REyqg3zYFYsI5/IV1d0BKJQPIWoxaC2Rx7HKb9ReMNb7Uj3ev+O3
 3DmBFYqQy3PbrARYaX4D2vOEKxVG1SP42C+4BHTJUG8FZuu3FHZHTcU/77RJtCkeIOqT
 V/HQ==
X-Gm-Message-State: AOAM532HJcntg3ACM9U4WVjZOwkPgblxbvn0FaTtD3j/9sy0Z5K5mpLy
 Bq6IK4CSgG4d1fxkMYM6uwHU9enJorn7rc7Q
X-Google-Smtp-Source: ABdhPJzwbgfNqafM3y1Sgaak5gfe9bX33DwTRFupIpYNwim2i/Q2fWIh4YBVZQi0LAKdXb4VGj5dHw==
X-Received: by 2002:a17:90a:c501:: with SMTP id
 k1mr13719865pjt.170.1601839299184; 
 Sun, 04 Oct 2020 12:21:39 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z28sm9952148pfq.81.2020.10.04.12.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 12:21:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/14] drm/msm: Don't implicit-sync if only a single ring
Date: Sun,  4 Oct 2020 12:21:46 -0700
Message-Id: <20201004192152.3298573-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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

Any cross-device sync use-cases *must* use explicit sync.  And if there
is only a single ring (no-preemption), everything is FIFO order and
there is no need to implicit-sync.

Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
is undefined when fences are not used to synchronize buffer usage across
contexts (which is the only case where multiple different priority rings
could come into play).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 7d653bdc92dc..b9b68153b7b2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -219,7 +219,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
+static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
 {
 	int i, ret = 0;
 
@@ -239,7 +239,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		if (!implicit_sync)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
@@ -704,7 +704,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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
