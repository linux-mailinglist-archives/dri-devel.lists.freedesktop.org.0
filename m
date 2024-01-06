Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7EF825FD0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 15:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E0E10E0C5;
	Sat,  6 Jan 2024 14:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6C110E0C4;
 Sat,  6 Jan 2024 14:14:59 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-59822d59158so270220eaf.3; 
 Sat, 06 Jan 2024 06:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704550499; x=1705155299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=70BmQ1AAqBQF/HMHseYDQ1nTDNOHkvcVEOwfs5CBfAw=;
 b=d9EoVQMRdB2j4L7Hm55G4HGg1E3oHW8nCCtcnqDjW0KNDpK2TJtKANxKemHsAdOO/s
 m4sj98HqfSv5NCdX06AEDakRGgPSnj/ZxrKMYQubMQ5hrLMC8kLkQG9+zsvy1sP+SmHe
 6vDBy8nEXOCnvaLi3jYmH4XpUXfgv0Yy3afIqKb81gj8fNpyJYLq+vJg+NjDbMmgG0YF
 7r9VDlrJNiPi5KTHDPIr8ZgU9DQovCR/UMDeYgIewX3HIBJF19CH+AODxZX/f2Tpgi6i
 tuHUEJYDIeMkS7Zt6VgeKNH0EscadXSz94TGoaKBRVG7glDnkd7wun5P4lATYGi2JiGE
 aXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704550499; x=1705155299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=70BmQ1AAqBQF/HMHseYDQ1nTDNOHkvcVEOwfs5CBfAw=;
 b=a+TD93MTnX4bhCJ6tdfgGdzuE8XaSRYmjFj+cKaHxgE6rTTJVWIoeiBdFg3t9243f3
 Lkl+maZY8fATS8WJpu7enBCN4Fl0aAfr5eOw7U6GeRcO425t5n3DPULZ2BCKjx6+V+YK
 QBNNeNb3WFGhm92oDn8RITpFVjNLuCnis10DQM6U8s8s8mWL1G1oDrJUqIbKYTl7HviI
 mxVn9il9EMSltdRxX0vz4Dft7JOk/kCC9/EgGF0z+7ddabycrTsPX1vzjnnvscQHGQS+
 9KtEfpixKPZ/Qe35gB6Ch4KtGIAosOipDcyhKFjf5CejFktXwRkXycyVZYi7vHvdXA8g
 KUGw==
X-Gm-Message-State: AOJu0YxVjv8czaNFiC+uNxuMmawA2OiLYAWeBG708rwWa0yhu/NnCQ2W
 pITCeCBzdDDhnOtRszvDmr4=
X-Google-Smtp-Source: AGHT+IGSdb9c7+Nu8KHp/gytkNLMwMgd3BPpCK1bPyMhFIqjH0pYoq/PPNkGN5lmBKH/185POMYmVA==
X-Received: by 2002:a05:6358:70c:b0:170:ee27:bfa1 with SMTP id
 e12-20020a056358070c00b00170ee27bfa1mr986956rwj.5.1704550498730; 
 Sat, 06 Jan 2024 06:14:58 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.. ([202.43.120.140])
 by smtp.gmail.com with ESMTPSA id
 qj14-20020a17090b28ce00b0028afdb88d08sm3050268pjb.23.2024.01.06.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 06:14:58 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH 1/1] Refactor radeon driver to use drm_gem_create_map_offset()
 instead of its custom implementation for associating GEM object with a fake
 offset. Since, we already have a generic implementation,
 we don't need the custom function and it is better to standardize the code.
Date: Sat,  6 Jan 2024 19:44:23 +0530
Message-Id: <20240106141422.10734-1-dipamt1729@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Dipam Turkar <dipamt1729@gmail.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c | 24 ++----------------------
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index fa531493b111..f590ed65ffba 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -578,7 +578,7 @@ static const struct drm_driver kms_driver = {
 	.ioctls = radeon_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(radeon_ioctls_kms),
 	.dumb_create = radeon_mode_dumb_create,
-	.dumb_map_offset = radeon_mode_dumb_mmap,
+	.dumb_map_offset = drm_gem_dumb_map_offset,
 	.fops = &radeon_driver_kms_fops,
 
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 358d19242f4b..99794c550d2c 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -31,6 +31,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/dem_gem.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/radeon_drm.h>
 
@@ -480,33 +481,12 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	return r;
 }
 
-int radeon_mode_dumb_mmap(struct drm_file *filp,
-			  struct drm_device *dev,
-			  uint32_t handle, uint64_t *offset_p)
-{
-	struct drm_gem_object *gobj;
-	struct radeon_bo *robj;
-
-	gobj = drm_gem_object_lookup(filp, handle);
-	if (gobj == NULL) {
-		return -ENOENT;
-	}
-	robj = gem_to_radeon_bo(gobj);
-	if (radeon_ttm_tt_has_userptr(robj->rdev, robj->tbo.ttm)) {
-		drm_gem_object_put(gobj);
-		return -EPERM;
-	}
-	*offset_p = radeon_bo_mmap_offset(robj);
-	drm_gem_object_put(gobj);
-	return 0;
-}
-
 int radeon_gem_mmap_ioctl(struct drm_device *dev, void *data,
 			  struct drm_file *filp)
 {
 	struct drm_radeon_gem_mmap *args = data;
 
-	return radeon_mode_dumb_mmap(filp, dev, args->handle, &args->addr_ptr);
+	return drm_gem_dumb_map_offset(filp, dev, args->handle, &args->addr_ptr);
 }
 
 int radeon_gem_busy_ioctl(struct drm_device *dev, void *data,
-- 
2.34.1

