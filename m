Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53015255C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5856F45F;
	Wed,  5 Feb 2020 03:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56576F45C;
 Wed,  5 Feb 2020 03:49:10 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id ay11so301075plb.0;
 Tue, 04 Feb 2020 19:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLOwvReqmhDb2j0Rm4OFDu4DdL2tfH5E0Yyw2x2mEdo=;
 b=JQGPySPXJ0kjjawhmfQqgoQxVtlrY74Hs5PIl72EceUF2AvdO7gZKCjAW9QLf7cWcs
 GVqXP7HOkaWK0s0KD1jUyhqgfMbKi1KstKBeeg7Teg2AsvUrLfLoZRbPmIpdz1Av5Wv/
 qTa9y/8BZD4jEEcASCxMAh4nYhfhBzUKPt+lTncUt+XxSPiiuiaHcf+QnUZgZl+4pB+8
 ghcciy7VQbDdsm3s+iXHOdDJwOhDKx4u0amsFlo2Rg9ztnLEwikioJRPd0wI4Ez3nvJj
 SkBZlAsodSMgzJC+ibzzFjH2kOV54YCcvMNpuh5hovUAPYlBjiC0G2eAXUuPiwKjH8AM
 w35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLOwvReqmhDb2j0Rm4OFDu4DdL2tfH5E0Yyw2x2mEdo=;
 b=Q9js3Xo41Op1eu5ni1znB9UarXKi27bWZqbI2m3VOHMLq1JYYumm6r3hm426kMPe7H
 MaNCz3+vrhQ37G/RuzEUotrSG5vsyTujam6CBNM9G4K1nseFnffcyI7PrxsX0+gSGhf/
 B0zoLkau4/mTx8blpJkrxIdB6yPivvMW5ngdkxbaskuhCAQHh6eJ2iTT15MQJ1CcNy3/
 bA/Hhg149WGEVR2j12hPT27xJJ3bd34owjbqPgowbhwuh2xlEX65k0speNJBJcl9/VvT
 1C/y+1hwWVwb1Kr+/20fFLq5RPKISadPiSK8tlCwgXIsS3Q3J3ZW1G65UbJamIFvvYRf
 biOg==
X-Gm-Message-State: APjAAAUaynnKI22MNd5fUAeUWV5Xndz3DXAgotP2ecusaC2BVJmfQz1k
 mo8Kxsqr1rIEPApGG7qyF29mUQIu
X-Google-Smtp-Source: APXvYqx01NZtpB/BNvMHS9yPs7DJbWaali/Gv64iQ9LLnJ0NUu786ufQu42XlNgbz8AJbVXUjjU3yg==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr3214147pjb.129.1580874550076; 
 Tue, 04 Feb 2020 19:49:10 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:09 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/14] drm/amdgpu/fence: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:43 -0500
Message-Id: <20200205034852.4157-6-alexander.deucher@amd.com>
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
debugfs file handling.  Do this for fence handling.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c   | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 84c5e9f23c76..bcd10daa6e39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1245,6 +1245,9 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 		dev_err(adev->dev, "failed to register debugfs file for SA\n");
 	}
 
+	if (amdgpu_debugfs_fence_init(adev))
+		dev_err(adev->dev, "fence debugfs file creation failed\n");
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3c01252b1e0e..7531527067df 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -503,9 +503,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
  */
 int amdgpu_fence_driver_init(struct amdgpu_device *adev)
 {
-	if (amdgpu_debugfs_fence_init(adev))
-		dev_err(adev->dev, "fence debugfs file creation failed\n");
-
 	return 0;
 }
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
