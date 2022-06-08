Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171C4542FD2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDDD10FAED;
	Wed,  8 Jun 2022 12:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FD610FB16
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:38 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 1so22496148ljp.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUnu09gAxtr9Fbq67p8BUkdq2kOj89CYJwRNUT1mbWg=;
 b=P3/PC86lktVsIK1+SWqrg+LO5K1wShkRhcrwr3csOskceR8GtslTxKB4an9RhfDNBx
 /XZIgYCy4MlSYJaDU/osvto9MmtJt8SxPTKE1p/w62Ec82Lhj8Qw10Z2h6hdMJYqGNPw
 OJyvb1JqwvciPTXiI9ywJbZcQCoPfe75HK502DfoJN9bvW0PDtVZrIhoqFb/z3taR/dQ
 SVcR4BeZRro/z8ftDGHW/q2IbKAfAMdmVgKVFgZQQzmx/mHyiL2LHraMwyn9uXWQrKix
 gdD32tIhzR1BWkVnpQXGONMoseHXX4OOloBWXvGm8BtwVZ9mWOwn1Lt/ggNM4/QEPBM0
 FZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUnu09gAxtr9Fbq67p8BUkdq2kOj89CYJwRNUT1mbWg=;
 b=eRuFfIE3IIer7jitQNi91Vjblwc020zvcULynqMeomEG2//VpMFcmxjYAAF7HZi5Jb
 qyWPw+NQ2i42bJsrUCREvHVABolHGFyb1ElokGAqhwHAoQA4y7hXKSbtUfjZRg9W1bpu
 aaM4edo8jKE8/AKDAbyyac82uqdWzU3BUQXNTbtxBS2LCbgeSMFsh3g3+GGRI6nXfx+t
 tb7jJU10Rs4dyxMTmFYqtc2ugr/hZYiFvRzaCLxyXs3XMEZhYPyadc9d7RLzEBGHfsEL
 lajkR1CEonYh6ASGzAnmNqRyta5XWtsdqeZvC9vTNPDc/UxPQDbPSDJZ/pUyyaBr6Gug
 bkyg==
X-Gm-Message-State: AOAM5320H5UthNUfYRNZIOL/q0idIXMlyYc4gRe8A9qHFpEB5GfthLDl
 qB9b0xViGNvMhgio/vaxFnJZYg==
X-Google-Smtp-Source: ABdhPJxPKQ12vUYB6x/iFUiRQmyY2lhKiYbVI719bSwqZKO0+mUbuBM2VNtgHx1GAIsj0r0e/Eadmw==
X-Received: by 2002:a2e:97d0:0:b0:255:7c1c:f3ba with SMTP id
 m16-20020a2e97d0000000b002557c1cf3bamr15093302ljj.49.1654690056892; 
 Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 11/12] drm/msm/hdmi: reuse MSM8960's config for MSM8660
Date: Wed,  8 Jun 2022 15:07:22 +0300
Message-Id: <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
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

MSM8660 requires the same set of clocks and regulators as MSM8960. Reuse
MSM8960's config for the MSM8660 (8x60).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index a718e0ebf6cd..e3b35b406e51 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,8 +353,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static struct hdmi_platform_config hdmi_tx_8660_config;
-
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
@@ -561,7 +559,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
-	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
+	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
 	{}
 };
 
-- 
2.35.1

