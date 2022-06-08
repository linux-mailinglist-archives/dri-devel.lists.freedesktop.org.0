Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618A2542FD1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7243D10FB22;
	Wed,  8 Jun 2022 12:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DFD10FB09
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t25so32872373lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OpFXH16in5cHn4raKF0Pb6v4UhkdcLR/Jb9aXlUmXhE=;
 b=VHwNwMhKOhOS/njzIln1ebySUKrHlmCd4ta2Gc74f3Sqkfto12atc0vNrNU3saj8PM
 PswzUU3GXZf44jbg2HOU4EFobDKjWy0VN7jVK6RS76TcnCZZUqHEYM4s49sm8Ets492v
 qEH5oeNx79S+F9VCka3lAQkJ7LyAtVn8hdsvVv7VvlRuYW7XxtH7DESM6v19PMwjBOGr
 c1OmHRVdlp2ziNNDfAwxanfeNwYyZziOYqBRg9YMxy2oQDIbBWRF0ikuLzRLoIT6S7HB
 UQiruR+WuVuteegOizNp5VnbBI56wDf48m308FZaQJLJsLFYn/YVi7Gzh29llWUtkkeS
 K9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OpFXH16in5cHn4raKF0Pb6v4UhkdcLR/Jb9aXlUmXhE=;
 b=xoNk1PmOjlMu2aP1V4qp8RayvZV3IJgJYblKTVKOdPmhy4oXqfq93Y8rKUsA3uyOF4
 Y4wNb2V5QFOj5Qt5kqUBiPFvVqMvAbIK4bT6jYSwnCPOG3sixmFq5k6KdWoV1EyEhAQj
 AJBMLAM0kDY3XgroTOTwuUdg2RuJGheO4suEAvwDQiCNrcFPyElpEfwpqT3M3socQVf0
 1Nw3MRrApqSZ5w26OWDMUFZJG+nhiGfL6oyHnqrLo0o1hr4BbUNlL8DApVhplEEXt+pk
 Pvepitfc4hp3VnNoOcvyy5bcy9Z5xT2RYUvMJQGBH0z8RuFoqigbE4fh8vozU1NDJ1Xj
 XDPw==
X-Gm-Message-State: AOAM532jNJxreUVSH7OOkLCMqUSN6ZU987PkZMNN3sufd8LJ0qX4PLIA
 gs9qE7fImC60NHIJnhX0KfpbwQ==
X-Google-Smtp-Source: ABdhPJwbrQN2RGqJpe8Uw9ASRmVYQFvgJ8+fpfIF7QqXelS1hGc+IZolxnyt5rU2w6vzHBEHhM0R4g==
X-Received: by 2002:a05:6512:2625:b0:478:5a51:7fe3 with SMTP id
 bt37-20020a056512262500b004785a517fe3mr20891208lfb.158.1654690053628; 
 Wed, 08 Jun 2022 05:07:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 08/12] drm/msm/hdmi: drop empty 'none' regulator lists
Date: Wed,  8 Jun 2022 15:07:19 +0300
Message-Id: <20220608120723.2987843-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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

Several platform configs use empty 'none' regulator arrays. They are not
necessary, as the code will use corresponding _cnt field and skip the
array completely. Drop them now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 67397fff645c..ebc87f2a626c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,9 +353,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *pwr_reg_names_none[] = {};
-static const char *hpd_reg_names_none[] = {};
-
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
@@ -392,7 +389,6 @@ static struct hdmi_platform_config hdmi_tx_8084_config = {
 
 static struct hdmi_platform_config hdmi_tx_8994_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
@@ -400,7 +396,6 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
-- 
2.35.1

