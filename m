Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86E1F533E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 13:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66C66E527;
	Wed, 10 Jun 2020 11:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABA36E527
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 11:31:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q25so1498223wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ardIA30Cz13XtF+U/U15p9rEJqh94FzHVSb2vyWMMhk=;
 b=m/ThlLZAUAyFP3u4G9C/AzmOxnBF5yPWbsHgn7DqaZhgmhhUhMRHg/ToY0QGCpreZ0
 NdM2VqZ444TfJI9dn9eTfdhU7ZzHVNEo4/2u+UwCmzslibxDW3j6Btkog74d24+RocZF
 IkuOG9pFJKr2SzYQ8rixCgBxROwANu/wrMT80BrVlLrVHkjPykr1tjJw74LpdCVfUfLD
 Saw1b1jL4XseW2Cud8192yRQ7k/mqyYVEEzkzPv9GoQvsamPA/wTrKxZ0uJ4QNQZQRGz
 kYvK5r8w0ug1LNiturIZLrVm96ikwWeMMQoyRzKF51eWl/zj20axBAD4T/Vv9JJjVdhd
 y2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ardIA30Cz13XtF+U/U15p9rEJqh94FzHVSb2vyWMMhk=;
 b=DNueZT9t/DF7xgAqAnbZ3PKOt+CBso2F0lCwd4s7+6n2z+7y7YehQaX92d4+1uLKH6
 5qeiDDftA6AwfbzNFYMEu1RT747D0h5cXVnEmdf4dR+kA+YLy+EQEbgmumhy7EbDz7kY
 LvRau11QKewnPTdNp/LGKSNM4rrKYC/R4bI+0QR11msH4+V7SilpCaWuqOvywJixKKBF
 O5Fm4JjSiYr+PqXiXeDCnu6bvFnbBTWMO1zicV/oSg0mqiDD7xwLbokpA6ND2qq53neA
 RwkTK1hZ5FJkICjqxJRyjfQ5bRrYMkOzeQl2DKY9g2gEiB6A8q7jENAf5Dq7a8c7ZSFg
 GiFQ==
X-Gm-Message-State: AOAM530z6b0k/LQBfS8G60BbXv64a2HgW91S3I8FWajtauFtZyFLmkFp
 UT4lZa6J62YhTfibrdJ0yDU=
X-Google-Smtp-Source: ABdhPJx92QxD7BLgW0VvHj+gzaeNHu1Ptz16H36mGDQVNM4gJwio9XuZU+qKfE+gd3udi5eRNwE7og==
X-Received: by 2002:a05:600c:2153:: with SMTP id
 v19mr2681128wml.47.1591788661991; 
 Wed, 10 Jun 2020 04:31:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u3sm7675777wrw.89.2020.06.10.04.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 04:31:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Add zpos property for cursor planes
Date: Wed, 10 Jun 2020 13:30:59 +0200
Message-Id: <20200610113059.2164132-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
have a zpos property") a warning is emitted if there's a mix of planes
with and without a zpos property.

On Tegra, cursor planes are always composited on top of all other
planes, which is why they never had a zpos property attached to them.
However, since the composition order is fixed, this is trivial to
remedy by simply attaching an immutable zpos property to them.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 10 ++++++++--
 drivers/gpu/drm/tegra/hub.c |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..e7a6eb952ece 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+	drm_plane_create_zpos_property(&plane->base, 1 + plane->index, 1, 255);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
@@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
+	drm_plane_create_zpos_immutable_property(&plane->base, 0);
 
 	return &plane->base;
 }
@@ -1074,7 +1075,12 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+
+	if (!cursor)
+		drm_plane_create_zpos_property(&plane->base, 1 + plane->index,
+					       1, 255);
+	else
+		drm_plane_create_zpos_immutable_property(&plane->base, 0);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index a2ef8f218d4e..697d75bbb9fa 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -590,7 +590,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
-	drm_plane_create_zpos_property(p, 0, 0, 255);
+	drm_plane_create_zpos_property(p, 1 + index, 1, 255);
 
 	return p;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
