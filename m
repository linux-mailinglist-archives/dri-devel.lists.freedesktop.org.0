Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4523195C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B725F6E43B;
	Wed, 29 Jul 2020 06:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A866E43B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:15:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id l63so13695649pge.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 23:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lFyM8Vx/5op87Dvz+AvxS1fPZAwbt9pRfprMIWb3YTU=;
 b=NgwSU+sEhHjJFh2Cw54BwrU1T27J2CiPVw2SEjfUpcNPBbzyJ0oj4QKISKIAaLyLvy
 r1mgqbbcHbgwXL3gCzG/ltDrdIBqhajO/Ci6Pyf3zLbh0SM4sXpI89B+XpffIFyi2Cvj
 tBZirVrQuvroukfy5muJly3TYrvUM+VvJmieo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lFyM8Vx/5op87Dvz+AvxS1fPZAwbt9pRfprMIWb3YTU=;
 b=PAQ94Qw2tUR8oovPMSqq8mitG32px0fsez1dXnzfUcrnF+gHBp+hNkrMP7MzqvuHWR
 Y4aSpDczVUGo4Y3sSXQKRNFw8EOYaq/UFEVIfgY7uAB5Umvl4yrv4tT2M9WYXRdYV6Rs
 /kErdxCKtZF8ahOZRaZzQ6AmfuI4TKOiyZPqJVhmb/Ey2InrZWA0F8bmLWpxaW+MIsXL
 CGoYL3LuIVl9vw84b8lEJrrmgrpzwhI5Ki7tpulJOENJqB95RX8USV7DcFS94lKHBFGK
 S8H13O5Bxji/YiENbbfTKIMo/qFJk/fptJcEa7iUmYL86wNecavxL/BJFNO55L0+Spa/
 6wIg==
X-Gm-Message-State: AOAM5317TM/P1r/UBziDQwuXY7/OgUS25qWisIA3CeHiRlIqLE5JnpY8
 WMQbtARyHpI01Mq+77farLSDPw==
X-Google-Smtp-Source: ABdhPJz9nsgNNiKNv6uOWtVlB7+pZve0qrQ8QpVeMxYdHqoOpag4NlpS+EpbD63x41HUalOzw8sZJA==
X-Received: by 2002:a63:c603:: with SMTP id w3mr27695619pgg.284.1596003352877; 
 Tue, 28 Jul 2020 23:15:52 -0700 (PDT)
Received: from localhost ([2401:fa00:9:15:7220:84ff:fe09:cabc])
 by smtp.gmail.com with ESMTPSA id z25sm1003384pfg.150.2020.07.28.23.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 23:15:52 -0700 (PDT)
From: Sam McNally <sammc@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/dp_mst: Add ddc i2c device links for DP MST connectors
Date: Wed, 29 Jul 2020 16:15:28 +1000
Message-Id: <20200729161510.1.Iaa9c3d7c4332cf8717653f3d3ae6f2b955aa3fc6@changeid>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
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

As of commit d8bd15b37d32 ("drm/dp_mst: Fix the DDC I2C device
registration of an MST port"), DP MST DDC I2C devices are consistently
parented to the underlying DRM device, making it challenging to
associate the ddc i2c device with its connector from userspace.

Given the need for further refactoring before the i2c devices can be
parented to their connectors, in the meantime follow the pattern of
commit e1a29c6c5955 ("drm: Add ddc link in sysfs created by
drm_connector"), creating sysfs ddc links to the associated i2c device
for MST DP connectors.

If the connector is created and registered before the i2c device, create
the link when registering the i2c device; otherwise, create the link
during late connector registration.

Signed-off-by: Sam McNally <sammc@chromium.org>
---

 drivers/gpu/drm/drm_dp_mst_topology.c | 29 +++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 1ac874e4e7a1..73a2299c2faa 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2161,11 +2161,23 @@ static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
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
 
@@ -5490,6 +5502,7 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_aux *aux = &port->aux;
 	struct device *parent_dev = port->mgr->dev->dev;
+	int ret;
 
 	aux->ddc.algo = &drm_dp_mst_i2c_algo;
 	aux->ddc.algo_data = aux;
@@ -5504,7 +5517,17 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
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
@@ -5513,6 +5536,8 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
  */
 static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
 {
+	if (port->connector && port->connector->kdev)
+		sysfs_remove_link(&port->connector->kdev->kobj, "ddc");
 	i2c_del_adapter(&port->aux.ddc);
 }
 
-- 
2.28.0.rc0.142.g3c755180ce-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
