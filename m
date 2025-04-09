Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203CA82493
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 14:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D8F10E0A5;
	Wed,  9 Apr 2025 12:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qKackW6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEB910E0A5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 12:23:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2DFCAA49912;
 Wed,  9 Apr 2025 12:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB69C4CEE3;
 Wed,  9 Apr 2025 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744201408;
 bh=vxHQZ3DXPVolZSGM5QSjA4upyIcrsxp7pynHAqIHr2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKackW6x79hPogCNQE9yr6P14+tltBlYVB1j2uguSKJ17jueb85dYfbq+jg4O3rbT
 ldxrcX/DkfWG9/6dyzVegmnouE/jELg6PhDzN1DYwUsCkWB6WaB4KuNsXNbzCinS3H
 mCtQm5y14l2f21Qo4/ZuMf55bdZy8TUwjYayioNuL87Wqg+eIFemia4s4EzCtTM6sD
 zyzXFAV1FoHCs9mk7idgc36MiD1XJgmWIblYLsL1ntzlKfxvM504YkzKPGLRTaq0We
 khbKHoev09931Z/Hg5SIb6r2Yka7XsQYxNB7dl6xJHwXwnXIcqm593joLOjCfTcfnG
 eg9TcVAC0w2Fg==
From: Arnd Bergmann <arnd@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alessio Belle <alessio.belle@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] drm/imagination: avoid unused-const-variable warning
Date: Wed,  9 Apr 2025 14:22:53 +0200
Message-Id: <20250409122314.2848028-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122131.2766719-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_DEBUG_FS is disabled, the stid_fmts[] array is not referenced
anywhere, causing a W=1 warning with gcc:

In file included from drivers/gpu/drm/imagination/pvr_fw_trace.c:7:
drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h:75:39: error: 'stid_fmts' defined but not used [-Werror=unused-const-variable=]
   75 | static const struct rogue_km_stid_fmt stid_fmts[] = {
      |                                       ^~~~~~~~~

Rather than adding more #ifdef blocks, address this by changing the
existing #ifdef into equivalent IS_ENABLED() checks so gcc can see
where the symbol is used but still eliminate it from the object file.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imagination/pvr_fw_trace.c | 8 ++++----
 drivers/gpu/drm/imagination/pvr_fw_trace.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index 5dbb636d7d4f..93269299d6a4 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -122,8 +122,6 @@ void pvr_fw_trace_fini(struct pvr_device *pvr_dev)
 	pvr_fw_object_unmap_and_destroy(fw_trace->tracebuf_ctrl_obj);
 }
 
-#if defined(CONFIG_DEBUG_FS)
-
 /**
  * update_logtype() - Send KCCB command to trigger FW to update logtype
  * @pvr_dev: Target PowerVR device
@@ -447,7 +445,7 @@ static const struct file_operations pvr_fw_trace_fops = {
 void
 pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask, u32 new_mask)
 {
-	if (old_mask != new_mask)
+	if (IS_ENABLED(CONFIG_DEBUG_FS) && old_mask != new_mask)
 		update_logtype(pvr_dev, new_mask);
 }
 
@@ -457,6 +455,9 @@ pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
 	struct pvr_fw_trace *fw_trace = &pvr_dev->fw_dev.fw_trace;
 	u32 thread_nr;
 
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
+		return;
+
 	static_assert(ARRAY_SIZE(fw_trace->buffers) <= 10,
 		      "The filename buffer is only large enough for a single-digit thread count");
 
@@ -469,4 +470,3 @@ pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir)
 				    &pvr_fw_trace_fops);
 	}
 }
-#endif
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.h b/drivers/gpu/drm/imagination/pvr_fw_trace.h
index 0074d2b18da0..1d0ef937427a 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.h
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.h
@@ -65,7 +65,6 @@ struct pvr_fw_trace {
 int pvr_fw_trace_init(struct pvr_device *pvr_dev);
 void pvr_fw_trace_fini(struct pvr_device *pvr_dev);
 
-#if defined(CONFIG_DEBUG_FS)
 /* Forward declaration from <linux/dcache.h>. */
 struct dentry;
 
@@ -73,6 +72,5 @@ void pvr_fw_trace_mask_update(struct pvr_device *pvr_dev, u32 old_mask,
 			      u32 new_mask);
 
 void pvr_fw_trace_debugfs_init(struct pvr_device *pvr_dev, struct dentry *dir);
-#endif /* defined(CONFIG_DEBUG_FS) */
 
 #endif /* PVR_FW_TRACE_H */
-- 
2.39.5

