Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30824B6E93
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 15:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E246910E56D;
	Tue, 15 Feb 2022 14:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8F610E5F7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:52 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bu29so31923185lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sP5TaMCcyJcd5zxUV6bIRYDzEaL3RGEZ1yr0y21buG4=;
 b=yOZCX02Hl4o9MArW/UwfxuLgByfWvWqghgfUBbiTbAiYf4VyEQg15JsuvJ0UYGfg5D
 3Y3nWBpC1KNSHC3Q/1qgIKHgZt5GIsQUrTElbseeb5/xA5mpPdQqSQ46TkUIfuWNyEEK
 w3eDaeyu78DsiUWsZqF1Xste5YMWhxd3WRbjG0QkmD8aLYfOhDh3bEjosIZ4rU3x2/CT
 54g/xB8Er9rBN4sbsrmPQRgr2kYyTbtA/7hu55i6sJVJ82X7vlIRIr6unwqSRw2njnJ8
 vPk5ERZU2xtwXNkeqG6TCzno8WdH+PDw2F2buLm9SaOYnXwI5mLhXz16f50+LRJTPd/i
 y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sP5TaMCcyJcd5zxUV6bIRYDzEaL3RGEZ1yr0y21buG4=;
 b=XtfBeedUqRy3tEdOHk7VcjExRgE/bWzHIxgU2bWbKtj6FqG2smzAD2PO8FmRoq/ahX
 JuHfyW+6c9zu++Xk8RM+yMr04jVq7A8JFEuYxSRJzlrL9naNTz1Ciudj1eYl9WzmY5jK
 h0MwmbpGbYhLzaVZPvhhuGT032t4nvvyy8vKCApwK4WwD54yZRF+P7kqbWdasj56ki1l
 oqNzj0ENo6O3vrWggeIKUXo+m5S9Pdyi4oJlIYwG4dkj+0SY6NQ0R8B34SUZDPVo+NDH
 rj+JN0eYV9Lr8g0tPw/qMdGeUhvT7bFIECqoLhsuBZAXnvu/u3cH74Jdi8ZGPXCpMdHa
 ep7w==
X-Gm-Message-State: AOAM5314Eq7b5QU2r5WulqjvTPEjntIvPaTcql9I428neVimWgV7Ydj2
 9genzfoPZju+o3iY6MwSVUTtnH0Np2DiKA==
X-Google-Smtp-Source: ABdhPJz50VALNB9dNf0vEDJ4oATBsp0ltmZT7U4a9VebsdNI+hP4vlMJqHK9zl3hmHqIcEZoXiS9mg==
X-Received: by 2002:a05:6512:3b9e:: with SMTP id
 g30mr2729917lfv.306.1644934610647; 
 Tue, 15 Feb 2022 06:16:50 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 7/8] drm/msm/dpu: pull connector from dpu_encoder_phys to
 dpu_encoder_virt
Date: Tue, 15 Feb 2022 17:16:42 +0300
Message-Id: <20220215141643.3444941-8-dmitry.baryshkov@linaro.org>
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

All physical encoders used by virtual encoder share the same connector,
so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
structure.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 11 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 --
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ae60d415c66d..fa1dc088a672 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -143,6 +143,7 @@ enum dpu_enc_rc_states {
  *			link between encoder/crtc. However in this case we need
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
+ * @connector:		If a mode is set, cached pointer to the active connector
  * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
  *				all CTL paths
  * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
@@ -183,6 +184,7 @@ struct dpu_encoder_virt {
 	bool intfs_swapped;
 
 	struct drm_crtc *crtc;
+	struct drm_connector *connector;
 
 	struct dentry *debugfs_root;
 	struct mutex enc_lock;
@@ -1010,6 +1012,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	cstate->num_mixers = num_lm;
 
+	dpu_enc->connector = conn_state->connector;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		int num_blk;
 		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
@@ -1047,7 +1051,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->connector = conn_state->connector;
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
@@ -1081,7 +1084,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
-		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
+		unsigned bpc = dpu_enc->connector->display_info.bpc;
 		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
 			if (!dpu_enc->hw_pp[i])
 				continue;
@@ -1180,9 +1183,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_STOP);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		dpu_enc->phys_encs[i]->connector = NULL;
-	}
+	dpu_enc->connector = NULL;
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6309c5e30d20..43ce56109c41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -178,7 +178,6 @@ struct dpu_encoder_irq {
  *	tied to a specific panel / sub-panel. Abstract type, sub-classed by
  *	phys_vid or phys_cmd for video mode or command mode encs respectively.
  * @parent:		Pointer to the containing virtual encoder
- * @connector:		If a mode is set, cached pointer to the active connector
  * @ops:		Operations exposed to the virtual encoder
  * @parent_ops:		Callbacks exposed by the parent to the phys_enc
  * @hw_mdptop:		Hardware interface to the top registers
@@ -207,7 +206,6 @@ struct dpu_encoder_irq {
  */
 struct dpu_encoder_phys {
 	struct drm_encoder *parent;
-	struct drm_connector *connector;
 	struct dpu_encoder_phys_ops ops;
 	const struct dpu_encoder_virt_ops *parent_ops;
 	struct dpu_hw_mdp *hw_mdptop;
-- 
2.34.1

