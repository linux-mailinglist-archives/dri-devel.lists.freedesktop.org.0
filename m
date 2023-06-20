Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA66737334
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9664310E320;
	Tue, 20 Jun 2023 17:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F57E10E067;
 Tue, 20 Jun 2023 17:49:31 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6b466305a7cso229209a34.0; 
 Tue, 20 Jun 2023 10:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687283370; x=1689875370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YP9agMwH9qTdzgrdMa4Tw0z3MqPQmmHAnxaAinw4+Q=;
 b=aJHme6UABMswG9QdPiy5kTYCW+kpk43s9dAK+sHeZ/hKH60fLmPZ5AC4ihfSPXw5xx
 xj9xvjcUMaIf4j2TTuK5dp4fYLXvAi9xJ+yOPPcwcspN2WH9bWxmILyEPdTWepH2NtOg
 naoTI4K3md0ok34rx70Gq0w3hAyR1LdTvv877L/qFeccEg/pIJJbgYYi89XdpYjq1eUi
 8SMfHLF5j0L1Lr3NMFzLgTTsoIG4yORRioApxXn528Wdoh3pzyo6pPQ5QY1xDk+3oCXx
 42I+pURot1AZRoA6UxqeslNeWsPt4LuZ128Ew4nFzfpsUGDWOCLcwa2OC2Re1mmTas5b
 XEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687283370; x=1689875370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YP9agMwH9qTdzgrdMa4Tw0z3MqPQmmHAnxaAinw4+Q=;
 b=gig9gKL+AtznQOX68mbC+vbFRijXvbtGc6Dzba4WEOoZna6iVLGOLVF84y1HXEhrRB
 CW/YkrxJQbon9D90mBjr4L4MWTJAxPw1+wLlwtvW/LOKiKEic8VXgQpIDUeEIb6DlUeO
 gMNCyT8y17BhW2eyj3BXECUqvxKpavfh/cN6PU8ScNaUgPqtgyxNXVLN8wqbogBctNoy
 MJLAoeqTGrE/VtlAApv09zdKzoCHrXSOudIGCXlR4CcOMtB6qPraZLIFhZKaNGo3dGAk
 /VjFnLZJqH2zx/DwuSNH0TSKNcyYzqvFX6803q8qWyYspgQ7Cbeos5yS8TLGRWYc6248
 hqDw==
X-Gm-Message-State: AC+VfDzKYY3iZIfCPHwAzA7ncP6aCEQX0xrLPhCkxghRtnesuuSo/o1Z
 l81tY016/sjKth0nfZ+mzvRrJ8PdotI=
X-Google-Smtp-Source: ACHHUZ7k61Dqv9ngYwXj+OAdQNntxlcFUozcpwNn3bGGocVGHtZPEloLWQWE9vBg/wCv7N0XDOyI9A==
X-Received: by 2002:a9d:5387:0:b0:6b4:57ad:3d19 with SMTP id
 w7-20020a9d5387000000b006b457ad3d19mr8286996otg.2.1687283370024; 
 Tue, 20 Jun 2023 10:49:30 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1e46:4f71:3f19:a267])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a9d7cd5000000b006a44338c8efsm1154892otn.44.2023.06.20.10.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:49:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2 2/4] drm/msm/a3xx: Pass the revision information
Date: Tue, 20 Jun 2023 14:49:19 -0300
Message-Id: <20230620174921.898275-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620174921.898275-1-festevam@gmail.com>
References: <20230620174921.898275-1-festevam@gmail.com>
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
Cc: dmitry.baryshkov@linaro.org, Fabio Estevam <festevam@denx.de>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Commit cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified
before being set") exposes the need of setting the GPU revision fields
prior to using the adreno_is_xxx() functions.

Pass the GPU revision information to avoid run-time warning.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Build-tested only.

Changes since v1:
- None

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index c86b377f6f0d..fc23810d7684 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -530,6 +530,8 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -558,6 +560,25 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	if (ret)
 		goto fail;
 
+	/*
+	 * We need to know the platform type before calling into adreno_gpu_init
+	 * so that the hw_apriv flag can be correctly set. Snoop into the info
+	 * and grab the revision number
+	 */
+	info = adreno_info(config->rev);
+	if (!info) {
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	/* Assign these early so that we can use the is_aXYZ helpers */
+	/* Numeric revision IDs (e.g. 630) */
+	adreno_gpu->revn = info->revn;
+	/* New-style ADRENO_REV()-only */
+	adreno_gpu->rev = info->rev;
+	/* Quirk data */
+	adreno_gpu->info = info;
+
 	/* if needed, allocate gmem: */
 	if (adreno_is_a330(adreno_gpu)) {
 		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,
-- 
2.34.1

