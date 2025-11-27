Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85AC8E1D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 12:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D97A10E02E;
	Thu, 27 Nov 2025 11:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="Xqw9IEkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9D10E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 11:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764244255; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YwpvSo6UhPSaMsvemgD6kZI/1TzE/bArUgbMutyf8vBL/lHHi5lVcvbAKsMm1WwwXQC9p27opmHF/+fxJRXtxeSqseMCsara3E6yOOjBKpSdoqc9ePC8/t8gkaSSZOvW5wLrdHjkA14WdfvVI9cabFcRV77KTg+D1ImbcyWTtZc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764244255;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=x85sTg3IrTtkcAGJIzvzOSxqMIyYPsqGLG1Rv3c8LGQ=; 
 b=Envwa080PIC98QSFvYzNdbDDYx9SnjhdcO1beiPGYrHK5+RfG9lie5XKibe9n5fY9C2Qaqt6o5XNOLikIDGrAbPQDuOOCIbAab2jxTFA7ahJB3RBmZSFHXLTz+K7N4B8aVc1AU6gAqG93/h5buzg70/OSqSr2bcC5OPcBkAFJXI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764244255; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=x85sTg3IrTtkcAGJIzvzOSxqMIyYPsqGLG1Rv3c8LGQ=;
 b=Xqw9IEkB0VgSUXpVOVozc15I56WMiQtAaGpm4RONj6qqH71aMXTsT7wMgzstl0kB
 OunJHqMU7Z8rNihMoShlGnb9hUug7xtvqITVqsPxqij9cFTcqB18loep7hBhoYq9TsG
 i3UZUBuSFR91LRZROxkvwCLr8ehjPfnRz1R+DvRA=
Received: by mx.zohomail.com with SMTPS id 1764244253149304.5178677468157;
 Thu, 27 Nov 2025 03:50:53 -0800 (PST)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Ashley Smith <ashley.smith@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: Enable timestamp propagation
Date: Thu, 27 Nov 2025 11:44:02 +0000
Message-ID: <20251127115019.2113040-1-ashley.smith@collabora.com>
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

v2:
- GLB_COUNTER_EN is not a toggle bit move to panthor_fw_update_reqs

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 3 ++-
 drivers/gpu/drm/panthor/panthor_fw.c  | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

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
index 38d87ab92eda..a55731e95884 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -996,7 +996,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_IDLE_EN |
 					 GLB_IDLE;
 
-	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
+	panthor_fw_update_reqs(glb_iface, req,
+			       GLB_IDLE_EN | GLB_COUNTER_EN,
+			       GLB_IDLE_EN | GLB_COUNTER_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
 			       GLB_CFG_ALLOC_EN |
 			       GLB_CFG_POWEROFF_TIMER |

base-commit: 92c49b3f4df8f9acfa95551ef38fc00c675319fd
-- 
2.43.0

