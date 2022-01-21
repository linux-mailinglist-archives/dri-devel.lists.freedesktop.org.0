Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60E496713
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1510E6F1;
	Fri, 21 Jan 2022 21:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C43A10E6A4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:06:26 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p27so36424872lfa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HACSLRAJTlm7BMAPuR4eurye88UGsf0f2NbWhCbmGEA=;
 b=MIus+nplDxpSNK/ib6qq1BFF0mBzL5WUhur4Trk6OuhGZTDRlU6NV3fX761lL6KOdW
 OHbDuih1CR/M0b6tgdDv8Ki1Ds4MxSD8dmKvekgtTeJCbooIiCa1EKdempyucvxAZDPx
 TJaQ7soqXcLN2otM0RsTmWOxFWyBSUWGELo3rYQkcNeOjpAT1sq6BSRq70E8FCyIVlS6
 gWQAhHw9q068i5H0suJ5IBWBKj2a8gGLawBMXOZb6Gtf70ChGDPAudI0GTxg11kL42k4
 X5zbe+4JKgSIKlowx7R3aB1k0fE4yDhRk/B5EHtRwBN/hu2Jp26Rbu/GhNpPAZp81uJv
 KLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HACSLRAJTlm7BMAPuR4eurye88UGsf0f2NbWhCbmGEA=;
 b=3TD9YiewAR0Li11htAV6/7WBAYH7jGnnZa43kZK28mXtGWOv+Tn/miqxuWYQLCXJ1V
 f8rKTNcqhhW5p0yT7jqCbyluQ0P2OdCQ9JFTwb77CR2dn48bQmaMV59k+HlbdtEVJf6T
 WAAfage2lqRC+Mo6tHipMJRdIgcGQ54W/rMn4hq/A08jjklcjUcoO9Mg1GRS51k87V/x
 vM8jhvCQA+WIYlAGz4r5rXCbNr1PZjuqeZu09JF4vs/FzUNX9mtNMdERZu5kPNcHBmQg
 vxaNv8la3KhYYSmExIXNDU1NmuxxyBUtf5c77hbldimQABnKI2pGAwEDQD0ABBmbWJDd
 aa4w==
X-Gm-Message-State: AOAM531pzoc0vZawqMlrS50HFm9avO5g4fxLi18QEbwK56qSqG4gcCwJ
 w7lGU1+XVS6HeWlV8JRbv+WQKQ==
X-Google-Smtp-Source: ABdhPJxg1niv4tD6fSTzrRnGAjE2soBYkgvk6apaxB6/S8kfoBwjYBpdeDLXWHZ4yyxduLuNX2frag==
X-Received: by 2002:a05:6512:3443:: with SMTP id
 j3mr3354095lfr.120.1642799184804; 
 Fri, 21 Jan 2022 13:06:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:06:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 5/6] drm/msm/dpu: fix error handling in dpu_rm_init
Date: Sat, 22 Jan 2022 00:06:17 +0300
Message-Id: <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover none of dpu_hw_*_init() functions can return NULL.
So, replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 96554e962e38..7497538adae1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -109,7 +109,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_lm_init(lm->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);
 			goto fail;
@@ -126,7 +126,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed merge_3d object creation: err %d\n",
 				rc);
@@ -144,7 +144,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
 				rc);
@@ -168,7 +168,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_intf_init(intf->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
 			goto fail;
@@ -185,7 +185,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);
 			goto fail;
@@ -202,7 +202,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dspp object creation: err %d\n", rc);
 			goto fail;
-- 
2.34.1

