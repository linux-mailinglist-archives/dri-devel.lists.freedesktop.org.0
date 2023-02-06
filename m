Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF568B360
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 01:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DF710E2FC;
	Mon,  6 Feb 2023 00:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18A210E2BB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:42 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so29889903ejc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
 b=EtQO3ETKKzrszdKEBCvl7TDxS4kKt5KC3WXkraTcLGASLOwicOZPhNlO9g6Dbq1loQ
 XV4p9OUhA+8cnpOAQz4AC+jVG81+f8urUmuH9b3KCniDKVuTJQlxcqHQrLezPt+Cv2vO
 qOy7cZBUz+nWDvMpFt79PDx+PnFkQpd+GEc4IqIFY+DHadQzgM45lzmILLm35U/DJ7ox
 vvxr04pOaJpHw2VTq8PaJFuWIWQlrFksI0EUSXjRRqH3JMr0fEB44lP8izrbOP0ar35q
 v80bCNVFOwJDG0n+pjQRBetIsXBG7hpZ4jqRI7FxHZBTAwJY2g7AZno8dCsikkS7RQXV
 nIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
 b=7GqXAhKmfH2aXORwyMThaTXAljEwtfOAdj6knnXwJbT4/erFWZhHlgjcYMhZdkMWzM
 hIuSB/r+muIUvLXbnPZI3Jf8j/D2aqc0J4aLcKG+1yvw27qZCYsj3hGt3wN+sCxi3dg4
 VeZRK0Gh14mNKv/jD89z3UA9bdp44rQJeVEIqNWtRfar27MBONhqcHntmjrerqUN5R+m
 okq3BsjMFWmgB35agiaG7PJthh4VVatYnsK72ifZuNZ3O0R6ep+xknWdNOzfErAGRzix
 UkTJ4rcJk8Stq4EbDQYDeqMlZYG8bhRg/HfE0qBZebe1cM8W/9gol/OCA3QAiK64WTBv
 dbtQ==
X-Gm-Message-State: AO0yUKVHCbJAD1KXlyrPgDy84kHq6Do5XKbNZf99acwvQPNP4wuGQaHv
 MU0tYzKpGbNVHcjTSPby/PVPcg==
X-Google-Smtp-Source: AK7set+zZzZViVlOwY074bvEYuR8c/UQyKMnUHw0qTUrcp4N5Bm3WxnhQ93/LPHqHVWCzqeLDdjnmA==
X-Received: by 2002:a17:907:362:b0:839:74cf:7c4f with SMTP id
 rs2-20020a170907036200b0083974cf7c4fmr18474553ejb.8.1675643261327; 
 Sun, 05 Feb 2023 16:27:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/8] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Date: Mon,  6 Feb 2023 02:27:29 +0200
Message-Id: <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add another power saving state used on SM8350.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4a30d10e6b7d..1bf8e87ecd7e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -211,6 +211,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
-- 
2.39.1

