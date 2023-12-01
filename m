Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A68015DF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 23:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A9510E37D;
	Fri,  1 Dec 2023 22:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CAC10E6C3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 22:08:46 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bce40bc4aso3212621e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 14:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701468525; x=1702073325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NuP6QXU38xtT8HMlDWPSd16zhS+9uv4oxYxLpwR5gVc=;
 b=uUP0BceVBy1UdS4eyrZI6R5okR2LkawgA3I8doda9B/9ulrZGLit5He4zwROPApv0w
 d4N5vaExRS0eoHi9Xm4A2A86XEVdRJ2KofOO8hBflCMqdV4/F28bYNnl4MhIb+ckMc6G
 OrXR8qe4mJwHWlKdDsWNq/iPMNsJKtvu+/HzxWGSCLn+Tpqw6HFxzpHwFhKtNGne7Gjk
 4aMj9VSEvjOFrc4JSdIaEpi+/eC80P3gTKICCxCrJEKGTFOCw375C7WzJ63R/cAMCHMQ
 PZW6VlEjxVcHXVfTt65domeKpQTztxjE2tTW4Jb+fmM5SZkyn1S5xlCMfiixGxLNBgf7
 /ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701468525; x=1702073325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NuP6QXU38xtT8HMlDWPSd16zhS+9uv4oxYxLpwR5gVc=;
 b=uqS4FFs18lfih+q5jGz55VzrFKbatqBuinq9bRnYFPXwZK2LnJr/kri2Rua1lYER3u
 wUMzwiCqOuGEu/wVNTVvaEvZo8605omFVM5y5CQpcrMnjDuunDPuCMaOGMRJAawWxaru
 N1nAAS9uTZ8w9r3iTYI4oRTB1RHV5uFhQBSTqoD1eBTiTc8GPM9YcRWGmvZzWJATAifL
 y6MZTjv583xw9f/Tbt7V0CR5X7BDMt0seHuZT4XHmcdc6V9/65IKRBlvKGDhv7f7jAV0
 ZUbW1MZyEWHPpAV6sVua6pKtd01eTFzNbQqP7fxfrRSPRevJuTYi2UkxxxRlc6h7pZUs
 /6NA==
X-Gm-Message-State: AOJu0YyX94LIgO9K1CjdedMYcuAnzmJiWbnJnJkW9FXvvi95aqheNwUB
 VD15wBGwOm9n4vpkoB2Jf9sADg==
X-Google-Smtp-Source: AGHT+IGxCvzOQkhfqNA+HGNqiqjD387u9GwATSSQVcVVMjTa/c7i/g5mW51GGkR0DGOlwkKJeH0EQA==
X-Received: by 2002:a2e:8547:0:b0:2c9:d872:abc8 with SMTP id
 u7-20020a2e8547000000b002c9d872abc8mr1280015ljj.70.1701468525118; 
 Fri, 01 Dec 2023 14:08:45 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 s3-20020a05651c048300b002c9b861cb1fsm513724ljc.91.2023.12.01.14.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 14:08:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Sat,  2 Dec 2023 00:07:49 +0200
Message-ID: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_helper_check_wb_encoder_state() function doesn't use
encoder for anything other than getting the drm_device instance. The
function's description talks about checking the writeback connector
state, not the encoder state. Moreover, there is no such thing as an
encoder state, encoders generally do not have a state on their own.

Drop the first argument and rename the function to
drm_atomic_helper_check_wb_connector_state().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Resending, no reaction for two months

---
 drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
 include/drm/drm_atomic_helper.h       |  3 +--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 2444fc33dd7c..d69591381f00 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
- * @encoder: encoder state to check
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
  * @conn_state: connector state to check
  *
  * Checks if the writeback connector state is valid, and returns an error if it
@@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
  * Zero for success or -errno
  */
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state)
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state)
 {
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
@@ -827,11 +825,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(conn_state->connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
 
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..56edec6f1634 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -48,7 +48,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	ret = drm_atomic_helper_check_wb_connector_state(conn_state);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..742ccbcd7809 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -50,8 +50,7 @@ struct drm_private_state;
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *conn_state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.42.0

