Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B024634AA74
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C47B6F411;
	Fri, 26 Mar 2021 14:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D646F413
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:51:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g25so3164099wmh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvvKebFi6ANZJRVhz63aix9PqvdlCopB57+FLZgaRmQ=;
 b=ioyO77vdPbBwIAGXEoneFnDs3te1YMC09DrUxw7JXz6JEnPHevslOe0F4KXrXge3cr
 4+AyBA5IFsEMkONIdZ03KGhUnbgxYRDAN8As3DPUvSV4rfitfb6jJwiiazsPKihhtzU6
 5/qMipZZVDWB9VDdE0B7t3PKL/J7fV/4Xql1s+/E7ZkmOCpvQ7YaQLWM0dv2UZM0yg43
 iXUfShS5LDOjPkHOrS8JOD1WgzZ0IFSHTgLNgKBMVBXG60Egy1LXdO4tBY1K5fdSSZR7
 2DNRnGdYxZwfHfHZhagcWDYcYDpc3HsIFCqvwy0xoiakS55tPMx2RAJRvPPVYfEgh3J/
 F5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvvKebFi6ANZJRVhz63aix9PqvdlCopB57+FLZgaRmQ=;
 b=IC0mSFCFHkPdYMJya3Jk95VexWLZM2rAYc+axGreOTH2p/Kd4RYkBmfpuhhALL0lRZ
 KaMFLzL/0NhF7xznqn8yx456/QMyJMdlRUg9AyqwqmmMLFl6nkPrHKAQrJcJ5p6ZuccI
 Ib75z1d5KYd6Vxqs4W3fnNdCZ8wAhHKpfC+TB6ZcEiI5qKxpyMQgrvvV+lPOj4SkaJMc
 JS7LmBhobMVNU+/14WPL+rFfKz0io4h49cxannWVt+Uvwocz3CAw4GU/SICN6rt6s3m0
 Sc/XTqQXypn8UY7W5G0jQnSBB/MiYSN9gLVOCUrxeNer8NUQzUxXxAVa4MLn/3pn9UI7
 3RZw==
X-Gm-Message-State: AOAM5309zPEgljmkHfW8vwnZq95umMoiAdymaWFB9IrKMQPyZ8hgPVSU
 YK2pPxG9o7uw3Me3W6UlzTc=
X-Google-Smtp-Source: ABdhPJxVMnW3n5wLI2IGz2koUVdaJcq9DLQu8PsG7a8tOW5BbglpyPRd22ABNJDrjsM43WPJD4RtRQ==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr13938512wmj.119.1616770298117; 
 Fri, 26 Mar 2021 07:51:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id j136sm12156895wmj.35.2021.03.26.07.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:51:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 04/10] drm/tegra: dc: Parameterize maximum resolution
Date: Fri, 26 Mar 2021 15:51:33 +0100
Message-Id: <20210326145139.467072-5-thierry.reding@gmail.com>
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

Tegra186 and later support a higher maximum resolution than earlier
chips, so make sure to reflect that in the mode configuration.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  |  6 ++++++
 drivers/gpu/drm/tegra/drm.c | 13 ++++++++++---
 drivers/gpu/drm/tegra/drm.h |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 935717e7410d..0541d7b5c841 100644
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
