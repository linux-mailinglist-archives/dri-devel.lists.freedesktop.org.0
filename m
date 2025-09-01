Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC9B3DF72
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1579C10E401;
	Mon,  1 Sep 2025 10:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YzuEnfZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44F310E404
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:03:15 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581A2cUH2348378;
 Mon, 1 Sep 2025 05:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756720958;
 bh=/m4+jCUqdTFchFOS6CFX2ALtGPpdiPTg/AkCozoA+/k=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YzuEnfZLettIXIPAQd/pVwWsBoMCQiJqJ0N6DhKAv+LukciGbZuuvHTGo8rkm1v/o
 vXcMlPKIb6569eWffdoLoT1mvol1zpcIUdG02Kid9Kxv+v07Wixws2yanay2orXxJY
 JNK3YRZ+x7sv7svB/jqHt7NsxvSsV1l0mx+uXCHM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581A2bHo1899696
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 1 Sep 2025 05:02:37 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 05:02:37 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 05:02:37 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581A2b8Z159761;
 Mon, 1 Sep 2025 05:02:37 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 581A2alA011119;
 Mon, 1 Sep 2025 05:02:36 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <namcao@linutronix.de>, <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
 <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
 <sdf@fomichev.me>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
 <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
 <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v2 1/6] net: ti: icssg-prueth: Add functions to
 create and destroy Rx/Tx queues
Date: Mon, 1 Sep 2025 15:32:22 +0530
Message-ID: <20250901100227.1150567-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901100227.1150567-1-m-malladi@ti.com>
References: <20250901100227.1150567-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Each port for a given ICSSG instance has their own set of
Tx and Rx queues. These functions will be further used while
performing ndo_bpf operations to set up the Tx/Rx queues for
a given port.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c |   6 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 193 +++++++++++++------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
 3 files changed, 139 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 57e5f1c88f50..5d31873492b6 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -804,7 +804,7 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 	return ret;
 }
 
-static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
+void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_rx_chn *rx_chn = data;
 	struct cppi5_host_desc_t *desc_rx;
@@ -822,6 +822,7 @@ static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 }
+EXPORT_SYMBOL_GPL(prueth_rx_cleanup);
 
 static int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
 {
@@ -1025,7 +1026,7 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
 }
 EXPORT_SYMBOL_GPL(icssg_ndo_start_xmit);
 
-static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
+void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_tx_chn *tx_chn = data;
 	struct cppi5_host_desc_t *desc_tx;
@@ -1051,6 +1052,7 @@ static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 
 	prueth_xmit_free(tx_chn, desc_tx);
 }
+EXPORT_SYMBOL_GPL(prueth_tx_cleanup);
 
 irqreturn_t prueth_rx_irq(int irq, void *dev_id)
 {
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index dadce6009791..ab8c240a6e8a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -727,6 +727,103 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 	return 0;
 }
 
