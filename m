Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F364AC62
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 01:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC3210E2C2;
	Tue, 13 Dec 2022 00:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3692410E2BC
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 00:24:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id q6so2285842lfm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 16:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SEIVdXDizl5GA8yUFDs8adYCHSjfLGoxScc9uTeNRRM=;
 b=OWqhQScustkMzjXFVt1cNe5DYkL14IYi+Rdz8Skrqo+RWKIyba1oepLqNaDTen2AQu
 cumnEwn/8PwtoHJFJrOUV+y5iRerymeZpB41CK5NsLALYjFRIrnIK3xjBfYvFq4FtPLv
 nR2+oV4oLbIySyy2BQh88feryeSpcMkQFXWRrJMGh23p+Vxp72TK1gHc1Xn1tSqw+WBZ
 NX2EhBKeq1NYa212WqZYh4nA+90M1oJXwSn6Wz4TVj3HKID+X/IvcbrXOuzaQIbkYrcs
 QbBF22P+qHGZISj+cg0cEu9C/iM0NJIQkUu0GuuRRcNff/u18zYZ8gy17M4ZYxZXpzoA
 xrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEIVdXDizl5GA8yUFDs8adYCHSjfLGoxScc9uTeNRRM=;
 b=vsspfdb9ZccJ5EacJuhs/DRjy3gpR1oLGCK1rcnT7uWCUXxvTVpN9CyHRwlB8PD457
 H7Qf/i5w+lIkY79fghE75Md5umYC1xHXiB8MEMxKIohLtzehvrjYXqYNX8562LVvfvsQ
 X5GV6SjkkcMRtlJ33Vm1VgLu3PtNYR7AtCwiERw362DTfT7nLsFapvaMaXyqn49d5GUM
 5/zmGetchZeO2+EUtP/IMncqSc/BQb4otpHIZo67pLQ7OO4lPDnl0quCrIoEjhmw/f9w
 rwZIYv77amBa+E+DH+xil6Lq0QRBIDjp/2bHpRdQSjcZDnrzXZ9OXvvjnY3GBeLKL3Xa
 eKdg==
X-Gm-Message-State: ANoB5pn2TEu0/kbDEUTcjqQ6i2mytbx31hLGYPUkM7T84QyHvagwkXA7
 vsa4KgWavAnNOL/UhLIYSEVuMg==
X-Google-Smtp-Source: AA0mqf5PxuEyT4388zQxFFOtql5DEIuyNV6rnOcvyNG+J41twRJyW7N0W6uU1rrt9dWlS69t0iQB/Q==
X-Received: by 2002:a05:6512:7b:b0:4a4:68b9:66f1 with SMTP id
 i27-20020a056512007b00b004a468b966f1mr3805731lfo.60.1670891075461; 
 Mon, 12 Dec 2022 16:24:35 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl.
 [83.9.1.44]) by smtp.gmail.com with ESMTPSA id
 m23-20020ac24257000000b004978e51b691sm137352lfl.266.2022.12.12.16.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 16:24:35 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 4/7] drm/msm/a6xx: Add support for A650 speed binning
Date: Tue, 13 Dec 2022 01:24:20 +0100
Message-Id: <20221213002423.259039-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213002423.259039-1-konrad.dybcio@linaro.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
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

Add support for matching QFPROM fuse values to get the correct speed bin
on A650 (SM8250) GPUs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2c1630f0c04c..f139ec57c32d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1887,6 +1887,20 @@ static u32 a640_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a650_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 1)
+		return 1;
+	else if (fuse == 2)
+		return 2;
+	else if (fuse == 3)
+		return 3;
+
+	return UINT_MAX;
+}
+
 static u32 adreno_7c3_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -1915,6 +1929,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+		val = a650_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-- 
2.39.0

