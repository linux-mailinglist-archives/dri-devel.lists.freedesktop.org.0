Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A39805E70
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 20:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB9510E4FE;
	Tue,  5 Dec 2023 19:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578C10E4FE;
 Tue,  5 Dec 2023 19:14:36 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d06819a9cbso25084635ad.1; 
 Tue, 05 Dec 2023 11:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701803675; x=1702408475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pknw/VvLYNK3NWesRCpLV0ugYlmOF45KcA+VhnXY908=;
 b=S654pL4QTiJ1sIVGR8xiW5AfuLbLseN80AjZsPTswkkOtjqfL+77Z7CX9RvWHo3/12
 XgmWch4PYafoVDBphuBl8nqr4A80Eh+x5mmvY9ay2kqhRJSGYCvdIujhVecmwORk6SY2
 IECWQIO4m5XUXdY2cJ1B1Ovl12+cmRFxhaoikqk9XYnZGAwMgp9KUcSJrSj4/ejfCJPy
 e1Qr4gLi/Cfue9FFIfKfW10r8IDaCBDkfUXnocPKZ8tJZchc6TMXOKDj5jHIUJBEr+Av
 EF66zM0uouoSIAaG1DNMMgFB2kyGouHtWGtizbZeA37okVlUbDDNtPvbjFc3P/RzFqof
 nQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701803675; x=1702408475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pknw/VvLYNK3NWesRCpLV0ugYlmOF45KcA+VhnXY908=;
 b=w8MiMAHD33hpfQtTyDFi2vh2YRlV7f95vguJjRxddxnNImBuHLsk+wG2iqBJYLuUix
 n0vFRO6DpwFATcx9f/9qbqvN3Fqxnw4tIybcRMTrb/EDrTX/lmmW/4e2PSUtxHw1VSJp
 4P2r7AiDbkUwH9fKhtVeeD+7FChCMRl0cyPvXrh4Mo3gRINh6YqqwuaLE8vAYhCQmpTU
 UJxxhfYQdCQW/umpR06UkLJbr+74YvKosPUe/8gIlweIDDZ9USGP36YhCEdE8hsH9L64
 xG5h1aJ8OVS1K6sO+bmRF0EfnFKJEHaWiWZMQlp7qWbgO3QcnmtfAdX/aExwuefjMMl2
 k0vg==
X-Gm-Message-State: AOJu0YwT8o+WgvopvKg0+Bfj4M2dXdnaYCEk4pHeHwo5ZIegO+behx2m
 NdZ0nIWraGe+Aq6Hn2e/15jAHx2gObw=
X-Google-Smtp-Source: AGHT+IH4QhGGCVQMZI6/S/JvN8KqYxLVz7LDAfS1buVk/65HdT/cEHqN5rKl2W7Ul3X8Yiq0f49aKQ==
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:ae0a with SMTP id
 z12-20020a1709028f8c00b001d06ffdae0amr3516430plo.113.1701803674929; 
 Tue, 05 Dec 2023 11:14:34 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a170902f54e00b001cfd2cb1907sm3871557plf.206.2023.12.05.11.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 11:14:34 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Expose syncobj timeline support
Date: Tue,  5 Dec 2023 11:14:30 -0800
Message-ID: <20231205191431.373564-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
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

This does unfortunately require a mesa fix to avoid turnip hanging, but
we don't have a good way to know the userspace version.  Fortunately
that fix is now in mesa-23.3.0-rc3 and later[1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/commit/2bd7e293bfed5d2956a5dcb3e17555d0f6817986

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c        |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 13 +------------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 50b65ffc24b1..c7ac2c0a7e27 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -893,6 +893,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
+				DRIVER_SYNCOBJ_TIMELINE |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 40878c26a749..9cffa4b50c39 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -511,12 +511,6 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 			break;
 		}
 
-		if (syncobj_desc.point &&
-		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = -EOPNOTSUPP;
-			break;
-		}
-
 		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
 			ret = -EINVAL;
 			break;
@@ -593,12 +587,6 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 		}
 
 		if (syncobj_desc.point) {
-			if (!drm_core_check_feature(dev,
-			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = -EOPNOTSUPP;
-				break;
-			}
-
 			post_deps[i].chain = dma_fence_chain_alloc();
 			if (!post_deps[i].chain) {
 				ret = -ENOMEM;
@@ -617,6 +605,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 	if (ret) {
 		for (j = 0; j <= i; ++j) {
 			dma_fence_chain_free(post_deps[j].chain);
+			post_deps[j].chain = NULL;
 			if (post_deps[j].syncobj)
 				drm_syncobj_put(post_deps[j].syncobj);
 		}
-- 
2.42.0

