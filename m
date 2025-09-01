Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F1B3DF79
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746BA10E40C;
	Mon,  1 Sep 2025 10:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="uD2YItbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8323010E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:03:23 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581A2j9c2291725;
 Mon, 1 Sep 2025 05:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756720965;
 bh=l4BEtC2iiTf9PgfSAlq1KXiyiD3sXjre9TgCdb6pzZw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uD2YItbgYuh2QxdAvNKiToKMu0I1rMesDjGmnKudIDGqc6ADTpZqVod8qkmAJon+8
 deL3IZ63hRGCP7Kz1zdGv5zTbPHbDRh01EPzqu/6rcFCil2/bXzrO+GhnTvxTv9UYK
 u1Lj3AAFnkuNBeCXLDjbo+2lthQycvldOysrlPl8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581A2jvU1467229
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 1 Sep 2025 05:02:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 05:02:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 05:02:44 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581A2iKc2020985;
 Mon, 1 Sep 2025 05:02:44 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 581A2hRB011184;
 Mon, 1 Sep 2025 05:02:44 -0500
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
Subject: [PATCH net-next v2 4/6] net: ti: icssg-prueth: Make emac_run_xdp
 function independent of page
Date: Mon, 1 Sep 2025 15:32:25 +0530
Message-ID: <20250901100227.1150567-5-m-malladi@ti.com>
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

emac_run_xdp function runs xdp program, at a given hook point
in the Rx path of the driver in NAPI context and returns
XDP return codes. In zero copy mode the driver receives
packets using UMEM frames instead of pages (native XDP).
Decouple the usage of page in this function.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 28 +++++++++++++-------
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  3 ++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  9 +++++--
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 8ff1707a2328..529172e231dc 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -647,15 +647,15 @@ void emac_rx_timestamp(struct prueth_emac *emac,
  * emac_xmit_xdp_frame - transmits an XDP frame
  * @emac: emac device
  * @xdpf: data to transmit
- * @page: page from page pool if already DMA mapped
  * @q_idx: queue id
+ * @buff_type: Type of buffer to be transmitted
  *
  * Return: XDP state
  */
 u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 			struct xdp_frame *xdpf,
-			struct page *page,
-			unsigned int q_idx)
+			unsigned int q_idx,
+			enum prueth_tx_buff_type buff_type)
 {
 	struct cppi5_host_desc_t *first_desc;
 	struct net_device *ndev = emac->ndev;
@@ -663,6 +663,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 	struct prueth_tx_chn *tx_chn;
 	dma_addr_t desc_dma, buf_dma;
 	struct prueth_swdata *swdata;
+	struct page *page;
 	u32 *epib;
 	int ret;
 
@@ -679,7 +680,12 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 		return ICSSG_XDP_CONSUMED;	/* drop */
 	}
 
-	if (page) { /* already DMA mapped by page_pool */
+	if (buff_type == PRUETH_TX_BUFF_TYPE_XDP_TX) { /* already DMA mapped by page_pool */
+		page = virt_to_head_page(xdpf->data);
+		if (unlikely(!page)) {
+			netdev_err(ndev, "xdp tx: failed to get page from xdpf\n");
+			goto drop_free_descs;
+		}
 		buf_dma = page_pool_get_dma_addr(page);
 		buf_dma += xdpf->headroom + sizeof(struct xdp_frame);
 	} else { /* Map the linear buffer */
@@ -734,13 +740,11 @@ EXPORT_SYMBOL_GPL(emac_xmit_xdp_frame);
  * emac_run_xdp - run an XDP program
  * @emac: emac device
  * @xdp: XDP buffer containing the frame
- * @page: page with RX data if already DMA mapped
  * @len: Rx descriptor packet length
  *
  * Return: XDP state
  */
-static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
-			struct page *page, u32 *len)
+static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len)
 {
 	struct net_device *ndev = emac->ndev;
 	struct netdev_queue *netif_txq;
@@ -767,7 +771,8 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 		q_idx = cpu % emac->tx_ch_num;
 		netif_txq = netdev_get_tx_queue(ndev, q_idx);
 		__netif_tx_lock(netif_txq, cpu);
-		result = emac_xmit_xdp_frame(emac, xdpf, page, q_idx);
+		result = emac_xmit_xdp_frame(emac, xdpf, q_idx,
+					     PRUETH_TX_BUFF_TYPE_XDP_TX);
 		__netif_tx_unlock(netif_txq);
 		if (result == ICSSG_XDP_CONSUMED) {
 			ndev->stats.tx_dropped++;
@@ -792,7 +797,6 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 		fallthrough; /* handle aborts by dropping packet */
 	case XDP_DROP:
 		ndev->stats.rx_dropped++;
-		page_pool_recycle_direct(emac->rx_chns.pg_pool, page);
 		return ICSSG_XDP_CONSUMED;
 	}
 }
@@ -859,7 +863,11 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 		xdp_init_buff(&xdp, PAGE_SIZE, &rx_chn->xdp_rxq);
 		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
 
-		*xdp_state = emac_run_xdp(emac, &xdp, page, &pkt_len);
+		*xdp_state = emac_run_xdp(emac, &xdp, &pkt_len);
+		if (*xdp_state == ICSSG_XDP_CONSUMED) {
+			page_pool_recycle_direct(pool, page);
+			goto requeue;
+		}
 		if (*xdp_state != ICSSG_XDP_PASS)
 			goto requeue;
 		headroom = xdp.data - xdp.data_hard_start;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 5d2896f74987..6d31a13d9f2a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1154,7 +1154,8 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
 	__netif_tx_lock(netif_txq, cpu);
 	for (i = 0; i < n; i++) {
 		xdpf = frames[i];
-		err = emac_xmit_xdp_frame(emac, xdpf, NULL, q_idx);
+		err = emac_xmit_xdp_frame(emac, xdpf, q_idx,
+					  PRUETH_TX_BUFF_TYPE_XDP_NDO);
 		if (err != ICSSG_XDP_TX) {
 			ndev->stats.tx_dropped++;
 			break;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index d8b068194fb6..eb76df7b5187 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -153,6 +153,11 @@ enum prueth_swdata_type {
 	PRUETH_SWDATA_XSK,
 };
 
+enum prueth_tx_buff_type {
+	PRUETH_TX_BUFF_TYPE_XDP_TX,
+	PRUETH_TX_BUFF_TYPE_XDP_NDO,
+};
+
 struct prueth_swdata {
 	enum prueth_swdata_type type;
 	union prueth_data {
@@ -501,8 +506,8 @@ void prueth_put_cores(struct prueth *prueth, int slice);
 u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns);
 u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 			struct xdp_frame *xdpf,
-			struct page *page,
-			unsigned int q_idx);
+			unsigned int q_idx,
+			enum prueth_tx_buff_type buff_type);
 void prueth_rx_cleanup(void *data, dma_addr_t desc_dma);
 void prueth_tx_cleanup(void *data, dma_addr_t desc_dma);
 static inline bool prueth_xdp_is_enabled(struct prueth_emac *emac)
-- 
2.43.0

