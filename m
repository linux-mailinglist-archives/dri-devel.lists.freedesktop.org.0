Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECEC69BC0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2AD10E4BA;
	Tue, 18 Nov 2025 13:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="gycNNDjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A401010E4B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWjCa8Jzv1wlDxCdXzGfvUu3OamATwZqJ/XtWL7alvMYb6HfQNAMFWYbCpjKoYs71aZ7vyv8zzfSWvlgbNFFSJldxomSayewmElGZ1mfkBGcA4g4OdH8F8JqxNxfqZ/x+xztvI22UnET4wOS9NWtQZyCrHx568y6cqW7J+qT0YtFsDHKKIgP2cU3F/fd4VfaHMJNUJdKQDJ8CodFcmC8YsxomDPsgwApoBnYrVFkTwCcTjepWMzs35TjpBElMsaxudq181qs/Le6O+6jDQNTyIB1fgZC/aRyI1QQREBRPdi/iAskAVKhKn6cQ9o2nnP++ta4qkP+LjhvXsJ1DpO+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB+teHW0iB5Yxuynnn2f7aIdonhm0p57w4dhjxKR50I=;
 b=nLm3fRIfB6Uu/4C7hG2nUKpsMEdt71bTcFwenJ8VzyxQWya/tXbq/ds9TOh+7hBxw7EzlSjoZHINY4Kbn3YxtAX/ZcO7uyY7r85YG1MSz3Iq6jdeUNH3GGzJAFphyTaoDj0MMm6zlsOsN+f55BOlom8MSd5CdVuBbkmJTniFJf+9t0WPRZiTgxatvxaCwL2n71IutwXCrxHsDWI/LO7qOe/627fRDo9OCp+WDZzAP9SNsUqa8O4vsu4GVH6RcKz8XMghJVrYzoXrcOAbu7m9MDG69cdJa/Z8LuN4Yt4W3mWaXTQi9yZfBDFfMlYbU5eIu9H/HPXZxHgK5yMsym71ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB+teHW0iB5Yxuynnn2f7aIdonhm0p57w4dhjxKR50I=;
 b=gycNNDjSSl0Zpf4JNCslhiNNULbsXowe3S26/SdzeOcp98bKtiSayB2gpW9rpAfKdCrnh73AzxFrS7eNAEk7TIO+TLU5CRw37Lj4rwKv+wdDPwmJFuuTU0q0NZAOGfPIL+AnezdZTvkmvDXIUVTCKlRno/5JozHJIr8m+W3EunY=
