Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688B47A7EE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 11:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375E310F73E;
	Mon, 20 Dec 2021 10:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DFA10F73E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 10:49:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so6356587wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 02:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k5D/hkos8PJ/G13IZnPAlfxo+Wk+tXMrwI3gVHpH+gg=;
 b=F2GytIGzLIh8p+IAbOm0y3M13EHSYTOq9RESBoLLVez1k6cZwig9b/qEGIKjbvZeoV
 F0/M9V7KAoIt2FCt+f3VbItrJNznx8NSzXcJMfHmf8E3TzLp5hdQSW5sgJiZheu5WNjT
 krxh5Jtn0cSkBpFJcO47rdcg3DfWc79TMgu8QXZZWZw0zJWbnRKlLzFSyygwTZAmUil/
 0BjAYoGpVAqRoQjUgn5IOz6M6xZuBega+s8tYwb7fI9HTrGQhndyeRCogVM2Qyurzb9m
 UljqCfaoYl2Z4A2b4gxRmNLvaKpOX3KVcAzHIJd9Bat/3CEEb890EeaYKeZEeKEl+WGQ
 bMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k5D/hkos8PJ/G13IZnPAlfxo+Wk+tXMrwI3gVHpH+gg=;
 b=WVu0EL6rek4suqgolO+50LmwzzV34C6RmcIfg2wRr1og7Knual0cs1ZfLITe9e5j5Z
 y6+iWx8AEGYweqHa01P7Plq918ySnn1jF7mJNwbj6YBlACYMXu1EsvZsTh0OvwmK6y9W
 dPRDCXh14uwkjwLaxyWLJICHFcYtzWMwZlob578FrWpdN3oxh04sHO9wfStrtQzrDvWr
 +o/4oUFHnO2lKEzBo80JhinTnTMNAWDVRO/ioEON+HnPOLOwwUGTf5uuBBZcs12suS8K
 F4+aatFTOTTjXBaLnSO2UEuhhJmrSi+XCDA97iN9hzbuM9V3fBp5MqWrlUODRTyrbHqy
 8E0A==
X-Gm-Message-State: AOAM5313uZbXxFz93YtPQVbVFkZd+EppY9LnlTMEBUnsmXCGZJc/R8sf
 +5vw4cDGG5LnCB548WX0N+I=
X-Google-Smtp-Source: ABdhPJzDEuE2Ez64pbYVPw4/jB9o9WdThgXDn6WgFeqVxYKIG2+TY6pF8LqaUE6tslwtt6Zcs/IyVQ==
X-Received: by 2002:a1c:a905:: with SMTP id s5mr20915040wme.85.1639997342660; 
 Mon, 20 Dec 2021 02:49:02 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id l26sm7815473wme.36.2021.12.20.02.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 02:49:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] drm/tegra: dpaux: Populate AUX bus
Date: Mon, 20 Dec 2021 11:48:54 +0100
Message-Id: <20211220104855.428290-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220104855.428290-1-thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The DPAUX hardware block exposes an DP AUX interface that provides
access to an AUX bus and the devices on that bus. Use the DP AUX bus
infrastructure that was recently introduced to probe devices on this
bus from DT.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/Kconfig | 1 +
 drivers/gpu/drm/tegra/dpaux.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 8cf5aeb9db6c..201f5175ecfe 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -5,6 +5,7 @@ config DRM_TEGRA
 	depends on COMMON_CLK
 	depends on DRM
 	depends on OF
+	select DRM_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 1f96e416fa08..9da1edcdc835 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -18,6 +18,7 @@
 #include <linux/reset.h>
 #include <linux/workqueue.h>
 
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 
@@ -570,6 +571,12 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	list_add_tail(&dpaux->list, &dpaux_list);
 	mutex_unlock(&dpaux_lock);
 
+	err = devm_of_dp_aux_populate_ep_devices(&dpaux->aux);
+	if (err < 0) {
+		dev_err(dpaux->dev, "failed to populate AUX bus: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

