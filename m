Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8675135F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0AE10E5ED;
	Wed, 12 Jul 2023 22:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45E910E5D9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:44 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b74209fb60so7512341fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199902; x=1689804702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=eUQJCuEGxoNyAgK0GQU7bsh0VzSVckuvMBafrWEJstVAupgtuOL7xp0UCV8AY/Bvy/
 N3X7xcBUHIMr7x/hwSHsippDRjIZV6TboLIDmIWlVnDlX0Qbsj/q28ydHIVcT6rEVrkQ
 d1jBsCMk7totRPk0u+TsWmUfTut317VYbAypkURiykvzGHNw7EnEueJ2SQJ3n4O7Kp1k
 M/G2TjTWHkyTkeQUtzV0QguF4wm+h3fY1MLeYby8b0mc4IYmrj8scuD+//ehPL/N6V9Z
 v3qBwC7usWB7s3av551I0iJjUhCd8RGSNj6XWOtYLtpX8O7FF4kS7eoYwK9x9i+VLmYf
 xHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199902; x=1689804702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=X5dlWSoOvG0KQE1xA5bAj6XO+R0FNHiKr4+6RMBB4j8AV6YmKROqspjt45+fhrPH4s
 e5fR7RukEMxjJ3dO+x2IU0Y+Ok5Tnb6RWW3a8eFhrpfGsbL60jlBsJKDfX2yTA2H5kz7
 b0VnxFtNf6ic5u3awiy0uET+NRN8B03gpaRMap/PFtiGCEtPHDr3mpg304GTkYS27Bzf
 xNRuPCqZIMUOowYUZ5Aja3Bx+NPRK0Rv07ZoYZ3C3Qck8OrQaxC5jK/DUkIdJW29KRAL
 I/VtuEwIwA6exmvP8ESSjgr82zvgfhJ6+8wC5F+D9P8Z5END6dEG8NVLGB6uZwiUUhjC
 j0PA==
X-Gm-Message-State: ABy/qLaIm9T9Qe46aNnh/OW43dxGZQhVeWwCAwp+DGWEzbP7kFtHhFYA
 DKfjnl69JS1YU7Aw0nmFc1XROg==
X-Google-Smtp-Source: APBJJlHAcG8o4Mk5Otmnqxt/jCoQlHMizSXykFGZPee/W038aHNo+Hqo6dCCDHs5kBHu5cGYiOPtAQ==
X-Received: by 2002:a19:6504:0:b0:4fb:8b78:4a93 with SMTP id
 z4-20020a196504000000b004fb8b784a93mr1712790lfb.7.1689199902781; 
 Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 03/11] drm/msm/dpu: core_perf: bail earlier if there are no
 ICC paths
Date: Thu, 13 Jul 2023 01:11:31 +0300
Message-Id: <20230712221139.313729-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
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