+static void prueth_destroy_txq(struct prueth_emac *emac)
+{
+	int ret, i;
+
+	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
+	/* ensure new tdown_cnt value is visible */
+	smp_mb__after_atomic();
+	/* tear down and disable UDMA channels */
+	reinit_completion(&emac->tdown_complete);
+	for (i = 0; i < emac->tx_ch_num; i++)
+		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
+
+	ret = wait_for_completion_timeout(&emac->tdown_complete,
+					  msecs_to_jiffies(1000));
+	if (!ret)
+		netdev_err(emac->ndev, "tx teardown timeout\n");
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		k3_udma_glue_reset_tx_chn(emac->tx_chns[i].tx_chn,
+					  &emac->tx_chns[i],
+					  prueth_tx_cleanup);
+		k3_udma_glue_disable_tx_chn(emac->tx_chns[i].tx_chn);
+		napi_disable(&emac->tx_chns[i].napi_tx);
+		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
+	}
+}
+
+static void prueth_destroy_rxq(struct prueth_emac *emac)
+{
+	int i;
+
+	/* tear down and disable UDMA channels */
+	reinit_completion(&emac->tdown_complete);
+	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
+
+	wait_for_completion_timeout(&emac->tdown_complete,
+				    msecs_to_jiffies(1000));
+
+	for (i = 0; i < PRUETH_MAX_RX_FLOWS; i++) {
+		k3_udma_glue_reset_rx_chn(emac->rx_chns.rx_chn, i,
+					  &emac->rx_chns,
+					  prueth_rx_cleanup);
+	}
+	napi_disable(&emac->napi_rx);
+	hrtimer_cancel(&emac->rx_hrtimer);
+	prueth_destroy_xdp_rxqs(emac);
+	k3_udma_glue_disable_rx_chn(emac->rx_chns.rx_chn);
+
+	emac->rx_chns.pg_pool = NULL;
+}
+
+static int prueth_create_txq(struct prueth_emac *emac)
+{
+	int ret, i;
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		ret = k3_udma_glue_enable_tx_chn(emac->tx_chns[i].tx_chn);
+		if (ret)
+			goto reset_tx_chan;
+		napi_enable(&emac->tx_chns[i].napi_tx);
+	}
+	return 0;
+
+reset_tx_chan:
+	/* Since interface is not yet up, there is wouldn't be
+	 * any SKB for completion. So set false to free_skb
+	 */
+	prueth_reset_tx_chan(emac, i, false);
+	return ret;
+}
+
+static int prueth_create_rxq(struct prueth_emac *emac)
+{
+	int ret;
+
+	ret = prueth_prepare_rx_chan(emac, &emac->rx_chns, PRUETH_MAX_PKT_SIZE);
+	if (ret)
+		return ret;
+
+	ret = prueth_create_xdp_rxqs(emac);
+	if (ret)
+		goto reset_rx_chn;
+
+	ret = k3_udma_glue_enable_rx_chn(emac->rx_chns.rx_chn);
+	if (ret)
+		goto destroy_xdp_rxqs;
+
+	napi_enable(&emac->napi_rx);
+	return 0;
+
+destroy_xdp_rxqs:
+	prueth_destroy_xdp_rxqs(emac);
+reset_rx_chn:
+	prueth_reset_rx_chan(&emac->rx_chns, PRUETH_MAX_RX_FLOWS, false);
+	return ret;
+}
+
 /**
  * emac_ndo_open - EMAC device open
  * @ndev: network adapter device
@@ -738,7 +835,7 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 static int emac_ndo_open(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
-	int ret, i, num_data_chn = emac->tx_ch_num;
+	int ret, num_data_chn = emac->tx_ch_num;
 	struct icssg_flow_cfg __iomem *flow_cfg;
 	struct prueth *prueth = emac->prueth;
 	int slice = prueth_emac_slice(emac);
@@ -811,28 +908,13 @@ static int emac_ndo_open(struct net_device *ndev)
 		goto stop;
 
 	/* Prepare RX */
-	ret = prueth_prepare_rx_chan(emac, &emac->rx_chns, PRUETH_MAX_PKT_SIZE);
+	ret = prueth_create_rxq(emac);
 	if (ret)
 		goto free_tx_ts_irq;
 
-	ret = prueth_create_xdp_rxqs(emac);
-	if (ret)
-		goto reset_rx_chn;
-
-	ret = k3_udma_glue_enable_rx_chn(emac->rx_chns.rx_chn);
+	ret = prueth_create_txq(emac);
 	if (ret)
-		goto destroy_xdp_rxqs;
-
-	for (i = 0; i < emac->tx_ch_num; i++) {
-		ret = k3_udma_glue_enable_tx_chn(emac->tx_chns[i].tx_chn);
-		if (ret)
-			goto reset_tx_chan;
-	}
-
-	/* Enable NAPI in Tx and Rx direction */
-	for (i = 0; i < emac->tx_ch_num; i++)
-		napi_enable(&emac->tx_chns[i].napi_tx);
-	napi_enable(&emac->napi_rx);
+		goto destroy_rxq;
 
 	/* start PHY */
 	phy_start(ndev->phydev);
@@ -843,15 +925,8 @@ static int emac_ndo_open(struct net_device *ndev)
 
 	return 0;
 
