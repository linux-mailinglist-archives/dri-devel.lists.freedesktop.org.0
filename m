Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A1745CF2D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228CB6EDCF;
	Wed, 24 Nov 2021 21:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD4E6EDC8;
 Wed, 24 Nov 2021 21:37:10 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so5038045pjj.0; 
 Wed, 24 Nov 2021 13:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
 b=T3rGlQWhA9dMgzhwxjwybLi5abgIwTOqcDalv2g7bUFxDvEuLCmyh4zYTzM5xC1jO6
 MlMs2XJF8SzQWMEAn8pLboEaZd5/MWEWxtVey28ecaG2ESrq84sbwOhF7SRqBErqZ8lg
 5AsWoDJS00qAD2y81PTr00MNkHWH9doUBMsMTLGAfw4pJ4e4+voQO19lHDAsqR0yXy7C
 HZveZTVdbv5TGr92qTN3Z7Rpyv4rhA5xF26XSkolYMUUxVpbsybq/96EECMH7vYrAaBb
 9vCGm3iQwrdGv75JSWDiMrXqiZjSSP43Dq+UYAawHjDxTUU7u98bVRyHhTXIFnfcWG1c
 9F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
 b=oDHBsMbzEEter/RFRotSYiX0WxUKJHUZhZHcFxMTyTZbxVOxTvnUOpexwoFQS5aKT7
 TJJADDxVkiR8KxJc4eHP9X6lZBTWc33jmi5sQseNkQsNke2fV2VKVzp1L0aiqqoZXTc2
 4JjYB9aEINrOIMCVm404io0kihyE19hNFwS7JUK9u6CqVv0n951Tt0O+MqPJgGNODi7g
 ERREUqrsVudMYnDDDJjfIjh3MlHNbkUxek1Zn81nPzPaG9s+QchvroU3bj8/4Z+u1msF
 NLGs/J+49mDqSpTFNxsS24EV8YVVmZ/Y+O7iRVzTilTpK/IZiEy/nfr6vBY/Y9h3UWiV
 bvyw==
X-Gm-Message-State: AOAM531uCMK8jqvr17FOFjkeQcE2pl++LlyfcYYjRayH+8cl1En+iehs
 UCZ7O54ZdYMp22ShPYQEvEhpIH2081A=
X-Google-Smtp-Source: ABdhPJwe/lRaJSe0GFu+WGWCDcRFHEa/gNdXvQ4MfPOvkizc8B007dmK8onv9kIv9NgcsOsS/5eJzQ==
X-Received: by 2002:a17:903:2283:b0:141:f858:f9af with SMTP id
 b3-20020a170903228300b00141f858f9afmr22475416plh.80.1637789829386; 
 Wed, 24 Nov 2021 13:37:09 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c6sm722654pfv.54.2021.11.24.13.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:37:08 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/gpu: Fix idle_work time
Date: Wed, 24 Nov 2021 13:41:27 -0800
Message-Id: <20211124214151.1427022-3-robdclark@gmail.com>
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
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was supposed to be a relative timer, not absolute.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 43468919df61..7285041c737e 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -228,5 +228,5 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
-			       HRTIMER_MODE_ABS);
+			       HRTIMER_MODE_REL);
 }
-- 
2.33.1

