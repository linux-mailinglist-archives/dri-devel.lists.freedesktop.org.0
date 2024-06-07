Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF54900490
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 15:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D3410EC33;
	Fri,  7 Jun 2024 13:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P7wD747x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE0810EC29
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:07 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52b950aa47bso3226006e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766585; x=1718371385; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NGmpKRkgIHjKMtoAdUdGd2aPwvq/Jsn37fNkdYwGNhI=;
 b=P7wD747xsOC9znthgDZnCRECaiGs1tXAMGGMmR7V0FX2szaDsNLIlteFlpeoa29uqs
 YK2zzi94KL6V+F94flABNT4yaWQcDYlkHdj0KozXo/nvNxQFMmBuSkZdchuiWnetvrhY
 GXA2TLfsoP45fJWoGrbXmp1i1ExIkrQQ4zqalw4/UzFTNSs6woIIz+Qp+B2NOYsmyrL/
 6gIGWyl04qMKC7sotGscE/uCpnAh489KN2o3FZxkltVivypv5hKxD9gqXlgSUfDaVZhJ
 TatLGB3imoLcEDHSAqzjv8zpocLeYFWT1UwMP5ugPdMxWltkomXMlpwAntxLQjwFfy3C
 6Scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766585; x=1718371385;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGmpKRkgIHjKMtoAdUdGd2aPwvq/Jsn37fNkdYwGNhI=;
 b=UzLZw3MTKLEaaKcrtUNeCS7oNWFr5l9aQQfdeX4a4YN/O6gM2fupIj179hsgZWHaJz
 6ZcgN0DTfZI1w0TzzTuH6o0wVxByUuw/RJeDMKLNRiwGh6M4sBgkLoN53mMpdNusXxx7
 9Ye1t4rtsaDpI4SYPpo7olxz9DA7f/wk3oiPUBxSicjRP+GCaO0grIqs1lNm5/C82PNK
 +bxWR9Yx4hX0bGseDpdeIeGUmI1t5Me3haBYF2tEmFm1cmCm7rsYwHfppRJs286UcypW
 g0PPPEOUD8YZ9srbE/2ou3XXbQHtitnmRQRfnAa2sJ7CxZxbT7Z/2iYbmjuE1zb9vuoM
 SSqg==
X-Gm-Message-State: AOJu0YzgJU0xnX/Ywb/Ws0bY+55L5NMJ5/dfNvPV58vPVlrVxnBCzhSZ
 95sLbeIqlCFI7YYjHoNIujY5q/3cILwDc5V053fQPIoWHGb7JLKFeFZqQwSslbw=
X-Google-Smtp-Source: AGHT+IGkFA9sCK5b9UnRQRQ7bRK91vz2yp59ks7G/LIcbZgp/giIrE4JTn7qvXmfHw4wED6xGKgR/g==
X-Received: by 2002:ac2:5dee:0:b0:51a:cafd:3872 with SMTP id
 2adb3069b0e04-52bb9f5d36emr1401032e87.3.1717766585105; 
 Fri, 07 Jun 2024 06:23:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:23:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:22:58 +0300
Subject: [PATCH v5 1/9] drm/connector: hdmi: allow disabling Audio
 Infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-1-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZpBWCc8zTiSyZgAlt8eDA4MQfiQXS330IXqEN1kPi0M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm1CHGwjYZAJiNnZZJ8HIs/c/AaFq8Y/mIyf
 HH+Gf0hfTGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtQAKCRCLPIo+Aiko
 1WsXB/9H/P6S1HmWYKfRrVugdTWONtzVxDuCGBYt45omPJNztrXP8WTw6A3d+v9gLRv6UFgPy4g
 OpFHr1h2R6AoPyq7nOeZEW0vJgUmK7xwkehgJAkt/mG3ts4D6tXYBI7Ywov72UgVutx6HJd4CXi
 D3jgL0CDFfLxDoW0CWtiLNZCCJMYOMaLadsD/p25MumWEfohFIyoyYzLxn3W5AhNX8Xzt6DX1ZU
 o1Grx3hkc12HEXSMqI5v8Sw5aOTNcBkIw11JFfrz9ab2i95LMWARG2mnLxOLwIUg2VH/qhu7Fva
 BAynQcu68XHcFKp23k1Wx2A/JAVb4XlttCGdgAPX3gMG7/4A
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Add drm_atomic_helper_connector_hdmi_disable_audio_infoframe(), an API
to allow the driver disable sending the Audio Infoframe. This is to be
used by the drivers if setup of the infoframes is not tightly coupled
with the audio functionality and just disabling the audio playback
doesn't stop the HDMI hardware from sending the Infoframe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 36 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ce96837eea65..731873b3bdf2 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -714,3 +714,39 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_disable_audio_infoframe - Stop sending the Audio Infoframe
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function is meant for HDMI connector drivers to stop sending their
+ * audio infoframe. It will typically be used in one of the ALSA hooks
+ * (most likely shutdown).
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_disable_audio_infoframe(struct drm_connector *connector)
+{
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&connector->hdmi.infoframes.audio;
+	struct drm_display_info *info = &connector->display_info;
+	int ret;
+
+	if (!info->is_hdmi)
+		return 0;
+
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	infoframe->set = false;
+
+	ret = clear_infoframe(connector, infoframe);
+
+	memset(&infoframe->data, 0, sizeof(infoframe->data));
+
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_disable_audio_infoframe);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index fbf86ff9cdfb..c3d23725f0b8 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -16,6 +16,7 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 
 int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
 							    struct hdmi_audio_infoframe *frame);
+int drm_atomic_helper_connector_hdmi_disable_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 

-- 
2.39.2

