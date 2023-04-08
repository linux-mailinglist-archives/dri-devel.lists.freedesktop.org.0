Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5595B6DB7D0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 02:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE05D10EE82;
	Sat,  8 Apr 2023 00:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BD410EE97
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:54 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id z8so1931338lfb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsyKZB+D1tDZFHgYJ4nYnuAQxnj0NBUo0WN0E3vSvz8=;
 b=NlvOLk2Y56T0fwX79yVLjJGI5j879fgEL5zhJt67rHQAXuk2daI9u1kLkCXSSVp1sg
 U46Rq6c7hKYD4MyzrwVzMX7/Vz7W9PNoMxQ4RFWr4myqgBxxBx2Kx3oyCrBQBgu55f42
 l3qa6VTU3jK8DKBDYUP8pGlpD7hKPsfYIpJ9itaxMmALEl2TsN66HXszJJDjYTq1zJuO
 36vUJl9plOYYDfDd03BhwXQmj/2C96NnSquLHaqUajxYX1CW5OqmAivzjWuqjVxdtvOH
 U/gbjK+bx4OjG8Kl5kXkvs3iv8AOqTbcaq7x4vL4dzHNa2TaqItE3cxoU6LV/Wbea66C
 QPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsyKZB+D1tDZFHgYJ4nYnuAQxnj0NBUo0WN0E3vSvz8=;
 b=zrMFEL5NfpWIm+HhvQujzC7sQQxTMZz2B7FExismJpxTLQ889mNC9WeIBgyRe9jsza
 LkwPHV0mE1LW1UCtF1KAOjmmY9jVrgIRosBCOB1PiOfWM24t7Tj3U+7LsGULNf9rR9RF
 ai4ZaldS2QU4Xf8JiU5wBnlFoQXBXv+GWRUESSkEpBiN/692cxqGkLaWuVcqe+aPGXTU
 z4jwO6lWE8Upa9G8C0cLoorsnW2XvB6N7C1E5gqfh5WV3VzwvAHVWanlaO2wP5oMGUhE
 zwQXM5Ya/p7nXq2Hb0m29XQFwxOvAK6c2scfGnsWAzrCv1waKFxRmk/M9kVBfhFd53Ru
 l5Rg==
X-Gm-Message-State: AAQBX9e1et2RNOKIt8MnbW/wj+hY14Re/k5J2m0j9YNOOJNqRChRYRQW
 qziT+IlOBrQ2tXpDE5vCRxuWvw==
X-Google-Smtp-Source: AKy350YpHkd6OCTnLxCT96ewnA6MFSt7fuXBRdgMA7jCrAHRUqCS0Bs63YreBas+vmLB7je2iUFycg==
X-Received: by 2002:a05:6512:318e:b0:4eb:4274:df34 with SMTP id
 i14-20020a056512318e00b004eb4274df34mr907019lfe.9.1680913671724; 
 Fri, 07 Apr 2023 17:27:51 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 1/4] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Date: Sat,  8 Apr 2023 03:27:47 +0300
Message-Id: <20230408002750.2722304-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
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

Theoretically, since sm8150 we should be using a single CTL for the
split panel case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9aab110b8c44..622992ae53ef 100644
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

