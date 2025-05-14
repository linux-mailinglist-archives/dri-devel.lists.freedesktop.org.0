Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6AAB7179
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBC210E694;
	Wed, 14 May 2025 16:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RfPPAF+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F099410E691;
 Wed, 14 May 2025 16:33:43 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-30c54b40112so36996a91.2; 
 Wed, 14 May 2025 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747240423; x=1747845223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=giCrtqk56/EbDcVLPZnFActrlq6d0kOfsWi+ZhZMU1A=;
 b=RfPPAF+foT7pzZKkqUYdm/eefqdBsBQ9yOJ1kI8pDCa/rzfAWigWusT373rF4LsmbC
 J7PUTwbt2CoDQBdkpqX2uqk4otO93341yHVCuQ7gP9hKzlO8SxbeEkLX14Et60dIBBuh
 eLrtKELrGGHLcO/ktJqPGynONLWmCohs+qNwcuK9gvWnKwBV+kxZeCH7CQ2lV40dimui
 USkTUwE3H08axVIHvCI7WJ8jPse1yrC3QG7JpeSDgPQ9oCoyZRsmb+Njv34AWBZ4HRQE
 6QH5icCGN1ptwzA4uXsKomEhesHTc56NRbl98+LUnd4ogXoJU3yQ7FrHVQQAzzENVnlR
 OTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747240423; x=1747845223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=giCrtqk56/EbDcVLPZnFActrlq6d0kOfsWi+ZhZMU1A=;
 b=DEC+vKXTssKTCEu5Ee4RB9Z5F60gPy1ZnyUhWQzTsSoCNa87BaVGsAol5s2umBIDux
 nyEy/31IQrf8/jcvH10rMTrVAZz0qd/6TGY1Epj1WQsNUjCwKHzm5nfQvwybZPJpR8c6
 Iwofp3H0tSzMX5Snb1BN4SsAOZADYIEH0RT+kLRTlUj5vrv3wR/1BiUMsbhvuT9c4TCN
 T4Yp4kdj1nZOtwNAtqbO1kgfDnaqj1x1SKSTKhtJAGF1z4zZg66eCxRQ7mlaz/2W//GL
 mxoMbHE0FydMiCC81BwhKNaZhvpxLT8caw1oIiDM5Gw7zwk0ts0X7+0t2pBA7ROViiiC
 CQBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbRNbOlMUlVg/h3G8RghwRyUrhK7YyoO69w0kvFO6dGPMio+N5uOkgo0j3BZgKi0P5RPd8I5GW9iw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDwwBlQMYDrGY3FEssmU9WuEyj2kI+c1GJwNVGU2Fa3c4lufKK
 lFBlbPEWC1E17XdG/VAHJMMdorcRFiWnD0IWpSR+2sKQ30BFJzmrWcv56w==
X-Gm-Gg: ASbGnctOMXQOSL4ygHr9TFT3ReZ6iW2yRNswRr8tlpZ3RzKNSfKVmbrgY5xr4MYn1TT
 QZcGHetE1zgRsItp/Pvznb8YN4mLyn57/nRGoe8qCNqFqpdL7OO5MyxKMsAQT8snKGbmvySvkB4
 yd3J02BaN+gJYP+RWV6y+FTi7eglsSgq1xdPHBJbKsh7qPrzQ/EbGk+w8kGzQwPmAUoLcn5oU04
 YL57MM8m1GoCtFQezGqraJ6/rYma4SMpYsckbVKi3va/f/sSW5aN85c6PsE2WN550t2FQ7PWgQa
 q6pSvaBshWc/BBPGDVdbNHxmZesbMhexsJFtNX+DIgyhr094kjgkLPAkqem7rYf0aOaOrATocPv
 vDPLguYRfCD7V2uLm/t4UMsUirg==
X-Google-Smtp-Source: AGHT+IEKDLVaJTyQcdwmJsHMQpLOYV6IU6ZnpNJqxuawDUSfC4gUx33wXl6ykdcJH394EGz/IhSStQ==
X-Received: by 2002:a17:90b:2f4b:b0:2ff:784b:ffe with SMTP id
 98e67ed59e1d1-30e2e5e5a8fmr6693177a91.11.1747240422852; 
 Wed, 14 May 2025 09:33:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e334018c2sm1810665a91.4.2025.05.14.09.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:33:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix another leak in the submit error path
Date: Wed, 14 May 2025 09:33:33 -0700
Message-ID: <20250514163334.23544-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514163334.23544-1-robdclark@gmail.com>
References: <20250514163334.23544-1-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

put_unused_fd() doesn't free the installed file, if we've already done
fd_install().  So we need to also free the sync_file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b2aeaecaa39b..d4f71bb54e84 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -658,6 +658,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
 	unsigned i;
 	int ret;
@@ -867,7 +868,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		struct sync_file *sync_file = sync_file_create(submit->user_fence);
+		sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 		} else {
@@ -901,8 +902,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0))
+	if (ret && (out_fence_fd >= 0)) {
 		put_unused_fd(out_fence_fd);
+		if (sync_file)
+			fput(sync_file->file);
+	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
 		msm_gem_submit_put(submit);
-- 
2.49.0

