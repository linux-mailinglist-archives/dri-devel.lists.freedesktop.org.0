Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681689084A5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4AD10EC43;
	Fri, 14 Jun 2024 07:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Cd75aakU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8C010E2D0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:22:29 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266936; bh=wvlO6rPLzswydymnDRZRVr7VuwYsFM1oBs4rcF8y6Ic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cd75aakUvOgOQ1LWAyxaU1NCz8FYz6KFIH+uLxXDCrdp6u4Pp1w5geuRPkl0zoBxT
 nzLlqXEGxXiev4ivbSrw5zr9OkQTSc7+taqk/FjxiI29w2bRthZIV0ndSSvpsTy6e/
 sVX1J76FlH2IH9DD5p1Odg2JA960Cxt5aZHxmOGCs+Js3y/3MSmRC9TF7rOtUlxAan
 yXXuqrmuWg/Ow7/tS93QPbBCEdeIIu1yAPBd/FPCrx+TGkr6dhd1zKIjeqJ96gQzTC
 usqOfHb5IhZ5Mc4fPV36nad5Xs3BmoXI84/LgPqOaywpQk8NmdZ8t0Xg5nMY//wA0e
 zq+gUwyPiJrUw==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hY1440009; Thu, 13 Jun 2024 11:22:08 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 03/15] net: hbl_cn: physical layer support
Date: Thu, 13 Jun 2024 11:21:56 +0300
Message-Id: <20240613082208.1439968-4-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:53 +0000
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

Add a common physical (PHY) layer initialization and link notification.
An notification is sent on every link up/down change.

Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
Co-developed-by: David Meriin <dmeriin@habana.ai>
Signed-off-by: David Meriin <dmeriin@habana.ai>
Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
---
 .../ethernet/intel/hbl_cn/common/hbl_cn_phy.c | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c
index 0d07cd78221d..6753d54ae2b0 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_phy.c
@@ -4,30 +4,231 @@
  * All Rights Reserved.
  */
 
+#include <linux/firmware.h>
 #include "hbl_cn.h"
 
+static void port_reset_state(struct hbl_cn_port *cn_port)
+{
+	cn_port->pcs_link = false;
+	cn_port->eq_pcs_link = false;
+	cn_port->auto_neg_resolved = false;
+	cn_port->auto_neg_skipped = false;
+	cn_port->phy_fw_tuned = false;
+	cn_port->retry_cnt = 0;
+	cn_port->pcs_remote_fault_seq_cnt = 0;
+	cn_port->pcs_link_restore_cnt = 0;
+	cn_port->correctable_errors_cnt = 0;
+	cn_port->uncorrectable_errors_cnt = 0;
+}
+
+static u32 get_data_rate(struct hbl_cn_port *cn_port)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	u32 port, speed, data_rate;
+
+	port = cn_port->port;
+	speed = cn_port->speed;
+
+	switch (speed) {
+	case SPEED_10000:
+		data_rate = NIC_DR_10;
+		break;
+	case SPEED_25000:
+		data_rate = NIC_DR_25;
+		break;
+	case SPEED_50000:
+		data_rate = NIC_DR_50;
+		break;
+	case SPEED_100000:
+		data_rate = NIC_DR_50;
+		break;
+	case SPEED_200000:
+		data_rate = NIC_DR_100;
+		break;
+	case SPEED_400000:
+		data_rate = NIC_DR_100;
+		break;
+	default:
+		data_rate = NIC_DR_50;
+		dev_err(hdev->dev, "unknown port %d speed, continue with 50 GHz\n", port);
+		break;
+	}
+
+	dev_dbg(hdev->dev, "port %d, speed %d data rate %d\n", port, speed, data_rate);
+
+	return data_rate;
+}
+
 void hbl_cn_phy_set_port_status(struct hbl_cn_port *cn_port, bool up)
 {
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_en_aux_ops *aux_ops;
+	struct hbl_aux_dev *aux_dev;
+	u32 port = cn_port->port;
+	bool is_ibdev;
+	int rc;
+
+	aux_dev = &hdev->en_aux_dev;
+	aux_ops = aux_dev->aux_ops;
+	port_funcs = hdev->asic_funcs->port_funcs;
+	is_ibdev = hbl_cn_is_ibdev(hdev);
+
+	port_funcs->set_port_status(cn_port, up);
+
+	if (cn_port->eth_enable) {
+		if (aux_ops->set_port_status)
+			aux_ops->set_port_status(aux_dev, port, up);
+	} else {
+		if (hdev->ctx)
+			dev_info(hdev->dev, "Card %u Port %u: link %s\n",
+				 hdev->card_location, port, up ? "up" : "down");
+		else
+			dev_dbg(hdev->dev, "Card %u Port %u: link %s\n",
+				hdev->card_location, port, up ? "up" : "down");
+	}
+
+	/* IB flow. User polls for IB events.
+	 *  - internal ports: Enqueue link event in EQ dispatcher. IB event would be dispatched in
+	 *                    response.
+	 *  - external ports: Do not enqueue. hbl IB driver dispatches IB events from netdev
+	 *                    notifier chain handler.
+	 * non-IB flow. User polls for EQ events.
+	 *  - internal ports: Enqueue link event in EQ dispatcher.
+	 *  - external ports: Enqueue link event in EQ dispatcher.
+	 */
+	if (!is_ibdev || !cn_port->eth_enable) {
+		if (hdev->has_eq) {
+			rc = hbl_cn_eq_dispatcher_enqueue_bcast(cn_port, &cn_port->link_eqe);
+			if (rc)
+				dev_dbg_ratelimited(hdev->dev,
+						    "Port %d, failed to dispatch link event %s, %d\n",
+						    port, up ? "up" : "down", rc);
+		}
+	}
+
+	cn_port->port_toggle_cnt++;
+
+	/* The FEC counters are relevant during the time that link is UP, hence reset them here */
+	if (up) {
+		cn_port->correctable_errors_cnt = 0;
+		cn_port->uncorrectable_errors_cnt = 0;
+	}
+
+	if (hdev->pldm) {
+		dev_dbg(hdev->dev, "%s: port %u\n", __func__, port);
+		msleep(1000);
+	}
 }
 
 int hbl_cn_phy_init(struct hbl_cn_port *cn_port)
 {
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	int rc;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	/* If mac_loopback is enabled on this port, move the port status to UP state */
+	if (cn_port->mac_loopback) {
+		cn_port->pcs_link = true;
+		hbl_cn_phy_set_port_status(cn_port, true);
+		return 0;
+	}
+
+	if (!hdev->phy_config_fw) {
+		/* If EQ is supported, it will take care of setting the port status */
+		if (!hdev->has_eq) {
+			cn_port->pcs_link = true;
+			hbl_cn_phy_set_port_status(cn_port, true);
+		}
+
+		return 0;
+	}
+
+	cn_port->data_rate = get_data_rate(cn_port);
+
+	rc = port_funcs->phy_port_power_up(cn_port);
+	if (rc) {
+		dev_err(hdev->dev, "ASIC specific phy port power-up failed, %d\n", rc);
+		return rc;
+	}
+
+	port_funcs->phy_port_start_stop(cn_port, true);
+
+	queue_delayed_work(cn_port->wq, &cn_port->link_status_work, msecs_to_jiffies(1));
+
 	return 0;
 }
 
