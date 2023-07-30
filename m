Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF87682E2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B557710E242;
	Sun, 30 Jul 2023 00:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA0710E240
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:28 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9cbaee7a9so34983051fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677326; x=1691282126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9r2FiSGlv7wgOHOoRALy8oCegVMW4sXhzSkAM1IovEg=;
 b=GROdoyKlRuWljLB8KHIekVjEeq0Q2Ju3uiX/hKMLsgxngB9dzZdhqke6jhR1W92tkx
 pNC3oPRC5E0hA0A5Si1HTwbVRhopLNnnTjqip8q8mqslbWvKobePqegs6ZtVNVemNEFY
 wYP40DFn4hLAT5fg0VYnuPkcmhxeupiYjATbeADSObs+h2c4xeoUbGORJstNUHccGmep
 klHoeQIYRT58QrUWbd1wGVnL3cJgJWI+HWuwj+Y6rp8u+f0h4J/+UyDXNHS3YQfqW8ND
 yg/GegJRkYHRv+2NtQidLvWhYdRsoznTtxWO/ekd8tV8kUBu2dQp9lhkDEIJzaG6/nql
 WKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677326; x=1691282126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9r2FiSGlv7wgOHOoRALy8oCegVMW4sXhzSkAM1IovEg=;
 b=cwG4oJC2GQ7DhHjiP2RGaVFSmgs9zjqMKOt7KK35SxSf3X4e3dp4AXlJPapPeRcMc3
 GXsI8P3GSzrT66IFDssbWuqX+X0dOW1piECKrZ0QVnyEBmXp0Mvp4Wrg6lcMkudPlMFJ
 6FKkg9SlD6smBZESx0YXDxPKboCUQnckTp52j+5SCZSz9w2ZFYfxfPVUbwho1n8pQp3Z
 GDh5aAZgiwaSB+JjZe4VPfa/fvYo4WawOu53Ld8t3T2AL8qs4K5FRPHMCUpGXnEcpNB/
 kyO4heD3SNHg1Nqpyuv2dBnGnhoiN26QikzB/iExYMlxDA6mt2oAcv+rtsbjLF91erxP
 x6Ew==
X-Gm-Message-State: ABy/qLaZ44ubMMM/bKmZFydJSj+pBfdFSChENf454bc2CE48BqOGn2do
 0z84MeaXlu5mpXz+UGiEma280w==
X-Google-Smtp-Source: APBJJlGFk1AdL7l4gkHhV23P1a7mPsidmxanhP10JTAKOA3wm0o1TVM6xefwy4Uzdl3hz7tMW/4eIA==
X-Received: by 2002:a05:651c:84:b0:2b9:4324:b0a7 with SMTP id
 4-20020a05651c008400b002b94324b0a7mr4245966ljq.51.1690677326436; 
 Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 7/8] drm/msm/dpu: drop useless check from
 dpu_encoder_phys_cmd_te_rd_ptr_irq()
Date: Sun, 30 Jul 2023 03:35:17 +0300
Message-Id: <20230730003518.349197-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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

The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
nor hw_pp data, so we can drop the corresponding check.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d1f309f45fa1..012986cff38c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -108,14 +108,6 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg)
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf)
-			return;
-	} else {
-		if (!phys_enc->hw_pp)
-			return;
-	}
-
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
-- 
2.39.2

