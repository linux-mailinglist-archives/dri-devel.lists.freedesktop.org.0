Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF3367CFD9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D94210E935;
	Thu, 26 Jan 2023 15:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82F410E934
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:18:01 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s3so2164651edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDYg2iMsJNzgV0foPqQk3vB8m7SDOB4BjLOoBWAaVoI=;
 b=qVvjUfInztdqE/AezWpCK0M6BGJg5la+DGWd4d54xN2vcFwQvi6VlF2ZxgNa87Us+S
 aEEgtG5E2e/X9YALxs1zJr9lk9jrgiwBT7rvgvBlL/ym/SunFYeb7KZyZs8LKCgvbv09
 hZagt0ehrv52ig82ZzGDMvJUROrTudZdrquCREFSaSP0ahdjrmL+QMZzmWBIx4xfkCz4
 BO+R23wFTCD5571+JPy7Fkqyijwh1mspiA13TyFDV0V1RJsAJk2ooU/nPCTqsxdGcEAY
 thWxI07tSADldODvzTOWrNYjuc9b6qourgxLKahGvir/J++o67mPn/u1E7oHyxYFnAJ3
 IFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDYg2iMsJNzgV0foPqQk3vB8m7SDOB4BjLOoBWAaVoI=;
 b=iEjzIKqwlmd+FebJCWCqIw1mBY6e/PbwlcQ0COgKj9i5Icv77skwuAa2GfUzHDFmlw
 mF+1mBehKlDQ8EofQ72q4jqeunX1Squ2EGYur6c9LRN8fk6MkmF7dskofR618zTqxnO9
 S+HTT7HE6JR69ukGvAZhypDYFiz88CUjrEWSSuwF13jDu8CauyCwonjcArtawTR8qOiJ
 7AOxoLoGHuxB0AAj3tEPt8OLdh5wkLZDze7RgwxcEg7+2uWsx0NgHcuN4DZmgtWVYUg1
 e6jiclmn1hkkY0tRv5t7tSB5pLgIR3mWHUECIQhhrhC5KrQsRdWMNOLWlqoHWmxuZUFM
 NWfw==
X-Gm-Message-State: AFqh2kqdKzN1h48Iigq83+dfT0TTcqTNFv7IOIxrf76X1kM9JQHsr4QS
 0EQiU6GsNeOWLg4YvOPw8rBQxA==
X-Google-Smtp-Source: AMrXdXsEIZft+DpwljWA+Pr+MbyQ9p6JgElB0E6a05OvscCGE1slWGBUcjPnDDSoUeAdIILkO77mlA==
X-Received: by 2002:a05:6402:1846:b0:49e:ed53:d64a with SMTP id
 v6-20020a056402184600b0049eed53d64amr25296726edy.27.1674746281459; 
 Thu, 26 Jan 2023 07:18:01 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:18:01 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 13/14] drm/msm/a6xx: Add A619_holi speedbin support
Date: Thu, 26 Jan 2023 16:16:17 +0100
Message-Id: <20230126151618.225127-14-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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

A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
(blair). This is what seems to be a first occurrence of this happening,
but it's easy to overcome by guarding the SoC-specific fuse values with
of_machine_is_compatible(). Do just that to enable frequency limiting
on these SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 452ba32699b2..89990bec897f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2091,6 +2091,34 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 a619_holi_get_speed_bin(u32 fuse)
+{
+	/*
+	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
+	 * and SM6375 (blair). Limit the fuse matching to the corresponding
+	 * SoC to prevent bogus frequency setting (as improbable as it may be,
+	 * given unexpected fuse values are.. unexpected! But still possible.)
+	 */
+
+	if (fuse == 0)
+		return 0;
+
+	if (of_machine_is_compatible("qcom,sm4350")) {
+		if (fuse == 138)
+			return 1;
+		else if (fuse == 92)
+			return 2;
+	} else if (of_machine_is_compatible("qcom,sm6375")) {
+		if (fuse == 190)
+			return 1;
+		else if (fuse == 177)
+			return 2;
+	} else
+		pr_warn("Unknown SoC implementing A619_holi!\n");
+
+	return UINT_MAX;
+}
+
 static u32 a619_get_speed_bin(u32 fuse)
 {
 	if (fuse == 0)
@@ -2150,6 +2178,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), rev))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-- 
2.39.1