-reset_tx_chan:
-	/* Since interface is not yet up, there is wouldn't be
-	 * any SKB for completion. So set false to free_skb
-	 */
-	prueth_reset_tx_chan(emac, i, false);
-destroy_xdp_rxqs:
-	prueth_destroy_xdp_rxqs(emac);
-reset_rx_chn:
-	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, false);
+destroy_rxq:
+	prueth_destroy_rxq(emac);
 free_tx_ts_irq:
 	free_irq(emac->tx_ts_irq, emac);
 stop:
@@ -881,9 +956,6 @@ static int emac_ndo_stop(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
-	int rx_flow = PRUETH_RX_FLOW_DATA;
-	int max_rx_flows;
-	int ret, i;
 
 	/* inform the upper layers. */
 	netif_tx_stop_all_queues(ndev);
@@ -897,32 +969,8 @@ static int emac_ndo_stop(struct net_device *ndev)
 	else
 		__dev_mc_unsync(ndev, icssg_prueth_del_mcast);
 
-	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
-	/* ensure new tdown_cnt value is visible */
-	smp_mb__after_atomic();
-	/* tear down and disable UDMA channels */
-	reinit_completion(&emac->tdown_complete);
-	for (i = 0; i < emac->tx_ch_num; i++)
-		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
-
-	ret = wait_for_completion_timeout(&emac->tdown_complete,
-					  msecs_to_jiffies(1000));
-	if (!ret)
-		netdev_err(ndev, "tx teardown timeout\n");
-
-	prueth_reset_tx_chan(emac, emac->tx_ch_num, true);
-	for (i = 0; i < emac->tx_ch_num; i++) {
-		napi_disable(&emac->tx_chns[i].napi_tx);
-		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
-	}
-
-	max_rx_flows = PRUETH_MAX_RX_FLOWS;
-	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
-
-	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, true);
-	prueth_destroy_xdp_rxqs(emac);
-	napi_disable(&emac->napi_rx);
-	hrtimer_cancel(&emac->rx_hrtimer);
+	prueth_destroy_txq(emac);
+	prueth_destroy_rxq(emac);
 
 	cancel_work_sync(&emac->rx_mode_work);
 
@@ -935,10 +983,10 @@ static int emac_ndo_stop(struct net_device *ndev)
 
 	free_irq(emac->tx_ts_irq, emac);
 
-	free_irq(emac->rx_chns.irq[rx_flow], emac);
+	free_irq(emac->rx_chns.irq[PRUETH_RX_FLOW_DATA], emac);
 	prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
 
-	prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
+	prueth_cleanup_rx_chns(emac, &emac->rx_chns, PRUETH_MAX_RX_FLOWS);
 	prueth_cleanup_tx_chns(emac);
 
 	prueth->emacs_initialized--;
@@ -1122,11 +1170,36 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
 static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
 {
 	struct bpf_prog *prog = bpf->prog;
+	struct bpf_prog *old_prog;
+	int ret;
 
 	if (!emac->xdpi.prog && !prog)
 		return 0;
 
-	WRITE_ONCE(emac->xdp_prog, prog);
+	if (netif_running(emac->ndev)) {
+		prueth_destroy_txq(emac);
+		prueth_destroy_rxq(emac);
+	}
+
+	old_prog = xchg(&emac->xdp_prog, prog);
+	if (old_prog)
+		bpf_prog_put(old_prog);
+
+	if (netif_running(emac->ndev)) {
+		ret = prueth_create_rxq(emac);
+		if (ret) {
+			netdev_err(emac->ndev, "Failed to create RX queue: %d\n", ret);
+			return ret;
+		}
+
+		ret = prueth_create_txq(emac);
+		if (ret) {
+			netdev_err(emac->ndev, "Failed to create TX queue: %d\n", ret);
+			prueth_destroy_rxq(emac);
+			emac->xdp_prog = NULL;
+			return ret;
+		}
+	}
 
 	xdp_attachment_setup(&emac->xdpi, bpf);
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index ca8a22a4a5da..e0dadbfca45a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -497,5 +497,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 			struct xdp_frame *xdpf,
 			struct page *page,
 			unsigned int q_idx);
+void prueth_rx_cleanup(void *data, dma_addr_t desc_dma);
+void prueth_tx_cleanup(void *data, dma_addr_t desc_dma);
 
 #endif /* __NET_TI_ICSSG_PRUETH_H */
-- 
2.43.0

