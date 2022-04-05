Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719424F4820
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 01:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A52E10EA23;
	Tue,  5 Apr 2022 23:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A45C10E428
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 23:51:05 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id e16so1137754lfc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 16:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nupzTGEBU6qZB3QvYeGIWfzRAuDNUHc7ze0LvzWnebs=;
 b=OxZ0blf6MH5ytIdeKK8SrW/3MJcmu7DJ+xAwYvBLcf6RDejBLcHfHCgQdyzjB7atyZ
 nT2yzJYcYmM7hfl9dHzAih0g6Qa91Ias8r/UTB7b8ew9bAA839MyDbDtU45RXUe5AASz
 txDkk5y9CVkm9Ig0o4ZKZdFKzUJK059I79tl4A0JB7EL/wnSSLMJ6J8xKRzRqvOeKcxt
 9WR5rWUppPLlpAepj8Z4TQS7xUq1/S7H3WOe7yW24M/D/c66ntykk1QDMEw9wdABHzKk
 zavkz7LTrEIAvX/YLbxCjxY50COncGWLZ/y+RD3eNgTRgesIhYAllMGcwNoWtJQ7a6qg
 PXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nupzTGEBU6qZB3QvYeGIWfzRAuDNUHc7ze0LvzWnebs=;
 b=uggYPXz1STBY19B9YT0TH6e8Joftc1UC2xObxoOyUphRpRgSYm/hnAlB45XaTUyf1z
 +QIjvZnBSCD5LEx2CQdgCeMOCwiWgjOSeSW2WvGhmyx6jEeNtW9BqLlt4ux/xiP4d6rH
 JVCpaYbl0O5ypnsMjsC+bxA5P8aNFihvjF54qDXJjy72o7P7ESuOH8HrKpKwguNdiZtN
 Y9u48CPvyckDxsfNRWSx0K/o+RSQaH9nCK3iL+g0mTCYGw8QRYFrnIM6nVS7rjYlK59I
 bXTwZxnJW1GPzE4FtsWTte9CIDV4++QgSOpDb51Ves0lT8wyuxPOg2fmpZrqZpdhC6ZV
 uMNQ==
X-Gm-Message-State: AOAM530+eWzyHJDT2QGluj0Xw7DhoBFG/ALaQhgmuvAUjy/vNX2eJ7/2
 3qcCQj8RhQ5JxBSldGXnq1qTtg==
X-Google-Smtp-Source: ABdhPJw/4qjYA0tk/15l2INLdAOVQq3xOnS7ZVDOJkLoL/pXMk2PHzmAY9QIvpP9oUiDy2hxAAL8pg==
X-Received: by 2002:a05:6512:158e:b0:44a:12b5:7fea with SMTP id
 bp14-20020a056512158e00b0044a12b57feamr3951998lfb.411.1649202663583; 
 Tue, 05 Apr 2022 16:51:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f26-20020a19381a000000b0044ad7a29b4csm1645280lfa.37.2022.04.05.16.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:51:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/3] drm/msm: don't store created planes,
 connectors and encoders
Date: Wed,  6 Apr 2022 02:50:59 +0300
Message-Id: <20220405235059.359738-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
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

There is no point now in storing arrays of creates planes, connectors
and encoders. Remove them from struct msm_drm_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 12 ++++++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  7 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 ++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c      |  2 --
 drivers/gpu/drm/msm/dsi/dsi.c            |  1 -
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.h            |  9 ---------
 7 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0bc33243dae8..903be362cbce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -565,8 +565,6 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-
 		memset(&info, 0, sizeof(info));
 		info.intf_type = encoder->encoder_type;
 
@@ -629,8 +627,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			return rc;
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-
 		info.num_of_h_tiles = 1;
 		info.h_tile_instance[0] = i;
 		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
@@ -682,6 +678,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
+	unsigned int num_encoders;
 
 	struct msm_drm_private *priv;
 	struct dpu_mdss_cfg *catalog;
@@ -700,7 +697,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	if (ret)
 		return ret;
 
-	max_crtc_count = min(catalog->mixer_count, priv->num_encoders);
+	num_encoders = 0;
+	drm_for_each_encoder(encoder, dev)
+		num_encoders++;
+
+	max_crtc_count = min(catalog->mixer_count, num_encoders);
 
 	/* Create the planes, keeping track of one primary/cursor per crtc */
 	for (i = 0; i < catalog->sspp_count; i++) {
@@ -725,7 +726,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(plane);
 			return ret;
 		}
