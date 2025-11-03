Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFDC2D85D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DEA10E4B3;
	Mon,  3 Nov 2025 17:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XmcrDZHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F0E10E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762191960;
 bh=yxPPNdLuBpu5VHtj2V0Tc1GS3sAseQxyJz6E8RFBUqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XmcrDZHHvwMTTaj7Ea2diy6xHGvBdP9gnkW92IO2SVaOLlsY4DmCOGJScRSnY1E1v
 ImjgZCeGHkeJdz1yHzTuz9cnh+J4GbOpr/opLXELmcYGOXFdalSJGXOxFxoOcUyXkI
 P+1Piy+IO+34FPfjbAUTmh6VDb1jpw3mRzVHtVrbLfeqlon5NpR04VjxYHRwA9bkcI
 EfFNPbdTbnPA4YoDW3jZuzUduRV/G+d9P1R/3wyBXApYjZ6Pre/Pp9wGzHlsAc9OmS
 TFgnL/cJGSKrNXe6//reO38Iep3Ro+Tn/69ntXEyFt798zpTqGxP1y2VZQ+fKFxHD5
 d9H1dsA1y0bIg==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e41c:5800:b6c0:b468:93e5:9b17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B517917E13BC;
 Mon,  3 Nov 2025 18:45:59 +0100 (CET)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, louis.chauvet@bootlin.com,
 daniel.stone@collabora.com
Subject: [PATCH v4 2/3] drm: Propagate connector status change
Date: Mon,  3 Nov 2025 19:45:56 +0200
Message-ID: <20251103174558.7709-3-marius.vlad@collabora.com>
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

On the HPD (Hot Plug Detect) path this change makes use of the connector
status to notify all connectors, rather than just first one found that
suffered a status change.

Similarly on the polling side, this also takes into consideration
sending per-connector udev hotplug events.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index f0474368e98d..63960f589b6b 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -861,8 +861,14 @@ static void output_poll_execute(struct work_struct *work)
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
@@ -1124,10 +1130,16 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
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

