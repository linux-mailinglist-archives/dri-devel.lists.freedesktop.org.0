Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BF89C77B2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF3310E73E;
	Wed, 13 Nov 2024 15:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rc/FlMnZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8772710E73E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:48:46 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso6871588e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512925; x=1732117725; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fLkvv8R9JARcqpwOo1FEzIbabzBQSYk9vI4IDTHPWAE=;
 b=Rc/FlMnZpWnIBOahZjQRYfEXIJVJXs9EtkkykK/dh5Hq4YyA4dOWqKbRzrTvjkcBM1
 gp3XUpo0juiUTeOyRSfrv0RAaOxTWEJoiV1Uj1E5hKQk6//8f59F6g2A7s/zcsU2r0g6
 9iMNGTDq/jHTh10kLAcYtNKqpdLOpZzaSlOQbZkA9DUfK8x7R35h1iZM3KSgecXb4pJH
 QIa7G1oGkmZUJLqrV80fm1LCrGvRo+JdFIvrq53ia8MdUy4mV4aMem7xlZH9YOZsjQ7i
 264+qfL91cOSrIKUUHtNAN7hcr8X/aGWW6FX08JVKTH0XBtRyB+WB0s7QIaTrm973s2o
 Gskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512925; x=1732117725;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLkvv8R9JARcqpwOo1FEzIbabzBQSYk9vI4IDTHPWAE=;
 b=KHyBhPsquI/jwo3vITeqArI4SDm+taz+ldXN2UgbsBYroWBHnGyOzlA6twvQMOqljy
 +TDypO5bWO43m1oIgl5SZqVQzVY/DDZ+Jks/UfaxLceeNr2crqhjy402QeyiWcpQSelG
 i6V52UNugyoEAiU30nVS8kHG3M12c9p3Mw8iUUSWQH6sjhf1ZC/SdA0Np6PLArgaEENF
 IHGaAxcAalyW9MJDsivHTONp6tgqtbUcUrZ2NJowSGvpupQu8EXGoOR5yI6c8YNreviY
 FycmZB28uJZIQrF0bOVn/3UTMOYyRb0Ppff3Kck50rvBCFjcK4BB3noVvUUYfRbWqp30
 RcmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFbiZqRzxP6M49JuXEaDkfO8yxTglFjQi2SE13Zv1wwdCEbPe9g1/7nFJTsj/V/cSyTNnnvu5EVjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+eXCxpCmP16q0Z1i6ayQWEWj3wIhxfoNaGbKtOlOd/47Jn2fU
 82nTpuwnfivkIvIYklKxQhE3baQAdE2W/3wSzQG8aVH7RlJuX7b/hqL1o58GdPQ=
X-Google-Smtp-Source: AGHT+IFzTweLUvF3kg8gFXLJ8W63zGBpneugfPnMUH1xqaN+DG5tZl4dczYKpKANSweFAy7zsyr58g==
X-Received: by 2002:a05:6512:2806:b0:53d:a309:7fa3 with SMTP id
 2adb3069b0e04-53da3097ff4mr1091284e87.41.1731512924605; 
 Wed, 13 Nov 2024 07:48:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:48:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:32 +0100
Subject: [PATCH RFC 6/8] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=S+SoSj+qRP3rN1ucH5rok556sxuWpH0G2tK5cUTVK2M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpSFA/q95rAzi2SnEKM+YVmy9GR0uPKncQSnFbd
 CknGqQiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUgAKCRB33NvayMhJ0Z0cD/
 95X++l6sn4O96M/apxTEx+LCb7aw3VyNWlVxOU0SWzGglMAd2swg03eMMbeqcwIjTUoCGMnTYaSHbR
 ByRZDTnLqFCSX8hTxdP8Fo0BxyeooGlEWqxyGNZtEzxxhCEqmJFI9Ky9CObGupG5/xwv/GGKZ8JF6q
 B3mTXmTHfGrwFAf7LEPgHL8TmOH+ygIoL1zSYRvJrnEduTWyp7IxiKAbKLIozOOKHH8mRKZwKsCUHt
 0hUmZ4WFzVPeQt+TS9JpRRHoUVzVrZGj5Fn/OX27EF4JwjX5bKyEurVCYmprgSQc16qEevaTKKDWqS
 apaZxvUbntlGmj31AwbZlrqSDFvpmRAKBeS+1HxZhX6vI2//fNigkfvZDcKezQLcvUW94+b9pZ0nBB
 CTR3YoWR36Phxfour5b34ivTeeC4kqXm2Clz5hpL4BcugmPEyhzczvfQvFfC3IpWfEvupTtXoSWCv4
 tSVPUuFnN3Mbxx2iHA8/XJk0zV/mDZ3Uhz1sL4BO2VwYewwUUUG/viRFGqEqXQfOnMJZhiYrYqn+AG
 S9TrblcPNbvIdqTeWeKmxA4Sd5keH2daMYCFsjj+HPUCi1N4oqf0Tm2hQ2uKnS3LFx5nVqIz57L9nH
 LXx3uCmCBuQhMgcqWaL9NUtEcIANaxEsQX/8PIZyV+nbe24c9CxlIlNcWlwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, let's declare the Bus Control Modules (BCMs) and
it's parameters in the GPU info struct and add the GMU_BW_VOTE
quirk to enable it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..014a24256b832d8e03fe06a6516b5348a5c0474a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1424,7 +1435,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -1432,6 +1444,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1

