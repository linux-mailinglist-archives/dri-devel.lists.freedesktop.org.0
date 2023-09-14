Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4A7A112D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1727510E5A8;
	Thu, 14 Sep 2023 22:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1AA10E59E;
 Thu, 14 Sep 2023 22:39:39 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C2B956607354;
 Thu, 14 Sep 2023 23:39:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694731177;
 bh=Jdh25YtuAbKOt5fTW39+W92sC7niIc+e4Omx5zuGqvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PHV1oJSQdp+3NCc9+54Dp0eC/KFNnxVQ1/u888gp5xaXpxfvZiwYaH9eT69TJm6Vh
 IvyG660ohjgGImdvyiEbnpYypnK5vQH68VXBQEF/d35jzvqQL7v410xIo27VNEXFKa
 1N0KT+NuYC3vDPcIYrGAkKiCHwOmU6LmQG8NsjWJOpUsvEdyaY4WLgrHwpbm3dkjX+
 Fr35OEBv/qF8thd6rlRIiFl2x+MlzFdbSwGiCRucveY3t4+bJNelOyecJnAWaWMzgK
 kL5izQsw6i2kxU14F90mwQhizrAFUHtoCYHHHAfiNBPx2ehizu954uhxsnUiRo7t5q
 fCY6UxKKtqnhA==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v5 4/6] drm/drm_file: Add DRM obj's RSS reporting function for
 fdinfo
Date: Thu, 14 Sep 2023 23:38:42 +0100
Message-ID: <20230914223928.2374933-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230914223928.2374933-1-adrian.larumbe@collabora.com>
References: <20230914223928.2374933-1-adrian.larumbe@collabora.com>
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
 healych@amazon.com, Boris Brezillon <boris.brezillon@collabora.com>,
 kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some BO's might be mapped onto physical memory chunkwise and on demand,
like Panfrost's tiler heap. In this case, even though the
drm_gem_shmem_object page array might already be allocated, only a very
small fraction of the BO is currently backed by system memory, but
drm_show_memory_stats will then proceed to add its entire virtual size to
the file's total resident size regardless.

This led to very unrealistic RSS sizes being reckoned for Panfrost, where
said tiler heap buffer is initially allocated with a virtual size of 128
MiB, but only a small part of it will eventually be backed by system memory
after successive GPU page faults.

Provide a new DRM object generic function that would allow drivers to
return a more accurate RSS size for their BOs.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_file.c | 5 ++++-
 include/drm/drm_gem.h      | 9 +++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 883d83bc0e3d..762965e3d503 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -944,7 +944,10 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 		}
 
 		if (s & DRM_GEM_OBJECT_RESIDENT) {
-			status.resident += obj->size;
+			if (obj->funcs && obj->funcs->rss)
+				status.resident += obj->funcs->rss(obj);
+			else
+				status.resident += obj->size;
 		} else {
 			/* If already purged or not yet backed by pages, don't
 			 * count it as purgeable:
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bc9f6aa2f3fe..16364487fde9 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -208,6 +208,15 @@ struct drm_gem_object_funcs {
 	 */
 	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
 
+	/**
+	 * @rss:
+	 *
+	 * Return resident size of the object in physical memory.
+	 *
+	 * Called by drm_show_memory_stats().
+	 */
+	size_t (*rss)(struct drm_gem_object *obj);
+
 	/**
 	 * @vm_ops:
 	 *
-- 
2.42.0

