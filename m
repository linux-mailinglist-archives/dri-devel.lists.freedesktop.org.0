Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE7B6D115E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC5710F07A;
	Thu, 30 Mar 2023 21:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D1810F069
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y20so26422586lfj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2iR5rV+aMHVU1JGphrgXACA/+OrxgNINAuIKG8mTtjY=;
 b=TsSPMuXsvHXKFcLsjyn+Buz6LjjyyJp20+9JKWWMTJENAUrtsj3nkx8ZpcBCJUPXg4
 ng/M0UGteKcQP9IjRa525nuy+jwy+MQHxxOa0iupnSbKr+V8tKKHHTK1CMWxpbLjyfpv
 Gq5iWFw60gGtnBMK3ENLXtWtetHuKWSEI4Fl8fMjTOUfFnorXk/Dj1aB2lhKykvTGIMw
 BTRnMMa2Agy4ytzy3OcL45JiR3+5y1jaMz6LOyGPqvg83TbK/9NMlQ/4uPBbcH7Qd++n
 aQ/pllUXJ7sObA5wruCaKj3lA7rONhy5yD5EaHTPDUmUUC8sjqwIS3PdKqZ0CqYJ6nWA
 3PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2iR5rV+aMHVU1JGphrgXACA/+OrxgNINAuIKG8mTtjY=;
 b=KfgTIo3EFAFxV//lpwgmBpprs5ahddH5pvWLAo7SSgY3742/Mucs4gSLp6iQOpR9VO
 BIobxFL5oBV47ccKE7AGL2ctlVyW3Pz3sFShcLDrooW3/kNQX3YSMcElAy0YMD5Odz1d
 TaReaRh1IpzdWf9BaxzyDiIHpkUFwB/U7EkOSqYcaLjNFKAmEJXjmMWVgyVdf+AMqBbP
 dZEcMH8v+cp49WpLQ9m3g3N1jgM0X/IRcgqB68B0hTO+gKRwF3ibhv9ZcwVRq2HqNYDa
 ysb1z/++tO4cPRYV2EZ7s3qOUgh03aZo57nrxpKAneDcJsRBhg4/WGf8geZJ3fc1zfeO
 72bA==
X-Gm-Message-State: AAQBX9eetTDdOWPb2pOmVKMVeR4DSaK1F9wzyMrbmG3XHRLjAUiflBSQ
 wICAEd73eaEN56YINnxIZ8yjdjZDu+nBWy1uNBM=
X-Google-Smtp-Source: AKy350ar9WojGNbOiEwQac2hyrUaRsbMKx+LVJ1xKOXdjdhVR0IC6JGh6TE6MEgbFJoCA1owIA6EAA==
X-Received: by 2002:a05:6512:3c2:b0:4dc:84dd:eb91 with SMTP id
 w2-20020a05651203c200b004dc84ddeb91mr7291215lfp.22.1680213254704; 
 Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 26/38] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Date: Fri, 31 Mar 2023 00:53:12 +0300
Message-Id: <20230330215324.1853304-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
index 49dd4a908413..c13df4269c21 100644
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

