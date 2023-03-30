Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B446D1169
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D005D10F051;
	Thu, 30 Mar 2023 21:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F0110F053
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:15 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h25so26382769lfv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmC08N5yvRdOHzS3L+tUwwrY0awuChJl1CeUcO1/M4k=;
 b=KcfA++lxeKMXh2ebZhicutvre/IKWzJnH9f/zJ8sUwvTJYOaX81MjAZd/l2+XG7RYk
 09y8rdWJ7JpZGKhJWi+IpAxHWiswEz3rGfDntZVmvTb8X/P+wTn5vZKWTuJQj1O3Ej/e
 r5Ro5n4Ys8wneRWuR1u3krWM1hBvAORTocpNl8T4Ekb2nWeNiTZNe7DajRTkDtLMHx2d
 jLoLBS3EkP8qH6EzHq7lDbSj6ugbmywZ/PIIq++ow7S1QIX0EQLbYRLH2tMPVbJ62X4k
 G8oz4UOqCtH74a910SdlwtM/skKyYSmsEfi6d0LMUv8f33HpCrw3JhEFuB6Zgp7nSjf7
 IjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmC08N5yvRdOHzS3L+tUwwrY0awuChJl1CeUcO1/M4k=;
 b=scMjc4XT5Vo+Qy+pC0ymE68FIDQEtU6/ADSHsg8s6yU3pkh+1utXQOj3frFWmr1tdF
 DnUbLO0v0amig52R4XZ3hi+cllY4qABLiE5yVdn8sFecMe0nz5GA5wlzg38dSEX54HMB
 XZRcMr4UMawsYE2aT4dfuezev5UUBdpzwz6NXN+wP9p9VWsoC6esaN6eVPSLKisNrB+w
 kD8mbcb28B7vUyyrkWW4mXMSIMpKgFTHc0gbzwmVFGGHUAaeY870ehSoLYZ1HjAdewM8
 MvwQNXGDl8iIAf5TUA7jnS96fo5xfRw56bxy2kGzBXvtj4fUbDd6GXI/STr86nnkeVJ4
 jt3w==
X-Gm-Message-State: AAQBX9cAZylvcWF4EWLuv7Sh7KafRhbduhcHDxHu0zh8KyxtV77vpNK+
 x6EB5cyj9rRa+gcQZhjpC4Ri3Q==
X-Google-Smtp-Source: AKy350bbWr8I4PMVi6+51rPrt+8Egg3vX9hEEIrw1Gb1nQXzegDzVgNt8ktSj1n2r06l1SdR/SBYDg==
X-Received: by 2002:a05:6512:249:b0:4db:38aa:a2f4 with SMTP id
 b9-20020a056512024900b004db38aaa2f4mr7260944lfo.14.1680213254092; 
 Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 25/38] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for
 sc8280xp
Date: Fri, 31 Mar 2023 00:53:11 +0300
Message-Id: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
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

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 01ef4115ee4d..33f2d53df13b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.2

