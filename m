Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D5833F5B5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 17:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BD36E848;
	Wed, 17 Mar 2021 16:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F86E844;
 Wed, 17 Mar 2021 16:39:24 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id n10so25102200pgl.10;
 Wed, 17 Mar 2021 09:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJKz2h+X44Nyjc70D1nl6aYjywkrSYx9D4C8krqE5s4=;
 b=gd+e3pDXZbLRr7OHs+dQNTQNYZjTE9SpwbtkhLTG6XdDc7DyYOSisEkNNqZU6WqmDr
 SCANy+scFCynXXAgg5ILVsnWZCFS+TzUGbVrzDFuocEIGPojXLI/+AJbZDfbA/es7RnX
 MT4ina1sLUOIX5Dr+/TS0OgO/vG5131jIPjclMFjTkeuVNcOaRKJ0TUsGWow47WLAkP6
 Nh42/l2OIO0xjCZfZA40hUJ8uit9u+Kw39vxa1av8U4PvgmUULXF/p8CJEie9aPujZPD
 5pK+P2kIymqyVSOnP+Qk1Xd+TMP2aDoFPFIUpztfiSbBHevuxPHZGKNLhbYehyF+cU83
 6mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VJKz2h+X44Nyjc70D1nl6aYjywkrSYx9D4C8krqE5s4=;
 b=g1kDw8qudrQy86vMe6yr7AeYn8cG6eK7KuwhRwxk4wF5jfr4VSEgQBZA09vvbtbQ6y
 tukxYMvKMARBZrBUQ0S7yv9lr8SlM/LVVIZ2r/J2pcC769WWlWNc5BB5xGSAPQB0Dseb
 GhRvpkLHztcHX20l6oyZ17in2jUg/eAmMdNTDFcnTK5bLgGTEWQx1/kZh9U9F2eDAQUo
 7ntabih0DOdUV3noo3NVkPy9eF5j3EPpXBrgHH24ibqrS0BdYpJ8gBpl44UDqYsjjTyd
 NOKfJMQ51hj8s0xYQU0edyO+PBE2kzpFvIiyvitB3W+AKK7fiSA4kdTu+0evUCkinjy0
 ltPA==
X-Gm-Message-State: AOAM533X7DyOejZX8vCkX6M41gi8g0Hgr2bkLBa8sWjzwjspSqnIAuo6
 efqJcXOGgC0qj48fVw6Bc/R0EyMtcT0=
X-Google-Smtp-Source: ABdhPJwwOq0vwgcZGgWOETf0gCZOIdapKzgtw7LIGnEIxTYxUm7egBbqaGJZOUQ1e4gvOxBkLPpErw==
X-Received: by 2002:a63:2345:: with SMTP id u5mr3462213pgm.326.1615999163670; 
 Wed, 17 Mar 2021 09:39:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i17sm22008783pfq.135.2021.03.17.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 09:39:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Ratelimit invalid-fence message
Date: Wed, 17 Mar 2021 09:42:39 -0700
Message-Id: <20210317164239.1007776-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.29.2
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

We have seen a couple cases where low memory situations cause something
bad to happen, followed by a flood of these messages obscuring the root
cause.  Lets ratelimit the dmesg spam so that next time it happens we
don't loose the kernel traces leading up to this.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index ad2703698b05..cd59a5918038 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -45,7 +45,7 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
 	int ret;
 
 	if (fence > fctx->last_fence) {
-		DRM_ERROR("%s: waiting on invalid fence: %u (of %u)\n",
+		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
 				fctx->name, fence, fctx->last_fence);
 		return -EINVAL;
 	}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
