Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2CB76830D
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBB310E247;
	Sun, 30 Jul 2023 01:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3041B10E127
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9cdbf682eso29975331fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678865; x=1691283665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xF2cKFE9m7FsBb3Uecjxgnlyz82/CdN+JnUhT4R1oVE=;
 b=Q9Pl0+9k2xa9ybLP2N69yNEDdIEplHRFobPbzhejgjlailsWjlkTLxAWBu5UnGaW1B
 v39PfrhE91z2dFw93/xUS9x77Ud9kdQHO+sKt5U8SKTrkBZB8eL6SvchIHwO5qHzJi1F
 kWSedz6K/wSeuxNmyMG43pOUHIDKoDhjFsmvGxJr01QHbe9rlF8obdQERfaOIPhakHTy
 gPd6MgL2GlBY2rsyjGutKc0702+Qua81KDOlSwp7m4zIxI3Vz3YnMwZS16AzAX85gJpq
 15f7FOnRff9Z0XEoodkklnRm+XLiXLVBK4EG/Tc09yq1GVifZ+oAEYNSZIbyurTrRd8M
 Id/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678865; x=1691283665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xF2cKFE9m7FsBb3Uecjxgnlyz82/CdN+JnUhT4R1oVE=;
 b=hgkkDI+VlGu214F/idx4y39XZJVFYwpDhvxgiKC6X7vv4Wwr75ZWA/JQS7sFL1oWX/
 g3G2ylH/QsUNkdhsogSmB/f6lSR0rZWHj/1JTrxMc78TbOukMD3taQzPn73WNj1hQwD6
 zWk5dZHVVJH6JltgYPhnErlDMMH+r7u4nYJ3NIRJqhRpn5HjvM/R21UqA5v5AnayeUIn
 SnHYesCcsGefbCmcJe63IhQlPAU+NGoIjB+Vjwv8HAIBX6awVhax01FQ6bdNWITGUPuO
 I++QQtOjDwqXNzhbWPp4JZWWUX+mLtXIC3Vvyues95zVpbtLasi2EBFQfhR5v+ZwJSva
 q/RA==
X-Gm-Message-State: ABy/qLZGN3bV2l49Gj0kEXuZHWREygmN7TyDRrd5y+7HQLfdvxfJh6e0
 r0wwTHfI2qSm55A3Ery+iNxODw==
X-Google-Smtp-Source: APBJJlFu3afc1uxVCOiDZxyihR1by+qsfw0zL9K8CT5CvGuExBJO/4FsVxSV4gWwkM06sCan/2RW3A==
X-Received: by 2002:a2e:8083:0:b0:2b6:e105:6174 with SMTP id
 i3-20020a2e8083000000b002b6e1056174mr4016947ljg.47.1690678865487; 
 Sat, 29 Jul 2023 18:01:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 02/10] drm/msm/dpu: bail from
 _dpu_core_perf_crtc_update_bus if there are no ICC paths
Date: Sun, 30 Jul 2023 04:00:54 +0300
Message-Id: <20230730010102.350713-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..3dbd73035a11 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -217,6 +217,9 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
+	if (!kms->num_paths)
+		return 0;
+
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
 			curr_client_type ==
@@ -234,9 +237,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 		}
 	}
 
-	if (!kms->num_paths)
-		return 0;
-
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

