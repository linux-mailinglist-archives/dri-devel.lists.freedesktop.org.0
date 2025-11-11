Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77236C4CF40
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 11:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A4110E542;
	Tue, 11 Nov 2025 10:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wxj83rRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EA210E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:15:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZ67XHG2TjNSKlz5emEa/LQBgi9XxMtuU2DQhhZp8n+rd7bZT5/wP7i+s3UBd9ODGs2Pzodai51dMoG/3pVzFf7a5wNc9FNEBMfNfIWlY+bXTLBXbFJp1wWs9GY9Vy7p/YMnvhKTcpjC/skbXw77yM8hTnAtOAJU46zFKlSYhVeRZURj6ruuphuwAvJTc5r7Z79bEkBpE2XkQL4FSfmEHiNbp9HzbHWE8W8gcurYwFaEFICLFMsa3l87DYGzA/LWWkBcngkc2uEhrEUgTM6011dqmW5V9wq9XtzqeeFmz86jafN7kDRoDH3PtpfV8d37bFifvCE63HKQo4EOk42Cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUL6mUBmyFLtF8BBUUM3B/wi8ahS+qpSyhNahi34T9Y=;
 b=F4eMozWvRNS2rG1g5tCJYByfvTDlLFAM1/lJxHH3V2z1/UPjDO9F9c2CSWiNCzrQgpJF9iNyOheMZC0kqhMFLRBS3GhBIM/UFgwhiTx+2Vd7d6yqcF9lT2/8Sr8BzG8YZgeLbyklGefzJsjWYdLd6PZdyJNZvrcAoKzuT8SFMG+o8SB2ZlWqz9r0PZFxee2KN+JyP5sqnOJDK7pwfPM3TfKevw5S0V+caqFjUjTGHumNSXhDwjuaMPNclsynRQ+V0LK5mmGs/FsLhNvVftpfy7zlKtSiHcp4ZlYvi+xjRnv5H7OALVuDaa9Nazih65wOpMs2fTAuW7bD/rQtjaLiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUL6mUBmyFLtF8BBUUM3B/wi8ahS+qpSyhNahi34T9Y=;
 b=wxj83rRxJ5VsbG/RMl5ZYH1E3FOV2h9Zgxt8jmbCLa0viHZW1aEwvd9YlR7rZ+i2M+EG3qFAXsV1DUlmZDQzrXm/ieB871El6yZC/W4p9DoyxH1qKGyVIuqW00qpT8YXkNeh1rIRP288E7AP3HUqUxRVtX89gMN8q4vqnVNpnXk=
