Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58590ABD47F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CE310E40B;
	Tue, 20 May 2025 10:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TaBo/s6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7328910E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:24:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D7A00614B7;
 Tue, 20 May 2025 10:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DDCC4CEEB;
 Tue, 20 May 2025 10:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747736660;
 bh=jyablavjxf0FtJa9g7V3FV8B2RVy7Em6vHSsqZjLPcI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TaBo/s6R9uT+v0yLNJDFC9BNJqCY5DUOuojW7IB1+YPR1AQsHl19o118R2oE9Duf9
 VTWPhKLH+SS7QM0u5a/DwjvF7Yqlrl74o/DCcpbj/lPtKcXtgGuQejgSPW0NGKi0b/
 xoSb73LERPDLlfRHCMqGHQbDouwvKTB1E04vf2m0SF4lvl3WWVPjAM4oXZsNZBypYy
 L14ImHhsIm78Y+EjWpqftgqzOL1uT9Fn4USnG9L4d2LVffqAKpvUSz2Lehcd9+/AWq
 MucRJuC7OY+EpM/yssY6n52FX4G0itUcDxw6KmAyf2NxnilKWT3HnaI5fyiPNogUZy
 3sthtJ8Aljx4A==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 20 May 2025 13:23:53 +0300
Subject: [PATCH RFC net-next 4/5] net: ethernet: ti: am65-cpsw: Add AF_XDP
 zero copy for TX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-am65-cpsw-xdp-zc-v1-4-45558024f566@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13337; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=jyablavjxf0FtJa9g7V3FV8B2RVy7Em6vHSsqZjLPcI=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoLFg9W19nNTzeoFAT0cLhutFVcqP5zfq3E/PlV
 MG60CKll1yJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCxYPQAKCRDSWmvTvnYw
 kydjEACWBGDF+NLNXEn+48W1q8OlGSMEsTi0fsLnw8hp5KzRnXN4IwGz14CyvCJM5TXH9QaOhKX
 Z1Fv04OA37GZZasxaOmGAd8wincJihcOQrXOZ+gkSjDIi39jmgCkGM7NDxuRgPR8cmIzMxIpAVE
 /E9XEgvAtMTPW0LFTdDqxXyU+j3cZiDpkhvScLbZC5T53lW3BXyCnvFMDMawREACRcA4ESY2wtT
 HZ+o/ANrUqyWsqCYXZnUJ9OrrR1N8krHeB0MX0SVcVREbXX0KhgRbsIeGp85rrj1SgxEzqagu4+
 vLNMnPZVQ/t0TkaaMqMnM2AF6yg7FEm6V9ehTFgVqINQYwuMJGx8SXs4Q1Zydb9bcXKun3yLQAA
 /wsl8OQpr/XyDJGWEA7/bXKHY7cqla53FRBYJP29c7sSEi8UIxl4gFYPKfYInQkwgoyQGYt6num
 N4yamIekLxo2QFSdGXbTZ2B04BbdisWtGTOKYWOLohl9mTruIGQ3a/OpNbAnNSG7mf7eIF6WLhu
 bKfy5dXEnvJcHrUNYGM5cg1fqpa/nPZgFPNiTHAWL1XesZ/DcUwTkrK9PyWXJ7oLn2/MEDCZcJa
 XCTsnjF3lmjnb2GFaBYfa8V6BYLSt8AuVvReVSAG+nKZpCL07gFG1S07i9dWw4aLm89fFhahz4O
 MC0R3iftew9Bqcg==
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

Add zero copy support to TX path.

Introduce xsk_pool and xsk_port_id to struct am65_cpsw_tx_chn.
This way we can quickly check if the flow is setup as XSK pool
and for which port.

If the TX channel is setup as XSK pool then get the frames from
the pool and send it to the TX channel.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 170 ++++++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |   5 +
 drivers/net/ethernet/ti/am65-cpsw-xdp.c  |  11 +-
 3 files changed, 170 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 5fbf04880722..e89b3cefcb05 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -747,6 +747,8 @@ void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id)
 	k3_udma_glue_reset_tx_chn(tx_chn->tx_chn, tx_chn,
 				  am65_cpsw_nuss_tx_cleanup);
 	k3_udma_glue_disable_tx_chn(tx_chn->tx_chn);
