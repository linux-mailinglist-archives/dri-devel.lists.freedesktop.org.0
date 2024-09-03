Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1289691E9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4226D10E3E7;
	Tue,  3 Sep 2024 03:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RJRPpD58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BBA10E3D9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:06 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f3fea6a0a9so42517251fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333784; x=1725938584; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jvt/zE2g5sFBtrEygf+RqS1sy6qu4DsII3e3BMDtLgg=;
 b=RJRPpD58NInwdqTY9GQm1E8atTIt9Q8SttpYdM59X0tuFUlYTHVjuY/dum4/eZgw2l
 uaihT+zvrdSg3z5mZlVfY/23QYWeKD65Kqo/qEE0bvml5Kt1n9MSZdofIDs6XjFJw+zp
 Ye3VDEMR92SmU0QlJB7gFZD5i0WvNSvvNg/luLU2qYGGczlO6mRCIMNzz1eA9WqozSxH
 JXup22KPffHhQyfLjdBoc9Ea0Q0YouzNcGUH6FPamKCeQtVfz6U/Iw5wL3Ns75xNAOW3
 tmKpi3k/3IjkarzWIIXUBIjz1DjclNw1ahrBybnMq9MQcLAmuF8OovuS3kkMbqzY0qVm
 fisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333784; x=1725938584;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jvt/zE2g5sFBtrEygf+RqS1sy6qu4DsII3e3BMDtLgg=;
 b=wesaaOB9tx/KL873MSCs1z4/hxP5ppEXdlKSzIthR31I1j+/GpvaEG5+7RhHfCTGcs
 to8ytPceDBwvBxL9a8O0741r3x/+84wLRZSn1khQLVqX1fxFxm8rNeIvizMkzctoxKZ6
 mMQTwt4yNXBA2CvxgvTOViXdEHVm/a9e+N5Bg8yWliFWyCM390/wbPrZsddZsmXea6Mu
 zeYk55jNiT9V+sS5Q4KqH772zRrwCKV+BZrom/OmTiVMZ1+tyEC0DtaQZYwQgUhBi3au
 EyiG0sGB2gwD7L5lFRPd0fj86NxArfRxuRnqwxYFqNGljbJtmqSq0Ioz171FsKGYdAhW
 +7/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4kecHjYSoj5Ndsx7npWGcthwkQgmeHUbX+HI2aKO2D11rHm9rnmO6gcesCd5v4lvwMe+mUA0iJ6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdakArC3Ff+1qtho0g9e/px5oRSabTMJ0D5yrSQlTeyh9OfM1t
 ZLzdOQ9qqT0XB+5EOrawdioRWpcFkXxDAJMqY5nJ9P9iSgdu5e7XJEOgtwpxivg=
X-Google-Smtp-Source: AGHT+IG2NOKWv19yXd1KfDhyIT6XWtwr6LCZRVwMvgoMzIrmU00jl7ZCn89Eic6jhwshku1GLd/8UA==
X-Received: by 2002:a2e:bc18:0:b0:2ef:28ed:1ff5 with SMTP id
 38308e7fff4ca-2f612ae4c49mr50950591fa.15.1725333784099; 
 Mon, 02 Sep 2024 20:23:04 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:57 +0300
Subject: [PATCH v6 14/15] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-14-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iTBdjF6/hREMLxbMNkPCIYndio+J7XKe88temKLGweI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q1Rh7Ly2t/9Jdt9WUIz9PPu21zjmVWyIXY/2t+MXzjt
 WH13N/ZyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJiFqz/5U62H9IXP/RpOZK
 u5A2Vj3B2Yd2LJ10vv2shpKNlZw3p2DI3JkHmVM6vY53tsnVm88uCLxz4OTaKYnTW6NuHxR4X7e
 S/2Pq0ZNrvPOC3+6auyfnc1f+pPBAy+KFXF4/vJWWCGypNLM0XuOdoxd2wyf8j3KmT/DpJiP7U7
 eDuxI/zWpgD3/G9WHzzbCpfj6lBRWx+v9ufyuZEdyduGehJeNu2ZLURJvq/a7h9+KneLJ/FO3qa
 PcOFCjou3pZIuNfSd4OT7O2+GPdd1Jm1RySVtYNNLBfllUeNEfFp8FCx+/7F7blK7TZfRYW9p2/
 O0PTlJU9Yv2Grg/vXrYK/A6f9//93C3qN5e7FN64xXYYAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 095bb947f1ff..b0909cbd91cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -13,9 +13,6 @@
 
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
-#define DPU_MAX_IMG_WIDTH		0x3FFF
-#define DPU_MAX_IMG_HEIGHT		0x3FFF
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 37e18e820a20..34e60483fbcf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -21,8 +21,8 @@
 
 #define DPU_HW_BLK_NAME_LEN	16
 
-#define MAX_IMG_WIDTH 0x3fff
-#define MAX_IMG_HEIGHT 0x3fff
+#define DPU_MAX_IMG_WIDTH 0x3fff
+#define DPU_MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f686588bf896..e935e9c05f04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -843,8 +843,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.y2 = new_plane_state->fb->height;
 
 	/* Ensure fb size is supported */
-	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+	if (drm_rect_width(&fb_rect) > DPU_MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > DPU_MAX_IMG_HEIGHT) {
 		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&fb_rect));
 		return -E2BIG;

-- 
2.39.2

