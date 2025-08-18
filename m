Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC6DB2AC53
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256B310E472;
	Mon, 18 Aug 2025 15:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="y700ZskV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EB510E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 11:25:17 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IBOh1c3153438;
 Mon, 18 Aug 2025 06:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755516283;
 bh=UIq+dSU2gEElyW0Kyv+zJUmKNtRcb2x2Y0sNI+tNCCI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=y700ZskVpxIna1g06QvNr/bv10CDy86PzifAAtSiVp1r9uIgH3p2IirOkaqlnp/vK
 UG+jnl3lc8SlnxsTdm1bmoK5Ycbbsmf8IrVGGWeiw1n7LluCIKxO03xGxtwWjXDPG/
 odOmhlDHL9d57SDKfPptfuE8of65GR+4jGkzb6Nw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IBOheH3978035
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 18 Aug 2025 06:24:43 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 06:24:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 06:24:43 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IBOhor1215140;
 Mon, 18 Aug 2025 06:24:43 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 57IBOfTV028764;
 Mon, 18 Aug 2025 06:24:42 -0500
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
Subject: [PATCH net-next 5/6] net: ti: icssg-prueth: Add AF_XDP zero copy for
 RX
Date: Mon, 18 Aug 2025 16:54:23 +0530
Message-ID: <20250818112424.3068643-6-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818112424.3068643-1-m-malladi@ti.com>
References: <20250818112424.3068643-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Mon, 18 Aug 2025 15:16:12 +0000
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

Use xsk_qid to check if a given port+qid has been registered
for xsk zero copy and populate it inside rx channel xsk_pool.

If xsk_pool is registered, allocate buffers from UMEM and map them
to the hardware Rx descriptors. In NAPI context, run the XDP program
for each packet and process the xsk buffer according to the XDP
result codes. Also allocate new set of buffers from UMEM for the
next batch of NAPI Rx processing.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 247 ++++++++++++++++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  31 ++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   3 +
 3 files changed, 250 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 4b7f465429c1..022b45addd52 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -797,12 +797,178 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len
 		fallthrough; /* handle aborts by dropping packet */
 	case XDP_DROP:
 		ndev->stats.rx_dropped++;
-		page_pool_recycle_direct(emac->rx_chns.pg_pool,
-					 virt_to_head_page(xdp->data));
 		return ICSSG_XDP_CONSUMED;
 	}
 }
 
