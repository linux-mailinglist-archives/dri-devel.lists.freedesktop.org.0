Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E87864A3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 03:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CDC10E4B7;
	Thu, 24 Aug 2023 01:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E28A10E4B2;
 Thu, 24 Aug 2023 01:36:22 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9677A66072F0;
 Thu, 24 Aug 2023 02:36:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692840980;
 bh=yD9wfCKvqna1/wmDIoUeYBMCMGlTtWCx7RFZbYt6L/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H6QU8hEq4NObU93r9/Sv8bLtE0pFe80qIP0YaAdX9yK4T7vWEJPvWvWMvKZCUzIEw
 Rc79fq7RWjJ+mWwSsdLcJhaZY2rNG8yK/5jupxjwZ6Ru1Yxvdp6u2ZIYIzAzJ7HIJi
 fS7MgtlbeU17k4ORS7yKtXdjKllgX1UcFfy5FHnnNxBjAUxlwkHzzbRVr7uSmrJpXI
 dmSI34LRoMyE91cYwsQJFErYdyugdTPc8M1xALXHQYiKE7bMXBrGjW2v+Za0VrEzk+
 GYuWpywcmz8numCax/EJTnSe8WymYCcN0KKvebRejJPcyvf8Sge0hbtQmg0VVbTqca
 IO/CA6SaooHcw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v2 6/6] drm/drm-file: Allow size unit selection in
 drm_show_memory_stats
Date: Thu, 24 Aug 2023 02:34:49 +0100
Message-ID: <20230824013604.466224-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230824013604.466224-1-adrian.larumbe@collabora.com>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current implementation will try to pick the highest available
unit. This is rather unflexible, and allowing drivers to display BO size
statistics through fdinfo in units of their choice might be desirable.

The new argument to drm_show_memory_stats is to be interpreted as the
integer multiplier of a 10-power of 2, so 1 would give us size in Kib and 2
in Mib. If we want drm-file functions to pick the highest unit, then 0
should be passed.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_file.c              | 22 +++++++++++++---------
 drivers/gpu/drm/msm/msm_drv.c           |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
 include/drm/drm_file.h                  |  5 +++--
 4 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 762965e3d503..517e1fb8072a 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -873,7 +873,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 EXPORT_SYMBOL(drm_send_event);
 
 static void print_size(struct drm_printer *p, const char *stat,
-		       const char *region, u64 sz)
+		       const char *region, u64 sz, unsigned int unit)
 {
 	const char *units[] = {"", " KiB", " MiB"};
 	unsigned u;
@@ -881,6 +881,8 @@ static void print_size(struct drm_printer *p, const char *stat,
 	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
 		if (sz < SZ_1K)
 			break;
+		if (unit > 0 && unit == u)
+			break;
 		sz = div_u64(sz, SZ_1K);
 	}
 
@@ -898,17 +900,18 @@ static void print_size(struct drm_printer *p, const char *stat,
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-			    const char *region)
+			    const char *region,
+			    unsigned int unit)
 {
-	print_size(p, "total", region, stats->private + stats->shared);
-	print_size(p, "shared", region, stats->shared);
-	print_size(p, "active", region, stats->active);
+	print_size(p, "total", region, stats->private + stats->shared, unit);
+	print_size(p, "shared", region, stats->shared, unit);
+	print_size(p, "active", region, stats->active, unit);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
-		print_size(p, "resident", region, stats->resident);
+		print_size(p, "resident", region, stats->resident, unit);
 
 	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
-		print_size(p, "purgeable", region, stats->purgeable);
+		print_size(p, "purgeable", region, stats->purgeable, unit);
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
@@ -916,11 +919,12 @@ EXPORT_SYMBOL(drm_print_memory_stats);
  * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
  * @p: the printer to print output to
  * @file: the DRM file
+ * @unit: multipliyer of power of two exponent of desired unit
  *
  * Helper to iterate over GEM objects with a handle allocated in the specified
  * file.
  */
-void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, unsigned int unit)
 {
 	struct drm_gem_object *obj;
 	struct drm_memory_stats status = {};
@@ -967,7 +971,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 	}
 	spin_unlock(&file->table_lock);
 
-	drm_print_memory_stats(p, &status, supported_status, "memory");
+	drm_print_memory_stats(p, &status, supported_status, "memory", unit);
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2a0e3529598b..cd1198151744 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1067,7 +1067,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, 0);
 }
 
 static const struct file_operations fops = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 93d5f5538c0b..79c08cee3e9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -563,7 +563,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, 1);
 }
 
 static const struct file_operations panfrost_drm_driver_fops = {
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 010239392adf..21a3b022dd63 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -466,9 +466,10 @@ enum drm_gem_object_status;
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-			    const char *region);
+			    const char *region,
+			    unsigned int unit);
 
-void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, unsigned int unit);
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
-- 
2.42.0

