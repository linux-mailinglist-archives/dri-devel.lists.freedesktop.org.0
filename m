Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C295D34AA79
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3A6F41B;
	Fri, 26 Mar 2021 14:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669976F41B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 12so3123361wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fn6UM6Nh/EXUxmXhSBxOyP31iyXGR/4D1U+rCif0l4=;
 b=Eg6shYcrFmlsqdM+MPA8GmwZHsnjgYUKzhnwPO+aYirf6URfUO5p8sqxBGFSCYA5X6
 ijPHv7zJwlMfu41PHsGAUs8CqmGKbt6G6XA5tvNCHW152JbyhS2fxtIF9IiAPbbzmA8S
 wMW89mrmyn7mw9gZCPI4LgIhlqbuiGhsAMkJyEM6MUSi80qc0zV8UbrHtllGcyyaFrLq
 JaKYrP2Z6QxyfR9edSfv60ekGKtqDmpAB6REG2D+3oxlmXExRRh6QtAT7WKNk8jLIIwY
 nuxvBWyFXjyJk7yILLSvsA8J4MExCna/JSb74IGpLb0j+qjsrrrQYMk0ZLhhNdJ+GS7N
 Miug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fn6UM6Nh/EXUxmXhSBxOyP31iyXGR/4D1U+rCif0l4=;
 b=tqEz3+b9oGPM7wwZgnXuDoxRDdjqZCNnzlAMesTCJ6w4DIJSM5l6BB1MQTAeFCQUb4
 azGKBUA52X9lJyRGWjl4pO4tN7aoDE0QwuvBl4r/dsflYwYQmpgBlEkwYu2cnEBI1wvH
 VwaIYUl1KnfVnJzb+eKbuz4vjTVPbhhqfIlzLDeD8ivMfJaxfEdi7aZEEGzs6d/sO990
 VkFaHoLibwYz6Dc+vzOaDPQKvJjj2l8lmS6pjU/RDc36qohZuFE1RUj6d0G6786URnPT
 0PH+yZwZol0cmkagOYeSbBRdTNE/jukxbhi8AENYAzLz6FFJVF1i6NV9v8/l3tbSoWN6
 e8ZQ==
X-Gm-Message-State: AOAM530EabOVVLRTDv+a3sUpQjrONs2Mj1TZ1sAtGvD4lMP6E8Wsn1IQ
 Bw1pHLzNqMoZNz5Ch8Pe2uM=
X-Google-Smtp-Source: ABdhPJzwH9mxCZM1pnbGD+hQ+dJrkZcDheDCapm6XbTF8/sBCyy6SnrcN6DkEP6bFPpyd1oRH3/LBQ==
X-Received: by 2002:a1c:a74b:: with SMTP id q72mr13292847wme.158.1616770312023; 
 Fri, 26 Mar 2021 07:51:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u2sm13245309wrp.12.2021.03.26.07.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 09/10] drm/tegra: Count number of display controllers at
 runtime
Date: Fri, 26 Mar 2021 15:51:38 +0100
Message-Id: <20210326145139.467072-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
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
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
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
index 7758d64822ae..0c51f0bb17a9 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2078,6 +2078,16 @@ static bool tegra_dc_has_window_groups(struct tegra_dc *dc)
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
@@ -2226,6 +2236,16 @@ static int tegra_dc_exit(struct host1x_client *client)
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
@@ -2290,8 +2310,10 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
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
