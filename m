Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B400ABD47C
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9FF10E220;
	Tue, 20 May 2025 10:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TQ0Q97lK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DB910E1D3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:24:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 936CA629E1;
 Tue, 20 May 2025 10:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E98C4CEE9;
 Tue, 20 May 2025 10:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747736651;
 bh=YMbSCnPRwIyCAzYWgDoVNLwWOCQ2pSWUMHTeLhfe8Mg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TQ0Q97lK3ASQ/Dw454Wnkafpd2LfIiQMkmkh4t1svAtWYyIo7lU8DHrQ++d7T84Mf
 i8du1iJXHZV6VnlNnLVWz2KVuNpJu+LgIw621NtC2rSmdvMWN/Pxrlgnk7vojgsPTU
 dBikIqWZ3UMQtB8UahBhXdqiaT6aC1Ht0UlBZ8EhPma6sKiz9t0COASTMz9ddXCuVJ
 BoxSuQl3nB0fupas+J07wT0u9z1UhrIRP46o5C6RLqSy0uLKZQOJfWUX95W06aefgh
 lwUwhEgIa77Y3wX05JAO4qs3hQNcSCu+E9Pl9kNsmD4kUtKKXLrl/zFpdFpAqKUZgX
 zBBddopO5mUbg==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 20 May 2025 13:23:51 +0300
Subject: [PATCH RFC net-next 2/5] net: ethernet: ti: am65-cpsw: add XSK
 pool helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-am65-cpsw-xdp-zc-v1-2-45558024f566@kernel.org>
References: <20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org>
In-Reply-To: <20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: srk@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10416; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=YMbSCnPRwIyCAzYWgDoVNLwWOCQ2pSWUMHTeLhfe8Mg=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoLFg92e7URhiH+NeEIMbh7NBIawZnPO2Wwm1Mf
 Zw9ot3fZl6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCxYPQAKCRDSWmvTvnYw
 k/1PEAC9eHSJacMig16V/H768Mkz0avpiZZp3JadPkI7CiCmv3Lt61hW2w8h6xrc8A0CiqBey2L
 a0mMt63Cdepbjlv3LJ1mFd+Zqp86OFMYTwyCKQT8ndrDWS3Qc7ca0/Hj8u6hZc1YZCri5+YB6vi
 f4pYDbEPRvVtkCflF+toZ1KCTyEkdhy2iRiuyacwj8WVSImxpE8stBv92ibzuD6GKX+JZ0EmeTV
 mg3WFJOE7tGy+6fFqaqse6UQ6YhxlRjeRWuNq0n6X/nrOvVJIHwIlFztB4b4n1hpyqWTaa0ARGl
 LkbE8kF8+qUAbGBBRCyYIaRA8l04SXf5D1VQ1hWT6EjPug742wpt8KIBy+zDCBlgrd2+ednK/0Y
 LBo1ee5VLdbCxJcNANun874OYqga71hKdCso0pg0EgcMFYadpKU4cUpg9VP3Ja8dqleoQQKyUC2
 mX458885gERYmKPjcvhsvlGwIU4pbxRP+j7ElgHxwGbK6v087NuwSzPJLRpPBwRrji0pWxIbyo1
 r1IVT9aLNQ8mA02Uzqc2b8nZYb99+3uLBVaVNAU5Glu+9jTOgL1B994+OC6JPdd1XNX5taMqBfv
 wXwGF0vB3dSqPNQQgQcAwFHkmejVD+cNyM5lVLqdZW2vrcSHZWKbxtBHKIXbTUPhD3yd/Hnp/2J
 OYipTZcJxFwu0jQ==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093
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

To prepare for XSK zero copy support, add XSK pool
helpers in a new file am65-cpsw-xdp.c

As queues are shared between ports we can no longer
support the case where zero copy (XSK Pool) is enabled
for the queue on one port but not for other ports.

Current solution is to drop the packet if Zero copy
is not enabled for that port + queue but enabled for
some other port + same queue.

xdp_zc_queues bitmap tracks if queue is setup as XSK
pool and xsk_port_id array tracks which port the XSK
queue is assigned to for zero copy.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/Makefile         |   2 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c |  21 ++++--
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  20 +++++
 drivers/net/ethernet/ti/am65-cpsw-xdp.c  | 122 +++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
index cbcf44806924..48d07afe30f9 100644
--- a/drivers/net/ethernet/ti/Makefile
+++ b/drivers/net/ethernet/ti/Makefile
@@ -26,7 +26,7 @@ keystone_netcp_ethss-y := netcp_ethss.o netcp_sgmii.o netcp_xgbepcsr.o cpsw_ale.
 obj-$(CONFIG_TI_K3_CPPI_DESC_POOL) += k3-cppi-desc-pool.o
 
 obj-$(CONFIG_TI_K3_AM65_CPSW_NUSS) += ti-am65-cpsw-nuss.o