+static int prueth_dma_rx_push_mapped_zc(struct prueth_emac *emac,
+					struct prueth_rx_chn *rx_chn,
+					struct xdp_buff *xdp)
+{
+	struct net_device *ndev = emac->ndev;
+	struct cppi5_host_desc_t *desc_rx;
+	struct prueth_swdata *swdata;
+	dma_addr_t desc_dma;
+	dma_addr_t buf_dma;
+	int buf_len;
+
+	buf_dma = xsk_buff_xdp_get_dma(xdp);
+	desc_rx = k3_cppi_desc_pool_alloc(rx_chn->desc_pool);
+	if (!desc_rx) {
+		netdev_err(ndev, "rx push: failed to allocate descriptor\n");
+		return -ENOMEM;
+	}
+	desc_dma = k3_cppi_desc_pool_virt2dma(rx_chn->desc_pool, desc_rx);
+
+	cppi5_hdesc_init(desc_rx, CPPI5_INFO0_HDESC_EPIB_PRESENT,
+			 PRUETH_NAV_PS_DATA_SIZE);
+	k3_udma_glue_rx_dma_to_cppi5_addr(rx_chn->rx_chn, &buf_dma);
+	buf_len = xsk_pool_get_rx_frame_size(rx_chn->xsk_pool);
+	cppi5_hdesc_attach_buf(desc_rx, buf_dma, buf_len, buf_dma, buf_len);
+	swdata = cppi5_hdesc_get_swdata(desc_rx);
+	swdata->type = PRUETH_SWDATA_XSK;
+	swdata->data.xdp = xdp;
+
+	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, PRUETH_RX_FLOW_DATA,
+					desc_rx, desc_dma);
+
+	return 0;
+}
+
+static int prueth_rx_alloc_zc(struct prueth_emac *emac, int budget)
+{
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
+	struct xdp_buff *xdp;
+	int i, ret;
+
+	for (i = 0; i < budget; i++) {
+		xdp = xsk_buff_alloc(rx_chn->xsk_pool);
+		if (!xdp)
+			break;
+
+		ret = prueth_dma_rx_push_mapped_zc(emac, rx_chn, xdp);
+		if (ret)
+			break;
+	}
+
+	return i;
+}
+
+static void emac_dispatch_skb_zc(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *psdata)
+{
+	unsigned int pkt_len = xdp->data_end - xdp->data;
+	struct net_device *ndev = emac->ndev;
+	struct sk_buff *skb;
+
+	skb = napi_alloc_skb(&emac->napi_rx, xdp->data_end - xdp->data_hard_start);
+	if (unlikely(!skb)) {
+		ndev->stats.rx_dropped++;
+		return;
+	}
+
+	skb_reserve(skb, PRUETH_HEADROOM);
+	skb_put(skb, pkt_len);
+	skb->dev = ndev;
+
+	/* RX HW timestamp */
+	if (emac->rx_ts_enabled)
+		emac_rx_timestamp(emac, skb, psdata);
+
+	if (emac->prueth->is_switch_mode)
+		skb->offload_fwd_mark = emac->offload_fwd_mark;
+	skb->protocol = eth_type_trans(skb, ndev);
+
+	skb_mark_for_recycle(skb);
+	napi_gro_receive(&emac->napi_rx, skb);
+	ndev->stats.rx_bytes += pkt_len;
+	ndev->stats.rx_packets++;
+}
+
+static int emac_rx_packet_zc(struct prueth_emac *emac, u32 flow_id,
+			     int budget)
+{
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
+	u32 buf_dma_len, pkt_len, port_id = 0;
+	struct net_device *ndev = emac->ndev;
+	struct cppi5_host_desc_t *desc_rx;
+	struct prueth_swdata *swdata;
+	dma_addr_t desc_dma, buf_dma;
+	struct xdp_buff *xdp;
+	int xdp_status = 0;
+	int count = 0;
+	u32 *psdata;
+	int ret;
+
+	while (count < budget) {
+		ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_id, &desc_dma);
+		if (ret) {
+			if (ret != -ENODATA)
+				netdev_err(ndev, "rx pop: failed: %d\n", ret);
+			break;
+		}
+
+		if (cppi5_desc_is_tdcm(desc_dma)) /* Teardown ? */
+			continue;
+
+		desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
+		swdata = cppi5_hdesc_get_swdata(desc_rx);
+		if (swdata->type != PRUETH_SWDATA_XSK) {
+			netdev_err(ndev, "rx_pkt: invalid swdata->type %d\n", swdata->type);
+			k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
+			break;
+		}
+
+		xdp = swdata->data.xdp;
+		cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
+		k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
+		pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
+		/* firmware adds 4 CRC bytes, strip them */
+		pkt_len -= 4;
+		cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
+		psdata = cppi5_hdesc_get_psdata(desc_rx);
+		k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
+		count++;
+		xsk_buff_set_size(xdp, pkt_len);
+		xsk_buff_dma_sync_for_cpu(xdp);
+
+		ret = emac_run_xdp(emac, xdp, &pkt_len);
+		switch (ret) {
+		case ICSSG_XDP_PASS:
+			/* prepare skb and send to n/w stack */
+			emac_dispatch_skb_zc(emac, xdp, psdata);
+			xsk_buff_free(xdp);
+			break;
+		case ICSSG_XDP_CONSUMED:
+			xsk_buff_free(xdp);
+			break;
+		case ICSSG_XDP_TX:
+		case ICSSG_XDP_REDIR:
+			xdp_status |= ret;
+			break;
+		}
+	}
+
+	if (xdp_status & ICSSG_XDP_REDIR)
+		xdp_do_flush();
+
+	/* Allocate xsk buffers from the pool for the "count" number of
+	 * packets processed in order to be able to receive more packets.
+	 */
+	ret = prueth_rx_alloc_zc(emac, count);
+
+	if (xsk_uses_need_wakeup(rx_chn->xsk_pool)) {
+		/* If the user space doesn't provide enough buffers then it must
+		 * explicitly wake up the kernel when new buffers are available
+		 */
+		if (ret < count)
+			xsk_set_rx_need_wakeup(rx_chn->xsk_pool);
+		else
+			xsk_clear_rx_need_wakeup(rx_chn->xsk_pool);
+	}
+
+	return count;
+}
+
 static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 {
 	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
@@ -919,11 +1085,16 @@ void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 	struct cppi5_host_desc_t *desc_rx;
 	struct prueth_swdata *swdata;
 	struct page_pool *pool;
+	struct xdp_buff *xdp;
 	struct page *page;
 
 	pool = rx_chn->pg_pool;
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
+	if (rx_chn->xsk_pool) {
+		xdp = swdata->data.xdp;
+		xsk_buff_free(xdp);
+	}
 	if (swdata->type == PRUETH_SWDATA_PAGE) {
 		page = swdata->data.page;
 		page_pool_recycle_direct(pool, page);
@@ -1172,6 +1343,7 @@ irqreturn_t prueth_rx_irq(int irq, void *dev_id)
 {
 	struct prueth_emac *emac = dev_id;
 
+	emac->rx_chns.irq_disabled = true;
 	disable_irq_nosync(irq);
 	napi_schedule(&emac->napi_rx);
 
@@ -1199,6 +1371,7 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 		PRUETH_RX_FLOW_DATA_SR1 : PRUETH_RX_FLOW_DATA;
 	int flow = emac->is_sr1 ?
 		PRUETH_MAX_RX_FLOWS_SR1 : PRUETH_MAX_RX_FLOWS;
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
 	int xdp_state_or = 0;
 	int num_rx = 0;
 	int cur_budget;
@@ -1206,21 +1379,25 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 	int ret;
 
 	while (flow--) {
-		cur_budget = budget - num_rx;
-
-		while (cur_budget--) {
-			ret = emac_rx_packet(emac, flow, &xdp_state);
-			xdp_state_or |= xdp_state;
-			if (ret)
-				break;
-			num_rx++;
+		if (rx_chn->xsk_pool) {
+			num_rx = emac_rx_packet_zc(emac, flow, budget);
+		} else {
+			cur_budget = budget - num_rx;
+
+			while (cur_budget--) {
+				ret = emac_rx_packet(emac, flow, &xdp_state);
+				xdp_state_or |= xdp_state;
+				if (ret)
+					break;
+				num_rx++;
+			}
 		}
 
 		if (num_rx >= budget)
 			break;
 	}
 
-	if (xdp_state_or & ICSSG_XDP_REDIR)
+	if (xdp_state_or & ICSSG_XDP_REDIR) // Should XSK not do xdp flush?
 		xdp_do_flush();
 
 	if (num_rx < budget && napi_complete_done(napi_rx, num_rx)) {
@@ -1229,7 +1406,11 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 				      ns_to_ktime(emac->rx_pace_timeout_ns),
 				      HRTIMER_MODE_REL_PINNED);
 		} else {
-			enable_irq(emac->rx_chns.irq[rx_flow]);
+			if (emac->rx_chns.irq_disabled) {
+				/* re-enable the RX IRQ */
+				emac->rx_chns.irq_disabled = false;
+				enable_irq(emac->rx_chns.irq[rx_flow]);
+			}
 		}
 	}
 
@@ -1283,26 +1464,36 @@ int prueth_prepare_rx_chan(struct prueth_emac *emac,
 		return PTR_ERR(pool);
 
 	chn->pg_pool = pool;
+	chn->xsk_pool = prueth_get_xsk_pool(emac, PRUETH_RX_FLOW_DATA);
 
-	for (i = 0; i < chn->descs_num; i++) {
-		/* NOTE: we're not using memory efficiently here.
-		 * 1 full page (4KB?) used here instead of
-		 * PRUETH_MAX_PKT_SIZE (~1.5KB?)
+	if (chn->xsk_pool) {
+		/* get pages from xsk_pool and push to RX ring
+		 * queue as much as possible
 		 */
-		page = page_pool_dev_alloc_pages(pool);
-		if (!page) {
-			netdev_err(emac->ndev, "couldn't allocate rx page\n");
-			ret = -ENOMEM;
+		ret = prueth_rx_alloc_zc(emac, chn->descs_num);
+		if (!ret)
 			goto recycle_alloc_pg;
-		}
+	} else {
+		for (i = 0; i < chn->descs_num; i++) {
+			/* NOTE: we're not using memory efficiently here.
+			 * 1 full page (4KB?) used here instead of
+			 * PRUETH_MAX_PKT_SIZE (~1.5KB?)
+			 */
+			page = page_pool_dev_alloc_pages(pool);
+			if (!page) {
+				netdev_err(emac->ndev, "couldn't allocate rx page\n");
+				ret = -ENOMEM;
+				goto recycle_alloc_pg;
+			}
 
-		ret = prueth_dma_rx_push_mapped(emac, chn, page, buf_size);
-		if (ret < 0) {
-			netdev_err(emac->ndev,
-				   "cannot submit page for rx chan %s ret %d\n",
-				   chn->name, ret);
-			page_pool_recycle_direct(pool, page);
-			goto recycle_alloc_pg;
+			ret = prueth_dma_rx_push_mapped(emac, chn, page, buf_size);
+			if (ret < 0) {
+				netdev_err(emac->ndev,
+					   "cannot submit page for rx chan %s ret %d\n",
+					   chn->name, ret);
+				page_pool_recycle_direct(pool, page);
+				goto recycle_alloc_pg;
+			}
 		}
 	}
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index d3d0a13da48c..7b5de71056ee 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -357,7 +357,11 @@ static enum hrtimer_restart emac_rx_timer_callback(struct hrtimer *timer)
 			container_of(timer, struct prueth_emac, rx_hrtimer);
 	int rx_flow = PRUETH_RX_FLOW_DATA;
 
-	enable_irq(emac->rx_chns.irq[rx_flow]);
+	if (emac->rx_chns.irq_disabled) {
+		/* re-enable the RX IRQ */
+		emac->rx_chns.irq_disabled = false;
+		enable_irq(emac->rx_chns.irq[rx_flow]);
+	}
 	return HRTIMER_NORESTART;
 }
 
@@ -535,13 +539,20 @@ static int prueth_create_xdp_rxqs(struct prueth_emac *emac)
 {
 	struct xdp_rxq_info *rxq = &emac->rx_chns.xdp_rxq;
 	struct page_pool *pool = emac->rx_chns.pg_pool;
-	int ret;
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
+	int ret = 0;
 
 	ret = xdp_rxq_info_reg(rxq, emac->ndev, 0, emac->napi_rx.napi_id);
 	if (ret)
 		return ret;
 
-	ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
+	if (rx_chn->xsk_pool) {
+		ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_XSK_BUFF_POOL, NULL);
+		xsk_pool_set_rxq_info(rx_chn->xsk_pool, rxq);
+	} else {
+		ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
+	}
+
 	if (ret)
 		xdp_rxq_info_unreg(rxq);
 
@@ -742,6 +753,7 @@ static void prueth_destroy_rxq(struct prueth_emac *emac)
 	k3_udma_glue_disable_rx_chn(emac->rx_chns.rx_chn);
 
 	emac->rx_chns.pg_pool = NULL;
+	emac->rx_chns.xsk_pool = NULL;
 }
 
 static int prueth_create_txq(struct prueth_emac *emac)
@@ -1305,6 +1317,7 @@ static int emac_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
 static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
 	struct prueth_tx_chn *tx_chn = &emac->tx_chns[qid];
 
 	if (!netif_running(ndev) || !netif_carrier_ok(ndev))
@@ -1325,6 +1338,11 @@ static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 		return -EINVAL;
 	}
 
+	if (!rx_chn->xsk_pool) {
+		netdev_err(ndev, "XSK pool not registered for RX queue %d\n", qid);
+		return -EINVAL;
+	}
+
 	if (flags & XDP_WAKEUP_TX) {
 		if (!napi_if_scheduled_mark_missed(&tx_chn->napi_tx)) {
 			if (likely(napi_schedule_prep(&tx_chn->napi_tx)))
@@ -1332,6 +1350,13 @@ static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 		}
 	}
 
+	if (flags & XDP_WAKEUP_RX) {
+		if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
+			if (likely(napi_schedule_prep(&emac->napi_rx)))
+				__napi_schedule(&emac->napi_rx);
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index eb76df7b5187..d931905c61c2 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -142,6 +142,8 @@ struct prueth_rx_chn {
 	char name[32];
 	struct page_pool *pg_pool;
 	struct xdp_rxq_info xdp_rxq;
+	struct xsk_buff_pool *xsk_pool;
+	bool irq_disabled;
 };
 
 enum prueth_swdata_type {
@@ -165,6 +167,7 @@ struct prueth_swdata {
 		struct page *page;
 		u32 cmd;
 		struct xdp_frame *xdpf;
+		struct xdp_buff *xdp;
 	} data;
 };
 
-- 
2.43.0

