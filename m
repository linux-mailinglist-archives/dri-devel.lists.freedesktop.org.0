Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB7AEB8B0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B3810EA20;
	Fri, 27 Jun 2025 13:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UtyzgEtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6317F10EA20
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751030271;
 bh=NmpkkxqqbUBGcwfPSZoAxnZ93WkZ9Hra12YGt/HlKKo=;
 h=From:To:Cc:Subject:Date:From;
 b=UtyzgEtM8O9aoymhTJw97LmBBtiCqUPcOEKaRuivdv8q8EzFU1fwCtai9507KlPMr
 9+ZA5Ka21FgyPNcOmv/1um9mYdE9cdFpGWV5l1twrexvbNUj3+Xvz4G9BzmL7APHTz
 9AtfAJT2QeClfnwjV2xBrSG4fGIeEmS7E+CFMeqjA6aCW7C5lR3BLH+oalTSlxcjpE
 vjFX2VXHtu2d+4H33JzgDufdFXSawNn9XoWUrGdAS3kgSoSTN6FafVwnuCPOF3hjci
 C9tYwesurvAZlZ3/sw/zQDLFteHXIEkK5y1jDxD1VMKQUdxDOowPEXwio5UfKb9XqZ
 iEcSRVA67CPuA==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:ea06:fa00:f140:c6e:a9fd:8972])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A685F17E0563;
 Fri, 27 Jun 2025 15:17:51 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 marius.vlad@collabora.com
Subject: [PATCH] drm: Pass down CONNECTOR ID for user-space to use
Date: Fri, 27 Jun 2025 16:17:51 +0300
Message-ID: <20250627131751.2004-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
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

Manually setting/forcing the connector status in sysfs does not
propagate the CONNECTOR ID. For drivers that use polling, including
manually setting it up with sysfs this would similarly to the HDP IRQ
path which can pass it through drm_connector_helper_hpd_irq_event().

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_sysfs.c        |  1 +
 include/drm/drm_connector.h        |  8 ++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 6b3541159c0f..b472bfb43c17 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -843,9 +843,33 @@ static void output_poll_execute(struct work_struct *work)
 	mutex_unlock(&dev->mode_config.mutex);
 
 out:
-	if (changed)
-		drm_kms_helper_hotplug_event(dev);
+	if (changed) {
+		struct drm_connector *first_changed_connector = NULL;
+		if (!mutex_trylock(&dev->mode_config.mutex)) {
+			repoll = true;
+			goto repoll;
+		}
 
+		drm_connector_list_iter_begin(dev, &conn_iter);
+		drm_for_each_connector_iter(connector, &conn_iter) {
+			if (connector->sysfs_hotplug) {
+				drm_connector_get(connector);
+				first_changed_connector = connector;
+				connector->sysfs_hotplug = false;
+				break;
+			}
+		}
+		drm_connector_list_iter_end(&conn_iter);
+		mutex_unlock(&dev->mode_config.mutex);
+
+		if (first_changed_connector) {
+			drm_sysfs_connector_hotplug_event(connector);
+			drm_connector_put(first_changed_connector);
+		} else {
+			drm_kms_helper_hotplug_event(dev);
+		}
+	}
+repoll:
 	if (repoll)
 		schedule_delayed_work(delayed_work, DRM_OUTPUT_POLL_PERIOD);
 }
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6f..c38b7a2accee 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -196,6 +196,7 @@ static ssize_t status_store(struct device *device,
 		return ret;
 
 	old_force = connector->force;
+	connector->sysfs_hotplug = true;
 
 	if (sysfs_streq(buf, "detect"))
 		connector->force = 0;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 137773dd138e..7a8344814219 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2125,6 +2125,14 @@ struct drm_connector {
 	 */
 	uint8_t polled;
 
+	/**
+	 * @sysfs_hotplug:
+	 *
+	 * Set in by sysfs connector status to propagate CONNECTOR_ID to udev
+	 * and further down the stack.
+	 */
+	bool sysfs_hotplug;
+
 	/**
 	 * @dpms: Current dpms state. For legacy drivers the
 	 * &drm_connector_funcs.dpms callback must update this. For atomic
-- 
2.47.2

