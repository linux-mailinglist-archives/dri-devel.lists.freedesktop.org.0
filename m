Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC7ABD47D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B7010E1D3;
	Tue, 20 May 2025 10:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CKgtBdz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23E810E40B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:24:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2C07C629EC;
 Tue, 20 May 2025 10:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFA0C4CEF1;
 Tue, 20 May 2025 10:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747736656;
 bh=xLrlxL0xXwR94rknogbGfGiqdI6tjOR6Ewlo75vEhpI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CKgtBdz22eZ55+d5Gmqxl0v7hdUY3H2cSsTLLE77BtOYoJJ8OYO16oLm1RTvBo4fE
 ujPdPI5OA5mD3JuJhQkqQkNN5BJxQk6X5RZL8V/9mrF6HDhLMCCpQbdkzy/7L/IeUP
 /1gfh1OwHgD85TpuDFMbRXhK4uBcfZf4wZU0ukN1Dg8t0YFQVVvFMsacbvX7pXw1f2
 urYf+6zqe6ybaH6V+52YzyOcH+9jRrWT4lAN8/sQ6xccjqBFBjZhaN5LTnHqGRQbeV
 jw3ObB3ff5Ii/E5cYwMPwrxoAMUEGKlmkAo34y42BU8opAHTgfSs8OHWdp0V7a6NlO
 iTxgFy61TaDbg==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 20 May 2025 13:23:52 +0300
Subject: [PATCH RFC net-next 3/5] net: ethernet: ti: am65-cpsw: Add AF_XDP
 zero copy for RX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-am65-cpsw-xdp-zc-v1-3-45558024f566@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14909; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=xLrlxL0xXwR94rknogbGfGiqdI6tjOR6Ewlo75vEhpI=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoLFg9g7i7wyvOPisGCZCKiUTIUo+sFU7EZPR8c
 rlqy4Lxrf6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCxYPQAKCRDSWmvTvnYw
 k6yOEADJZzVrdF2cNlbN/tWUnC3eWyhu6xasPuhZXmZmXPwW2D8Iq7njZwegMktyofQ5r/PN8KH
 9upfTKbF3DvDx+sRgxLAEePkF6E/g54sS8AwvY7J+j9UYnQFQDm8JoURpxouW47qkFrlp2bJADA
 eM6+yEs4HNGiCZ+O2RTz30ZW/+RMND8SuSrgYj4Fti2s5FI2pHDf36/Q9sBBIOc0WpyiorBjdRM
 9J/dJEOehB+XYlI/3NsjJ9v/LWbftao2CtL2XCZOC2KeDcVbKpBaOiie6kwQL3bzYnrhDQ4H8xu
 eEUq60sbDxeDUy+U8hzms0Ecy284a6B5YrGSMnyG5YTulp/v+IM0z0voSmkikBqs3wbsuDhltMZ
 GSAGgW4SRLp+2brOVxyMf4jUdcBK6ic3RJ1h4OIDFE4NiD+fQOrFy7Ik0tlPMjDsxfowkFJd7r3
 yiuWkk9sYS9LA98meh3MZPXtqntX6CbGVqX20JbHUFsrkEedlJHJWRhJoKt/OUS+EClQUd1Pz0f
 ALmgsACQ9AOQTjWA1nNpJy2AOM1TSlEOGXBi6XeZ+CKmnwJ1Bc5ljRp4dubrVqnI4S0oAR3BiVN
 wzWa/2yVsudH5Wrc2cFdNOSED0BP5bPzXjXp4dJo4TOj5hJ2EagJeAafwZKM4E0l3lQjHKztHLk
 XrKlwCTL7E/yt3w==
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

Add zero copy support to RX path.

Introduce xsk_pool and xsk_port_id to struct am65_cpsw_rx_flow.
This way we can quickly check if the flow is setup as XSK pool
and for which port.

If the RX flow is setup as XSK pool then register it as
MEM_TYPE_XSK_BUFF_POOL. At queue creation get free frames from
the XSK pool and push it to the RX ring.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 307 +++++++++++++++++++++++++++----
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |  12 +-
 drivers/net/ethernet/ti/am65-cpsw-xdp.c  |  24 +++
 3 files changed, 309 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index a946bcd770c4..5fbf04880722 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -429,6 +429,55 @@ static void am65_cpsw_nuss_ndo_host_tx_timeout(struct net_device *ndev,
 	}
 }
 
