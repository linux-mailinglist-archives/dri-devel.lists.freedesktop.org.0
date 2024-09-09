Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D76970E3E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 08:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C62E10E2D9;
	Mon,  9 Sep 2024 06:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="QJ21+Lcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BF810E2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 06:49:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1725864531; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ccaF5xNFq3yzQvtqy11NItJYhAp7Q/LtkhVYn6o15VSgVdK5PN1m7f54IGEvQvp1d02f7pZt4jdt62Jb0cxy5i+aVa8SqcKv6rvgYKbl8GTS9mm2hNMdEJQ03RaWdOlpkG9n4cgLpo+Sx6JMjHfYH6saWJ62MmiZSp5OOTFFpa0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725864531;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OfU+ay/I9Q7xGwL1E4eRj11ki8z/LY8nnyoSSRBFRc8=; 
 b=iy3FDsE9oDNcVn+U9PL7y4eXF3VO5Dq5OfcRLZJYfT+3SsW5kYlzUMO1VaMTOxy+4tygtCLTOsW6L7UtbCXht1VO34vAoPl4eGjaQe/oATR5hOkHm2n/9+sPR8/Dr6/o9xDzuDiK/EoLNRLsp8A5yFRo+s2HxTHTkNw+9vCYhG4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725864531; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=OfU+ay/I9Q7xGwL1E4eRj11ki8z/LY8nnyoSSRBFRc8=;
 b=QJ21+Lcmm3VfGrrd9lgf8stTv6Nj+vmGZ+IdX7a9nZs6ysej+sJL23nxtS+Jb8o9
 lP8Ccnsu9QZ+QZRWdoXvDEE9EHygObXWcM/ykwn2M7WJM48bFR3WdJMBKVa7VvXa/AF
 j800TvvIw9TgI8pfcELspdrk8IdtFKBoV0g+zwRE=
Received: by mx.zohomail.com with SMTPS id 1725864529300427.77978146133546;
 Sun, 8 Sep 2024 23:48:49 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] drm/panthor: Add PANTHOR_GROUP_PRIORITY_REALTIME group
 priority
Date: Mon,  9 Sep 2024 08:48:20 +0200
Message-ID: <20240909064820.34982-3-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909064820.34982-2-mary.guillemard@collabora.com>
References: <20240909064820.34982-2-mary.guillemard@collabora.com>
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

This adds a new value to drm_panthor_group_priority exposing the
realtime priority to userspace.

This is required to implement NV_context_priority_realtime in Mesa.

v2:
- Add Steven Price r-b

v3:
- Add Boris Brezillon r-b

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 2 +-
 drivers/gpu/drm/panthor/panthor_sched.c | 2 --
 include/uapi/drm/panthor_drm.h          | 7 +++++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 0caf9e9a8c45..7b1db2adcb4c 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1041,7 +1041,7 @@ static int group_priority_permit(struct drm_file *file,
 				 u8 priority)
 {
 	/* Ensure that priority is valid */
-	if (priority > PANTHOR_GROUP_PRIORITY_HIGH)
+	if (priority > PANTHOR_GROUP_PRIORITY_REALTIME)
 		return -EINVAL;
 
 	/* Medium priority and below are always allowed */
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 91a31b70c037..86908ada7335 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -137,8 +137,6 @@ enum panthor_csg_priority {
 	 * non-real-time groups. When such a group becomes executable,
 	 * it will evict the group with the lowest non-rt priority if
 	 * there's no free group slot available.
-	 *
-	 * Currently not exposed to userspace.
 	 */
 	PANTHOR_CSG_PRIORITY_RT,
 
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 1fd8473548ac..011a555e4674 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -720,6 +720,13 @@ enum drm_panthor_group_priority {
 	 * Requires CAP_SYS_NICE or DRM_MASTER.
 	 */
 	PANTHOR_GROUP_PRIORITY_HIGH,
+
+	/**
+	 * @PANTHOR_GROUP_PRIORITY_REALTIME: Realtime priority group.
+	 *
+	 * Requires CAP_SYS_NICE or DRM_MASTER.
+	 */
+	PANTHOR_GROUP_PRIORITY_REALTIME,
 };
 
 /**
-- 
2.46.0

