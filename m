Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE5D2F198
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72F710E848;
	Fri, 16 Jan 2026 09:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fcb9Zt79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazhn15013060.outbound.protection.outlook.com
 [52.102.133.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC99F10E848
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+bPmvF3zYHs1oh8FAsrbjj8NfrYmpwxCiwT4y6ATEHxI2LHhthXzuRDMyDdkKr8ASoyGaOBTQZ/6GzYE8wfZ/38C0w6hACeGlYDyvFl41K0qzrCy1aMH1w+5piEKBqlFf2NgtC3pyPUlb9udvP0PDhnxlnbaaSdSd89Y7hWyA7aflnxVIp3C+kyumcmVg+uTqKc8eFfrs6E4HHaGOQgyUEBS62m99/bdX5/1cWuwqpEX0YV5cp1IX6e1eQKv1vKVftTCG+wUGbmClJvem0IX6UI6VkfFNjq90+0dcHsSApc/s6R9/QE7B4s2MEjI4eB3uDXrjXQPcgr0pgt5yFJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJE33N1jIYsoFx3Ds8AS5TSct3fLPcWJwS0Rd2/R4+0=;
 b=BKEHDgAC58bMXMVIFnxsByAVCZCny6z+y7WfXYOVU4BFe6UavkMxXqHy4DCbprQvwWyNA7cHWTeOhFnuh7EkU0vceht1/Y3oKxA8MMc+WolqsjuhjZfFicxSnQ9T+zB7uxG3bz6frAr9ipBJGexkcnwjqeXkf3xMHCUMh3xLv862jOkhOJKq+6cyHESUkFif1m+/IN914p/+Y7wcO94HuwRAfig8Q9Jhv3e2ECb4odmIYly0XCDvYI9UC8tnO3zT8i8zUm06jaQGJZ799wkqByNv3fUfkAUJMPdWyd92WJQT3CgkydCrpuPGQ055zpBwu0xSOb3wp1HwFCxTcbzoTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJE33N1jIYsoFx3Ds8AS5TSct3fLPcWJwS0Rd2/R4+0=;
 b=fcb9Zt79Ss0nPJ6j0x1zlCDs0jE24ShqD0J1tjfX/p11oNWYVQcdDhIW80wr7LIEn3rnn3ydmG8yywmacBO9t2lE29bWhSkus9PGkExKO3/f7ogQPTeRACqEgEhbzUx6XpKOmsn1In2Caadq7xBtokE1Ba0IC0NJbZZbtFSI54w=
Received: from SA1P222CA0158.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::18)
 by IA3PR10MB8492.namprd10.prod.outlook.com (2603:10b6:208:580::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 09:54:35 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::a3) by SA1P222CA0158.outlook.office365.com
 (2603:10b6:806:3c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 09:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:54:33 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:32 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 03:54:32 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G9s6SW2958972;
 Fri, 16 Jan 2026 03:54:25 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <mwalle@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v4 3/3] drm: tidss: tidss_drv: Add support for AM62P display
 subsystem
