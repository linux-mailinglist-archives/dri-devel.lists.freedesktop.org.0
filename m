Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC516B332B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A2310E917;
	Fri, 10 Mar 2023 00:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5110E91A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i28so4668973lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
 b=dpa3CvQoMqLUpQvMg81TG8iu2AZqFnISSwPxmR7zePKmyiISiJPt7ZHAMQDeyp8f1n
 vbO9uPy6yVwPx91g//I3TR8ybsXAD8mOh49q9IXO8hnaYD19+o0GLdh+JqmFg0gm4MP7
 r9U0aWIaCUOsmWvuNjyndWq3iWLF1gkGl3G2qwjXZGTCL8eKpafl01CJXsRUDRCNAvy8
 sXFpC4Xi+O1ivoN9yPcJ1RoErDNSf3nLK9+z2nkiKDx+OOvkK9TsrttXbC4ju9q3aqNv
 Irx6xFB20B+O/DYGS3OllzZ6P0S7EuUbGJMVn0RIXWN+L/AWDSiC/1sau7ZJ+x56idOX
 zvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
 b=wU4IK0LKg3PR1GmqqEJdJf2Vc8VtA8rFpCO6AyC72sXfhgmF3+LTAm3cRHCuksWaiL
 luD36WSwEG6claCUkmDCGJ3FNnfEqEUHNRZZqQbnJNOZMAhhjKkDuH/XpkfnZYfDUARn
 wzSk0vkBMWzTWZ/sfGOFaESCnLKFVGjUzXPmRcbbPgtGXNROg4eT6MyLJayAgkYnXtI5
 nlhA6RV87Loz6bt/ZA7T931KxHKhry+SKixLPTI66GR7VUga8Oc6WS9r7LjG1VY5bUmD
 NDgeyX2Glq7ZA2VPk2w2fSrXXIyN8Dywl3DjFpn9TgNAXg87MEDwuF+tz8u2LWoG9l/D
 A4og==
X-Gm-Message-State: AO0yUKWIZWnffpAeh1l3dxhQaLYNbtkIRJrq2rpAJzYvxBd5+eTqn7Bn
 k+I115dlRbeTdwA+c7i+PjTd/g==
X-Google-Smtp-Source: AK7set+zkZumdquGYypZ9XBYeTK7CJFty5fR4mrgqCA2m5j2iWgzfAb7xZvNO2pcxG4mbgiu8DpE6Q==
X-Received: by 2002:ac2:4824:0:b0:4db:86f:86dd with SMTP id
 4-20020ac24824000000b004db086f86ddmr6988089lft.31.1678409834486; 
 Thu, 09 Mar 2023 16:57:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 10/32] drm/msm/dpu: clean up SRC addresses when setting up
 SSPP for solid fill
Date: Fri, 10 Mar 2023 02:56:42 +0200
Message-Id: <20230310005704.1332368-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

