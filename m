Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547A694564
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 13:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9286A10E59B;
	Mon, 13 Feb 2023 12:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA61910E59B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:10:38 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jg8so31298883ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 04:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/kPvMZiwgDK+KZq9Kf+lEuw04CYRxX2KFNzK4CB7Pw=;
 b=jMzFgbQ0fUe+4erNDvsfQTczPffpIp1t3k7O7tJhiPwIdCtYM+LM5pICdn7e7aqDvJ
 FhV2wU5125wBpyZqKBPD4oatdrTOkpv78KhcKieVTA31YzenyPoCe04XSFgXbKP8ya4T
 ZbQ6poWo5m4nl7GtVy4nKWGyJe+UVfT25kLdjxSkVcnfyQ9OPrpmrF/exUckeBgDln2i
 9oc5meWaJgngoMFPr3z34EFEjPglCKPMthuBIxto4VNRZrU8GP2BEKtYiLG81m7EOQhE
 6PyVlX45x58ss46CYbSKjyqgUho+TI46cNjnW57JnRR9jVBnXWIRN0lqQh8JdxsFJopr
 PeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/kPvMZiwgDK+KZq9Kf+lEuw04CYRxX2KFNzK4CB7Pw=;
 b=4HeLJZuZUakGDLMB1ouB4s9tvUm+5rxi2V9rL8kb30dL0iH4kahdMXfYEJG2+Qjbs+
 lkJETF4DmjifEnOyzpJrw2uMeLeuPuZ0Jrl88bc5MRd3bWPTzNkCYvdB42FC8adH4qlo
 kTpQbuXfML5BsB2sli4RmqJkD1PWxe1n8lDbFj/H8n7yNGIKEwggiavaYlG+/U3w+FC+
 r6duqRDovymGsVjBAO/pLg3agTOSZ9sz7CUB206MmXtutO4TtGtizK14zT6IrAdOH2dy
 D+J8SqPne/oKAnN3h6e7PABgMe6SxrfcdQn4l8y83loIp1ruq39iZ0gFTrNgvM3FSbiP
 g2nA==
X-Gm-Message-State: AO0yUKXttQCdWIx77vQxi1nbcwovovUbPmhW7cXyVI3cEjEM58h/O8h4
 9S9brfyLH/47vzvQ4bVl95QDwQ==
X-Google-Smtp-Source: AK7set/SJhRGtx/3GLxajWM1yaOaxem6JoqH27SsAme+rzLOiTZ1xSMA18qD5+XtxWSmj5vuNMVXBw==
X-Received: by 2002:a17:907:804:b0:8a9:fa2f:e440 with SMTP id
 wv4-20020a170907080400b008a9fa2fe440mr28641469ejb.55.1676290237351; 
 Mon, 13 Feb 2023 04:10:37 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:37 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 7/9] drm/msm/dsi: Remove custom DSI config handling
Date: Mon, 13 Feb 2023 13:10:10 +0100
Message-Id: <20230213121012.1768296-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the only user is handled by common code, remove the option to
specify custom handlers through match data.

This is effectively a revert of commit:
5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 90d43628b22b..e0b911af618d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -173,10 +173,10 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
+	{ .compatible = "qcom,mdss-dsi-ctrl" },
 
 	/* Deprecated, don't use */
-	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
 
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
2.39.1

