Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172148D46A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 10:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2155A112208;
	Thu, 13 Jan 2022 09:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EACA10F647
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 09:44:51 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id n11so6868264plf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 01:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12WHR9Tep6wxj1Qlgur5Iv7biPVkoGnmnRaYQ2k466k=;
 b=Ix1/5m0IBCPZEJeeORoDnKUH4up+ri8hZdiniM8Lyo/F4Ze0r5flDxj8RRA3bLGqmZ
 QKwiVM+rn8Y0dLVv2h1nWTXD/ZEABVtBezXv2TrBWr6FvPJHlA4YvZT3A6Ga6L3FqNI+
 1P0PO8CuTUimo2KiKoUf6V9+CVb4rugE598GswwT9w8U+AJ37TKhi0pEHsc6WYK/vYHb
 sG3jUdPgkF2hpc9Vily7ouIIlH3xTlMMoRMxEahAL0gAo88AVb//e7kq7ZEI5TyipUjY
 mY2fpoDrE/wGVCuhtnVYb7i+Khjl1y/8z2n3x56wZaq/kjEg/CujWUpM/ZVi0GWXMxZ9
 D5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12WHR9Tep6wxj1Qlgur5Iv7biPVkoGnmnRaYQ2k466k=;
 b=ScVabi+SArT04PKGN0VaMSMRv4AHKD3erqlEWYFNCN45XHBgT7+rFluyOOLZvJodVF
 CI4OilVVrGYHvAOk9S9lMxzbgyBP7vZtm71fQPx9Z5iyH/CYS0MbBTthGWfuWkXD5W17
 Cz2DGsgn9GV/2Z4EsdFxEqnihb8jqSIuCIjphUjw94nOK9MzUQydGcpOwQpDtao/HSrR
 ucyyqO4zflqJOsQvR62Btjo7RLojpm2171ak6QF0WFPIjw8OIx6zcOSczCrOC5WUdruw
 8jtAu/EUaur74+Vsde1SGJARgmw0Zy1DQIasVMgMEiFamCMfmEvzjBgaqTrqL6pSkNUi
 9jPA==
X-Gm-Message-State: AOAM531mZUk/wydv050MQGg/8Aekw6z7o2KZzXKq5XRHkv+4R+69gXbO
 B8Ahrwg3pnitd2mcg/c235hozOBcGhrB3gT8
X-Google-Smtp-Source: ABdhPJzjQ6ZC/inlO6VVsyMrtbsEeZbWiXW1gCq7wfQKGAfNVCuyPL6lfZpdDJlhJahFYDat2LDBwA==
X-Received: by 2002:a05:6a00:228a:b0:4c1:e696:6784 with SMTP id
 f10-20020a056a00228a00b004c1e6966784mr2440432pfe.74.1642067090282; 
 Thu, 13 Jan 2022 01:44:50 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id rm4sm2207154pjb.4.2022.01.13.01.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:44:49 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 2/3] drm: set fb_modifiers_not_supported flag in legacy
 drivers
Date: Thu, 13 Jan 2022 18:44:18 +0900
Message-Id: <20220113094419.12433-3-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113094419.12433-1-etom@igel.co.jp>
References: <20220113094419.12433-1-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set fb_modifiers_not_supported flag in legacy drivers whose planes
support non-linear layouts but does not support modifiers, and replace
allow_fb_modifiers with fb_modifiers_not_supported.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c      | 2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c      | 2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c       | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c       | 2 ++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 6 ++++--
 drivers/gpu/drm/radeon/radeon_display.c     | 2 ++
 7 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dc50c05f23fc..cbaea9c6cfda 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -958,7 +958,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
 	int ret;
 	unsigned int i, block_width, block_height, block_size_log2;
 
-	if (!rfb->base.dev->mode_config.allow_fb_modifiers)
+	if (rfb->base.dev->mode_config.fb_modifiers_not_supported)
 		return 0;
 
 	for (i = 0; i < format_info->num_planes; ++i) {
@@ -1145,7 +1145,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	if (!dev->mode_config.allow_fb_modifiers) {
+	if (dev->mode_config.fb_modifiers_not_supported) {
 		drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
 			      "GFX9+ requires FB check based on format modifier\n");
 		ret = check_tiling_flags_gfx6(rfb);
@@ -1153,7 +1153,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 			return ret;
 	}
 
-	if (dev->mode_config.allow_fb_modifiers &&
+	if (!dev->mode_config.fb_modifiers_not_supported &&
 	    !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
 		ret = convert_tiling_flags_to_modifier(rfb);
 		if (ret) {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index d1570a462a51..fb61c0814115 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2798,6 +2798,8 @@ static int dce_v10_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
+
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 18a7b3bd633b..17942a11366d 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2916,6 +2916,8 @@ static int dce_v11_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
+
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index c7803dc2b2d5..2ec99ec8e1a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2674,6 +2674,7 @@ static int dce_v6_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.max_height = 16384;
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index b200b9e722d9..8369336cec90 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2699,6 +2699,8 @@ static int dce_v8_0_sw_init(void *handle)
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 
+	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
+
 	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
 
 	r = amdgpu_display_modeset_create_props(adev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 929de41c281f..1ecad7fa3e8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -711,10 +711,12 @@ nouveau_display_create(struct drm_device *dev)
 				     &disp->disp);
 		if (ret == 0) {
 			nouveau_display_create_properties(dev);
-			if (disp->disp.object.oclass < NV50_DISP)
+			if (disp->disp.object.oclass < NV50_DISP) {
+				dev->mode_config.fb_modifiers_not_supported = true;
 				ret = nv04_display_create(dev);
-			else
+			} else {
 				ret = nv50_display_create(dev);
+			}
 		}
 	} else {
 		ret = 0;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 573154268d43..b9a07677a71e 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1596,6 +1596,8 @@ int radeon_modeset_init(struct radeon_device *rdev)
 	rdev->ddev->mode_config.preferred_depth = 24;
 	rdev->ddev->mode_config.prefer_shadow = 1;
 
+	rdev->ddev->mode_config.fb_modifiers_not_supported = true;
+
 	rdev->ddev->mode_config.fb_base = rdev->mc.aper_base;
 
 	ret = radeon_modeset_create_props(rdev);
-- 
2.25.1

