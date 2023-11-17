Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C27EF4F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 16:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B2210E152;
	Fri, 17 Nov 2023 15:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CF910E152;
 Fri, 17 Nov 2023 15:14:26 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6c4eaa5202aso2089646b3a.1; 
 Fri, 17 Nov 2023 07:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700234065; x=1700838865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=neKamCZO2wHDVbcksPS6RZHdFnPapK4yzUpgs5f2M5Y=;
 b=UB3RoXkJ6ElXz0u4tDQCb+Jbbp996jcQNZOCxENbXEXEbWOOoA7sHFpggZf/eg2XPu
 uLgHAioZFZOP2mZj5+0XWaiUcrIXwV4I8z1lZvQ9mRxUssPdKyDqPlj8z0cv8DD66g02
 sADVUTFLq//fD7m5udrN72upVYKELI0YyKlraRMdP9Jc9TMuxY0EWjtjfZ4qm4biVQYX
 5q3JMvBdUyDviUay0jLRkq93DURX7ZzDCvh0hI12MmuGrfQyGKjqphs/agdHuEC7qqkt
 OXf7yZrTMEX4JM2W5bAL48Bgpng7A8wmYPQmoZlBtl/dpNIKSRXHwH+qv8JLO7cOrW3p
 MS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700234065; x=1700838865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neKamCZO2wHDVbcksPS6RZHdFnPapK4yzUpgs5f2M5Y=;
 b=ujDU78etO0SPhsO/YqbCz285biDj6noNmoTymywpiS8IveYwdx8ZXJTsSLDz360oCf
 +UAP0nVVSN9UCrKvoEPKAkSXHqxdTsn5tRZ/hyzTrHsHKSqVza/b5LuXsFGYb8HVAtEB
 4lMzqWaa0k/NUZsmV+s76bXRnAkrDyMftBre9MZTmd3hcOdiK7KDB1xT/KZBUQ9Y8416
 0MuLmYwX40YS5xezZv7nOB/q7ZRckJPG3m0h6zFQI3ItyCzD4g7zGB05aidM0w790r0I
 XYKoJgIIJGZ5JfZ8sBh8iSPC6prw2kIGTx8e5YME03bUpO/oi68WGVw1bRP7jfY/TUCp
 fstw==
X-Gm-Message-State: AOJu0YxrP74Zkqfv5unLT+utzrsb4NPg4qronw6GfhMKnVoRtEpgbj9/
 NgZSYx3Y0g9PXbUKJ98Q8Nphno01u8U=
X-Google-Smtp-Source: AGHT+IHNamJGjWsZcOgdHZgk/IVdURgF/leP60XW8Fd2vRVnOipM3gRSx8X3je7JYe506jJkwKWbDg==
X-Received: by 2002:a17:902:d4cb:b0:1cc:5a74:b1df with SMTP id
 o11-20020a170902d4cb00b001cc5a74b1dfmr13978668plg.2.1700234064990; 
 Fri, 17 Nov 2023 07:14:24 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a170902db1200b001c8a0879805sm1474315plx.206.2023.11.17.07.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 07:14:24 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Reduce fallout of fence signaling vs reclaim hangs
Date: Fri, 17 Nov 2023 07:14:19 -0800
Message-ID: <20231117151420.351995-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Until various PM devfreq/QoS and interconnect patches land, we could
potentially trigger reclaim from gpu scheduler thread, and under enough
memory pressure that could trigger a sort of deadlock.  Eventually the
wait will timeout and we'll move on to consider other GEM objects.  But
given that there is still a potential for deadlock/stalling, we should
reduce the timeout to contain the damage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5a7d48c02c4b..07ca4ddfe4e3 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -75,7 +75,7 @@ static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
 	enum dma_resv_usage usage = dma_resv_usage_rw(true);
-	return dma_resv_wait_timeout(obj->resv, usage, false, 1000) > 0;
+	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
 static bool
-- 
2.41.0