+/* This function does not change the port link status in order to avoid unnecessary netdev actions
+ * and prints. Hence it should be done from outside.
+ */
 void hbl_cn_phy_fini(struct hbl_cn_port *cn_port)
 {
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+
+	/* This is done before the check because we support setting mac loopback for a specific port
+	 * and this function might be called when cn_port->mac_loopback is true (during the port
+	 * reset after setting mac loopback), but the link status work was scheduled before (when
+	 * the port was opened w/o mac loopback).
+	 */
+	cancel_delayed_work_sync(&cn_port->link_status_work);
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	if (!hdev->phy_config_fw || cn_port->mac_loopback) {
+		cn_port->pcs_link = false;
+		cn_port->eq_pcs_link = false;
+		return;
+	}
+
+	port_reset_state(cn_port);
+	port_funcs->phy_port_start_stop(cn_port, false);
 }
 
 void hbl_cn_phy_port_reconfig(struct hbl_cn_port *cn_port)
 {
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	port_funcs->phy_port_reconfig(cn_port);
+
+	port_reset_state(cn_port);
 }
 
 int hbl_cn_phy_has_binary_fw(struct hbl_cn_device *hdev)
 {
+	struct hbl_cn_asic_funcs *asic_funcs = hdev->asic_funcs;
+	const struct firmware *fw;
+	const char *fw_name;
+	int rc;
+
+	fw_name = asic_funcs->get_phy_fw_name();
+
+	rc = request_firmware(&fw, fw_name, hdev->dev);
+	if (rc) {
+		dev_err(hdev->dev, "Firmware file %s is not found!\n", fw_name);
+		return rc;
+	}
+
+	release_firmware(fw);
+
 	return 0;
 }
 
 void hbl_cn_phy_set_fw_polarity(struct hbl_cn_device *hdev)
 {
+	struct hbl_cn_cpucp_info *cpucp_info;
+
+	if (hdev->skip_phy_pol_cfg)
+		return;
+
+	cpucp_info = hdev->cpucp_info;
+
+	hdev->pol_tx_mask = cpucp_info->pol_tx_mask[0];
+	hdev->pol_rx_mask = cpucp_info->pol_rx_mask[0];
 }
-- 
2.34.1

