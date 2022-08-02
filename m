Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6558846D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 00:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9D097FCA;
	Tue,  2 Aug 2022 22:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D73A11253D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 22:37:50 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id x10so14037267plb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2z9VWF3hK7//dTsr3ET+yhlA0EUoj1I28bGbEnp5rNA=;
 b=DzfA8xUlGBHuYnAia4vD5rj+fXD1Re7St+u9/2ucmBIM0lCtoNKupWZ4tPkHKMBsvY
 OADjkVUYHRdAj/Z0rYGKqx2a/NcYmiVqNb3iP08kmZ6tcz4z+lXGd7FTYGPj1742wa0S
 P1/GSUMDp+tt+Is3076zFZB3jnd2itjWeLWYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2z9VWF3hK7//dTsr3ET+yhlA0EUoj1I28bGbEnp5rNA=;
 b=Rvs6nrmwXpn1zID2XjA+dlsRUcjftMyZYOX9aMkd5ESCTsWzR9AeCq7e8w6GY7B31X
 v+Pr3VNcxNynAAPWxSzyOUvhIgvKm1ri8HUJXcqcigxWJMdfBLzvSvJTuW09F4Cu/huw
 aK17ur3Gt7r0V4KL3deCR9qCQWG6T8GKgYWnzxanKh8H6lkh82wxp9OGumQ+Ui9MWPzg
 D3uA1wa4JA8IffWc4ZX1uBH4y2Ww5nbn41MDdYCpkbv4VxvM7ivEcujodf2nRvHrKoLT
 p3qyIojq9eD/53Oh8KzBwJ4t0g9uKpQApDVmzdqMmfqcna+0yDFnCcKu5lpi0n/EocxY
 8c6w==
X-Gm-Message-State: ACgBeo1tlXI4zry4Ku1J8k7nbECmFCG6WqcaLtbYN5dFvdDE2mQggLhW
 LMg4rnHbgWsPy+oz2kcu0EZVVw==
X-Google-Smtp-Source: AA6agR7M6AxyAEjgTDhbxQMLH7upd96AsxWNvKLSMCEEt5qLO0zW8YPaTG5Y95obmNomqZGuYa4gbg==
X-Received: by 2002:a17:902:6bc2:b0:16d:d2c2:7ff with SMTP id
 m2-20020a1709026bc200b0016dd2c207ffmr22353739plt.87.1659479869857; 
 Tue, 02 Aug 2022 15:37:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:31c9:9937:c6bb:62f5])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:37:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 1/6] drm/msm/dsi: Fix number of regulators for
 msm8996_dsi_cfg
Date: Tue,  2 Aug 2022 15:37:33 -0700
Message-Id: <20220802153434.v3.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220802223738.898592-1-dianders@chromium.org>
References: <20220802223738.898592-1-dianders@chromium.org>
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
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

3 regulators are specified listed but the number 2 is specified. Fix
it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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

