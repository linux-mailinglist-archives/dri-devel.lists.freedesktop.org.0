Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB070AF42
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 19:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EB410E1E2;
	Sun, 21 May 2023 17:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEAD10E073
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:21:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f00c33c3d6so6039394e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689709; x=1687281709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aL7y3wzagnr2HfjgObLdfzPbAHB3ifg2d+IXSFsg1QU=;
 b=GsVAEld/oI9yK0l6q2C4BZv8SsAtZ8rQFk6ByzPLXa6jn+B1/ad44CM4llg0ulPxQp
 R3+M+o32S9oAsar9vfkHrh8ooQ1fUCXhAsftAmxNpXqRrN9KfqMUdExKwsRroadskxdQ
 eiSyKzsG+MrEc9JRIAb/RL/OWKxBzMBjfGdu3TtuH9ZN60qRTvHL/MgaCwKjWrnDPOla
 olJc0iVvrAAVEq9SpSukbiN92wN4P/8FToWQ5pbQpo9PYEY2F23/OrI9OQdt9Hc2qldq
 thwhHMx4xjciiqbR1iWkd2aI+hTDEdO+KZhxEG1yCI69llZckDPf6wvbalOFPJW5Yf2u
 S7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689709; x=1687281709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aL7y3wzagnr2HfjgObLdfzPbAHB3ifg2d+IXSFsg1QU=;
 b=PhB+7MF6FaLBavi7Naohpyj+ovhuo/m9uJX/Ca3M9lOcgKZWESBJflHNSp8NhH5AbS
 wyPgj790GIQ0lwBzJkY0IhUIcdxYU1BfvgZuBaBCtiP7/jq6uzw4Ajv7VSeJTu9v5D4Q
 q09699WVcMtg67/zqyUb6gI5bVk1rEJBoI8A8qYIfnLEh6PULxZ2C/i39uKF3I01nRb2
 JIbBnkWVVKA2UHCeJdp2Vg2dqylJO1wZoy67NpqwXtl8IXtA9ggBxqZ7REg2/YhK8QpQ
 P87/TibXXyyn9YyAAjYfvJ0vUJ3gDQzX75Hp7+RI3KgDh/VY0IKHYFLj/LYp5Dy1Q3zb
 82CQ==
X-Gm-Message-State: AC+VfDzSd5BjJM4V7jN+0UiivjSvrH0NA1nLR87/Rd9GO68rnPqipwAr
 bPUXdUaanuwbhV3jjMXdA2B5fw==
X-Google-Smtp-Source: ACHHUZ7evLh/2VEFyCJXkXaDUxmCRMJ0SsM9ISKW0W8NxY03olOJ+t6sUWJPuxoLeVF8dCRm3S4XZA==
X-Received: by 2002:a19:ee01:0:b0:4f3:a3e0:850e with SMTP id
 g1-20020a19ee01000000b004f3a3e0850emr3063162lfb.35.1684689708684; 
 Sun, 21 May 2023 10:21:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 r22-20020ac24d16000000b004f24cb9ef14sm686339lfi.47.2023.05.21.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:21:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Date: Sun, 21 May 2023 20:21:46 +0300
Message-Id: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop SSPP-specifig debugfs register dumps in favour of using
debugfs/dri/0/kms or devcoredump.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index bfd82c2921af..6c5ebee2f7cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 	debugfs_create_xul("features", 0600,
 			debugfs_root, (unsigned long *)&hw_pipe->cap->features);
 
-	/* add register dump support */
-	dpu_debugfs_create_regset32("src_blk", 0400,
-			debugfs_root,
-			sblk->src_blk.base + cfg->base,
-			sblk->src_blk.len,
-			kms);
-
-	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
-			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
-		dpu_debugfs_create_regset32("scaler_blk", 0400,
-				debugfs_root,
-				sblk->scaler_blk.base + cfg->base,
-				sblk->scaler_blk.len,
-				kms);
-
-	if (cfg->features & BIT(DPU_SSPP_CSC) ||
-			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
-		dpu_debugfs_create_regset32("csc_blk", 0400,
-				debugfs_root,
-				sblk->csc_blk.base + cfg->base,
-				sblk->csc_blk.len,
-				kms);
-
 	debugfs_create_u32("xin_id",
 			0400,
 			debugfs_root,
-- 
2.39.2

