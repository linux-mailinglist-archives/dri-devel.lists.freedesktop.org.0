Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0DBD8D59
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 12:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8D610E205;
	Tue, 14 Oct 2025 10:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="jKWcpuKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75310E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:57:04 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EAuSm21130392;
 Tue, 14 Oct 2025 05:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760439388;
 bh=G2K5Aeb6m5SJmmjXQpnpEaIqv7GMiSzYDXd/neYgy1M=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=jKWcpuKxK0wi9WKe6X8q5HWPP7OV7ziSGIP59/H0nw8zdsgs+xXf7nbc+X2ZnDYzL
 KxYT3ww1m49+6cPmOU4vHoOde9B2eoKg7DX+n84e1KXqVg6jxEpzBhdK713MjnBQ+e
 suazWTE30n92QsS23WeI2cnynS7RHBMb9c8dGOC4=
Received: from DLEE210.ent.ti.com (dlee210.ent.ti.com [157.170.170.112])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EAuSJK386986
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Oct 2025 05:56:28 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 05:56:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 05:56:27 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EAuR6m3673097;
 Tue, 14 Oct 2025 05:56:27 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 59EAuQg7009031;
 Tue, 14 Oct 2025 05:56:27 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <m-malladi@ti.com>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 3/6] net: ti: icssg-prueth: Add AF_XDP zero copy
 for TX
Date: Tue, 14 Oct 2025 16:26:09 +0530
Message-ID: <20251014105613.2808674-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014105613.2808674-1-m-malladi@ti.com>
References: <20251014105613.2808674-1-m-malladi@ti.com>
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

Use xsk_pool inside tx_chn to check if a given Tx queue id
is registered for xsk zero copy, which gets populated during
xsk enable

If xsk_pool is set, get frames from the pool in NAPI
context and submit them to the Tx channel. Tx completion
is also handled in the NAPI context.

Use PRUETH_SWDATA_XSK to recycle xsk buffers back to the
umem pool. Add XDP_WAKEUP_TX support to enable xsk_wakeup
for Tx.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 112 ++++++++++++++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  13 +++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
 3 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index cbe898af3b4c..b526f246ecb9 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -93,15 +93,91 @@ void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num)
 }
 EXPORT_SYMBOL_GPL(prueth_ndev_del_tx_napi);
 
+static int emac_xsk_xmit_zc(struct prueth_emac *emac,
+			    unsigned int q_idx)
+{
+	struct prueth_tx_chn *tx_chn = &emac->tx_chns[q_idx];
+	struct xsk_buff_pool *pool = tx_chn->xsk_pool;
+	struct net_device *ndev = emac->ndev;
+	struct cppi5_host_desc_t *host_desc;
+	dma_addr_t dma_desc, dma_buf;
+	struct prueth_swdata *swdata;
+	struct xdp_desc xdp_desc;
+	int num_tx = 0, pkt_len;
+	int descs_avail, ret;
+	u32 *epib;
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
+
+	for (i = 0; i < descs_avail; i++) {
+		if (!xsk_tx_peek_desc(pool, &xdp_desc))
+			break;
+
+		dma_buf = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
+		pkt_len = xdp_desc.len;
+		xsk_buff_raw_dma_sync_for_device(pool, dma_buf, pkt_len);
+
+		host_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
+		if (unlikely(!host_desc))
+			break;
+
+		cppi5_hdesc_init(host_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
+				 PRUETH_NAV_PS_DATA_SIZE);
+		cppi5_hdesc_set_pkttype(host_desc, 0);
+		epib = host_desc->epib;
+		epib[0] = 0;
+		epib[1] = 0;
+		cppi5_hdesc_set_pktlen(host_desc, pkt_len);
+		cppi5_desc_set_tags_ids(&host_desc->hdr, 0,
+					(emac->port_id | (q_idx << 8)));
+
+		k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &dma_buf);
+		cppi5_hdesc_attach_buf(host_desc, dma_buf, pkt_len, dma_buf,
+				       pkt_len);
+
+		swdata = cppi5_hdesc_get_swdata(host_desc);
+		swdata->type = PRUETH_SWDATA_XSK;
+
+		dma_desc = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool,
+						      host_desc);
+		ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn,
+					       host_desc, dma_desc);
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
+	xsk_tx_release(tx_chn->xsk_pool);
+	return num_tx;
+}
+
 void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 		      struct cppi5_host_desc_t *desc)
 {
 	struct cppi5_host_desc_t *first_desc, *next_desc;
 	dma_addr_t buf_dma, next_desc_dma;
+	struct prueth_swdata *swdata;
 	u32 buf_dma_len;
 
 	first_desc = desc;
 	next_desc = first_desc;
+	swdata = cppi5_hdesc_get_swdata(first_desc);
+	if (swdata->type == PRUETH_SWDATA_XSK)
+		goto free_pool;
 
 	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
 	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
@@ -126,6 +202,7 @@ void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
 	}
 
+free_pool:
 	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
 }
 EXPORT_SYMBOL_GPL(prueth_xmit_free);
