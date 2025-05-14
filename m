Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECD0AB76E0
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75E210E733;
	Wed, 14 May 2025 20:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jfgO5z6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1971A10E730;
 Wed, 14 May 2025 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g6DLwgKl+YRJP7IBPHvI2IdNgrmAl4LlghAt2eQ7YQo=; b=jfgO5z6RKlmdCBe3RZIhm/6P8U
 +i9QoJT82deU/g9lpIvwGnWzrJkc5/dRIJX2e8R7FymGI+XZ7ai/f4Y1FCzGz5HMt7tdwgO9N8I7u
 FKMrWqXD/1ze9pD6m2bWmLUwC/JxB1H2Iq5T9NUVjNMljIxxHXE5eXXlTDM7S9kwjEVSngNYa7sk7
 +eQoM9voFWpgfYKe4gb5pu+aPqFqXeYnLZBCSxQJM5a8xmcGn/WkFlbe9lMmf0YRv84eNu4ptxR47
 i6PhHuYJOGiIREuF4ThjbByL/g/ByHCy6lreWhDb9m9370gemiHty8hFBBSikwlL48uKYjv3UxlBU
 4IwohRrQ==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFIXG-008Klg-31; Wed, 14 May 2025 22:22:51 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v3 13/14] drm/amd/display: add drm_edid to dc_sink
Date: Wed, 14 May 2025 17:19:20 -0300
Message-ID: <20250514202130.291324-14-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514202130.291324-1-mwen@igalia.com>
References: <20250514202130.291324-1-mwen@igalia.com>
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

Add Linux opaque object to dc_sink for storing edid data cross driver,
drm_edid. Also include the Linux call to free this object, the
drm_edid_free()

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c | 6 ++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h | 1 +
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c   | 3 +++
 drivers/gpu/drm/amd/display/dc/dc.h             | 3 +++
 include/drm/drm_edid.h                          | 4 ++--
 5 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
index a90545b176cc..9e86dc15557b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 #include "amdgpu_dm/dc_edid.h"
 #include "dc.h"
+#include <drm/drm_edid.h>
 
 bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
 			  struct dc_sink *current_sink)
@@ -25,3 +26,8 @@ void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
 	memmove(dc_sink->dc_edid.raw_edid, edid, len);
 	dc_sink->dc_edid.length = len;
 }
+
+void dc_edid_sink_edid_free(struct dc_sink *sink)
+{
+	drm_edid_free(sink->drm_edid);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
index f42cd5bbc730..2c76768be459 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
@@ -9,5 +9,6 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
 			  struct dc_sink *current_sink);
 void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
 			     const void *edid, int len);
+void dc_edid_sink_edid_free(struct dc_sink *sink);
 
 #endif /* __DC_EDID_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
index 455fa5dd1420..3774a3245506 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
@@ -26,6 +26,7 @@
 #include "dm_services.h"
 #include "dm_helpers.h"
 #include "core_types.h"
+#include "dc_edid.h"
 
 /*******************************************************************************
  * Private functions
@@ -65,6 +66,8 @@ void dc_sink_retain(struct dc_sink *sink)
 static void dc_sink_free(struct kref *kref)
 {
 	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
+
+	dc_edid_sink_edid_free(sink);
 	kfree(sink->dc_container_id);
 	kfree(sink);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index b279ab16bf69..e94ed1cc294b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -46,6 +46,8 @@
 
 #include "dmub/inc/dmub_cmd.h"
 
+#include <drm/drm_edid.h>
+
 struct abm_save_restore;
 
 /* forward declaration */
@@ -2433,6 +2435,7 @@ struct scdc_caps {
 struct dc_sink {
 	enum signal_type sink_signal;
 	struct dc_edid dc_edid; /* raw edid */
+	const struct drm_edid *drm_edid; /* Linux DRM edid*/
 	struct dc_edid_caps edid_caps; /* parse display caps */
 	struct dc_container_id *dc_container_id;
 	uint32_t dongle_max_pix_clk;
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index e7a9a4928b97..8617d2285f38 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -469,8 +469,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *edid);
 int drm_edid_connector_add_modes(struct drm_connector *connector);
 bool drm_edid_is_digital(const struct drm_edid *drm_edid);
-bool drm_edid_eq(const struct drm_edid *drm_edid_first,
-			 const struct drm_edid *drm_edid_second);
+bool drm_edid_eq(const struct drm_edid *drm_edid_1,
+		 const struct drm_edid *drm_edid_2);
 void drm_edid_get_product_id(const struct drm_edid *drm_edid,
 			     struct drm_edid_product_id *id);
 void drm_edid_print_product_id(struct drm_printer *p,
-- 
2.47.2

