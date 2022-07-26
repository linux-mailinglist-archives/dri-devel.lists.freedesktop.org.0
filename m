Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B0581893
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFECA95F52;
	Tue, 26 Jul 2022 17:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6CD95EE9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:43 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso1325375pjd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65z5UblURAWtS2HSo73KtitpLtnM0+IbS2Ko/ylefao=;
 b=JKQA2DZRhmMHgWDjn9IqsGd1TVfsl2/RxaGpJxPdD+c34DkWDAWNsu9qO/xRlhSFNz
 jTRpE4I/X989DPF2x2DVjb248ibAsnZJAf3O+WByNYpcxeOcUzjim7Qd2uty5uDE1x73
 d5LtxHUT2N3mk77hhhR51bamkKwqf1Z9L7fP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65z5UblURAWtS2HSo73KtitpLtnM0+IbS2Ko/ylefao=;
 b=NeTtEb8ieRhJQCDrs5kjIVJ/3me5K5ELcb8KCXrc++GW+ZIR5YErA2o9aByDeq3/u3
 PiJie06oBqlw08j10ONjm91U2ajjy4jMa50oEg2NfNpvtz1m69lfDXyH0+X4QGP0UzRX
 IY5zBqihi+kiiDEeNGqI+axO1JbJFppyWEspKpVtglGF6XPS7yZNl4BEMQp+t5d8pcsM
 MHARYqLKrhO5GJlVOjtIU39ECARkqT3pDhshDpllS4sbovYXwmzWld4G52G0zihlc4QM
 aYMlEadM1yuaOpCmrpOveZzPofzT745z+Q8pGNUa7stg3kSFYo50GWAl+YAaY3LPofHl
 AocQ==
X-Gm-Message-State: AJIora/TPidAMY8c9OYJDaghYsQNyOGU5Hf4ONz1hfGuY560duE8JNo1
 Ds1y/cZraj/p4lXWV+TGoWxYQQ==
X-Google-Smtp-Source: AGRyM1vaj4AnRg3w38ziBsA+HO1alVRbJxT5BFBbzuR9W1nR9nbx4to4YrRPWTU9jI9OfC/TAk1BDg==
X-Received: by 2002:a17:902:f541:b0:16d:46f1:bd17 with SMTP id
 h1-20020a170902f54100b0016d46f1bd17mr18371237plf.18.1658857122699; 
 Tue, 26 Jul 2022 10:38:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/7] drm/msm/dsi: Fix number of regulators for
 msm8996_dsi_cfg
Date: Tue, 26 Jul 2022 10:38:18 -0700
Message-Id: <20220726103631.v2.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
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
 linux-kernel@vger.kernel.org, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

3 regulators are specified listed but the number 2 is specified. Fix
it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.37.1.359.gd136c6c3e2-goog

