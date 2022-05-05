Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C275D51CB82
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EE610FA78;
	Thu,  5 May 2022 21:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6FB10FAA9;
 Thu,  5 May 2022 21:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651786865; x=1683322865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UqZi48KwBNy4644Kyncmf9QTA2gl1Tw5WUxX1yOFFR8=;
 b=H2w3RwI2/JThjUFVx5c08wOncbdiUgxQsXOMHmmm4a+gfYem9mcNjMy/
 784EzTT5cXQ6C+R7L4bJ7c+3yoS8obqvAj3OgyhGgabHQtH2K03CY2hMg
 0Y+B5R8vFH6SXaJ3r5eixJB2C/XlHU8zVoDU7QWLoR5dXyW/awHYF6Z4P 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 05 May 2022 14:41:05 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:41:04 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 14:41:04 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/msm/mdp5: Return error code in mdp5_mixer_release
 when deadlock is detected
Date: Thu, 5 May 2022 14:40:51 -0700
Message-ID: <20220505214051.155-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505214051.155-1-quic_jesszhan@quicinc.com>
References: <20220505214051.155-1-quic_jesszhan@quicinc.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a possibility for mdp5_get_global_state to return
-EDEADLK when acquiring the modeset lock, but currently global_state in
mdp5_mixer_release doesn't check for if an error is returned.

To avoid a NULL dereference error, let's have mdp5_mixer_release
check if an error is returned and propagate that error.

Reported-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  | 10 ++++++++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c | 15 +++++++++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h |  4 ++--
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index b966cd69f99d..fe2922c8d21b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -612,9 +612,15 @@ static int mdp5_crtc_setup_pipeline(struct drm_crtc *crtc,
 		if (ret)
 			return ret;
 
-		mdp5_mixer_release(new_crtc_state->state, old_mixer);
+		ret = mdp5_mixer_release(new_crtc_state->state, old_mixer);
+		if (ret)
+			return ret;
+
 		if (old_r_mixer) {
-			mdp5_mixer_release(new_crtc_state->state, old_r_mixer);
+			ret = mdp5_mixer_release(new_crtc_state->state, old_r_mixer);
+			if (ret)
+				return ret;
+
 			if (!need_right_mixer)
 				pipeline->r_mixer = NULL;
 		}
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
index 954db683ae44..2536def2a000 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c
@@ -116,21 +116,28 @@ int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
 	return 0;
 }
 
-void mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
+int mdp5_mixer_release(struct drm_atomic_state *s, struct mdp5_hw_mixer *mixer)
 {
 	struct mdp5_global_state *global_state = mdp5_get_global_state(s);
-	struct mdp5_hw_mixer_state *new_state = &global_state->hwmixer;
+	struct mdp5_hw_mixer_state *new_state;
 
 	if (!mixer)
-		return;
+		return 0;
+
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	new_state = &global_state->hwmixer;
 
 	if (WARN_ON(!new_state->hwmixer_to_crtc[mixer->idx]))
-		return;
+		return -EINVAL;
 
 	DBG("%s: release from crtc %s", mixer->name,
 	    new_state->hwmixer_to_crtc[mixer->idx]->name);
 
 	new_state->hwmixer_to_crtc[mixer->idx] = NULL;
+
+	return 0;
 }
 
 void mdp5_mixer_destroy(struct mdp5_hw_mixer *mixer)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
index 43c9ba43ce18..545ee223b9d7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h
@@ -30,7 +30,7 @@ void mdp5_mixer_destroy(struct mdp5_hw_mixer *lm);
 int mdp5_mixer_assign(struct drm_atomic_state *s, struct drm_crtc *crtc,
 		      uint32_t caps, struct mdp5_hw_mixer **mixer,
 		      struct mdp5_hw_mixer **r_mixer);
-void mdp5_mixer_release(struct drm_atomic_state *s,
-			struct mdp5_hw_mixer *mixer);
+int mdp5_mixer_release(struct drm_atomic_state *s,
+		       struct mdp5_hw_mixer *mixer);
 
 #endif /* __MDP5_LM_H__ */
-- 
2.35.1

