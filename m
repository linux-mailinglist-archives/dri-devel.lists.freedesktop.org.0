Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4D992EABC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 16:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE70E10EA9F;
	Thu, 11 Jul 2024 14:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KKDfdWpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1082310EA9F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6zQsFJN6Y1bC8mnnKXmKInWgSzwk3/kEfY2vtUCjpB8=; b=KKDfdWpRgjlQSLgbNw1SoW5X+P
 3melgtIt1uMKayzAoc/TA/xmv8kW85jySJs+W3NxMqiFmPgEM4jCwxVo/05SwuEL0w1Orf86vK52T
 Uw7H7dzIwr1dHid4SHri0JWrFkI6pg2ruqMyOVwQCPH28gQCfeEHXeIe1tpP7xalWxe+lsHymKJx6
 gk0rtoXNMA3e6JF5OxauvRumPVfMbfuXmdxwzi73NtiXBzmV5UV3HjQiQdu7OExk4FsDvsGiXt18J
 D8mNmwQNkwNx4CsDgCpUrL0ZkHUaFigUh3oh2VVNyNQyFcUtSna3GTfIl4kyRhVPuPUysh0cvwxlE
 9mQsjQGg==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRulx-00DjT6-FS; Thu, 11 Jul 2024 16:27:50 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/v3d: Expose memory stats through fdinfo
Date: Thu, 11 Jul 2024 11:25:24 -0300
Message-ID: <20240711142736.783816-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use the common DRM function `drm_show_memory_stats()` to expose standard
fdinfo memory stats.

V3D exposes global GPU memory stats through debugfs. Those stats will be
preserved while the DRM subsystem doesn't have a standard solution to
expose global GPU stats.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

* Example fdinfo output:

$ cat /proc/10100/fdinfo/19
pos:    0
flags:  02400002
mnt_id: 25
ino:    521
drm-driver:     v3d
drm-client-id:  81
drm-engine-bin:         4916187 ns
v3d-jobs-bin:   98 jobs
drm-engine-render:      154563573 ns
v3d-jobs-render:        98 jobs
drm-engine-tfu:         10574 ns
v3d-jobs-tfu:   1 jobs
drm-engine-csd:         0 ns
v3d-jobs-csd:   0 jobs
drm-engine-cache_clean:         0 ns
v3d-jobs-cache_clean:   0 jobs
drm-engine-cpu:         0 ns
v3d-jobs-cpu:   0 jobs
drm-total-memory:       15168 KiB
drm-shared-memory:      9336 KiB
drm-active-memory:      0

* Example gputop output:

DRM minor 128
  PID      MEM      RSS       bin          render           tfu            csd        cache_clean        cpu       NAME
10257      19M      19M |  3.6% ▎     || 43.2% ██▋   ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | glmark2
 9963       3M       3M |  0.3% ▏     ||  2.6% ▎     ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | glxgears
 9965      10M      10M |  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | Xwayland
10100      14M      14M |  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       ||  0.0%       | chromium-browse

Best Regards,
- Maíra

 drivers/gpu/drm/v3d/v3d_bo.c  | 12 ++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.c |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index a165cbcdd27b..ecb80fd75b1a 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -26,6 +26,17 @@
 #include "v3d_drv.h"
 #include "uapi/drm/v3d_drm.h"
 
+static enum drm_gem_object_status v3d_gem_status(struct drm_gem_object *obj)
+{
+	struct v3d_bo *bo = to_v3d_bo(obj);
+	enum drm_gem_object_status res = 0;
+
+	if (bo->base.pages)
+		res |= DRM_GEM_OBJECT_RESIDENT;
+
+	return res;
+}
+
 /* Called DRM core on the last userspace/kernel unreference of the
  * BO.
  */
@@ -63,6 +74,7 @@ static const struct drm_gem_object_funcs v3d_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
+	.status = v3d_gem_status,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index a47f00b443d3..e883f405f26a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -184,6 +184,8 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 		drm_printf(p, "v3d-jobs-%s: \t%llu jobs\n",
 			   v3d_queue_to_string(queue), jobs_completed);
 	}
+
+	drm_show_memory_stats(p, file);
 }
 
 static const struct file_operations v3d_drm_fops = {
-- 
2.45.2