Received: from BY3PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:39b::18)
 by PH3PPF262994532.namprd10.prod.outlook.com (2603:10b6:518:1::78f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 10:15:39 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::62) by BY3PR05CA0043.outlook.office365.com
 (2603:10b6:a03:39b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 10:15:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 10:15:39 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:31 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 04:15:31 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABAFVSk783931;
 Tue, 11 Nov 2025 04:15:31 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5ABAFUR3011896;
 Tue, 11 Nov 2025 04:15:31 -0600
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
Subject: [PATCH net-next v5 1/6] net: ti: icssg-prueth: Add functions to
 create and destroy Rx/Tx queues
Date: Tue, 11 Nov 2025 15:45:18 +0530
Message-ID: <20251111101523.3160680-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111101523.3160680-1-m-malladi@ti.com>
References: <20251111101523.3160680-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|PH3PPF262994532:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b89fa5f-0211-4e20-9cbb-08de210b4388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yRDUx4XnpHltiQBpaSTOpXWWlo4ebK1+Wzg8Y8N+oxTVRTzg5xFWRvlZYYiZ?=
 =?us-ascii?Q?kkVlRt+ombnErb9j4aBBeXwQCNl2kJ6160PgEcAW/2b5gtH8/GSgDg7vykc4?=
 =?us-ascii?Q?ZROgutMdyq3Ce/EY4iBGBKIFAyWhAAUw2345lfIJ3R6DSrBXkly40i0VDLvV?=
 =?us-ascii?Q?O91u6J4XToxKxYDcO/YHrbqpslH176zirU3zpfek6X6nA+6CP3nAw/FWUJd8?=
 =?us-ascii?Q?nNNUsiMEs5MikNxxcwq9krYMC5sManyM+8nArn3nBc+Ttb/YakqLvM7jkxbQ?=
 =?us-ascii?Q?A8xhFv/SalrFMpp/MSUqTctAaFBBYVjWNmph8nm3pp29rKFVW26xgX4TDu90?=
 =?us-ascii?Q?fQETcxwBDrfF6pMitwbxJvhs8yD2P+fJXA818kMuwZYxBgI1HFM4a9cWMbQm?=
 =?us-ascii?Q?AWIoQuPa5BiumFp8zxIX6bshNgayphj6PbgrUSEinPqiD5IYB47Fhn7nIBWx?=
 =?us-ascii?Q?wHRcMdmTiVA41JHlnKjCe9qsIieD/dw53d4RwiCn/RDyHCpfxNiy2WaFBvj6?=
 =?us-ascii?Q?7HkDX0FBv/tBEvjM6dejvwWyaXPfse9Hn8/xxyQA88xf8eJNknTg3iQTXBp3?=
 =?us-ascii?Q?4oAc69mWEkMiuMt10DulqQdYnCp1VIc3scrTiSDOyVv1pkoH7cBP+mUnXSPi?=
 =?us-ascii?Q?tDcZgt1hugwkIXqlPXj27DpfrKJnSl2D3LFc1713GK7qqncqI8nLZ8lBzTJV?=
 =?us-ascii?Q?FwPmVZGIpMbkrDG2f+GICKlSiTnTpmTvbC5IhsqwqyV7f7iYpK1LcPLyryiu?=
 =?us-ascii?Q?YBlJEM08f3yV8W5yMss/ZoRyMxtdTj09ioLqpROKpQq864gzs+axV2Z1HjFh?=
 =?us-ascii?Q?Iy4znCYdoBxrPYFFZPbhkMxkrdj6vxYoySjmLj9NEuCKIihYwVSd0bOkuV6w?=
 =?us-ascii?Q?71uvE3OHQqjvDeuTnYMAWMI34EMzOif5BTOlYsSVHUoQv8IJfPledqQJ1rrr?=
 =?us-ascii?Q?yyvce3hOas4v1HP3lRz/CacqqUgTT6/F6rus9pf5tuqLj5vlRniziZGPeQ4U?=
 =?us-ascii?Q?rCG4AWxMLNisefZrISxr2SOom5RGCbCldZfH0CC7mRJrgRQK9Z9N1Fdd5iSE?=
 =?us-ascii?Q?TB/v16qV9XDc1t4i6Xb6M2KvmVimTd24VnJ/tJPINVtnmSzUG+R2Rq/BYIA1?=
 =?us-ascii?Q?mcZz7dBu5it//NGBcuIfMt/YZyuokgKqHq41O9tFkrI8kSpCkgkucgzVHHgz?=
 =?us-ascii?Q?ZHtO6Jv0lAfNgLJ81c3WJ3dgtfnApnfaiF5MvBX1zNnjKusm9HSZJ7s0Ekvn?=
 =?us-ascii?Q?DLEFafxLBQOiq740kQAMAlh1VSSOKPI907PFB4lwmAi8NWDo0RFtNp707a95?=
 =?us-ascii?Q?Vf+IRZtiOVizaVOtvg2woAQtaPjpFaj3zVoSp7ZAm2PKXYfp5yvwCY3CqXZv?=
 =?us-ascii?Q?x1t33b0qxKwbQ8su+xV4WyF550lJCMwWFwcuSQoLs0uc/MW9PIpFb7kYgDQ1?=
 =?us-ascii?Q?tVoj+bqB/bsKsTnWA2ZI/xW2zZqs7UwinoS+ERp/V1QzctkoL9xB63uQ6WaT?=
 =?us-ascii?Q?6qTjle9i8IVACws3NaO8Igxd/ZGz/kgRkrwRBFKzOoM7Jo/rivJ68wMrscEk?=
 =?us-ascii?Q?50eaps02dKQGaqeHDZ7UDA5KZf+9msUnFgkUZKBE?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 10:15:39.3911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b89fa5f-0211-4e20-9cbb-08de210b4388
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF262994532
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

Each port for a given ICSSG instance has their own set of
Tx and Rx queues. Add functions to create and destroy these
queues, which will be further used while performing ndo_bpf
operations to set up XSK Tx/Rx queues for a given port.

In the destroy Rx queue sequence add teardown wait to ensure
that all the descriptors including the TDCM (teardown completion
marker) have been serviced and freed to avoid any sort of descriptor
leaks.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c |  10 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 177 ++++++++++++-------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
 3 files changed, 127 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 0eed29d6187a..94021751b6b7 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -719,8 +719,10 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 		return ret;
 	}
 
-	if (cppi5_desc_is_tdcm(desc_dma)) /* Teardown ? */
+	if (cppi5_desc_is_tdcm(desc_dma)) {
+		complete(&emac->tdown_complete);
 		return 0;
+	}
 
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
@@ -804,7 +806,7 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 	return ret;
 }
 
-static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
+void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_rx_chn *rx_chn = data;
 	struct cppi5_host_desc_t *desc_rx;
@@ -822,6 +824,7 @@ static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 }
+EXPORT_SYMBOL_GPL(prueth_rx_cleanup);
 
 static int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
 {
@@ -1025,7 +1028,7 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
 }
 EXPORT_SYMBOL_GPL(icssg_ndo_start_xmit);
 
