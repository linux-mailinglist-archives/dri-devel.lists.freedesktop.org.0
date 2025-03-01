Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA31FA4A9F3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 10:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4672010E175;
	Sat,  1 Mar 2025 09:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qbrxD453";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4D310E175
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:06 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-309311e7b39so29217421fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821104; x=1741425904; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h5L/pucqd7w1XEPp1X1sTPz+Fsqhsm/pl7T20lV9Gm8=;
 b=qbrxD45321mWOyfokqWnxB9R4KfaiB6WqpLA8qBV1yb6GUUQu4e1TnoSoVGub4Vbw3
 SVKx0ctVKW8dNU/kneYp3YMeGDljTRtGLKGh4ePFhiuMzJg5BXxpXO1HQagqvudEOCUz
 FB2sZmKc7pkSHhwc7f6FWlPpynzK6+pN1LW5ZcwuTNQl11CMwmC4dDbGKDWNE0F41wM4
 rG77N5u/jbF0iVCYZe5e9PDsVHeGT7fsbBXPQfNz9NoZDvOSe8chWtSWZfKbpbYPh2pf
 GTh3CjyBd/ywJdrKepzBvD8Pv/chuv3ucwKn1GeWzmyxv76bVmT9jB/7wMaR40cZZpES
 b35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821104; x=1741425904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5L/pucqd7w1XEPp1X1sTPz+Fsqhsm/pl7T20lV9Gm8=;
 b=czrgwI0cFoJV23O2b31byzZF+qiV0UPxB95p9vH1jXjywzZMoFnUTMb4pMks0KNB3z
 I7XtepG4BqLUiHcU7Yos6Lt46cOQcteZAg1zwzRp5dhxdXkbfnWNEPrSXDS5bNkTLff6
 yFbei4B5ZqtDSlKDsI6bWGgW3wmffTgFyKNrk6KYVkwvlvTMUrktyYxh0l2fjeGkIYBv
 Yt0JPJm96ltW23hfUsmVhKSnKzVaxJ9qambojAmmN/PUZrj7Q817EZQLkE1fGXp3n+f6
 3KQsTH5/sorQW/7DsP5nA0pp8G1TVTWisrq06cKcnFRW9naulkDx0govPrUKx15+1K+G
 atVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcLq7Bd1CdXSG3xPlaflaYgWWbpx5hCHgovPDz+kKS30hty1JVw7tWM+VDb5k01s564SAKU0HAHaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWByvQCWqnMIaT2ZBjOZJjAHtLKMNumhX7WjfPVIr2bl8983b0
 LTlL+fjN5HVQivFQkAnI86obClAB/xmXCbkWGduLMBE1XeNc3LAljxub2XP0RdM=
X-Gm-Gg: ASbGncs55V9B2iWNub/ZKelBLzJ4bDkit9u4AEr/RyUcWobX1fL26onnHo72uUMsQ+D
 fZR3rO+Abo9Xa97TDbEesvpF5GpgYBmISMHQoxZAwdULsD258gn7zSQB9Y+vg3qbaUneXpQaO2X
 cbu8h+kp/GF3hSxsqxySDXDZttV1V5sUBx9sdLYM/aHWzAeeZoA9oH2LyD9agM/U/eW/WlBNZg6
 yONA98XE7jPh8i5U9YNkZbQ/+z01drAWuCxD6Q1z/rSj+wAri62wBcbs3SrTHVNh6ubtfZvfUJ+
 6Y7t11XTXvL5j/ElYpxVM/wSJgJTGuwJlqFRVTm8CB5gHvyJv+8w
X-Google-Smtp-Source: AGHT+IF6bPkXh6K3Q11IgVbCAEx/raWQukTULWZwW0cWZdP4xoy62YD1VO5brez04BzTxzWt6zMIbA==
X-Received: by 2002:a2e:9d16:0:b0:308:eb58:6591 with SMTP id
 38308e7fff4ca-30b93310978mr18756901fa.25.1740821104442; 
 Sat, 01 Mar 2025 01:25:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:25:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:55 +0200
Subject: [PATCH v2 2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8917
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-2-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MfIfb1GLue9MerIIR2rhWjY6rmZBoFPVe5vbiAysvVc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJobSugy0kB0JIsHODpjBT4yZPMEcMtlazNt
 TTJpig19bCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSaAAKCRCLPIo+Aiko
 1VQ0B/9QjGsUEpb+DwWLNz/fIYKFPwXC7E2uGmZ4Yredir90cNDR1OI3lNMPAxYFaM6qoQOcRjk
 WHdMYESn1aXu0fSNpX0hxt3d7J29pPQL7AsmolGiYRLsx7b4ioytiHfzQPqpveYeIp3UHcjrfSo
 fghL+fxJZ755HA3xa/g4tia4Djz6aKIp5opjOkNZXxi9oy3y6DUDoimd4GFk071lq3uxox9vmqI
 XDqnMFtuQ0Igx3CHoEOCW5cJLpu+sDu+Xa0gy+pMis6++f/Vz+F5GFANsvu7KxEDzTe0A8pLOm9
 AkvmZBtxY/piGB36iX2mR/pJTxjinj661+YqhnTvu+St/Kv1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MSM8917 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 6bdaecca676144f9162ab1839d99f3e2e3386dc7..6f2c40b303e2b017fc3f913563a1a251779a9124 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -93,7 +93,6 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

-- 
2.39.5

