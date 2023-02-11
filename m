Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C319A692D31
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D975910EE7F;
	Sat, 11 Feb 2023 02:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1865610EE75
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so18132049ejc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZqb0RTRJtacj55tawWGTJ/A0DH+6EK+HSS/WV528Xc=;
 b=ntWYbNEj/CkNod+cQs9sigJr+hky565rND8VYa2yAD8GfbdloZtJo9rQ1uZjiSoOLR
 k1Y/k0Cozh4CdRjNCaJJsfpxs5Gx86djdCUPcMiNiSbfRMgVMlN7E8Qd3mLnm/B0Hhe7
 xPTk8uGOyNLBV7B2ldtnhSzFhROLQUNzFN1esr2cXFRVzNe04Xbb+4ayXJATOfPu5ZzV
 rRLFtsW36YJutStch0Yo50u2AqfNOO91r0cBlvfKUzWZSTwDcbKk0JOUkhBiCn8F30fv
 wVKFXR88vp34xd2YarcypEWT2I0EWoClYFYXZWLkqTp59NFcIKJgS0zSAs4keonheptH
 mKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZqb0RTRJtacj55tawWGTJ/A0DH+6EK+HSS/WV528Xc=;
 b=O6wR7FvuXVOzfq59RHzyVy1bqxqc6dBfO3wz5vaMaZkPECN9x7Nx5V0ZZYdSrguj24
 bwtUOcMgoXvqYYCGBdeWNxui0wFnXfb3uW4x/Mcng7ID/QbFeGRHYktLwnEKcOtnvFyj
 qXFipdjohojUwBN0P1YRMN5+hLlF2Qk8b/j7zj4OC5EEYlM4pUlxFstbLHSUSHMWPVf8
 Jxq10Lgj0Y8XbfGQXbHgIOCzHUZle0gzC37KdcolKmGpvdgTM+gHcIdgi1uLi+gYEujg
 N/WKsFiXkZFyd3htdbOm+7qrmKTFfn8m1VweMe+N3YG5IpBhRYjc2SbPOFGcf4lS5TuS
 2ntQ==
X-Gm-Message-State: AO0yUKUj+Jflh4ZnwIug5TFGJwN+Z6Ln6f5K7LKsxQ3IMwRJ/bStz7QZ
 LHIXSztXfB+2EwVYl8hc6LqRUA==
X-Google-Smtp-Source: AK7set8VHD0OkRisnqitT5g+pGQ26vwd7PgOHCT964tqum7SjJ1ztCsOAVtN4zLrwUdSvTVGgtDKcA==
X-Received: by 2002:a17:907:8b06:b0:8af:391e:e4c4 with SMTP id
 sz6-20020a1709078b0600b008af391ee4c4mr8792982ejc.41.1676081484734; 
 Fri, 10 Feb 2023 18:11:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 28/43] drm/msm/dpu: correct sm8450 scaler
Date: Sat, 11 Feb 2023 04:10:38 +0200
Message-Id: <20230211021053.1078648-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm8450. Fix the used feature masks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f3649ac9cc70..1acd109607b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -415,13 +415,13 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
 				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
-- 
2.39.1

