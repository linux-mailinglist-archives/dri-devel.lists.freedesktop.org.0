Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDBB7474CB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BCA10E2D1;
	Tue,  4 Jul 2023 15:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB8510E2D0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:03:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b69ff54321so92078561fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483038; x=1691075038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=eRPnUEHtJHryVOVqJkVGBYwQ5UYzMkQXRYAtS45KefIqb3KipgCoIaBlKL7bRSXHdm
 nlE8Oj/LwmEJN7iE4bOOMVagZffzebpZrnP33/W7ISTIktbe5Z/4cB4eZZfJYA2RwtgL
 pgDSH6GTSf9kFMA30f+mQK6nP1oAG6e8l/0eiMVf9cPGsRag8F2eGDba7o0Ff7w+qNmT
 TXJMZp4iZ3LT3+n/jjJbdlYcET+54RhKDFjNognSLbCP1EXgPhSnhJKAGhcVdFtBa2uG
 Om4rOzTBtPZT5uV0wBRpKgm8iTLl2ejQ3ftxCkgAl7udHQ4AOIgFVSKavYj13aT41kr7
 PmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483038; x=1691075038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=IIy9XMS0lkmuwG8f9etJvMOEG3slyMM2n8rHDs9J+41rqWADgdjZG/her1ZfjHVdK2
 13pVVhc6S27Pg1cTk1ToC7wkO0OnfRVU+W3ub19TsfYOZSom7VyaBPg0qZsnj0fSJPYU
 1DMAzveWXm+bGlQP24blCJYJ2iuVFBoJA4tdJ4JZRIdmZxs3pZ3a2S5WNOJy6vLb4B6m
 j0M62RBmPVO73EWsCe3xUTsKW+IZbEgR1a9q5oXu6YcZblz91bWJZu02D46GERGEIcq4
 nFHI1nCd61z6JBR0yvoC5rMR7Sjd38cAT8Xot9gK8XrtGRdg/4okuVAiql2WWk3mdHCc
 +VZQ==
X-Gm-Message-State: ABy/qLYd5afqWavtZIAxJJrq2ECla0SZs3jFzvrVRlJdiBjExFHsP1X/
 FapSRxHC97GrVfpvU+iVjv5H70tSypPWf+kF0z8=
X-Google-Smtp-Source: APBJJlFyv1W/R/7VTQdE5dFiynY7eN0awEen8if6H2sa7Oz0cOji+wA2SPd82jd9tMhVfbJkx4Xe/g==
X-Received: by 2002:a2e:96cc:0:b0:2b6:cc12:4cf3 with SMTP id
 d12-20020a2e96cc000000b002b6cc124cf3mr9703950ljj.48.1688483037903; 
 Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 03/14] drm/msm/dpu: core_perf: bail earlier if there are no
 ICC paths
Date: Tue,  4 Jul 2023 18:03:43 +0300
Message-Id: <20230704150354.159882-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

Skip bandwidth aggregation and return early if there are no interconnect
paths defined for the DPU device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 333dcfe57800..05d340aa18c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -237,11 +237,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
-
 	if (!kms->num_paths)
 		return 0;
 
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

