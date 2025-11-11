Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D925BC4CF37
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BADD10E53F;
	Tue, 11 Nov 2025 10:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="P91JOPPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7415C10E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLJHpLTC0SoiwOQEkQJkpoI8SKBpdIjRd7E/V8VB0Sb8I+LkMC6HuG/a3C8G3XOX8231yOXkIgpaNqaxNmRiCbbQTBilSYdVEQcI0RLQZ7VxOZaCc49RB6POqcguf4aJSddYjXRu6ztgXQJFbsPHhXwZoCarlXk6ZFwy5X8DOGEw1azhYAiLCCL6j7TqmVWoXc3O9X211nuQHvObVMUJhx4JHRAJnaC3qDFt7cJDEQeMfEk1WfHp0/g+IsB5s2ROvbmjg4ygMvn1O4IWBupDIOqPNgGJdm+Fom+prX80x1we150DWEWNfqitNpcUS7uxo7ndTLjLRyH5SJa3rDEXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB+teHW0iB5Yxuynnn2f7aIdonhm0p57w4dhjxKR50I=;
 b=qeCvpXL8560n+zJva1CXzPV8hAcqTRfGuJlaZ/j+NqC5flViyE/A2K9XLcBFPoeZ85Mhy7GgOC6AwzBCP9sOlOtv6G2YhQxTJ25o7QdsBaR3TkwLRS/GbJJbVugPUuXYp6+pyA2/14kp2o08lG1i9PIJmgfZua6h7tUlXXoWUrmKod/2NtvEzo/xaQ83c2uG0MHQ+M8MTrEthpF68bzASHQMUjYuiD7NXIf7SmlTcIHGDSgKO6YNjaP7R4t5WRf1BWEnVm86677DyaObCq2dtgds80QNjWrtBaLwMQVttLaM9u1z6jBvcKViGrM+roLZeXzechxUUAugDbCByy9oCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB+teHW0iB5Yxuynnn2f7aIdonhm0p57w4dhjxKR50I=;
 b=P91JOPPXoxMnUBKJ7nct+aPVYD++u3LW05ijwywuv/GorbWtoMSM2e+8cGno0dtTEboct0olASHq4ZJQMKNTyZbCKbpwBwdx/Rdvq+aLzo3zfPoiSvMmrmf5gyB3zsW6cL71jrYN93vnJejH8+nkDpl2Ci+Dhu5AtolLjdLIpmQ=
