Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2192D6196F1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A74610E77D;
	Fri,  4 Nov 2022 13:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD8710E753
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:36 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u2so6259033ljl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FT1odVkd0+mwnt+QsL5l37LgpGJDAlm2HVp98pN54hU=;
 b=DySfT25fp+Vb1z+CtX7Gj5SjqpTUhHszdt0EB1kOqG5i1UYzthwbcm4UEFIu+SAg46
 8HgwpVgmlga3DlMNegvthhs0rUNOb8kco4bgi8Ijtiyp17B9i0GsPWrj4OCb4ItiA8Ma
 5XTzE642K8ebhq6pI1UlY4aWkAJ0kyUZJYaDIidUfWqqlScrRCrALxSuzuwo+Gcttu/r
 JdpBX80eDGyWVDyOI7nqHRj2n0KzcqgiO3KtQjkXe/+duhvWLe+Ad0TxilmDKUtjnlFr
 dMXYZMOmYVSSVwmyqLuR69I7MpA9ThSer8/iJZ0uoOvuzLkUQFGoKsAON27o0zKH+zT0
 Vf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FT1odVkd0+mwnt+QsL5l37LgpGJDAlm2HVp98pN54hU=;
 b=vKZZiD2mSf5zIoBiowiJYJOsz7zwA03flgKG1jg2i1pDT+kKHi+9My8eeRzkpWyxME
 PPMcZTJWlXxbnJJLTPllwSTl2YpEecDe5aPeVODIN798sLMwU0hXtfS24iD160MEbYUN
 4tKtQL7uqBFOQu4rK46sMjKHeq5KRuRlNyRE9s0T8XqU8W7PYBwjFfbMRBjIIMcwAIrq
 cmBZLv15i7agH66+T0mzHo44TprW/aLJiZeWwKiaKEyEPfBVUC3IVYtxonExtrWQ3oD9
 lqmXiHKelTh3jD0QnXIDe0J5jLXzPM7aJavpT/YXFiJwyP0dy1ZfPopz/H2IxPFw35vN
 oBeg==
X-Gm-Message-State: ACrzQf2ZVDPwUEHTZkpNnXYCr38O7A+JJ+H4Fl3oOkiJacc8Q3zDAAmh
 u/Pk+pPqqIrVMQJaa2bSOJwUJg==
X-Google-Smtp-Source: AMsMyM7Bl2YV9pxXIkD5j+z8yOwk7mGML1yHuS5s7xAJ3KAlq+hyHtsU2l9cYiDkiHefL1saqCVe6A==
X-Received: by 2002:a2e:9116:0:b0:277:41d:6c1e with SMTP id
 m22-20020a2e9116000000b00277041d6c1emr1979066ljg.330.1667567014718; 
 Fri, 04 Nov 2022 06:03:34 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Date: Fri,  4 Nov 2022 16:03:22 +0300
Message-Id: <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On sm8450 a register block was removed from MDP TOP. Accessing it during
snapshotting results in NoC errors / immediate reboot. Skip accessing
these registers during snapshot.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38ab1568..4730f8268f2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -92,6 +92,7 @@ enum {
 	DPU_MDP_UBWC_1_0,
 	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
+	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f3660cd14f4f..95d8765c1c53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (dpu_kms->hw_mdp->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+		msm_disp_snapshot_add_block(disp_state, 0x380,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
+				dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
+	} else {
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

