Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD6C4CF46
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6760610E544;
	Tue, 11 Nov 2025 10:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="kEpDCiPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7310E540
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cN1tWsYGhHNqpcsAGaCS2RPOqq4OL0Ly4OMsBu2AGqg6vGOppLDVplGszv4WLMDVpaj4EYOtr5x/WELM36ZkP0B88v3hzZ+ogq1JdnOhazQLkD/cvUwdbPyyTXgpD+oQBE3GfXDr2rDmXRfZHUJISfiYpAk0dh7ZOSeFs1MWS19eN1s89tLs7j0j6Cp6uJXDWul1Ef+ZfeIjGa4nq93cNHwwrkdc4Npi6tjpPQxRs3WEAdB7zQd+0s47iy35l+wcYmiMGWK4L/+KU9ZVJ43OcltIsN58dcgeFb2nuvM6AIzFcjPp3mhEMr2AFhW1Q9i8CUU37iJpr933UNh9C0AWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLsFjHke8WVpfXWGgboxL3lmQjo8NONC2uzytbXA6oI=;
 b=RZ9CmuusklizimlJ3PaDcSJ5jEPTRkH2wc1vT5QNgTw9n9cLilbyRlHSRL1MER0SUZj7WU66f2529WmWKfEtl1KA//aio+pC1dGZTpyja7rHizxow+BRVO6Sv3jea7A/1oQ8Xrr8c3YG2mCkzPhyW708W7yDPMJLY2tlvlcUhT7NkcEDuUMC/OHabhWPd5HWPxHSMdsbVPJwjKSG+db8/cBUGAjT1GkXruAvp/vnIhcLUf/hl19FgAWb3pH+vr4D7fHOoSkdXkI4zWBxLeFuo0rwgOH4QLuH23kFP5yOGx8lFiCvvnyxfaWhMeVCYnKgapJKQA8Qq2CVekme6UequA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLsFjHke8WVpfXWGgboxL3lmQjo8NONC2uzytbXA6oI=;
 b=kEpDCiPobEd7ZDgEbuxt972FYkLihSnNSjgVJFlHyCFN2WIir6hvuIj5OmMhneyrDlrx3MuUM0LdK53QgMBMWLLrOwRcQS/kUEOBLrFmVoebfeChupQv3juPV83aGe16Y/Exdqh7jW8WU8CE4BjxjFPkt/NupTMyL97umEpEd48=
Received: from CH2PR19CA0017.namprd19.prod.outlook.com (2603:10b6:610:4d::27)
 by MW4PR10MB6510.namprd10.prod.outlook.com (2603:10b6:303:224::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 10:15:45 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::5c) by CH2PR19CA0017.outlook.office365.com
 (2603:10b6:610:4d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 10:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 10:15:43 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:38 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 04:15:38 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABAFcSV751649;
 Tue, 11 Nov 2025 04:15:38 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5ABAFbjV011913;
 Tue, 11 Nov 2025 04:15:38 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
 <jacob.e.keller@intel.com>, <m-malladi@ti.com>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v5 4/6] net: ti: icssg-prueth: Make emac_run_xdp
 function independent of page
