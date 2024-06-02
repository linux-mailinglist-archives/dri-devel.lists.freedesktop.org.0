Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E58D7867
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 23:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96DB10E094;
	Sun,  2 Jun 2024 21:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y0V4EYIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D302510E0E8
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:58 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52b950aa47bso1238002e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364397; x=1717969197; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
 b=Y0V4EYImn3oLPEl/9OQ2LHNYN8eTCWxv8XmF8hvmZk39kjovO8AkroQwBImg4ro8w9
 eDsJ5BsHXsIt+cy5V81rFEvKQPxkxK9Y8tQ8yJa3v7Svc+fenikg0VWOFI6k3vtp7mCS
 4HLxU15C4kX9K7TSxXaGaCJTj/Y+1qIDOtuwi2tx3xU2USkoOp1m3SN+PWHt0NceLcls
 1SWl14g5RJP1M4f/db3Sl/FprrcPPjwQCjFXcFDuNutONjI80seu5bIiJDuhzioQO1/b
 OtrdaedTWzRto/TA8uea7xM/Lyjrm4W6djoJgjAeESgcrh9U4MhHnq6EsmXl+IBQfPzB
 BVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364397; x=1717969197;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
 b=roeU+mzJNp/BBjSGc939eSHU/zdWOxXoyXHW1eEVRDmLaDC68uCv+5lNWEotPVgD88
 NxkTzePQfP7+jydLDnP0FLHoj6d9SNcehoFxb+aZXTCePoPzczT6o+/S+PHZqFBevwDK
 HFlPFEM+qyvrRt8Rp8p6k2M8qF1O2lYc3eVKsZKHpf4cDF8/1RxLrxyeWVARQsAaYNFc
 0wWgbWMcw2+PH+KBAZGN7ldcby1bxJ5ypWgbyctxOr2Ur4yQVbp3Qox3fjU7w5RjyiLz
 W9zl78X2N3u7U7fHr7paq591jQM4FenZbJDYydQTkzDl5wcbrottghsn3bYp3SxzRyqt
 R2PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaaBVvZPVHOHVsRk8cIJGSmvbBe9w7B1JViHGKeRfl3tQYX+wlWlLuaRKJbt1ICy4dDn8BK5UvuKJu4rvEv5Lxuw6nOzZQnq0mF4MXTHqX
X-Gm-Message-State: AOJu0YwaUz0wKktMh2fIHa5t7VeVa3VIoQ1ADX3jGxNmeJvuJLEiKoUS
 I9Uf7tvuQMDpqnunThY6lXL9JDZHYqdjQoMhxDEAXeGyIqvCEb1ZnxLzCuz6T6k=
X-Google-Smtp-Source: AGHT+IHz60PkWKk1NRMpJcn8TjxRZTtqgum1tGKy+1VleEMZYuUYgpb3OZofDSjCZ7qHmtMWyzKO+A==
X-Received: by 2002:a05:6512:3592:b0:523:87b6:2ac2 with SMTP id
 2adb3069b0e04-52b896bfd01mr4266965e87.40.1717364397106; 
 Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:54 +0300
Subject: [PATCH v2 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-8-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kt+mUO/v24R5t4QFhxIPYKNo9RIjNHA9NWWDdfrHipk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalyn6cTyjM6xpyhZWng8UYIofhWpakKWUPq
 +h2aXcd8dGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1fDYB/9fA+ZSwXraqbAljD5cg9JXqZZRR+1Gw+8Ov7NP/tRx8yN/hIMDapaQRnCPWZ+UO9k8bdc
 NHLyrtOpm1iHwR1mom4Ytm1dJpPUXQiQJCr4nxGJlgI5GZNZJDdSDiSHu1TwJuJyyFFzTimHvQr
 imzVFisFINLY28RRPLMdktZJpKKQzOOvxFl4lOU6tC6CzNhAfx2APRUCMKbZoyiysCUYVUzliVz
 I/10D4b86ZIG84BgJIGnPJXxYR4bAp1IHYY5FJkUXFvn8s58hNjYq5691UlhCdr7TAc7l8rTuEE
 Ufnlyam2nISIKlakzFPbc696wveo6RXXvAGr000Bw7tFrnEV
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index c6485cb6f1d2..6d7c4373bf84 100644
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
index d1aef778340b..af2ead1c4886 100644
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
index b5848fae14ce..6000e84598c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -852,8 +852,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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

