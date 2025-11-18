Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54251C69BBD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A675D10E4B8;
	Tue, 18 Nov 2025 13:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="uEfkUcM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010063.outbound.protection.outlook.com
 [52.101.193.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8731610E152
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:56:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZySycKL/XPMld+7lSIC8viBfCndhke7kn49G18iXBWzVuqy1ASV9lqt0UiC9WFLsM/8l/tMG2UyjRatqQViu4h6pAJbrJjE2VygKV2QD08J0YrxI3orkePZo209XU3St/fRD44bWrr7yhPd58T+Bx88/WFpdCHETDGjzC9eCNZKpBFBaXVOeqZAM8M4Xjvv5fS/VAovucNTvWquttYLZIh9rHIFnc4v3kWFVB6eVZ54iHI7bN/3r6jBAymy/ddJVGUf8z2/sT8SZsmot2S8agoZYKi3+qfnIX7luQULqrOyskCOsaVJ8/LZwylUqvSfnGytifQsE4qdSByO57e56nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG5T1SYsEKJP1K2KSvTJd8/+7I09mhmV9RjweHVK5BI=;
 b=AcHkc1sibYe0ud0cmbrI9HuR3Q1bef80/sq1FBP0LXPSDaHRpYO0chGzMeb/TMraRzqTcgrm38vKVYC09P9vsAFGv5MghIMFTEQZXlPXgyTVNP5hoQtgk4o2JMd3jgsV4JBXRqswaVvZe5OvmiZZd4r0YA3zM3FZwD74sdzfafkj4XbX7JcBniCNBuyNj7zyqD2t+TEPpesCS7Ykh/+09df7ktl8rJDNNOXRfM/93yv7P4OtLrPImcM0a7k9O8xVL/v5o1AAPhL952iETzzhV6aLK1iU42N+/8WLtGW6uJlw8xh3EboIt/E2lHuH9NbBL5/EQc3jQoSPC28lujso5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG5T1SYsEKJP1K2KSvTJd8/+7I09mhmV9RjweHVK5BI=;
 b=uEfkUcM703NyuPyYhUlD9OApc3jXb6x8elUITQo3zOP1FjOZJT+H5phsVdliquNKeoCHat0F/Yi7JOMho+43QhMrLKzSsx5SkTDbf+0xJrTKZRcnVHMsqD5NUMDJyd+munOplL1q1YK1xi2czRWFgJFjWWGCA54VcQsGQCbNfjQ=
Received: from DS7PR05CA0097.namprd05.prod.outlook.com (2603:10b6:8:56::26) by
 IA1PR10MB7445.namprd10.prod.outlook.com (2603:10b6:208:449::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 13:55:57 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:56:cafe::f1) by DS7PR05CA0097.outlook.office365.com
 (2603:10b6:8:56::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 13:55:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 13:55:56 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:55:54 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:55:54 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 07:55:54 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
 by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIDts41605896;
 Tue, 18 Nov 2025 07:55:54 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5AIDtqVx004180;
 Tue, 18 Nov 2025 07:55:53 -0600
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
Subject: [PATCH net-next v6 2/6] net: ti: icssg-prueth: Add XSK pool helpers
Date: Tue, 18 Nov 2025 19:25:38 +0530
Message-ID: <20251118135542.380574-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118135542.380574-1-m-malladi@ti.com>
References: <20251118135542.380574-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|IA1PR10MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: d6be0b6f-52c0-4ae3-d910-08de26aa32b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ckGgPOCPi+8yyOTn2dY1CIT7p4CH6igzk+WqU7UfpCW3U/OiS0Pe8klsVK3/?=
 =?us-ascii?Q?lsW4fBoNtonTRBdVQCOedDzwKPXazDWk9CrfX7K5WRbCzo0GeZwtkcVXNp7r?=
 =?us-ascii?Q?Je/xM56XaaIGGXlxYHBW1aCH5LHT7YRzyMhuUu6vGMcWhQT/ds7J8lgqGLvS?=
 =?us-ascii?Q?nVLrDkhaVg3FxZppE24Rz/nRk5lkE26K7eixuVujhkwwI0095wmhHickAFoC?=
 =?us-ascii?Q?t9EzWFJf3r0VcLGW2sF+ZYHnLboa134j5rBn80gPkd0z6cgQgEmpVE41+RwO?=
 =?us-ascii?Q?DkC/mx/tRz3hGmNSXROqpAPUkWhhz6RmZxh7hovpQdOZnh2qENL+UelzXXgS?=
 =?us-ascii?Q?oMhHcnubYS4BTG+L9bFTEIjf0cdawDO+f4j0KdKOLK8R0jlkKGGkQOvw9xM5?=
 =?us-ascii?Q?BkpRIZ/2j0cm7GVo1+wFd38+HsGwZu1MOLNy4IdCyP0uysIdcgQVNrSdF/l5?=
 =?us-ascii?Q?4vvusGOo/GrsN0G62nY1uvkPBiGK2vt3fPne4mXdOpIbYm38ti2jnsITLtt+?=
 =?us-ascii?Q?2OQOav8o0EJl4Z3Hhb9/pvJON3DwFg0yExVAGLBVgw2iajGi5/LteocDJvx0?=
 =?us-ascii?Q?9O7M4660zuQ1JIpIgVCa7Q7r4+nvsM80P7RMxXzJ9b28x/eREHqyXOwnBw0M?=
 =?us-ascii?Q?r8yHhxCEiEO667K85aJlkJw/S5S6JVfc6jKhcwnPrJNiPXmxK4PfCrPSMSqc?=
 =?us-ascii?Q?F3dG2cybSWVhuBByyMJolR97K2YAniKl0uOlVq6w3CgF17F9h4YWvir/NSko?=
 =?us-ascii?Q?YreONP88asRdCwi/xRWeXhjl1deCB/Oi4F/bH7ZVWSlCMe1LFz7PgAW4gPSw?=
 =?us-ascii?Q?imLKyDEX+EDipBwZhjyO+wlmTHg24V9NmTbib71u23YnB91jJyPD0YjZX+bW?=
 =?us-ascii?Q?AQaBCcTXy295axOGWILJ9xT4cnsY1kCTFb3jZlHz+3KSGH6zSBCe33HZGBU5?=
 =?us-ascii?Q?5E0VSSAaZdGjAt/uLhCceoOItcpxgwfPNzDFIZHegohIEPSAGSf0CSKG3nFf?=
 =?us-ascii?Q?cNeKx0PDIFLK0iUj+frs1mdQNpzRXoOmwYrHVYUla3m06D+8dyjg/jwCM9dH?=
 =?us-ascii?Q?zHuFTofVSbcWpc8/atW9p5Bx64nn0iThF+i/oUtLQmSTAuMVX0GIZlaimuCK?=
 =?us-ascii?Q?HjORLnTR0JR9sY4+P8LXz9eMMoWWU/lOlzg1ABxaop+EMAExnAZtVgdEkJyR?=
 =?us-ascii?Q?DCBcWEzs0LqNifVs/xKKM/OzmBTa8eZVkQf+9b/30unpQ9SVRQDgp+QZ2xZV?=
 =?us-ascii?Q?tJCYdha0gpsa0a48/IORuyNWH8kbCCUb4++93t1P4aoOpR4V0YYwJncrNTAH?=
 =?us-ascii?Q?UJtTCGO3wOi5DCiu4QQCXZekucpwviB6GHS2OXABXKJk9AY8LA6ejKoKoLxU?=
 =?us-ascii?Q?XSh9yyPFh167qZyiMIAGiwwXduknsWt48jEK7TPqIB0VbsoU81vSPH6DpxlV?=
 =?us-ascii?Q?QGh0JpKXAfl1ya/zG1lWIggKpKiA7CwUNybeWFzOmvX7wZxbK0/fdBwfLbOX?=
 =?us-ascii?Q?imdxTfNmcC3C1BiO5vTFHwhaisabMk62F6r2jQT8WJ2dmh6Yj/kxvrw1/U7W?=
 =?us-ascii?Q?jdqfMb283CMUMA8m1Yu/6AMpNyPoDFIzBrizZoMe?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:55:56.9472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6be0b6f-52c0-4ae3-d910-08de26aa32b5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7445
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

Implement XSK NDOs (setup, wakeup) and create XSK
Rx and Tx queues. xsk_qid stores the queue id for
a given port which has been registered for zero copy
AF_XDP and used to acquire UMEM pointer if registered.

Based on the xsk_qid and the xsk_pool (umem) the driver
is either in copy or zero copy mode. In case of copy mode
the xsk_qid value will be invalid and will be set to valid
queue id when enabling zero copy. To enable zero copy, the
Rx queues are destroyed, i.e., descriptors pushed to fq
and cq are freed to remap them to xdp buffers from the umem.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c |   2 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 138 +++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  10 ++
 3 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 94021751b6b7..cc52cff70d7e 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -754,7 +754,7 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 	}
 
 	pa = page_address(page);
-	if (emac->xdp_prog) {
+	if (prueth_xdp_is_enabled(emac)) {
 		xdp_init_buff(&xdp, PAGE_SIZE, &rx_chn->xdp_rxq);
 		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index b66ffbfb499c..e4c3b6b152ea 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -47,6 +47,9 @@
 						 NETIF_F_HW_HSR_TAG_INS | \
 						 NETIF_F_HW_HSR_TAG_RM)
 
+#define PRUETH_RX_DMA_ATTR			(DMA_ATTR_SKIP_CPU_SYNC |\
+						 DMA_ATTR_WEAK_ORDERING)
+
 /* CTRLMMR_ICSSG_RGMII_CTRL register bits */
 #define ICSSG_CTRL_RGMII_ID_MODE                BIT(24)
 
@@ -735,6 +738,20 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 	return 0;
 }
 
