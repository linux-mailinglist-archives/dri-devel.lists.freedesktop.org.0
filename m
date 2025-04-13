Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC5A872D6
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 19:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4919610E285;
	Sun, 13 Apr 2025 17:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="rr4lF3it";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADF910E261;
 Sun, 13 Apr 2025 17:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=bgWFqULpEF30Eenn5ri+Fulo5+82i9/JXUhAOMaGLMA=; b=rr4lF3itGf/2AhCA
 9F21QhOwLgeQt97SnbCtdlMLTBX+pL7IzYL2VDi5Z6W69i8/kt2wX8w6zsaUKTI9YCt0LRhdWP+rx
 0WxWMdvENyVyZr1+TqJqmrFbYQ+KaNlhzZt3SFVjnXXcIMvPdWc0ZYVjBc+bAtA/HJdrinNQBP0sN
 TLV7TEuDGKsgMSFTqTUBQPQMDfPV1FEjeKZg33c1RTO8YV2EZ4yPRx9xOP3x96M5aV2G6iC4avli6
 x0WRj+z9GhPyx+Nz9ao+/vNMN5nKlrSYMGKDe+T9KBQ/+lar6lee8qlmLPBSSFzqvoUQV9+p1ZBj9
 G5w9pb7aDTDXFKMzSA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1u40rE-00B22s-0f;
 Sun, 13 Apr 2025 17:11:00 +0000
From: linux@treblig.org
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/2] drm: qxl: Remove dead qxl_io_flush_* functions
Date: Sun, 13 Apr 2025 18:10:57 +0100
Message-ID: <20250413171058.271234-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413171058.271234-1-linux@treblig.org>
References: <20250413171058.271234-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

qxl_io_flush_release() and qxl_io_flush_surfaces() were both added
in 2013's
commit f64122c1f6ad ("drm: add new QXL driver. (v1.4)")

but have remained unused.  Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/qxl/qxl_cmd.c | 10 ----------
 drivers/gpu/drm/qxl/qxl_drv.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index d6ea01f3797b..1bdc5abf8dd1 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -356,16 +356,6 @@ void qxl_io_notify_oom(struct qxl_device *qdev)
 	outb(0, qdev->io_base + QXL_IO_NOTIFY_OOM);
 }
 
-void qxl_io_flush_release(struct qxl_device *qdev)
-{
-	outb(0, qdev->io_base + QXL_IO_FLUSH_RELEASE);
-}
-
-void qxl_io_flush_surfaces(struct qxl_device *qdev)
-{
-	wait_for_io_cmd(qdev, 0, QXL_IO_FLUSH_SURFACES_ASYNC);
-}
-
 void qxl_io_destroy_primary(struct qxl_device *qdev)
 {
 	wait_for_io_cmd(qdev, 0, QXL_IO_DESTROY_PRIMARY_ASYNC);
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index cc02b5f10ad9..a6184aaebf62 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -355,8 +355,6 @@ int qxl_io_update_area(struct qxl_device *qdev, struct qxl_bo *surf,
 void qxl_io_reset(struct qxl_device *qdev);
 void qxl_io_monitors_config(struct qxl_device *qdev);
 int qxl_ring_push(struct qxl_ring *ring, const void *new_elt, bool interruptible);
-void qxl_io_flush_release(struct qxl_device *qdev);
-void qxl_io_flush_surfaces(struct qxl_device *qdev);
 
 union qxl_release_info *qxl_release_map(struct qxl_device *qdev,
 					struct qxl_release *release);
-- 
2.49.0

