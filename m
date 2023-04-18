Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D36E60C5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A69F10E788;
	Tue, 18 Apr 2023 12:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF5610E78B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:11:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4ec8133c59eso2066859e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819865; x=1684411865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jK7H3+ErS03Ewzys5ptfYi+3TCq3sJWDKGWiaxXPxVc=;
 b=fuHWc+pU6kSJ5B8ILg4cxboqaKg4YG4zzH+6szvYhrPIEcDw4trMLqi08eXiaM5Gkf
 4RQaBvCm/cvtj7QAiqHndJHs1DkkQ9rMq2qm+yoTBS8AJdGFkTyndwfOxGXf//6wdsyO
 kZW103oYYampkvOOTH33ac6xyyGemNBb2+RhXJe4rgIRdLBjZ83bpwBsIb4ikNmGvK2K
 6UnAbgQJdzHYWJC3RS3uFVwzg56p6BGs6cAiR2F6Mf7FFVmvDb1Blg80pTKDGbfnPZnN
 jvLrrgB9IdOweZLM57gORL1VfoEZoaRNKwQr7J/y/UYvhBtYDCHJ5Qtksulr2LnpxGf+
 xaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819865; x=1684411865;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jK7H3+ErS03Ewzys5ptfYi+3TCq3sJWDKGWiaxXPxVc=;
 b=QokVgLyKezO2wFfRAbCGsvIAfr2MDXUm8NLrFo1mLWmxUTOX7TcgSgGXbd22YmQ7Hp
 SoahscYRLtetmYAtbTQCjQc770K7gkuEbCL9Bv5ral4Z8TJhEE1G7ClukMgU6Snp30WV
 K2vwLltXKnybGKhwmFxMC5KcvIRxZyKds8UDXjCTh1hH8dDlCbF8X0LQkAuSXKOayRek
 xSPy2A9UxXAmCQfqBpc8yJ7jwZHctylXgAROhwaxWofdumgpibgGHmSCqVXZRjKq29x5
 cK7lcF+F6BwkDLYyyOruFis+7W1JWmqK1KvLXcLq2bAgt2d9U0ue6lEHYLyqEkBqv7oJ
 u6Iw==
X-Gm-Message-State: AAQBX9eK0c+HpoXK/k7ZW3aiUegihV7aG8sLNTIna/cwRrA9JY42ITTN
 /Cq7LgIFSx9nlCkfu4Qnl3F5kw==
X-Google-Smtp-Source: AKy350aWumsOXwDHQ/uYnZksZvKsIYQklkw41JcEKfVA2ot7VlI5J1+K4X9e8gNvBxNHCMWbjY7cmQ==
X-Received: by 2002:ac2:43bb:0:b0:4ed:c3a1:752a with SMTP id
 t27-20020ac243bb000000b004edc3a1752amr1958180lfl.45.1681819865345; 
 Tue, 18 Apr 2023 05:11:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:11:05 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Apr 2023 14:11:00 +0200
Subject: [PATCH v2 5/5] drm/msm/dpu1: Handle the reg bus ICC path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-5-91a66d04898e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=3473;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xOdy2dn+gE2SKrybPYSqoFq4IriT0JQjTQ+e3Ay5cn0=;
 b=h9ntcpkRQz9/aOBujWPi2GBuMqSjHjzJl4e3f8Ec2wwZlXLEV4LprmN69VRjW49s9bxj9Fi/LWe0
 LEWJnLoPDtmj5vBJezWgfnSaCTM6RowO4Lqti71GkxnGl0OFOQI+
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

On the DPU side, we need to keep the bus alive. The vendor driver
kickstarts it to max (300Mbps) throughput on first commit, but in
exchange for some battery life in rare DPU-enabled-panel-disabled
usecases, we can request it at DPU init and gate it at suspend.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dd6c1c40ab9e..5e1ed338114d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -384,15 +384,17 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
-static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
+static int dpu_kms_parse_icc_paths(struct dpu_kms *dpu_kms)
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
+	struct icc_path *reg_bus_path;
 	struct drm_device *dev = dpu_kms->dev;
 	struct device *dpu_dev = dev->dev;
 
 	path0 = msm_icc_get(dpu_dev, "mdp0-mem");
 	path1 = msm_icc_get(dpu_dev, "mdp1-mem");
+	reg_bus_path = msm_icc_get(dpu_dev, "cpu-cfg");
 
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
@@ -404,6 +406,10 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 		dpu_kms->mdp_path[1] = path1;
 		dpu_kms->num_mdp_paths++;
 	}
+
+	if (!IS_ERR_OR_NULL(reg_bus_path))
+		dpu_kms->reg_bus_path = reg_bus_path;
+
 	return 0;
 }
 
@@ -1039,7 +1045,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("REG_DMA is not defined");
 	}
 
-	dpu_kms_parse_data_bus_icc_path(dpu_kms);
+	dpu_kms_parse_icc_paths(dpu_kms);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
@@ -1241,6 +1247,9 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	for (i = 0; i < dpu_kms->num_mdp_paths; i++)
 		icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
 
+	if (dpu_kms->reg_bus_path)
+		icc_set_bw(dpu_kms->reg_bus_path, 0, 0);
+
 	return 0;
 }
 
@@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 		return rc;
 	}
 
+	/*
+	 * The vendor driver supports setting 76.8 / 150 / 300 MBps on this
+	 * path, but it seems to go for the highest level when display output
+	 * is enabled and zero otherwise. For simplicity, we can assume that
+	 * DPU being enabled and running implies that.
+	 */
+	if (dpu_kms->reg_bus_path)
+		icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
+
 	dpu_vbif_init_memtypes(dpu_kms);
 
 	drm_for_each_encoder(encoder, ddev)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d5d9bec90705..c332381d58c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -111,6 +111,7 @@ struct dpu_kms {
 	atomic_t bandwidth_ref;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
+	struct icc_path *reg_bus_path;
 };
 
 struct vsync_info {

-- 
2.40.0

