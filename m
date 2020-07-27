Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC27D22FDF6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9CB6E13D;
	Mon, 27 Jul 2020 23:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EAA89916;
 Mon, 27 Jul 2020 20:50:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3de90003>; Mon, 27 Jul 2020 13:49:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:50:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 13:50:29 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:50:25 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <lukas@wunner.de>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>
Subject: [PATCH 1/6] vga-switcheroo: add new "immediate" switch event type
Date: Mon, 27 Jul 2020 15:51:07 -0500
Message-ID: <20200727205112.27698-2-ddadap@nvidia.com>
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
 t=1595882985; bh=DsoKqreQfzZURwMK9ZuJ+aIV8L91hqK5a/R/nG9qDc8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=XxfbYJlwhaLGrbeC8OnkvZxKPWBimJmSAvWBtxNQdzhPsyUj9I1uEZYtkdgWa0q4f
 EUqsSvb77DCUeXKB1UNDoiIwEt2pWoINXhfkDKugJi/3FFNCq6GC1iesI6k/m81vBs
 iMxWW6A/qUdeMv5qWY6PEWe/ZCZ9OTFUsyCY59guS56DMGxrXxklvSfoAEsDSjkLBS
 JHsFgI2afC1+xVUCeqr8gkkG+ux9qPWsfc3SJMyI17seooWzjuxDiS2/4is51WKm2e
 x68Mo4wDUiqE4nIHx05UpUgbKtAduIx0v6kwSyvXz+wjmzfqPOUb792m1qPX6H/eUL
 /uV8X7yWMJ72Q==
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

vga-switcheroo supports the following types of mux switch events:

* standard: checks the clients' can_switch() callbacks and switches
  the mux if the client drivers report that they are prepared for a
  switch. Also uses client and handler callbacks to manage power on
  the GPUs and reprobe display outputs.
* deferred: registers the intent to perform a mux switch and defers
  it until the client drivers no longer have any active modesetting
  clients. Performs the equivalent of a standard switch when clients
  are ready.
* mux-only: switches the mux immediately without testing can_switch
  first and without calling any of the client or handler callbacks
  for power management and reprobing.

In order to support additional use cases involving dynamic switching
of display muxes, add a new type of "immediate" switch event which
skips the can_switch test and power management hooks, but still calls
the reprobe hook. This switch event type uses 'I' as a prefix for its
commands, similar to the existing 'D' pefix for the deferred commands
and 'M' for the mux-only commands.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/vga/vga_switcheroo.c | 86 +++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 087304b1a5d7..cf3c7024dafa 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -631,16 +631,23 @@ EXPORT_SYMBOL(vga_switcheroo_unlock_ddc);
  * * DDIS: Delayed switch to the discrete graphics device.
  * * MIGD: Mux-only switch to the integrated graphics device.
  *   Does not remap console or change the power state of either gpu.
+ *   Does not call into any client-supplied callbacks, e.g. reprobe.
  *   If the integrated GPU is currently off, the screen will turn black.
  *   If it is on, the screen will show whatever happens to be in VRAM.
  *   Either way, the user has to blindly enter the command to switch back.
  * * MDIS: Mux-only switch to the discrete graphics device.
+ * * IIGD: Immediate switch to the integrated graphics device.
+ *   Does not test for active user space processes utilizing the device
+ *   files of the GPU or audio device. Does not change the power state of
+ *   either gpu. The console is remapped and client-provided callbacks
+ *   such as reprobe are called.
+ *  * IDIS: Immediate switch to the discrete graphics device.
  *
  * For GPUs whose power state is controlled by the driver's runtime pm,
  * the ON and OFF commands are a no-op (see next section).
  *
- * For muxless machines, the IGD/DIS, DIGD/DDIS and MIGD/MDIS commands
- * should not be used.
+ * For muxless machines, the IGD/DIS, DIGD/DDIS, MIGD/MDIS and IIGD/IDIS
+ * commands should not be used.
  */
 
 static int vga_switcheroo_show(struct seq_file *m, void *v)
@@ -704,7 +711,8 @@ static void set_audio_state(enum vga_switcheroo_client_id id,
 }
 
 /* stage one happens before delay */
-static int vga_switchto_stage1(struct vga_switcheroo_client *new_client)
+static int vga_switchto_stage1(struct vga_switcheroo_client *new_client,
+			       bool power_control)
 {
 	struct vga_switcheroo_client *active;
 
@@ -712,7 +720,8 @@ static int vga_switchto_stage1(struct vga_switcheroo_client *new_client)
 	if (!active)
 		return 0;
 
-	if (vga_switcheroo_pwr_state(new_client) == VGA_SWITCHEROO_OFF)
+	if (power_control &&
+	    vga_switcheroo_pwr_state(new_client) == VGA_SWITCHEROO_OFF)
 		vga_switchon(new_client);
 
 	vga_set_default_device(new_client->pdev);
@@ -720,7 +729,8 @@ static int vga_switchto_stage1(struct vga_switcheroo_client *new_client)
 }
 
 /* post delay */