+static int am65_cpsw_nuss_rx_push_zc(struct am65_cpsw_rx_flow *flow,
+				     struct xdp_buff *xdp)
+{
+	struct am65_cpsw_rx_chn *rx_chn = &flow->common->rx_chns;
+	struct cppi5_host_desc_t *desc_rx;
+	struct am65_cpsw_swdata *swdata;
+	u32 flow_id = flow->id;
+	dma_addr_t desc_dma;
+	dma_addr_t buf_dma;
+	int buf_len;
+
+	desc_rx = k3_cppi_desc_pool_alloc(rx_chn->desc_pool);
+	if (!desc_rx)
+		return -ENOMEM;
+
+	desc_dma = k3_cppi_desc_pool_virt2dma(rx_chn->desc_pool, desc_rx);
+	buf_dma = xsk_buff_xdp_get_dma(xdp);
+	cppi5_hdesc_init(desc_rx, CPPI5_INFO0_HDESC_EPIB_PRESENT,
+			 AM65_CPSW_NAV_PS_DATA_SIZE);
+	k3_udma_glue_rx_dma_to_cppi5_addr(rx_chn->rx_chn, &buf_dma);
+	buf_len = xsk_pool_get_rx_frame_size(flow->xsk_pool);
+	cppi5_hdesc_attach_buf(desc_rx, buf_dma, buf_len, buf_dma, buf_len);
+	swdata = cppi5_hdesc_get_swdata(desc_rx);
+	swdata->xdp = xdp;
+	swdata->flow_id = flow_id;
+
+	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, flow_id,
+					desc_rx, desc_dma);
+}
+
+static int am65_cpsw_nuss_rx_alloc_zc(struct am65_cpsw_rx_flow *flow,
+				      int budget)
+{
+	struct xdp_buff *xdp;
+	int i, ret;
+
+	for (i = 0; i < budget; i++) {
+		xdp = xsk_buff_alloc(flow->xsk_pool);
+		if (!xdp)
+			break;
+
+		ret = am65_cpsw_nuss_rx_push_zc(flow, xdp);
+		if (ret < 0)
+			break;
+	}
+
+	return i;
+}
+
 static int am65_cpsw_nuss_rx_push(struct am65_cpsw_common *common,
 				  struct page *page, u32 flow_idx)
 {
@@ -529,6 +578,9 @@ void am65_cpsw_destroy_rxq(struct am65_cpsw_common *common, int id)
 		page_pool_destroy(flow->page_pool);
 		flow->page_pool = NULL;
 	}
+
+	flow->xsk_pool = NULL;
+	flow->xsk_port_id = -EINVAL;
 }
 
 static void am65_cpsw_destroy_rxqs(struct am65_cpsw_common *common)
@@ -568,6 +620,7 @@ int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id)
 	struct page_pool *pool;
 	struct page *page;
 	int port, ret, i;
+	int port_id;
 
 	flow = &rx_chn->flows[id];
 	pp_params.napi = &flow->napi_rx;
@@ -582,9 +635,24 @@ int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id)
 	/* using same page pool is allowed as no running rx handlers
 	 * simultaneously for both ndevs
 	 */
+
+	/* get first port with XSK pool & XDP program set */
 	for (port = 0; port < common->port_num; port++) {
-		if (!common->ports[port].ndev)
-		/* FIXME should we BUG here? */
+		flow->xsk_pool = am65_cpsw_xsk_get_pool(&common->ports[port],
+							id);
+		if (flow->xsk_pool)
+			break;
+	}
+
+	port_id = common->ports[port].port_id;
+	flow->xsk_port_id = flow->xsk_pool ? port_id : -EINVAL;
+	for (port = 0; port < common->port_num; port++) {
+		port_id = common->ports[port].port_id;
+
+		/* NOTE: if queue is XSK then only register it
+		 * for the relevant port it was assigned to
+		 */
+		if (flow->xsk_pool && port_id != flow->xsk_port_id)
 			continue;
 
 		rxq = &common->ports[port].xdp_rxq[id];
@@ -593,29 +661,44 @@ int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id)
 		if (ret)
 			goto err;
 
