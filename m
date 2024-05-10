Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790968C25AA
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E24310EA28;
	Fri, 10 May 2024 13:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUHyJHGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991BA10EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715347613; x=1746883613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DQTcuRJ6jV+KHtqCB34fEC2WDqRthotEQh0eyz/EF8M=;
 b=TUHyJHGIwaniR3nxAIbzEs5GzQ3UggRRrcNeHGFXoNx6/iPRUfc7kD2E
 Ui8UbhUEyG8EqtSkmWjXR8GfOXx++A27B+iPjuS09xn2VftYCQZKYgX1X
 e6s0KjBeBWuvaAEGq0cV/FkRH1al0Nn4gvWpeMoNF/Udda1bDVYvVdxn8
 YUD6fY08530PrA6bAV/cT1wj4Blsh5SAZToOGI3YHJuUQeAyUhFAHky1x
 787kDnmvPpqKsIds+SH08HFC6vM9/pO0M6UbTnWzQJrqby2b7kF/hObLX
 qWQzDH28/EO4ALoASfRhb97M0ZgMbSe80MfMLfRcrrJ4E6ZE3oF7ChOh+ g==;
X-CSE-ConnectionGUID: HSRKH5PTS4uEGCmC49tpzA==
X-CSE-MsgGUID: xTR9qUXUQwijefIhsbE1PA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11489602"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:52 -0700
X-CSE-ConnectionGUID: G6i9VGmWQdWNsv+qrGnAxg==
X-CSE-MsgGUID: H/U/M+ufSq6ZU5gbYQ8jUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67089443"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, virtualization@lists.linux.dev
Subject: [RESEND 6/6] drm/virtio: switch to struct drm_edid
Date: Fri, 10 May 2024 16:26:09 +0300
Message-Id: <ed6e76a9e94816789ca9caf8775d6a6156877496.1715347488.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715347488.git.jani.nikula@intel.com>
References: <cover.1715347488.git.jani.nikula@intel.com>
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

