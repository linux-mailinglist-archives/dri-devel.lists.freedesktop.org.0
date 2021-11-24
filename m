Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282C45CF31
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD516EDD4;
	Wed, 24 Nov 2021 21:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503EA6EDC8;
 Wed, 24 Nov 2021 21:37:13 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id v19so2934212plo.7;
 Wed, 24 Nov 2021 13:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
 b=EbBCcAzyZWm/Q6HMWYMKsq1Be407ENtQqcZASUE4eHvTa5BMm+1SPmG7vsMxWHXJqO
 tH563uBZZQXq2FEFTt94GS4rtnxqAqR9m4OXeIwNCaJAPbDjG513N5aC+NdBzT8Kv4rZ
 fQmYPzbjoIYw4/kDJtk+l7FwoJVIeJSwAmjFPKoucZ792mBhvOFHtNmGmg5ahr3QkEX6
 FktSXOaxUllHXfQf/lKwshYA5eiDOs1ILPVM05lIOUC9CqdpL6CxA1dCHByfb3nKMjVi
 ngfwM0P8pP9tVpSrogdYnx05KbcuYuWApPDl1aiM+FtF5G/GHixmLuGA+j+ck18bTx2B
 TGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f6ln+3/9DBZRpR4O41lZm+OOJ4C7JaNKQynsg2JOb2g=;
 b=RWo+WLCRc8It+VK8bBPUTeeiB1vx/buCIoKIlptSlU0ItndA0RZmFGnX2ozbnRqTGy
 hpeqFYHwyze7dnQIEX8zYb5+jn0x2q86siPx6/s1gR/sCtY0CxgQQEgJw249U1mmqSvX
 XOaVDnR54hs/5Z9KEuFZnzlqO9fLk8uLmY+xPYVz2KGeyHwqE6bABKG8UktwEJooJimT
 gd+Fl/DVb5xF83mFxqnuff7iFmXD/d/YY8/HqQB5uCXQpsKLgtzKrJuKsgYCx+a4QCOC
 VJ39GdoS6FTzX21FMZT4XXY59XFW4NqzVLoxBRbmQid+k8kjjXVTyc8oi5IYL32AuUl2
 Ktxg==
X-Gm-Message-State: AOAM530zhFsMQ0EMMefWHPnQyXUY/aBuWIfywYeXhE74vfG0URW/QC1e
 y3rkZsk0GjqipE8jvB/fcOzaO+ErKdg=
X-Google-Smtp-Source: ABdhPJwtik0+mxhV8osmTBLsnQR8ryhgLzx+m9B+uUtLe8i1esQUgxePWXQCjhjrDguWIPgkLxfaVQ==
X-Received: by 2002:a17:90a:1b67:: with SMTP id
 q94mr200972pjq.119.1637789831907; 
 Wed, 24 Nov 2021 13:37:11 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k91sm545748pja.19.2021.11.24.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:37:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/gpu: Fix check for devices without devfreq
Date: Wed, 24 Nov 2021 13:41:28 -0800
Message-Id: <20211124214151.1427022-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Looks like 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before
clamping freq") was badly rebased on top of efb8a170a367 ("drm/msm:
Fix devfreq NULL pointer dereference on a3xx") and ended up with
the NULL check in the wrong place.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 7285041c737e..1f55242bb6a1 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -203,9 +203,6 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
 	unsigned long idle_freq, target_freq = 0;
 
-	if (!df->devfreq)
-		return;
-
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
@@ -227,6 +224,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
+	if (!df->devfreq)
+		return;
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }
-- 
2.33.1

