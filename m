Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9661533F519
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 17:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FF46E838;
	Wed, 17 Mar 2021 16:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458D06E838
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 16:09:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w18so2991625edc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 09:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LASiUJZzM9SBb9BxKINWFm41CPO6shbrsdTJEhF0yaI=;
 b=AcdBsvvDD2mwFdfxN/x9OEPZ9qMAuRMrKpdDV1i4T21fK6CjXwy9q2ec5vuUyhqSVU
 YxhQhmA2y8qF98lT8KeMsaGZPfVofrohBN4qyucfteUQI0I61JRe1UVjhPHK1PeaFQMA
 ucoRKbeWZNzY2G9CoetUJPJeJzegqAsY6/rh2iY23vl6MTgxFjhNGCIpBJhmp6a+qQlz
 CGLbNnuYh9DsXSx7OCVwbOiraQT/36gokUTMi3A0zCOo1FIhnkrJL5OyaKUTHFIl0Its
 nyBFM+XbIHW6ggbvMmmx1j9dHPQ8meFDMtsPe3h+6BxVenrUVbC/mPFole2mcp4CFu7A
 0YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LASiUJZzM9SBb9BxKINWFm41CPO6shbrsdTJEhF0yaI=;
 b=lqfriPoVwnaIK2hJUlW2KYiMTuW7BE3eNNzvqPNtOWoeTiJjeI+WR4+CTEL2Df6vRy
 bEzVWYGcrdIJjYhwVvA7uy5IknQ4Uh9lHZAgjIJz0P0cub8OhjuFFnfbTS3P7722MLmw
 Pq7I7W6hD0xo36oZIM3LlBPi59oTBB6KTRy2xK8Q+nHY4ro9uZarrm+FVLfd+P2Xna6c
 ivP/xXMqh12y5j3f4Ye/op0zE3Y/2RTRGSrFXNTy31FKoihBTg+etK+gm+GaRXqQv5Hb
 LUWb4NhFS7Q+bPzfPugotSO+ZGt+DziDx7KhZfP5fyXUmm8phnxqWd6Wv9lnpeuZ5GMO
 SU6g==
X-Gm-Message-State: AOAM532V+oZjriFZ4OZ6uzc4RB9EIYLyhTiSkf35Eop3UB91D4pOFA6K
 JvvC1bn6xAgQ2UgZlb/5Z2HPQg==
X-Google-Smtp-Source: ABdhPJw8pAC+ltODr7pfOGR0W+UPfJGOqgti1MYP3D5tSM/qw4/LpsgROfHRX/6VU5kN534YcFcn7Q==
X-Received: by 2002:a05:6402:22b5:: with SMTP id
 cx21mr43085461edb.27.1615997349970; 
 Wed, 17 Mar 2021 09:09:09 -0700 (PDT)
Received: from localhost (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
 by smtp.gmail.com with ESMTPSA id q11sm11728843ejr.36.2021.03.17.09.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 09:09:09 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: 
Subject: [PATCH] drm/amdgpu/ttm: Fix memory leak userptr pages
Date: Wed, 17 Mar 2021 17:08:37 +0100
Message-Id: <20210317160840.36019-1-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Likun Gao <Likun.Gao@amd.com>, dagmcr@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Gomez <daniel@qtec.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If userptr pages have been pinned but not bounded,
they remain uncleared.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9fd2157b133a..50c2b4827c13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1162,13 +1162,13 @@ static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	int r;
 
-	if (!gtt->bound)
-		return;
-
 	/* if the pages have userptr pinning then clear that first */
 	if (gtt->userptr)
 		amdgpu_ttm_tt_unpin_userptr(bdev, ttm);
 
+	if (!gtt->bound)
+		return;
+
 	if (gtt->offset == AMDGPU_BO_INVALID_OFFSET)
 		return;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
