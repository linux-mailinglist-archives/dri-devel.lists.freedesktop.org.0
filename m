Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FABD8771F6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 16:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6CA10E992;
	Sat,  9 Mar 2024 15:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D63VmGc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94310E681
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 15:33:49 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d41f33eb05so19173291fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 07:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709998427; x=1710603227; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CTlALryim3QK0d1L28afhZUYtA/fjW4K8fRVAF6+04g=;
 b=D63VmGc+U4Ls5/WmFS6Db8NsP8eqtWljasHd5FVGj4MdLjhZI7H+tVeXJy6p3slhok
 rLbEYtRxJEuuq9nZagBqVDVdU0L3fIMcFKsHaTPe7I4iTh0dVjdn+d1chVve/DEtRSj/
 C3OWowMfUkijp2/OZFtf0EKEPHNG/3vcFRieHe2IJRDSU3JAgy3hNsv+rW0ioON0f/gj
 5whAgi9msLjeLFqc0yQAx5RCF2HfrD0M0xZ3QoA/Pei+W/1xIIDHzrB6wAyjfqDlguQd
 AOigoB/A6X/+uk1/T01jkQZpm1Sk3bUYH30cuB8uV41gUCLtn4A02+jptgcl2AoTOLpo
 HooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709998427; x=1710603227;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CTlALryim3QK0d1L28afhZUYtA/fjW4K8fRVAF6+04g=;
 b=ZSFlR85S65VtOaEhAFj44/e1XQXivzwK0w59XW27yU9QJAIklJQ+Nefebg2FNmiqEL
 1SI6utC6pbfIQmHR40awyBsvA8/tJVHSLrdPMGtD4ooF4w2qbo9eyqZ+jrzSqPHkDJQi
 40IPvPnb6nFXKmRrEw1hDxVzHiSh5//TeZ526G8gPDa9BpeA3IM/1GEilr/iv2pQ3A4/
 RHvxPAS0pjwbNnlhRNETUOE2zKrwPXsZ3MqaXCE7kEEYcwXunJIxqyuoU/b6NJqMBgTE
 n+pAoqNBAzEnkE1nxXwvcfLyxTq2OfYkervXkJmE4L/mZllzwQGShegkjlW2Y20RRY3d
 8GjA==
X-Gm-Message-State: AOJu0YxeCXIcoCmBcDeWOA07F3pvoF9YeKY+Ukb1S9R/di4u83l8YNE4
 wcdVZgvZnAZ9zZnS5kVml78qsyNZCL+OV5MlzF6GWtRTG6rw0E7xgMFKM/VrVpk=
X-Google-Smtp-Source: AGHT+IHkBXCqsyP9FqRGgLCdLZCTy32OZ64wFp0Xc/J96iuSJwesc831sZl45Etsgnv4sgp7iW4lLA==
X-Received: by 2002:a19:641e:0:b0:513:82e2:4193 with SMTP id
 y30-20020a19641e000000b0051382e24193mr1306982lfb.10.1709998426910; 
 Sat, 09 Mar 2024 07:33:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 h4-20020a056512350400b005133bd3a682sm344871lfs.288.2024.03.09.07.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 07:33:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:33:45 +0200
Subject: [PATCH] drm/bridge: adv7511: make it honour next bridge in DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFiB7GUC/x2MywqAIBAAfyX23MJqRo9fiQ6ZW+3FQkOC8N+Tj
 gMz80LkIBxhrF4InCTK6QuouoL1WPzOKK4waNKGGhpwcalrlULPz402iCuKItdby9Qaw1DKK/A
 mz3+d5pw/K0NEQmUAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4mGzFypORTGynrg8wYpr5ut5p6/LXbQy8IXBkSAmpaA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7IFZqvt2knHzTaApZ2lBIEOS+Xf4v59+ooHbL
 d4V/ITgOI2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeyBWQAKCRCLPIo+Aiko
 1Vr9CACzfoftJlzIOuVypRe3B4/T8YkiqcZFN0zqGmzIbXgQcZxcSXNm6ypEjOUFMCJIBIlNYwW
 NsLeduq7NUCcZcc4xuoFJ6cD2Y+RiHiBgX9s3ih1OxQ4i96WQ/JH1iSMWyLE4wDDpz5ePn+GqEc
 VZrhMaYfSA9hj4Yzjev0bVfpkqMYRfwYjUUPXDLhKwZY66SajaMPQhgaJXCV2chdT+dSnbWWVeN
 etlNyCAkYbYhOxV7lDBtoH/vdjlGq4gEVfeOxiQKV/C69+clvUwfKSCFUblzKd0X55SXBc+Y9Gy
 nZPP9FRMZ5axInSSx3ctzz4EJ7zAQ8VKG3SVTHykof6RZ4yW
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

DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
present at the port@1. This allows board DT to add e.g. HDMI connector
nodes or any other next chained bridge. Make adv7511 driver discover
that bridge and attach it to the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 39c9ece373b0..ea271f62b214 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -356,6 +356,7 @@ struct adv7511 {
 	enum drm_connector_status status;
 	bool powered;
 
+	struct drm_bridge *next_bridge;
 	struct drm_display_mode curr_mode;
 
 	unsigned int f_tmds;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b5518ff97165..4eea9e8fb603 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -946,6 +947,10 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret = 0;
 
+	ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
+	if (ret)
+		return ret;
+
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		ret = adv7511_connector_init(adv);
 		if (ret < 0)
@@ -1216,6 +1221,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
+					  &adv7511->next_bridge);
+	if (ret)
+		return ret;
+
 	if (adv7511->info->link_config)
 		ret = adv7511_parse_dt(dev->of_node, &link_config);
 	else

---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240309-adv7511-next-bridge-10d8bbe0544e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

