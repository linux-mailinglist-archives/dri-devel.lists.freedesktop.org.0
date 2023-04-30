Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2AD6F2AB1
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF94610E0A6;
	Sun, 30 Apr 2023 20:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0309D10E083
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:36:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4edb26f762dso2294497e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682886959; x=1685478959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHx+FQUbQw63eL4XXyWHX139/FutFZv8MJNz7Im6ZFU=;
 b=zb5a1gPzBj4i7Iq7BSjZSH2Vgagqp8OIesB143RJvz5QhN5eRk6AwezJ1D/pwz8bTj
 7s2MYjbfAHQzdqZeDS7zKgyMI0YZYVaItaOapfbDxuEPPFV1RWpiFOJ8Pc9NlZQ3Ut8+
 kfH2WT3LSsXBn9AXTCLi20Yk4fdXFTeu+s68wZP0iUoVig0fDhSyKD/Vf91ix1B23yMI
 tt0/Dmc4sdhq3KeFf4RNmK0avPvz8kRhZrUXyZKSllSk3c6nszx11CsKkbKCYGvdfvuW
 z1hYxzdUt7/Ou7779IBWblhzD0+3kA4nIuHDy6PgrN7M9mxvXhkYJ+5Iwo86OYEROcsH
 eQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682886959; x=1685478959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHx+FQUbQw63eL4XXyWHX139/FutFZv8MJNz7Im6ZFU=;
 b=h2IrFfjE+HiL5EyCdUZixWOjHSVCOcHyt7ZcC405BgTIX3dexaLlHHBa6H3leXdEYD
 1eEHW+JoxkHSwX3W7VLM2xnj1AtQtOYZRkULMFQFxNIed70NJJgLz5HMC7lHzLn8O5Nv
 tP0XxMcPoJFEJYLdY6psrZWvksf67lyc4lFBQ9RLJhiX7jx8MJerhUKeXTcRbb4TroZv
 naTP4XiyrM4J09NbYZ7EWR/85SmK/oc9GAcm4eollC0L+x+xyC/3ihSfRBYfZMuRnCMn
 z8EGh32DAx6JR5tKWJgwhgNvFZD11fWNnvxnxMVLltb+3vDgpdiB2EwfygCXg1tT7uzs
 GkiA==
X-Gm-Message-State: AC+VfDxtpGR0Q1sokl55HoTatflP8r021ZgRMkiBSmRJQBV5LlIYb4zL
 Mdrk1py9l7482QsmchU7N4cv1w==
X-Google-Smtp-Source: ACHHUZ7rf85dypKGZgKj2L/G9uk1VPLUqTFodUanDhXNgOqobkulBVhyS7PRD+PuTNClDBk7qXYA9w==
X-Received: by 2002:ac2:57cf:0:b0:4ed:c8ba:dfb2 with SMTP id
 k15-20020ac257cf000000b004edc8badfb2mr3412886lfo.65.1682886959578; 
 Sun, 30 Apr 2023 13:35:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:35:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/4] drm/msm/dpu: remove futile checks from dpu_rm_init()
Date: Sun, 30 Apr 2023 23:35:54 +0300
Message-Id: <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
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

dpu_rm_init() contains checks for block->id values. These were logical
in the vendor driver, when one can not be sure which values were passed
from DT. In the upstream driver this is not necessary: the catalog is a
part of the driver, we control specified IDs.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 34 --------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index dffd3dd0a877..d5a06628885e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -122,10 +122,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 
-		if (lm->id < LM_0 || lm->id >= LM_MAX) {
-			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
-			continue;
-		}
 		hw = dpu_hw_lm_init(lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -139,10 +135,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_merge_3d *hw;
 		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
 
-		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
-			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
-			continue;
-		}
 		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -157,10 +149,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
 
-		if (pp->id < PINGPONG_0 || pp->id >= PINGPONG_MAX) {
-			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
-			continue;
-		}
 		hw = dpu_hw_pingpong_init(pp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -177,10 +165,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
 
-		if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
-			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
-			continue;
-		}
 		hw = dpu_hw_intf_init(intf, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -194,11 +178,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_wb *hw;
 		const struct dpu_wb_cfg *wb = &cat->wb[i];
 
-		if (wb->id < WB_0 || wb->id >= WB_MAX) {
-			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
-			continue;
-		}
-
 		hw = dpu_hw_wb_init(wb, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -212,10 +191,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		if (ctl->id < CTL_0 || ctl->id >= CTL_MAX) {
-			DPU_ERROR("skip ctl %d with invalid id\n", ctl->id);
-			continue;
-		}
 		hw = dpu_hw_ctl_init(ctl, mmio, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -229,10 +204,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dspp *hw;
 		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
 
-		if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
-			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
-			continue;
-		}
 		hw = dpu_hw_dspp_init(dspp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
@@ -259,11 +230,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_sspp *hw;
 		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
 
-		if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
-			DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
-			continue;
-		}
-
 		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
-- 
2.39.2