-static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
+void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_tx_chn *tx_chn = data;
 	struct cppi5_host_desc_t *desc_tx;
@@ -1051,6 +1054,7 @@ static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 
 	prueth_xmit_free(tx_chn, desc_tx);
 }
+EXPORT_SYMBOL_GPL(prueth_tx_cleanup);
 
 irqreturn_t prueth_rx_irq(int irq, void *dev_id)
 {
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 57a7d1ceab08..b66ffbfb499c 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -735,6 +735,114 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 	return 0;
 }
 
+static void prueth_destroy_txq(struct prueth_emac *emac)
+{
+	int ret, i;
+
+	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
+	/* ensure new tdown_cnt value is visible */
+	smp_mb__after_atomic();
+	/* tear down and disable UDMA channels */
+	reinit_completion(&emac->tdown_complete);
+	for (i = 0; i < emac->tx_ch_num; i++)
+		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
+
+	ret = wait_for_completion_timeout(&emac->tdown_complete,
+					  msecs_to_jiffies(1000));
+	if (!ret)
+		netdev_err(emac->ndev, "tx teardown timeout\n");
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		napi_disable(&emac->tx_chns[i].napi_tx);
+		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
+		k3_udma_glue_reset_tx_chn(emac->tx_chns[i].tx_chn,
+					  &emac->tx_chns[i],
+					  prueth_tx_cleanup);
+		k3_udma_glue_disable_tx_chn(emac->tx_chns[i].tx_chn);
+	}
+}
+
+static void prueth_destroy_rxq(struct prueth_emac *emac)
+{
+	int i, ret;
+
+	/* tear down and disable UDMA channels */
+	reinit_completion(&emac->tdown_complete);
+	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
+
+	/* When RX DMA Channel Teardown is initiated, it will result in an
+	 * interrupt and a Teardown Completion Marker (TDCM) is queued into
+	 * the RX Completion queue. Acknowledging the interrupt involves
+	 * popping the TDCM descriptor from the RX Completion queue via the
+	 * RX NAPI Handler. To avoid timing out when waiting for the TDCM to
+	 * be popped, schedule the RX NAPI handler to run immediately.
+	 */
+	if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
+		if (napi_schedule_prep(&emac->napi_rx))
+			__napi_schedule(&emac->napi_rx);
+	}
+
+	ret = wait_for_completion_timeout(&emac->tdown_complete,
+					  msecs_to_jiffies(1000));
+	if (!ret)
+		netdev_err(emac->ndev, "rx teardown timeout\n");
+
+	for (i = 0; i < PRUETH_MAX_RX_FLOWS; i++) {
+		napi_disable(&emac->napi_rx);
+		hrtimer_cancel(&emac->rx_hrtimer);
+		k3_udma_glue_reset_rx_chn(emac->rx_chns.rx_chn, i,
+					  &emac->rx_chns,
+					  prueth_rx_cleanup);
+	}
+
+	prueth_destroy_xdp_rxqs(emac);
+	k3_udma_glue_disable_rx_chn(emac->rx_chns.rx_chn);
+}
+
+static int prueth_create_txq(struct prueth_emac *emac)
+{
+	int ret, i;
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		ret = k3_udma_glue_enable_tx_chn(emac->tx_chns[i].tx_chn);
+		if (ret)
+			goto reset_tx_chan;
+		napi_enable(&emac->tx_chns[i].napi_tx);
+	}
+	return 0;
+
+reset_tx_chan:
+	/* Since interface is not yet up, there is wouldn't be
+	 * any SKB for completion. So set false to free_skb
+	 */
+	prueth_reset_tx_chan(emac, i, false);
+	return ret;
+}
+
+static int prueth_create_rxq(struct prueth_emac *emac)
+{
+	int ret;
+
+	ret = prueth_prepare_rx_chan(emac, &emac->rx_chns, PRUETH_MAX_PKT_SIZE);
+	if (ret)
+		return ret;
+
+	ret = k3_udma_glue_enable_rx_chn(emac->rx_chns.rx_chn);
+	if (ret)
+		goto reset_rx_chn;
+
+	ret = prueth_create_xdp_rxqs(emac);
+	if (ret)
+		goto reset_rx_chn;
+
+	napi_enable(&emac->napi_rx);
+	return 0;
+
+reset_rx_chn:
+	prueth_reset_rx_chan(&emac->rx_chns, PRUETH_MAX_RX_FLOWS, false);
+	return ret;
+}
+
 /**
  * emac_ndo_open - EMAC device open
  * @ndev: network adapter device
@@ -746,7 +854,7 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 static int emac_ndo_open(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
-	int ret, i, num_data_chn = emac->tx_ch_num;
+	int ret, num_data_chn = emac->tx_ch_num;
 	struct icssg_flow_cfg __iomem *flow_cfg;
 	struct prueth *prueth = emac->prueth;
 	int slice = prueth_emac_slice(emac);
@@ -819,28 +927,13 @@ static int emac_ndo_open(struct net_device *ndev)
 		goto stop;
 
 	/* Prepare RX */
