Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68C221442
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 20:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EE36EBE8;
	Wed, 15 Jul 2020 18:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25F16EBE8;
 Wed, 15 Jul 2020 18:29:19 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id k4so2715800pld.12;
 Wed, 15 Jul 2020 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cTHMoWxuC8w1paGifv5pZHHfVqj2NNnMRc8mdaDgfNM=;
 b=rSyq+FJwOxcy7wXjjN1EbiekaEoDwTBrJMnpQurVf3auyEt8FLqYrRwd+7lKOq0eOr
 yFrMl4lfwjCxZNLhOJ73xfdq7WoGmsYX41Brpyq1iDJKWb+AayW4kh/K+FThlZ0DfpcD
 ARPZR+we2nYgeM6lUPR3fyDpg8zgYeny19xEEZnpThmE6J/ZxBiQ7N6dngnabDbsnhRD
 FDBJ74IEgu+VagTTd37ErS2+W+Mpg8iFaQXS3h7lSiU/uHXBQWP1kEHEjzg8avB2wdey
 0dkm8vRBa8dJxa6q5Le+dPnH4KQceX08iy3ZJ0z0OU2LFKVsrCcqII//LYATFK7/BfKz
 YJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cTHMoWxuC8w1paGifv5pZHHfVqj2NNnMRc8mdaDgfNM=;
 b=Q/Ue25F8M3GWlJAMpjmjlME+nGjvuONSNb3YDu3TsxwuoZO36wBcSaO2/UCJrCn7Gh
 4j9Lii2V6LiNcg4pR8yDX65rp1GPYxkQDhBQc9VSw/8lZys3Mw1f1vcXsupD75Owl8Un
 tzcMFGCt10m3D4Vfp3BQr0JX2d1RkH8MvRsfrrTiO0BNQRyiLFP314rtIKnDSy0y5PAN
 0HXntch7zKAJ1vxfWEu8cEdERhJv8phojRC5MfVgyjMfsZwvA6ezAbVwin4e+CK1NnIA
 kjWAjlKasxZ3VL2pm24hRqtvhJXXY5A0RbIKSiJf6HMvj3wGj90udk2bcRRGF2pZYrhR
 DOSA==
X-Gm-Message-State: AOAM530IqPpoh3aQJ4g4don5o9XcHiZ5Au/L6IFDwDh/XPJ1928W+miN
 5Wpv5VRNvTMTYSTYC4m4j+fBnhjlkpk=
X-Google-Smtp-Source: ABdhPJxgfhE3RxJz0+1WiENjPR8mSPZEIkPnPBEoCOHbbNI54IOtVMmPO88njHhf81D67XRp77uXJw==
X-Received: by 2002:a17:90b:1907:: with SMTP id
 mp7mr897633pjb.220.1594837758818; 
 Wed, 15 Jul 2020 11:29:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w71sm2674075pfd.6.2020.07.15.11.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 11:29:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: fix gpu probe if no interconnect-names
Date: Wed, 15 Jul 2020 11:29:53 -0700
Message-Id: <20200715182955.3081774-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If there is no interconnect-names, but there is an interconnects
property, then of_icc_get(dev, "gfx-mem"); would return an error
rather than NULL.

Also, if there is no interconnect-names property, there will never
be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
instead of -ENODATA.  Just don't bother trying in this case.

Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0527e85184e1..c4ac998b90c8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -979,6 +979,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	bool has_interconnect_names = true;
 	int ret;
 
 	adreno_gpu->funcs = funcs;
@@ -1005,12 +1006,13 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	/* Check for an interconnect path for the bus */
 	gpu->icc_path = of_icc_get(dev, "gfx-mem");
-	if (!gpu->icc_path) {
+	if (IS_ERR_OR_NULL(gpu->icc_path)) {
 		/*
 		 * Keep compatbility with device trees that don't have an
 		 * interconnect-names property.
 		 */
 		gpu->icc_path = of_icc_get(dev, NULL);
+		has_interconnect_names = false;
 	}
 	if (IS_ERR(gpu->icc_path)) {
 		ret = PTR_ERR(gpu->icc_path);
@@ -1018,7 +1020,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		return ret;
 	}
 
-	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+	if (has_interconnect_names)
+		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+
 	if (IS_ERR(gpu->ocmem_icc_path)) {
 		ret = PTR_ERR(gpu->ocmem_icc_path);
 		gpu->ocmem_icc_path = NULL;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
