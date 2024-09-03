Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C901696A12A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 16:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE2110E482;
	Tue,  3 Sep 2024 14:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="XDwDpt5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCF610E482
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 14:51:14 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725375061; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FFrPtUkgOiHxCnw5NIFs4L068NZikJBaUfWdpeXS5p7z+BA1SJXDM9QtWHcXygywdrvTY9fG0+ZNe+jf2kDUtBIIDjVkyKSwQ2s4ks66GwcZt3ya/I53cL0B7Ot77Dvj/eGDudstvZeePB7/IY3/7R6U+jJu2ADWljIZfyELEEQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725375061;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JoZyTngQaWUmJroKbr6Fpr/n3m9/mAYytfSe+YwDYgo=; 
 b=fj6HZLJetex5KjzqzYK4p9o3lgE3f5iCQZOoOAPGkXdg3X345CHOGdX050xdRg5FR9axIZkOBP0L55rBboAe650V30odLGleMC2OcqQS9UvRS3MZZXiG8D78ST8PQOM2ivTFXe3Be7k0b/EtnS5vgwsUZ8JVtChaE23rvhx5OqA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725375061; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=JoZyTngQaWUmJroKbr6Fpr/n3m9/mAYytfSe+YwDYgo=;
 b=XDwDpt5Qoth2HKrs8RlmZKcgqljZh/a9XFjXM+n8rk/3jI1Atzxf0tlCVwwQovqf
 XIQVUVYzXBxA+NalBXoIEDeLEdubbGzjATQ2Qoz+A2n/sVeaVtRxLO0AS9pgViOvvam
 oxgAq+gyQmtvH42EgZvlfbS8INZDM+l7KChfJIoI=
Received: by mx.zohomail.com with SMTPS id 1725375058634587.9557627661392;
 Tue, 3 Sep 2024 07:50:58 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: kernel@collabora.com, Mary Guillemard <mary.guillemard@collabora.com>,
 stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panthor: Restrict high priorities on group_create
Date: Tue,  3 Sep 2024 16:49:55 +0200
Message-ID: <20240903144955.144278-2-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
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

We were allowing any users to create a high priority group without any
permission checks. As a result, this was allowing possible denial of
service.

We now only allow the DRM master or users with the CAP_SYS_NICE
capability to set higher priorities than PANTHOR_GROUP_PRIORITY_MEDIUM.

As the sole user of that uAPI lives in Mesa and hardcode a value of
MEDIUM [1], this should be safe to do.

Additionally, as those checks are performed at the ioctl level,
panthor_group_create now only check for priority level validity.

[1]https://gitlab.freedesktop.org/mesa/mesa/-/blob/f390835074bdf162a63deb0311d1a6de527f9f89/src/gallium/drivers/panfrost/pan_csf.c#L1038

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 23 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.c |  2 +-
 include/uapi/drm/panthor_drm.h          |  6 +++++-
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index b5e7b919f241..34182f67136c 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_auth.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
@@ -996,6 +997,24 @@ static int panthor_ioctl_group_destroy(struct drm_device *ddev, void *data,
 	return panthor_group_destroy(pfile, args->group_handle);
 }
 
+static int group_priority_permit(struct drm_file *file,
+				 u8 priority)
+{
+	/* Ensure that priority is valid */
+	if (priority > PANTHOR_GROUP_PRIORITY_HIGH)
+		return -EINVAL;
+
+	/* Medium priority and below are always allowed */
+	if (priority <= PANTHOR_GROUP_PRIORITY_MEDIUM)
+		return 0;
+
+	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
+	if (capable(CAP_SYS_NICE) || drm_is_current_master(file))
+		return 0;
+
+	return -EACCES;
+}
+
 static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 				      struct drm_file *file)
 {
@@ -1011,6 +1030,10 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 	if (ret)
 		return ret;
 
+	ret = group_priority_permit(file, args->priority);
+	if (ret)
+		return ret;
+
 	ret = panthor_group_create(pfile, args, queue_args);
 	if (ret >= 0) {
 		args->group_handle = ret;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index c426a392b081..91a31b70c037 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3092,7 +3092,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	if (group_args->pad)
 		return -EINVAL;
 
-	if (group_args->priority > PANTHOR_CSG_PRIORITY_HIGH)
+	if (group_args->priority >= PANTHOR_CSG_PRIORITY_COUNT)
 		return -EINVAL;
 
 	if ((group_args->compute_core_mask & ~ptdev->gpu_info.shader_present) ||
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 926b1deb1116..e23a7f9b0eac 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -692,7 +692,11 @@ enum drm_panthor_group_priority {
 	/** @PANTHOR_GROUP_PRIORITY_MEDIUM: Medium priority group. */
 	PANTHOR_GROUP_PRIORITY_MEDIUM,
 
-	/** @PANTHOR_GROUP_PRIORITY_HIGH: High priority group. */
+	/**
+	 * @PANTHOR_GROUP_PRIORITY_HIGH: High priority group.
+	 *
+	 * Requires CAP_SYS_NICE or DRM_MASTER.
+	 */
 	PANTHOR_GROUP_PRIORITY_HIGH,
 };
 

base-commit: a15710027afb40c7c1e352902fa5b8c949f021de
-- 
2.46.0

