Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4474B75D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 21:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF26210E5EB;
	Fri,  7 Jul 2023 19:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05D410E5E4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:51 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso2644691e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758790; x=1691350790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DEnZwVUAJML8EpbXmdP0CSsN5z4sVoNZMc92oALgwU=;
 b=coO9/JvOLjw/Or1JsuBG+fEdkn9aCi6zCbFLKSdxqwFW8w22qa4BN1DmNIsdXoLmzf
 wWtCBaeJE/GWYx4E5alOCnzLWmf6sbqiImLeoQmseEYZctfln29GQ0H5jaI2Dx8GTmLa
 tSFX4ArxacWPxo36X6GmWy+DnOQy+GABw3F4lL81w2NyfobcroSj1Y6gMkSmrfOwlI5K
 SDlwV+0koPe5RgtTw6dgpPWLsipxzoBGmHRjvrkDpGrOS5Jnj7VJL/zRDJGbYFlblOSK
 cjsBWbjbgMkVIm/dJCTkAJa+4FZlgnOS4K5ksTc+3/ih2nhIXZvjAG13HzLlzQGip9v3
 CgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758790; x=1691350790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DEnZwVUAJML8EpbXmdP0CSsN5z4sVoNZMc92oALgwU=;
 b=kIa2zD6CMmID3bzJSRSpXAyXT1H4SIAWu470lNh4CFY9BC/HJS8Q/1+2T38z44tbEW
 OBM3H2gAnrmcqk72DhDdf1xXwVoRazkOgnoq7KJDIyBEqnsR6Roj5euWpZFLuo3nd320
 KRLsMsOFxCEJEU5tMafvgaWPG/gj5HO2VVOaQ5wwDCj9yW9clIArGIGZ6qjhUFw9ZiqQ
 mISfP7ClZYibsAIQvG4WVYQkUEa9DHHHmTHF4HHCQ8awZPQouABBT1O7zcI2s5Xxm8ro
 W8LRZG/nUM5tKQIwSQa52+mgvZ7uK9lgSm2IUtf4OpXYlhKg3pme7aRd/cAQZbTNhgIF
 xtfw==
X-Gm-Message-State: ABy/qLY61M5iWu1nu9E25gT3fGvgax5nk3cYVjToYHFNNZV5LkYkcPkD
 Jt/Zu/QeHzzEzfjIgiz90u715A==
X-Google-Smtp-Source: APBJJlGC/eiqlgA5hEg30i5pWnlS9zOvhENdz44F1AQhiHKOpFn5oHBr7SM5ijdh37rPLJ/JZF27Sg==
X-Received: by 2002:ac2:4bd5:0:b0:4f9:dac6:2f3d with SMTP id
 o21-20020ac24bd5000000b004f9dac62f3dmr2425167lfq.13.1688758789763; 
 Fri, 07 Jul 2023 12:39:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 09/11] drm/msm/dpu: core_perf: remove extra
 clk_round_rate() call
Date: Fri,  7 Jul 2023 22:39:40 +0300
Message-Id: <20230707193942.3806526-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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

The dev_pm_opp_set_rate() already contains a call for clk_round_rate for
the passed value. Stop calling it manually from
_dpu_core_perf_get_core_clk_rate(). It is slightly incorrect to call it
this way, as we should round the final calculated clock rate rather than
rounding all the intermediate values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index afd75750380c..a570810c9254 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -299,8 +299,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk,
-					clk_rate);
 		}
 	}
 
-- 
2.39.2

