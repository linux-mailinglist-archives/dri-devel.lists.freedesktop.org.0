Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888995E904B
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 00:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADDE10E146;
	Sat, 24 Sep 2022 22:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7E210E146;
 Sat, 24 Sep 2022 22:20:00 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y136so3323042pfb.3;
 Sat, 24 Sep 2022 15:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UfxmaX6xS18SKL5CagBELfs0Ts/wzJVZYz5agHw6ueY=;
 b=IHfmwB/VyAFq4bNc5eirmno6HT/0rkT/d4G5Vroz8EZg2S6Oo+NJ86/vMHgDOH2Zv9
 xlS/SxJiF9fMyXmCBB4eM8aJCJzWn/GFB/BFQTt83ZAHy5Qlgm92RYOitUwD1Q2eCxLT
 1XSMSAbv9Vz124+eMxcJ2hbpEZKkUayPJylVUrRCxYTfIUkHopqOsmUHok4xkFphbeX1
 v+MKSHsnhtEUfipD52DC2WL74Bew65y2xfcU4wMuOPvW/cw/WMRTUNdSn5rNbtS1lYrR
 8LzwDIv/bx7NvzdS2Rk0V3cfDr5RJNXKYwwkjTTCQEKABiWsfBKGHunny7CjHVdnpK24
 TsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UfxmaX6xS18SKL5CagBELfs0Ts/wzJVZYz5agHw6ueY=;
 b=H8aOOUE5PALhZtrFLysaxGqHpewyroR4KnwpJlG1eNZUGmD0AODsRuXoe0ncaSaj0t
 KSd6oRxw7M8Bg+U8RVNh8HQymPejJbjZbb8cc+d2YbZv96QgZ869kIWGT8Z/yvd9z1a+
 zyLf6KGxfzNHbJuhulzQYwwTkm2ott5bgq0Wn+2nUL7EZv4r1Gjr85AcRY2xf7rn10hd
 Kz2TroqRVLJIKYccHP4UtW/0Qri5qzIubxLdqja7BrEO98nJMP/1Ga7EEqRdiBTfxig4
 TKOav5fFvuN9wn62Vd/kylxjIOT4Ho3xTEgenn7TkDZETwhUQ5laJXNr8b9dlWxq1ZuB
 wNaw==
X-Gm-Message-State: ACrzQf1Ytqi+i2MakHUgbwzv2TLozityGQineBRBQDR3fIpRLyBoFzsN
 XslMQzTQJjEZLpEhgqXjFh+8JLYiI24cyg==
X-Google-Smtp-Source: AMsMyM6fRTViVJAV24Y1aqXPwLsmaZvOex6LL58yU6e78vxShmI4rGx41WdiJ0tcZjtm86yWMIxHvg==
X-Received: by 2002:a63:1326:0:b0:439:40b5:77cc with SMTP id
 i38-20020a631326000000b0043940b577ccmr13797634pgl.473.1664058000118; 
 Sat, 24 Sep 2022 15:20:00 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu.
 [2607:f720:1300:3033::1:4dd]) by smtp.googlemail.com with ESMTPSA id
 mi7-20020a17090b4b4700b00200b12f2bf5sm14773431pjb.1.2022.09.24.15.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 15:19:59 -0700 (PDT)
From: Li Zhong <floridsleeves@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2] drivers/amd/pm: check the return value of amdgpu_bo_kmap
Date: Sat, 24 Sep 2022 15:19:39 -0700
Message-Id: <20220924221939.1736291-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: lijo.lazar@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 Li Zhong <floridsleeves@gmail.com>, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_bo_kmap() returns error when fails to map buffer object. Add the
error check and propagate the error.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---

v2: revise the compile error

 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c       | 5 ++++-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 8fd0782a2b20..f5e08b60f66e 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -1384,13 +1384,16 @@ static int kv_dpm_enable(struct amdgpu_device *adev)
 static void kv_dpm_disable(struct amdgpu_device *adev)
 {
 	struct kv_power_info *pi = kv_get_pi(adev);
+	int err;
 
 	amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
 		       AMDGPU_THERMAL_IRQ_LOW_TO_HIGH);
 	amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
 		       AMDGPU_THERMAL_IRQ_HIGH_TO_LOW);
 
-	amdgpu_kv_smc_bapm_enable(adev, false);
+	err = amdgpu_kv_smc_bapm_enable(adev, false);
+	if (err)
+		DRM_ERROR("amdgpu_kv_smc_bapm_enable failed\n");
 
 	if (adev->asic_type == CHIP_MULLINS)
 		kv_enable_nb_dpm(adev, false);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 1eb4e613b27a..ec055858eb95 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
 {
 	struct pp_hwmgr *hwmgr = handle;
 	struct amdgpu_device *adev = hwmgr->adev;
+	int err;
 
 	if (!addr || !size)
 		return -EINVAL;
@@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
 	*addr = NULL;
 	*size = 0;
 	if (adev->pm.smu_prv_buffer) {
-		amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		err = amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		if (err)
+			return err;
 		*size = adev->pm.smu_prv_buffer_size;
 	}
 
-- 
2.25.1

