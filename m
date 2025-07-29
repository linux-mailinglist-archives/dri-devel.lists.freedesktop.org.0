Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819EB151BF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 18:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7262C10E05D;
	Tue, 29 Jul 2025 16:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="a6xXR7NL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9F210E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753808230;
 bh=a6DqsNTmAwg7gmiydJY5ed2JpYUXiPYxMl4VTX1hYc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a6xXR7NLdPTN2faWB5n/loANb0HlQb6jo/VYKQ4CGZHZbQh89l0FFeWP6nKHc2xvS
 bkyeuTs1Gph56xHxVWLzFyAUQoifU4+HFQ+fta1UdTo7PnL9wga4E+kf3fPfvVWZoI
 MDyzZH/Uno2yHtKraga9mvH6WE+NL3yJYzWrckXd6eb/G+edjPZnklsumoMpdsrXK8
 A0Doe7QbCTJGHOfcrhppd9SXzdRD14T+6s5sCw9PRBIgkULbd93ABeJOf/pM+ctA84
 x13QRDSepUYAQhUXDiQoZjf9DUvA8HK2/FAEWhuh/cM68kzN/xhUqt1y+2HoxfZeGt
 H9nsqC3ecz+tg==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e802:5400:c944:7b00:6281:94b5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F2F8E17E1572;
 Tue, 29 Jul 2025 18:57:09 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, marius.vlad@collabora.com
Subject: [PATCH v2 1/2] drm: Introduce a new connector status
Date: Tue, 29 Jul 2025 19:57:07 +0300
Message-ID: <20250729165708.9947-2-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250729165708.9947-1-marius.vlad@collabora.com>
References: <20250729165708.9947-1-marius.vlad@collabora.com>
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

This patch introduces a new boolean variable used to track connector's
connect/disconnect status and it is being used on both polling and
the HPD (Hot Plug Detect) paths.

A subsequent patch would make use of this connector status to propagate
per-connector udev hot plug events. This allows user-space to receive
the connector's ID, rather than having a generic hot-plug event for all
connectors, or in the HPD path, just the first one found with a
connection status change.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_connector.c    |  1 +
 drivers/gpu/drm/drm_probe_helper.c | 12 ++++++++++++
 drivers/gpu/drm/drm_sysfs.c        |  1 +
 include/drm/drm_connector.h        |  3 +++
 4 files changed, 17 insertions(+)

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
index 6b3541159c0f..761766181e99 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -628,6 +628,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 			mod_delayed_work(system_wq,
 					 &dev->mode_config.output_poll_work,
 					 0);
+		connector->status_changed = true;
 	}
 
 	/*
@@ -731,6 +732,15 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
  */
 void drm_kms_helper_hotplug_event(struct drm_device *dev)
 {
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		connector->status_changed = false;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
 	drm_sysfs_hotplug_event(dev);
 	drm_client_dev_hotplug(dev);
 }
@@ -747,6 +757,7 @@ void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 
+	connector->status_changed = false;
 	drm_sysfs_connector_hotplug_event(connector);
 	drm_client_dev_hotplug(dev);
 }
@@ -1041,6 +1052,7 @@ bool drm_connector_helper_hpd_irq_event(struct drm_connector *connector)
 	mutex_unlock(&dev->mode_config.mutex);
 
 	if (changed) {
+		connector->status_changed = true;
 		drm_kms_helper_connector_hotplug_event(connector);
 		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Sent hotplug event\n",
 			    connector->base.id,
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6f..77f880654d6a 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -196,6 +196,7 @@ static ssize_t status_store(struct device *device,
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

