Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D37792D93
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 20:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473CA10E3FA;
	Tue,  5 Sep 2023 18:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358D910E1A7;
 Tue,  5 Sep 2023 18:45:47 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F0B36607296;
 Tue,  5 Sep 2023 19:45:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693939545;
 bh=8W3x2GM4aZpUf1aH5bfmuiuyCVBlSin1LhFM+JEzsek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q/+KFXXqyQVjPW30DuDcdWKy22MeFyMG0iPQtuzTuea0ZTohoGNMrkvrdH0w9ZMr0
 7JWg/Ervd6qs2DTIV4jhky5OqRxNP3KAlRDu4gFvO1/Gb8IDlyMZIK5Er9v7UvLWtf
 2g67T7TP9XQ+oOhKGSwiPLuCmeRuFtUm/BhgjZg8K/CjYw4AxayHQhyNCQUPmqbUa+
 ZNXFTACTCGXKFaxnUsGf0H0kAgm4z4HR2rvNmZryPZ3Bxn32Axmm7Vw7o5yjx9QmJ2
 t0HEGF7liHMJNcndLrO4BEBSoHAbtU1aWfMV5EqW+vEjEhTQKMGi13iXrBT3xgSWTb
 8PcxMyVB31Jdw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v3 5/8] drm/panfrost: Add fdinfo support for memory stats
Date: Tue,  5 Sep 2023 19:45:21 +0100
Message-ID: <20230905184533.959171-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905184533.959171-1-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
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

A new DRM GEM object function is added so that drm_show_memory_stats can
provide more accurate memory usage numbers.

Ideally, in panfrost_gem_status, the BO's purgeable flag would be checked
after locking the driver's shrinker mutex, but drm_show_memory_stats takes
over the drm file's object handle database spinlock, so there's potential
for a race condition here.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 94787f4aee27..3de7e821ef23 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -574,6 +574,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
 
+	drm_show_memory_stats(p, file);
 }
 
 static const struct file_operations panfrost_drm_driver_fops = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 3c812fbd126f..7d8f83d20539 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -195,6 +195,19 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	return drm_gem_shmem_pin(&bo->base);
 }
 
+static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	enum drm_gem_object_status res = 0;
+
+	res |= (bo->base.madv == PANFROST_MADV_DONTNEED) ?
+		DRM_GEM_OBJECT_PURGEABLE : 0;
+
+	res |= (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;
+
+	return res;
+}
+
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
@@ -206,6 +219,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
+	.status = panfrost_gem_status,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
-- 
2.42.0

