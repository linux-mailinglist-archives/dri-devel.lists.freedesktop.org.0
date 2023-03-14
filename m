Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852946B9303
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 13:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457B310E7AA;
	Tue, 14 Mar 2023 12:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D8210E7A8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 12:14:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y15so10218599lfa.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678796060;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M0noliucXU9Jdvv0Hd20Z7afom/lMp4f8K7cr1zSsgo=;
 b=XoBFtXbQtSXG5WclW1los/dZpO5yHIqTv53yG2lZWaTzr3dY8/MjmGb20SpOrIH4nW
 TtkrTvuouYcQao6T0qYjiJK57B60oPgOdOXBvCdj3ftibMdf97Iw0IBnCwkh4st11YeV
 DuyMTdSASAAHbcW1silQ8yPEMSejsOBUtAF/m1jgfhOc3lG/vPozJYpc5diKICMENyzf
 yjRUKM5ciQ2dCUdBUSZlr6c/Kqa5VJYgl3q4jcZp+qXcvAielLI63LeiueIiKVzan6ar
 rmsq/OaCL1rntSFPApp0+oW8yk8Z5tEUJunOdLhiXN2kNZT/l33rUfoOUqM1fk2XGBS7
 afMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678796060;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0noliucXU9Jdvv0Hd20Z7afom/lMp4f8K7cr1zSsgo=;
 b=TfB9lGWJf157/8vhA9xRHkkz6Yf0iQBv3b2z0BgKv6mxQyFEPOd+V5a119bi2/I5OM
 9MM4bFIyx+2Rlsyqca+fXwo4vP+m9J72CLr3h2gSs4PG40VEILXqn5cyhMRyiyOoOqqp
 PgUEJBuEcLF4oWV6iA0wPPHQSmbEzuoj5Ye+C3mBLqH2IrMV8UBZqN/MWWR5LLYtlieH
 pDfdbo8BS0wOmfFfOGEey5/DaPRg4Ce07rR4DQFen4gF9nZHkttZsD+TJ6AwyS3BFoYN
 msO4KmZpYUfej1wq53fO3A20EfIYBrQHvkoGcEhYE3CCRLobTjDkhkawne5KbEsfdmyr
 /ICw==
X-Gm-Message-State: AO0yUKXCy6tTWD9bDv0rjN8dDLi7Oz3nFo5JlIiDpJCjaYm1Za6kaBrB
 frlKoQc3rUA06NeRRPTw4/yVvA==
X-Google-Smtp-Source: AK7set/VKwfxDeNKVkhVwQmiIpG92zx0bpa+hICEMxp1oB0u8pUIuUXXLyI1ZHxeFtZCzLflZ6YrPw==
X-Received: by 2002:a19:f508:0:b0:4de:e802:b7e3 with SMTP id
 j8-20020a19f508000000b004dee802b7e3mr581098lfb.19.1678796060264; 
 Tue, 14 Mar 2023 05:14:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 05:14:19 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 13:13:45 +0100
Subject: [PATCH v4 07/10] drm/msm/dsi: Remove custom DSI config handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-7-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=2248;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XyYOOI1oosMrjhHufAshg6wFIoQ3jCyg3dymQPN3J1A=;
 b=h8pc1bjL2lI6iQ31RL4kpzTbX0PpqKAoYACSpyK+h0eLIKLO7FFFQ1qC3y+mRzAFZMW+u9eoWcZd
 juim+86NDrq6hafxwJkCfMB+ugGrgMXpOdNydQ/y53PIKQSjXWER
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

Now that the only user is handled by common code, remove the option to
specify custom handlers through match data.

This is effectively a revert of commit:
5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  | 3 ---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index f761973e4cba..baab79ab6e74 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -172,10 +172,10 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
+	{ .compatible = "qcom,mdss-dsi-ctrl" },
 
 	/* Deprecated, don't use */
-	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 8772a3631ac1..91bdaf50bb1a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -65,8 +65,5 @@ struct msm_dsi_cfg_handler {
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
 
-/* Non autodetect configs */
-extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
-
 #endif /* __MSM_DSI_CFG_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9cfb9e91bfea..961689a255c4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -214,10 +214,6 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 	int ret;
 	u32 major = 0, minor = 0;
 
-	cfg_hnd = device_get_match_data(dev);
-	if (cfg_hnd)
-		return cfg_hnd;
-
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);

-- 
2.39.2

