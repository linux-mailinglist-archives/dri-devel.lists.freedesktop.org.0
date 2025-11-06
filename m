Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEEC3B991
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFE510E8EC;
	Thu,  6 Nov 2025 14:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="qVt6iwTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azhn15010019.outbound.protection.outlook.com [52.102.138.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728B610E8E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2eWppMEhEpvbeZE1oEWWhtLEbIXxYFKWemLPLLcyJ3545jlZDwH7eQUkWX2wNBJkGyQttXdef9gVQVSuTd3/q+n3PHAFQKlPvz/geBmenLvSIe8QCCnYph3wykzFJJ4DPhiTLHRBWMLnkKDLPHUkTXEIWgLel4mI4pGolRgXPMCXkD4CjxJlOCtLfA3DAUpN8JdxzdpIMnZCgCuRIMWBhgzeSt/1VzZSRLmO7eHv1Y68WuKCTbL7iON+Xkh9WUcT+0XNBKXsH/9Kre6n5cUYpWwYlil961YEMM5PHCKNwoa+bZFgpOEgyc2xyDW1k9YUf6VqIAEfMQG3Ah/oCXbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
 b=wkybz5KV/9OT9u1Q8aEmjk2AVS31tZUogjHFku9/UiaO2R42ojRb+K4Av5wlJuizKVu/MALkxk2q9sZF7cT/fHm0q0Gxkulto2S1SaxHn/ohG+Pi5e9BZ6nnMyfeUQqmnaESbTPUUTBQ+KI85FlJ0s8FNKg2w2kR1xCw24+Qtv3n+b9nk/+UgbTcJJLQp2k/Jl2c+flr3imqnGGsFc5ZAPW21ln5f/UGFfKlgfXtXF59lXG3L/sc9QDDMcLI5ZGC+r7QJfREDo6SyKdBfNnZ4iBQIs9EzwTFnAx+T/iv2IvgmPy7/GuIpNoFIpeUeLndonhu/Hl+ikjQ/jEJ6FfVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
 b=qVt6iwTaSVMwHEr78O1R41TLIo/SyZmYJGfNtJNhM3WCsxyVOam7UE0gPf1eEVe6CtXz7IN6ztPciiH+iVE/LsHSXMXQ2NvFDFJS1VfwrHJlkJXpUHKriiNpBhNJC7b8IQbCeTU1X0vFD+Erz9/c2s6wQvsfv5jin/3WjuiymyY=
Received: from BN9P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::6)
 by PH7PR10MB7729.namprd10.prod.outlook.com (2603:10b6:510:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 14:12:51 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::e3) by BN9P223CA0001.outlook.office365.com
 (2603:10b6:408:10b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.10 via Frontend Transport; Thu,
 6 Nov 2025 14:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 6 Nov 2025 14:12:49 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:40 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:12:39 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECREO1335893;
 Thu, 6 Nov 2025 08:12:34 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
 <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
 <louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 1/5] dt-bindings: display: ti,
 am65x-dss: Add clk property for data edge synchronization