-ti-am65-cpsw-nuss-y := am65-cpsw-nuss.o cpsw_sl.o am65-cpsw-ethtool.o cpsw_ale.o
+ti-am65-cpsw-nuss-y := am65-cpsw-nuss.o cpsw_sl.o am65-cpsw-ethtool.o cpsw_ale.o am65-cpsw-xdp.o
 ti-am65-cpsw-nuss-$(CONFIG_TI_AM65_CPSW_QOS) += am65-cpsw-qos.o
 ti-am65-cpsw-nuss-$(CONFIG_TI_K3_AM65_CPSW_SWITCHDEV) += am65-cpsw-switchdev.o
 obj-$(CONFIG_TI_K3_AM65_CPTS) += am65-cpts.o
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index cd713bb57b91..a946bcd770c4 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -58,9 +58,6 @@
 
 #define AM65_CPSW_MAX_PORTS	8
 
-#define AM65_CPSW_MIN_PACKET_SIZE	VLAN_ETH_ZLEN
-#define AM65_CPSW_MAX_PACKET_SIZE	2024
-
 #define AM65_CPSW_REG_CTL		0x004
 #define AM65_CPSW_REG_STAT_PORT_EN	0x014
 #define AM65_CPSW_REG_PTYPE		0x018
@@ -505,7 +502,7 @@ static inline void am65_cpsw_put_page(struct am65_cpsw_rx_flow *flow,
 static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma);
 static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma);
 
-static void am65_cpsw_destroy_rxq(struct am65_cpsw_common *common, int id)
+void am65_cpsw_destroy_rxq(struct am65_cpsw_common *common, int id)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	struct am65_cpsw_rx_flow *flow;
@@ -554,7 +551,7 @@ static void am65_cpsw_destroy_rxqs(struct am65_cpsw_common *common)
 	k3_udma_glue_disable_rx_chn(common->rx_chns.rx_chn);
 }
 
-static int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id)
+int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id)
 {
 	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
 	struct page_pool_params pp_params = {
@@ -658,7 +655,7 @@ static int am65_cpsw_create_rxqs(struct am65_cpsw_common *common)
 	return ret;
 }
 
-static void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id)
+void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id)
 {
 	struct am65_cpsw_tx_chn *tx_chn = &common->tx_chns[id];
 
@@ -692,7 +689,7 @@ static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
 		am65_cpsw_destroy_txq(common, id);
 }
 
