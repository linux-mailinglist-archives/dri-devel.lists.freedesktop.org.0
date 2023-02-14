Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EF696BAC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629B910E94E;
	Tue, 14 Feb 2023 17:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FBD10E94C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:27 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eq11so18485320edb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75tuzeWbOHge8haUYR8VqjYvI04B0j5B+fIBRQ7seb4=;
 b=dAcCPrk/5VN/ClxEQr1TVvSb/2mo/TA+rgX9sxkv6f+KXSvy4R1iQXsx0231GcB+V0
 QOLx5lBOHEQ8hvs83FoiRKhPFLzJ6SQzY76lgQR5cd43St9NTG2RSiaj1DckHoCi3hLz
 lFsG0VuBW1ny48WR4JXTzZ6JtfEQLTY0nyHBQQy1Wc7xlOlXhNuRCGfR0CLMJX0MdRn9
 i5K/pRPH1NmekmUqOBeVHcgCA5BJtnvtd0ZHhqxZWckykRn9NUpB0Rgc01iCkSk/VaBO
 zqUZBD1bewZd/l9DLSDMzUv60BHMQ7YorigdRgm9ozGtsGeinss72sAgge78ie5IPZl/
 96tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75tuzeWbOHge8haUYR8VqjYvI04B0j5B+fIBRQ7seb4=;
 b=epjdZW6OMZwUq8NaUvtYliATkaKjhiXZGaSuoPigNnXpbqfcpg0Zdz1OsRNVwVu+zG
 l4wO7UA9nzchMkA+t+0k91kVTy2uhgdzCkiI1jrcadzWrqTFPRjokvUWlt2bW/fyAAiz
 HXkEFj9Hg6Se6IBb04F/eov/eWcSWMqhaq3fZmNXHmRLObSSc1QVDRVy14Yxcr+GlEtX
 TSB5XruQxnKAtFpVKgMUkd+raldshciAJTuZ8y5Jsfe8n2y/MkxvrWk3aW71AIioj+hz
 DvTumrmeb1Z/kpssl+zoE7/fF1MGMwjEr+v5OP4YXIeDoMbax4CTaiz5m9kDdaKelhM0
 RkbA==
X-Gm-Message-State: AO0yUKW1rGbw8m7KxkRVnSRgxm8l8WaYAogay/heeddF4BGT/RCdcRbM
 y35xO8D6qaFHbdQQkpxTP/wkNw==
X-Google-Smtp-Source: AK7set/hSEouGe401ODACUcZFYBVji3OrHZ/i1V9rNpDQ648ZWtc7eok3NgCAYZbGBGbGPuBvWYMOw==
X-Received: by 2002:a50:ce4e:0:b0:4aa:a4e9:fa28 with SMTP id
 k14-20020a50ce4e000000b004aaa4e9fa28mr3000868edj.34.1676395946610; 
 Tue, 14 Feb 2023 09:32:26 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:26 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 11/14] drm/msm/a6xx: Enable optional icc voting from OPP
 tables
Date: Tue, 14 Feb 2023 18:31:42 +0100
Message-Id: <20230214173145.2482651-12-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On GMU-equipped GPUs, the GMU requests appropriate bandwidth votes
for us. This is however not the case for the other GPUs. Add the
dev_pm_opp_of_find_icc_paths() call to let the OPP framework handle
bus voting as part of power level setting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d6b38bfdb3b4..b08ed127f8c4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2338,5 +2338,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return gpu;
 }
-- 
2.39.1

