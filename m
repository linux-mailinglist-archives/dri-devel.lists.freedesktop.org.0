Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022FCC004DB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E82110E3B9;
	Thu, 23 Oct 2025 09:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cCxVBRDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFDA10E1D8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:40:22 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59N9dnJK496869;
 Thu, 23 Oct 2025 04:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1761212389;
 bh=fa9WrcCfd8dJxtaTW7KvJU21nPMcisQscv6hh+mHHts=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=cCxVBRDh0UMsjn8i6LMjYI6JQyW+x0f5HwcGiosl9Ph84hdYVOhWCW7nt2ieCpJnz
 gfpWsgCm88iO1d4UgdzYAneXlAqZVgt7AACxNkQRjEIh+wE1YIh/gIfXgGinnzxmMu
 fQ5UjamAkfGbg+CxVOzSz56VoU42FJb0v6cnFujc=
Received: from DFLE208.ent.ti.com (dfle208.ent.ti.com [10.64.6.66])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59N9dn8R2616532
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Oct 2025 04:39:49 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 04:39:49 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 04:39:49 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59N9dncu146946;
 Thu, 23 Oct 2025 04:39:49 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 59N9dmC5014039;
 Thu, 23 Oct 2025 04:39:48 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
 <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
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
Subject: [PATCH net-next v4 5/6] net: ti: icssg-prueth: Add AF_XDP zero copy
 for RX
Date: Thu, 23 Oct 2025 15:09:26 +0530
Message-ID: <20251023093927.1878411-6-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023093927.1878411-1-m-malladi@ti.com>
References: <20251023093927.1878411-1-m-malladi@ti.com>
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

Use xsk_pool inside rx_chn to check if a given Rx queue id
is registered for xsk zero copy, which gets populated during
xsk enable.

Update prueth_create_xdp_rxqs to register and support two different
memory models (xsk and page) for a given Rx queue, if registered for
zero copy.

If xsk_pool is registered, allocate buffers from UMEM and map them
to the hardware Rx descriptors. In NAPI context, run the XDP program
for each packet and process the xsk buffer according to the XDP
result codes. Also allocate new set of buffers from UMEM for the
next batch of NAPI Rx processing. Add XDK_WAKEUP_RX support to support
xsk wakeup for Rx.

Move prueth_create_page_pool to prueth_init_rx_chns to avoid freeing
and re-allocating the system memory every time there is a transition
from zero copy to copy and prevents any type of memory fragmentation
or leak.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v4-v3:
- Updated the headroom with correct value instead of hardcoding
  inside emac_dispatch_skb_zc() function 

 drivers/net/ethernet/ti/icssg/icssg_common.c | 325 +++++++++++++++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  60 +++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
 3 files changed, 315 insertions(+), 72 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index b88cfe99e8b7..074afe173308 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -465,6 +465,29 @@ int prueth_init_tx_chns(struct prueth_emac *emac)
 }
 EXPORT_SYMBOL_GPL(prueth_init_tx_chns);
 
