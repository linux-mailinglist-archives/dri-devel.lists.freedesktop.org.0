Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6671269BC3F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98CE10E57B;
	Sat, 18 Feb 2023 21:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DF610E565;
 Sat, 18 Feb 2023 21:16:02 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 8so355581pge.10;
 Sat, 18 Feb 2023 13:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Jl0bAAXIZTjQ7NsDAeqTzIEhvjQzgg5/X7BsK4u81Y=;
 b=Ypm3OEaEuberWEEJkwjckxIjd/fHXeD+UsK2sNxPfOh4VXSeIeHxGyby2GuFmyckgB
 DPDPfvmi2uvJ7m2w9ZXK3H1Ekv2+II/tBc0aGXy3LefRYqgovm0DXtFUG/3/66OJN4iE
 YqOAZ7tRtVL4IMhiN+VmmAehUqGvglfHf9UTRFLCXJlwg8IMcrNqpT87lm7YhFL2srhA
 /yf3cvPBlakDzzA63dLpzDbxyi8W6tpPJBgG/p8y808RF05uk0cx38i6cB7r5fBCuZdJ
 JXI1niL29wo25W9KmsKxhyFpm2IP/w+0LZnJz4MIoDp2aP//Ap8lQlE41lyS6/oyFtPJ
 1IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Jl0bAAXIZTjQ7NsDAeqTzIEhvjQzgg5/X7BsK4u81Y=;
 b=6mcgwadx7PUNZ6T9A+YrmYypmdlWG0+S4LDB80y4cLepmSHvQnd9hKnRxLSgLsczP7
 VZ2uO3DOLZlTfNlD7YVqER7Fk+UCP2W+JUweMXObT8kLvTMwYpCTmns4u7nU2MsW6tlZ
 LDKG69U8B5r3HLhveN7kdW6LglAXE27Zn8NWaUvCfXScDlelBfoN+aujGtYg6TtdI81T
 tutXLmPI6tepLxxVd2vdEY2h/ZePwoPBY0bZqzQbtlrZNyCxPaELT05BY35UzU+vl8WG
 HaoKdy1/bnM8Hz9ek6olFVmEI2h5ze1BLXD/C5LtlKjqvgSAKCEfGuQSCMlW5VPaCE1z
 AxHg==
X-Gm-Message-State: AO0yUKUlo6EZGOHxgA/HlDWvNnfcelIxmY1w5YN0W0SUzGLT5tLyg9hU
 a4YZDi9YmEdZd0QkqGlLhi1ax8x0Iuk=
X-Google-Smtp-Source: AK7set9pC4wrkPL0tafLapsDNCmKgteFtOwdub9yogT8Dwsv0vCa2ZO4cR/0UWRxya11wooq0NMxTA==
X-Received: by 2002:a05:6a00:4106:b0:5a8:9858:750a with SMTP id
 bu6-20020a056a00410600b005a89858750amr9007439pfb.13.1676754962150; 
 Sat, 18 Feb 2023 13:16:02 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 s26-20020aa78d5a000000b0058dbb5c5038sm4957450pfe.182.2023.02.18.13.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:16:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
Date: Sat, 18 Feb 2023 13:15:53 -0800
Message-Id: <20230218211608.1630586-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Will be used in the next commit to set a deadline on fences that an
atomic update is waiting on.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_vblank.h     |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 2ff31717a3de..caf25ebb34c5 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
+/**
+ * drm_crtc_next_vblank_time - calculate the time of the next vblank
+ * @crtc: the crtc for which to calculate next vblank time
+ * @vblanktime: pointer to time to receive the next vblank timestamp.
+ *
+ * Calculate the expected time of the next vblank based on time of previous
+ * vblank and frame duration
+ */
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
+{
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
+	u64 count;
+
+	if (!vblank->framedur_ns)
+		return -EINVAL;
+
+	count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
+
+	/*
+	 * If we don't get a valid count, then we probably also don't
+	 * have a valid time:
+	 */
+	if (!count)
+		return -EINVAL;
+
+	*vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_next_vblank_time);
+
 static void send_vblank_event(struct drm_device *dev,
 		struct drm_pending_vblank_event *e,
 		u64 seq, ktime_t now)
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 733a3e2d1d10..a63bc2c92f3c 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
-- 
2.39.1

