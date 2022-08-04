Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CCA589DC6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 16:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5D9A199;
	Thu,  4 Aug 2022 14:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519A795C37
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 14:39:20 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id p8so15887plq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PA3kdzp0DUZo8PrDClSQDuXZX1yQ9lusrHWUmYvCDMo=;
 b=BVptfQRoOHu6FZ8rsi1NQavzLV2IA20Fpnh7YJzNgLMxtoBPLuXS6Hp0RpP+DecnB4
 R8fj7DslXRB34nLZ6/cLsyL3amdpi1jAXvEciouLXg5tqIdfjCETM81pz+Wl0heT66Ji
 K+wgZV2S+g9Mcn6/94IJhRCDVx+QFqlc4+m9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PA3kdzp0DUZo8PrDClSQDuXZX1yQ9lusrHWUmYvCDMo=;
 b=OpBzlViw4okHWgW0Qg5hNPgc14ia6OqldqEHlHkAabH25xZV3Py26/vskjf/fbZELv
 j7nBJvAOrs5qAv15fpmub9wkUejhPKDJVMQQ5n6/8kwm3je1XDVsAQ8uvxthwgNccFow
 FR4XhDlijUgYQeqqVY6EAHTWDoT/C1ldtaZ3vg7+L/c4ww3g1gz+PUO+jzLNLLzcbjB2
 IVMQPc0uKWDKy/EyhrDDHscKAVHvjNe2vwEcVDJpBHULOxOhIhDt0CIvi7BriP/XOIos
 cmsQdISZMv/Ev86VvzU29m7TMUcukh9Kgs5VI+LNAgacgkGCfxmf8THSLU0jN80FXJV6
 bOyQ==
X-Gm-Message-State: ACgBeo2ehH9fpTxfXehgXIowiIG2r3Kbb0Sr3eXOChBfXW/8pP5Ts5NP
 i8p5BimGGGkbkC8XaxDK+itmiw==
X-Google-Smtp-Source: AA6agR63hMOHGikhLbXTYYdvm4LNQSHi34vIoHbXnpbRhGi/VAt/tgAf4ZFBeu0xQWLLoZj5RldzdA==
X-Received: by 2002:a17:90b:350a:b0:1f5:6a5e:5d12 with SMTP id
 ls10-20020a17090b350a00b001f56a5e5d12mr2899279pjb.46.1659623960338; 
 Thu, 04 Aug 2022 07:39:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:aa71:2553:6f54:5cb1])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0016a111c83cdsm1075071plk.119.2022.08.04.07.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 07:39:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 1/6] drm/msm/dsi: Fix number of regulators for
 msm8996_dsi_cfg
Date: Thu,  4 Aug 2022 07:38:48 -0700
Message-Id: <20220804073608.v4.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220804143854.1544395-1-dianders@chromium.org>
References: <20220804143854.1544395-1-dianders@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Archit Taneja <architt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

3 regulators are listed but the number 2 is specified. Fix it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v4:
- Use more gooder English in the commit description.

Changes in v2:
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 2c23324a2296..02000a7b7a18 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -109,7 +109,7 @@ static const char * const dsi_8996_bus_clk_names[] = {
 static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 3,
 		.regs = {
 			{"vdda", 18160, 1 },	/* 1.25 V */
 			{"vcca", 17000, 32 },	/* 0.925 V */
-- 
2.37.1.455.g008518b4e5-goog