-static int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id)
+int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id)
 {
 	struct am65_cpsw_tx_chn *tx_chn = &common->tx_chns[id];
 	int ret;
@@ -1324,7 +1321,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
 	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
-	if (port->xdp_prog) {
+	if (am65_cpsw_xdp_is_enabled(port)) {
 		xdp_init_buff(&xdp, PAGE_SIZE, &port->xdp_rxq[flow->id]);
 		xdp_prepare_buff(&xdp, page_addr, AM65_CPSW_HEADROOM,
 				 pkt_len, false);
@@ -1960,6 +1957,9 @@ static int am65_cpsw_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
 	switch (bpf->command) {
 	case XDP_SETUP_PROG:
 		return am65_cpsw_xdp_prog_setup(ndev, bpf->prog);
+	case XDP_SETUP_XSK_POOL:
+		return am65_cpsw_xsk_setup_pool(ndev, bpf->xsk.pool,
+						bpf->xsk.queue_id);
 	default:
 		return -EINVAL;
 	}
@@ -3527,7 +3527,12 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	common = devm_kzalloc(dev, sizeof(struct am65_cpsw_common), GFP_KERNEL);
 	if (!common)
 		return -ENOMEM;
+
 	common->dev = dev;
+	common->xdp_zc_queues = devm_bitmap_zalloc(dev, AM65_CPSW_MAX_QUEUES,
+						   GFP_KERNEL);
+	if (!common->xdp_zc_queues)
+		return -ENOMEM;
 
 	of_id = of_match_device(am65_cpsw_nuss_of_mtable, dev);
 	if (!of_id)
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 917c37e4e89b..e80e74a74d71 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -23,8 +23,14 @@ struct am65_cpts;
 
 #define AM65_CPSW_MAX_QUEUES	8	/* both TX & RX */
 
+#define AM65_CPSW_MIN_PACKET_SIZE	VLAN_ETH_ZLEN
+#define AM65_CPSW_MAX_PACKET_SIZE	2024
+
 #define AM65_CPSW_PORT_VLAN_REG_OFFSET	0x014
 
+#define AM65_CPSW_RX_DMA_ATTR	(DMA_ATTR_SKIP_CPU_SYNC |\
+				 DMA_ATTR_WEAK_ORDERING)
+
 struct am65_cpsw_slave_data {
 	bool				mac_only;
 	struct cpsw_sl			*mac_sl;
@@ -190,6 +196,9 @@ struct am65_cpsw_common {
 	unsigned char switch_id[MAX_PHYS_ITEM_ID_LEN];
 	/* only for suspend/resume context restore */
 	u32			*ale_context;
+	/* XDP Zero Copy */
+	unsigned long		*xdp_zc_queues;
+	int			xsk_port_id[AM65_CPSW_MAX_QUEUES];
 };
 
 struct am65_cpsw_ndev_priv {
@@ -228,4 +237,15 @@ int am65_cpsw_nuss_update_tx_rx_chns(struct am65_cpsw_common *common,
 
 bool am65_cpsw_port_dev_check(const struct net_device *dev);
 
+int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id);
+void am65_cpsw_destroy_rxq(struct am65_cpsw_common *common, int id);
+int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id);
+void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id);
+int am65_cpsw_xsk_setup_pool(struct net_device *ndev,
+			     struct xsk_buff_pool *pool, u16 qid);
+int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags);
+static inline bool am65_cpsw_xdp_is_enabled(struct am65_cpsw_port *port)
+{
+	return !!READ_ONCE(port->xdp_prog);
+}
 #endif /* AM65_CPSW_NUSS_H_ */
diff --git a/drivers/net/ethernet/ti/am65-cpsw-xdp.c b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
new file mode 100644
index 000000000000..e1ab81cb4548
--- /dev/null
+++ b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Texas Instruments K3 AM65 Ethernet Switch SubSystem Driver
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ */
+
+#include <net/xsk_buff_pool.h>
+#include <net/xdp_sock_drv.h>
+#include "am65-cpsw-nuss.h"
+
+static int am65_cpsw_xsk_pool_enable(struct am65_cpsw_port *port,
+				     struct xsk_buff_pool *pool, u16 qid)
+{
+	struct am65_cpsw_common *common = port->common;
+	struct am65_cpsw_rx_chn *rx_chn;
+	bool need_update;
+	u32 frame_size;
+	int ret;
+
+	/*
+	 * As queues are shared between ports we can no longer
+	 * support the case where zero copy (XSK Pool) is enabled
+	 * for the queue on one port but not for other ports.
+	 *
+	 * Current solution is to drop the packet if Zero copy
+	 * is not enabled for that port + queue but enabled for
+	 * some other port + same queue.
+	 */
+	if (test_bit(qid, common->xdp_zc_queues))
+		return -EINVAL;
+
+	rx_chn = &common->rx_chns;
+	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
+		return -EINVAL;
+
+	frame_size = xsk_pool_get_rx_frame_size(pool);
+	if (frame_size < AM65_CPSW_MAX_PACKET_SIZE)
+		return -EOPNOTSUPP;
+
+	ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, AM65_CPSW_RX_DMA_ATTR);
+	if (ret) {
+		netdev_err(port->ndev, "Failed to map xsk pool\n");
+		return ret;
+	}
+
+	need_update = common->usage_count &&
+		      am65_cpsw_xdp_is_enabled(port);
+	if (need_update) {
+		am65_cpsw_destroy_rxq(common, qid);
+		am65_cpsw_destroy_txq(common, qid);
+	}
+
+	set_bit(qid, common->xdp_zc_queues);
+	common->xsk_port_id[qid] = port->port_id;
+	if (need_update) {
+		am65_cpsw_create_rxq(common, qid);
+		am65_cpsw_create_txq(common, qid);
+	}
+
+	return 0;
+}
+
+static int am65_cpsw_xsk_pool_disable(struct am65_cpsw_port *port,
+				      struct xsk_buff_pool *pool, u16 qid)
+{
+	struct am65_cpsw_common *common = port->common;
+	bool need_update;
+
+	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
+		return -EINVAL;
+
+	if (!test_bit(qid, common->xdp_zc_queues))
+		return -EINVAL;
+
+	pool = xsk_get_pool_from_qid(port->ndev, qid);
+	if (!pool)
+		return -EINVAL;
+
+	need_update = common->usage_count && am65_cpsw_xdp_is_enabled(port);
+	if (need_update) {
+		am65_cpsw_destroy_rxq(common, qid);
+		am65_cpsw_destroy_txq(common, qid);
+		synchronize_rcu();
+	}
+
+	xsk_pool_dma_unmap(pool, AM65_CPSW_RX_DMA_ATTR);
+	clear_bit(qid, common->xdp_zc_queues);
+	common->xsk_port_id[qid] = -EINVAL;
+	if (need_update) {
+		am65_cpsw_create_rxq(common, qid);
+		am65_cpsw_create_txq(common, qid);
+	}
+
+	return 0;
+}
+
+int am65_cpsw_xsk_setup_pool(struct net_device *ndev,
+			     struct xsk_buff_pool *pool, u16 qid)
+{
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+
+	return pool ? am65_cpsw_xsk_pool_enable(port, pool, qid) :
+		      am65_cpsw_xsk_pool_disable(port, pool, qid);
+}
+
+int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
+{
+	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
+	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+
+	if (!netif_running(ndev) || !netif_carrier_ok(ndev))
+		return -ENETDOWN;
+
+	if (!am65_cpsw_xdp_is_enabled(port))
+		return -EINVAL;
+
+	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
+		return -EINVAL;
+
+	return 0;
+}

-- 
2.34.1

