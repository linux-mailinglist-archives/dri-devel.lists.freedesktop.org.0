Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B524E792CB0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1F410E323;
	Tue,  5 Sep 2023 17:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE7610E0BD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:56 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bcbfb3705dso43876331fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935835; x=1694540635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvB2m6jWZ6h3dqLtwhCqsLJZSURv5HFp2WI8WShvmgY=;
 b=k+JntKCMN0OYj7nmAG43NXzEmWQMBFJnnZHHlO9YTQXjjPEVXsz5fWgW5DA+HQ6bVx
 hrN0Kp6PiSv2TjU6/ymR+lI2Ek1O9p6UcEcu1o4hlKZ8d0uDRXLGHA22RhBpotfcCN5o
 PfN2OZh/SLvrq2Nzlg91rYAhZ2UU0VCEfGFT18xRlS+B1PtpCh13Cvo0m7+8D/4oub2F
 3q0nbCoB6YfEU7PJkxabzVCTwU/6HWX7jsBbrpuGziMQxU99PFhHjTgQEzkGIJSnba/E
 D2GdhGwgxxTtumSFsxaTzRZ0+WjZ2YnVgu9sAxcSrMFn5Yh3Ce3CSBfwqsvsqu2mFGfh
 c6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935835; x=1694540635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EvB2m6jWZ6h3dqLtwhCqsLJZSURv5HFp2WI8WShvmgY=;
 b=dKWtihFpIHyWDv7lJqZ0VY7ufoaoWt/anuL2hz+8V2cg/XuFOYm5pM4EgjWeewaUHw
 m4qEuG2nqtUXz58ZN1xvrVby6ad1djV4E/kyRVh4jEmSyAELIfzzxLC4jh/Zm0fZejr1
 RoEi2hVyArcUyMgDzeWJ3wP3KWN50R2/VBsce4MUdTFgYPtL8uEJ8wEqUDRY/4O3SH7T
 6iWlrxA6gyehXe4rifg5Eb89KQS7GYQOcT2YgkqmrTXyEupa2uXW7r/ycBDr/BqLwl1+
 e9UukBsyxE9cNUQTAm0Ck9T2vDGVaAuoS//mqNjM9YZ6+5+vhJJBJQvezlBpiZc+xgsD
 8XZQ==
X-Gm-Message-State: AOJu0Yx/FZcuAHN8UDS6Wz7hIFrPkNljROkSVTNWV5OnGz7I3+zAb6tJ
 mh9TQfmG7LBNsVdnLa+YI2MagA==
X-Google-Smtp-Source: AGHT+IFkuCioqJOVDcvntY39EZiATGhgvVH3wGIf6xuX/1yMeziKkHJcd7MOrZxQqPdTGfNtR5iVuQ==
X-Received: by 2002:a2e:981a:0:b0:2bc:bb01:bfe6 with SMTP id
 a26-20020a2e981a000000b002bcbb01bfe6mr352074ljj.21.1693935834712; 
 Tue, 05 Sep 2023 10:43:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/6] drm/msm/mdss: fix highest-bank-bit for msm8998
Date: Tue,  5 Sep 2023 20:43:48 +0300
Message-Id: <20230905174353.3118648-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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

According to the vendor DT files, msm8998 has highest-bank-bit equal to
2. Update the data accordingly.

Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..348c66b14683 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -511,7 +511,7 @@ static int mdss_remove(struct platform_device *pdev)
 static const struct msm_mdss_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
-- 
2.39.2