Received: from DS7PR03CA0056.namprd03.prod.outlook.com (2603:10b6:5:3b5::31)
 by BN0PR10MB4965.namprd10.prod.outlook.com (2603:10b6:408:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 10:15:38 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::13) by DS7PR03CA0056.outlook.office365.com
 (2603:10b6:5:3b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 10:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 10:15:36 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:36 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:36 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 04:15:36 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABAFaW01794087;
 Tue, 11 Nov 2025 04:15:36 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5ABAFZqv011907;
 Tue, 11 Nov 2025 04:15:35 -0600
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
Subject: [PATCH net-next v5 3/6] net: ti: icssg-prueth: Add AF_XDP zero copy
 for TX
Date: Tue, 11 Nov 2025 15:45:20 +0530
Message-ID: <20251111101523.3160680-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111101523.3160680-1-m-malladi@ti.com>
References: <20251111101523.3160680-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|BN0PR10MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bf7bd3-a543-46b8-9f9b-08de210b421d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xTbe5xv7Qoj3PzB59jtQlK+Mr0rYjCnlM8+oOtioe3UavjMD+jFXCjPmLBPR?=
 =?us-ascii?Q?8YaYGXvVD7XhfOcn8aEkAV7Jn0lMnQKXfyb+CLzqmZw7tuar67vw7hzG3q7G?=
 =?us-ascii?Q?iwfE3a5Rw1mpeLfBVv/yhNz/K16jbcJ9v/IT7wQ4WJP79SvC3S1ngVSkJEH2?=
 =?us-ascii?Q?JnVxXh8M6kwZazsctdxWnjFINE9s51NwQyrxRf70OaQcpQGRRlafrkLCIGxc?=
 =?us-ascii?Q?O7VU981WIZ1UQJxVH/26BTQhQrmqynabUK0878xQyWggeaTlieqxAQwAn1bD?=
 =?us-ascii?Q?J2u8yNINzkcuYOtZ85aOiV3Nn8B5wFU1LMpeNr1Liizq7mu1GH1LlFmVug/r?=
 =?us-ascii?Q?MLuglDZLtyuek8yeeNXlzSBWMDQCdTlh107lPNWNdnxlkXtCXs65f25kZYdw?=
 =?us-ascii?Q?jfRBY5remIQMGvCXwtqtQmeT5U917+54q53fqXx8d8zBh2LG7lZ5Sa0MwA/u?=
 =?us-ascii?Q?4Tj6VVW0bhJRRbc5qqU7cBY4sWvXmFPl+ARXZWQ6E9jYITJDvHra/ghiVX9y?=
 =?us-ascii?Q?kTia1rjui9IYhvBirUyeNukDK37qCXZ7FnapkpYXmgax+9Z7nvwL7wc4nnqU?=
 =?us-ascii?Q?zrB+nRBgz2gdBloqcjofQWnnc9V5ZbHcGQr8hRl29eac7plRCIGezetjflN2?=
 =?us-ascii?Q?xHyilr+pvuf3HUoPWErwyuewDBEL3T6dZsbmXse/bNaPJEoLBTV/D/wp4lWK?=
 =?us-ascii?Q?1caPuiH4EQFWKc+hij4s31ALtjUouci56XY5TkEabkaudhcqFEYc57ZnZOn6?=
 =?us-ascii?Q?FCwQlLTtnopR73VzR84cukBcmhacBOfLMw+LEDcOff+iFEIq5W3guw08I1k+?=
 =?us-ascii?Q?7Xo3CZ8THU0GXJov7mhwPv0kPzbTck/KK+29nJjga7Nxy2OCJCOAunfYmA+n?=
 =?us-ascii?Q?BbD0POyCAwjz8cUlU+adSGJdX2b7BVzBTloom2obRu0LtA3j1f/vbPiQeDKe?=
 =?us-ascii?Q?W/0ORJG5xLdVx0j3/xNeFdHIFUsty1GflHhIIDV2x7C2NgtBcqpQ0IUtACQP?=
 =?us-ascii?Q?qpO1gdUl//HVLxDEcbrK0Ej93ZDD9tY1D1nbBMuQk+0RdATOnXUbAsQrvk7P?=
 =?us-ascii?Q?e2QjhMOG6IgQ/MA1klKUKt6nkGWzJQaV835M376rEoWutoBIZIQfxYyrpZf1?=
 =?us-ascii?Q?LZd2FYN6sTC1O5SGZrYX8o8JsL06Qm9LZIgUbq4G5l1FMYwWuoz2mSzWcYyr?=
 =?us-ascii?Q?TLotNNhxZUYDaJraODH3qPdxWxORi1gbf7iNn1b1xD2s+Nbsw+SHnoomBJKL?=
 =?us-ascii?Q?mC6d78rIFb1YtzuJiFSUdagLU+rXy2LEgzIaOjOu0AyDVu80YtTXT/CFk3MZ?=
 =?us-ascii?Q?g1PMHQHl1K8M9MPlHNxhtEk3F4QcLi9ZxPVjOBdNyKJPXwIqfAIlQLJ24onK?=
 =?us-ascii?Q?xLeOoGUudu+lwFcPuRc0fOOKro4H8i/PBqbyHJVXK0+dBnaqmVuatrCwGDhJ?=
 =?us-ascii?Q?aXDuEsnP4m0JPRrCB+/t10xnLkhUKcJlY9saxCjZtCjNP+bYwBNS/s1Q7l6q?=
 =?us-ascii?Q?AIlBRpyOTGOaD+gc2fnK6nZIH6y1Pp5XcMHhPSGIFtzp19rUrdxV4aMj7GRQ?=
 =?us-ascii?Q?phV3W30UddYhI00XdjyLVnMXWU+H+hxbE7Ae5zrX?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 10:15:36.9964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bf7bd3-a543-46b8-9f9b-08de210b421d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4965
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

