Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864363463AE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785ED6EBB5;
	Tue, 23 Mar 2021 15:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2D26EBA0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hq27so27933130ejc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6m8a91si1cnDHS00dV1ISUdzK3yedRVU6icgkuZGHU=;
 b=Q4orDcvrrZquj5F1jtTTvlyeIff8xpcVU+my69IV0dCxaBY6hHIxA56UrrFz759dqo
 aaGNGLpXz7/mt5DpfAyr7Ul/8Q4OjGyek/HI4PDMrkJVikxG96UJiu1h3hrxOVHzpuXw
 hYOyds1dIoaqgw+8Y35mb00LVzBbuEPrf9OUORPeaq/w0BmXJe1/BOsqaVuTgiU/YFaw
 ExTmQbsFJZcf+LLX0r2jBn7jCaSLl2Rs3tu/Li5KIG6bjE57Ziktp2prTO3F1V3HWJ3B
 0aJnxyyOVs7RnJbq2lWBdQEW7uucij4XSTkuHH8z8w+vkuFsO0Dk4h9kDq65CR8gHGFA
 xEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6m8a91si1cnDHS00dV1ISUdzK3yedRVU6icgkuZGHU=;
 b=LGTZjXMtbM7t6q2rHX/tV5h7uSTb25EM70ibxp+WwKe/sPaTpsJJ5Ah9xs1wTrGTv3
 W9M83vtIkDLDr+re5cY7cxjMYX3/ygrCPMFfWpVj3Kx4J5dHuv+oxckd26TYaOiWp50P
 0W/c7TUGfCcYY89/EvqME1AeSVCm+tDsXS3GHh3rwcDXFiiBQCuaCnk7e+o8gFPxh6xo
 GQC/ybNV+ws5Jm9dqEsB7zuzny1TJvPZn8PM4Mch39t7R53RxcigTV9nqvP6ZcTYgPLa
 W83IEBrl0pw4GUQAdFtk2KXZdzn2Ydc5wLI+AkH/hmJ+sHO1c7nMNga68bV5MF24wSWC
 PcgA==
X-Gm-Message-State: AOAM530qAzebS09jTE3Ddqo7uANjjC3GSHEdyIwtZoXlSXPHPGt1fIXA
 Ck/0rZpIAN3BJH4LmynIwg8=
X-Google-Smtp-Source: ABdhPJxfuQJuh6/kUUka0VPQxP/G9nXtoUxnnJwM5UDW2NDN2U9c1LQPQr92SZwuPCF20b1g+G1I2w==
X-Received: by 2002:a17:906:f210:: with SMTP id
 gt16mr5574600ejb.206.1616514881056; 
 Tue, 23 Mar 2021 08:54:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g11sm13185863edw.37.2021.03.23.08.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:40 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 8/9] drm/tegra: Count number of display controllers at runtime
Date: Tue, 23 Mar 2021 16:54:36 +0100
Message-Id: <20210323155437.513497-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In order to be able to attach planes to all possible display controllers
the exact number of CRTCs must be known. Keep track of the number of the
display controllers that register during initialization.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h |  1 +
 drivers/gpu/drm/tegra/hub.c |  6 ++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 4262fd9b9a15..927e6f5a2c24 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2081,6 +2081,16 @@ static bool tegra_dc_has_window_groups(struct tegra_dc *dc)
 	return false;
 }
 
+static int tegra_dc_early_init(struct host1x_client *client)
+{
+	struct drm_device *drm = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = drm->dev_private;
+
+	tegra->num_crtcs++;
+
+	return 0;
+}
+
 static int tegra_dc_init(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->host);
@@ -2229,6 +2239,16 @@ static int tegra_dc_exit(struct host1x_client *client)
 	return 0;
 }
 
+static int tegra_dc_late_exit(struct host1x_client *client)
+{
+	struct drm_device *drm = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = drm->dev_private;
+
+	tegra->num_crtcs--;
+
+	return 0;
+}
+
 static int tegra_dc_runtime_suspend(struct host1x_client *client)
 {
 	struct tegra_dc *dc = host1x_client_to_dc(client);
@@ -2293,8 +2313,10 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
 }
 
 static const struct host1x_client_ops dc_client_ops = {
+	.early_init = tegra_dc_early_init,
 	.init = tegra_dc_init,
 	.exit = tegra_dc_exit,
+	.late_exit = tegra_dc_late_exit,
 	.suspend = tegra_dc_runtime_suspend,
 	.resume = tegra_dc_runtime_resume,
 };
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 34fbcd6abf2f..9a089b93da24 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -56,6 +56,7 @@ struct tegra_drm {
 
 	unsigned int hmask, vmask;
 	unsigned int pitch_align;
+	unsigned int num_crtcs;
 
 	struct tegra_display_hub *hub;
 };
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 617240032c37..500c9d37e654 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -562,9 +562,8 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct tegra_display_hub *hub = tegra->hub;
-	/* planes can be assigned to arbitrary CRTCs */
-	unsigned int possible_crtcs = 0x7;
 	struct tegra_shared_plane *plane;
+	unsigned int possible_crtcs;
 	unsigned int num_formats;
 	const u64 *modifiers;
 	struct drm_plane *p;
@@ -583,6 +582,9 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 
 	p = &plane->base.base;
 
+	/* planes can be assigned to arbitrary CRTCs */
+	possible_crtcs = BIT(tegra->num_crtcs) - 1;
+
 	num_formats = ARRAY_SIZE(tegra_shared_plane_formats);
 	formats = tegra_shared_plane_formats;
 	modifiers = tegra_shared_plane_modifiers;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
