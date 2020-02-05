Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8815255F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F34E6F463;
	Wed,  5 Feb 2020 03:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1B6F460;
 Wed,  5 Feb 2020 03:49:13 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c23so293821plz.4;
 Tue, 04 Feb 2020 19:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GFZVnpWX6GPvkc8CRw6ouzRBI+o08kr/Vo6z+I1dW8k=;
 b=kVOk615nIlY7oB0+uFpx6RsDVw0Zy/DJ37Q9akr6doTtPtDj81x8TlTzYxHXowuojB
 Cl+ADSsIl893wAgEaSii9oqXndSpIqrG7VedPTacknryR5djFMcNK0yDDWLTvFMD+Su0
 HHahxK+0viOw3QKkBOtZfOSkQrUaxKgfp9uLUmzS2RbAClxk7YX8wTuwadW4Fy4V5GAB
 RbQFA5swe4+LcJrCPG8pqdwxTe5wIQFnDekcTSF3LNrMy4NVowMyLFKXw84n265MiCUK
 awqTzCWJnJNJrt+sxntLgROHk5YhcNlGjSUEAIukzVBMwO7xitUxthMsszhLduGLduy0
 l5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GFZVnpWX6GPvkc8CRw6ouzRBI+o08kr/Vo6z+I1dW8k=;
 b=JndonuZ31juZJEwO8oipY87UULEUfKLVU+2FexxaGJReqCzHbRfbz/pqxo9cK1JoWv
 zEpje/iZl4kUC0M3DUgroRjWZb7jWW66LHSZbPUT8b/w8aINBb4Zb97R106S7/Q4YrdB
 RdEpMzs7WuqIH3x7esnM67qRv0M4VfXLk+O4UZNk5UGcRv7kFqaEORzhByqZsQFKYNG4
 WPYkc7up6hAxx7VEbZKq5Z1t8JwpJe6wXao+xGVsHSFX3qu0+AnEj+XWoXQl0FBQ3CK8
 y0ZBKev1bTJfZxAUvLvShMUxL2xpmT+NURDtHxotam75NptXE+n8JNX8VIpEpnizitpY
 aZPA==
X-Gm-Message-State: APjAAAUkzaAjZ05JfSH+ZL9WSYZLHNLSy1f524xHVv5SJvpC/IInKNoc
 dPZzxPzGkWcOHiM+yfaYP6rQqbFD
X-Google-Smtp-Source: APXvYqzkS1+gtfR/ovS+CG6lciBVj0Ud2+yJtWVkJMwyDdYWdf4yhv7hF9kaxvgHhEjxzMAMu4OIFQ==
X-Received: by 2002:a17:90b:3011:: with SMTP id
 hg17mr3146956pjb.90.1580874552903; 
 Tue, 04 Feb 2020 19:49:12 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:12 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/14] drm/amdgpu/regs: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:45 -0500
Message-Id: <20200205034852.4157-8-alexander.deucher@amd.com>
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
debugfs file handling.  Do this for register access files.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index cb7db7edfc3f..7721f1416cdb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1252,6 +1252,10 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 	if (r)
 		DRM_ERROR("registering gem debugfs failed (%d).\n", r);
 
+	r = amdgpu_debugfs_regs_init(adev);
+	if (r)
+		DRM_ERROR("registering register debugfs failed (%d).\n", r);
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 64a275664c72..d84a61e18bf8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3091,10 +3091,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	} else
 		adev->ucode_sysfs_en = true;
 
-	r = amdgpu_debugfs_regs_init(adev);
-	if (r)
-		DRM_ERROR("registering register debugfs failed (%d).\n", r);
-
 	r = amdgpu_debugfs_firmware_init(adev);
 	if (r)
 		DRM_ERROR("registering firmware debugfs failed (%d).\n", r);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
