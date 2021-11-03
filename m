Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B874449F6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 21:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94CE7A324;
	Wed,  3 Nov 2021 20:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670A67A322;
 Wed,  3 Nov 2021 20:59:08 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id s5so3675713pfg.2;
 Wed, 03 Nov 2021 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pcxuBvGjhUEmKd0khQGqkYMjXGdoop0TDNGStK9eQI=;
 b=JKYKg8toBVT2byo8HteiLk3miwnA0QtFnEzJyBw8Gt5NkhxvEcMoZlCllzPOB63NgM
 LmXj6EZNpMOr4Nflimx4AjPQ8dAX6PhGTwWHTGXvU1cQtCrncUGh+rmYpxowYl7R1kBJ
 0WWPlwL/9I5wah2sPkFQSonsLi+6lZRgF/yY7nhYKqYQRcsciQnajyIvMxOySLkU9I+u
 0V3MWRGtTK1Z0MutzTCze+QR+rG211g+zhUTe3lJnFt6FjKdixFdZXOaCgsF5tqPcyLv
 Gw5b2mpD3H5rxn1IFm/N4ej4ULs9afxgkakSTxMb7FOsGmHvd3JIpyr6xyFKQnzN4C7R
 2kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pcxuBvGjhUEmKd0khQGqkYMjXGdoop0TDNGStK9eQI=;
 b=maB3ERIXM4ECXBKkuSE/nOFQAlptUG1UBN891jydrB8U5OkIB5i4i2OhDEFx+52oCB
 G/d5knJK17tWG5ckWUDKTtjNrMIi2VhJqnL4apF13ZWSMRpHpadxM5gNwbP6DGQOrC5y
 kXaY48CS3EArMkrVdK8KTOiZPX2yGZpfU5MlQR7SypfFvKpdmFSP/8mFCQ80IvCEDXdo
 RyNkmdddNsvKKjEceWR4gDbPagbDiC3gN8cKLTznGoLqnpqYM0p3x1Be+FC5iK27gRyC
 q+Oo1SVx95EA5RUrIWOJ0+ckG41oE3M3t1jxajNF20G1hhI3HDRapCtm5AForTQaT2TT
 T1gg==
X-Gm-Message-State: AOAM531Yvt3MGr8SRW7xD7jmSeOzBxoUDiqczkxsf1AUwsijMeiNJqSn
 aN8PBeQwpTGjRn5nBQiA39YmF+HqpDw=
X-Google-Smtp-Source: ABdhPJy90OawVNmed6HjBzFdRIvX8XirbPVjXZCTukl8/vQMr3evDKQWlVqaP6AANmE2qGw9WFtqtg==
X-Received: by 2002:a62:1707:0:b0:480:f85a:f3b0 with SMTP id
 7-20020a621707000000b00480f85af3b0mr30495683pfx.43.1635973147232; 
 Wed, 03 Nov 2021 13:59:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e14sm2568406pga.76.2021.11.03.13.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:59:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/devfreq: Add some locking asserts
Date: Wed,  3 Nov 2021 14:04:01 -0700
Message-Id: <20211103210402.623099-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 47b3cf2df230..b24e5475cafb 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -20,6 +20,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	struct dev_pm_opp *opp;
 
+	WARN_ON(!mutex_is_locked(&gpu->devfreq.devfreq->lock));
+
 	opp = devfreq_recommended_opp(dev, freq, flags);
 
 	/*
@@ -63,6 +65,8 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	ktime_t time;
 
+	WARN_ON(!mutex_is_locked(&gpu->devfreq.devfreq->lock));
+
 	status->current_frequency = get_freq(gpu);
 	status->busy_time = gpu->funcs->gpu_busy(gpu);
 
@@ -75,7 +79,11 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
-	*freq = get_freq(dev_to_gpu(dev));
+	struct msm_gpu *gpu = dev_to_gpu(dev);
+
+	WARN_ON(!mutex_is_locked(&gpu->devfreq.devfreq->lock));
+
+	*freq = get_freq(gpu);
 
 	return 0;
 }
-- 
2.31.1

