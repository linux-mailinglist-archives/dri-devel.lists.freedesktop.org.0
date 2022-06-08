Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6C542FCF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A19C10FB0A;
	Wed,  8 Jun 2022 12:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3BD10FB0D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:35 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a2so26768658lfg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORFFh/OvwkdHyQw6T41fKq8t4AfCf6S/1IDmxoyQ/4c=;
 b=wDi7mI3wFjv+MqE1wKSSFLB8GGcxe+vfPK0vtxw3GUBXmzYkA/1Ov4rnTQCOrdFvDa
 WCzA7ufrcjUn0xLCY/pr3hTjPeVdsyGB9vWa5KJgx5aunKyFtxRuLFRTHcfrW8ULQWlQ
 4qWFCkoe1mX4vdziltcPI5wegX7NYuzr0s5aOmZ0X1YcuBP6ywgxzn6J7a8glXk2SJFC
 VYLo348CEhpBzGjZoPACRRXcnYOvnTHSLwmv9sx1zluWS4s0XHjVhVcY2tQ+Y0Onsca+
 ZR5pADzA/lyp4L3d9SFlzEi8MQT0ezCXnaBh+C8UeidMrEZfper3ZItUBagrFi3sRMRI
 pLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORFFh/OvwkdHyQw6T41fKq8t4AfCf6S/1IDmxoyQ/4c=;
 b=HO+LLls9BIHPXcUQ0/mENDbJx/WjUc+lCe/7zOykoV4tuXloaboL754I6MKp3TsR+w
 tunYCj3gbRibj11RK7Il/xT2GSCdDj/Y8CBQow3a2n4sCVBpUHzD1zgReNE7bOMJMmlE
 lfxbphfQXlcP1c+WK7GCyQGYTXgQ6QgP8GH7GIu1c5XfNQCAwzuFl7xrXmbAPuEZUmXP
 b/HnzM3jeY+sJdbxprwbItnTefcXhkD8AthI5c5wE81pjV0A6jXI7Dfa+7k9YKfHBSCK
 qA74Rw7jkekN1xTQ8dSIlxZYL3Hptuo8NycH7SmJ1RnVtQMbsu4D06Fh0g6FeVevPa1u
 4tgQ==
X-Gm-Message-State: AOAM532qEuUjWgbqX0RV823IF9sr6EGmhfHaRf2pXJErHGoXBts+Fulq
 jTs2293sO4Yz55gB0PQeLvsERA==
X-Google-Smtp-Source: ABdhPJy+dxO/IWKY0573dyyNPc6FWVijcUPdMYkPtITz4qJPlvq4+Y19DzS2iPFWw9L8FlKp3vWCTw==
X-Received: by 2002:a05:6512:53a:b0:479:1725:51f2 with SMTP id
 o26-20020a056512053a00b00479172551f2mr18043645lfc.688.1654690054546; 
 Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 09/12] drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
Date: Wed,  8 Jun 2022 15:07:20 +0300
Message-Id: <20220608120723.2987843-10-dmitry.baryshkov@linaro.org>
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

The MSM HDMI driver has support for hpd_regs on 8x74/8084: supply
regulators that are to be enabled for HPD to work. Currently these
regulators contain the hpd_gdsc, which was replaced by the power-domains
support and hpd-5v/hpd-5v-en, which are not used by the chip itself.
They power up the ESD bridge.
However it is a separate device which should be represented separately
in the device tree.
None of upstreamed devices support these properties. Thus drop support
for them from the HDMI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ebc87f2a626c..bc6ec6aa2cb9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -364,24 +364,19 @@ static struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_reg_names_8x74[] = {"hpd-gdsc", "hpd-5v"};
 static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
 static struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, 8x74),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static const char *hpd_reg_names_8084[] = {"hpd-gdsc", "hpd-5v", "hpd-5v-en"};
-
 static struct hdmi_platform_config hdmi_tx_8084_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, 8084),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
-- 
2.35.1

