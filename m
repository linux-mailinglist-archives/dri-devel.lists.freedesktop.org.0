Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC09B87A4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 01:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1F910E438;
	Fri,  1 Nov 2024 00:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LNJ2H3ed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87CB10E438
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 00:25:20 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f72c913aso2407687e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730420719; x=1731025519; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fn3LhrswAJ6uldcqCvizMSK2GK9rmkw5c0L7tOFDyzA=;
 b=LNJ2H3ed6lxb0wwmC1aJ/nUflHNhlxhdAQ2+z8By+Wf/du7GJ4nxTwUT7dIabPXEoa
 Teb61iQVdyGTwpWvNjSXp+Q6ioxtzaE0tTylMV4e0f67gXy3tMlNJhDnAWcnUGT+Fsus
 zCEHZY+4Rsq6NslT2t3zQw4KUTfbKg2TRLZoRDxX9SaHhFrQ/7+NbZT7Klco5f9kSDgK
 3jV4UWUSYTWNDKDAv7UybrUWJH5RWXhuvNFyihKLU1R2r67DO6ewr/e8nGBPM7nFPK0k
 cdHxr+Cz91zCM7t7ck27Mc1EDuAv0DXATcPuzoP6URVm8wO5wE6MXG3d3fkljByAY8BL
 fTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730420719; x=1731025519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fn3LhrswAJ6uldcqCvizMSK2GK9rmkw5c0L7tOFDyzA=;
 b=Ej0HppgqEn2QJf3F5YTndRK0GfcheGlAOHac/Ti/UgViosct9CTjC9FmGxFRRBo1DQ
 jzDK7qFy1vOF4lT41QRau5MQPz4hrX4ZUfEuKhcUbEz/T0pGG9qWzs4N1VinU3hJG541
 9yk/+UtM79xRh4rpRa5wtzRahYzRCENylpETF9OnPrTwc6a8qz/Cah9loo3qqHwu7hWS
 IQ7wOhzdtbxurf2C8pddwpLYz/8zEVr2y/W8jDqiOoZ58Pn4289riJhnmIrWXJTc0c01
 /Fjq5eRpqhaNuHk9iiDTyjlrlBaBJyaoRuJX6TUlIMURsY3SxkkyhChCF3JUdPCjSMnL
 u74g==
X-Gm-Message-State: AOJu0YzQ7MV/Baa8LMqiPt1oMKoiPAnk4HYS1sPNK3eKAMM1gG9XQ/as
 WNg+URONNXdJIaY14T8HlhQ4l4YI6m6KjextotFM58noFuDE5AFeMLNQ9pGfv5c=
X-Google-Smtp-Source: AGHT+IFLGk370oJX7M/fOs9yssB9UroX/yB5UrOBpoOmI1k9rBV3Tjw44Gv6j6p0t2YpMLg9rxw7rw==
X-Received: by 2002:a05:6512:33d1:b0:539:e873:6e6 with SMTP id
 2adb3069b0e04-53b34a1953amr11874626e87.43.1730420718759; 
 Thu, 31 Oct 2024 17:25:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 17:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:07 +0200
Subject: [PATCH v2 4/6] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-4-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q9ji/NbRYwF1TNZj9n1TpgdHLjl20UItRRGWWpdDvcQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hTl+xfDm56PcvCfyLR4ruPHvUICtQpdeUo
 JnDXQfGiVGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1UGsB/0ZWiyvOHwonVjOKqiPjNjrJWmuBjMDfQVw3/uHD8NPKzxvZ9Hr3iL0YRRXMuK3C+IGqcZ
 1xDNk2AzPqJOGZgbbGmpLSH/Vfq6va9o3zKRASXyCKqCYVPLYrHwhfxwJJ+TqXvMYWQrGm35SKi
 jUViyUXSxon0WYJwpk/vcmqyB+DineqeodUGO0o6BRHs0eKeAqqkT/GiDQapFvbC7uizl6AHCjB
 i6jc11/scL3bkp27MSP3HSuKmIMjtfX9dg/uyl7UEyOEM5tMkpbonBX96LPrwSzUbsRnAefU8O2
 LLRA4GeogLOARJb31LmT0HUrWNwo2OHAqrb3GA19J0T6xiHS
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

Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
bridge in the bridge chain. This removes the need to perform TMDS char
rate check manually in the bridge driver.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..512ced87ea18c74e182a558a686ddd83de891814 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -299,9 +300,22 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+drm_bridge_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_hdmi_connector_mode_valid(connector, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
-	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };

-- 
2.39.5