+static void prueth_set_xsk_pool(struct prueth_emac *emac, u16 queue_id)
+{
+	struct prueth_tx_chn *tx_chn = &emac->tx_chns[queue_id];
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
+
+	if (emac->xsk_qid != queue_id) {
+		rx_chn->xsk_pool = NULL;
+		tx_chn->xsk_pool = NULL;
+	} else {
+		rx_chn->xsk_pool = xsk_get_pool_from_qid(emac->ndev, queue_id);
+		tx_chn->xsk_pool = xsk_get_pool_from_qid(emac->ndev, queue_id);
+	}
+}
+
 static void prueth_destroy_txq(struct prueth_emac *emac)
 {
 	int ret, i;
@@ -875,6 +892,7 @@ static int emac_ndo_open(struct net_device *ndev)
 		return ret;
 	}
 
+	emac->xsk_qid = -EINVAL;
 	init_completion(&emac->cmd_complete);
 	ret = prueth_init_tx_chns(emac);
 	if (ret) {
@@ -1200,6 +1218,109 @@ static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
 	return 0;
 }
 
+static int prueth_xsk_pool_enable(struct prueth_emac *emac,
+				  struct xsk_buff_pool *pool, u16 queue_id)
+{
+	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
+	u32 frame_size;
+	int ret;
+
+	if (queue_id >= PRUETH_MAX_RX_FLOWS ||
+	    queue_id >= emac->tx_ch_num) {
+		netdev_err(emac->ndev, "Invalid XSK queue ID %d\n", queue_id);
+		return -EINVAL;
+	}
+
+	frame_size = xsk_pool_get_rx_frame_size(pool);
+	if (frame_size < PRUETH_MAX_PKT_SIZE)
+		return -EOPNOTSUPP;
+
+	ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, PRUETH_RX_DMA_ATTR);
+	if (ret) {
+		netdev_err(emac->ndev, "Failed to map XSK pool: %d\n", ret);
+		return ret;
+	}
+
+	if (netif_running(emac->ndev)) {
+		/* stop packets from wire for graceful teardown */
+		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
+		if (ret)
+			return ret;
+		prueth_destroy_rxq(emac);
+	}
+
+	emac->xsk_qid = queue_id;
+	prueth_set_xsk_pool(emac, queue_id);
+
+	if (netif_running(emac->ndev)) {
+		ret = prueth_create_rxq(emac);
+		if (ret) {
+			netdev_err(emac->ndev, "Failed to create RX queue: %d\n", ret);
+			return ret;
+		}
+		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_FORWARD);
+		if (ret) {
+			prueth_destroy_rxq(emac);
+			return ret;
+		}
+		ret = prueth_xsk_wakeup(emac->ndev, queue_id, XDP_WAKEUP_RX);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int prueth_xsk_pool_disable(struct prueth_emac *emac, u16 queue_id)
+{
+	struct xsk_buff_pool *pool;
+	int ret;
+
+	if (queue_id >= PRUETH_MAX_RX_FLOWS ||
+	    queue_id >= emac->tx_ch_num) {
+		netdev_err(emac->ndev, "Invalid XSK queue ID %d\n", queue_id);
+		return -EINVAL;
+	}
+
+	if (emac->xsk_qid != queue_id) {
+		netdev_err(emac->ndev, "XSK queue ID %d not registered\n", queue_id);
+		return -EINVAL;
+	}
+
+	pool = xsk_get_pool_from_qid(emac->ndev, queue_id);
+	if (!pool) {
+		netdev_err(emac->ndev, "No XSK pool registered for queue %d\n", queue_id);
+		return -EINVAL;
+	}
+
+	if (netif_running(emac->ndev)) {
+		/* stop packets from wire for graceful teardown */
+		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
+		if (ret)
+			return ret;
+		prueth_destroy_rxq(emac);
+	}
+
+	xsk_pool_dma_unmap(pool, PRUETH_RX_DMA_ATTR);
+	emac->xsk_qid = -EINVAL;
+	prueth_set_xsk_pool(emac, queue_id);
+
+	if (netif_running(emac->ndev)) {
+		ret = prueth_create_rxq(emac);
+		if (ret) {
+			netdev_err(emac->ndev, "Failed to create RX queue: %d\n", ret);
+			return ret;
+		}
+		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_FORWARD);
+		if (ret) {
+			prueth_destroy_rxq(emac);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * emac_ndo_bpf - implements ndo_bpf for icssg_prueth
  * @ndev: network adapter device
@@ -1214,11 +1335,27 @@ static int emac_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
 	switch (bpf->command) {
 	case XDP_SETUP_PROG:
 		return emac_xdp_setup(emac, bpf);
+	case XDP_SETUP_XSK_POOL:
+		return bpf->xsk.pool ?
+			prueth_xsk_pool_enable(emac, bpf->xsk.pool, bpf->xsk.queue_id) :
+			prueth_xsk_pool_disable(emac, bpf->xsk.queue_id);
 	default:
 		return -EINVAL;
 	}
 }
 
+int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
+{
+	struct prueth_emac *emac = netdev_priv(ndev);
+
+	if (qid >= PRUETH_MAX_RX_FLOWS || qid >= emac->tx_ch_num) {
+		netdev_err(ndev, "Invalid XSK queue ID %d\n", qid);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct net_device_ops emac_netdev_ops = {
 	.ndo_open = emac_ndo_open,
 	.ndo_stop = emac_ndo_stop,
@@ -1237,6 +1374,7 @@ static const struct net_device_ops emac_netdev_ops = {
 	.ndo_xdp_xmit = emac_xdp_xmit,
 	.ndo_hwtstamp_get = icssg_ndo_get_ts_config,
 	.ndo_hwtstamp_set = icssg_ndo_set_ts_config,
+	.ndo_xsk_wakeup = prueth_xsk_wakeup,
 };
 
 static int prueth_netdev_init(struct prueth *prueth,
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 5cc90b66035a..a5e3774b0388 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -38,6 +38,8 @@
 #include <net/devlink.h>
 #include <net/xdp.h>
 #include <net/page_pool/helpers.h>
+#include <net/xsk_buff_pool.h>
+#include <net/xdp_sock_drv.h>
 
 #include "icssg_config.h"
 #include "icss_iep.h"
@@ -126,6 +128,7 @@ struct prueth_tx_chn {
 	char name[32];
 	struct hrtimer tx_hrtimer;
 	unsigned long tx_pace_timeout_ns;
+	struct xsk_buff_pool *xsk_pool;
 };
 
 struct prueth_rx_chn {
@@ -138,6 +141,7 @@ struct prueth_rx_chn {
 	char name[32];
 	struct page_pool *pg_pool;
 	struct xdp_rxq_info xdp_rxq;
+	struct xsk_buff_pool *xsk_pool;
 };
 
 enum prueth_swdata_type {
@@ -241,6 +245,7 @@ struct prueth_emac {
 	struct netdev_hw_addr_list vlan_mcast_list[MAX_VLAN_ID];
 	struct bpf_prog *xdp_prog;
 	struct xdp_attachment_info xdpi;
+	int xsk_qid;
 };
 
 /* The buf includes headroom compatible with both skb and xdpf */
@@ -503,5 +508,10 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 			unsigned int q_idx);
 void prueth_rx_cleanup(void *data, dma_addr_t desc_dma);
 void prueth_tx_cleanup(void *data, dma_addr_t desc_dma);
+int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags);
+static inline bool prueth_xdp_is_enabled(struct prueth_emac *emac)
+{
+	return !!READ_ONCE(emac->xdp_prog);
+}
 
 #endif /* __NET_TI_ICSSG_PRUETH_H */
-- 
2.43.0

