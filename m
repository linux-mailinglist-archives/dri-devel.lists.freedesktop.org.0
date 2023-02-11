Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C86934B5
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300A310E3BE;
	Sat, 11 Feb 2023 23:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC7310E3BE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:08 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ml19so24111813ejb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAtJf3WKxuylZMOKBWrbgGq6Mwl28bpihXOOTuwZmbY=;
 b=xWNBs3mb2YOaeSMletTGpKrI2aMWigVbRVIM6w4HrvDBsgLUPGL3FPqMK4PIxf4IQU
 rtXxKFCXtOWM340ruA7/NcGb/wHtT6WO/gKqkHQjXxETYukeIZBAISg61culU6y0qt74
 hJJFJmjUv+xtZVSzev5MYb07VvDO19IyqWor01NHxzmFsMVXER2jepAjcvLxAxBfdeI0
 coqfmqEd/7nmPZkUfmRt7c/mQ30+DfMp6uJntG+U56JqvcOmi3RTT6yZlFLPqojwR3is
 jGOUkUJdJL17Oi4uJKnz9oG+FjwuT2ZJ1pVt+YXIGYdewG4Mi9XNkvwlnODGdlCfmaHk
 u9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAtJf3WKxuylZMOKBWrbgGq6Mwl28bpihXOOTuwZmbY=;
 b=ianHiJs1mPGFVqUnU6EDdBKJ5GHSEZtGWb3ANHuKFFIRjs7ZeVlR+QciuuQXcR43Ni
 /cdXA6gjSTkCnGG8S5DNJKuAEPWpUPbUUbH8cUz+JQ2TddHkIiSKR9AmjtYFm9qO29qQ
 9YWmvSMssKT9c5lvUAPXyhpYXwUWmZaS8gPa8rnBSyvgnsIdREt+C76iCbNEraz26hS9
 TKeSTN9WssOEL69GNhmvyEqPyhojnPxRAA/mA8+z2S4U+DGcDp5wE+nau3nf+EVQhgLY
 /LXzVn1pT/Z9a2baWNdI3POSo+40ioKI40S3TIMcJO+TyNxycmSMgMx4RwAoBSAiV1hG
 eNoQ==
X-Gm-Message-State: AO0yUKWpj5KOeTbFaUHCjbWMxBgMgveujdAR5yieSVWCxktfxNf+8b19
 HOzQF7UsWirgQL61Kf6Tg7fhKQ==
X-Google-Smtp-Source: AK7set/cgoYEyc5BrSOPddB0812Yg8tscUoHlSfJ763Ffw/s1DWWMgoFPXdTBJHzihTdjp0oTffvYg==
X-Received: by 2002:a17:907:a095:b0:8af:43a2:cb8f with SMTP id
 hu21-20020a170907a09500b008af43a2cb8fmr7954729ejc.32.1676157186821; 
 Sat, 11 Feb 2023 15:13:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 04/50] drm/msm/dpu: fix len of sc7180 ctl blocks
Date: Sun, 12 Feb 2023 01:12:13 +0200
Message-Id: <20230211231259.1308718-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Change sc7180's ctl block len to 0x1dc.

Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e8b12788dc94..47de609e2279 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -831,19 +831,19 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0xE4,
+	.base = 0x1000, .len = 0x1dc,
 	.features = BIT(DPU_CTL_ACTIVE_CFG),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0xE4,
+	.base = 0x1200, .len = 0x1dc,
 	.features = BIT(DPU_CTL_ACTIVE_CFG),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0xE4,
+	.base = 0x1400, .len = 0x1dc,
 	.features = BIT(DPU_CTL_ACTIVE_CFG),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
-- 
2.39.1