-		ret = xdp_rxq_info_reg_mem_model(rxq,
-						 MEM_TYPE_PAGE_POOL,
-						 pool);
+		if (flow->xsk_pool) {
+			ret = xdp_rxq_info_reg_mem_model(rxq,
+							 MEM_TYPE_XSK_BUFF_POOL,
+							 NULL);
+			xsk_pool_set_rxq_info(flow->xsk_pool, rxq);
+		} else {
+			ret = xdp_rxq_info_reg_mem_model(rxq,
+							 MEM_TYPE_PAGE_POOL,
+							 pool);
+		}
+
 		if (ret)
 			goto err;
 	}
 
-	for (i = 0; i < AM65_CPSW_MAX_RX_DESC; i++) {
-		page = page_pool_dev_alloc_pages(flow->page_pool);
-		if (!page) {
-			dev_err(common->dev, "cannot allocate page in flow %d\n",
-				id);
-			ret = -ENOMEM;
-			goto err;
-		}
+	if (flow->xsk_pool) {
+		/* get pages from xsk_pool and push to RX ring
+		 * queue as much as possible
+		 */
+		am65_cpsw_nuss_rx_alloc_zc(flow, AM65_CPSW_MAX_RX_DESC);
+	} else {
+		for (i = 0; i < AM65_CPSW_MAX_RX_DESC; i++) {
+			page = page_pool_dev_alloc_pages(flow->page_pool);
+			if (!page) {
+				dev_err(common->dev, "cannot allocate page in flow %d\n",
+					id);
+				ret = -ENOMEM;
+				goto err;
+			}
 
-		ret = am65_cpsw_nuss_rx_push(common, page, id);
-		if (ret < 0) {
-			dev_err(common->dev,
-				"cannot submit page to rx channel flow %d, error %d\n",
-				id, ret);
-			am65_cpsw_put_page(flow, page, false);
-			goto err;
+			ret = am65_cpsw_nuss_rx_push(common, page, id);
+			if (ret < 0) {
+				dev_err(common->dev,
+					"cannot submit page to rx channel flow %d, error %d\n",
+					id, ret);
+				am65_cpsw_put_page(flow, page, false);
+				goto err;
+			}
 		}
 	}
 
@@ -772,6 +855,8 @@ static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
 	struct am65_cpsw_rx_chn *rx_chn = data;
 	struct cppi5_host_desc_t *desc_rx;
 	struct am65_cpsw_swdata *swdata;
+	struct am65_cpsw_rx_flow *flow;
+	struct xdp_buff *xdp;
 	dma_addr_t buf_dma;
 	struct page *page;
 	u32 buf_dma_len;
@@ -779,13 +864,20 @@ static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
 
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	page = swdata->page;
 	flow_id = swdata->flow_id;
 	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
 	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
-	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
-	am65_cpsw_put_page(&rx_chn->flows[flow_id], page, false);
+	flow = &rx_chn->flows[flow_id];
+	if (flow->xsk_pool) {
+		xdp = swdata->xdp;
+		xsk_buff_free(xdp);
+	} else {
+		page = swdata->page;
+		dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len,
+				 DMA_FROM_DEVICE);
+		am65_cpsw_put_page(flow, page, false);
+	}
 }
 
 static void am65_cpsw_nuss_xmit_free(struct am65_cpsw_tx_chn *tx_chn,
@@ -1264,6 +1356,151 @@ static void am65_cpsw_nuss_rx_csum(struct sk_buff *skb, u32 csum_info)
 	}
 }
 