Date: Tue, 11 Nov 2025 15:45:21 +0530
Message-ID: <20251111101523.3160680-5-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111101523.3160680-1-m-malladi@ti.com>
References: <20251111101523.3160680-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|MW4PR10MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e5d029-3e8c-4353-f2d7-08de210b461f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|82310400026|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0+lVBBfEE1gNXMIuKjpZ4cAk27WMdniy9p5aYHyiwWmknuk7oIoxuzba9oFe?=
 =?us-ascii?Q?zGrarnyAZkhpPw3yhqmJy5FPogPQq+st7O2FYnh1ecKSDi8sBlmQsn2U70v1?=
 =?us-ascii?Q?9s03x70EaYtLZk71T3w+x/+4jPdcTivjX4sXBIvgmVSfdhwSX5xKLktJfwe7?=
 =?us-ascii?Q?qWD9+uo3X49gn5cnZiw5xcPwEY/2tc03I8XjP4m8Xity3oFEqhIUnFEnJO08?=
 =?us-ascii?Q?SOqql0/i5a+6YNXjPENn6Gw+N5H5xulIJ6JBYrAZJJD9MpOhp/lKW86qdqFY?=
 =?us-ascii?Q?m1dCeXAGm7R1PEiNRPUCTF2dcgjfXSSi9omJiC9tEzBO15Rr+LLpKOwFuubP?=
 =?us-ascii?Q?Sq0o/mzYiD6OFetQuecPqu1hpognVzjUuR2KTc4+3EvvLVY7M9pqRq6bhHCG?=
 =?us-ascii?Q?G6mkswcuLKxlmnQR0ECvqd0z0aNl8FyOtghWObeqdIN/SSkTo0L9E0BX48SX?=
 =?us-ascii?Q?zYR6igSNIGAC3r7qbxCQOh68z91Hqet3NhIZGIhhpYp7BiFF0kL+O5RHM6f6?=
 =?us-ascii?Q?NvliU1nT0A8P5BLwuO4KlQAWO5kBjlgc5jOmtWIS4zZlYmtI3OvBr9gYeRf8?=
 =?us-ascii?Q?apt/BU2L/s3znrbaj1ZfqXWegMyNFb+JLv/Xy2K+TeroM2GHGqWjrOd0SC3/?=
 =?us-ascii?Q?SC29fugp3FuN/ZCKF7ltrYqrOesEd+6qF7SRh489WjKgtxU5/9xLxl7dh3Ky?=
 =?us-ascii?Q?HsyQ3qjon1Wl9Ql/AdsiLRpLG0uGAcj+kOwC9saiU56IXB27EyJfJeJwrtbP?=
 =?us-ascii?Q?5a024NXzkPktb5yLL97oga4lbL+9TJRp89lSCytYrzPQhbvT6NQ/QUy3BUaI?=
 =?us-ascii?Q?zpzbRpo4xoyX2paDer4kljcS7tWNxzjPwQJjm+uDvRMXyoWRYNR77MZ6qrqK?=
 =?us-ascii?Q?TCmRqx5Nn+9dp7XfRZkNCRK4U0BzHKVyk4NgCKwmYt970cs5OeaNR1kLagLe?=
 =?us-ascii?Q?Z4tHI0K8xU6qEBkVBtOPkaOo3nhSbcQW/dHauj+F3Jez/Jt82QvhJbbHW4LR?=
 =?us-ascii?Q?z/IO2l4mDwL6SrXAF4+xke/jN3DN+lX7kkqDZARd3hRKMGnCsHHJPEhxHN3u?=
 =?us-ascii?Q?FEieQrB5ol1UL5Gbo0fyrTL7YV+dj3RYSDI/E9shEMqGl5tbDdtpM6q9px8R?=
 =?us-ascii?Q?MhWCtgDSfGkIn7ThVuebBiorflBysxw9vcKu8R48rNiQ1drzym0Of7jbr96J?=
 =?us-ascii?Q?V9f3sYrRL9WkjjevaIAOWyNa9KCB3RevysuzzZEEZyq7vgVwI7V6dV6+QB5t?=
 =?us-ascii?Q?/R0i1u3bpHH8VqrN6/ZG4AvjPfsJgzE83tLYNKt0wS8HzcbMoUUkxfij1M5b?=
 =?us-ascii?Q?62Zioj2E4NeZ346nMG5MtLgsc+ehTEv4R72JdSLCoq+/KdJ469fuVXTzyQJA?=
 =?us-ascii?Q?QqkQNgV3iB9qgH/AB4al3UOlMlXNp0gwz2SU/+Ipofg73mncbjwYI62nMKuL?=
 =?us-ascii?Q?ALUSsBxv722CFzUXVfZuOAv6T65Cy0UU+SV9Wu15FSUbjMhJ1OXwObKBL5Yr?=
 =?us-ascii?Q?zybb3JJCJFZujU5B6R93ei+jamrMdg9jk5YG/auOkMi9j0FUA73yAGSw0YHk?=
 =?us-ascii?Q?lLZP09zIgR/Nl1Y42J5m6pKeG9iyuJ2fWzyVIfTi?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 10:15:43.7585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e5d029-3e8c-4353-f2d7-08de210b461f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6510
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

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 26 ++++++++++++--------
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  3 ++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  9 +++++--
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index d7469ad457fd..b88cfe99e8b7 100644
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
@@ -792,7 +797,8 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 		fallthrough; /* handle aborts by dropping packet */
 	case XDP_DROP:
 		ndev->stats.rx_dropped++;
-		page_pool_recycle_direct(emac->rx_chns.pg_pool, page);
+		page_pool_recycle_direct(emac->rx_chns.pg_pool,
+					 virt_to_head_page(xdp->data));
 		return ICSSG_XDP_CONSUMED;
 	}
 }
@@ -861,7 +867,7 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 		xdp_init_buff(&xdp, PAGE_SIZE, &rx_chn->xdp_rxq);
 		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
 
-		*xdp_state = emac_run_xdp(emac, &xdp, page, &pkt_len);
+		*xdp_state = emac_run_xdp(emac, &xdp, &pkt_len);
 		if (*xdp_state != ICSSG_XDP_PASS)
 			goto requeue;
 		headroom = xdp.data - xdp.data_hard_start;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index bdce5a40defe..bb8d42ba0102 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1185,7 +1185,8 @@ static int emac_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frame
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
index 67339cdf2ddf..3147a1d8f59a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -154,6 +154,11 @@ enum prueth_swdata_type {
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
@@ -506,8 +511,8 @@ void prueth_put_cores(struct prueth *prueth, int slice);
 u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns);
 u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 			struct xdp_frame *xdpf,
-			struct page *page,
-			unsigned int q_idx);
+			unsigned int q_idx,
+			enum prueth_tx_buff_type buff_type);
 void prueth_rx_cleanup(void *data, dma_addr_t desc_dma);
 void prueth_tx_cleanup(void *data, dma_addr_t desc_dma);
 int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags);
-- 
2.43.0

