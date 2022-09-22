Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938C5E611D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C842E10EAE1;
	Thu, 22 Sep 2022 11:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2EC10EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:30:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id o2so14119805lfc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Nws0gXLCbPL6X9KoHrtPIHCoOBfOHKZJmB1WauEIFW4=;
 b=Cm4/iCt/4HPFS3Z+l8YA5dr9YKfLde/mEP/bKpfnK8EDu3fqU5JcxrXnl4xV51GOfw
 VBMgy9stx2JauU/DneaXoYQTVxEkn4rGkKYnQ+kLM5LnpmEKdUfuH82cnpaQrNrWSpO5
 DIUupurOi7wGq6ccpfWFxgZGIbBHgbkKfRfg7qp2p5ib72xs/mS69bMPaW4cVagHVG8i
 ebn2Kvfx+cehUdop8aAgjqZGgC1er3Mn8b4o31uIzZenXVNEnUkUSqShTmgvMK+Hly5u
 czKDoKeRri7PEPh9nSBgSd9IaiY83cqbdc9DzEVxHd9YvHFcaZ/o1LeNyngrOGqjCq49
 l9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Nws0gXLCbPL6X9KoHrtPIHCoOBfOHKZJmB1WauEIFW4=;
 b=LY9IMOm8CuhI4QZnr+nJkOUxQIPoFM5QqZg0sSzKkHcAhw2qCOPSg9uywmwM6Juo0L
 vP3e3bjULyjNvDi4IPKjD2Hp5DBII0ejXNE9AMLeqxdYkGADB4Fqhm4kKojEqBWC4qIi
 TknMnpM2Grzrd+efLgrxuP0ZHdiyrrcxXXHwJM+wcQzLvYorkqe9SoQBrx6Q3DK/XVNW
 6MM7xFWPU2d6VviV8jlECFXR9pmh8W8Ml0jKY8Vn3tXb8PoOOOeVabe3dRArBtyr6ENz
 7QcwPerxbXD3q5ynz8vzfy1QDVdQ1o9yrlKNCwC/u8VdO6K2Q8FjdPBg/i9xXqeT0m8y
 5X6w==
X-Gm-Message-State: ACrzQf11OdzotPvUsUA5g6rFHBGDL6XYDr34BHABS/wjilCgIqbEvEp+
 71aeJu5ByOin4XFQkMtR3ndY0A==
X-Google-Smtp-Source: AMsMyM4fDheMKM/auohpHSKGpGB20FTYUF2o5KeB20hodt+Cz1FbODPDnrWnGrb7OXwt5uSew3/bzg==
X-Received: by 2002:a05:6512:310:b0:496:a0ca:1613 with SMTP id
 t16-20020a056512031000b00496a0ca1613mr1155642lfp.394.1663846222847; 
 Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 5/5] drm/msm: mdss add support for SM8450
Date: Thu, 22 Sep 2022 14:30:16 +0300
Message-Id: <20220922113016.355188-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e13c5c12b775..9e011762396b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -219,6 +219,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
 		break;
+	case DPU_HW_VER_810:
+		/* FIXME: merge with 6.0.0? */
+		/* TODO: 0x102e for LP_DDR4 */
+		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		break;
 	}
 
 	return ret;
@@ -447,6 +454,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

