Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6A22FDFD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727C36E123;
	Mon, 27 Jul 2020 23:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5D489B68;
 Mon, 27 Jul 2020 20:50:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3de90001>; Mon, 27 Jul 2020 13:49:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:50:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:50:29 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:50:26 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <lukas@wunner.de>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>
Subject: [PATCH 2/6] vga-switcheroo: Add a way to test for the active client
Date: Mon, 27 Jul 2020 15:51:08 -0500
Message-ID: <20200727205112.27698-3-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200727205112.27698-1-ddadap@nvidia.com>
References: <ba78cd19-45ad-b17e-5174-256cc11f36c2%40nvidia.com>
 <20200727205112.27698-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595882985; bh=esEWuiyg3gYbIlV4ja+fxXb6VyrVF1oX1/jmfBsEyZg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=HVWH3zsbbBul1yuWqpwt8UO5v9wThEaIoi5sr3W4rxyL9P2uZhMiG+IjgQSWoBdaX
 fUP4RS9as5/VMah5kEdd+eGCVSsJkAaqJQVh8PhF5Vj0kMOKo7cMhH6+i3AAgtlD90
 efe6lxibl4PMinr1U1qBgn57bfvd55lVrtyCoYb8porgwKBRpyEhgjPqtcffDLzf8g
 y3F7VQX+Ko2o1c/XdZyRxMsLnBYkxCXHUy6dLE1mr2aLXlrf1apMhwjsieAMdTegdJ
 1mzoIp9SIwyNqp99lJ3aeY1BeBogyp7bDG07P/cCdQmFllLdbTUqT9tGYk26IJcOzZ
 Yedk8JU6yFtkQ==
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Daniel Dadap <ddadap@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vga-switcheroo clients may wish to know whether they are currently
active, i.e., whether the mux is currently switched to the client
in question. Add an in-kernel API to test whether a vga-switcheroo
client, as identified by PCI device, is actively switched.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 38 +++++++++++++++++++++++++++++++-
 include/linux/vga_switcheroo.h   |  2 ++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index cf3c7024dafa..a4fc78c4bf4f 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -99,7 +99,13 @@
  * @id: client identifier. Determining the id requires the handler,
  *	so gpus are initially assigned VGA_SWITCHEROO_UNKNOWN_ID
  *	and later given their true id in vga_switcheroo_enable()
- * @active: whether the outputs are currently switched to this client
+ * @active: whether the client is currently active: this is unset for the
+ *	currently active client before preparing for a mux switch, and set
+ *	for the newly active client after completing all post-switch actions.
+ * @switched: whether the outputs are physically switched to the client:
+ *	this is unset for the currently switched client immediately before
+ *	switching the mux, and set for the newly switched client immediately
+ *	after switching the mux.
  * @driver_power_control: whether power state is controlled by the driver's
  *	runtime pm. If true, writing ON and OFF to the vga_switcheroo debugfs
  *	interface is a no-op so as not to interfere with runtime pm
@@ -117,6 +123,7 @@ struct vga_switcheroo_client {
 	const struct vga_switcheroo_client_ops *ops;
 	enum vga_switcheroo_client_id id;
 	bool active;
+	bool switched;
 	bool driver_power_control;
 	struct list_head list;
 	struct pci_dev *vga_dev;
@@ -306,6 +313,7 @@ static int register_client(struct pci_dev *pdev,
 	client->ops = ops;
 	client->id = id;
 	client->active = active;
+	client->switched = active;
 	client->driver_power_control = driver_power_control;
 	client->vga_dev = vga_dev;
 
@@ -748,11 +756,13 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client,
 	if (new_client->fb_info)
 		fbcon_remap_all(new_client->fb_info);
 
+	active->switched = false;
 	mutex_lock(&vgasr_priv.mux_hw_lock);
 	ret = vgasr_priv.handler->switchto(new_client->id);
 	mutex_unlock(&vgasr_priv.mux_hw_lock);
 	if (ret)
 		return ret;
+	new_client->switched = true;
 
 	if (new_client->ops->reprobe)
 		new_client->ops->reprobe(new_client->pdev);
@@ -1111,3 +1121,29 @@ void vga_switcheroo_fini_domain_pm_ops(struct device *dev)
 	dev_pm_domain_set(dev, NULL);
 }
 EXPORT_SYMBOL(vga_switcheroo_fini_domain_pm_ops);
+
+/**
+ * vga_switcheroo_is_client_active() - test if a device is the active client
+ * @pdev: vga client device
+ *
+ * Check whether the mux is switched to the switcheroo client associated with
+ * the given PCI device. Assumes that mux is always switched to the device in
+ * question when switcheroo is inactive, and that the mux is switched away if
+ * no matching client is registered.
+ */
+bool vga_switcheroo_is_client_active(struct pci_dev *pdev)
+{
+	if (vgasr_priv.active) {
+		struct vga_switcheroo_client *client;
+
+		client = find_client_from_pci(&vgasr_priv.clients, pdev);
+
+		if (client)
+			return client->switched;
+		else
+			return false;
+	} else {
+		return true;
+	}
+}
+EXPORT_SYMBOL(vga_switcheroo_is_client_active);
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index 7e6ac0114d55..63e6d6e5786e 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -173,6 +173,7 @@ enum vga_switcheroo_state vga_switcheroo_get_client_state(struct pci_dev *dev);
 
 int vga_switcheroo_init_domain_pm_ops(struct device *dev, struct dev_pm_domain *domain);
 void vga_switcheroo_fini_domain_pm_ops(struct device *dev);
+bool vga_switcheroo_is_client_active(struct pci_dev *pdev);
 #else
 
 static inline void vga_switcheroo_unregister_client(struct pci_dev *dev) {}
@@ -194,6 +195,7 @@ static inline enum vga_switcheroo_state vga_switcheroo_get_client_state(struct p
 
 static inline int vga_switcheroo_init_domain_pm_ops(struct device *dev, struct dev_pm_domain *domain) { return -EINVAL; }
 static inline void vga_switcheroo_fini_domain_pm_ops(struct device *dev) {}
+static inline bool vga_switcheroo_is_client_active(struct pci_dev *pdev) { return true; }
 
 #endif
 #endif /* _LINUX_VGA_SWITCHEROO_H_ */
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
