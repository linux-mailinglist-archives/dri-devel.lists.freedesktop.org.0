Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A98A6C2B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA83112C8B;
	Tue, 16 Apr 2024 13:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJIU8Y9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EA3112C8D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273824; x=1744809824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DQTcuRJ6jV+KHtqCB34fEC2WDqRthotEQh0eyz/EF8M=;
 b=RJIU8Y9eM7OiNReXOh+O8823fNojPUXb5nW4wM7tw97S6CMqHnz60HQB
 D9TkIO9r/cEkr+a6meWWnbehNTkRfkhiuxvVDXIjvdkMXgOXQBO+4AaBF
 7euN8CGA7rtcnTRC3E9F0Ugc+NXoRNZx5Ul8tcWToK+OxIyi4HMh2eyjB
 bkrdRr3YkgSG2yNEhC7Dkw7f7s6e+ovgM/aQqsnVlJhKAtSmj5VhZeq+f
 M29BT9vpULJvKRnZosJCZczRqKEmnojafAa/6v/9zsy+HAMaEOZzhFmib
 8nJMmq6yY+s9GZIgECwf6jsvVVYLDtGvZp1AeHBdolRP+RvzFQ37XlPQk g==;
X-CSE-ConnectionGUID: lOv0N1+vTcSyfhhek12LNA==
X-CSE-MsgGUID: fEt5oXkRTXedB52UycrZOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20131384"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="20131384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:37 -0700
X-CSE-ConnectionGUID: 1xc1femGRAePKAA0l8lx+A==
X-CSE-MsgGUID: WqLxD0ocTQGn6nwSGdbxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27055436"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, virtualization@lists.linux.dev
Subject: [PATCH 12/15] drm/virtio: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:26 +0300
Message-Id: <086654def37e8d45ea110e3a228fc42f2066e123.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: virtualization@lists.linux.dev
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 10 ++++------
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 12 ++++++------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index ad924a8502e9..64baf2f22d9f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -164,11 +164,9 @@ static int virtio_gpu_conn_get_modes(struct drm_connector *connector)
 	struct drm_display_mode *mode = NULL;
 	int count, width, height;
 
-	if (output->edid) {
-		count = drm_add_edid_modes(connector, output->edid);
-		if (count)
-			return count;
-	}
+	count = drm_edid_connector_add_modes(connector);
+	if (count)
+		return count;
 
 	width  = le32_to_cpu(output->info.r.width);
 	height = le32_to_cpu(output->info.r.height);
@@ -369,5 +367,5 @@ void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
 		return;
 
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
-		kfree(vgdev->outputs[i].edid);
+		drm_edid_free(vgdev->outputs[i].drm_edid);
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index bb7d86a0c6a1..64c236169db8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -179,7 +179,7 @@ struct virtio_gpu_output {
 	struct drm_encoder enc;
 	struct virtio_gpu_display_one info;
 	struct virtio_gpu_update_cursor cursor;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int cur_x;
 	int cur_y;
 	bool needs_modeset;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1a00c0c25a7..0d3d0d09f39b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -741,21 +741,21 @@ static void virtio_gpu_cmd_get_edid_cb(struct virtio_gpu_device *vgdev,
 		(struct virtio_gpu_resp_edid *)vbuf->resp_buf;
 	uint32_t scanout = le32_to_cpu(cmd->scanout);
 	struct virtio_gpu_output *output;
-	struct edid *new_edid, *old_edid;
+	const struct drm_edid *new_edid, *old_edid;
 
 	if (scanout >= vgdev->num_scanouts)
 		return;
 	output = vgdev->outputs + scanout;
 
-	new_edid = drm_do_get_edid(&output->conn, virtio_get_edid_block, resp);
-	drm_connector_update_edid_property(&output->conn, new_edid);
+	new_edid = drm_edid_read_custom(&output->conn, virtio_get_edid_block, resp);
+	drm_edid_connector_update(&output->conn, new_edid);
 
 	spin_lock(&vgdev->display_info_lock);
-	old_edid = output->edid;
-	output->edid = new_edid;
+	old_edid = output->drm_edid;
+	output->drm_edid = new_edid;
 	spin_unlock(&vgdev->display_info_lock);
 
-	kfree(old_edid);
+	drm_edid_free(old_edid);
 	wake_up(&vgdev->resp_wq);
 }
 
-- 
2.39.2

