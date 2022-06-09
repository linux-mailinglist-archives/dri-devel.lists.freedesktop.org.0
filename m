Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D405D544BDE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1921F11BE8F;
	Thu,  9 Jun 2022 12:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEB711BE64
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:00 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c2so18292358lfk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VtlQ+3hM/P+ANfbvU+LcjJagzse8umOcu68TzYNqjsc=;
 b=Dz5lfZyEPkdd0N7eAQ27UADDki7GRRZMqHqimmXo/C5FIGp0lmgdhFpuIkWUCkaJJo
 G1unBpX03pOCQ3kgKHpGglHFPJsQXdI2oY8wY2yAaHYTBAroHcyQj9Q4ePWFWpQc4SDR
 wVHE72HladG/nyl13UK9x9/JRQDnJkqPpIki7lRgb9UO2bXkuPCTLxNBgbp98wpUM4lJ
 Wd+sNk9RJEkXVGgT4KiIIs/0P8z6n/Vnfy8gZlOEAAww/5l+CqRUZImGAu/P9j+GI5RS
 5jD6aI5dEH8/qJeVl4AMqyqS6JPj0AOwt7eAc/gc6X5j/TZT2vCeeoIl7T9RNgTATvV2
 whuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VtlQ+3hM/P+ANfbvU+LcjJagzse8umOcu68TzYNqjsc=;
 b=ayqxIi8WXHig9zqSL2KfcLIl+yNTKYPwR8v+LNTs23WjXObl8Q0fnpu1bGqvyG7B73
 1ZhgyAAh5PsXgLlXx0QAZT3Qki0aqZkbv+5uo4dc0OXTza/AC+AzjvfCAn8rYdkLvH8I
 zrsQ1pHzBuAge6La3QU/IMv0OfFKOHYTQvPs/p/RnlhO1z1q6at+6us6WiKddnneV/1b
 yszKsPYzmfll9da0LEmwTYaG01A/5GdpKb+r/SuUGeXsoA9wDBspIn9QM7B+WRo9FwDj
 UmiDiod4Ufvh42bEs3qHOfSmEetu+O9l8h4lPAOlxJsZnsFc9m83GJ2okDN8w93yEjDG
 bSCA==
X-Gm-Message-State: AOAM53102CJiAUXFfyyMMWxVpyhuRUbur3aZ1420aXWJdK4YGtDIVfqE
 fvtYAB+nDRVsaeY1EonIqfumug==
X-Google-Smtp-Source: ABdhPJxE+KET2TkT1nz+5eGpQKt7okZGZwF+Kdnl1FePY8swIarLWPWW9LzspzzA2mS5KLuwyemL7g==
X-Received: by 2002:a19:4316:0:b0:479:ed75:5c1f with SMTP id
 q22-20020a194316000000b00479ed755c1fmr4134295lfa.253.1654777438831; 
 Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 08/14] drm/msm/hdmi: drop empty 'none' regulator lists
Date: Thu,  9 Jun 2022 15:23:44 +0300
Message-Id: <20220609122350.3157529-9-dmitry.baryshkov@linaro.org>
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

Several platform configs use empty 'none' regulator arrays. They are not
necessary, as the code will use corresponding _cnt field and skip the
array completely. Drop them now.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 4ec55616a2e5..8f0fd2795748 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -370,9 +370,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *pwr_reg_names_none[] = {};
-static const char *hpd_reg_names_none[] = {};
-
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
@@ -409,7 +406,6 @@ static struct hdmi_platform_config hdmi_tx_8084_config = {
 
 static struct hdmi_platform_config hdmi_tx_8994_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
@@ -417,7 +413,6 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
-- 
2.35.1

