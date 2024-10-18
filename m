Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B99A481E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666910E98A;
	Fri, 18 Oct 2024 20:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HgZXR+nR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A37910E980
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:34:41 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso3095633e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729283679; x=1729888479; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Fjo3xom5hyHJVXQDe/CPNDPIWLjDZtVAaVw4HhlPIfs=;
 b=HgZXR+nRH2Y61fJbge9sX8q5Ivu8C+BV4cTI/gnaof3rIoNpEKqt/Ak+L64nmtbMnW
 mg2KOu1l3k+aYCSfH5OyCAzmWZ3USMkAxDmcQj7QtarSrugdcS5De+0HHttvKpMTrncR
 ZlNntsE9tvtlJbn3OzHfsI2s7++f4s1Oex8z316bYwE/NdcYEB2cYh2+go9eG2/R+32W
 J+OnKosLX99LRh9xaoaC5Cd/e/IHvyev68+Rcwrv+HFGBSxII5WOOYgbt3wa6Dv4a7mv
 LiXhAAaoUK5KRxCa7oxyJVRlZBFAEQ37x6bVAXOZHw+syEsmxJ9akLdAaIFV0msKWQk5
 O0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729283679; x=1729888479;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fjo3xom5hyHJVXQDe/CPNDPIWLjDZtVAaVw4HhlPIfs=;
 b=s22yR2r2SuDHoP+cllmVjQ+JPzfyfVKg4rMfdliEnNeTgj7FQDlo1MGCRbLH4ciKaT
 CvHKWJnQO7SFXjB4c7dZiLAWwglWmXYyYe306Er5PbRJInLfUeGtxmA33jKjmKFh7BKr
 q2K/E49mah5Yv5atUa/oVPWcrywyxxd0CIpb2cCrEdGTXPkKopkLR1NRV6Wb6YZTCpyD
 zM55SAEOYwpaKBdeGNhHMo2zBLUl9Jfnu5PyagL6DB0QJqkPKZi/YFuneiy9ZXYq9yvL
 6MoHuRxqFnU+XW7xVO4MbyxEle7M8iRsLnngrBnzeCjJq9JiP8RlQoR/oRNTsbdoeJ/v
 OLJA==
X-Gm-Message-State: AOJu0YxXhwTHFGiukSOABMBDXplpL2XesvW2hD3lpBSSYzk32OqDNknt
 QqZbgANtJ8URLwzU9Kd2DI3sTQhMSnmA7k/iOSq4nHmChLhtbKnZ30IPs19ykg4=
X-Google-Smtp-Source: AGHT+IF8BVoRIxnX151X/ou3wfgvDZ33vCYdpPGEJRWz11slO0h1dFciQ3fgvHB6ZjPafQuKkOrHTw==
X-Received: by 2002:a05:6512:689:b0:539:93ef:9ed9 with SMTP id
 2adb3069b0e04-53a15231e83mr2568387e87.36.1729283679380; 
 Fri, 18 Oct 2024 13:34:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 13:34:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:22 +0300
Subject: [PATCH 4/6] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-4-6e49ae4801f7@linaro.org>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N3fpJ8U7Ak99t/Z4rrwzOntZmmVW0UU1b+pAthTP+sI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZWeps0ACTRHt9hRd/qx7Ya08ePnqAT37CMz
 0SKraccjUKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVgAKCRCLPIo+Aiko
 1b6OB/41ftMl6NnJ3cRxPukMLnle7BAxhRv6D5fefVcCKYyvbpYkKmNAYLWRN8s0T2q/f15mZfz
 UE8xxtBlmALOjmUa0S4uLfve0aqalgAsQIAG9gxLSbBNhTtpmLNIv0+RNpJ0DRnrwi1ND4bJIgT
 WPcqL5WpwQq9T4rkiQsEHwcP9QuxeEg/wAqr+K/MAHq/1bLpu6I/kzDaeoVbr6w+bXxy40f3iq/
 EOpk6yliKUDhA4ypEeO3L1mhNldVR7bsYUwVdsTdqxjqcadDhvDyIxCTv/w4AIGengb6jNP7Iei
 mXCwiSlpXwh8my5JY/3Qzks9N7ysEsKjfeZBa2l+7EN8yQqU
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 3da5b8bf8259..3304ab0c00f6 100644
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

