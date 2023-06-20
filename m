Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7909A736A83
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514FF10E2CD;
	Tue, 20 Jun 2023 11:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CC610E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:10:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f8467e39cfso5885160e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259445; x=1689851445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
 b=INJmXdEmpvVXTm7i3mjAO0uySCULJiYlAGfi0xAC/HQG0TNF6pFPNOl3lRfnOcJmLV
 YTAsarOxgMOd1VtScH9QWuJzdxutC+CQzcDTWZzAggCpPr5HFxLK8PzB2hMeth75CCsK
 TDsMWhdivHMJC9nHTOEQnQCZZ9jgdgExA6AYseO9hp02lA4+ZoEnP/PJBsARms+8+2Uf
 iblB322RwEQAfICyC2mTbMlhG0UpgCiM/jOj7kw8dbYWUrEh789B1K+iwllvIjipSm0k
 UX68ERtZsgYYR7FQTUuBw4HXtDhcELRLDaiwqcFIrVqWn/AJvfNdJNW+vD3cDjKqRomQ
 7Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259445; x=1689851445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
 b=iUEZBFNhnWs6uxxR7vDVTFu3aC0rsLLVBPXWmtRpsiJ+HfYwmm+aqC4BoGEeEcg6Uj
 c3pJOwJxu+6MeIfsP889pcygHb2DZSEDeEE9g9cnpIMcRTSCEU7VtWztsW7iWqGSw+Zs
 7U7iSaXrLotWmpg6ITFUtZEhUqCfjBw2o6mEcZXCaEAzPSYY97eCANqQlxnn4zpCt/ju
 9p8f7bIedPsf+vzeIKYGL+EOmImORHLOgGmS2T7ydbkz6mskssHk5cCOvgIwEXqOSxpJ
 xi785X4BzP8mIYI9FTXNlshHEDWJn7w/XJORrF0lPPvxASSKBJ7kI+O74x1tVQYYHjlw
 8l4Q==
X-Gm-Message-State: AC+VfDxt1SgyI9ML0DkktGPmpl6r8NXV4Dog9VzdccxaJOgz/QS554Xt
 BuJCKEiTTBoEut4gFUik94sJjw==
X-Google-Smtp-Source: ACHHUZ5eqZqdWUBigkTrmkmwCMGTjarq6T+1Y4fXQLi7UIXvf2LYvX4zPoiELEETJW3uy09iyxY4DQ==
X-Received: by 2002:a19:8c18:0:b0:4f8:6ac4:84 with SMTP id
 o24-20020a198c18000000b004f86ac40084mr3396390lfd.8.1687259445484; 
 Tue, 20 Jun 2023 04:10:45 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:10:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:10:39 +0200
Subject: [PATCH v4 4/6] drm/msm/a6xx: Ensure clean GMU state in
 a6xx_gmu_fw_start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v4-4-b16f273a91d4@linaro.org>
References: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=1213;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xLnqc6AHpOSP+ED80kyz8V2j7nuk18OJ2Jy8h13Cf1I=;
 b=QopZRc6EUyhns0KVw6SVS/mXnt2VY3dxbBXKlHwjamd0sOsHi9ILo2buRVPW4sflNOLzCCv/3
 uwALjCxRCfDCC8KElFRyXVUV2TMrXf3AA/bOjOARIuUN8DEdT/p0VHy
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
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
index 5deb79924897..9929ff187368 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -790,6 +790,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
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
2.41.0

