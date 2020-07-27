Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E073422FDFA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED6A6E0FA;
	Mon, 27 Jul 2020 23:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CCE89E9B;
 Mon, 27 Jul 2020 20:50:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3de90002>; Mon, 27 Jul 2020 13:49:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:50:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:50:29 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:50:27 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <lukas@wunner.de>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>
Subject: [PATCH 3/6] vga-switcheroo: notify clients of pending/completed
 switch events
Date: Mon, 27 Jul 2020 15:51:09 -0500
Message-ID: <20200727205112.27698-4-ddadap@nvidia.com>
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
 t=1595882985; bh=ZRPljo5KYD8GIXijaOxzLgDlZ6v0DgNHM3aEhp9RDyk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=g8m+r6yYuMlQ/dbluXcm2xneAORRa4LsAvxIKE+ISfWqAkPU/7BeucW9oSI5pFDws
 AUeMc94cSEiiR7q7m+2UsXY46wsayP1veszeL6sQ2y3kEZm2j1jLikHar6EqMr91vA
 Z6O7caQNC9kLbhkpqZHAAwQJeMai4q8yaqC7Jeynbh8RNH2pA1aLnVq0SohmDMsHIU
 8ZukjJgLUXvUnxRFACH0Sy5BxfkEUkcxBbxohpXpkZF4Axvx79MdK6viIwAQMqznFz
 f5gCTZ2+q3WMhIuxazhprfBMxiWuzimF3bod/305LjHl5jO3p/+jXz48RwBFvRv2c9
 f2JaGSLCt8TAg==
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

Add a new vga-switcheroo client callback to allow clients to register
for receiving notifications when a mux switch is pending, completed,
or failed. This allows individual client drivers to prepare for or
respond to mux switches to and from the registered client device.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 29 ++++++++++++++++++++++++++++-
 include/linux/vga_switcheroo.h   | 18 ++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index a4fc78c4bf4f..6392dc92696b 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -756,14 +756,41 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client,
 	if (new_client->fb_info)
 		fbcon_remap_all(new_client->fb_info);
 
+	if (active->ops->notify)
+		active->ops->notify(active->pdev,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_AWAY,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_PENDING);
+	if (new_client->ops->notify)
+		new_client->ops->notify(new_client->pdev,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_TO,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_PENDING);
+
 	active->switched = false;
 	mutex_lock(&vgasr_priv.mux_hw_lock);
 	ret = vgasr_priv.handler->switchto(new_client->id);
 	mutex_unlock(&vgasr_priv.mux_hw_lock);
-	if (ret)
+	if (ret) {
+		if (active->ops->notify)
+			active->ops->notify(active->pdev,
+				VGA_SWITCHEROO_NOTIFY_SWITCH_AWAY,
+				VGA_SWITCHEROO_NOTIFY_SWITCH_FAILED);
+		if (new_client->ops->notify)
+			new_client->ops->notify(new_client->pdev,
+				VGA_SWITCHEROO_NOTIFY_SWITCH_TO,
+				VGA_SWITCHEROO_NOTIFY_SWITCH_FAILED);
 		return ret;
+	}
 	new_client->switched = true;
 
+	if (active->ops->notify)
+		active->ops->notify(active->pdev,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_AWAY,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_COMPLETE);
+	if (new_client->ops->notify)
+		new_client->ops->notify(new_client->pdev,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_TO,
+			VGA_SWITCHEROO_NOTIFY_SWITCH_COMPLETE);
+
 	if (new_client->ops->reprobe)
 		new_client->ops->reprobe(new_client->pdev);
 
diff --git a/include/linux/vga_switcheroo.h b/include/linux/vga_switcheroo.h
index 63e6d6e5786e..2dc8ebc84fd4 100644
--- a/include/linux/vga_switcheroo.h
+++ b/include/linux/vga_switcheroo.h
@@ -90,6 +90,17 @@ enum vga_switcheroo_client_id {
 	VGA_SWITCHEROO_MAX_CLIENTS,
 };
 
+enum vga_switcheroo_notify_direction {
+	VGA_SWITCHEROO_NOTIFY_SWITCH_TO,
+	VGA_SWITCHEROO_NOTIFY_SWITCH_AWAY,
+};
+
+enum vga_switcheroo_notify_action {
+	VGA_SWITCHEROO_NOTIFY_SWITCH_PENDING,
+	VGA_SWITCHEROO_NOTIFY_SWITCH_COMPLETE,
+	VGA_SWITCHEROO_NOTIFY_SWITCH_FAILED,
+};
+
 /**
  * struct vga_switcheroo_handler - handler callbacks
  * @init: initialize handler.
@@ -134,6 +145,10 @@ struct vga_switcheroo_handler {
  * 	Mandatory. The client should return false if a user space process
  * 	has one of its device files open
  * @gpu_bound: notify the client id to audio client when the GPU is bound.
+ * @notify: notify clients of pending and completed switches
+ *	Optional. This gets called for both active and inactive clients,
+ *	before a switch begins, and after a switch successfully completes
+ *	or fails.
  *
  * Client callbacks. A client can be either a GPU or an audio device on a GPU.
  * The @set_gpu_state and @can_switch methods are mandatory, @reprobe may be
@@ -145,6 +160,9 @@ struct vga_switcheroo_client_ops {
 	void (*reprobe)(struct pci_dev *dev);
 	bool (*can_switch)(struct pci_dev *dev);
 	void (*gpu_bound)(struct pci_dev *dev, enum vga_switcheroo_client_id);
+	void (*notify)(struct pci_dev *dev,
+		       enum vga_switcheroo_notify_direction,
+		       enum vga_switcheroo_notify_action);
 };
 
 #if defined(CONFIG_VGA_SWITCHEROO)
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