-		priv->planes[priv->num_planes++] = plane;
 
 		if (type == DRM_PLANE_TYPE_CURSOR)
 			cursor_planes[cursor_planes_idx++] = plane;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 3cf476c55158..1862eba51bbb 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -229,9 +229,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 			return PTR_ERR(connector);
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-		priv->connectors[priv->num_connectors++] = connector;
-
 		break;
 	case DRM_MODE_ENCODER_TMDS:
 		encoder = mdp4_dtv_encoder_init(dev);
@@ -252,8 +249,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 			}
 		}
 
-		priv->encoders[priv->num_encoders++] = encoder;
-
 		break;
 	case DRM_MODE_ENCODER_DSI:
 		/* only DSI1 supported for now */
@@ -272,7 +267,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 
 		/* TODO: Add DMA_S later? */
 		encoder->possible_crtcs = 1 << DMA_P;
-		priv->encoders[priv->num_encoders++] = encoder;
 
 		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
 		if (ret) {
@@ -324,7 +318,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(plane);
 			goto fail;
 		}
-		priv->planes[priv->num_planes++] = plane;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(mdp4_crtcs); i++) {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 2ba06f979f72..dbfe54de975c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -319,7 +319,6 @@ static struct drm_encoder *construct_encoder(struct mdp5_kms *mdp5_kms,
 					     struct mdp5_ctl *ctl)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_encoder *encoder;
 
 	encoder = mdp5_encoder_init(dev, intf, ctl);
@@ -328,8 +327,6 @@ static struct drm_encoder *construct_encoder(struct mdp5_kms *mdp5_kms,
 		return encoder;
 	}
 
-	priv->encoders[priv->num_encoders++] = encoder;
-
 	return encoder;
 }
 
@@ -435,6 +432,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	struct drm_plane *primary[MAX_BASES] = { NULL };
 	struct drm_plane *cursor[MAX_BASES] = { NULL };
 	struct drm_encoder *encoder;
+	unsigned int num_encoders;
 
 	/*
 	 * Construct encoders and modeset initialize connector devices
@@ -446,12 +444,16 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			goto fail;
 	}
 
+	num_encoders = 0;
+	drm_for_each_encoder(encoder, dev)
+		num_encoders++;
+
 	/*
 	 * We should ideally have less number of encoders (set up by parsing
 	 * the MDP5 interfaces) than the number of layer mixers present in HW,
 	 * but let's be safe here anyway
 	 */
-	num_crtcs = min(priv->num_encoders, mdp5_kms->num_hwmixers);
+	num_crtcs = min(num_encoders, mdp5_kms->num_hwmixers);
 
 	/*
 	 * Construct planes equaling the number of hw pipes, and CRTCs for the
@@ -476,7 +478,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct plane %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->planes[priv->num_planes++] = plane;
 
 		if (type == DRM_PLANE_TYPE_PRIMARY)
 			primary[pi++] = plane;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774a5fbd..ad7a18a0dece 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,8 +1541,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv->panel->connector = dp_display->connector;
 
-	priv->connectors[priv->num_connectors++] = dp_display->connector;
-
 	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
 	if (IS_ERR(dp_display->bridge)) {
 		ret = PTR_ERR(dp_display->bridge);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index c12e66aa42a3..1fe020ee1018 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -273,7 +273,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	}
 
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
-	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
 	return 0;
 fail:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ec324352e862..baa6f1aaadf6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -322,7 +322,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	}
 
 	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
-	priv->connectors[priv->num_connectors++] = hdmi->connector;
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d661debb50f1..ee3093890d97 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -184,23 +184,14 @@ struct msm_drm_private {
 
 	struct workqueue_struct *wq;
 
-	unsigned int num_planes;
-	struct drm_plane *planes[MAX_PLANES];
-
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[MAX_CRTCS];
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	unsigned int num_encoders;
-	struct drm_encoder *encoders[MAX_ENCODERS];
-
 	unsigned int num_bridges;
 	struct drm_bridge *bridges[MAX_BRIDGES];
 
-	unsigned int num_connectors;
-	struct drm_connector *connectors[MAX_CONNECTORS];
-
 	/* Properties */
 	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
 
-- 
2.35.1

