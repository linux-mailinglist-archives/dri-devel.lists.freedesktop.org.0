Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10108540EA4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0610F225;
	Tue,  7 Jun 2022 18:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF8D10EF7A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:14 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u23so29765127lfc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIR2tgZYRWBLnmVAd7m2XmX6eAHJSTYm0LMHENEbRWE=;
 b=Z9BNMiMWD8ai815uoPih/wJvYyzn8lNCz/NcNp/njpUTlCMhxuWY9AczbOdSGN2aET
 JdHaDCq29y99l4I4k0nFsgiZcDfJ0LJoIXHnzQ+innSecoOrJGy3ZXTcq2iHue0KdZOX
 IWWshIKaJzw5HM54uW72ChqJfg+E3Jjw5o2eQAXtQGG6qiOJiMTKtcKMnX25/OebaKA7
 0vip1wJhXDEqFhPQ5gKJk8+wTZWro850lV3bg0Rs/gyKgjjF275lP+iWQaBYEOFQxP5v
 dIDlLBY08Lxt2qk793Sz739pxUbriQV2bVj+NYXz8W/kS/Jxba/xCv+yMdst320AU4m3
 dE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIR2tgZYRWBLnmVAd7m2XmX6eAHJSTYm0LMHENEbRWE=;
 b=TVas27jh3BaeXWUKI1VFVxpa5fzJOVipxriYHWWCJd1KZolQWrTVIDcfkksrqd8gcs
 nwHMajSmSO5O4HqQlQeGwtkv4Hn+ZqAVcMZQvkMXPSu0O8yj/RK4sGb9JgYnQjVt9fYQ
 3z6h8fqndTht8R4txHzsXiIgZLwMtsc9tho/brqRc2znQt5gudGbAzZ5N7EELaaoY6cP
 dTsx9L3rtm6u5NW6D8LFlg7FYdXg+j/VR/tLPXpOPrWcKuKrixbyyqvRNbrJ0UliSFSi
 Qx0az8AJJ4xqqwV3X8ZPYpXrG8mt/cNaP3tSCcEZKIkqjr7EMTnPtVU+KPCHNyqSC0xP
 JJBQ==
X-Gm-Message-State: AOAM533ELxeXW+ZWGrLd2zQnPq6nSEBdNMVvzj51yrXB8XAws3WyWIcK
 7XFWLqhvziWzDvfAOTQi7iUBqA==
X-Google-Smtp-Source: ABdhPJwu0bgwWIs2JvK72GIJagzrhqPdQjv0dGrZtc353kYRQPaEmFzS2q1TS6FRQpFMGlAYnMdMqg==
X-Received: by 2002:a05:6512:3401:b0:479:4000:fbe1 with SMTP id
 i1-20020a056512340100b004794000fbe1mr8543546lfr.228.1654628293281; 
 Tue, 07 Jun 2022 11:58:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:58:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 5/7] drm/msm/hdmi: drop empty 'none' regulator lists
Date: Tue,  7 Jun 2022 21:58:04 +0300
Message-Id: <20220607185806.2771739-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
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
index 125712c3fca2..c87a0386647f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,9 +353,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *pwr_reg_names_none[] = {};
-static const char *hpd_reg_names_none[] = {};
-
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
 static const char *hpd_reg_names_8960[] = {"core-vdda", "hdmi-mux"};
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

