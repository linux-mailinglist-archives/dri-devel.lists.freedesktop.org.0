Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB29CC4CF34
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6DF10E53A;
	Tue, 11 Nov 2025 10:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="JThhB2AM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073610E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlYB73TCpHH0XEtObg6YlMeHZLO+bdexRHUnYoWR0qOKF0CRJV8xvLsE5sXMXaAnDttIEMsHqDMcxnhbjjVx/HQCnwx3a7TvvUEJuy0gu4sGiIV7NMTqTmZaJ5LY7tEg6I3KIg1We04+EDPFUG/im3pHhEPyV0xmPh9doB3oEf9o0o2dACSDQURolr3jTLfHMkNQ4TyIOvpaNmEN+ZlBgZb5RAukK8IMj396KRTraYV/VWX1zxymmRqYQVX34G2fo4ehRo1jVub0WEXtgJOyH7w2x8yMysKJBNC5p0UYf0jsT8E9oloKYNm9VBuMl2CXXncddAg041U6lZmzxHiCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG5T1SYsEKJP1K2KSvTJd8/+7I09mhmV9RjweHVK5BI=;
 b=FSW2JGnuydtnOpyUbgRk766gVT1MYmy9Gf6vKT4jNB2npUjZio1g/czyOPp9qpLXvXbzlbapkZWxvODzu2cfFcuamIP7I/O6nKQcaVxvPDW6U2waflN9Pq9qeJnc7dZIOBn6cVGC2LTjLdZILgtcjcVc6JFIxXnPFLnRcyu0s/40p4s6mYh9Qe5AJnpVPQUjhaPpXHyyAqyBzzEV7xBMBcvbEGiKNoiSpholD7afvbxUZxv2x70G9hBTtEJFna+YEJkvw8VCT2yWpQWJTJLk82oMIdA7AAbX/2THc/UAB5pX5WcwcuPx1V5WWQVmwGE1H2lYpzNtnIO0pECjRr6fHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG5T1SYsEKJP1K2KSvTJd8/+7I09mhmV9RjweHVK5BI=;
 b=JThhB2AMKyW5SuEUykuLGEgpBsI4bVFu6p48ucJh18CnQ96u8gFF91hESz8/QA1YPH/F5egDtIGRUDBdKFw/L0slISPB7K0Ej++GRZbKmbmwp1E11X1gCHPz6uoPA3l+bzOIXydxME0Swh1U/4HJEY7li5dJxBi0LXf0oPtRIIs=
