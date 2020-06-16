Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19351FB007
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 14:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861B36E8B9;
	Tue, 16 Jun 2020 12:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457696E8B9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 12:17:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f185so2821513wmf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8bnxqQ/VAftsoq8Me5sQx+qpNnPJPcZh+U5miJTjAOY=;
 b=alKYbtIErka4S28IGsVN9xqXyx7H66TZN4rNQS/pSediSAYZrnjlo9VtJ0Z8kY+pqy
 78EIXv5VNf42ucbWZv0CaSNTwquvoySVK+GEhKNDkznX9iXa1kbUzG2Zu/O/wpEIvH3b
 38EU+zB238/N85VsPVYsV/co4Mxr/5/nmC44EKZnt2lIJDDQwhCpBqSM82xtcnwMl4Bh
 dkD62xdsIHYOFRgCWdeUAzRr16tsAumZsOIkjGmhnSgzxGZpzZds/1Nis1Txkvv3xXlv
 1ka8rVsa9heWJyDqTNGtb3lC37tB6X+JIACQpUsg9EFNDJwA2dAHs5JanfznnUAgA3cx
 j4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8bnxqQ/VAftsoq8Me5sQx+qpNnPJPcZh+U5miJTjAOY=;
 b=gI3ftEaJbovvfgP6c5WSx+X76qbQ9Fhlx0A7bvWkTOG69vyrEGZpYl1rXEUEe08OCe
 uk4DyL8fzoyllhh2P/jPl9hzrV/rOwyS4TBHo/JpHj4zCBo4DFaXdtJwzUO0/I2vhEjd
 VGq5lt2CEc7i1Qhf1mnT2mCmMooBM6zckTqlwbQmVgdgUJaxJMnyaxTDBUN1H9sN9f5l
 OFfWMHo7ZvrDIyY8xIvWpPHOG9Zdy4292tW0X/Lk8bcOBlX7Gx3iiEthHr17HPxJQvS/
 Q/kJHZuUqhQEFuTHrT1vYTkrlOyCkjYqvlQrqfquV+hHaBgKJm64Tv4CFe0zru91T7Ad
 xj5g==
X-Gm-Message-State: AOAM531RVyWhNjUCVSbGusmrSckLXt74kOfpoqCikDSrqhHdkm5qALSr
 jPqXW4jtwg7CCPB7Fq1x6iazt6iI
X-Google-Smtp-Source: ABdhPJzYD5ZgVU8Qso6kCT2qCc5TO7bLPnygjG6dG6OPFgby0GqGuhRxI4ObAAtCm77qGk70rA8Aaw==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr2888883wml.108.1592309841939; 
 Tue, 16 Jun 2020 05:17:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p1sm28059177wrx.44.2020.06.16.05.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:17:18 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2] drm/tegra: Add zpos property for cursor planes
Date: Tue, 16 Jun 2020 14:17:13 +0200
Message-Id: <20200616121713.2983627-1-thierry.reding@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
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

Changes in v2:
- hardcode cursor plane zpos to 255 instead of 0 (Ville)

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 9 +++++++--
 drivers/gpu/drm/tegra/hub.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 83f31c6e891c..85408eed4685 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
@@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
+	drm_plane_create_zpos_immutable_property(&plane->base, 255);
 
 	return &plane->base;
 }
@@ -1074,7 +1075,11 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
-	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
+
+	if (!cursor)
+		drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
+	else
+		drm_plane_create_zpos_immutable_property(&plane->base, 255);
 
 	err = drm_plane_create_rotation_property(&plane->base,
 						 DRM_MODE_ROTATE_0,
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 22a03f7ffdc1..f8afc05bceb3 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -590,7 +590,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
-	drm_plane_create_zpos_property(p, 0, 0, 255);
+	drm_plane_create_zpos_property(p, index, 0, 254);
 
 	return p;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
