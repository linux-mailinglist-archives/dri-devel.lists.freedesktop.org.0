Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F9D3463A7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BCD6EB9C;
	Tue, 23 Mar 2021 15:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA276EB9C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:54:30 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ce10so27917961ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fz0pj9ppHMWd8qVO1GW/JKUv14EpoMWJ6NeYk++JZEA=;
 b=FNJVsHPBJpHg9N+6WL9bsnAxgfRAwzvvyV8W6upUxk4EibvlS2qEta0TI6K9dnTBsk
 WprbN53jE5BFzLmE27On/7yDMYd50an73oPrjXXUGlvfp9/MOkuNzLCfsuoqRceh3/N9
 EKQWOsGh5wjkJHLsf6VBuDi4Wy0Ro1ZbNovLb4e/HkM9uDec9P8eLUI1FYgWpPzHwEQD
 /NbFXR6yGFtYs/7Sn1gBCyGP0znXModNAJA6gbvL7fMnOlkJsy7EEVkEGObolcQbcQd3
 wkAXV66WnJWvIWd1jlTSlLNv8rLTo9KSqNon76XIEN9/5h3AZ8AsaDq7T2yDyAiEl/8V
 N7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fz0pj9ppHMWd8qVO1GW/JKUv14EpoMWJ6NeYk++JZEA=;
 b=Qg5rmKC3ahSn2sRxNDIX7Xx4FUFf9lOR3aw2Xc253uUrxlslv5v2EWu4VmdlyIkNkB
 T8C71CHjB9/32OA/IIemyy97e3/4me6EIZDoXhCqcRZ2Rhw6eN12SoapvDjWJFURMAOh
 f636dYkyMiF6RLaq82QMY1QGKGTJxgaFRnixQFoIcN08ggJnhji9T1F1aNkk9u5s97Bz
 4jwxafBss/4ipZqoLTOHn+AFRDLWEas4E5VsUZnWIxMxHRAzAiV2i9eVlW8Li61fpfRT
 0pFMPloWfnQa7fIKYMMCtjtj5qEQZbm7RZXbFsQrc3c2FtpG4wa9cSGZl4ZaZRjOI2m3
 PRvQ==
X-Gm-Message-State: AOAM530JW6vrtyl/t04nGYFCHkZo1JHtDp0fShKEnbcelQGhnXP0o2GD
 iiFV+vjF9khdFAwWBAFZU0M=
X-Google-Smtp-Source: ABdhPJwmgm9LvISuNY9MMJA04AO7jA2DJ5Luc8Ef1wNCoOxHm9cUdrksw6lemE+3pPWbBitTNmK8iw==
X-Received: by 2002:a17:906:f56:: with SMTP id
 h22mr5654838ejj.494.1616514869097; 
 Tue, 23 Mar 2021 08:54:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id n26sm13024993eds.22.2021.03.23.08.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:54:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/9] drm/tegra: dc: Parameterize maximum resolution
Date: Tue, 23 Mar 2021 16:54:31 +0100
Message-Id: <20210323155437.513497-4-thierry.reding@gmail.com>
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

Tegra186 and later support a higher maximum resolution than earlier
chips, so make sure to reflect that in the mode configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  |  6 ++++++
 drivers/gpu/drm/tegra/drm.c | 13 ++++++++++---
 drivers/gpu/drm/tegra/drm.h |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 5737a0c4dc9f..1886ef1fcda7 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2117,6 +2117,12 @@ static int tegra_dc_init(struct host1x_client *client)
 	if (dc->soc->pitch_align > tegra->pitch_align)
 		tegra->pitch_align = dc->soc->pitch_align;
 
+	/* track maximum resolution */
+	if (dc->soc->has_nvdisplay)
+		drm->mode_config.max_width = drm->mode_config.max_height = 16384;
+	else
+		drm->mode_config.max_width = drm->mode_config.max_height = 4096;
+
 	err = tegra_dc_rgb_init(drm, dc);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(dc->dev, "failed to initialize RGB output: %d\n", err);
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6015913fef83..bbc504763bd4 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1144,9 +1144,8 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
-
-	drm->mode_config.max_width = 4096;
-	drm->mode_config.max_height = 4096;
+	drm->mode_config.max_width = 0;
+	drm->mode_config.max_height = 0;
 
 	drm->mode_config.allow_fb_modifiers = true;
 
@@ -1165,6 +1164,14 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	if (err < 0)
 		goto fbdev;
 
+	/*
+	 * Now that all display controller have been initialized, the maximum
+	 * supported resolution is known and the bitmask for horizontal and
+	 * vertical bitfields can be computed.
+	 */
+	tegra->hmask = drm->mode_config.max_width - 1;
+	tegra->vmask = drm->mode_config.max_height - 1;
+
 	if (tegra->use_explicit_iommu) {
 		u64 carveout_start, carveout_end, gem_start, gem_end;
 		u64 dma_mask = dma_get_mask(&dev->dev);
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 1af57c2016eb..34fbcd6abf2f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -54,6 +54,7 @@ struct tegra_drm {
 	struct tegra_fbdev *fbdev;
 #endif
 
+	unsigned int hmask, vmask;
 	unsigned int pitch_align;
 
 	struct tegra_display_hub *hub;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
