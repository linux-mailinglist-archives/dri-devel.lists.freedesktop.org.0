Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8C4B6E9B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1D10E57D;
	Tue, 15 Feb 2022 14:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D55710E579
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g39so13923466lfv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSfsRzJkEgK/Vmp9eGzQeRkfQQALkinNmbtc1FEuOMY=;
 b=m4CaCdv+n7670jVhY+lvnPejzKPDMxc3DkfOmhG8MrdwGRZZSMsj8xzqC4VZgoXEEa
 g3woR+hHqj3q1mnwZ3uASTBu+ms+weVqOXRoyjq/KXDlWrUzYxJIz++OHKI5Q1d4IvEd
 fRVkAz5jq0lRn/aRj044UjUiIZ5Z7JtUn4zi+ZKNEHKkdR2cIchO+n+YA9qkWUBVkd3d
 G0eep/nHlXcvOtDlXRj9wTPwaoblMk59vwfHbOFLib4SeSw71sdm4/2r9c8tzlIdl+wH
 14pzCi0VzWvidwPOFIztOnF9d7dubWVmRIBhGRGcp1gCxKNM4lirRr9ty7cjldvW12D8
 dYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSfsRzJkEgK/Vmp9eGzQeRkfQQALkinNmbtc1FEuOMY=;
 b=5hER9D0LF0CTsvkhvdTNncTpv7y6RYZMziuoHgs+qoxdXy36a/N6g0hnGBlln5a9PX
 M/kb3kw1S++kAM0P8SE6D5KFV3MWLD2OkTnMipEnUgaU1RfwsVt7UhIfVXLIZ91foMuV
 GzFY35f7Y+j7RIR4P3pqA1kppPlICo6DBUSYA6qABaPCN1bf8wwDR3/JrPCWL03MI7wz
 E1foloqiEYIorZ6lPQmK+8/pqwrv83nocWtVhQKZKrGX3lvrEbfjy1nXdefKtlqJrHl0
 YOYqepBi9k/YTEH70t1o0IL1QxlrWVjCO/ymzb+4uZ4eA4g6Lp3x/EBfLfv2lgrUopss
 GqPg==
X-Gm-Message-State: AOAM532Nkfc1JavEifv2Ft0RoLUcRVHDDC7XPvzcy5XhXXomG2OcBz/k
 OSROiwX1H9qA9M7OXdJO7P5J7g==
X-Google-Smtp-Source: ABdhPJyinQ0AoywLq7LdUetGXGJVk/PRud76P5Q/F1zIkR64pHnyfTnSNAgdY1XV5r7NmkDdQhymBA==
X-Received: by 2002:a05:6512:104c:: with SMTP id
 c12mr3217127lfb.418.1644934605400; 
 Tue, 15 Feb 2022 06:16:45 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/8] drm/msm/dpu: fix dp audio condition
Date: Tue, 15 Feb 2022 17:16:36 +0300
Message-Id: <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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

DP audio enablement code which is comparing intf_type,
DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 132844801e92..c59976deb1cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
-- 
2.34.1

