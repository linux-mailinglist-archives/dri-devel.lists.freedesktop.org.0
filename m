Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B5677612
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C2D10E1DC;
	Mon, 23 Jan 2023 08:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2247010E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:08:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f34so16937703lfv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 00:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c7wlYRJ20Jol236QKN6NipQuokT5Lc5cfhgSG+Al5uE=;
 b=YiIp9bSkATLGtKH5X9Qw8/wPF5/WC7QLObJT7zQkSWWYGSgBKWTCuexj4of3gEZb/4
 Xi76HAMGUOmeQVFUl71QGTlVn5iLqCRI8Fv3IyLNJ/c3S1thWAIXGusqqdbIvkqiSVE4
 P82BwXvvxpPjh6IB1fcZfl9MK/25gW4+l8kh4XE1bfV6EP0EXJqSaCL2kF6pahAMSdqd
 c0usWW0p0EJRpqMEhODnakmmLMItLvI5KFcR7a3EcLfOILZchJX/ixLUSlusDnyMwDOW
 TX6zbffuPS8GAWaBKlk40OoX1h6aUARXyG9Noi1H1jDZjnq7ypZ7PP8BvXyOQXy6vfDa
 wn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c7wlYRJ20Jol236QKN6NipQuokT5Lc5cfhgSG+Al5uE=;
 b=biYA5w+DQ7BHJ2PEpxVPjc8FQNWE1WQfSqcOjS0peGLWfHdgI6v4iFETfkVrek1u+r
 7c8fp25rIe7GhrTjQAWDQUvlXJ9AMVO55S5C3Z7lyxWhUNrbbGNX8yAONeOAM+BHigKs
 0RDhye7amHc8EY0TOIOXEW+o8wZTRiufjZ6IG+QNpsUlcV6dg2U6VSRgM5m+MQ0N00pe
 /vPua7HB3k753yw7M5TEcFpskMUZ77qTdpv6spKbzx740yBM2zrkA/b+XckCI15RoGT5
 oeM8g2dz0BU+CS7AU49f/RIhZwZl9SQcjBbnXl16y/NnXXdrCRbfrS5Sffk9IZrrUniZ
 KWxA==
X-Gm-Message-State: AFqh2kqxwIe+YVYddE85uraufdSU9+3nJQjIcfZxXTWAvDX2tNIUDZtv
 LG36pyuxnXiXScvco3Ehw3CF+g==
X-Google-Smtp-Source: AMrXdXvmu4H2D/okEr4fBGESa3wja37aq6dQQ/DRvEdR9w9OojzN05TqJovYtHPPNMf9ZBSgX0ma0g==
X-Received: by 2002:a05:6512:3ba8:b0:4d5:8bf9:92ef with SMTP id
 g40-20020a0565123ba800b004d58bf992efmr7694954lfv.60.1674461299296; 
 Mon, 23 Jan 2023 00:08:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w42-20020a0565120b2a00b004cc858a2d47sm5154265lfu.41.2023.01.23.00.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 00:08:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: fix sm8450 CTL configuration
Date: Mon, 23 Jan 2023 10:08:18 +0200
Message-Id: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Correct the CTL size on sm8450 platform. This fixes the incorrect merge
of sm8350 support, which unfortunately also touched the SM8450 setup.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 63a0fa3b0a17..9060dce51e2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1017,31 +1017,31 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x1e8,
+	.base = 0x16000, .len = 0x204,
 	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x1e8,
+	.base = 0x17000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x1e8,
+	.base = 0x18000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x1e8,
+	.base = 0x19000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x1e8,
+	.base = 0x1a000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
-- 
2.39.0

