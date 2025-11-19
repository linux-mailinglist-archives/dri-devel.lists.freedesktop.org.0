Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D7C70136
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DFF10E65E;
	Wed, 19 Nov 2025 16:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="IpQSYcNg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2DB10E65E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763569629; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y/0Vipmx5dbt/YY3fImwYpmBEPHcexUPnq7kxWZA2m6xsPN8Tm5cL3cuvAeevyPT3BJJ/fyWhmQOYw1BbkK82SqPKce6jZHROdccoGeraNvMv8IMQPR2faNH9htpXE4EiXxYg9HuAJtzqBN6NwgSLPpqJx1/K3ahSnytLPO6/EI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763569629;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6zLAhp5hPACOhr0eOoF5ggaWm7pqVl9tQSgogBc1AWE=; 
 b=HG32VRGJcUZxS46Dv5RGx0wuZ32wGJG89zxM6lN/yNTtM6hZADbiubukZXMIosc3TkQb7Tzb5WX0RSMk/E2AEaoAPJOjwPfW6rSAYkxl5/hmkTMV6GxXgDGl0hTQQqzxM/PAItJEAT9uoBd80H6PlvbY5RBQiZDTVHryomJc3m4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763569629; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=6zLAhp5hPACOhr0eOoF5ggaWm7pqVl9tQSgogBc1AWE=;
 b=IpQSYcNgBD5nW0jJJ1+Mb2f6i1n0pkpi5pdlQe7r2xaIA6omX5yUk8MUcMjS4SbD
 WCEHiCteWEyTMZsmm7eQ16V03OGf/Pl/tJPRHobaytYM6dDY/m1YbP6QXq4HNmAl4Lh
 Bve9+v+Zq8Cjx7137FvaWk7RMssN4jJxpJBTHxcc=
Received: by mx.zohomail.com with SMTPS id 176356962698772.195018392718;
 Wed, 19 Nov 2025 08:27:06 -0800 (PST)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Ashley Smith <ashley.smith@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Enable timestamp propogation
Date: Wed, 19 Nov 2025 16:25:56 +0000
Message-ID: <20251119162613.912486-1-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the GLB_COUNTER_EN bit to enable coherent propagation of GPU
timestamp values to shader cores. This is a prerequisite for exposing
device-coherent timestamp queries.

Bump the version to 1.6 so userspace can detect support.

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 3 ++-
 drivers/gpu/drm/panthor/panthor_fw.c  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index d1d4c50da5bf..0b0ec3b978c6 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1604,6 +1604,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
+ * - 1.6 - enables GLB_COUNTER_EN
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1617,7 +1618,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 5,
+	.minor = 6,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 38d87ab92eda..a02fb3afc2e1 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -999,6 +999,7 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
 			       GLB_CFG_ALLOC_EN |
+			       GLB_COUNTER_EN |
 			       GLB_CFG_POWEROFF_TIMER |
 			       GLB_CFG_PROGRESS_TIMER);
 

base-commit: 92c49b3f4df8f9acfa95551ef38fc00c675319fd
-- 
2.43.0