+	tx_chn->xsk_pool = NULL;
+	tx_chn->xsk_port_id = -EINVAL;
 }
 
 static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
@@ -775,12 +777,22 @@ static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
 int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id)
 {
 	struct am65_cpsw_tx_chn *tx_chn = &common->tx_chns[id];
-	int ret;
+	int port, ret;
 
 	ret = k3_udma_glue_enable_tx_chn(tx_chn->tx_chn);
 	if (ret)
 		return ret;
 
+	/* get first port with XSK pool & XDP program set */
+	for (port = 0; port < common->port_num; port++) {
+		tx_chn->xsk_pool = am65_cpsw_xsk_get_pool(&common->ports[port],
+							  id);
+		if (tx_chn->xsk_pool)
+			break;
+	}
+
+	tx_chn->xsk_port_id = tx_chn->xsk_pool ?
+			      common->ports[port].port_id : -EINVAL;
 	napi_enable(&tx_chn->napi_tx);
 
 	return 0;
@@ -881,15 +893,18 @@ static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
 }
 
 static void am65_cpsw_nuss_xmit_free(struct am65_cpsw_tx_chn *tx_chn,
-				     struct cppi5_host_desc_t *desc)
+				     struct cppi5_host_desc_t *desc,
+				     enum am65_cpsw_tx_buf_type buf_type)
 {
 	struct cppi5_host_desc_t *first_desc, *next_desc;
 	dma_addr_t buf_dma, next_desc_dma;
 	u32 buf_dma_len;
 
 	first_desc = desc;
-	next_desc = first_desc;
+	if (buf_type == AM65_CPSW_TX_BUF_TYPE_XSK_TX)
+		goto free_pool;
 
+	next_desc = first_desc;
 	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
 	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
 
@@ -912,6 +927,7 @@ static void am65_cpsw_nuss_xmit_free(struct am65_cpsw_tx_chn *tx_chn,
 		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
 	}
 
+free_pool:
 	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
 }
 
@@ -921,21 +937,32 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
 	enum am65_cpsw_tx_buf_type buf_type;
 	struct am65_cpsw_tx_swdata *swdata;
 	struct cppi5_host_desc_t *desc_tx;
+	struct xsk_buff_pool *xsk_pool;
 	struct xdp_frame *xdpf;
 	struct sk_buff *skb;
 
 	desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_tx);
 	buf_type = am65_cpsw_nuss_buf_type(tx_chn, desc_dma);
-	if (buf_type == AM65_CPSW_TX_BUF_TYPE_SKB) {
+	switch (buf_type) {
+	case AM65_CPSW_TX_BUF_TYPE_SKB:
 		skb = swdata->skb;
 		dev_kfree_skb_any(skb);
-	} else {
+		break;
+	case AM65_CPSW_TX_BUF_TYPE_XDP_TX:
+	case AM65_CPSW_TX_BUF_TYPE_XDP_NDO:
 		xdpf = swdata->xdpf;
 		xdp_return_frame(xdpf);
+		break;
+	case AM65_CPSW_TX_BUF_TYPE_XSK_TX:
+		xsk_pool = swdata->xsk_pool;
+		xsk_tx_completed(xsk_pool, 1);
+		break;
+	default:
+		break;
 	}
 
-	am65_cpsw_nuss_xmit_free(tx_chn, desc_tx);
+	am65_cpsw_nuss_xmit_free(tx_chn, desc_tx, buf_type);
 }
 
 static struct sk_buff *am65_cpsw_build_skb(void *page_addr,
@@ -1180,6 +1207,82 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
 	return ret;
 }
 
