Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5977551FA0B
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A0710E95E;
	Mon,  9 May 2022 10:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4710410E939
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:36:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE7471FA09;
 Mon,  9 May 2022 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652092558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+v9vinlSIeauqhOXjOt6brO1UFpbKgS7G2s7B9ucXg=;
 b=LGbCaRKcogQb7WYDsXpsMmdDjbEeobQyPd+38PjXEoCVeFY7Fvdkrb6/y7W/KRBy08lWBL
 hb9qQKDMuzPPEg/Kp1mjYrmTey5yM4P8RYBAAIa/EosIXDNt6KH7wArmW3k6Cqgtkz2wT1
 rGKZ1uBN+ClE35ewiAbmS73bVaGxPr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652092558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+v9vinlSIeauqhOXjOt6brO1UFpbKgS7G2s7B9ucXg=;
 b=hlFUhbMHDpUIbyKaOtNB/qTBKuQJqJw5j0lg1YJkxQV6ik+U0cy/5wepKHWhFn11ZnVzs/
 IJ4PVAOkL10/xiDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B14EA13B12;
 Mon,  9 May 2022 10:35:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WP1/Ko7ueGJ9AgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 10:35:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/7] drm/mgag200: Implement connector's get_modes with helper
Date: Mon,  9 May 2022 12:35:50 +0200
Message-Id: <20220509103554.11996-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509103554.11996-1-tzimmermann@suse.de>
References: <20220509103554.11996-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide drm_connector_helper_get_modes_from_ddc() to implement the
connector's get_modes callback. The new helper updates the connector
from DDC-provided EDID data.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_probe_helper.c     | 33 ++++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 17 ++++---------
 include/drm/drm_probe_helper.h         |  2 ++
 3 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..916bfb30ca19 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -964,3 +964,36 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 	return changed;
 }
 EXPORT_SYMBOL(drm_helper_hpd_irq_event);
+
+/**
+ * drm_connector_helper_get_modes_from_ddc - Updates the connector's EDID
+ *                                           property from the connector's
+ *                                           DDC channel
+ * @connector: The connector
+ *
+ * Returns:
+ * The number of detected display modes.
+ *
+ * Uses a connector's DDC channel to retrieve EDID data and update the
+ * connector's EDID property and display modes. Drivers can use this
+ * function to implement struct &drm_connector_helper_funcs.get_modes
+ * for connectors with a DDC channel.
+ */
+int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
+{
+	struct edid *edid;
+	int ret = 0;
+
+	if (!connector->ddc)
+		return 0;
+
+	edid = drm_get_edid(connector, connector->ddc);
+	if (edid) {
+		drm_connector_update_edid_property(connector, edid);
+		ret = drm_add_edid_modes(connector, edid);
+		kfree(edid);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 88c095184308..e09814528f04 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -665,26 +665,17 @@ static void mgag200_disable_display(struct mga_device *mdev)
  * Connector
  */
 
-static int mga_vga_get_modes(struct drm_connector *connector)
+static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct mga_device *mdev = to_mga_device(connector->dev);
-	struct mga_connector *mga_connector = to_mga_connector(connector);
-	struct edid *edid;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
 	mutex_lock(&mdev->rmmio_lock);
-
-	edid = drm_get_edid(connector, &mga_connector->i2c->adapter);
-	if (edid) {
-		drm_connector_update_edid_property(connector, edid);
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
-
+	ret = drm_connector_helper_get_modes_from_ddc(connector);
 	mutex_unlock(&mdev->rmmio_lock);
 
 	return ret;
@@ -804,7 +795,7 @@ static void mga_connector_destroy(struct drm_connector *connector)
 }
 
 static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
-	.get_modes  = mga_vga_get_modes,
+	.get_modes  = mgag200_vga_connector_helper_get_modes,
 	.mode_valid = mga_vga_mode_valid,
 };
 
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 48300aa6ca71..c80cab7a53b7 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -26,4 +26,6 @@ void drm_kms_helper_poll_disable(struct drm_device *dev);
 void drm_kms_helper_poll_enable(struct drm_device *dev);
 bool drm_kms_helper_is_poll_worker(void);
 
+int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
+
 #endif
-- 
2.36.0

