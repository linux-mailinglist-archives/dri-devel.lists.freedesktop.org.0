Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8431C447F6
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 22:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4671810E277;
	Sun,  9 Nov 2025 21:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V19xPEkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A845410E277
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 21:39:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D4B3446AB;
 Sun,  9 Nov 2025 21:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D73C4AF0D;
 Sun,  9 Nov 2025 21:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762724342;
 bh=yZDjsw7EWrQMT8Z5kEDaqMC+c+zkVy5QHbXnLygqNXs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=V19xPEkBSzjaqzbAZRvV8O9sbrSVjUIvu6C9RH91sPlsv2LbBSOE5nygwTvq2Z35T
 IxW3B67NFmYD7hvKp9UPY3Eupgk9BLpAESNLn7XI6lfiP6poP9/6h7CWv105Pei/Cl
 aqR77R+edyle64sQTovTdEfesPepISpmJ6LFNTKV887qTPyDmbvLUtanvpGJU8Z3h3
 nxM5500Y+isEaNaLnnutsiSgckzLbs1rc+LBDubOZMER6GPV0pBOdoehMuWBZXx9Ec
 Dy+61uqB7B1hYbQWT8/BOwGxOoWn2/1fq3WXCEV6gdnx4qg+Oq5duBhdUs/Ae8nchg
 Xr2RgnENMxknQ==
From: Roger Quadros <rogerq@kernel.org>
Date: Sun, 09 Nov 2025 23:37:55 +0200
Subject: [PATCH net-next v2 5/7] net: ethernet: ti: am65-cpsw: Add AF_XDP
 zero copy for TX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-am65-cpsw-xdp-zc-v2-5-858f60a09d12@kernel.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Simon Horman <horms@kernel.org>
Cc: srk@ti.com, Meghana Malladi <m-malladi@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13581; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=yZDjsw7EWrQMT8Z5kEDaqMC+c+zkVy5QHbXnLygqNXs=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBpEQnZq0zF4jgKCs2OMHWL6QhnUAh909BXkpdoI
 y+GfkCC9huJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaREJ2QAKCRDSWmvTvnYw
 k5giD/0V24C1D4sCAm5QRfCSRJVGr0SElles+RWAIocGvfKtruXO4VfzQnQhncsI1rRGrXYOeeA
 BbrtF73Qk4QWRWNniPBSU9ulu1TuVuoSZV+OpReXNIwA+ZOOcMFCjy0jPMdjjELC7vGs4YAliOM
 HXPgoXYK0L4che90ydxmVfuflKGTMJOTqAmmGYgjsjQ4WMsUedCQFv4iUrtcLG75/CgYxDYAOZ/
 yvY0FzyCKipide485NxQG+uyQkKNSswhbGCrsSUfOE/kCJitFl4jIdJq2kDewZtNNqWRHPsM1/e
 9k0hvxu3mTxzu07h7B064ro3en0AEF9/qyF6NF8Iju0yAIHgtpgT5IcTacQwxMDLWR76Dr2LyxC
 3pLvkElriLBS3U/dVBFign/a3e3q5+3Ukh9qVC5dnGM/bj2eynPO51Ljt0xG9cPptDWrAHAC7zz
 kMk5hZU8MgYoHi17mCYnMmoISaZses9Jc5jmqdqrwmwZCYTBnNCc79IeNWzBGKWrmAnPYMCTIID
 S82H9dAp4qvryGcXtkVEsVjQd1w1SKa2wgDjVNa/PLDhu6nitgoSsqiZjCwtDrqygqky3LYTC1m
 HBMmRxvYPVQR7ifwmAl3xgl3ZHIvM/jeRv7miIabVPIj174qsNP6xcC/Qrm3Q0xcDEKwsiT6Tjd
 NYtNfG7sx921CTA==
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
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 171 ++++++++++++++++++++++++++++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.h |   5 +
 drivers/net/ethernet/ti/am65-cpsw-xdp.c  |  11 +-
 3 files changed, 171 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index afc0c8836fe242d8bf47ce9bcd3e6b725ca37bf9..2e06e7df23ad5249786d081e51434f87dd2a76b5 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -758,6 +758,8 @@ void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id)
 	k3_udma_glue_reset_tx_chn(tx_chn->tx_chn, tx_chn,
 				  am65_cpsw_nuss_tx_cleanup);
 	k3_udma_glue_disable_tx_chn(tx_chn->tx_chn);
+	tx_chn->xsk_pool = NULL;
+	tx_chn->xsk_port_id = -EINVAL;
 }
 
 static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
@@ -786,12 +788,25 @@ static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
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
+		if (!common->ports[port].ndev)
+			continue;
+
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
@@ -892,15 +907,18 @@ static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
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
 
@@ -923,6 +941,7 @@ static void am65_cpsw_nuss_xmit_free(struct am65_cpsw_tx_chn *tx_chn,
 		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
 	}
 
+free_pool:
 	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
 }
 
@@ -932,21 +951,32 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
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
@@ -1189,6 +1219,82 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
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
@@ -1716,15 +1822,19 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
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
@@ -1746,25 +1856,36 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
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
@@ -1781,6 +1902,19 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
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
@@ -1791,7 +1925,11 @@ static enum hrtimer_restart am65_cpsw_nuss_tx_timer_callback(struct hrtimer *tim
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
 
@@ -1811,7 +1949,8 @@ static int am65_cpsw_nuss_tx_poll(struct napi_struct *napi_tx, int budget)
 			hrtimer_start(&tx_chn->tx_hrtimer,
 				      ns_to_ktime(tx_chn->tx_pace_timeout),
 				      HRTIMER_MODE_REL_PINNED);
-		} else {
+		} else if (tx_chn->irq_disabled) {
+			tx_chn->irq_disabled = false;
 			enable_irq(tx_chn->irq);
 		}
 	}
@@ -1834,6 +1973,7 @@ static irqreturn_t am65_cpsw_nuss_tx_irq(int irq, void *dev_id)
 {
 	struct am65_cpsw_tx_chn *tx_chn = dev_id;
 
+	tx_chn->irq_disabled = true;
 	disable_irq_nosync(irq);
 	napi_schedule(&tx_chn->napi_tx);
 
@@ -1998,14 +2138,14 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
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
@@ -2259,6 +2399,7 @@ static const struct net_device_ops am65_cpsw_nuss_netdev_ops = {
 	.ndo_xdp_xmit		= am65_cpsw_ndo_xdp_xmit,
 	.ndo_hwtstamp_get       = am65_cpsw_nuss_hwtstamp_get,
 	.ndo_hwtstamp_set       = am65_cpsw_nuss_hwtstamp_set,
+	.ndo_xsk_wakeup		= am65_cpsw_xsk_wakeup,
 };
 
 static void am65_cpsw_disable_phy(struct phy *phy)
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
index 2bf4d12f92764706719cc1d65001dbb53da58c38..ac2d9d32e95b932665131a317df8316cb6cb7f96 100644
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
index 0e37c27f77720713430a3e70f6c4b3dfb048cfc0..9adf13056f70fea36d9aeac157b7da0cae2c011e 100644
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