+static int am65_cpsw_xsk_xmit_zc(struct net_device *ndev,
+				 struct am65_cpsw_tx_chn *tx_chn)
+{
+	struct am65_cpsw_common *common = tx_chn->common;
+	struct xsk_buff_pool *pool = tx_chn->xsk_pool;
+	struct xdp_desc *xdp_descs = pool->tx_descs;
+	struct cppi5_host_desc_t *host_desc;
+	struct am65_cpsw_tx_swdata *swdata;
+	dma_addr_t dma_desc, dma_buf;
+	int num_tx = 0, pkt_len;
+	int descs_avail, ret;
+	int i;
+
+	descs_avail = k3_cppi_desc_pool_avail(tx_chn->desc_pool);
+	/* ensure that TX ring is not filled up by XDP, always MAX_SKB_FRAGS
+	 * will be available for normal TX path and queue is stopped there if
+	 * necessary
+	 */
+	if (descs_avail <= MAX_SKB_FRAGS)
+		return 0;
+
+	descs_avail -= MAX_SKB_FRAGS;
+	descs_avail = xsk_tx_peek_release_desc_batch(pool, descs_avail);
+
+	for (i = 0; i < descs_avail; i++) {
+		host_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
+		if (unlikely(!host_desc))
+			break;
+
+		am65_cpsw_nuss_set_buf_type(tx_chn, host_desc,
+					    AM65_CPSW_TX_BUF_TYPE_XSK_TX);
+		dma_buf = xsk_buff_raw_get_dma(pool, xdp_descs[i].addr);
+		pkt_len = xdp_descs[i].len;
+		xsk_buff_raw_dma_sync_for_device(pool, dma_buf, pkt_len);
+
+		cppi5_hdesc_init(host_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
+				 AM65_CPSW_NAV_PS_DATA_SIZE);
+		cppi5_hdesc_set_pkttype(host_desc, AM65_CPSW_CPPI_TX_PKT_TYPE);
+		cppi5_hdesc_set_pktlen(host_desc, pkt_len);
+		cppi5_desc_set_pktids(&host_desc->hdr, 0,
+				      AM65_CPSW_CPPI_TX_FLOW_ID);
+		cppi5_desc_set_tags_ids(&host_desc->hdr, 0,
+					tx_chn->xsk_port_id);
+
+		k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &dma_buf);
+		cppi5_hdesc_attach_buf(host_desc, dma_buf, pkt_len, dma_buf,
+				       pkt_len);
+
+		swdata = cppi5_hdesc_get_swdata(host_desc);
+		swdata->ndev = ndev;
+		swdata->xsk_pool = pool;
+
+		dma_desc = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool,
+						      host_desc);
+		if (AM65_CPSW_IS_CPSW2G(common)) {
+			ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn,
+						       host_desc, dma_desc);
+		} else {
+			spin_lock_bh(&tx_chn->lock);
+			ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn,
+						       host_desc, dma_desc);
+			spin_unlock_bh(&tx_chn->lock);
+		}
+
+		if (ret) {
+			ndev->stats.tx_errors++;
+			k3_cppi_desc_pool_free(tx_chn->desc_pool, host_desc);
+			break;
+		}
+
+		num_tx++;
+	}
+
+	return num_tx;
+}
+
 static int am65_cpsw_xdp_tx_frame(struct net_device *ndev,
 				  struct am65_cpsw_tx_chn *tx_chn,
 				  struct xdp_frame *xdpf,
@@ -1703,15 +1806,19 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
 	struct netdev_queue *netif_txq;
 	unsigned int total_bytes = 0;
 	struct net_device *ndev;
+	int xsk_frames_done = 0;
 	struct xdp_frame *xdpf;
 	unsigned int pkt_len;
 	struct sk_buff *skb;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
+	int xsk_tx = 0;
 
 	tx_chn = &common->tx_chns[chn];
 
 	while (true) {
+		pkt_len = 0;
+
 		if (!single_port)
 			spin_lock(&tx_chn->lock);
 		res = k3_udma_glue_pop_tx_chn(tx_chn->tx_chn, &desc_dma);
@@ -1733,25 +1840,36 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
 		swdata = cppi5_hdesc_get_swdata(desc_tx);
 		ndev = swdata->ndev;
 		buf_type = am65_cpsw_nuss_buf_type(tx_chn, desc_dma);
-		if (buf_type == AM65_CPSW_TX_BUF_TYPE_SKB) {
+		switch (buf_type) {
+		case AM65_CPSW_TX_BUF_TYPE_SKB:
 			skb = swdata->skb;
 			am65_cpts_tx_timestamp(tx_chn->common->cpts, skb);
 			pkt_len = skb->len;
 			napi_consume_skb(skb, budget);
-		} else {
+			total_bytes += pkt_len;
+			break;
+		case AM65_CPSW_TX_BUF_TYPE_XDP_TX:
+		case AM65_CPSW_TX_BUF_TYPE_XDP_NDO:
 			xdpf = swdata->xdpf;
 			pkt_len = xdpf->len;
+			total_bytes += pkt_len;
 			if (buf_type == AM65_CPSW_TX_BUF_TYPE_XDP_TX)
 				xdp_return_frame_rx_napi(xdpf);
 			else
 				xdp_return_frame(xdpf);
+			break;
+		case AM65_CPSW_TX_BUF_TYPE_XSK_TX:
+			pkt_len = cppi5_hdesc_get_pktlen(desc_tx);
+			xsk_frames_done++;
+			break;
+		default:
+			break;
 		}
 
-		total_bytes += pkt_len;
 		num_tx++;
-		am65_cpsw_nuss_xmit_free(tx_chn, desc_tx);
+		am65_cpsw_nuss_xmit_free(tx_chn, desc_tx, buf_type);
 		dev_sw_netstats_tx_add(ndev, 1, pkt_len);
-		if (!single_port) {
+		if (!single_port && buf_type != AM65_CPSW_TX_BUF_TYPE_XSK_TX) {
 			/* as packets from multi ports can be interleaved
 			 * on the same channel, we have to figure out the
 			 * port/queue at every packet and report it/wake queue.
@@ -1768,6 +1886,19 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
 		am65_cpsw_nuss_tx_wake(tx_chn, ndev, netif_txq);
 	}
 
+	if (tx_chn->xsk_pool) {
+		if (xsk_frames_done)
+			xsk_tx_completed(tx_chn->xsk_pool, xsk_frames_done);
+
+		if (xsk_uses_need_wakeup(tx_chn->xsk_pool))
+			xsk_set_tx_need_wakeup(tx_chn->xsk_pool);
+
+		ndev = common->ports[tx_chn->xsk_port_id].ndev;
+		netif_txq = netdev_get_tx_queue(ndev, chn);
+		txq_trans_cond_update(netif_txq);
+		xsk_tx = am65_cpsw_xsk_xmit_zc(ndev, tx_chn);
+	}
+
 	dev_dbg(dev, "%s:%u pkt:%d\n", __func__, chn, num_tx);
 
 	return num_tx;
@@ -1778,7 +1909,11 @@ static enum hrtimer_restart am65_cpsw_nuss_tx_timer_callback(struct hrtimer *tim
 	struct am65_cpsw_tx_chn *tx_chns =
 			container_of(timer, struct am65_cpsw_tx_chn, tx_hrtimer);
 
-	enable_irq(tx_chns->irq);
+	if (tx_chns->irq_disabled) {
+		tx_chns->irq_disabled = false;
+		enable_irq(tx_chns->irq);
+	}
+
 	return HRTIMER_NORESTART;
 }
 
@@ -1799,7 +1934,10 @@ static int am65_cpsw_nuss_tx_poll(struct napi_struct *napi_tx, int budget)
 				      ns_to_ktime(tx_chn->tx_pace_timeout),
 				      HRTIMER_MODE_REL_PINNED);
 		} else {
-			enable_irq(tx_chn->irq);
+			if (tx_chn->irq_disabled) {
+				tx_chn->irq_disabled = false;
+				enable_irq(tx_chn->irq);
+			}
 		}
 	}
 
@@ -1821,6 +1959,7 @@ static irqreturn_t am65_cpsw_nuss_tx_irq(int irq, void *dev_id)
 {
 	struct am65_cpsw_tx_chn *tx_chn = dev_id;
 
+	tx_chn->irq_disabled = true;
 	disable_irq_nosync(irq);
 	napi_schedule(&tx_chn->napi_tx);
 
@@ -1985,14 +2124,14 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 err_free_descs:
-	am65_cpsw_nuss_xmit_free(tx_chn, first_desc);
+	am65_cpsw_nuss_xmit_free(tx_chn, first_desc, AM65_CPSW_TX_BUF_TYPE_SKB);
 err_free_skb:
 	ndev->stats.tx_dropped++;
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
 
 busy_free_descs:
-	am65_cpsw_nuss_xmit_free(tx_chn, first_desc);
+	am65_cpsw_nuss_xmit_free(tx_chn, first_desc, AM65_CPSW_TX_BUF_TYPE_SKB);
 busy_stop_q:
 	netif_tx_stop_queue(netif_txq);
 	return NETDEV_TX_BUSY;
@@ -2246,6 +2385,7 @@ static const struct net_device_ops am65_cpsw_nuss_netdev_ops = {
 	.ndo_set_tx_maxrate	= am65_cpsw_qos_ndo_tx_p0_set_maxrate,
 	.ndo_bpf		= am65_cpsw_ndo_bpf,
 	.ndo_xdp_xmit		= am65_cpsw_ndo_xdp_xmit,
+	.ndo_xsk_wakeup		= am65_cpsw_xsk_wakeup,
 };
 
 static void am65_cpsw_disable_phy(struct phy *phy)
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 0e44d8a6cd68..0152767e8436 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
@@ -72,6 +72,7 @@ enum am65_cpsw_tx_buf_type {
 	AM65_CPSW_TX_BUF_TYPE_SKB,
 	AM65_CPSW_TX_BUF_TYPE_XDP_TX,
 	AM65_CPSW_TX_BUF_TYPE_XDP_NDO,
+	AM65_CPSW_TX_BUF_TYPE_XSK_TX,
 };
 
 struct am65_cpsw_host {
@@ -97,6 +98,9 @@ struct am65_cpsw_tx_chn {
 	unsigned char dsize_log2;
 	char tx_chn_name[128];
 	u32 rate_mbps;
+	struct xsk_buff_pool *xsk_pool;
+	int xsk_port_id;
+	bool irq_disabled;
 };
 
 struct am65_cpsw_rx_flow {
@@ -118,6 +122,7 @@ struct am65_cpsw_tx_swdata {
 	union {
 		struct sk_buff *skb;
 		struct xdp_frame *xdpf;
+		struct xsk_buff_pool *xsk_pool;
 	};
 };
 
diff --git a/drivers/net/ethernet/ti/am65-cpsw-xdp.c b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
index e71ff38f851f..b8b35ce702b1 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-xdp.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
@@ -109,8 +109,10 @@ int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
 	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
 	struct am65_cpsw_rx_flow *rx_flow;
+	struct am65_cpsw_tx_chn *tx_ch;
 
 	rx_flow = &common->rx_chns.flows[qid];
+	tx_ch = &common->tx_chns[qid];
 
 	if (!netif_running(ndev) || !netif_carrier_ok(ndev))
 		return -ENETDOWN;
@@ -121,9 +123,16 @@ int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
 		return -EINVAL;
 
-	if (!rx_flow->xsk_pool)
+	if (!rx_flow->xsk_pool && !tx_ch->xsk_pool)
 		return -EINVAL;
 
+	if (flags & XDP_WAKEUP_TX) {
+		if (!napi_if_scheduled_mark_missed(&tx_ch->napi_tx)) {
+			if (likely(napi_schedule_prep(&tx_ch->napi_tx)))
+				__napi_schedule(&tx_ch->napi_tx);
+		}
+	}
+
 	if (flags & XDP_WAKEUP_RX) {
 		if (!napi_if_scheduled_mark_missed(&rx_flow->napi_rx)) {
 			if (likely(napi_schedule_prep(&rx_flow->napi_rx)))

-- 
2.34.1

