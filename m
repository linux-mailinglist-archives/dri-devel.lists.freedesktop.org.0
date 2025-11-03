Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74AC2D860
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6008210E4B5;
	Mon,  3 Nov 2025 17:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b6S0Ddtz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0A010E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762191959;
 bh=dzT7hrvOSfswgyb6SXADatCs2X4S0yxUtyX9vkpcFk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b6S0DdtzwRRVR/jBA2aaXiAd/jAW38UL5h6sicy0Rh9XehdoaZjWgI+pYArcg7/yE
 sNqNj4uE/dq5786jwosqzx1r+YX+Y/6PE7fNZ7a9WZMZgGIoeiwx8rSzDP1eq2VWbj
 Yuj9/nGT3IYwEC2tG8lEMfqEsMZiKkTKakRXZ8Pbrd+iH5qvgeJihJ+wDnYAZDg5rk
 ifIiL8D70tSTCwbd0EWKni1Ru8cBuGETdC2+Y/sjCbHKEJmvFF/UptuziArJv059Ki
 SnW7v9cOYgnyejDcZYSrt4+w7Uv9BrocutLKm20cV56hLThjJeNH6LcV0UUsKiKbqW
 +N6wKCUQxB8cQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e41c:5800:b6c0:b468:93e5:9b17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3378817E1396;
 Mon,  3 Nov 2025 18:45:59 +0100 (CET)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, louis.chauvet@bootlin.com,
 daniel.stone@collabora.com
Subject: [PATCH v4 1/3] drm: Introduce a new connector status
Date: Mon,  3 Nov 2025 19:45:55 +0200
Message-ID: <20251103174558.7709-2-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103174558.7709-1-marius.vlad@collabora.com>
References: <20251103174558.7709-1-marius.vlad@collabora.com>
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

Introduce a new boolean variable used to track connector's
connect/disconnect status and it is being used on both polling and the
HPD (Hot Plug Detect) paths.

A subsequent change would make use of this connector status to propagate
per-connector udev hotplug events.

The connector status is set in the drm_connector_funcs.fill_modes and
cleared out when firing out KMS uevents.

Allows user-space to receive the connector's ID, rather than having a
generic hot-plug event for all connectors, or in the HPD path, just the
first one found with a connection status change.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_connector.c    |  1 +
 drivers/gpu/drm/drm_probe_helper.c | 17 +++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c        |  1 +
 include/drm/drm_connector.h        |  3 +++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..3c6628ee3096 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -274,6 +274,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 
 	/* provide ddc symlink in sysfs */
 	connector->ddc = ddc;
+	connector->status_changed = false;
 
 	INIT_LIST_HEAD(&connector->head);
 	INIT_LIST_HEAD(&connector->global_connector_list_entry);
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 09b12c30df69..f0474368e98d 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -629,6 +629,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 			mod_delayed_work(system_wq,
 					 &dev->mode_config.output_poll_work,
 					 0);
+
+		connector->status_changed = true;
 	}
 
 	/*
@@ -732,6 +734,17 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
  */
 void drm_kms_helper_hotplug_event(struct drm_device *dev)
 {
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	mutex_lock(&dev->mode_config.mutex);
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		connector->status_changed = false;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	mutex_unlock(&dev->mode_config.mutex);
+
 	drm_sysfs_hotplug_event(dev);
 	drm_client_dev_hotplug(dev);
 }
@@ -748,6 +761,10 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 
+	mutex_lock(&dev->mode_config.mutex);
+	connector->status_changed = false;
+	mutex_unlock(&dev->mode_config.mutex);
+
 	drm_sysfs_connector_hotplug_event(connector);
 	drm_client_dev_hotplug(dev);
 }
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index b01ffa4d6509..bd9161490116 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -199,6 +199,7 @@ static ssize_t status_store(struct device *device,
 		return ret;
 
 	old_force = connector->force;
+	connector->status_changed = true;
 
 	if (sysfs_streq(buf, "detect"))
 		connector->force = 0;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..e4310df3d55c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2146,6 +2146,9 @@ struct drm_connector {
 	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
 	enum drm_connector_force force;
 
+	/** @status_changed: if the old status doesn't match current connection status */
+	bool status_changed;
+
 	/**
 	 * @edid_override: Override EDID set via debugfs.
 	 *
-- 
2.47.2