@@ -139,7 +216,9 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 	struct prueth_swdata *swdata;
 	struct prueth_tx_chn *tx_chn;
 	unsigned int total_bytes = 0;
+	int xsk_frames_done = 0;
 	struct xdp_frame *xdpf;
+	unsigned int pkt_len;
 	struct sk_buff *skb;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
@@ -176,6 +255,11 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 			total_bytes += xdpf->len;
 			xdp_return_frame(xdpf);
 			break;
+		case PRUETH_SWDATA_XSK:
+			pkt_len = cppi5_hdesc_get_pktlen(desc_tx);
+			dev_sw_netstats_tx_add(ndev, 1, pkt_len);
+			xsk_frames_done++;
+			break;
 		default:
 			prueth_xmit_free(tx_chn, desc_tx);
 			ndev->stats.tx_dropped++;
@@ -204,6 +288,18 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 		__netif_tx_unlock(netif_txq);
 	}
 
+	if (tx_chn->xsk_pool) {
+		if (xsk_frames_done)
+			xsk_tx_completed(tx_chn->xsk_pool, xsk_frames_done);
+
+		if (xsk_uses_need_wakeup(tx_chn->xsk_pool))
+			xsk_set_tx_need_wakeup(tx_chn->xsk_pool);
+
+		netif_txq = netdev_get_tx_queue(ndev, chn);
+		txq_trans_cond_update(netif_txq);
+		emac_xsk_xmit_zc(emac, chn);
+	}
+
 	return num_tx;
 }
 
@@ -212,7 +308,10 @@ static enum hrtimer_restart emac_tx_timer_callback(struct hrtimer *timer)
 	struct prueth_tx_chn *tx_chns =
 			container_of(timer, struct prueth_tx_chn, tx_hrtimer);
 
-	enable_irq(tx_chns->irq);
+	if (tx_chns->irq_disabled) {
+		tx_chns->irq_disabled = false;
+		enable_irq(tx_chns->irq);
+	}
 	return HRTIMER_NORESTART;
 }
 
@@ -235,7 +334,10 @@ static int emac_napi_tx_poll(struct napi_struct *napi_tx, int budget)
 				      ns_to_ktime(tx_chn->tx_pace_timeout_ns),
 				      HRTIMER_MODE_REL_PINNED);
 		} else {
-			enable_irq(tx_chn->irq);
+			if (tx_chn->irq_disabled) {
+				tx_chn->irq_disabled = false;
+				enable_irq(tx_chn->irq);
+			}
 		}
 	}
 
@@ -246,6 +348,7 @@ static irqreturn_t prueth_tx_irq(int irq, void *dev_id)
 {
 	struct prueth_tx_chn *tx_chn = dev_id;
 
+	tx_chn->irq_disabled = true;
 	disable_irq_nosync(irq);
 	napi_schedule(&tx_chn->napi_tx);
 
@@ -1032,6 +1135,7 @@ void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_tx_chn *tx_chn = data;
 	struct cppi5_host_desc_t *desc_tx;
+	struct xsk_buff_pool *xsk_pool;
 	struct prueth_swdata *swdata;
 	struct xdp_frame *xdpf;
 	struct sk_buff *skb;
@@ -1048,6 +1152,10 @@ void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 		xdpf = swdata->data.xdpf;
 		xdp_return_frame(xdpf);
 		break;
+	case PRUETH_SWDATA_XSK:
+		xsk_pool = tx_chn->xsk_pool;
+		xsk_tx_completed(xsk_pool, 1);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 2c18b561a46c..78778f0e8f4a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1339,12 +1339,25 @@ static int emac_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
 int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_tx_chn *tx_chn = &emac->tx_chns[qid];
 
 	if (qid >= PRUETH_MAX_RX_FLOWS || qid >= emac->tx_ch_num) {
 		netdev_err(ndev, "Invalid XSK queue ID %d\n", qid);
 		return -EINVAL;
 	}
 
+	if (!tx_chn->xsk_pool) {
+		netdev_err(ndev, "XSK pool not registered for queue %d\n", qid);
+		return -EINVAL;
+	}
+
+	if (flags & XDP_WAKEUP_TX) {
+		if (!napi_if_scheduled_mark_missed(&tx_chn->napi_tx)) {
+			if (likely(napi_schedule_prep(&tx_chn->napi_tx)))
+				__napi_schedule(&tx_chn->napi_tx);
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 50f40eaa103a..90b3e9c9e148 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -129,6 +129,7 @@ struct prueth_tx_chn {
 	struct hrtimer tx_hrtimer;
 	unsigned long tx_pace_timeout_ns;
 	struct xsk_buff_pool *xsk_pool;
+	bool irq_disabled;
 };
 
 struct prueth_rx_chn {
@@ -150,6 +151,7 @@ enum prueth_swdata_type {
 	PRUETH_SWDATA_PAGE,
 	PRUETH_SWDATA_CMD,
 	PRUETH_SWDATA_XDPF,
+	PRUETH_SWDATA_XSK,
 };
 
 struct prueth_swdata {
-- 
2.43.0

