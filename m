Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD56D1331
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603BA10F0C2;
	Thu, 30 Mar 2023 23:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA3210F0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g17so26676544lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218742;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hbnKgpdDmdf2EtoeRfnsVRvWlWQl2tvq4ylx1pYZM4M=;
 b=AKrrOLSQYKJQaMXcRrQu0CQl14DrLKp+LUcL/j2RX20kt7z99u9qgo72XeZ83s8bCq
 iw0dXwXm8erHypA0zavOKPM9MlGrGvGF6ne3J/Ou8EfRgem5VonDGWY6WdqaSpU7rxI5
 TzQxd7lwl4g5pU7NPkCgNtkEwjy9trA//15ExGUJleEF+E37+VPdlWZ7H/5/U+vbC4kR
 fV7q3IssukfY8EG2kx10qEMMa4F0jLWZRJbqW+pu+NZ2qP3epMBulekAX4mVS2lekmoe
 v5WGNxi2qNuOrSek7dGDXc9COz+QyfDx/b3t3mWbutnVXVx8g9C+72BrX1Sh7Salt/WN
 L2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218742;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hbnKgpdDmdf2EtoeRfnsVRvWlWQl2tvq4ylx1pYZM4M=;
 b=MPTEMofViz7xylNGcngXHSWsH+cBCpFAykqv/LQFEuCXIwJnJNwADkAkOqlpSKAXZI
 CsgBX9f3GRqLppWQo+VqkEjpP7m4KhoImzTWrNoIfmozL7vSXaerwMCJ/h+28ACHadwu
 UDU/a4ulIWR41MNWhfytqaMcSU5Gk9v0gK99qszVPGhrsn6OJWHN2GHBmzOM2sIXpOjT
 C+QNMJsurR3NFJAErZoVRnAynCZFyut1lbI4c3041pcBW8YwPLRrIvq0OAWpWdqEjL0w
 jfNQNjgmUNaTD/OyFndoptPW1b07sSBUiJ/BBh/Ojz1IdTK6isoZONpx1VzhF6RY8fWV
 4izw==
X-Gm-Message-State: AAQBX9ePUG/MIpq+fom8VRcrssGgROUaeSLqVh8gPiBvR1uHLam/emC+
 RAmfu5+cmOSFVgNfSQROC8/Uhg==
X-Google-Smtp-Source: AKy350adNUAP6gZPHLubKVf/g3OFBoIYg03qUxkx5oHnGcxYOzgARoLJm967xZ4tPrk4QmkuC1Epcw==
X-Received: by 2002:ac2:5446:0:b0:4dd:a76e:dfff with SMTP id
 d6-20020ac25446000000b004dda76edfffmr6583602lfn.23.1680218742650; 
 Thu, 30 Mar 2023 16:25:42 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:28 +0200
Subject: [PATCH v5 14/15] drm/msm/a6xx: Add A619_holi speedbin support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-14-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=2033;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FcRDjVP6HKQEi6DA2ZuPEYKRXdBx6r/IOHWHLE+VmPg=;
 b=FSpItbK2YTPN5GbTbq1M+JLzFhOzvFHICJuxlu5kd1ZQNz7BQ++PfOJcBCrklW3H2skLcoLX/PxU
 Eud6bXZwBXYsVuhf8xuEnnGEixe5Z5eNrgEHsJRnS/KjOUtNBmz7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
(blair). This is what seems to be a first occurrence of this happening,
but it's easy to overcome by guarding the SoC-specific fuse values with
of_machine_is_compatible(). Do just that to enable frequency limiting
on these SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4665a2e8fdde..c61b1c4090c5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2165,6 +2165,34 @@ static u32 a618_get_speed_bin(u32 fuse)
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
@@ -2224,6 +2252,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u3
 	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
+	else if (adreno_is_a619_holi(adreno_gpu))
+		val = a619_holi_get_speed_bin(fuse);
+
 	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 

-- 
2.40.0

