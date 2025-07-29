Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8DB151C0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 18:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF4710E3FB;
	Tue, 29 Jul 2025 16:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lRiyWPBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A6410E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 16:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753808230;
 bh=8kamcXWYRvudyawL/GVRfmUBsCYE8FhJJMXJIfPKUBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lRiyWPBIkgUBj0HnSFkGceqVvZ4hIYqi5eCLutw5vEz1AGbvayY07KmjCqW6l/sN7
 njFjdqofm1HwjxmiRH/bS6uSjyg6seeq9vSfgKUkClfAruxxf7+86tnWJriWOiwsId
 PtQk9H5LXxmYIRBCHRFsCtcMAe18HU/jN5V6xQeEnJ3Caidfd2vZFWJWY62b/63TXv
 hgvyHr+hsFRb02nOFNCcx92rbSSf4EKuB5OPiAoOTPLo031NtliGsyWjRicZgXnZ07
 Wzjh/qVeZ0Ti3nYppm3HbOrlwJd4REuDf39yF8iNqbQmXEkVmDvSy9nuFNxuG47Lbf
 fu7Gows1Q8Nlw==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e802:5400:c944:7b00:6281:94b5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BA4917E15A8;
 Tue, 29 Jul 2025 18:57:10 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, marius.vlad@collabora.com
Subject: [PATCH v2 2/2] drm: Propagate connector status change
Date: Tue, 29 Jul 2025 19:57:08 +0300
Message-ID: <20250729165708.9947-3-marius.vlad@collabora.com>
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

On the HPD (Hot Plug Detect) path this change makes use of the connector
status to notify all connectors, rather than just first one found that
suffered a status change.

Similarly on the polling side, this also takes into consideration
sending per-connector udev hot plug events.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 761766181e99..52761ca34460 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -854,8 +854,14 @@ static void output_poll_execute(struct work_struct *work)
 	mutex_unlock(&dev->mode_config.mutex);
 
 out:
-	if (changed)
-		drm_kms_helper_hotplug_event(dev);
+	if (changed) {
+		drm_connector_list_iter_begin(dev, &conn_iter);
+		drm_for_each_connector_iter(connector, &conn_iter) {
+			if (connector->status_changed)
+				drm_kms_helper_connector_hotplug_event(connector);
+		}
+		drm_connector_list_iter_end(&conn_iter);
+	}
 
 	if (repoll)
 		schedule_delayed_work(delayed_work, DRM_OUTPUT_POLL_PERIOD);
@@ -1118,10 +1124,16 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 	drm_connector_list_iter_end(&conn_iter);
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (changed == 1)
+	if (changed == 1) {
 		drm_kms_helper_connector_hotplug_event(first_changed_connector);
-	else if (changed > 0)
-		drm_kms_helper_hotplug_event(dev);
+	} else if (changed > 0) {
+		drm_connector_list_iter_begin(dev, &conn_iter);
+		drm_for_each_connector_iter(connector, &conn_iter) {
+			if (connector->status_changed)
+				drm_kms_helper_connector_hotplug_event(connector);
+		}
+		drm_connector_list_iter_end(&conn_iter);
+	}
 
 	if (first_changed_connector)
 		drm_connector_put(first_changed_connector);
-- 
2.47.2

