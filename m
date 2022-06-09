Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF5544BDA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D70411BE6D;
	Thu,  9 Jun 2022 12:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB01911BE7F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:01 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id e4so10018720ljl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKk2oambieXEp2AwUFQX/TaOB8Vv+hh7QY5UAinx/h0=;
 b=WV97w6LIARmfhVKCezXA9VaDBJkVmULZJ+2N+TsGr2s4eqfQyflKUYuvv5VkLioVWA
 ovw3rAEGEti5PUWf0ymC8eZ+3kyvdhQ/cbyLHz+k1/rWIs6kgxI3tZoQH56590Rd04u7
 oVDGnK46vj61vTZpHf/MtzhGlH2/SnDWn5tzj37XMUj6hHDHtV41pTPfJJySSE0pWOqv
 fZphbHlinEw5OHvPbnPpT/fCvCrJyLMR0SszxienvPMEhaSQF/1YJ0jNkxhaIcws73X7
 hBNhf1jLau0Ayh6FBRVylvp/HenchsQt9m/26TbtUC/jw7P8rHabBoDcVsg3laS0tq/R
 ZwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKk2oambieXEp2AwUFQX/TaOB8Vv+hh7QY5UAinx/h0=;
 b=u+ptoAEHHp2qfciWzfUAb9NtHwaEVxNAcsaoBkNKy/JaYfUavO+alKFSKrwLLiu9nv
 hoo/nA3gf7/c/vTPc3L4V5a2yzTd9GbxwaaeNKOFrIEu2plRdFjzqTWWIX+3SViK7GIJ
 CyUHZPv3Pm+lrbtDmrjol+si5gVu+XAtWEn3S2lVgPINnX7cpBbwb3vR/9D/MyOMHkQL
 jFNBSXF5slnp0yULw2ngJJ2le/TMNX+LulozP2vOuszh1uAg0Ar3QjDdzNPTpOMJU7SS
 yuE+yl7OE6HRkPhRZyk4DgwE35FicDiQsbsuC4hO7MJukP8lgDdfdCLuUzj5kUdNmI9y
 Gg0w==
X-Gm-Message-State: AOAM532/TyEMNkh3MuY0NGbcRTTiCkopdFvPxqQMY1t+Ly0zO8vCunMj
 cNGDEfaTsnmfR7um+by33AXvyQ==
X-Google-Smtp-Source: ABdhPJwzS8bASRLzBpW9RQ7vbEpoyH2bD+NWpuVg2C1yNcDeZs7eqsDz8l5u7gEzRpwhOFpOOij5nQ==
X-Received: by 2002:a2e:80d2:0:b0:255:6e92:c6d5 with SMTP id
 r18-20020a2e80d2000000b002556e92c6d5mr21989714ljg.224.1654777439858; 
 Thu, 09 Jun 2022 05:23:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 09/14] drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
Date: Thu,  9 Jun 2022 15:23:45 +0300
Message-Id: <20220609122350.3157529-10-dmitry.baryshkov@linaro.org>
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

The MSM HDMI driver has support for hpd_regs on 8x74/8084: supply
regulators that are to be enabled for HPD to work. Currently these
regulators contain the hpd_gdsc, which was replaced by the power-domains
support and hpd-5v/hpd-5v-en, which are not used by the chip itself.
They power up the ESD bridge.
However it is a separate device which should be represented separately
in the device tree.
None of upstreamed devices support these properties. Thus drop support
for them from the HDMI driver.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8f0fd2795748..48cd6b9a7565 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -381,24 +381,19 @@ static struct hdmi_platform_config hdmi_tx_8960_config = {
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

