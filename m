Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC270A37B
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 01:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA0B10E624;
	Fri, 19 May 2023 23:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFAC10E621
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 23:40:32 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2af15b5f726so33362481fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 16:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684539630; x=1687131630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SP9r8o45jCIKKsv86cuaR2n6xnWFwKLjeFYUSAiBNjc=;
 b=jfAAR1SEHiKrVRED/e4YHu2ieVicHNB5SXnFYtRpO4i2yTK32P6PSIY6no6pDyHR4U
 /3IS409Au91L20PuZSqSaJkO4418crBke1zO+HFMOduMBEVjGOsNcxVfKltHqv24QzOs
 3xSvYLXNkWnNqKnhcNXjVALKOPN+WsNFslOaSzfQqqDZKmiiEJsfOzzy/mIRJp0ExXKQ
 G4RK/rgaIDIlK+D+NW0R+K5e1GIEQTC3MClhOO3CsXV4Tb6Fw1gGcnPxt8eR09x8cqBq
 d6PPvFtVwXl21gHE7taswp84XLUBL6/qQUT5nwDuOl7j0G5jHeS/rAXdCg+s00MDT4OP
 IZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684539630; x=1687131630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SP9r8o45jCIKKsv86cuaR2n6xnWFwKLjeFYUSAiBNjc=;
 b=HsJK5Zop4i6dJChzQiS9mFygqQElJlLtNAvTBxJ+4617ECCa9pLLa0cEnbCGZPgY26
 sl4d2UQemof3ja3uCDWyC6YmxaRDt9pme7UXFeGl27kJR9gQb67rX3/zvIa7ZDeF/pQi
 Sj8eoq/5MS2lU3dkNViQ5YovhktaD5B5huM9cp5r7Dp2gnTYV6G9CAOsPUVZkv7Kb6CN
 nThwkKMe/ltiu4XJaLE6PBZEtfmZUYA13+aV/u/joxkXG9G4BZMGlwOF6zRUKjUyDo2T
 SDf4Hkxjf4c8zgDwQshOXdTTybzc67mG0wHKYSnHKRQWYGEp01nbt6QHZ4UUFsDsxB3D
 daaA==
X-Gm-Message-State: AC+VfDwNc4YMT6npys2YWPNWJNOK0cryzK9DD7qx4fGP/H9EFwuQw+4i
 vmFIRPbvTvshR69frV9xuNoyXQ==
X-Google-Smtp-Source: ACHHUZ4L1DmQxj2wcs+2VmKrhphZOV8bO0R/mrtTqApwLNfX3QOU1rJVE5lDNRfyJGLaU79dWCmK5A==
X-Received: by 2002:a2e:8014:0:b0:2ac:8cc0:bee5 with SMTP id
 j20-20020a2e8014000000b002ac8cc0bee5mr1447324ljg.0.1684539630277; 
 Fri, 19 May 2023 16:40:30 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 16:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 4/4] drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()
Date: Sat, 20 May 2023 02:40:25 +0300
Message-Id: <20230519234025.2864377-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
References: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
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

Move the check for lm->pingpong being not NONE from dpu_rm_init() to
dpu_lm_init(), following the change to dpu_hw_intf_init().

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 214f207ddf8a..d1c3bd8379ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -161,6 +161,11 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
 {
 	struct dpu_hw_mixer *c;
 
+	if (cfg->pingpong == PINGPONG_NONE) {
+		DPU_DEBUG("skip mixer %d without pingpong\n", cfg->id);
+		return NULL;
+	}
+
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index bf7b8e7c45b1..2ca3c666e22f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -117,11 +117,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		if (lm->pingpong == PINGPONG_NONE) {
-			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
-			continue;
-		}
-
 		hw = dpu_hw_lm_init(lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
-- 
2.39.2

