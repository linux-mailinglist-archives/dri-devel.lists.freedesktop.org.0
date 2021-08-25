Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD33F7F19
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 01:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99C36E446;
	Wed, 25 Aug 2021 23:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA41F893EF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 23:41:23 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v2so1799770oie.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SUT6/CPQy4VuzfV2PpQSsF1DEYegx2l+83mHNGP6WQ=;
 b=aBNo6IWtJzImXbC1euEfhI81ak1ju0dMOsBX7Z7MsXlS1oGV7yhvpcNp/7KrArcVkI
 FjClKe19BQvluGfgAg+7Jt0gX2jzTDxOuwAIhSNkPP6cpxmv33Z9t0H9XnCTAkjWoZAz
 OeYtUxQ/WWxXaHt7OF8RkHWv6vAsYToBWjn+wXgLglFm5apCOE0nLoROvK26p2gcHj5l
 jZDMH107p5YMVNFyHTVdr76B5/QbIpq/PhVCcBQMgzLVOFN311NDYDvR9Es1i96HZjM5
 NkyRS2N1tSego9wrDW7VFt4gx6N38aoSSMV8AethWs2UdKENGqCR2hCyxQ8JvGLASJJ1
 qPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/SUT6/CPQy4VuzfV2PpQSsF1DEYegx2l+83mHNGP6WQ=;
 b=JUesORstZeAwM14F9YAxptNiL9sswfC7ISPk5gnwu8ezod+yZn6aLXHxv21bq9xvkK
 sOXZBC/PyLyEWDymxvT3oLa+0qla8IhXMIAIVl/F0bsTDzIkqlurAMP73mJOAHTu86Gn
 xAYgTfh0gT9GQFyO7yH0KbLZaaPygZY056wLCIs18qrCgf3SzhfGuABZJ030dVKSjhrk
 LF9d3K035Vm3yiRwfUOvrFR6xQOJlWBggXVrEo08eIpRRQb8ZbN8ArL8no1oJEnUAag4
 Or2nQ6zEmE9dd4S9/vVqUW9JjR4DqSD12kWuT9P6XRpEcq1CWO6V+xgYm3b/ODHM4g02
 wi+w==
X-Gm-Message-State: AOAM530kBV6Vcr3ooG7DM3fo7MVtripWBDJngKTUpWNiKld5I5hWPPyK
 jCWhewgC0gHKvyDHng30LHkF7w==
X-Google-Smtp-Source: ABdhPJxuWQFyb6UT+FVyWMeOzcLlDP4PR0EUUdkF/NKn1so+znRpBM2G8wtS4zT/7KNWyYZDDwDWpQ==
X-Received: by 2002:a05:6808:1d3:: with SMTP id
 x19mr365072oic.137.1629934882911; 
 Wed, 25 Aug 2021 16:41:22 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:41:22 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] drm/msm/dp: Modify prototype of encoder based API
Date: Wed, 25 Aug 2021 16:42:30 -0700
Message-Id: <20210825234233.1721068-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Functions in the DisplayPort code that relates to individual instances
(encoders) are passed both the struct msm_dp and the struct drm_encoder. But
in a situation where multiple DP instances would exist this means that
the caller need to resolve which struct msm_dp relates to the struct
drm_encoder at hand.

Store a reference to the struct msm_dp associated with each
dpu_encoder_virt to allow the particular instance to be associate with
the encoder in the following patch.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Store msm_dp reference in dpu_encoder_virt instead of carrying a list of them
  and searching repeatedly

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..b7f33da2799c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,6 +168,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -206,6 +207,8 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+
+	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -1000,8 +1003,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
-		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
+		msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
 
 	list_for_each_entry(conn_iter, connector_list, head)
 		if (conn_iter->encoder == drm_enc)
@@ -1182,9 +1185,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_virt_enable_helper(drm_enc);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		ret = msm_dp_display_enable(priv->dp,
-						drm_enc);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
 				ret);
@@ -1224,8 +1226,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	/* wait for idle */
 	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_pre_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
 	}
 
@@ -1253,8 +1255,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
 	}
 
@@ -2170,7 +2172,8 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-
+	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+		dpu_enc->dp = priv->dp;
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.29.2

