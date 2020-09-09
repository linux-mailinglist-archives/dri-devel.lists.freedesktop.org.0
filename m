Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23132628FE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC506EA4F;
	Wed,  9 Sep 2020 07:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCB66EA4F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 07:37:55 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id gf14so917277pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 00:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iy/APQd+Om2zvfiNSuBSqVLHET3wSuMQMAbhPYL7p8g=;
 b=RXMckBVOzfWh5lB0NGjYDRdVwoFWX6RIu3D4DLvpoZYEsN2bn7czl8s92gvRXRuvC1
 jkKloomDCmnelqvDVvGV+DDqOaLVv1Ly/uBqYJvYsQY/xzk7+KG7Utpo5zmK7Hirybcp
 w/YLYhv45WVnQ+CS5HsuPUJB1XkxczMgYCUW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Iy/APQd+Om2zvfiNSuBSqVLHET3wSuMQMAbhPYL7p8g=;
 b=jl/7V9WeuyWu5LKG69fPMxfTWtv0P/ni4OiXnIBM8qnaKmi4wWJVw4V6r8mueEHNjV
 OUYf9oXOuU6lNuf+Ezw1VRelHcXHZTxRP5zHvEXKI93n8hbQVKsKBARnw17d3wtLAoiL
 eA+R5qYbhQGjBWSl4hTojonXuEHuleAB9k2wb5euQ7pPVMPos5dWWdctG8ZPAkgPFWQy
 fphU3wu+cwVYhdJ5X6VQhm0M6m70Z0ANUdBDjLrn1DSgAMKJFojwzaW5z7mjHYgIckuQ
 UTbTRtDxBZAReB3jDnOjUiN488hNE9aA437nEtzjDK/buPrrp2r3vah/JxAVkV8j+JZs
 gY7Q==
X-Gm-Message-State: AOAM5311WkM2BKqe/QDZJkX4CXzpg0RO5HAb/T2pKo+ZfeBQlInd21Q3
 jDoywCuIkI0LOHn5HuIJGnTYow==
X-Google-Smtp-Source: ABdhPJymus8agbUoPSDDSSddmS+9FIwgQYcgK1fT6qDpKUASDuNarYsPQQLpgt3Qgn+nsXWqsxaInQ==
X-Received: by 2002:a17:90b:1107:: with SMTP id
 gi7mr2342742pjb.233.1599637075433; 
 Wed, 09 Sep 2020 00:37:55 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id h65sm1693068pfb.210.2020.09.09.00.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 00:37:54 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/dp_mst: Add ddc i2c device links for DP MST connectors
Date: Wed,  9 Sep 2020 17:37:38 +1000
Message-Id: <20200909173712.v2.1.Iaa9c3d7c4332cf8717653f3d3ae6f2b955aa3fc6@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Sam McNally <sammc@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP MST DDC I2C devices are not parented to their connectors. This makes
it challenging to associate the ddc i2c device with its connector from
userspace. With further refactoring, this can be changed, but in the
meantime, follow the pattern of commit e1a29c6c5955 ("drm: Add ddc link
in sysfs created by drm_connector"), creating sysfs ddc links to the
associated i2c device for MST DP connectors.

If the connector is created and registered before the i2c device, create
the link when registering the i2c device; otherwise, create the link
after registering the connector.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

Changes in v2:
- Reworded description to avoid accusing an innocent commit of
  responsibility for the problem being addressed

 drivers/gpu/drm/drm_dp_mst_topology.c | 29 +++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 17dbed0a9800..e60a6b8af3c1 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2159,11 +2159,23 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
 int drm_dp_mst_connector_late_register(struct drm_connector *connector,
 				       struct drm_dp_mst_port *port)
 {
+	int ret;
 	DRM_DEBUG_KMS("registering %s remote bus for %s\n",
 		      port->aux.name, connector->kdev->kobj.name);
 
 	port->aux.dev = connector->kdev;
-	return drm_dp_aux_register_devnode(&port->aux);
+	ret = drm_dp_aux_register_devnode(&port->aux);
+	if (ret)
+		return ret;
+
+	if (port->pdt != DP_PEER_DEVICE_NONE &&
+	    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
+		ret = sysfs_create_link(&port->connector->kdev->kobj,
+					&port->aux.ddc.dev.kobj, "ddc");
+		if (ret)
+			drm_dp_aux_unregister_devnode(&port->aux);
+	}
+	return ret;
 }
 EXPORT_SYMBOL(drm_dp_mst_connector_late_register);
 
@@ -5439,6 +5451,7 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_aux *aux = &port->aux;
 	struct device *parent_dev = port->mgr->dev->dev;
+	int ret;
 
 	aux->ddc.algo = &drm_dp_mst_i2c_algo;
 	aux->ddc.algo_data = aux;
@@ -5453,7 +5466,17 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(parent_dev),
 		sizeof(aux->ddc.name));
 
-	return i2c_add_adapter(&aux->ddc);
+	ret = i2c_add_adapter(&aux->ddc);
+	if (ret)
+		return ret;
+
+	if (port->connector && port->connector->kdev) {
+		ret = sysfs_create_link(&port->connector->kdev->kobj,
+					&port->aux.ddc.dev.kobj, "ddc");
+		if (ret)
+			i2c_del_adapter(&port->aux.ddc);
+	}
+	return ret;
 }
 
 /**
@@ -5462,6 +5485,8 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
  */
 static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
 {
+	if (port->connector && port->connector->kdev)
+		sysfs_remove_link(&port->connector->kdev->kobj, "ddc");
 	i2c_del_adapter(&port->aux.ddc);
 }
 
-- 
2.28.0.526.ge36021eeef-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
