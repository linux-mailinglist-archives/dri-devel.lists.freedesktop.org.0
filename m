Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381656A97E8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391410E5E2;
	Fri,  3 Mar 2023 12:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EB610E5E1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m6so3468875lfq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
 b=dQ3kq2F7RnY3i897+kT4TuTTExsNuUx95xfa6b+Z+A1IqNlmhtfRxE4LMqP6D2RPrU
 SCFy2oItL/Q5QZxLdtTHvXdcyACJdJ8NXX7JQJttR5SitOKre2woe10tw4eymRsKhxeM
 /Ou58GzyDT48QzxuL01Il3h2m9cyDyCL1QCxZVKBVuy122L+mpUHaacs3anbeoV2iTgM
 kAFaxQRXLyv2JoppUjf0pB9LszovTP2SspCPjxFdA62AxolAVihVN9/1JVuOs51Isw98
 VItYoYYHY6cUN51BVUfesb3CZvYXUn18OQqs7wRIAAiMN8oBc540wzkICNMNjr7gAYc4
 m49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
 b=BYmGsAJ56Id6yZoJ6Rty5nPlj5BBopGXT0NnUNEq1TpN2DqbRvUKwYule7+YuAqTRC
 aT5llBrW7XZfcjxh/CbuTczFbt9wb5dbWgZCkw+E09CQwfJxeEf6+3Ud6GHqZORz3rYK
 vkt7RdDp0/715E9vJzV29UO3qZkbhmCGVkMkUBjqN3ev9yIhmFsu4QZTJACi89gzOBiP
 7Uf7rc5e8B2ztGNsKIo5Knw21lJs1VjKWsXG5GLfeJFZJUJxsasBN1m/K5g7V2Env5Gf
 bKKFc6uEU1UjepaVgKxnE9wvZO7zFH7xwwFFmKYPB5oIugG9+QpRI6AFRr0oYRWAGqFH
 cLzw==
X-Gm-Message-State: AO0yUKXnTTpVM1OSe5dWTuY43cMsqvxieqOJbWqnaPBKiErHm66J+0P6
 t7dFalPdM+TKY+tt6NNSdqv0aQ==
X-Google-Smtp-Source: AK7set8Lj99QXeAeIb1sW51QtD/bk7y1+w/X6ua6qtkuHRMTIQXtZz8NW4gDQ6Y0nVlGq/EYykTGFA==
X-Received: by 2002:a19:5519:0:b0:4db:3847:12f0 with SMTP id
 n25-20020a195519000000b004db384712f0mr598153lfe.50.1677848252790; 
 Fri, 03 Mar 2023 04:57:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 10/30] drm/msm/dpu: clean up SRC addresses when setting up
 SSPP for solid fill
Date: Fri,  3 Mar 2023 14:57:05 +0200
Message-Id: <20230303125725.3695011-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.39.2

