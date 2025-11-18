Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64388C69BD0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CC010E4BD;
	Tue, 18 Nov 2025 13:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="mmVO8/ht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012008.outbound.protection.outlook.com
 [40.107.200.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D319810E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYfyh85Bg9NSmI+8SDqbdy24u4xtGrWAb3yPeppGJQkm3ma/+f1bklG2l/wJsjmSGcI7NfMlrpBEBwWJoDMO/++07e4r4YXXOCwRL0UKmEQf/sefyUzKi9x6nFA2STcDMphn9Wj45mHpW02f73hvGSQv7pLNuwxVtFq96C8ZM+Ouqqfj4yXalDj224UkGl25QYs6jryH1/j0vgvlBknNTpElwfIPFCwxVnzJoBXmklxDj5SXQMq2xJQeD7HuRtNbQfcLGq2PIofiBFZ98ThWejKjPNgEnswqZZmCowyNZKe4hrrFyc0dC3faQgUC3xFZ00TStOeOpWL5xWWy/tu6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov5fg9RnDjFSJF7U/AlkuHO0K2Jh/ytcbujJzad2jgk=;
 b=YGueSEMbEsp1FM6oPsvuLyoQG9DVFUacyae9o6W/2CNtQsPcrId++ynNXBhSxFktaH1/KgsKsFp5n7eCoA2wsNdrO6Y49yktzoumlKW8oH1aSRanawx2vqZF1NbLDcMf6aSlcVLRNgvFcMIaExT19O0SvnRD57/fqquDHYXkNdAGnOd8lA4819szSjLI5QqVoPJ7FKodLqEGBXebHV5sJFB/djxjuUPlVx5M8KpQ3b9kFX8WLebZHK6qowGzmiGqPnWRpIfYhuIC/tXeqVXgU1n9MUTycMNuY1kXsYNURiVdL2dShhhc9y00F58eDNByW2VxKMUD82oMFq+5OVyF9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov5fg9RnDjFSJF7U/AlkuHO0K2Jh/ytcbujJzad2jgk=;
 b=mmVO8/htmxmsR3OpYQsrtknDq48EiOmM1IrEX4jSM21jPhmkbN9tVDncSTrU7I5T/bjPrg5rY0JDPxCOSs/skH8GaZn40f5pikOhbqtZpluya82CbldCltK5Paom3Rif563x/lHhN2AFiu3AmvGAT4ZVgaVH8Xa3wpK9VGg0UkE=
Received: from SA0PR11CA0184.namprd11.prod.outlook.com (2603:10b6:806:1bc::9)
 by BL3PR10MB6137.namprd10.prod.outlook.com (2603:10b6:208:3b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 13:56:09 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::f6) by SA0PR11CA0184.outlook.office365.com
 (2603:10b6:806:1bc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 13:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 13:56:08 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:56:03 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:56:03 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 07:56:03 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
 by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIDu3rB606002;
 Tue, 18 Nov 2025 07:56:03 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5AIDu1li004199;
 Tue, 18 Nov 2025 07:56:02 -0600
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
Subject: [PATCH net-next v6 5/6] net: ti: icssg-prueth: Add AF_XDP zero copy
 for RX
Date: Tue, 18 Nov 2025 19:25:41 +0530
Message-ID: <20251118135542.380574-6-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118135542.380574-1-m-malladi@ti.com>
References: <20251118135542.380574-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|BL3PR10MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fe9af8-85cf-4b6a-418f-08de26aa39c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z2KIuz5bXp4bLGnqHyFD2hyrH/F7KVkKXyM/ub9Xaa+UvKuKddKCRv3hK7u3?=
 =?us-ascii?Q?cbr2ANN5+Q3JZEyoCQEy8AwA7z3nUJnxNQ0JzhNiD7YgiUsV2ALbpmu2UQYw?=
 =?us-ascii?Q?xTWhI8azz8K0bq0YBNxn6qwElbui8neGD1o7GIJFxk9U2O3Fz170rIe0VFYq?=
 =?us-ascii?Q?PJCVhPNry/nm3IBLR8T3aayv4EsUqpn4wGHDZqs8Ls0hPHSHOZRm5GoLG7jA?=
 =?us-ascii?Q?cFekzAdg9uO7hidH9Ftc77b7uzIYsjm3TxiLKJCtvyZpJYLI6F/LWu5ahUn2?=
 =?us-ascii?Q?7Oy1cEE8MYV0OGs81uLIhQmCApwL6oxfey95lYwKWQjCGwgNL/PQ40JHWckd?=
 =?us-ascii?Q?E6xHq6JFbtXF17byIrOKh6UcEdylNkii/wfJ4YnUy+uCfYbVpcR7hJC+wwbt?=
 =?us-ascii?Q?3OJ70A5YPXYWrptqpudPzDihFcaGxasXDY/6nydJqhEdULJwkhZGhMVqOtVh?=
 =?us-ascii?Q?8iHSGOAtbXrc8duDVeFThqX2Fqh6/c1hwCCVXjOLTTVjhH7EqSUcXgD/O8Bj?=
 =?us-ascii?Q?3lZgqYjVB2/aFHMyHmg+c/zvSrN7W8XJtPy/kZtsCGJkHaVs4IRay8KEpRAp?=
 =?us-ascii?Q?xy1ELlj+XquRQLny5m+8CFf7IeS09yWLgL9tNhNRrmcDo230gFJ5X4++4L1Q?=
 =?us-ascii?Q?wd98wyhN/eb9teftYsFiEP3S02xGGjT3pL9wFiM6hOSjMjSl3lVRdwh6Cz2r?=
 =?us-ascii?Q?rKeruzJo8ZKeFoTDd00ZKCTsJUVxeAzb01ahD9jOjI2MfgliKD1538uHXJky?=
 =?us-ascii?Q?IXrLJAGzQ6Ea8bojSvoEUIPSUcXpGGhrFhVmIHJqZg5zI+JVtfGyc1mnshhP?=
 =?us-ascii?Q?bj2HIM7FSATXUk7EqP/fm7uY0KbsGsRvQIIegsqVC98TC6nORxTw77o3dsqY?=
 =?us-ascii?Q?cLSY3rHWjJ8VQecm+GKg4j9CAY9cmS29Thqehkl3ZGozyi8FoGjUoxXWu3bG?=
 =?us-ascii?Q?/6A8ZnPssSHm9L5ywrNeul6BZ3J0c95NSEuvtawzziT3muYhR8IxCid72rZ/?=
 =?us-ascii?Q?PR/SxItU9VWHafhzl5qLDEpSiHRkEphBzfZB/iuNlm3WUmZ74YdbuqeI5IOV?=
 =?us-ascii?Q?92V7429TQ/z/0e3FWn+Wcu/vwV/EBi2s9X0OOkHy8U8EfVeTTIlS9HLQmV7U?=
 =?us-ascii?Q?+MpgJDyGBuOPm+TX0YzWICWb0EKUyL9hGfW6Oam5biUGR97+TvY3D5MDnjyd?=
 =?us-ascii?Q?6IlSbKwydzdS+Urp63aejzQQdcNGLMQWZLjXZwsIAml2Rch+vlUzI36tyh5K?=
 =?us-ascii?Q?a3AjG73tLDNNy2fiV+tLteVI4C15WdsL+mfGNqwQT5CGpKmyjy0LOrzpY2Wc?=
 =?us-ascii?Q?CxTc8GNoNUeSW74H3751ehd2egsnkzyX/mE3vKU58faSJYbYVspUt49LjbpW?=
 =?us-ascii?Q?o+F6X06NpXmNKa+tOtOGAWTXSl2tfGevxy6r+gonwpdB/aLJaLHY81+XLMZG?=
 =?us-ascii?Q?Smxxybb9b0qjiXo+Zyn+isvFhJuBuqlEM8F8kUTn73Wqiy7bSsNHn19Znl6u?=
 =?us-ascii?Q?fD/MKoetXZo66r3YRvcsVomTUHwWsEfx7lh9L3u51kbwdy0rQzJJPd3MvpNX?=
 =?us-ascii?Q?u1CpGDHZguDooTeQhwlorkovszau/BhhH3FpXXiV?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:56:08.8494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fe9af8-85cf-4b6a-418f-08de26aa39c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6137
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

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---

v6-v5:
- Removed the dead code inside prueth_dma_rx_push_mapped_zc() function
  as reported by Simon Horman <horms@kernel.org>

 drivers/net/ethernet/ti/icssg/icssg_common.c | 323 +++++++++++++++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  60 +++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
 3 files changed, 313 insertions(+), 72 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index b88cfe99e8b7..090aa74d3ce7 100644
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
@@ -797,12 +829,188 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len
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
@@ -849,7 +1057,6 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 	/* firmware adds 4 CRC bytes, strip them */
 	pkt_len -= 4;
 	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
-
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
 	/* if allocation fails we drop the packet but push the
@@ -921,12 +1128,16 @@ void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
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
@@ -1174,6 +1385,7 @@ irqreturn_t prueth_rx_irq(int irq, void *dev_id)
 {
 	struct prueth_emac *emac = dev_id;
 
+	emac->rx_chns.irq_disabled = true;
 	disable_irq_nosync(irq);
 	napi_schedule(&emac->napi_rx);
 
@@ -1201,6 +1413,7 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 		PRUETH_RX_FLOW_DATA_SR1 : PRUETH_RX_FLOW_DATA;
 	int flow = emac->is_sr1 ?
 		PRUETH_MAX_RX_FLOWS_SR1 : PRUETH_MAX_RX_FLOWS;
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
 	int xdp_state_or = 0;
 	int num_rx = 0;
 	int cur_budget;
@@ -1208,14 +1421,18 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
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
@@ -1231,7 +1448,11 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
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
 
@@ -1239,62 +1460,48 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
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
index bb8d42ba0102..22de04ac18cb 100644
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