-	ret = prueth_prepare_rx_chan(emac, &emac->rx_chns, PRUETH_MAX_PKT_SIZE);
+	ret = prueth_create_rxq(emac);
 	if (ret)
 		goto free_tx_ts_irq;
 
-	ret = prueth_create_xdp_rxqs(emac);
-	if (ret)
-		goto reset_rx_chn;
-
-	ret = k3_udma_glue_enable_rx_chn(emac->rx_chns.rx_chn);
+	ret = prueth_create_txq(emac);
 	if (ret)
-		goto destroy_xdp_rxqs;
-
-	for (i = 0; i < emac->tx_ch_num; i++) {
-		ret = k3_udma_glue_enable_tx_chn(emac->tx_chns[i].tx_chn);
-		if (ret)
-			goto reset_tx_chan;
-	}
-
-	/* Enable NAPI in Tx and Rx direction */
-	for (i = 0; i < emac->tx_ch_num; i++)
-		napi_enable(&emac->tx_chns[i].napi_tx);
-	napi_enable(&emac->napi_rx);
+		goto destroy_rxq;
 
 	/* start PHY */
 	phy_start(ndev->phydev);
@@ -851,15 +944,8 @@ static int emac_ndo_open(struct net_device *ndev)
 
 	return 0;
 
-reset_tx_chan:
-	/* Since interface is not yet up, there is wouldn't be
-	 * any SKB for completion. So set false to free_skb
-	 */
-	prueth_reset_tx_chan(emac, i, false);
-destroy_xdp_rxqs:
-	prueth_destroy_xdp_rxqs(emac);
-reset_rx_chn:
-	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, false);
+destroy_rxq:
+	prueth_destroy_rxq(emac);
 free_tx_ts_irq:
 	free_irq(emac->tx_ts_irq, emac);
 stop:
@@ -889,9 +975,6 @@ static int emac_ndo_stop(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
-	int rx_flow = PRUETH_RX_FLOW_DATA;
-	int max_rx_flows;
-	int ret, i;
 
 	/* inform the upper layers. */
 	netif_tx_stop_all_queues(ndev);
@@ -905,32 +988,8 @@ static int emac_ndo_stop(struct net_device *ndev)
 	else
 		__dev_mc_unsync(ndev, icssg_prueth_del_mcast);
 
-	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
-	/* ensure new tdown_cnt value is visible */
-	smp_mb__after_atomic();
-	/* tear down and disable UDMA channels */
-	reinit_completion(&emac->tdown_complete);
-	for (i = 0; i < emac->tx_ch_num; i++)
-		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
-
-	ret = wait_for_completion_timeout(&emac->tdown_complete,
-					  msecs_to_jiffies(1000));
-	if (!ret)
-		netdev_err(ndev, "tx teardown timeout\n");
-
-	prueth_reset_tx_chan(emac, emac->tx_ch_num, true);
-	for (i = 0; i < emac->tx_ch_num; i++) {
-		napi_disable(&emac->tx_chns[i].napi_tx);
-		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
-	}
-
-	max_rx_flows = PRUETH_MAX_RX_FLOWS;
-	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
-
-	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, true);
-	prueth_destroy_xdp_rxqs(emac);
-	napi_disable(&emac->napi_rx);
-	hrtimer_cancel(&emac->rx_hrtimer);
+	prueth_destroy_txq(emac);
+	prueth_destroy_rxq(emac);
 
 	cancel_work_sync(&emac->rx_mode_work);
 
@@ -943,10 +1002,10 @@ static int emac_ndo_stop(struct net_device *ndev)
 
 	free_irq(emac->tx_ts_irq, emac);
 
-	free_irq(emac->rx_chns.irq[rx_flow], emac);
+	free_irq(emac->rx_chns.irq[PRUETH_RX_FLOW_DATA], emac);
 	prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
 
-	prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
+	prueth_cleanup_rx_chns(emac, &emac->rx_chns, PRUETH_MAX_RX_FLOWS);
 	prueth_cleanup_tx_chns(emac);
 
 	prueth->emacs_initialized--;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index f0fa9688d9a0..5cc90b66035a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -501,5 +501,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 			struct xdp_frame *xdpf,
 			struct page *page,
 			unsigned int q_idx);
+void prueth_rx_cleanup(void *data, dma_addr_t desc_dma);
+void prueth_tx_cleanup(void *data, dma_addr_t desc_dma);
 
 #endif /* __NET_TI_ICSSG_PRUETH_H */
-- 
2.43.0