Date: Thu, 6 Nov 2025 19:42:23 +0530
Message-ID: <20251106141227.899054-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106141227.899054-1-s-jain1@ti.com>
References: <20251106141227.899054-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|PH7PR10MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: eed53138-801c-47b7-75ff-08de1d3e9164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|34020700016|1800799024|376014|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ncXRAMPx/Vza0lSVe3MDYxMZ/wa/vSsvFNiqft34Ck2qJhCmTiCtWEKFhS/6?=
 =?us-ascii?Q?hMJ5rbB5aPzMYKw4KvvM/OFnRsWnqr+6dBHOx+ZKp8ho9nIuCe4KGJBdr2IT?=
 =?us-ascii?Q?kaAZvs/2K1IBikYxuM5m5Xc5VE4QgO+K8aCbNyh7eEFoqSzfEAU4E0kZWUPF?=
 =?us-ascii?Q?ADra7+HdFaP92slohy0s9Iw4sA9s1Nan/haV4nEvE9UxBefbOjH3ctax84lz?=
 =?us-ascii?Q?YePZ+1897ijbVIcMVnsYaQJ7cbz2qyrg74T2P/nhd516MZifsuzOZy83EohY?=
 =?us-ascii?Q?Xx3cE8T4dqNYHpgHVa2t0qh7vdbjR5ZXWGldibJpWjFNbAi26zgHHDoVdBrz?=
 =?us-ascii?Q?BlyMDaxHcr5McQsse3GxIh5K9K+3SO3NkE02kuhhLXzLBH24d7vc1SkCYjDw?=
 =?us-ascii?Q?yoxwNomUngPsFfGIExdLTLj+ovOFHeji6JJUjGHt3wZ1XQF93ZOqklkJOcbc?=
 =?us-ascii?Q?5CU4wW/5MNbR/GN5J1kpUoCIQjdD1EKiEfK1C4hh9hWE8FcV5drlGculTKzZ?=
 =?us-ascii?Q?ksOInMgHCDz55mIWgu2jGIxTwt33rT/cVG9/B4AO2aCRA0i4TNx5BIHGRCI2?=
 =?us-ascii?Q?pdczg8Q0CCJ+GsSkzvrL4io6CReJ0UaP9rD9HiVxUpsrmOawWJSgZXt9Jut5?=
 =?us-ascii?Q?GhT/PLn5aFCaJVCEt7PJdN6IhjCqBYXDBDRMnN+WhXfh7pbA7To0cFB/u5vo?=
 =?us-ascii?Q?n94dx0ttxkrS8NwnFY5nVKY2SNBtT+4fVVvDPejuj9tg5ywa6dgJZTeGuJTw?=
 =?us-ascii?Q?8uvLmk1o8+5I2Zqs3pX8MqC15EDnVKHfzNSdYtoiacsLAxBXpbT4WXcv6qwd?=
 =?us-ascii?Q?u3DiDx9W0m/Jzt+hRiv4XJ6bUUDk5/a2o8wJphPEZDRcvjQN32d3dlKMLIK2?=
 =?us-ascii?Q?KIzT2PQ4Lxv5L6Kv3z9Zg+hC5rhRiPnMD6SOTW0Dws1Zk0d0q5P13atLlOZ8?=
 =?us-ascii?Q?VyQAuTG/A2HZ2c31oT6MgM0B+oHpWMHU1FAGg8MaRRitsPbNXg8b0Cj/Sypq?=
 =?us-ascii?Q?esa8CzNVCJZh6OMhLTgrQI1nZaCaQCuPetukhyGhaD5UN/Nqo/1sFctYip/g?=
 =?us-ascii?Q?jA7dlxa2APbpRnt4QwBm1/ftkOE0YdRIc1R0seE3Q/7y096QHbqCJomFYm0o?=
 =?us-ascii?Q?JU1y/BIX4nPPPZnYA07rXAJNV6Qz+LsaFIGPe/t3YMM81H3W1BjvlyUjFKGf?=
 =?us-ascii?Q?X6n8l84Em3F5bN9ZRem2SexihHkAxw0MPTEugtlJoppxB5n1rvphTl4MiLzZ?=
 =?us-ascii?Q?wFpeycUyqt7QD3kdO/aKjRXDoBmmUtjFIJrIr5OHl6qWr/MEA4DQCHOjq5kq?=
 =?us-ascii?Q?TSKHVWqm1KaY8WDpC6joVg+z9bs/EOj4CqlOykGRTOWPgK05ePunqc84QFKV?=
 =?us-ascii?Q?pu+jbRDuagf87Jhq6f3rEnzMLFdhM6B6uLgsBdU19hpC9hOJYKgqM3SZ3zeE?=
 =?us-ascii?Q?KimybCRdhpzSmM5dhC0Azqa6tutQglRiG32J/TXqOoNet+LNOxdhildwqbCu?=
 =?us-ascii?Q?+8Coicwv7fqw6KBk+XpYhXq4Yz9hmmGu1wDMNPWQdHTQ8r2IEyU5safMVBc+?=
 =?us-ascii?Q?PK5aDFlvvrBmPvg80Tz522D1qRmlVBK1fxHgEEXi?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(34020700016)(1800799024)(376014)(82310400026)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:12:49.6950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eed53138-801c-47b7-75ff-08de1d3e9164
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7729
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

The dt-bindings for the display, specifically ti,am65x-dss, need to
include a clock property for data edge synchronization. The current
implementation does not correctly apply the data edge sampling property.

To address this, synchronization of writes to two different registers is
required: one in the TIDSS IP (which is already described in the tidss
node) and one is in the Memory Mapped Control Register Modules.

As the Memory Mapped Control Register Modules is located in a different
IP, we need to use a phandle to write values in its registers.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 361e9cae6896..b9a373b56917 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -133,6 +133,12 @@ properties:
       and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
       interface to work.
 
+  ti,clk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to syscon device node mapping CFG0_CLK_CTRL registers.
+      This property is needed for proper data sampling edge.
+
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