+static struct sk_buff *am65_cpsw_create_skb_zc(struct am65_cpsw_rx_flow *flow,
+					       struct xdp_buff *xdp)
+{
+	unsigned int metasize = xdp->data - xdp->data_meta;
+	unsigned int datasize = xdp->data_end - xdp->data;
+	struct sk_buff *skb;
+
+	skb = napi_alloc_skb(&flow->napi_rx,
+			     xdp->data_end - xdp->data_hard_start);
+	if (unlikely(!skb))
+		return NULL;
+
+	skb_reserve(skb, xdp->data - xdp->data_hard_start);
+	memcpy(__skb_put(skb, datasize), xdp->data, datasize);
+	if (metasize)
+		skb_metadata_set(skb, metasize);
+
+	return skb;
+}
+
+static void am65_cpsw_dispatch_skb_zc(struct am65_cpsw_rx_flow *flow,
+				      struct am65_cpsw_port *port,
+				      struct xdp_buff *xdp, u32 csum_info)
+{
+	struct am65_cpsw_common *common = flow->common;
+	unsigned int len = xdp->data_end - xdp->data;
+	struct am65_cpsw_ndev_priv *ndev_priv;
+	struct net_device *ndev = port->ndev;
+	struct sk_buff *skb;
+
+	skb = am65_cpsw_create_skb_zc(flow, xdp);
+	if (!skb) {
+		ndev->stats.rx_dropped++;
+		return;
+	}
+
+	ndev_priv = netdev_priv(ndev);
+	am65_cpsw_nuss_set_offload_fwd_mark(skb, ndev_priv->offload_fwd_mark);
+	if (port->rx_ts_enabled)
+		am65_cpts_rx_timestamp(common->cpts, skb);
+
+	skb_mark_for_recycle(skb);
+	skb->protocol = eth_type_trans(skb, ndev);
+	am65_cpsw_nuss_rx_csum(skb, csum_info);
+	napi_gro_receive(&flow->napi_rx, skb);
+	dev_sw_netstats_rx_add(ndev, len);
+}
+
+static int am65_cpsw_nuss_rx_zc(struct am65_cpsw_rx_flow *flow, int budget)
+{
+	struct am65_cpsw_rx_chn *rx_chn = &flow->common->rx_chns;
+	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
+	struct am65_cpsw_common *common = flow->common;
+	struct cppi5_host_desc_t *desc_rx;
+	struct device *dev = common->dev;
+	struct am65_cpsw_swdata *swdata;
+	dma_addr_t desc_dma, buf_dma;
+	struct am65_cpsw_port *port;
+	struct net_device *ndev;
+	u32 flow_idx = flow->id;
+	struct xdp_buff	*xdp;
+	int count = 0;
+	int xdp_status = 0;
+	u32 *psdata;
+	int ret;
+
+	while (count < budget) {
+		ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_idx,
+					      &desc_dma);
+		if (ret) {
+			if (ret != -ENODATA)
+				dev_err(dev, "RX: pop chn fail %d\n",
+					ret);
+			break;
+		}
+
+		if (cppi5_desc_is_tdcm(desc_dma)) {
+			dev_dbg(dev, "%s RX tdown flow: %u\n",
+				__func__, flow_idx);
+			if (common->pdata.quirks & AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ)
+				complete(&common->tdown_complete);
+			continue;
+		}
+
+		desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool,
+						     desc_dma);
+		dev_dbg(dev, "%s flow_idx: %u desc %pad\n",
+			__func__, flow_idx, &desc_dma);
+
+		swdata = cppi5_hdesc_get_swdata(desc_rx);
+		xdp = swdata->xdp;
+		cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
+		k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
+		pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
+		cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
+		dev_dbg(dev, "%s rx port_id:%d\n", __func__, port_id);
+		port = am65_common_get_port(common, port_id);
+		ndev = port->ndev;
+		psdata = cppi5_hdesc_get_psdata(desc_rx);
+		csum_info = psdata[2];
+		dev_dbg(dev, "%s rx csum_info:%#x\n", __func__, csum_info);
+		k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
+		count++;
+		xsk_buff_set_size(xdp, pkt_len);
+		xsk_buff_dma_sync_for_cpu(xdp);
+		/* check if this port has XSK enabled. else drop packet */
+		if (port_id != flow->xsk_port_id) {
+			dev_dbg(dev, "discarding non xsk port data\n");
+			xsk_buff_free(xdp);
+			ndev->stats.rx_dropped++;
+			continue;
+		}
+
+		ret = am65_cpsw_run_xdp(flow, port, xdp, &pkt_len);
+		switch (ret) {
+		case AM65_CPSW_XDP_PASS:
+			am65_cpsw_dispatch_skb_zc(flow, port, xdp, csum_info);
+			xsk_buff_free(xdp);
+			break;
+		case AM65_CPSW_XDP_CONSUMED:
+			xsk_buff_free(xdp);
+			break;
+		case AM65_CPSW_XDP_TX:
+		case AM65_CPSW_XDP_REDIRECT:
+			xdp_status |= ret;
+			break;
+		}
+	}
+
+	if (xdp_status & AM65_CPSW_XDP_REDIRECT)
+		xdp_do_flush();
+
+	ret = am65_cpsw_nuss_rx_alloc_zc(flow, count);
+
+	if (xsk_uses_need_wakeup(flow->xsk_pool)) {
+		/* We set wakeup if we are exhausted of new requests */
+		if (ret < count)
+			xsk_set_rx_need_wakeup(flow->xsk_pool);
+		else
+			xsk_clear_rx_need_wakeup(flow->xsk_pool);
+	}
+
+	return count;
+}
+
 static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
 				     int *xdp_state)
 {
@@ -1403,17 +1640,21 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
 	int num_rx = 0;
 
 	/* process only this flow */
-	cur_budget = budget;
-	while (cur_budget--) {
-		ret = am65_cpsw_nuss_rx_packets(flow, &xdp_state);
-		xdp_state_or |= xdp_state;
-		if (ret)
-			break;
-		num_rx++;
-	}
+	if (flow->xsk_pool) {
+		num_rx = am65_cpsw_nuss_rx_zc(flow, budget);
+	} else {
+		cur_budget = budget;
+		while (cur_budget--) {
+			ret = am65_cpsw_nuss_rx_packets(flow, &xdp_state);
+			xdp_state_or |= xdp_state;
+			if (ret)
+				break;
+			num_rx++;
+		}
 
-	if (xdp_state_or & AM65_CPSW_XDP_REDIRECT)
-		xdp_do_flush();
+		if (xdp_state_or & AM65_CPSW_XDP_REDIRECT)
+			xdp_do_flush();
+	}
 
 	dev_dbg(common->dev, "%s num_rx:%d %d\n", __func__, num_rx, budget);
 
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index e80e74a74d71..0e44d8a6cd68 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -15,6 +15,7 @@
 #include <linux/soc/ti/k3-ringacc.h>
 #include <net/devlink.h>
 #include <net/xdp.h>
+#include <net/xdp_sock_drv.h>
 #include "am65-cpsw-qos.h"
 
 struct am65_cpts;
@@ -107,6 +108,8 @@ struct am65_cpsw_rx_flow {
 	struct hrtimer rx_hrtimer;
 	unsigned long rx_pace_timeout;
 	struct page_pool *page_pool;
+	struct xsk_buff_pool *xsk_pool;
+	int xsk_port_id;
 	char name[32];
 };
 
@@ -120,7 +123,10 @@ struct am65_cpsw_tx_swdata {
 
 struct am65_cpsw_swdata {
 	u32 flow_id;
-	struct page *page;
+	union {
+		struct page *page;
+		struct xdp_buff *xdp;
+	};
 };
 
 struct am65_cpsw_rx_chn {
@@ -248,4 +254,8 @@ static inline bool am65_cpsw_xdp_is_enabled(struct am65_cpsw_port *port)
 {
 	return !!READ_ONCE(port->xdp_prog);
 }
+
+struct xsk_buff_pool *am65_cpsw_xsk_get_pool(struct am65_cpsw_port *port,
+					     u32 qid);
+
 #endif /* AM65_CPSW_NUSS_H_ */
diff --git a/drivers/net/ethernet/ti/am65-cpsw-xdp.c b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
index e1ab81cb4548..e71ff38f851f 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-xdp.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
@@ -108,6 +108,9 @@ int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 {
 	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
 	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
+	struct am65_cpsw_rx_flow *rx_flow;
+
+	rx_flow = &common->rx_chns.flows[qid];
 
 	if (!netif_running(ndev) || !netif_carrier_ok(ndev))
 		return -ENETDOWN;
@@ -118,5 +121,26 @@ int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
 		return -EINVAL;
 
+	if (!rx_flow->xsk_pool)
+		return -EINVAL;
+
+	if (flags & XDP_WAKEUP_RX) {
+		if (!napi_if_scheduled_mark_missed(&rx_flow->napi_rx)) {
+			if (likely(napi_schedule_prep(&rx_flow->napi_rx)))
+				__napi_schedule(&rx_flow->napi_rx);
+		}
+	}
+
 	return 0;
 }
+
+struct xsk_buff_pool *am65_cpsw_xsk_get_pool(struct am65_cpsw_port *port,
+					     u32 qid)
+{
+	if (!am65_cpsw_xdp_is_enabled(port) ||
+	    !test_bit(qid, port->common->xdp_zc_queues) ||
+	    port->common->xsk_port_id[qid] != port->port_id)
+		return NULL;
+
+	return xsk_get_pool_from_qid(port->ndev, qid);
+}

-- 
2.34.1

