Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE77152566
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EA76F466;
	Wed,  5 Feb 2020 03:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94BC6F455;
 Wed,  5 Feb 2020 03:49:17 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w21so259727pgl.9;
 Tue, 04 Feb 2020 19:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kegdYWqGxBdCcQ+t0XrzYVFcSJhMX/TPpx7RwDN0cnM=;
 b=XGMbVzwgYr7dlV32Zui3wSQfvAhAKe4BhFE1bEn2QbQXL7Wr9wQX2PN9vLxudK9O5q
 l8af3Lb9gY6+IC09DMJsFsUMBfcTFNXRvLEcx7kBbDt6T4GEalLlWvifIceI353HlkCG
 VJcjRYcgpE5LwINrYtyLAxyuV4AkGZGS7nbwvwMnYolMkizHLa9SAtkRoHA5836WhSMj
 wudSZTih2Vh1KBg7ycRSSfQzTfy0ViT5GBDdiysTmSJp+tp9b83n3pYpI/AOhDSjfrXO
 iehqxqSk2FMtJbM3YkjcVY5u9n6b2+DKZnwB7npREffyMgue4b2mLZiEqb6y6r1Z1jhm
 Jlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kegdYWqGxBdCcQ+t0XrzYVFcSJhMX/TPpx7RwDN0cnM=;
 b=V1W1b8kfnm82bd1Be4CotibDMaacw9zYXnvNvSpXajAKi8xyFcORTB6VUtAnFBT3ER
 cdT8C9WU+rcyuUEjoh3BZiEecaxqpREmo+XapjnYhdvem9JykZF8TFuVGuLf9fvzRa8v
 WVHyXdZf1SnsA1POXPP/SQyAo53bm3VBJz8U4T91hOPck80nRxEyXbYCb6b3uSIPhCgX
 shf+nNpzMwZFVtgC9XZB4YcG3e6NtCeHoB66TWIZX0KWDy7CwarNVLxZLC13dPd9z33K
 xPv6RBlzJel80YhRCm7BVLnC470T5icfLPfnjZzBoLMCYXqUPXwDr4WeFXzK008D5N4y
 EnaA==
X-Gm-Message-State: APjAAAUvmXkZRb5Tdbi2NDy94lr6VCkICTPE+VwnNYBq3d9DRYYRM0rq
 jpSo375/Vu6WlofRlvF1QeEiGZnr
X-Google-Smtp-Source: APXvYqxcktnWDKo7ibOkUyfrzoMLz3hfNspjWRyR8nmimv0wvNL4a0tyg589g+899WK/ViPlfJQpPA==
X-Received: by 2002:a63:1807:: with SMTP id y7mr32812637pgl.94.1580874557135; 
 Tue, 04 Feb 2020 19:49:17 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:16 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/14] drm/amdgpu/display: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:48 -0500
Message-Id: <20200205034852.4157-11-alexander.deucher@amd.com>
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
debugfs file handling.  Do this for display.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c       | 6 ++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 5bf43f20ec30..82d30bae2ba0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -32,6 +32,7 @@
 
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
+#include "amdgpu_dm_debugfs.h"
 
 /**
  * amdgpu_debugfs_add_files - Add simple debugfs entries
@@ -1260,6 +1261,11 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 	if (r)
 		DRM_ERROR("registering firmware debugfs failed (%d).\n", r);
 
+	if (amdgpu_device_has_dc_support(adev)) {
+		if (dtn_debugfs_init(adev))
+			DRM_ERROR("amdgpu: failed initialize dtn debugfs support.\n");
+	}
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7c094bfe07e2..efe74a8a8ace 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -991,11 +991,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		goto error;
 	}
 
-#if defined(CONFIG_DEBUG_FS)
-	if (dtn_debugfs_init(adev))
-		DRM_ERROR("amdgpu: failed initialize dtn debugfs support.\n");
-#endif
-
 	DRM_DEBUG_DRIVER("KMS initialized.\n");
 
 	return 0;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