Date: Fri, 16 Jan 2026 15:24:06 +0530
Message-ID: <20260116095406.2544565-4-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116095406.2544565-1-s-jain1@ti.com>
References: <20260116095406.2544565-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|IA3PR10MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c585cd-2789-43ae-ee57-08de54e5405b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|34020700016|36860700013|82310400026|376014|7416014|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Wy/pueIO9crMs156oTlzNqBaIjPONrBzGLPDwOEGo8oMxbskA67htmqa63S?=
 =?us-ascii?Q?t6XVcIieL/TyM1E/KGV742ESD6CSMLbWNSjv3OXT77p9T4WLylc+/1l8DfjN?=
 =?us-ascii?Q?guS0AvDMflbRLbmeIlv4cAhWIbPTKd3d+v5WwfBJ5m6L45dpvdwHrPu3qFCx?=
 =?us-ascii?Q?uxVne4E0e9odw3AUwLpsu0asA3kp3uOoP+6xLklZ1S9Ls+TlPmOkodgqIVk5?=
 =?us-ascii?Q?o3Kq0fX8KxmqZyHP1vXDWtOST3RwYh0BRSpPJYpavwCmPcAki3nP2rfkwBrm?=
 =?us-ascii?Q?cUPR6J/fiH0sWIR6Y2a7rCYekC9H4l0bORftdLP70sANtlYqoheLshdEIY5F?=
 =?us-ascii?Q?WKndb3X0zMy6qku2+rOjOaOErRfvqnQuU5kBLTL70dsrvQ8oNlAkMGZdduob?=
 =?us-ascii?Q?A4le5/puEsb4DbocGjm5xNjqqCX0cWcCbONoSDnL39Fet2Iu+h1GBSEGwkMl?=
 =?us-ascii?Q?6DssYG8lI6N/iLox2oOzAdJsnlfE0j2as+gGOS0/P7O2WIZ3kFPG+Iv541V7?=
 =?us-ascii?Q?Wk3eUReV4HxVuLK8bDiV3uNwF0qepvNZAAELdAfg3z5gifpV6txu42lmbX++?=
 =?us-ascii?Q?+mtnbMAqG4sCpETqNQ7d0mjKdw25gklmJU9xM/NxUNm14DBXVxx0surZTYip?=
 =?us-ascii?Q?/5ffqyGg10dueUIZlKwClNVXwjGEITtT/0zogJWAtXP2m5Mpn7f8HgF/7cAy?=
 =?us-ascii?Q?4dzPMRR11d5IlkRWsjoiGps7e6Zh3yk5KQQQi04bV0T4UT+sIBfGBbCZWQm3?=
 =?us-ascii?Q?hwjlWw77T6GGJUd+bH8CObMZF7XVpjRlsuFNNQC5H4Zoyq5y1w//b7n5zrAj?=
 =?us-ascii?Q?2wkSyDyj0YmFeb5ZjdogMp/U3HNgwGIIsXFzVMVxE3LOWAtQN8WK/bS4gk85?=
 =?us-ascii?Q?aiMaUZ6KgT3rR1Z2Cc668u5cGyCpJHLjuAYRG/d9oYTSkH4qxVUsSo5a/Fnf?=
 =?us-ascii?Q?QadsFKLYnGG3oweF6iIUkqfSYvK1skte2sh8U68caHR6GF3Y2aVajAADUp76?=
 =?us-ascii?Q?xHNtPhibL+OKpTBxWcpO4+153FkjrxDmM8dw2itckapOrsiGhmG5CXmNyDxi?=
 =?us-ascii?Q?3QGcFB/mG30cxs766yX9YG70Q5zt/6Wt0uFyXRq7EV/njhPh2PNhVWPePdjR?=
 =?us-ascii?Q?/CNkZvI4mJgoXFWKdIu47J01rPQAjTaecb/QfTGFK4fQxHR+AJJ59HvsiIam?=
 =?us-ascii?Q?ehVDtCwp178SjugEijauxKnQ1QDOOOdc1fPh6dFe6k7uZ9Qpv5z/hqVoLeNU?=
 =?us-ascii?Q?6QsZ7mvSw90NbLubeC+v9mZ9zq18HfGCSggbG0CKU1YWmkWh5VD7kruNby3j?=
 =?us-ascii?Q?6i6NbC9MECJ3LK2nm6lkUOtGxGuPPtnoQsCsdYqb4Ep34cbeolRSwJQ2YZi/?=
 =?us-ascii?Q?rooWnk09kxmogFatYlLNQGiReexZjoABl22NFPh/iZwFoiEGwqlSs4cASIC2?=
 =?us-ascii?Q?J4ihDv/OtNT6si79d6AgSC52Io17GiXKTqpL7RJvawK6opHj5Ut3KKiw8uTi?=
 =?us-ascii?Q?owVlD+0w8zWluBGesiGrypS2dz1iMOhOTa6id3kNIQIP/ubYHKmEqiBUxnkE?=
 =?us-ascii?Q?Zei1CULUBLapHOrGkJgthJmAu6+ImvhO0Fiz6sZU8Q1qJHCGnKm5nlEKh+w8?=
 =?us-ascii?Q?A5HpJNRj8pJqCEjjtaY177TGpj7d5khRGC4haqIqGSypfeNCSNosxqaXlBxJ?=
 =?us-ascii?Q?haaltSK11LfW01/2q2MWlNTc5GI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(34020700016)(36860700013)(82310400026)(376014)(7416014)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:54:33.6348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c585cd-2789-43ae-ee57-08de54e5405b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8492
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

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This patch adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 93e0c34c73aa..ff6d0adf89e8 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -319,6 +319,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }
