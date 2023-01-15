Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36E266B159
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 15:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4297010E10A;
	Sun, 15 Jan 2023 14:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E3410E370
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 14:00:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bp15so39386200lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jan 2023 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FtXT1BPFkhUBcOmVGg1OQMa6Pr60aojLScowtO3kbw0=;
 b=k7RG32ky4SVtjFYCrrfJPPPboaKY/AM8OUnTp5BomwaXOx45avQ5O0gEufAh+hjwWA
 n2GeoW64ty7XyAdZSIzSpjfzAcrUZYvGoDWvLIaktqJ7mYqDdQl78PXmssNhv65/eRxh
 qlCUd/7AAlRLmq+Yx1A1zq57LTAzElXwZEKd05xfy01HncSzG1z4txZkP4pTnyVgbBpT
 mcUo8YevZjoBjl/cePIbNK9KJvxoOA4RpMakBM5jO0//IZJaJhfh6zNXslh6WFWyfWXt
 dQoxTl+aUp+ayvJh7qIy3CVP+Jtn6JPhugxFzI2rKjWOeLI2QfdGlNp3luB/N1Lo78+X
 NmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FtXT1BPFkhUBcOmVGg1OQMa6Pr60aojLScowtO3kbw0=;
 b=N4gBWGlgV5LqERL3pP+2NRakhQegJigysrwRisbeF8QeCGlvWvgx1ZEtyxuvnLXD5j
 ywOmy8ncNiBUdtqvVAx6t8z8vCsmT1EtI4/xeDE0Kog06ypTA7cwjdXM5KZIliJ+yBU5
 r/jKC9Gr7GoGquiLEQ2fMZ9JtcbPHte3MZgCTAYlX3OWts8l08fFu29zp636WMs2J7My
 u9vQm5dHKlj7IcB6nH0omjqhVTiGdTTfUEudCX4s+BNWpska+OeXXWihNszCBe1Zkfgv
 s8GM6qFmMSR6Dyv7K92nFh+R5rWV11NB4YpTxXN4jdFRpeu0FuzpKNmm6ilFOKzo1U9F
 PGTg==
X-Gm-Message-State: AFqh2kqIOTncykOGkr+A/TWMTxu97AwqzbP6gFBeOD4R6sXg2q6KpKkF
 InNK7A3rmgZB+sAgaEYT8iwAJA==
X-Google-Smtp-Source: AMrXdXsocmXVqsyp15ghGtamQ+dj131X30zhjV7sOQNDVlqOptkYlymP9B+12UzN/LXFtel1ELCLDQ==
X-Received: by 2002:a19:ca1d:0:b0:4a4:68b7:dedc with SMTP id
 a29-20020a19ca1d000000b004a468b7dedcmr1977016lfg.56.1673791225941; 
 Sun, 15 Jan 2023 06:00:25 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.243])
 by smtp.gmail.com with ESMTPSA id
 t20-20020ac243b4000000b004cb44c1d060sm4682527lfl.134.2023.01.15.06.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 06:00:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH] drm/msm/dpu: enable DPU_MDP_AUDIO_SELECT for sc8180x
Date: Sun, 15 Jan 2023 16:00:22 +0200
Message-Id: <20230115140022.489881-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the discussion ([1]) on the mailing list, platforms before
sm8250 (and derivatives) should program HDMI_DP_CORE_SELECT register to
route audio to the DP ports. Enable DPU_MDP_AUDIO_SELECT on sc8180x to
program correponding register.

[1] https://lore.kernel.org/all/f86504ba-835a-6e30-6c30-8bb89b1359c4@quicinc.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2664fa3665b0..b94b0a772ca8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -550,7 +550,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
-	.features = 0,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
-- 
2.39.0

