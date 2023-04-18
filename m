Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC16E60C2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFB810E77C;
	Tue, 18 Apr 2023 12:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1D410E785
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:11:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8bdcf87f4so16540131fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819864; x=1684411864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PbVhusCEghNKEPZ8TLDEdqw82MnqWQVPyy1y462DY9k=;
 b=swJ6/Exu986U2znXzl7Sx2Lj5KHn8dVTqtNXNU+FIA6UM4wu/HEowRKYm/z/prpcId
 VM4J6JeqKPWlKvFhNaIOa3hMIKyq3Ol2bCH+MuacZfeSMQYCIqw6IrWTcjFA44fKZD9D
 cDgyxq+DxNgfR7zcwKKzE6VMiW4t6vRJl15M+NeWyeAmZWc+Jd30zpaz4oY2U++ojnTz
 U79skAUExsLFHiqAKXKQa+kF96i1q5n4yJXyltnxgqkQljs6Ped4PgsaowdunD1QRi++
 v82pM6y3+7PaKdK53jsDSGhmXyxvKn/4CQc7HRwfT8xxRvagvG9X6Wi9l2cdpaPbIM9I
 SRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819864; x=1684411864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbVhusCEghNKEPZ8TLDEdqw82MnqWQVPyy1y462DY9k=;
 b=jAgbEUb/vnJEr+zzbTiuMF4VLKHX82TrDnfdlFgfOx5b8/6xaM6eCbn+Kkz5nKfxPN
 Yetu4b+5Wf3W+fI1wEyXRLw7K8KZzU5Eeh3DJzNU/OX18a0rN3ulnPNDmFz5rKxdOIBe
 Guj8mXP8VuGIv3o6dsppdkjzr3RZUF0KFLk8hKCyl5OSuLhViF9V85fPlljEdDbp3Nzr
 j9qkp37fVyG5peGALhx46KmlkidOUy3h75XBmalPzuvc+Z8C8zupjLzkMUbzAykzxfFd
 CvBcpeRuhQQEYX7Mh+iHi5aRnRwEpbLV+d+Vb/Mv05595S+vXbjCfhK+M5Wj05lrBZAy
 QsJg==
X-Gm-Message-State: AAQBX9d3oDi+4+/B7AxaXnC38CYRPolxoqDODNZ3jtCJvFt9+DqFjU1J
 lMM6K0L9ORPTbUqYwubWAvf/Og==
X-Google-Smtp-Source: AKy350bPFfWUOLpWel/8DUUJQFJNYhY785GrX3wMbeGJZeX8OlOeyQdJUrVbfdfWsy1pAnBkEYqUkw==
X-Received: by 2002:ac2:511b:0:b0:4eb:13ff:6ca7 with SMTP id
 q27-20020ac2511b000000b004eb13ff6ca7mr2818344lfb.16.1681819863993; 
 Tue, 18 Apr 2023 05:11:03 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:11:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Apr 2023 14:10:59 +0200
Subject: [PATCH v2 4/5] drm/msm/mdss: Handle the reg bus ICC path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-4-91a66d04898e@linaro.org>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=3137;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wX+gJPCe8UmLoFyI2GJLXSE1t0Mv12xmqDSsK2E8jZI=;
 b=Fl2losD0yxtKUBCjTBabIjaes/wJD0CNKIE43B+HBU9fLD5PGoyshXp3GJ8ZfODxRfctdbQnAGhz
 EDCNeSo8CFhnc35D2jEK9RnI6hh2Gf2ys+xxVtGeDWOXIMH07UQL
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects.. from none to otherwise
inexplicable DSI timeouts..

On the MDSS side, we only have to ensure that it's on at what Qualcomm
downstream calls "77 MHz", a.k.a 76.8 Mbps and turn it off at suspend.

To achieve that, make msm_mdss_icc_request_bw() accept a boolean to
indicate whether we want the busses to be on or off, as this function's
only use is to vote for minimum or no bandwidth at all.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9e2ce7f22677..4d126d20d661 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -50,6 +50,7 @@ struct msm_mdss {
 	const struct msm_mdss_data *mdss_data;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
+	struct icc_path *reg_bus_path;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -57,6 +58,7 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
+	struct icc_path *reg_bus_path;
 
 	path0 = of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
@@ -71,6 +73,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 		msm_mdss->num_mdp_paths++;
 	}
 
+	reg_bus_path = of_icc_get(dev, "cpu-cfg");
+	if (!IS_ERR_OR_NULL(reg_bus_path))
+		msm_mdss->reg_bus_path = reg_bus_path;
+
 	return 0;
 }
 
@@ -83,12 +89,15 @@ static void msm_mdss_put_icc_path(void *data)
 		icc_put(msm_mdss->mdp_path[i]);
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
+static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, bool enable)
 {
 	int i;
 
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
+		icc_set_bw(msm_mdss->mdp_path[i], 0, enable ? Bps_to_icc(MIN_IB_BW) : 0);
+
+	if (msm_mdss->reg_bus_path)
+		icc_set_bw(msm_mdss->reg_bus_path, 0, enable ? 76800 : 0);
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)
@@ -241,7 +250,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	msm_mdss_icc_request_bw(msm_mdss, true);
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -289,7 +298,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+	msm_mdss_icc_request_bw(msm_mdss, false);
 
 	return 0;
 }

-- 
2.40.0