-static int vga_switchto_stage2(struct vga_switcheroo_client *new_client)
+static int vga_switchto_stage2(struct vga_switcheroo_client *new_client,
+			       bool power_control)
 {
 	int ret;
 	struct vga_switcheroo_client *active;
@@ -747,7 +757,8 @@ static int vga_switchto_stage2(struct vga_switcheroo_client *new_client)
 	if (new_client->ops->reprobe)
 		new_client->ops->reprobe(new_client->pdev);
 
-	if (vga_switcheroo_pwr_state(active) == VGA_SWITCHEROO_ON)
+	if (power_control &&
+	    vga_switcheroo_pwr_state(active) == VGA_SWITCHEROO_ON)
 		vga_switchoff(active);
 
 	/* let HDA controller autoresume if GPU uses driver power control */
@@ -779,6 +790,7 @@ vga_switcheroo_debugfs_write(struct file *filp, const char __user *ubuf,
 	int ret;
 	bool delay = false, can_switch;
 	bool just_mux = false;
+	bool immediate_switch = false;
 	enum vga_switcheroo_client_id client_id = VGA_SWITCHEROO_UNKNOWN_ID;
 	struct vga_switcheroo_client *client = NULL;
 
@@ -822,30 +834,48 @@ vga_switcheroo_debugfs_write(struct file *filp, const char __user *ubuf,
 		goto out;
 	}
 
-	/* request a delayed switch - test can we switch now */
-	if (strncmp(usercmd, "DIGD", 4) == 0) {
-		client_id = VGA_SWITCHEROO_IGD;
-		delay = true;
-	}
-
-	if (strncmp(usercmd, "DDIS", 4) == 0) {
-		client_id = VGA_SWITCHEROO_DIS;
-		delay = true;
-	}
 
+	/* normal switch request */
 	if (strncmp(usercmd, "IGD", 3) == 0)
 		client_id = VGA_SWITCHEROO_IGD;
 
 	if (strncmp(usercmd, "DIS", 3) == 0)
 		client_id = VGA_SWITCHEROO_DIS;
 
-	if (strncmp(usercmd, "MIGD", 4) == 0) {
-		just_mux = true;
-		client_id = VGA_SWITCHEROO_IGD;
-	}
-	if (strncmp(usercmd, "MDIS", 4) == 0) {
-		just_mux = true;
-		client_id = VGA_SWITCHEROO_DIS;
+	if (client_id == VGA_SWITCHEROO_UNKNOWN_ID) {
+		switch (usercmd[0]) {
+		case 'D':
+			/*
+			 * request a delayed switch -
+			 * test can we switch now
+			 */
+			delay = true;
+			break;
+		case 'I':
+			/*
+			 * switch immediately -
+			 * ignore can switch test;
+			 * communicate switch to clients
+			 */
+			immediate_switch = true;
+			break;
+		case 'M':
+			/*
+			 * switch immediately -
+			 * ignore can switch test;
+			 * do not communicate switch to clients
+			 */
+			just_mux = true;
+			break;
+		default:
+			goto out;
+		}
+
+		if (strncmp(usercmd + 1, "IGD", 3) == 0)
+			client_id = VGA_SWITCHEROO_IGD;
+
+		if (strncmp(usercmd + 1, "DIS", 3) == 0)
+			client_id = VGA_SWITCHEROO_DIS;
 	}
 
 	if (client_id == VGA_SWITCHEROO_UNKNOWN_ID)
@@ -867,17 +897,17 @@ vga_switcheroo_debugfs_write(struct file *filp, const char __user *ubuf,
 		goto out;
 
 	/* okay we want a switch - test if devices are willing to switch */
-	can_switch = check_can_switch();
+	can_switch = immediate_switch || check_can_switch();
 
 	if (can_switch == false && delay == false)
 		goto out;
 
 	if (can_switch) {
-		ret = vga_switchto_stage1(client);
+		ret = vga_switchto_stage1(client, !immediate_switch);
 		if (ret)
 			pr_err("switching failed stage 1 %d\n", ret);
 
-		ret = vga_switchto_stage2(client);
+		ret = vga_switchto_stage2(client, !immediate_switch);
 		if (ret)
 			pr_err("switching failed stage 2 %d\n", ret);
 
@@ -886,7 +916,7 @@ vga_switcheroo_debugfs_write(struct file *filp, const char __user *ubuf,
 		vgasr_priv.delayed_switch_active = true;
 		vgasr_priv.delayed_client_id = client_id;
 
-		ret = vga_switchto_stage1(client);
+		ret = vga_switchto_stage1(client, !immediate_switch);
 		if (ret)
 			pr_err("delayed switching stage 1 failed %d\n", ret);
 	}
@@ -951,7 +981,7 @@ int vga_switcheroo_process_delayed_switch(void)
 	if (!client || !check_can_switch())
 		goto err;
 
-	ret = vga_switchto_stage2(client);
+	ret = vga_switchto_stage2(client, true);
 	if (ret)
 		pr_err("delayed switching failed stage 2 %d\n", ret);
 
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
