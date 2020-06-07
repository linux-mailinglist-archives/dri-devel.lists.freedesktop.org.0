Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5C1F0FFD
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 23:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBA86E1F3;
	Sun,  7 Jun 2020 21:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1AA6E1F3;
 Sun,  7 Jun 2020 21:25:31 +0000 (UTC)
IronPort-SDR: Chj/mk8k3uB8kVzyaz5PUrSCMqhxOk0mmew3rk8YdjCvLAj1XkvKbaLBm5WVp5ByIPhJ5Nlj/V
 4tJJj1ZRCyew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2020 14:25:30 -0700
IronPort-SDR: kIuXvujiVBRu8DPzrjhtSBz9LifRZZM00MPAOqrF3ms14XUfOuHxSwOJD1CYGHK2vOPNnn7JzU
 VjGSA7YyL1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,485,1583222400"; d="scan'208";a="270317164"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 07 Jun 2020 14:25:28 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/dp_mst: Fix the DDC I2C device registration of an MST
 port
Date: Mon,  8 Jun 2020 00:25:21 +0300
Message-Id: <20200607212522.16935-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.23.1
In-Reply-To: <20200607212522.16935-1-imre.deak@intel.com>
References: <20200607212522.16935-1-imre.deak@intel.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the initial MST probing an MST port's I2C device will be
registered using the kdev of the DRM device as a parent. Later after MST
Connection Status Notifications this I2C device will be re-registered
with the kdev of the port's connector. This will also move
inconsistently the I2C device's sysfs entry from the DRM device's sysfs
dir to the connector's dir.

Fix the above by keeping the DRM kdev as the parent of the I2C device.

Ideally the connector's kdev would be used as a parent, similarly to
non-MST connectors, however that needs some more refactoring to ensure
the connector's kdev is already available early enough. So keep the
existing (initial) behavior for now.

Cc: <stable@vger.kernel.org>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 28 +++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 02c800b8199f..083255c33ee0 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -88,8 +88,8 @@ static int drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 				 u8 *guid);
 
-static int drm_dp_mst_register_i2c_bus(struct drm_dp_aux *aux);
-static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_aux *aux);
+static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port);
+static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port);
 static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr);
 
 #define DBG_PREFIX "[dp_mst]"
@@ -1993,7 +1993,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 			}
 
 			/* remove i2c over sideband */
-			drm_dp_mst_unregister_i2c_bus(&port->aux);
+			drm_dp_mst_unregister_i2c_bus(port);
 		} else {
 			mutex_lock(&mgr->lock);
 			drm_dp_mst_topology_put_mstb(port->mstb);
@@ -2008,7 +2008,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 	if (port->pdt != DP_PEER_DEVICE_NONE) {
 		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/* add i2c over sideband */
-			ret = drm_dp_mst_register_i2c_bus(&port->aux);
+			ret = drm_dp_mst_register_i2c_bus(port);
 		} else {
 			lct = drm_dp_calculate_rad(port, rad);
 			mstb = drm_dp_add_mst_branch_device(lct, rad);
@@ -5375,22 +5375,26 @@ static const struct i2c_algorithm drm_dp_mst_i2c_algo = {
 
 /**
  * drm_dp_mst_register_i2c_bus() - register an I2C adapter for I2C-over-AUX
- * @aux: DisplayPort AUX channel
+ * @port: The port to add the I2C bus on
  *
  * Returns 0 on success or a negative error code on failure.
  */
-static int drm_dp_mst_register_i2c_bus(struct drm_dp_aux *aux)
+static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 {
+	struct drm_dp_aux *aux = &port->aux;
+	struct device *parent_dev = port->mgr->dev->dev;
+
 	aux->ddc.algo = &drm_dp_mst_i2c_algo;
 	aux->ddc.algo_data = aux;
 	aux->ddc.retries = 3;
 
 	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
-	aux->ddc.dev.parent = aux->dev;
-	aux->ddc.dev.of_node = aux->dev->of_node;
+	/* FIXME: set the kdev of the port's connector as parent */
+	aux->ddc.dev.parent = parent_dev;
+	aux->ddc.dev.of_node = parent_dev->of_node;
 
-	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
+	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(parent_dev),
 		sizeof(aux->ddc.name));
 
 	return i2c_add_adapter(&aux->ddc);
@@ -5398,11 +5402,11 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_aux *aux)
 
 /**
  * drm_dp_mst_unregister_i2c_bus() - unregister an I2C-over-AUX adapter
- * @aux: DisplayPort AUX channel
+ * @port: The port to remove the I2C bus from
  */
-static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_aux *aux)
+static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
 {
-	i2c_del_adapter(&aux->ddc);
+	i2c_del_adapter(&port->aux.ddc);
 }
 
 /**
-- 
2.23.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
