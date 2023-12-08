Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBDC809856
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3715310E9C1;
	Fri,  8 Dec 2023 01:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF79D10E9BC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:03:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50c222a022dso1072538e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701997398; x=1702602198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w9DXgbpkmRJ+2VgjJ4hvWLaw9hvTcbtDFAwpGMKl3Go=;
 b=gd0Oo8sOVPcIGYB9sk3UacxfS4qBITMyl4bjvKNC4OKEYV5AMs5Rqb5jRFtOE8tIAE
 z6ifgYJiPPcjfSBDxC0J4YM+rcMku4VIYodwyq31DRpxSZNEi88gce9FkdlEy6YoV7YV
 oFrmyevAcvwIxSKteR6GuyiDfbC8AcI2GW3KVTOhharCbdVOFKkjwFWaSqFJTDvygsoT
 KfSb3uDvGlnXgI1Jax3hVz+nSOVFGQDFP7PXelDYSVpgQxLHaTx6ra1bIO3WXSX9d9In
 csL8tDXoKMt9rwM801ipep5cyyQWueYMkQ1jX1vZCa9M6of3JH2EEfJpQ4XphbpLYlHK
 fF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701997398; x=1702602198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w9DXgbpkmRJ+2VgjJ4hvWLaw9hvTcbtDFAwpGMKl3Go=;
 b=bXpZkZ5l8Zpa1b0wBHIKKk8qPEqw//OLQXyfwFXJ+6RlUFP61az3yP3JqFFoVPQjlx
 rnHXFkVqvllpPgp67Rzfr1J+9nywMsHxgy7lo2kdo1qXbghfCqHTrLoptJ/IgOwx5I0h
 +KJasZlbRgu3XXS/2vFILM5lD1Q6nLnjBqO8U95LIRcKPRsfPWVRNCof5XUPHHf9ELkr
 8nZ/F89rExPNVxLYNHD9s6XhEImJ6jtKA5MkfSgkEs6Nky43MkrClmeuIA9dH4xzF3S+
 rqAqssjP73+/e0Q6PTtznc3aM7ne184hbfqobbp/aXERbi/hFOZZLa94Ztvbpsim/Vf+
 urmg==
X-Gm-Message-State: AOJu0YzZaMac4kEvAjza/FWg3p7P60IXkmxGWCyvW7U6lYmpEZmEICRc
 HCgEKx/y7hsK0ZCCXF3SUT41rg==
X-Google-Smtp-Source: AGHT+IEwoa8rObk3RPkl1IdUqSsrBBlu3C8pprIzht4HYrPaxeR7uHrTOtRd3Y56wGFYmTYW5YAiiQ==
X-Received: by 2002:ac2:4c4a:0:b0:50b:d2b9:180c with SMTP id
 o10-20020ac24c4a000000b0050bd2b9180cmr2313372lfk.58.1701997397973; 
 Thu, 07 Dec 2023 17:03:17 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t28-20020ac2549c000000b0050bcb5b443dsm68415lfk.171.2023.12.07.17.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 17:03:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v4 1/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Fri,  8 Dec 2023 04:03:13 +0300
Message-Id: <20231208010314.3395904-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
References: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
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

Rename the function to drm_atomic_helper_check_wb_connector_state()
and change arguments to drm_writeback_connector and drm_atomic_state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c |  3 ++-
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index a920fbae714c..39ef0a6addeb 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -795,9 +795,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
- * @encoder: encoder state to check
- * @conn_state: connector state to check
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
+ * @connector: corresponding connector
+ * @state: the driver state object
  *
  * Checks if the writeback connector state is valid, and returns an error if it
  * isn't.
@@ -806,9 +806,11 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
  * Zero for success or -errno
  */
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state)
+drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
+					   struct drm_atomic_state *state)
 {
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
 	struct drm_framebuffer *fb;
@@ -827,11 +829,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
 
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..fef7f3daf2c9 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -34,6 +34,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	struct drm_connector *connector = conn_state->connector;
 	struct drm_framebuffer *fb;
 	const struct drm_display_mode *mode = &crtc_state->mode;
 	int ret;
@@ -48,7 +49,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	ret = drm_atomic_helper_check_wb_connector_state(connector, conn_state->state);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 006b5c977ad7..9aa0a05aa072 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -49,9 +49,8 @@ struct drm_private_state;
 
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
-int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+int drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
+					       struct drm_atomic_state *state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.39.2

