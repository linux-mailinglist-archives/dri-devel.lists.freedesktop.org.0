Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D12544BE1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859D611BEB4;
	Thu,  9 Jun 2022 12:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B111711BE7F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a15so37697063lfb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LlIXTf2F2ii+ucioBKsec482WVV2meunhjHcnfknaDs=;
 b=RkwzmsJJyeMawMcZY9tReDxYlj/RH9iKVAMkXnL2y/BBu5GlIL6/go3B9S2ib6jFos
 hwzr8z4xFv36ufdYOWfQwJJjB12jGhQgzFWJtHQ43w2+53apgCcdBlQNLsHaVEhDtfLI
 /ugcDIwL5xvZVF4cA+3LQSsDfTdMvF1lXIVGknsnv7qIzwoSV16n67Wy7V/UnaECyRJO
 t62tELkTF6vav+twBSsQnM1TamHThkBqoJrG5rxGz7rjWH6Sgk8evTfMOPuGd4oIZpkF
 0qD16n5tHKQWp/8+3759UOFQWVlxsWL6jfHfa0jbo6qyxnUHTYby4WN0yp5t6b3yM6SS
 Albg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LlIXTf2F2ii+ucioBKsec482WVV2meunhjHcnfknaDs=;
 b=Jr3bTcYS1q8SchK8hqlFbGL8FASCBewSjtytYP1526EwhMw4CF5zmNAzsWua0Beuqd
 Rv7xNT0zkXyFSZQIGbETFuVikDCKeT32lz1jqVfLeJl2gyfl2ZHMpAwWAWyLD+VEJQEV
 mNS+IFeVbCrkJPXL+PpUQKH+9Rw/Jmyt0ye7a7VlDwfO6Sl7lMeSnfyxeXGJ2Aj3sU82
 DKxeiS9ZrBBSW09zftAU+VU1pA/e5sQwhmMMGS9OayauO/teG7VJ5OVfD3M2jPZ8ycfI
 bp3W56G0wao7CppnlYjhLa9fyUpPijn69UJIkSlXb2YBpmZxHvyVfJUPBk5etRDXK1vY
 shRw==
X-Gm-Message-State: AOAM532llK1PpzluYlJxg4Rw37DYFriBXUueBfx0PBthqEef7caQ5tLG
 xsRFzqL9HWD2EUts+sfZhGVyPw==
X-Google-Smtp-Source: ABdhPJxFfghF/YuyzBqtZUnSULRM5kai+ywDpIduSCW85UwnBiwOzJdeUG7DT3nLSHG4XbAHIsfn6A==
X-Received: by 2002:ac2:5f5c:0:b0:478:f5dc:f1c4 with SMTP id
 28-20020ac25f5c000000b00478f5dcf1c4mr31721006lfz.317.1654777441830; 
 Thu, 09 Jun 2022 05:24:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 11/14] drm/msm/hdmi: reuse MSM8960's config for MSM8660
Date: Thu,  9 Jun 2022 15:23:47 +0300
Message-Id: <20220609122350.3157529-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM8660 requires the same set of clocks and regulators as MSM8960. Reuse
MSM8960's config for the MSM8660 (8x60).

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 0f1c63f68569..6acc17e0efc1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -370,8 +370,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static struct hdmi_platform_config hdmi_tx_8660_config;
-
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
@@ -567,7 +565,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
-	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
+	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
 	{}
 };
 
-- 
2.35.1

