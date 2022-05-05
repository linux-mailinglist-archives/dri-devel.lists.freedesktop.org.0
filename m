Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB451B53E
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 03:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F24810EFE0;
	Thu,  5 May 2022 01:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AB310EFE0;
 Thu,  5 May 2022 01:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651714051; x=1683250051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D2dgoyq4FWRZvrMGZm7T1JXcISRJleFT+FccBaZr8Dc=;
 b=ceVqaMRD76pXUZgy38iXiTk39FGeVl+c2DRRBt44qaX0u8tdf+Tvs6m3
 1cniET/9O24V7ynwh42f6Gj7j7d8vWxOUaYUakYy9FQzFBOPWAaiVixz+
 Ef+kpzZNCNAQc1TxkvOollShsfnoUUdDpy2U/bgdOXT7v6O1KSQdqYHUD M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 18:27:30 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 18:27:30 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 18:27:29 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/mdp5: Return error code in mdp5_pipe_release when
 deadlock is detected
Date: Wed, 4 May 2022 18:27:06 -0700
Message-ID: <20220505012706.135-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mdp5_get_global_state runs the risk of hitting an EDEADLK when aqcuiring
the modeset lock, but currently mdp5_pipe_release doesn't check for if
an error is returned. Because of this, there is a possibility of
mdp5_pipe_release hitting a NULL dereference error.

To avoid this, let's have mdp5_pipe_release check if
mdp5_get_global_state returns an error and propogate that error.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 14 ++++++++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
index ba6695963aa6..1309ab89fcda 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
@@ -119,18 +119,22 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 	return 0;
 }
 
-void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
+int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 {
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct mdp5_global_state *state = mdp5_get_global_state(s);
-	struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
 
 	if (!hwpipe)
-		return;
+		return -EINVAL;
+
+	if (IS_ERR(state))
+		return PTR_ERR(state);
+
+	struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
 
 	if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
-		return;
+		return -EINVAL;
 
 	DBG("%s: release from plane %s", hwpipe->name,
 		new_state->hwpipe_to_plane[hwpipe->idx]->name);
@@ -141,6 +145,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 	}
 
 	new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
+
+	return 0;
 }
 
 void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
index 9b26d0761bd4..cca67938cab2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
@@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		     uint32_t caps, uint32_t blkcfg,
 		     struct mdp5_hw_pipe **hwpipe,
 		     struct mdp5_hw_pipe **r_hwpipe);
-void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
+int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
 
 struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
 		uint32_t reg_offset, uint32_t caps);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 228b22830970..979458482841 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 				mdp5_state->r_hwpipe = NULL;
 
 
-			mdp5_pipe_release(state->state, old_hwpipe);
-			mdp5_pipe_release(state->state, old_right_hwpipe);
+			ret = mdp5_pipe_release(state->state, old_hwpipe);
+			if (ret)
+				return ret;
+
+			ret = mdp5_pipe_release(state->state, old_right_hwpipe);
+			if (ret)
+				return ret;
+
 		}
 	} else {
-		mdp5_pipe_release(state->state, mdp5_state->hwpipe);
-		mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
+		ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
+		if (ret)
+			return ret;
+
+		ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
+		if (ret)
+			return ret;
+
 		mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
 	}
 
-- 
2.35.1

