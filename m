Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B06D6247
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F078810E6AB;
	Tue,  4 Apr 2023 13:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0228C10E2D2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:28 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a11so33765029lji.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9RjXB7jo5zEV1k6ONRMcFgRoz0BlCwoDv0zWbhtW18=;
 b=OQoqTxzjoywXHb6nzr8foBdOy1IwX8GB5+8NFdM2nL1sM9I0JURXwetR9U0s2NYP0f
 aZ49o6KkiIY2VanzVD9lb8wbLP8MbXDY99cDpvT0d+yKfkDEuHs4xm0VjS4j+BaJtmMw
 TEqHEUNI2ijs/07+Z+zmhTwpm7Ah4/nXDo5EBc8FOI79ufN+vqHIPzm40j8Wxhv6jNto
 iBxJ2NIpZBZ0L/KLDBxBtxDG2thbjCZKAoC/nxK8+GhDJJ360Q5UAa4QEisiIIL5B/Tm
 585r/u3IekT48xDT0WGt8XYkAL55HkAN7HOzniSJqRaSStjikT5mGD9oqbDwmF87Vyrm
 C3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9RjXB7jo5zEV1k6ONRMcFgRoz0BlCwoDv0zWbhtW18=;
 b=mwsSSnEj+Vgy34jBU4QFlbUMnO1H6/DWCWhla3am322fzoV/qLt16Gyh2jgKw9bzqD
 iEvDU9kitTHVe9QJLsMKPO1CJ1MgoHH8XcUinvkAWj7oNhana3OfIfo5+yclNiSITdC5
 mZYC5gF4+jpEnWAl1Tt50Q9X07Wqt8HKsDCC9LqAwSJokM6GiEAGA049+/0+0VOx5jTw
 HHQwe6n3r4Z+j113rkuzU4y2Mmzjh7HPp3qTnMMojj9/VWFbl2V74Rqu8gWDQxFJHA9x
 MNsAVSKItUtjlLzEiWLvGrxSCuCz55aoCqX9tadOHLZLdP/tok1cHtZWD4k/t0UwXPp8
 dDcQ==
X-Gm-Message-State: AAQBX9dzaaCfs3CPkPazl6PrRVd78+JC6+OMVvph7CIRdtsa4TKmvd9X
 +tm9m+Cpf7OuMRmXGSlvj1b5KQ==
X-Google-Smtp-Source: AKy350ZIncBxIj5hG7Gg5xMST2w1dLeaULTn90xtMqhEnGIh7GvRQGX0l/NzmNxbnEjLeRH3VBXxBA==
X-Received: by 2002:a2e:998c:0:b0:2a6:146:b121 with SMTP id
 w12-20020a2e998c000000b002a60146b121mr897253lji.7.1680613767579; 
 Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 32/42] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date: Tue,  4 Apr 2023 16:06:12 +0300
Message-Id: <20230404130622.509628-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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

Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 6f573e28582e..cae08b5207ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
-- 
2.39.2

