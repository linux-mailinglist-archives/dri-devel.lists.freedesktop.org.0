Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4997FC69BB4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2677A10E4B7;
	Tue, 18 Nov 2025 13:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="mjRiTdqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010016.outbound.protection.outlook.com
 [52.101.193.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59BB10E4B7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1/DNRSddPht56LFSA3Gr2j2sRBb/qmfDFw8Vv+wpjYQcZmuy3U9dFLbkJjaYJ1/LAfbZI9hMH5zflQ681dnuCcK7aNMlQNNFnfIKtaTBAKpwJKoYGNgaAT5JyglmzoCT7ORk5UdYVG8XPb1tk3Pi9UI18li571wa7GrynobrFG9zP9jwxjz3EVNtdTTBcMyyb4DcoOdLtld4O/HAePMJUdwY2TA+HSVhqOFfr2IBp6PbEeSPlHw21sUzjlwbUJv/EPoZ3W0+kUa9xGKrnFON3jFXQjX0mIE2Q5LV8uFOReWna0V+GM/MScHwOSXZNj7WfB8ChZmy4LFwZtsJh2TLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dbi/SDEbhwv9x9qUnIJcSmxMwVDSSZlgVZJIO9G4GsI=;
 b=fDDSyWdEjOlF9btt9N9T2QGv/VsP5/jnbNZWkFBNV1OdAudiPY5p/F4aW/sC8QHafa/tW7Jb7gTzHj6PpXQkeU53LqUqWpOZM8QFkAspx2T6UF7vHzm+PHHxEW502psFE3FQzUCehsiBWpp604qP5OvSqBt6VNM+w7UJEawG0GkW9eEaZAS56Kf387lgZ4hlekIMFNwx6bfNSO1xUUU5ALC1qlwkrySmc1XBeBA7KzvW9bvm+3k+0xm7qZWQHfPigX4xfzdVzWSw+HKeSlsI7vfzHi2cUhjfFa/MUBXwYL68WWiC6tdzZffs01XVQzJftigbabI+j7hqoa+ADIbuUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dbi/SDEbhwv9x9qUnIJcSmxMwVDSSZlgVZJIO9G4GsI=;
 b=mjRiTdqPuk932D1Ca6yNkiqh1zF1Siakx5llwvZVGYTJTwDtJlZn8TYgi+dIqb1nsqxDi55OojdXkizl+/xS08KBY7m7384YS7nx5tMwazQd0bdF4Qos0i2GkQyRIv+0Nev9WYN/Q35PedCJmrMwaQvNJqGW2DHRWPxVx78hXMs=
Received: from PH7P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::31)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Tue, 18 Nov 2025 13:55:53 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::a1) by PH7P223CA0026.outlook.office365.com
 (2603:10b6:510:338::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 13:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 13:55:51 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:55:48 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:55:47 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 07:55:47 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
 by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIDtl3f605856;
 Tue, 18 Nov 2025 07:55:47 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
 by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5AIDtkwo004165;
 Tue, 18 Nov 2025 07:55:47 -0600
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
Subject: [PATCH net-next v6 0/6] Add AF_XDP zero copy support
Date: Tue, 18 Nov 2025 19:25:36 +0530
Message-ID: <20251118135542.380574-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfc0923-3683-47d9-bd34-08de26aa2f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kjgwSamNIf2UpUJG5mE+YJtocnY7AJEoOCK+ZHmOxVJd1DylsqMAfYVhcKcz?=
 =?us-ascii?Q?ergCyl+sEOLz+coNcN55MVJBJzlIHoNRsRff/dJETCCmz3dyHwln7PldQ1Xi?=
 =?us-ascii?Q?CIQrLJeY6pViSx2LkYSluqbOjCtL+FUwWJW6uSCrLBvwswO11TwIYRrZGUK2?=
 =?us-ascii?Q?nCBIO0PRTRH5pFmR+GF2a49TWltOfCIbhBBWxaSUiSDLnYGXiFzuPsjhXpx6?=
 =?us-ascii?Q?EPFoI9h+K9N8u0wa0QErYdaP9ER6mCIG5JuvgLQ0XDsPVr68aW9HtZsqbL1R?=
 =?us-ascii?Q?rhbAs9qrLEvERMnMcX/+3dHTcoZB5QyF4wn2i/BUCL8Cobq8xDD6OyWvXvXG?=
 =?us-ascii?Q?EHUf4jV+ItWiTiqCqBtM5cdDC0v7blv4wg2HaU7sRhtpwP2iNeUMCpbX+kRK?=
 =?us-ascii?Q?EKIDSlv84/q/zm6KOzmqsP/KowusVNBLsJd/97Fl/EtcUqcjsYoqPsi1ux9Q?=
 =?us-ascii?Q?aLN495BUPNl0T7E9GXuAGk/petjGCHREtOIKAcsKqlQ4GGGuASfYtHD3oUK5?=
 =?us-ascii?Q?/43Z+CGGnQQqh1mM/VRD+um/1DzWVWBZASEeEMjnMboVY5rhCbG+VHd11R0W?=
 =?us-ascii?Q?+FwRJ8iPFi/Reit8IhsEEQY9W/qWXu/VzXUwN29lx1yJevLBSy5S8TKU4KtI?=
 =?us-ascii?Q?hsya97+ms/VHI+UdbsdyyQzuOrbZq+B2QQlUdiSTIFAuexCa5lmS3Hqmu95O?=
 =?us-ascii?Q?nf9QEDuMxW9vhL94YRBx28QUJi0+BwfbjmCIjPF/eRoUp6SIgXmbriTQbyvj?=
 =?us-ascii?Q?Mou/8aFlvSlgUj8ob3QHm/Itv66JuDEFofdVYbcRCqge3xlb2Ojs8drgRzm/?=
 =?us-ascii?Q?UcRsaEHiZfx3RhqPkX5cc0Lbgbf0OGPjVsaGDrLcx6bdkWyn+ig8s/ws0UPE?=
 =?us-ascii?Q?NPpAFWoMPIxhVVw7rZ+BViSBGn5k12FR66UqOI+eHPH8WrqL8iM3m33lzJbz?=
 =?us-ascii?Q?rwqeEv3NBbChCgUP8eqZRAHk956MPLeaN5wHAc1fg76aXuMRbJJkWfOE3ar8?=
 =?us-ascii?Q?dgyGQmqtR2EhQYBTRi9UFb8AY6q7u0gWwNg92tRzxtKp7zhbN7Uj7HRp+s23?=
 =?us-ascii?Q?MC9X26blPg131ZHFr0nUKRh4MzpYE7cQW93GfzCMdUtFyLpdKzajtnKp6+yf?=
 =?us-ascii?Q?fIP8YnxAKcCpHBW5H8ods3zUH1cKD5D2/SaDDvef+OAdln0cSkziFSahhL12?=
 =?us-ascii?Q?iTwLa/roYzuVZxOo+V0Axk5Ia6SiTyihe5fr1G5YT6reYhn8RaG+g5SyxqYB?=
 =?us-ascii?Q?C+wzgz3uaFLD2XHW+ycgElzTByszrBI/BqJIN+uRDTEhTarOGdWemgfXvPgF?=
 =?us-ascii?Q?yRXdweqW7eEteCKuj/O94Y+Zg2/Kx3UoyDBi0Um9v/sXEfW8zc6aZf0bqe7C?=
 =?us-ascii?Q?a7CM3MXN7pwqQ5qcEPWuwfN0ERpAKaDnfMfNEe4WDW3AXFvQ2wiGOQAxSoMT?=
 =?us-ascii?Q?3K0DtoyHrHTq7fQUbXDSGoaXTjTCt4gmjj2UUZ8gPlXZv74DWmhZtREerKJA?=
 =?us-ascii?Q?7ovC69xp8HES4o3VfaLLEVRs5US8/ev5fYtXt98QwP1cm5/npCjVOrjGqXkh?=
 =?us-ascii?Q?EbTViv9IffvieMeC2Q5CbIEzwYiLNxN1tN9Oup2j?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:55:51.1520 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfc0923-3683-47d9-bd34-08de26aa2f43
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
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

This series adds AF_XDP zero coppy support to icssg driver.

Tests were performed on AM64x-EVM with xdpsock application [1].

A clear improvement is seen Transmit (txonly) and receive (rxdrop)
for 64 byte packets. 1500 byte test seems to be limited by line
rate (1G link) so no improvement seen there in packet rate

Having some issue with l2fwd as the benchmarking numbers show 0
for 64 byte packets after forwading first batch packets and I am
currently looking into it.

AF_XDP performance using 64 byte packets in Kpps.
AF_XDP performance using 64 byte packets in Kpps.
Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
rxdrop		253		473		656
txonly		350		354		855
l2fwd 		178		240		0

AF_XDP performance using 1500 byte packets in Kpps.
Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
rxdrop		82		82		82
txonly		81		82		82
l2fwd 		81		82		82

[1]: https://github.com/xdp-project/bpf-examples/tree/master/AF_XDP-example
v5: https://lore.kernel.org/all/20251111101523.3160680-1-m-malladi@ti.com/

Meghana Malladi (6):
  net: ti: icssg-prueth: Add functions to create and destroy Rx/Tx
    queues
  net: ti: icssg-prueth: Add XSK pool helpers
  net: ti: icssg-prueth: Add AF_XDP zero copy for TX
  net: ti: icssg-prueth: Make emac_run_xdp function independent of page
  net: ti: icssg-prueth: Add AF_XDP zero copy for RX
  net: ti: icssg-prueth: Enable zero copy in XDP features

 drivers/net/ethernet/ti/icssg/icssg_common.c | 469 ++++++++++++++++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 394 +++++++++++++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  25 +-
 3 files changed, 739 insertions(+), 149 deletions(-)


base-commit: c9dfb92de0738eb7fe6a591ad1642333793e8b6e
-- 
2.43.0

