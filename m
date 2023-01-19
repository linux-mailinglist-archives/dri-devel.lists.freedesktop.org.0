Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2886739F3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065F610E92E;
	Thu, 19 Jan 2023 13:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C33C10E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:25 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v13so2795613eda.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGxFAGv/07YIfPGHHdquQmb9WeqGOqNYWCXT4na3f/M=;
 b=xCl8vy+D2bQ7n/pQhR0uYMQBILxBJqowxKZPgDmsqtmlitPp3r0hSlGpq1w9A4Eplr
 vpDiQkNL8vkwVgmIc1Zx8+xUDsoU2YzODoWti/y4w/aMkT54KezRF2w4+8OsIJ9TtcEK
 KuSj3dtE2p9lCSDi1PRdWv/lbE1K54SnIq9xwbTe19ffvSySI52z9ikXz2UWPF7uqlJj
 ggVELVDHbjLCPy3hKTZOjdjdaptk9xHNkB0s5ggfYkAVkt6EEqLDfkX3QnogOF8Km5XY
 7daHZWmbPxelPc55txvgENaaaroxIGQINIF2djVvvf4r0+idEa/BH2yLmYRs8UrlrF54
 TjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGxFAGv/07YIfPGHHdquQmb9WeqGOqNYWCXT4na3f/M=;
 b=gLSRCspJrRkyCj0NQUQ9fijSUjN5ux9zTcQly1yNFNXEkSJ/YtdOS3S20lM+STbbJk
 5IpBdDZmMq9VM2zR9d04IGIOb12YlW8g2F+X/tj0AKFc2U8AtZx13/He9dB6lqDNUe00
 9owE22aRIHytH4fzwfMz7+DO9IbHcG/Y756lw9oQfTkTQ/XGPHCTy7WiNeb63rqYggcG
 O0gE0SbmeHS+ZpQKzsXyWH21ny5QNzVm2c2VxwiBh6JF93LD73o7+onIYol/Iuk/y0zf
 ggRre6FPlua9yuvihdzRPKWoOPY0xs2f5CN8oadJOAOmqy4/tZs7v7DsFN6cW/uQ63Al
 G+eQ==
X-Gm-Message-State: AFqh2kr820mDK3cs9et5iByZ6VW8dUkIICF2UzCEe046QdDpLyrDrK/Z
 dO2gPT5LNYRQtvC1l1rQNggvjg==
X-Google-Smtp-Source: AMrXdXtL3wJz4wPrnyZk6uF5UZB8Y8QbSjZzVNuPBDVxYs92vHfDl0bSwv+Tf3lCHKol/KPFBewAeg==
X-Received: by 2002:a05:6402:1f14:b0:49e:36d6:dead with SMTP id
 b20-20020a0564021f1400b0049e36d6deadmr8840448edb.6.1674134544613; 
 Thu, 19 Jan 2023 05:22:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/6] drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
Date: Thu, 19 Jan 2023 15:22:16 +0200
Message-Id: <20230119132219.2479775-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace parent_names usage with parent_data. Note, that this makes the
PLL default to board's `pxo_board' clock rather than just `pxo' clock,
as we are on a way to deprecate the global cxo/pxo clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index be4b0b67e797..c3e7ff45e52a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -406,14 +406,14 @@ static const struct clk_ops hdmi_pll_ops = {
 	.set_rate = hdmi_pll_set_rate,
 };
 
-static const char * const hdmi_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data hdmi_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "hdmi_pll",
 	.ops = &hdmi_pll_ops,
-	.parent_names = hdmi_pll_parents,
+	.parent_data = hdmi_pll_parents,
 	.num_parents = ARRAY_SIZE(hdmi_pll_parents),
 	.flags = CLK_IGNORE_UNUSED,
 };
-- 
2.39.0

