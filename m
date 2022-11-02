Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA46171A1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 00:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBD610E561;
	Wed,  2 Nov 2022 23:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2ED10E54B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:17 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j16so139841lfe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c55txKhE8RFQaKFPB1LANvhtQdHp4s4KlPHFEvihAOs=;
 b=JjgQyTbrvfrA0k4TOfGyJm2Bt9+7jLRS981xSiM0unzDPwxCu3uvZhVKwXJUdxuHW3
 e4i9T6Ldpo5wCpNtLL3nXEPuw/u5BIidnhk5C8/cmAii4ZN0wKUoIMn4M/e/OI3BfhbJ
 Ce0IkxtGUUr0jpkea8vHFKKZwUQDJPM+oPnOupN6SmqjJASahUPBk4B0dgboK97TNKrZ
 liD82dmwCYksbpxVU0QUZOWrn3O21a4wiJFqNMt2APQBwgBdNmH7FGZ8f8OlKuSSR/O8
 CcXvs5duxWXoPCrCB5n/FqZz7dqc09Tt/M0OhfgVJNEWuPWpzBjFrGsiqNpMBgnz08Ke
 g1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c55txKhE8RFQaKFPB1LANvhtQdHp4s4KlPHFEvihAOs=;
 b=6lJuj5HmY81dhahQbEpfxHgwNNn2Dy9oSvexQf0jTFyAAZhxJIfbElmEqoSm33VDqr
 /zj4meqdbBLi9r1GKPmnRNVfu3376t2pbiLavGRNIPFvOxadJiw0EZ2L9kZcjDXc7Kyt
 dmPlSpZ+7fzrSvNi9XEfJfxFNWwy7oDO78x+2YW4iPIEpb5ggvLIiVOk8/xp2j43v2VH
 pXPZrtvbLF0z/1UufXCLUVe20za+lFZ/mQKAcHBzIjkqg2oxmdhltnuFev9wySknZDRO
 iF76kQgFxAQb6gKK6mKhutdxSiATLSlcMdQc3G7zIUyFRJwsRQfnsJOMZpiKgVgGNL2W
 U2uw==
X-Gm-Message-State: ACrzQf0q08FwSgPoyIYevIZ1miW3aRNaVCIqfygAJxTh4jRCvCHp9yKf
 yfuXS8JWtIluK3Z55pJ1Evwc5g==
X-Google-Smtp-Source: AMsMyM6i8kH2PIK7323eH+pwjjpyWcRfkIoG7iuiAv+Uzo4hkPXJC1+aqzmz2hx5BpFsqt/p7M1Ekg==
X-Received: by 2002:a05:6512:3446:b0:4b0:69b0:ba15 with SMTP id
 j6-20020a056512344600b004b069b0ba15mr8900465lfr.184.1667430796785; 
 Wed, 02 Nov 2022 16:13:16 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Date: Thu,  3 Nov 2022 02:13:07 +0300
Message-Id: <20221102231309.583587-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
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
index f3660cd14f4f..67f2e5288b3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
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

