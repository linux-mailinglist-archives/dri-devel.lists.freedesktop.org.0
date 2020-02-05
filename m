Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17D15255E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E8C6F461;
	Wed,  5 Feb 2020 03:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD36F45E;
 Wed,  5 Feb 2020 03:49:12 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id j7so301607plt.1;
 Tue, 04 Feb 2020 19:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDVwG+Zcj9UBGLRE3/MPdG+p0RG+kmWgw3dCJvKALc8=;
 b=noFY08i0+7oaqGY1b+pEf63ZwPmlTx2X5Jjn2y6maV2AeqcFdB/1jIEB+feWm8tatU
 ImjozHDluJi5r4vQOCxjyLO2X8VtT3M23veP5Q9ouhIbwXss1WthNLWRyIxyy8HLS6Ws
 Nxras/GBLHzZUSAuC6IPEBdPCSBEPvtHvn/pE+LbILYjd1XGeOIIGEyuDnTf5icHj5oD
 Mok1LncxWsEXMisQWOIJecg038ibQp+/Y/J+Ro8L1jxegpFD0WHbg1HAG1N40FeNgb5X
 PB+tznCC32lXEFgGClvGM4EtB0k9dJ43Z4HzUE6+K/S6JVyxKWYu8aUlIGSopfnUbDDF
 zgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDVwG+Zcj9UBGLRE3/MPdG+p0RG+kmWgw3dCJvKALc8=;
 b=IeTAErtGOpLfq4yJeJNftnRRAQm4X8TnfvqeJirHMVyCe+c6ZcaNIa18uKJP/3/GzV
 A1CJixA+IWPG4l8HkaKS1Y44RegvmrYrB6vdVQ/dGiECDa9qn/wSU5D35RFjd3YP6uDK
 O3OhQDsJowpVkGNGxW+PSw/WrfeTp3JllajIKxFxHWpcnjT9M2uyJNhlUOaXv0dycucS
 1BSDo6ajCBOSIDWyJIJ2onlBr1yMTjqqCeQaHgeT/4zs6kag/iJoffUgRrLJTto9h9de
 iWo+u7UClcgCbwPoWyn9FeXUdqLHdoFgSYGLw/1nmFDWiDR/2YlXOeYAN50hbDjcXjGW
 l3Vw==
X-Gm-Message-State: APjAAAX30bYBSsuiSrPxSM8mZRrrleHhg7/c0WZY37J3EYcxR5ZhD00b
 8w/v0cJggLSmp9WUYWL3sTfWdnnp
X-Google-Smtp-Source: APXvYqycyXHbzDBmF40ObmWjnRGxoKm2QmzwGR5cEoB1gy27DTHrFxbEcZWzGIvuX9bxvZv6r0OJ5A==
X-Received: by 2002:a17:90a:d990:: with SMTP id
 d16mr3109650pjv.143.1580874551517; 
 Tue, 04 Feb 2020 19:49:11 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:11 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/14] drm/amdgpu/gem: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:44 -0500
Message-Id: <20200205034852.4157-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
References: <20200205034852.4157-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to remove the load and unload drm callbacks,
we need to reorder the init sequence to move all the drm
debugfs file handling.  Do this for gem.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index bcd10daa6e39..cb7db7edfc3f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1248,6 +1248,10 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 	if (amdgpu_debugfs_fence_init(adev))
 		dev_err(adev->dev, "fence debugfs file creation failed\n");
 
+	r = amdgpu_debugfs_gem_init(adev);
+	if (r)
+		DRM_ERROR("registering gem debugfs failed (%d).\n", r);
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3b09897eb1e9..64a275664c72 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3091,10 +3091,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	} else
 		adev->ucode_sysfs_en = true;
 
-	r = amdgpu_debugfs_gem_init(adev);
-	if (r)
-		DRM_ERROR("registering gem debugfs failed (%d).\n", r);
-
 	r = amdgpu_debugfs_regs_init(adev);
 	if (r)
 		DRM_ERROR("registering register debugfs failed (%d).\n", r);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
