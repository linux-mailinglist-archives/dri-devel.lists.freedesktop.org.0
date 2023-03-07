Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D136ADF8A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FB710E4A4;
	Tue,  7 Mar 2023 13:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC3B10E49F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:01:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i28so17038970lfv.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7PaidmNsI4X4+HjLVSO/Mw/Vgb1gA+84W9VJP5fzGmw=;
 b=ybDeVf3o3AYMMPETLq2Rdp9UGraYIOlwXEM3om7QZZEOw1tG4ydNiM9rck7drBz1h0
 jWEFVmcl/EKs/NL/y1jVMDZ49zWO7OBk4um0M0rK9XpMSU7r8RZG17JZIxmgQ6hmXKA1
 /jDMG8WfHpNXWlGxHtJrAP/YQeCgxwGS/Tw5baoUbjUo8glTUO0xB5AUpDZ92/0kwt7+
 Sh99yfvUMkuPgHA+uCbGtpApsCwT9j1U0kUGYA6nyFASz+kT6rT0TzFm3NfXubj+9+7H
 P1kJMStI5ESo46W0i1Za41E43Fqd2IOOTtWplXoKOocoX7tGl1tnkvilQleSmdrFDGIy
 495A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7PaidmNsI4X4+HjLVSO/Mw/Vgb1gA+84W9VJP5fzGmw=;
 b=iT3nPYmxlCau7XuPrZurG60iSrpWmwaqxbH/BKqwCA/09HKCCQ/KlUEeLrC4pwAo44
 vCsO5x/VyJCEAI5TptNnQr4H6AxsnmOlsshBG6U7HtrMJBYlcHbMtCO5y2k5c2F1JDnW
 2cVDOyFiJRS/BQI1Z78eWRnX4YWjgoc65vFwxKJQP03zqU/QwDNsCCBcVZnIoM7OJAfr
 dvoZKkzANcDRxLgHq6/Swd0SW5xsZxTTWY58slOnSQirspaAKQC2k3ddbPqFZHa5gC85
 otWosf6y3alnaUjCLbD7hrKejgPGoZ7jqKm56Hes61ccK6D5oAuSH3Olo2LBSE97Sap4
 fl9A==
X-Gm-Message-State: AO0yUKWzzGGsza44dm6XNBr4shch1cTu5DutU5eI4FrubPOEyO2NT85E
 1Q70JnhBdfI4U/x+95P8kX4g/w==
X-Google-Smtp-Source: AK7set86logaWA856+uKhpszQ0hgdJdLY0fLjfYHHI2H8Bw8JAPRe3fTlXWXmcU0Ng9gw9NRXSTViw==
X-Received: by 2002:ac2:5dfb:0:b0:4d5:8f3e:7852 with SMTP id
 z27-20020ac25dfb000000b004d58f3e7852mr4051427lfq.49.1678194112386; 
 Tue, 07 Mar 2023 05:01:52 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:01:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 07 Mar 2023 14:01:45 +0100
Subject: [PATCH v3 07/10] drm/msm/dsi: Remove custom DSI config handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-7-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=1669;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=x9eSVOGZMp5LDI1BiTB/gmaSF0y+os8hsi63E66yEQw=;
 b=SE4rbaWLt+hWaIAtC7Qt02TIAq4KXSrCYpl8fpJ4Mi/B1KvuDGHtJetP3PvPm2tCvYDkNx2j6kcR
 POEjl9jlCTiSdZQTrezBPqu+t3WWg1iGpvdUwufC2NSGmldNRviD
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
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
2.39.2