Received: from BN9PR03CA0943.namprd03.prod.outlook.com (2603:10b6:408:108::18)
 by PH7PR10MB6403.namprd10.prod.outlook.com (2603:10b6:510:1ad::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 10:15:37 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:108:cafe::c) by BN9PR03CA0943.outlook.office365.com
 (2603:10b6:408:108::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.14 via Frontend Transport; Tue,
 11 Nov 2025 10:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Tue, 11 Nov 2025 10:15:37 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:34 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:33 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 04:15:33 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABAFXKg1758595;
 Tue, 11 Nov 2025 04:15:33 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5ABAFWc1011902;
 Tue, 11 Nov 2025 04:15:33 -0600
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
Subject: [PATCH net-next v5 2/6] net: ti: icssg-prueth: Add XSK pool helpers
Date: Tue, 11 Nov 2025 15:45:19 +0530
Message-ID: <20251111101523.3160680-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111101523.3160680-1-m-malladi@ti.com>
References: <20251111101523.3160680-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|PH7PR10MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 6966e9bc-e9ab-4ee2-3af3-08de210b425e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xzs3NTHhFZdvdiymRYM9MyL8EKlDlLP2PKGk4Wn0fpzSHXP/VZnKyVISHtjo?=
 =?us-ascii?Q?3sn84IGPYHeMClZVKLxhNbeyE0EjRpXpr+MMrM6D2838Hl4WWMQVRun4bwo2?=
 =?us-ascii?Q?VrkOAoF+e/25xY87ZAKzltKRm5vSeOrPjycA9ZPShe3NKsbpb660C1i5Ja7u?=
 =?us-ascii?Q?PHrtvQpYKAM+Yq0wc+7LiBNobHgvy91SJiWP82hIFj0M9Jzcupd+LhTdNgdr?=
 =?us-ascii?Q?UdVlv7jHccRXpoC2P/BuufkLz8kw7JO/dYNCW60ZctzlAGhTHIlvkS0ibNay?=
 =?us-ascii?Q?LJIG4umU+rypCG+Y5wOAKrN/9y2zvlJ7/3d3qkskrq3B1JQh3axCNSwVfxoH?=
 =?us-ascii?Q?Kwcw1xMcKUmLng0ozMkXoFMzz8QWl8Vz/3vIl2bja/i3B080y1348Fr70o+y?=
 =?us-ascii?Q?gOlDjNHanNJnZrg1yo9Ll+llXHoL7yQ275g3vabwk3z/g5ALyiTKwf7MerZm?=
 =?us-ascii?Q?2ggI2kT9dTPWmmCPUCBy5/o/nnI+8m6U6qktFTgabd/j95DF/AG8K/69f+jq?=
 =?us-ascii?Q?ZT07LdnC1Nmm1e8uvi3plfFKascGD+rAAG+GlcD6hHiHMC57AVFPYXBk7TJ/?=
 =?us-ascii?Q?G0eKHpLvdD8IHyIT8arDi+RDQrqRIMFTec0MwDqTg1RwlEJs0KEaLCmksC2/?=
 =?us-ascii?Q?rtWGvxeH/6w+Mk/m7fCVJHQHdGnole6xRSi6iZdpKtBN2Fbnrq6PHywuloqG?=
 =?us-ascii?Q?CvjEL6J34i0UGXVUREOBpqvOklib+ZO0SnJnh24+sjk7lU6RjmCrgPCpEQNv?=
 =?us-ascii?Q?wS5vk6DMFjd9Zv9e4NAJrAoazv/nlEVA0mjQHWRoiG/lLrBOLl0Gwl8uQQgc?=
 =?us-ascii?Q?HEvcxsVed3mS1Qo/7hx0J2nPXZ3gIlhtKC4RsQMKhvqGdcHCjz+s0ChSvfTk?=
 =?us-ascii?Q?WxV5FTSRwpYEsvBsBcEoAMy001rRwsu4rlc0jUkZ+ag0j7A6D9pBC+LoOcWr?=
 =?us-ascii?Q?Tjv6sKYv8YJCREsw3H9SUHvqtFsNxBBjsyvzTGmzUDejWhs9++ucwZ0NNYhy?=
 =?us-ascii?Q?SYiVkNFJaz+vqw2xYDGQQStZOOthtWL084vlxRweSjM4x65hNGIQNnDFAEDY?=
 =?us-ascii?Q?t0wwhjwqihEIfm1tUY1H0K31vG3YWFzGqxqE3S+KONmD9nGvxCnf7poI1edc?=
 =?us-ascii?Q?jm6ARQwtOSgqnMjOryMFpZRb0PKUMiIm1L943n7IPh4DlACtnxJvr+FGWmX8?=
 =?us-ascii?Q?GuwM8e7xAyxh8rYpikUE5pPBFqfmBaEQTDSzn5YbwnxA5miVqFM9oPH3Qpjl?=
 =?us-ascii?Q?+czyTe4j5iM/KJLsIWHxTEtMpgsFKC5wLlZiE2qFybzAVsWRM+jaEy+7/0Lk?=
 =?us-ascii?Q?BlH2pAhwllGZT6lZL/mBdEhNis1FhHql0QvcpkYlq1wC8O4CUjhScEkfActh?=
 =?us-ascii?Q?QDVkN8jXdYW5anW0rBy6HDGRlvX+Q1hAf/S+37CYUI9qmJjZci0dRgoilTWI?=
 =?us-ascii?Q?+ai/oTb1TZixwLp7nmc9qTzDJPYtPMB5BMfi9JSmgBx9y1/1OGYKDHRUKRKM?=
 =?us-ascii?Q?10tYFDHAXgWJjuzX3gDDeqeEXAWto/kQpWmCHfkx5T+fxSvyuGvWo4MPaalr?=
 =?us-ascii?Q?S2nomF80OLA/+ZuTAzItWcSaVBGQSsSPi9uq9B3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 10:15:37.3834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6966e9bc-e9ab-4ee2-3af3-08de210b425e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6403
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

