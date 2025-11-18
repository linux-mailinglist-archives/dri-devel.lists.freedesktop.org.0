Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A5DC69BC9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A72010E4BC;
	Tue, 18 Nov 2025 13:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="pO+wLodr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690FE10E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGwLaY8SIY5tofTti9gMTPaYoTB2/fW5qA499dfYPo41+yGuA1TWPLOWj1yzaA6ZCV/BfypWaZWGhx0R/0J5vTgaswlqTdurI+FbSjJHspsab9sI4HPaB0vYJsWnxQjlVZVsa2TWI5w7KFWKUG5DCnmj4WMJ2UW0pHDLd0j4usjnlypHAqxxmxeaB/RaOH9+RxNrH+KTvtyM0y9niwo+U7ldEGqOBvHHab2AEt5C9dE22dnelWDjXplJHd1Ot7NGrV39Pt1Rvf51xSAl8tkgWtkxfQmoZgotuwvZ2x94wGO8EXwL14M5QYW7Cf3tlXn2rPz1Tfet/9eIxVyOaCJkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLsFjHke8WVpfXWGgboxL3lmQjo8NONC2uzytbXA6oI=;
 b=nCfZdKNZdBFK8+otxdPeKrUHaR6KrDOy95NEd6BW2TA5YokfUViE150oSXqXN+yBnbgcioN0xvTEPRA0dbW3vNMwxsRZpP73ESaEDSGBYSNiOZt8G658+cCfwaXIMIkfxcNKb3T4KXPv4QI2k/3gw+0g0+HzPZKc6HgWOgOXFy3XK3XMXgpslydnHa52IazGrwFMz8shSgN4biOweEan3caxHQJ3UNqYHvKHqiABPZMue1k0M7XOEBy13wUvOfND0DN3npllSA28+wGvM4gruIcLS/SSG1kB5r5xdIIP012Ro1XOa00cVC2A1ntdleQZONSNKhdnoyLF/9giETjVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLsFjHke8WVpfXWGgboxL3lmQjo8NONC2uzytbXA6oI=;
 b=pO+wLodrvRbjdIdzRz0ny2JiIofb1E1YYYtAJx+YzMjsUaAOKfCvDHtCNE5/fqV5dQZQQH3IRMTGL0CClUwfU30d1EN1UZa7uXlw3d5+wIHuquz7oS2YAUqi/lP/51olqw8WlzB5uBVu6/UfKzIZf0vuJZzX/OSBLVnZJKstDn4=
