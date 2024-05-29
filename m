Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB58D41D6
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6B810E6F2;
	Wed, 29 May 2024 23:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D28eMthD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A80811A96C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:12:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52b7b4812f3so238487e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717024349; x=1717629149; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xsWyvZJ7smsYEwcJt3QXuB4RboSifhUzN4Y/+3fVgYs=;
 b=D28eMthDUqtOutyVOAduA1anWxk3ttk2v+E0qeHa55xEgDGxq37jC2VIZQfqwO8ZFD
 8M6htWMCin1TBQV68+IKc6hrWDavXfR1pBeDz0K5o1W2jWgHX9KQz/VXnOBAgGal8McZ
 jC2pJ8s3R9thK049+YhavXmdW5WoPyhOOYsLvXLCFKmQ3JWyns94W+zyehClcW/yHOVb
 09ShPHNbFYP+zV6GFerqFjT8o0j8k7cBFi7g1Awn/RkNtw+Lgu+B0B0fumJDX9Z8W1fj
 6MSRA5kSPWQQ4QJZWZ1vb8nWd1G/8xrS5I4H1Fz6TwJi3QpgfHdsviU96AdHxjJniqfc
 ATaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717024349; x=1717629149;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsWyvZJ7smsYEwcJt3QXuB4RboSifhUzN4Y/+3fVgYs=;
 b=BZOxMdxGnoeHGb/CAhfy2O6sZpARykuoeoTaLu84lxNnu1QxwqvjMLtVotvVldg/By
 F/6739DBw7lfbGIIRjfm7IhmlsXiWliU9zP7YHqvCIU+sEK4mJf6D1CbJHW04jtCH6iJ
 AOHhPmtlJuEGJfbKjE7dkr51AHtG9xOsvAyH02kIbfcSiH/3BP8wGmY+VyQ1Bt3we7x5
 sCS4OulGZdjpt5CDgVMCqwnnflXwLO7LGx1NqCHcophIk+7rrgy47USfPIy1kj2tPfYo
 BI8LxTVyUfxmQeAdHuHX9HM3hozpz/BywwokbE4uxDBmooVE+JJr4pIpqF/DjTmuiIaN
 anhQ==
X-Gm-Message-State: AOJu0Yx5dUUYu4m2tD6wsYYm72eGiyIFH2NOpyLM4RqpH7u3uphrWINs
 bs6EiEtI/3n3tPiyxV4BZV6rpGbZsyt3b+HW6VDcsXY+VUsdhkz72iApJdJpNBY=
X-Google-Smtp-Source: AGHT+IGR2g9tEjUHRz3sWSg0237KZd0prRiZw5CS2OF0JFp0DTVGONPL8fJFqcllAiRPCR5tE1g7iQ==
X-Received: by 2002:ac2:41cb:0:b0:51e:e5cf:9940 with SMTP id
 2adb3069b0e04-52b7e0ee8b0mr63089e87.4.1717024348995; 
 Wed, 29 May 2024 16:12:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529acea1ea8sm1015998e87.276.2024.05.29.16.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 16:12:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:12:24 +0300
Subject: [PATCH v3 1/7] drm/connector: hdmi: accept NULL for Audio
 Infoframe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
In-Reply-To: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AXQkgT8bLCi+J4VLmDhYURPEkLAsLkNbwsYyTx65pa0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV7ZadQQ/u477cay7r64S0rsMMdpYg2c8F9bsk
 HP74y9RpWGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZle2WgAKCRCLPIo+Aiko
 1Xz/CACBG8J88iFv44gK5ywM44/nLwAiT0D+h+PopLWugWuGXC0yuvOQ7sSZ/TiE8fpiOzXNghn
 LqQShLj2piBG17rpD08ku2ULumRjKSuGcbAMUkWy7Vr2hEKxIrHv48HEWd4jkWGWw2JtHE1QZR0
 q9ai2atyG3KlWWGVlIEgBSayjXD83ULC38kztI/L6E3YaG7aIITrdW9NfyoSKb0mRuJzLOIwdcj
 K2Q5n8BtQ0jKRJYqInW7Kx4EXVbYwOy160ewSLGEwZBTd0ka7ZcG4UBpIKZt51O2Aq6cpxhN4R7
 U8bkuwdlyNpvpdu4AunLtBCfChGuVdAAJb0UFFgN6lErZjPS
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

Allow passing NULL as audio infoframe as a way to disable Audio
Infoframe generation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ce96837eea65..5356723d21f5 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -681,7 +681,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
 /**
  * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
  * @connector: A pointer to the HDMI connector
- * @frame: A pointer to the audio infoframe to write
+ * @frame: A pointer to the audio infoframe to write or NULL to disable sending the frame
  *
  * This function is meant for HDMI connector drivers to update their
  * audio infoframe. It will typically be used in one of the ALSA hooks
@@ -704,10 +704,16 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
-	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
-	infoframe->set = true;
+	if (frame) {
+		memcpy(&infoframe->data, frame, sizeof(infoframe->data));
+		infoframe->set = true;
+
+		ret = write_infoframe(connector, infoframe);
+	} else {
+		infoframe->set = false;
 
-	ret = write_infoframe(connector, infoframe);
+		ret = clear_infoframe(connector, infoframe);
+	}
 
 	mutex_unlock(&connector->hdmi.infoframes.lock);
 

-- 
2.39.2

