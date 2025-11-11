Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D95C4F052
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A521010E609;
	Tue, 11 Nov 2025 16:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GI4aWebf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3674610E342
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762878221;
 bh=QcroRCsKPQUNLSimvfX50q9hlYzV8OtKVAZWoOGr094=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GI4aWebf+leHacW9aZTWYCBHF+3xv7ZEDI6B76nERaFY2QFLQpgipuNM3fyzg+8mT
 cIBoixU7w73ed+omIQEOvBkNUfpVw0L212eyYjaqB9bkhe+O7BJCQNrKvwTZzyK6mu
 cEdSCNHDRKJzvVCaRDkKDTmb6wwNwzkWztfH6nIJimFwR2j7V01uVY7c2KAPmMvBmP
 b9CGmTHQG2wleXB1U8nHm9wJqigEbstwXgj1IHn+AzU+mRtEMS4DmPKKQphluFMC/F
 lNVptpW42SThvxcWDUTGhIn27oKUDrCi68RV1xHUZzTgvZxBZp2C8J3bqj1woJkb+m
 UDM0+dJ+M4ZjQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:eb0f:ad00:ce0:1b50:8618:f920])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 78C8B17E13B9;
 Tue, 11 Nov 2025 17:23:41 +0100 (CET)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, louis.chauvet@bootlin.com,
 daniel.stone@collabora.com
Subject: [PATCH 4/4] vkms: Pass the vkms connector as opposed to the vkms
 device
Date: Tue, 11 Nov 2025 18:23:38 +0200
Message-ID: <20251111162338.15141-5-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251111162338.15141-1-marius.vlad@collabora.com>
References: <20251111162338.15141-1-marius.vlad@collabora.com>
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

This way we can pass straight in the CONNECTOR ID.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c  | 2 +-
 drivers/gpu/drm/vkms/vkms_connector.c | 6 +++---
 drivers/gpu/drm/vkms/vkms_connector.h | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 2b0ca61da62e..709bcc8bebc1 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -560,7 +560,7 @@ static ssize_t connector_status_store(struct config_item *item,
 		vkms_config_connector_set_status(connector->config, status);
 
 		if (connector->dev->enabled && old_status != status)
-			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+			vkms_trigger_connector_hotplug(vkms_connector);
 	}
 
 	return (ssize_t)count;
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index b0a6b212d3f4..cad64eff72ea 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -88,9 +88,9 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 	return connector;
 }
 
-void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
+void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector)
 {
-	struct drm_device *dev = &vkmsdev->drm;
+	struct drm_connector *connector = &vkms_connector->base;
 
-	drm_kms_helper_hotplug_event(dev);
+	drm_kms_helper_connector_hotplug_event(connector);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index ed312f4eff3a..7cd76d01b10b 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -28,8 +28,8 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
- * @vkmsdev: VKMS device to update
+ * @vkms_connector: VKMS connector to update
  */
-void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+void vkms_trigger_connector_hotplug(struct vkms_connector *vkms_connector);
 
 #endif /* _VKMS_CONNECTOR_H_ */
-- 
2.47.2

