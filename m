Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A3790FE1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1B310E283;
	Mon,  4 Sep 2023 02:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621C810E283
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:05:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so13629001fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793100; x=1694397900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LctnTM5rXutjH2qlEAQeifma8NswX6DnB9xbh8Rm9eY=;
 b=asEgwzq/Kq4xtvIvak2j+k3dJ2q4rG4zorJrkdPBT1YaK7RAhvYJuroSTefmq5L54W
 FULzqXRAh0nk1VAAkhpvDEVdt0ZliE8yWQT+srj6rslT8+lJLaUwf7Pft8S9qJrODFfM
 STUgYC7NAwCiO7lNABDc4xdkOQEQPjin1H/b4/MfBH0cxOc5O5YtSVz8I/QINyR8nXYZ
 3B8yJCk6PUpdJFc1KC/8B8+/uHlU2VuT274bZQHq8Qsuxu1//4jT2UA04V2zACyrokpp
 rDeUjaPu1Zooaqin/s6wMuvdc3F8l561x17BEbSi45ReHtXea7HhLPTF/XOmD4NThwGn
 hOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793100; x=1694397900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LctnTM5rXutjH2qlEAQeifma8NswX6DnB9xbh8Rm9eY=;
 b=RI4Rabp26DS2rw49M6I08hJmOPBXtXnYL1zS2jARS0T1oogv25Zyi48DeUTdnSVg0j
 MhVG8mIRlvruGiTZ/OcIYBn/2bCeB5qufMEYXiPPIXYRVjGmEjYXJ0U/qfkAIFDYb+Bu
 pmVCNFuBoSHv7YS0L1fj6CRHL2jTRcviaRShZZ8h7HahCDkrGvcPN7f9AL4ht4NiqsfC
 KPKzoKhVFle/OHWuVq311vOAUVjlyASy6WoWSfi3BmtbQsxCptsXHqr70ddAxFwv073G
 spHFdBMoKHhbXL3In15fHJlE+ar3cRm3/7ccNOqPPaulQ56P7CZnKiOQe4/z7n5xzRhw
 djLQ==
X-Gm-Message-State: AOJu0YzpdtwE4JcFSuToVMZpXzLO7LUExNZiV7JADSFCTrOs7B/9Tbtt
 k6U2W5PKeSECBvxlNCBgJJD+GA==
X-Google-Smtp-Source: AGHT+IErnrm0+qqKHmwbz21Eyaqf6ZQ4HGuLHJcLnOTwGxcmFR3xhvBdJIfEOcc0tD654qjyPABRDQ==
X-Received: by 2002:a05:651c:145:b0:2bb:a123:2db7 with SMTP id
 c5-20020a05651c014500b002bba1232db7mr5205131ljd.51.1693793100378; 
 Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 7/8] drm/msm/dpu: drop useless check from
 dpu_encoder_phys_cmd_te_rd_ptr_irq()
Date: Mon,  4 Sep 2023 05:04:53 +0300
Message-Id: <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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
index e03b2075639d..d18236bd98e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -108,14 +108,6 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
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

