Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7034B9150AB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D582C10E4AB;
	Mon, 24 Jun 2024 14:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ivq6fzLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC89610E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:25 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52cd8897c73so3125613e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240444; x=1719845244; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
 b=Ivq6fzLdrZmPbF5RLGc6a2DXQEHuUDh6BD2Q8EniRqK3GHFOsy/DflTVpNOLbh5/LQ
 HhgCDwyaqLpjufBdySEtYzdjVgTR5unt44sdjYssd+1Zmy7kDiWyIVBi9PdPoluziq/k
 DON1P88ragm3bNo7HI9v/Iednvnne07C64KxEC8bif8nMO/Cf/lvuwz5KpIOzmoAEDGM
 tYUd9NGBQ6QarOBb6bGGuGjPrTHyqqc2fLmpEbvHSVlYv1xJWrU9CpBrmYdEd9nyrR7Y
 4fSccHZjwFD9oNG7gMpQG6yfTTTHtuDWM237pDdIUysq/bYQBYShUz+w7aeoJJkdqbWB
 trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240444; x=1719845244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
 b=QjFBtT/nn7DrxlMRLoYaRozoDpKFYaYT6vgc5tTnEnlEXn77MC4kP0TkvLy7n2YncR
 lMkBcxGbU/LjqU7hrzUjCkO4oDGTBwUmaKJJt9Mylse0nqvTs4HTFx1sGCZHKwaPPEWu
 3VXxQyWxeBB5+KHYAKg35ai5t1xW1NUwXqguKMOBzWRFcYpfDtcCdsOeJrFq/zC2fuon
 EWmf1MVN+o+T/q+4vx8i8vFfJZEx9EIlUk55Ld/UDtNrLUXBTcDaU+soeRNYXvNtpcYT
 TKjgN+6HSasvjuK80aozFpFYkpvW3mXgdu1IAkvKSUaujrW4Xxwxpt2E3WBS2yUZUkR6
 E6hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpQ5re3B/Oj1KifORv/AsKg6D0Es2HqmfdM8qghC0dmefcyvvpbVXNGQdI57cjCrvuUKVe6hqMePdSEGvFGpIbw+LvefktUkff/MeSdnIW
X-Gm-Message-State: AOJu0YwOlk82jYs19ReaSvT1Kqq4SeYdWqzDTQLqvAxC8kvFZnmWsHQL
 XlNkPZCsEsLBYWEqQz1pRQYIAaFa9heAsF5WAlGX75I2SPJGU0iX74p/bZtRXQw=
X-Google-Smtp-Source: AGHT+IHkOF2Y2zANjunOdHDWnrdOGAYMf0TLfoEW8ALlmk76VDM90aqYcMM61GQSCR25Fkvk941mUg==
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id
 2adb3069b0e04-52ce9828502mr1763157e87.32.1719240444218; 
 Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:21 +0300
Subject: [PATCH v4 15/16] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-15-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ga/ZJbhrUVk+TaFBI1WYIbgIC50tjM64eskl8EV4ahM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbxcu71N+9INNfPPkK2CIB3z1cLlD5fiPt7C
 6XiRIHuMeCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8QAKCRCLPIo+Aiko
 1UaEB/928OC54/bQndPdLYJkjPxLl/SCr//YwTjXVSHMNXnSgrecsYMJhPKDnEW8qNexGyVS8+a
 wF7OxggT5HQncRADsqPElHILbu9D09xgpxqijJcgPR6hsxKKO8wJKc2GBkpxfgOC3MyvJ2K+2KL
 Uf5+lVNKy5Zb+6CyTP8GzZqIlAJwL0+bTplxXneIQiAidLaqkLrj6+0oEQmCOCxDs1yXXjLXW2K
 QRJ+KcCeAz+K2waUsMXJVZzQoYy6E9XobyvKF/bagF4Vpb/rVD5qcuHeXB8hi6hFW9dD3YCSsB+
 B16QlaDN86TJ1l7K+ToJBIjmEWjrNLQTOIlS7U5NNqy8qua/
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
index a629eb3a6436..4712aa6f7929 100644
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

