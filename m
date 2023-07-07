Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9D74B9E4
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E27110E614;
	Fri,  7 Jul 2023 23:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDA410E600
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso4010996e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771574; x=1691363574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=XiMwUFfq30HoJbhHr/Z5GPk/g1zMJkd4Quu+RHa898+wMhhtx+G/WxN3v95APi79+Z
 ZumxTU01HHXRXCkAH/yB41gRpYP59wqVVIutQTpOKgYWXmHR7ePCyFc4O4cn5JTmu8dM
 BfhRkM/qCviueDuR5vy+9a5zsWAAtC6+8RytTsrIfoXpRj0Gvpz35YGnlWPj4FtKrdMj
 BZIDLdDCRUXNTyPhRMERX4ZSRNooe2XKyVZUtdrjtUqTPDoRA4IOim5ZSKmeFYG7XZvC
 Qf+A/j9ERXkzzAwwDCZNGQ2LKcwQ85DFx0mOQ492nd2KgBx6OP1TS5qK/eMhgAmvwbfj
 TOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771574; x=1691363574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=RPqUeI8+m9nGxDQoJqxxtHJgqhUsaY/Vn9UomWKEipM8/v9QkRvcx7YUxvxnRJ6NFM
 PulptjbiGZBxTLu47zt/bPvkPJ/IOknxIea3byHWcm+8BuUSacj+UDV/xzbSRG3SVot1
 +wHyIpgWDDkTyl6tr/EhYRikT7skxSRbdNxhA1BqdmtgLbuyU1Ke8bh9Nasx8eDDZfMq
 94inhs1lyH3c9VWFg6kOSQRm9TjxYTVNPSPAcQ6ZvAqS2dODDSCPzbFvMnY08ZBLcumc
 /JpYn/GBbn2R0YAEYTE98SasC1cBUBzauotjMXPUhLpV+TfuRGXyfBpolsY4aU5MlMdY
 LUJQ==
X-Gm-Message-State: ABy/qLZvEP/KnYpCsz5VnF73FP25zeZGx0bweioZUtceAp3v3NZlsWKF
 /PLk9iCg2jsKD+O5rkiEb+c+aw==
X-Google-Smtp-Source: APBJJlF0xS8Rk1omO0MKWW2tlGH3W0mgE1ZQ4QQzVULEV9tGu1Tea1XDjP5UYdKExs0/FH82Au1Vmw==
X-Received: by 2002:a05:6512:e9c:b0:4f8:7325:bcd4 with SMTP id
 bi28-20020a0565120e9c00b004f87325bcd4mr5850869lfb.0.1688771574202; 
 Fri, 07 Jul 2023 16:12:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
Date: Sat,  8 Jul 2023 02:12:40 +0300
Message-Id: <20230707231251.3849701-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7ac02e92f42..85b8c9cc99ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1096,7 +1096,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