+static struct page_pool *prueth_create_page_pool(struct prueth_emac *emac,
+						 struct device *dma_dev,
+						 int size)
+{
+	struct page_pool_params pp_params = { 0 };
+	struct page_pool *pool;
+
+	pp_params.order = 0;
+	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
+	pp_params.pool_size = size;
+	pp_params.nid = dev_to_node(emac->prueth->dev);
+	pp_params.dma_dir = DMA_BIDIRECTIONAL;
+	pp_params.dev = dma_dev;
+	pp_params.napi = &emac->napi_rx;
+	pp_params.max_len = PAGE_SIZE;
+
+	pool = page_pool_create(&pp_params);
+	if (IS_ERR(pool))
+		netdev_err(emac->ndev, "cannot create rx page pool\n");
+
+	return pool;
+}
+
 int prueth_init_rx_chns(struct prueth_emac *emac,
 			struct prueth_rx_chn *rx_chn,
 			char *name, u32 max_rflows,
@@ -474,6 +497,7 @@ int prueth_init_rx_chns(struct prueth_emac *emac,
 	struct device *dev = emac->prueth->dev;
 	struct net_device *ndev = emac->ndev;
 	u32 fdqring_id, hdesc_size;
+	struct page_pool *pool;
 	int i, ret = 0, slice;
 	int flow_id_base;
 
@@ -516,6 +540,14 @@ int prueth_init_rx_chns(struct prueth_emac *emac,
 		goto fail;
 	}
 
+	pool = prueth_create_page_pool(emac, rx_chn->dma_dev, rx_chn->descs_num);
+	if (IS_ERR(pool)) {
+		ret = PTR_ERR(pool);
+		goto fail;
+	}
+
+	rx_chn->pg_pool = pool;
+
 	flow_id_base = k3_udma_glue_rx_get_flow_id_base(rx_chn->rx_chn);
 	if (emac->is_sr1 && !strcmp(name, "rxmgm")) {
 		emac->rx_mgm_flow_id_base = flow_id_base;
@@ -797,12 +829,190 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len
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
+		if (ret) {
+			netdev_err(emac->ndev, "rx alloc: failed to map descriptors to xdp buff\n");
+			xsk_buff_free(xdp);
+			break;
+		}
+	}
+
+	return i;
+}
+
+static void emac_dispatch_skb_zc(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *psdata)
+{
+	unsigned int headroom = xdp->data - xdp->data_hard_start;
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
+	skb_reserve(skb, headroom);
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
+		if (cppi5_desc_is_tdcm(desc_dma)) {
+			complete(&emac->tdown_complete);
+			break;
+		}
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
+		if (prueth_xdp_is_enabled(emac)) {
+			ret = emac_run_xdp(emac, xdp, &pkt_len);
+			switch (ret) {
+			case ICSSG_XDP_PASS:
+				/* prepare skb and send to n/w stack */
+				emac_dispatch_skb_zc(emac, xdp, psdata);
+				xsk_buff_free(xdp);
+				break;
+			case ICSSG_XDP_CONSUMED:
+				xsk_buff_free(xdp);
+				break;
+			case ICSSG_XDP_TX:
+			case ICSSG_XDP_REDIR:
+				xdp_status |= ret;
+				break;
+			}
+		} else {
+			/* prepare skb and send to n/w stack */
+			emac_dispatch_skb_zc(emac, xdp, psdata);
+			xsk_buff_free(xdp);
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
@@ -849,7 +1059,6 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 	/* firmware adds 4 CRC bytes, strip them */
 	pkt_len -= 4;
 	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
-
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
 	/* if allocation fails we drop the packet but push the
@@ -921,12 +1130,16 @@ void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 	struct cppi5_host_desc_t *desc_rx;
 	struct prueth_swdata *swdata;
 	struct page_pool *pool;
+	struct xdp_buff *xdp;
 	struct page *page;
 
 	pool = rx_chn->pg_pool;
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	if (swdata->type == PRUETH_SWDATA_PAGE) {
+	if (rx_chn->xsk_pool) {
+		xdp = swdata->data.xdp;
+		xsk_buff_free(xdp);
+	} else {
 		page = swdata->data.page;
 		page_pool_recycle_direct(pool, page);
 	}
@@ -1174,6 +1387,7 @@ irqreturn_t prueth_rx_irq(int irq, void *dev_id)
 {
 	struct prueth_emac *emac = dev_id;
 
+	emac->rx_chns.irq_disabled = true;
 	disable_irq_nosync(irq);
 	napi_schedule(&emac->napi_rx);
 
@@ -1201,6 +1415,7 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 		PRUETH_RX_FLOW_DATA_SR1 : PRUETH_RX_FLOW_DATA;
 	int flow = emac->is_sr1 ?
 		PRUETH_MAX_RX_FLOWS_SR1 : PRUETH_MAX_RX_FLOWS;
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
 	int xdp_state_or = 0;
 	int num_rx = 0;
 	int cur_budget;
@@ -1208,14 +1423,18 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
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
@@ -1231,7 +1450,11 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
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
 
@@ -1239,62 +1462,48 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 }
 EXPORT_SYMBOL_GPL(icssg_napi_rx_poll);
 
-static struct page_pool *prueth_create_page_pool(struct prueth_emac *emac,
-						 struct device *dma_dev,
-						 int size)
-{
-	struct page_pool_params pp_params = { 0 };
-	struct page_pool *pool;
-
-	pp_params.order = 0;
-	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
-	pp_params.pool_size = size;
-	pp_params.nid = dev_to_node(emac->prueth->dev);
-	pp_params.dma_dir = DMA_BIDIRECTIONAL;
-	pp_params.dev = dma_dev;
-	pp_params.napi = &emac->napi_rx;
-	pp_params.max_len = PAGE_SIZE;
-
-	pool = page_pool_create(&pp_params);
-	if (IS_ERR(pool))
-		netdev_err(emac->ndev, "cannot create rx page pool\n");
-
-	return pool;
-}
-
 int prueth_prepare_rx_chan(struct prueth_emac *emac,
 			   struct prueth_rx_chn *chn,
 			   int buf_size)
 {
-	struct page_pool *pool;
 	struct page *page;
+	int desc_avail;
 	int i, ret;
 
-	pool = prueth_create_page_pool(emac, chn->dma_dev, chn->descs_num);
-	if (IS_ERR(pool))
-		return PTR_ERR(pool);
-
-	chn->pg_pool = pool;
+	desc_avail = k3_cppi_desc_pool_avail(chn->desc_pool);
+	if (desc_avail < chn->descs_num)
+		netdev_warn(emac->ndev,
+			    "not enough RX descriptors available %d < %d\n",
+			    desc_avail, chn->descs_num);
 
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
+		ret = prueth_rx_alloc_zc(emac, desc_avail);
+		if (!ret)
 			goto recycle_alloc_pg;
-		}
+	} else {
+		for (i = 0; i < desc_avail; i++) {
+			/* NOTE: we're not using memory efficiently here.
+			 * 1 full page (4KB?) used here instead of
+			 * PRUETH_MAX_PKT_SIZE (~1.5KB?)
+			 */
+			page = page_pool_dev_alloc_pages(chn->pg_pool);
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
+				page_pool_recycle_direct(chn->pg_pool, page);
+				goto recycle_alloc_pg;
+			}
 		}
 	}
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 59b5c95072dd..57a98ac0d303 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -395,7 +395,11 @@ static enum hrtimer_restart emac_rx_timer_callback(struct hrtimer *timer)
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
 
