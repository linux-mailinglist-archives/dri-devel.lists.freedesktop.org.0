Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD7540EAB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9438F10F08F;
	Tue,  7 Jun 2022 18:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3705E10F0B1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a2so23606465lfg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2qnycNDjzB4dFQbZvnsZ97Ybjd2s1ka1P5LN2rGpnU=;
 b=fY4eVUItigtJgeHvg3VY5lGy/icGDdNLR2Uii/vrXdboDbdcDAKK88eJdn2gr+LaqJ
 ogln0wHjW1rbVyh+N+RQPlnoDEDVKirAriNiC4Jkt/oieE7BgNg4OBF+BsCaGdjIH71K
 2jd23jlGPMOaHLYje1sSuwHIQ9QgPP+FNuZJFc44Qg37Q9ImWlrhW9kSBSk0jNvWrywg
 vPGfXG5VGQhHxm9sjcYpiPS6XPeFrhTOncC914wxcXQL1f8BxY7wlCTHjCBY5t9OqS1X
 ILeYPxGqOP1JERYYbVI+TsWLISpXrTq9nT85aYuHIKUKqoLvcbbpZVWjpuKxay+nFhAB
 FzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2qnycNDjzB4dFQbZvnsZ97Ybjd2s1ka1P5LN2rGpnU=;
 b=z0cUI6J9j6nwWtyzv5Vw85r5gpeF3Vrk2Z950QWHiwBbgJMHwhi0z7CZ3Kb6neVUiU
 gLnHTS10yO/42HMcixeB3lI/l1HGDFONvQ84yZV+O3Gc7pK8JpdBOm6qXeoj5q0jnBrB
 f4jPkS4FXbYgTiM0l0oQeH5XZKAnJkAp+Wvpfa3Mq7niuOVbWgc6nC1P1tVC7z3e9jpa
 34hMXViGI4ZXFOFtowHJ00o18wBEecgeZlszLXmIFmY04v/s4ocqL0Vp8NQ+m6ihv3uf
 +mIxJ8HRo1hkz3Id7x0eiT1xh+vDK86O0GVHZw+kFYsakozOcwxixQ/IuFcL/zY2a7kL
 WBBw==
X-Gm-Message-State: AOAM532wPu9UklhSy4jAqEXoMjCgsjihsbvhfX5ddRhYZe8Uzg+tnDb9
 fu6PuiPir+xrPSrMo5ftIQO/ZA==
X-Google-Smtp-Source: ABdhPJw/wSeZ9pSV5Cvm8QerCzYILQ0LyHXjlHxADb8Lhw3dxneUxf67wqRAasEeFvmt1KMzvY0/Bg==
X-Received: by 2002:ac2:4e0b:0:b0:478:6b05:7038 with SMTP id
 e11-20020ac24e0b000000b004786b057038mr19465595lfr.13.1654628294542; 
 Tue, 07 Jun 2022 11:58:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:58:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 6/7] drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
Date: Tue,  7 Jun 2022 21:58:05 +0300
Message-Id: <20220607185806.2771739-7-dmitry.baryshkov@linaro.org>
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
index c87a0386647f..03d8f97b0cd8 100644
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