Received: from BL1PR13CA0204.namprd13.prod.outlook.com (2603:10b6:208:2be::29)
 by IA3PR10MB8419.namprd10.prod.outlook.com (2603:10b6:208:57f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 13:56:01 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::24) by BL1PR13CA0204.outlook.office365.com
 (2603:10b6:208:2be::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 13:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 13:56:00 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:55:57 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:55:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 07:55:57 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIDtvxs152620;
 Tue, 18 Nov 2025 07:55:57 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5AIDttHJ004187;
 Tue, 18 Nov 2025 07:55:56 -0600
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
Subject: [PATCH net-next v6 3/6] net: ti: icssg-prueth: Add AF_XDP zero copy
 for TX
Date: Tue, 18 Nov 2025 19:25:39 +0530
Message-ID: <20251118135542.380574-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118135542.380574-1-m-malladi@ti.com>
References: <20251118135542.380574-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA3PR10MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d7f92a-901f-44c3-2981-08de26aa34a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O7Zg2fOmJyfcnlobY9L1Y9NznFBpsyKpHBgJi6SrM/YAWojF2ig0oRXB+Qyi?=
 =?us-ascii?Q?k10WDl7uBcEk2d3/EffheVRZ7jJwYq5RwuBh+1U50K7tKL6Ax0egbKecb5BO?=
 =?us-ascii?Q?VBOpwmUU/1Bx1HYuTyp87JDnqL7uGcjRA8j0UDXOOoIV2Urn0hPBALWsnnpX?=
 =?us-ascii?Q?ShstjvY9yV+8jC9a6KU6Un1wAJGSjKdDKhFowF5P7D6e8LObl6eXbbbgBW+x?=
 =?us-ascii?Q?koLiP0NK54UsX3V24OWkTc519M2oBm0bvfzrLhIo6gksQvL4lX85/aytTCDx?=
 =?us-ascii?Q?u9N2U5/kInlJ5nebzLGRk+wkZY0Gw0MbS1xLJ3cZXp4sLK5kDbu2hQ/QbuB6?=
 =?us-ascii?Q?wW+l4dAJi2hh/Oh/hqB8rvXxDm4DoQj3/EJIVTm7nxvKOHjjNx6TCeWPFW5q?=
 =?us-ascii?Q?PQRArCrz3teCda2aZLKlfphnrtKPPkjm49AQKlMNsMHNzEzk1asT1duBu1TD?=
 =?us-ascii?Q?IAXpZv8EQWMvSxd3+LB1kqg8cepDj2SxK2J41PnUH8LUegpraSIQ/Mjefjrc?=
 =?us-ascii?Q?OlUwiEkGVehTcyrwDAODCSjsHcWKPt1plYwoaDTPSFzgFdd8lVfUL6mscH0n?=
 =?us-ascii?Q?imxH0PPMYzDBd9apISE8lqHRF7l1mscCme55KlnKhG3zkBoZNKVWOslJk8Zn?=
 =?us-ascii?Q?Fb2/IY/qPo1GCFLinsxcMQAGmXA+b1H5b3xzKP/BeuSbDRcHOiKL8Iy0uNV8?=
 =?us-ascii?Q?gim3EfPpjULujOciDNR+BNaRgCv9Ls0EUgWNbH1pRkcR/naLEvSCG6EeBsKr?=
 =?us-ascii?Q?00vIKtwEDQgWFTHpZ6zwOngfPIdo8NeOGV8MEezx8oa3Ny24a37b2tnInIzj?=
 =?us-ascii?Q?KkPeQeKb6LixuIl1GjMNHeIywWEbuBfsnOgIu4DuufOhQ5UKXIXfKe1wjGJJ?=
 =?us-ascii?Q?A98yvhdDb3QCDPx1aWNlVw2z0QLWXSlt6u7wKrMLmORAprhSuksk1uYxocH1?=
 =?us-ascii?Q?oBNQG2pGf+d1aIG2sYmoXgRniXZUix5IWcsk7E359CFQhqeYBln3TJwHOfhj?=
 =?us-ascii?Q?3+619aztUHbSHWsWqsK5tlk8uomEp0fqzqt6jDFHAPr6u0yK9v98l3JwPLk7?=
 =?us-ascii?Q?+REEEgJCUP45D60hFV1h98SVtDc0KIis/jaq/6RZsWaAL8yOcAXtMsWv70XI?=
 =?us-ascii?Q?In1iJCpx1aKHgtfAfxZR2Oc0S/rgZ4qh0lQ3VjUv7PWIexxoLUHgkMuviv8h?=
 =?us-ascii?Q?MOQ63/bw5gqViNHyif7RrNp8dhP5ZpcC0lg3a859wT7ed3kT0BeTi3+oQ11k?=
 =?us-ascii?Q?NWLkJgj3/6jWld4U9PTb6TquO1KYOWyP2VZqngAQ86U1nXkqGYLKecn8hLoA?=
 =?us-ascii?Q?OhK3JrKIU3IsSD9+LAkmRDGIsEacgDCqFL40iJJr4mDaV5S5vKHG7HMyi8YM?=
 =?us-ascii?Q?FgXsEd83xjQqvF0/guLV+zRhBVEM2P3aNQ91werI733u0yAs9WXKGv4iK6BQ?=
 =?us-ascii?Q?EOGoNgi6vaM0KodrHYZ12B9EJZfUqlX6NtOrrEmj8RcWA/kK4LLIiQ8NZ+1z?=
 =?us-ascii?Q?Prkl87RgSosXdwXPD1U2yq/dd60a+jTCI1smlVuhEukhNJLy57otGNOwrGFu?=
 =?us-ascii?Q?GBrECAvS671gdhBgU784PlcI7uJJhDuEw5kPuOdA?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:56:00.1503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d7f92a-901f-44c3-2981-08de26aa34a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8419
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

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 112 ++++++++++++++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  13 +++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
 3 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index cc52cff70d7e..d7469ad457fd 100644
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
index e4c3b6b152ea..bdce5a40defe 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1347,12 +1347,25 @@ static int emac_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
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
index a5e3774b0388..67339cdf2ddf 100644
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