@@ -569,31 +573,41 @@ const struct icss_iep_clockops prueth_iep_clockops = {
 	.perout_enable = prueth_perout_enable,
 };
 
+static void prueth_destroy_xdp_rxqs(struct prueth_emac *emac)
+{
+	struct xdp_rxq_info *rxq = &emac->rx_chns.xdp_rxq;
+
+	if (xdp_rxq_info_is_reg(rxq))
+		xdp_rxq_info_unreg(rxq);
+}
+
 static int prueth_create_xdp_rxqs(struct prueth_emac *emac)
 {
 	struct xdp_rxq_info *rxq = &emac->rx_chns.xdp_rxq;
 	struct page_pool *pool = emac->rx_chns.pg_pool;
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
 	int ret;
 
 	ret = xdp_rxq_info_reg(rxq, emac->ndev, 0, emac->napi_rx.napi_id);
 	if (ret)
 		return ret;
 
-	ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
-	if (ret)
-		xdp_rxq_info_unreg(rxq);
-
-	return ret;
-}
-
-static void prueth_destroy_xdp_rxqs(struct prueth_emac *emac)
-{
-	struct xdp_rxq_info *rxq = &emac->rx_chns.xdp_rxq;
+	if (rx_chn->xsk_pool) {
+		ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_XSK_BUFF_POOL, NULL);
+		if (ret)
+			goto xdp_unreg;
+		xsk_pool_set_rxq_info(rx_chn->xsk_pool, rxq);
+	} else {
+		ret = xdp_rxq_info_reg_mem_model(rxq, MEM_TYPE_PAGE_POOL, pool);
+		if (ret)
+			goto xdp_unreg;
+	}
 
-	if (!xdp_rxq_info_is_reg(rxq))
-		return;
+	return 0;
 
-	xdp_rxq_info_unreg(rxq);
+xdp_unreg:
+	prueth_destroy_xdp_rxqs(emac);
+	return ret;
 }
 
 static int icssg_prueth_add_mcast(struct net_device *ndev, const u8 *addr)
@@ -1349,6 +1363,12 @@ int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth_tx_chn *tx_chn = &emac->tx_chns[qid];
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
+
+	if (emac->xsk_qid != qid) {
+		netdev_err(ndev, "XSK queue %d not registered\n", qid);
+		return -EINVAL;
+	}
 
 	if (qid >= PRUETH_MAX_RX_FLOWS || qid >= emac->tx_ch_num) {
 		netdev_err(ndev, "Invalid XSK queue ID %d\n", qid);
@@ -1360,6 +1380,11 @@ int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
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
@@ -1367,6 +1392,13 @@ int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
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
index 3147a1d8f59a..10eadd356650 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -143,6 +143,7 @@ struct prueth_rx_chn {
 	struct page_pool *pg_pool;
 	struct xdp_rxq_info xdp_rxq;
 	struct xsk_buff_pool *xsk_pool;
+	bool irq_disabled;
 };
 
 enum prueth_swdata_type {
@@ -166,6 +167,7 @@ struct prueth_swdata {
 		struct page *page;
 		u32 cmd;
 		struct xdp_frame *xdpf;
+		struct xdp_buff *xdp;
 	} data;
 };
 
-- 
2.43.0

