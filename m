Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E04772C56
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2F410E338;
	Mon,  7 Aug 2023 17:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF5110E332;
 Mon,  7 Aug 2023 17:12:15 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-686daaa5f1fso3186528b3a.3; 
 Mon, 07 Aug 2023 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428334; x=1692033134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMDPDTveGL0XcUxjW8MDNhSNAkJwzlTE+WboD+rmGEU=;
 b=svVt1sgUF7x1YbOXMTb/LXp7QjBOTHtNb8DiQLjmMtrEWj4ty/S5vDIeMV8H12mp3a
 XQr2nX5ioj/beq3rDTI6+ojt44Z4DxeRpai4d7e+k7pANjjydatG2mTgT37mQT7Ff539
 uDj8V1vybkcUUTID5vu6jrgx0kyh1twMlgxmd2T/N6fPrh46TsL7aYuJY5RR87Vh4zEy
 jzL2d4hMqzqLQTjbIpnQ32lBmU9dxWSG1jGXSTvCDgrEhTokei0gJ4+/L2SorlPl8z5J
 5/grMIa9/ueGhGhxfCtjYWIE6SmxmZ1/GJCCw6ZpV3idMpjTjdntWXwxcaffTQrSCBX8
 jP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428334; x=1692033134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMDPDTveGL0XcUxjW8MDNhSNAkJwzlTE+WboD+rmGEU=;
 b=hsc/UknYOFrYobSYC1XhiOwojORRuvDxjYFceRkmZQYcjQMw1zVVNZ+16HFL+zeYYR
 6xs9E6zuPfFkyjLXH3POl8bujIOmOmoTflktPy8OBv+zilDghN3QzLEg7DKWxiiiZZp3
 6Ll99wbAHB8SPteeDwm+HvlxjGieA5K7Id0tyAWSgAUvx6//XOfGopDMEmhQXP189tLl
 Ehdi6K0+LXvpyNA0cnEDd72O6bPgiDls41iEYvbUpwhy36nIJ4o1ZjQYqJEHc7tmVsES
 kLmmFkw87GaR8mTRv9bHEFdwjofx18UYXVuf+JhOAhXaLnvbS5lEAwkEUs22Fw3lD5ig
 tRMA==
X-Gm-Message-State: AOJu0YybMGk+fYracHJBu3db5fwJyqdpbK1CaBjrdCX7cR6QzaO9xe4/
 XtrRv/1+SDE+Eypo8ukx+jMXQLiRJEc=
X-Google-Smtp-Source: AGHT+IESqsFrdWXCLbRPVnpB+2WjHUyu1uvM4zg/KZaTPTkJI5DlDm8uH99nJv+r7YF5tYdcV+cexg==
X-Received: by 2002:a05:6a20:9389:b0:135:110c:c6dd with SMTP id
 x9-20020a056a20938900b00135110cc6ddmr10076469pzh.53.1691428334171; 
 Mon, 07 Aug 2023 10:12:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a62e50e000000b0065438394fa4sm6564282pff.90.2023.08.07.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 10:12:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 8/9] drm/sched: Add (optional) fence signaling annotation
Date: Mon,  7 Aug 2023 10:11:42 -0700
Message-ID: <20230807171148.210181-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807171148.210181-1-robdclark@gmail.com>
References: <20230807171148.210181-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Based on
https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
but made to be optional.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++++
 include/drm/gpu_scheduler.h            | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7b2bfc10c1a5..b0368b815ff5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1005,10 +1005,15 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
 static int drm_sched_main(void *param)
 {
 	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
+	const bool fence_signalling = sched->fence_signalling;
+	bool fence_cookie;
 	int r;
 
 	sched_set_fifo_low(current);
 
+	if (fence_signalling)
+		fence_cookie = dma_fence_begin_signalling();
+
 	while (!kthread_should_stop()) {
 		struct drm_sched_entity *entity = NULL;
 		struct drm_sched_fence *s_fence;
@@ -1064,6 +1069,10 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+	if (fence_signalling)
+		dma_fence_end_signalling(fence_cookie);
+
 	return 0;
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e95b4837e5a3..58d958ad31a1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -493,6 +493,7 @@ struct drm_sched_backend_ops {
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @dev: system &struct device
+ * @fence_signalling: Opt in to fence signalling annotations
  *
  * One scheduler is implemented for each hardware ring.
  */
@@ -517,6 +518,7 @@ struct drm_gpu_scheduler {
 	bool				ready;
 	bool				free_guilty;
 	struct device			*dev;
+	bool 				fence_signalling;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
-- 
2.41.0

