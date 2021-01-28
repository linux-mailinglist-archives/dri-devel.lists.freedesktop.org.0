Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F96308023
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 22:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9FB6EA33;
	Thu, 28 Jan 2021 21:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4756EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 21:03:44 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id e9so5107903pjj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 13:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aptjaoGV239cWXjqy3r+zMMVCqg/pcKBkKwTqdezb6Y=;
 b=sNSsR514AmKhnSwn2BM58kGkIMfh4YczRAxECJfCBp9Hxzho3JhnFgShVNXJ6CIYpu
 tuALWFpbm5cIbthGORXISFIYqB7tV0txrk4991bRJwBJIXS6LcaCq6uRYG/m8iMsGtj8
 BLywwxUb3VDXPZJz74RC5jr0PqYnxs3xndcT0AcQHJsBQ4VAP8kEuPIAU4ri9CBmE8bN
 lZ+xuzt9LG28wpBhDJhaRqKTar//JkDO9g9hQOKEWwrUwfaghlxIKz9pyoYsr6emdDm6
 g2guXvFqxT/N+8ElHoAtSubteDaynE+DiE25q+077gk9DkqONIKBX0pUMUAiSxK6AptV
 fQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aptjaoGV239cWXjqy3r+zMMVCqg/pcKBkKwTqdezb6Y=;
 b=I4DwRVxcGJ5QcS0W3JXGOEM4I+xMucKqdMWNRafcxlInDfyB9T98URL0k/0SFsor2F
 +UIyvcaToVP8UcMNeJ1MFT9TSjVyzCaCAW2jqJXetRfsiXTv5dCzU9yltIOUCREBuGLc
 AOrvI4AzW7c605tVahztOKdnMWLXlqPs5lG94iJljWOZ9X/1mnVNgA/AuO7uhzWSC+YD
 4XruyK+KH7ZWn8e8nmO4szpV5BiPLy5KeiQ5yRJQxhKYIfiyULfCpaSf8i95cx+nZfRb
 nSjvW9EYZjzyK7FftFSUED7ehRqMkq00b+plRJWw3tDK3cE1/n0vCPlQZNXcGy7qLIsb
 wLYA==
X-Gm-Message-State: AOAM530JgQZ/krBCLvsf0ti0x3Ka8z7SXpiJknJkRZgxD6JHgsAaSNVi
 uHwtJaa9oQPEBuBvZ8P8zkq/zvZJNx8920jI
X-Google-Smtp-Source: ABdhPJzQY6MVCwZEOIgxjM4TJzNb3iShXh2ASh8t+nJjM1GDdu9PY3j+F+MTzqEWOtwJchBAiu8pVw==
X-Received: by 2002:a17:90a:bd0f:: with SMTP id
 y15mr1182041pjr.141.1611867823554; 
 Thu, 28 Jan 2021 13:03:43 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
 by smtp.gmail.com with ESMTPSA id l2sm6753295pga.65.2021.01.28.13.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 13:03:42 -0800 (PST)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH v3 2/3] drm/msm: Fix races managing the OOB state for
 timestamp vs timestamps.
Date: Thu, 28 Jan 2021 13:03:31 -0800
Message-Id: <20210128210332.1690609-3-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128210332.1690609-1-eric@anholt.net>
References: <20210128210332.1690609-1-eric@anholt.net>
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we're not racing with GPU setup, also fix races of timestamps
against other timestamps.  In freedreno CI, we were seeing this path trigger
timeouts on setting the GMU bit, producing:

[drm:_a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0

and this triggered especially on the first set of tests right after
boot (it's probably easier to lose the race than one might think,
given that we start many tests in parallel, and waiting for NFS to
page in code probably means that lots of tests hit the same point of
screen init at the same time).  As of this patch, the message seems to
have completely gone away.

Signed-off-by: Eric Anholt <eric@anholt.net>
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7424a70b9d35..e8f0b5325a7f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1175,6 +1175,9 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	static DEFINE_MUTEX(perfcounter_oob);
+
+	mutex_lock(&perfcounter_oob);
 
 	/* Force the GPU power on so we can read this register */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
@@ -1183,6 +1186,7 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
 
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+	mutex_unlock(&perfcounter_oob);
 	return 0;
 }
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
