Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6BB735C4E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9033B10E22F;
	Mon, 19 Jun 2023 16:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580C610E224
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:44:31 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f8689fbf59so2238866e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687193069; x=1689785069;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uceOjOeFYW3YrOQKTUQY3Yfirv5mMIrxQprXiD+0ONY=;
 b=xOpv7V8piGwp9kSuScZZYSxnOZCd1tk3gtMa7ADQ1jETVtQDlOZSbz2uvTAIlOGc3W
 WklI9+RaTjwHA60bw1xN/rT+m1Xlh1D+00CdRAXqtyDZQwhFz9wiyFySTD9ik4C6HjOI
 +oHgfZYqmxzeIz6lR6rDj8pLEP1yiRds05eBGV3pi8O0xwqmlUvCMxTPdKpfNR4K/+bp
 kwtVrVUw9fVKf0fIgMu1OAYdESLJvmKaRLj7f2Msy52SLuJ23BLApzG6KmA9Rk61ffcC
 +DScSF9HB6sfexQETdwd9EC4aFcaYDeHHicOnu4Ct3QPlZxllOQPRpjUlFm/qAbkAuYd
 BuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193069; x=1689785069;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uceOjOeFYW3YrOQKTUQY3Yfirv5mMIrxQprXiD+0ONY=;
 b=dZN71DxdrUXxtzPgb6l03enj0as6WKLuFuCSxwUDgwMaSQTvfmNXMFd5HLhlM1NVjl
 Lc25PZn5XND3Fe68kkiM8GhZRYU7Y55QlDGC9bbj8HmZYAMftlJMqS1u7n/jmpsqpEKU
 j4Ad17VhyomTkO93Fg5AS+I83D5fLzIaRRNKI7aOCrTEWcKF4E5vnFBdwKBTCn0nFPyA
 WXCy4Y72rdKJiCmmPaN3e1YttD2qAkgme2AOSX8+AnP2z5hOWB4G7Ugq8EVrZaXVrafj
 F7uPlOnC8RomyjUOz9vf1sckvb9riHg5EyqppLpEOPZYMdVbBN5nKX/1pMGzFLlTe+Pk
 IwrQ==
X-Gm-Message-State: AC+VfDwYkDYK0+e+sqa0BtDKsH+Qp9oFhMcBzV/ZSyhk9CqX6xf7iQOc
 Ge2TKvcwGJQ283Lk3fVWdiBvww==
X-Google-Smtp-Source: ACHHUZ55co0W+lBHMkpkIC71790GAjDutHsy5crYaSggmViTCmrlSdoglUSzsLjo7L/kFLehqHaRFg==
X-Received: by 2002:a05:6512:1046:b0:4f4:7a5:e800 with SMTP id
 c6-20020a056512104600b004f407a5e800mr5318895lfb.10.1687193069425; 
 Mon, 19 Jun 2023 09:44:29 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
 by smtp.gmail.com with ESMTPSA id
 d9-20020ac24c89000000b004f849605be7sm1774293lfl.292.2023.06.19.09.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:44:29 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Jun 2023 18:44:25 +0200
Subject: [PATCH v3 5/6] drm/msm/a6xx: Improve GMU force shutdown sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v3-5-a3ce3725385b@linaro.org>
References: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687193061; l=999;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HgL0AdZtJqxx0twaid3jHnuqKqCDcBlTAxb3JHJlxVw=;
 b=Pf6zJ0t2/uvlo+V9LyriSjXmfPMpP8Bno7oiFYGpMsSxVxwUMlFcB7vC+QzDp3HIKqNnv00kF
 IyI9s9s/9X7CNSdq1Wjolu7Eh34qSmxBKzhPddf6H7Ru943onBZn7t1
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

The GMU force shutdown sequence involves some additional register cleanup
which was not implemented previously. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9929ff187368..55b12a8066ee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -893,6 +893,13 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Make sure there are no outstanding RPMh votes */
 	a6xx_gmu_rpmh_off(gmu);
 
+	/* Clear the WRITEDROPPED fields and put fence into allow mode */
+	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, 0x7);
+	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+
+	/* Make sure the above writes go through */
+	wmb();
+
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 

-- 
2.41.0

