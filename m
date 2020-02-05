Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD40152562
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA746F462;
	Wed,  5 Feb 2020 03:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC96F468;
 Wed,  5 Feb 2020 03:49:15 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id ay11so301147plb.0;
 Tue, 04 Feb 2020 19:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54+gTNGx30TsJEkymgEeo0vNH7o4QcjeVXuCTdIvfec=;
 b=h73C028vHLX5A8HMT9nkh7emt4+BlLB0oRbyhgZe29UseHTWJtnXLXQyZRrMiPn1+M
 ov/+z3Zlx82lcu+cMcIgR2V5lMO4mdMeYL5LDmhULCssBiBj+jWJ1LHa7U/eqkdYEcOC
 zilZuDptomZRDl12EhmDB0aRlyjsTbZPcCefZG6WmLIC+2girKSof/vAamH+4MhIe1gy
 IvkdJJOAGm3VBDmZZ+wqowUwhQA73DFS3sMevUYPVuIoGMT1f2qFgOVMtWNymYgM5CSb
 vmeVnJ6om2uJCPmxHwHWu/M9snLe9dQgOJpC29jmtpUBFYPhVmmqXQzIpgS4Q+nQSjzt
 6CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54+gTNGx30TsJEkymgEeo0vNH7o4QcjeVXuCTdIvfec=;
 b=PJX4yAOuvb/23xtlBdW1KuIPdisLeAx0FXSKn3qcXx5GXm/Jabl5MwCEjNamzPYzGU
 xZnLl0HwVeWBUuOc2oYrFO4GmvdjynnbCFbszEF+hsEb4IoQde9+lorBHhhfAGed7rhw
 t/czenMvFyAD20urO0t0MYYIJ9W9fxuhkBGCBXZtXmfdVwvgh2cMz7Y2AjWveczKIcj8
 zhBUH8WWqnEcPwIsj1+mRh65PhdIagmwOKzrQOdD0piJ5ElL89r2EwF3gmppDLkbbNah
 MgiNZTtGdgC34LzdBO2OisYX+pxd5yxUu2TSstPPUqFsLzlqUjDxsg/FWwNMPLTCtfyu
 g6AQ==
X-Gm-Message-State: APjAAAUSCfaquWDr8PTO3bJVFy2XS/4NF0oORFAOLAQl2Ghw3IfgmHj7
 /H/8z5hXFvs6JK8gh0QrZLYSBfxg
X-Google-Smtp-Source: APXvYqzPtkfEpAcolMlRsIZ3OqTPy1UQHVZZ1gSB2U7jvnWRftH0wnu8JiLGnf8ep2XugBhUZL7EFQ==
X-Received: by 2002:a17:90a:20aa:: with SMTP id
 f39mr3221264pjg.35.1580874554364; 
 Tue, 04 Feb 2020 19:49:14 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:13 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/14] drm/amdgpu/firmware: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:46 -0500
Message-Id: <20200205034852.4157-9-alexander.deucher@amd.com>
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
debugfs file handling.  Do this for firmware.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 7721f1416cdb..5bf43f20ec30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1256,6 +1256,10 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 	if (r)
 		DRM_ERROR("registering register debugfs failed (%d).\n", r);
 
+	r = amdgpu_debugfs_firmware_init(adev);
+	if (r)
+		DRM_ERROR("registering firmware debugfs failed (%d).\n", r);
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index d84a61e18bf8..4dc7145368fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3091,10 +3091,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	} else
 		adev->ucode_sysfs_en = true;
 
-	r = amdgpu_debugfs_firmware_init(adev);
-	if (r)
-		DRM_ERROR("registering firmware debugfs failed (%d).\n", r);
-
 	r = amdgpu_debugfs_init(adev);
 	if (r)
 		DRM_ERROR("Creating debugfs files failed (%d).\n", r);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
