Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28C4B9752
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981E010E79A;
	Thu, 17 Feb 2022 03:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8E310E75F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:54:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e5so7538468lfr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RR1N4aPEBsDSrMkYWyN5C+eYSYGI+wdfjT+eCdTVa9U=;
 b=YCnwYlAvZ7/nS7LPvTABXHKm53V4PGUIaIBxHLF2KydqNgd1nAQ5/A/0ok7TobG8G7
 vycvAQ2fh6huKnrHhICiT1Tr+0jbqcR3OAY136hQ6ZN7CxDJM0j00WsU92y9gutn8GIA
 8ssmV6+Z0V3E0oYO+RpOiP0rIHJ4PzEFmNd6r/4UjKqqjQuSNVaB1QqdT33fzYE/qChu
 SA4smIhHj5xlikPyBa88uVO7J+7Kkp13NlHB/WMO/p9jI1P2FcrDJ3TlMYLwqTvtRCjX
 r1PTXx+QfICidSWTpCskAyDeMc6KOzYa0S6xfc2KG/oVhXojtHmewRZIEM/IQLtEZ+GH
 ON3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RR1N4aPEBsDSrMkYWyN5C+eYSYGI+wdfjT+eCdTVa9U=;
 b=s+bNzh6qi1SdWQexgd34L9svKggex1iRgGxgMvGgn/LUj0LS6cqNw6RWSXgtKOBRlY
 xmMt/xSFioqI1nfZ+DOKXc2QAFFE4iXsC39txiW0hUG47OL6XVCCF8yvO0acS49g7RGQ
 hYwiOSI4DbJm/fqTJGBYWPrGMV1NkundN/sUY3Je2uVVVH8X+aevJKaI/U1lwapbz4OQ
 QXlTtg5FJYBUKDwdS846SFNne8q1qHDyI1rs8oXrMIIlEEfh5RpEc4X3pFMRSxshGHu1
 dc/+i1iyLYTsP40tBScxdlx4iTeacX+739da+7otUdWuARx33+3qA98fg+bg+Vi5y5TS
 FZJg==
X-Gm-Message-State: AOAM530kM1qmmJaFipkVa92DAJvDFPbm432n3xwJKkLOWKDG/O4ZyuDq
 pZkfqnYq6Qc/IkpuRGBMx6c1/g==
X-Google-Smtp-Source: ABdhPJwvDOrFkan8mJU6iOjEP4Ula3Yq8VzKbdfOkj1/0kZ4ERxGTv8HZPueJb+vInWTQNDwkvEhkw==
X-Received: by 2002:a05:6512:3157:b0:443:6407:ea58 with SMTP id
 s23-20020a056512315700b004436407ea58mr768650lfi.81.1645070043080; 
 Wed, 16 Feb 2022 19:54:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:54:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 3/7] drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
Date: Thu, 17 Feb 2022 06:53:54 +0300
Message-Id: <20220217035358.465904-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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

Stop caching msm_dp instance in dpu_encoder_virt since it's not used
now.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 02d0fae1c6dc..16ae0cccbbb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,7 +168,6 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
- * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -207,8 +206,6 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
-
-	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -2128,8 +2125,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
-		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.34.1