Received: from BL1PR13CA0182.namprd13.prod.outlook.com (2603:10b6:208:2be::7)
 by LV0PR10MB997638.namprd10.prod.outlook.com (2603:10b6:408:346::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 13:56:04 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::d9) by BL1PR13CA0182.outlook.office365.com
 (2603:10b6:208:2be::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 13:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 13:56:04 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:56:00 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:56:00 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 07:56:00 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
 by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIDu029648305;
 Tue, 18 Nov 2025 07:56:00 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5AIDtx3X004192;
 Tue, 18 Nov 2025 07:55:59 -0600
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
Subject: [PATCH net-next v6 4/6] net: ti: icssg-prueth: Make emac_run_xdp
 function independent of page
Date: Tue, 18 Nov 2025 19:25:40 +0530
Message-ID: <20251118135542.380574-5-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118135542.380574-1-m-malladi@ti.com>
References: <20251118135542.380574-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|LV0PR10MB997638:EE_
X-MS-Office365-Filtering-Correlation-Id: c876b318-07a6-4d87-a15b-08de26aa371b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?13Lh6cVfrxMayo7mzWXdhtJ7Aa5hnawH6E/pH122LvRuyMuY6dvQkx72+PaA?=
 =?us-ascii?Q?a6XqrjGFdr18oI8STNCz/puW7HnwMPHAaIsP5wg5x2BNAoQOV7Oz/zqxDC/9?=
 =?us-ascii?Q?MRTDkqUxodWZ17xNFeZZ0CXhnvf1eTonC13nd89SHiWgSXq9CJCSKZGpK9ME?=
 =?us-ascii?Q?Uvb8gF7EGe0B8JCA+pYnhufrZJQrL6+kPYMQ2SlArixYUq6ns1Ax5XdlNpI8?=
 =?us-ascii?Q?ZpD7oMZf8n0xfmhv2IGSpyxdL80+M3HIQy3tSI3M5C7o3qA1+83rTE3MIUTI?=
 =?us-ascii?Q?EkrazQid4Q4ctHIKbP9rnIrhnTQf8K8cQ91XEKslpW+sAvHHB6zsEQFMHwax?=
 =?us-ascii?Q?hTsRB/YEhmZpeSVmwGYc0QDjRsP3qz0yINCUlf2QZXh+j+3M7P3LVeQOm61w?=
 =?us-ascii?Q?pd6/M2R7HGvAIfU+Uh4yS3r3gwzE2yZRT7FA1kbO4RglxP/x8UlrjNsMX228?=
 =?us-ascii?Q?/u+75t58JB0+3rDldKobG7HBzRb0cFWKX7BZzxB+6BekNp5d8FV6sfaXKpCU?=
 =?us-ascii?Q?oa9GYlnAj5TwPGje5Jc0CZVfaAQouFkztdh/fuyP0Gze435Cw32mrMcxcIER?=
 =?us-ascii?Q?4Fd1WiW+rb2yREbczfc9p1tUEAcSk98sGejP/ByV4beCIleDd2LYLOYyZW+E?=
 =?us-ascii?Q?++BhudaOSXdWwMXwmeBoMO9rGf2kcXh2fSC3JR+b18uuPi+Gxl+2DjX41H2S?=
 =?us-ascii?Q?zBzgXdgu5YG/NcJ2f/vTypM3BFLTNoCIZ+jsCBV7i/Rw/K8An7RA4/6nFAVd?=
 =?us-ascii?Q?RORQZhtCQ/jigEVyvbYEm3+xojfpdlxjJmjmgLd1Iwf0nbN6u5gxMsGKzgiM?=
 =?us-ascii?Q?JojV1vj/Ko533nQZrevIapGKXUmde6STIVXtPAa7HOkcwHwIR5tqCaTXGifz?=
 =?us-ascii?Q?6e01iflzbp+WeDnjmJlU79LeWJH7qk92Syb7n4U69ldDlX9egtKPKRwHxs4i?=
 =?us-ascii?Q?LWKjfVM7K+LqkU9DTqGbXO4xea+K97llbnWpyMMrNbtsYIxfH+zNRb3V+Rwk?=
 =?us-ascii?Q?UJsphX3Di1PLYGTz5CGdEmXVkK1wfQ3iFLz9WQaP4jXZL+GpdpnbF3jWWOMI?=
 =?us-ascii?Q?Zn1Z332XIbn43mQQIpwbu+0hpR2vI80l124KHwy/IOtBHGFCJpKV7hW+iUou?=
 =?us-ascii?Q?J0F2WiQR142qk4Obe/I1kkCmGycI4YzVKcDkBrplUxu5weXJDt1R5tuDlLcZ?=
 =?us-ascii?Q?OQJEcQ3mQOvOJYnxnMWVqfLvo/LWddeWwR2vbrJAVcEEfFLl58mdIClzWeov?=
 =?us-ascii?Q?aACyLv5LHb4xioHiGRPwSs3rNnkBAG+pV5TXDQiJIU6cTcA4uPGHno5E5KLk?=
 =?us-ascii?Q?t5Raw8cmqcAv0W7wenqQMbTTlLhGf5dy/0bPAN3eGIjto4ZsO+ag9PYAb9na?=
 =?us-ascii?Q?5U958QFI4q/krg952HKfLVCD6ResLk2TuSr2pcyJKaKkQfmf5nIrKz7AOcUl?=
 =?us-ascii?Q?QyncJswtFNJUWvfzCtGtNE1nTE+6Tx+hHRgvGpkaUvcvMUnS26GTsQeJJyQb?=
 =?us-ascii?Q?0NGPQfSUgp6/eIdcV5kSIstTqjW0y37p7toCHIpn/87gMV12YhABX2c9odyu?=
 =?us-ascii?Q?j13x+icj/3CWfEJ6ZgVPfykXCobI3kT7BfOWdsQ4?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:56:04.2487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c876b318-07a6-4d87-a15b-08de26aa371b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997638
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

