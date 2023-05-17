Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F1706E90
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5716F10E454;
	Wed, 17 May 2023 16:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B9B10E454
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:50:20 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac7462d9f1so10335181fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684342218; x=1686934218;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aSc4FWFPOC7I3VWo73gY6L/30rahECGBPz2uIJ+lIl8=;
 b=BD8AfYiBBLe/6Sigf9ZlRzi45spq2zvlb9stWhpy/B76+Jo9AW2w/rG8iX61pPBnMm
 TbkSE/bggMhlhsyxikrySK76J+/Ie+K+tcMI2+yT83I2H14Sq29eGSisfEYP4ucH6vjK
 +tRAm4kWroqXMMX3aLcWDnnYuVCymm5tk8FFHMWTwf7rzAW/HOoytDQIvoHIPOH0r+ao
 hOOxeWGkadd65nhQ5uMROg0B69Wg1SH/aafUlEDnOe9tXgZ4Npo+XT7nOnFCNJSSnUKX
 Ci5vHMFUQ6ZoP66qkzuGc4PMeLBhTlrrbX9IJ9oyvNZnyqwxiovbQRVb2fzG64wUEKPT
 R/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684342218; x=1686934218;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSc4FWFPOC7I3VWo73gY6L/30rahECGBPz2uIJ+lIl8=;
 b=T5U0rHVfbMd+wF/yVSeEL1uSe7V1pjM+3Tj/QUGUXMieK64vkOjelzXd8iINv/cCHE
 vv2m4UiJHjuXsHsVqx07h72jO4YTyKU5XyjzWvwj7CoGNM/W0cKF2gPXryD+R3zvHP0G
 Tn48QqGHKftmkpMKm1VHX9z2kOPnvfs/z3yPgYHVtielym+kC+UoLz8rYECHUV/ZZ08w
 Rgo55fH5S/Bp/3ZGbpFYJWo8keui1oLWWP1k6ps4KNR1kRO1AXsqdcqYh7sqNW0v3uXa
 HBJiXAQz4S+gIeDllB0+ljBNYyzGujyGbqo9t5dlNCaUHoV0NoqlAQSsR5hXPd0S+w9F
 xQWg==
X-Gm-Message-State: AC+VfDwyMMrFw4TYnPJA3o20c0p/5aZcgtvHiT4e9/GwBxZopuOfz7B7
 A3aEH9CsHFiPt/zDappB+Dncew==
X-Google-Smtp-Source: ACHHUZ6FaHQHgcfK2D22hwdfeZnqMr16EgduhClje7jaP2zHD6BkuFkOVZcicAq/MtCp+EGdtBFGfQ==
X-Received: by 2002:a2e:3012:0:b0:2ad:983c:3453 with SMTP id
 w18-20020a2e3012000000b002ad983c3453mr9404123ljw.5.1684342218479; 
 Wed, 17 May 2023 09:50:18 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a2e9cc6000000b002af0e9abaf6sm159224ljj.131.2023.05.17.09.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 09:50:18 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 May 2023 18:50:10 +0200
Subject: [PATCH 3/6] drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v1-3-7a964f2e99c2@linaro.org>
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684342212; l=1213;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=AafR4gmpdLdCW49giEqj+iQDIXWZqQQlcHizyhfpHRg=;
 b=BhCdzTabSPUF9ByKOuuSnx0F7aPAwFydWOHefDYIo9iawEJ0RnTP/Cui8OHVcudCT+qo1U893
 IYCczZPwG9FAeeywaBmx4XWmqx/x1vTG5047BD/4b/JOC20BN7uYaX6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While it's not very well understood, there is some sort of a fault
handler implemented in the GMU firmware which triggers when a certain
bit is set, resulting in the M3 core not booting up the way we expect
it to.

Write a magic value to a magic register to hopefully prevent that
from happening.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..ea6d671e7c6c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -796,6 +796,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
 		(1 << 31) | (0xa << 18) | (0xa0));
 
+	/*
+	 * Snapshots toggle the NMI bit which will result in a jump to the NMI
+	 * handler instead of __main. Set the M3 config value to avoid that.
+	 */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
+
 	chipid = adreno_gpu->rev.core << 24;
 	chipid |= adreno_gpu->rev.major << 16;
 	chipid |= adreno_gpu->rev.minor << 12;

-- 
2.40.1

