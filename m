Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FE6D6245
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD0D10E69F;
	Tue,  4 Apr 2023 13:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76E010E32C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:26 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id by14so14587338ljb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0qagrlVseey+Z3DXDiCrx8oZOPPRUijOR+Qh85SE+0=;
 b=olKlw9NVMTPY8qU/GMy3FZ8dgTbD1Jb/GpVEVaJQGu6jl3ZEKMNtLjGicwAznkuVeu
 6lupcH5+ddLPTubClAEzBR2SYr/I2/3IGzbgq+vyEtSXbCwWZbrH0QoJ26WDC5H7lp+J
 HAbuu2PynH2UxzrI/63Tz+e27JdjGgKYVwYEBGZRJbPHLMw4lgMzC/YraQ/vD+kSHe55
 rFa20VtdEyoE9AF7YdS3am4luqqQXKlBVnuzZvUpzwVLnezEzDJ73JAx5ee2/GnuF/w3
 H6pYSLoDxUkxPyfeQBOIgcn4gebxkrGRFqxmY4pRe9Bn7jjS/rZgW5jm1TF5JN0C8RpN
 itgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0qagrlVseey+Z3DXDiCrx8oZOPPRUijOR+Qh85SE+0=;
 b=O6nGm3YaK70xY7Qs/NPECmc805UMXEZPfbKcfHVQ3BIms+HObSP/s7q/hhb287cVKK
 5UGEfMQvYkcgpHzbCxq5fiW7MDJWvUJCd7U3B173luBsKSZR/2fcfY2BAv0BHPOnvdtz
 Ujjhk5iGVBgr6r42qXVCW9YBVVwpRWSUw+4Zr+5P5i9Ueq6TpUeEo2tYbdq9S8mDwPdp
 DVagDzUEjrM+4lbgWIz1bonyqCwKjnMKO1MCJEGZ2840wvrAag1+XLMD1OSFiO16lPqe
 bcqGXDhaep6KZ7kBkreDnAwihrUNuvz5NCoiL6he7gkgyUlLHSSf+9iEJcK9e2nw1gTA
 I97A==
X-Gm-Message-State: AAQBX9fhBHbGi+hH4dvLSU6jyRLwezOLeFFm+0SD8nC+7WoUsOYy9K3Z
 L9xu9+JdGp5v9X4yOpCV2JTo1g==
X-Google-Smtp-Source: AKy350a5JwmFN0fgNwdhlQ/eKF2KIOS52lTB34fGxCPNrt7lFrktvdV8iHwC42KBZnFsAm4ZyG1llw==
X-Received: by 2002:a2e:854f:0:b0:298:aa96:55c2 with SMTP id
 u15-20020a2e854f000000b00298aa9655c2mr936425ljj.44.1680613766324; 
 Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 31/42] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for
 sc8280xp
Date: Tue,  4 Apr 2023 16:06:11 +0300
Message-Id: <20230404130622.509628-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index d30b797e90e0..3dc850a681bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.2

