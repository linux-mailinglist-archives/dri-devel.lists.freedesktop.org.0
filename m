Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E30269566D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 03:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CB210E7C2;
	Tue, 14 Feb 2023 02:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95DC10E7BF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 02:10:00 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z37so6733656ljq.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 18:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dg5npVEtTASzGcr4eJ+wVqqeUH6/+1vX9dbbBaUyogk=;
 b=BbmlxycFhE3h4MvUvNFd8zT591n4v4/EU0aisVF4e+55hZYOB42kTG74R4pGlLPki6
 NYAYux1rPnTKkb4Q6t+toPisCVWOz1k9DmQRcYWQFtgmE3YOc40c/9+tVzzzS/E1csx4
 SDu9M1hAIPwMUyJAsH/1/W++hwVDJV5AyE+Wjskp7LyB4+kkApKykU9Hr3+O7OsNA9DB
 mSYJv8XCnKnrfPRKSKJqDCoEFRcaTRH3Ym6DFOPHsjP+7TQtA3q8cywJGAuxvBPJPNAR
 MvPtireHDvJ0VUiY/ds8OE+28adRU0feMoHH9kgm9mHF3ksXU/Unu934Ju+Z+YWA9ECn
 nTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dg5npVEtTASzGcr4eJ+wVqqeUH6/+1vX9dbbBaUyogk=;
 b=tp+Az7VlaLe18CrFlxmcVwFcKZZwXDl+i/8IiJpIGr7+5V6Q0cQ++757HkFHj4lffs
 a4wgmpClnzpy5ndIBhhB+c9R1x2viW7NILwnH+g+D4J0UyhcxbQAA4EvExXPkutiIibv
 sJvOCO56EO25+bDRAp4iDBlJP34LY9p6UNzpvaAHl3QRYVnYisYWWlyGuyesFDfuQleN
 4cUUB73GRAGqqchVhKubtY4Y8MRfMgIvsSdIOI/YIY+kYChfSNd35IasTmqkSTWhmpp6
 cosm5/yHrMjTPEp6nw9/MeBMvLOVKycqSaxWI8XidtZ/UXFRXs4N9Tn8pwZm9WO2oF6X
 Q6PQ==
X-Gm-Message-State: AO0yUKUNyK8uS6RooR8Y+QG97Vd5ywVGxA3OhKIa44S3fhIsIosAy1Bq
 JhHTOdDVioTiJXLH53Q9dUtJ2Q==
X-Google-Smtp-Source: AK7set8FVMLGIVOfdD5mO52wDbfe3E+g/JNRA9zhUYix0s/deyvUjeuPyCPbl3Ydzfzfsfdn7EdEzw==
X-Received: by 2002:a2e:9106:0:b0:293:528c:c6c8 with SMTP id
 m6-20020a2e9106000000b00293528cc6c8mr260477ljg.33.1676340600300; 
 Mon, 13 Feb 2023 18:10:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:09:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/4] drm/msm/a5xx: fix highest bank bit for a530
Date: Tue, 14 Feb 2023 05:09:54 +0300
Message-Id: <20230214020956.164473-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A530 has highest bank bit equal to 15 (like A540). Fix values written to
REG_A5XX_RB_MODE_CNTL and REG_A5XX_TPL1_MODE_CNTL registers.

Fixes: 1d832ab30ce6 ("drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 8b2df12d8681..047c5e8c87ff 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -806,7 +806,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
 	/* Set the highest bank bit */
-	if (adreno_is_a540(adreno_gpu))
+	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
 		regbit = 2;
 	else
 		regbit = 1;
-- 
2.30.2

