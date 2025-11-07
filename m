Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5AC4139B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9037D10EB67;
	Fri,  7 Nov 2025 18:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jW9nTRKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013018.outbound.protection.outlook.com
 [40.93.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C79610EB67
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I04Tgfhy5Kgrf0kPJUMxzW3oJ7xATXHR18o20IAA8sntX+W6o1dcMS4WcepO4K6lEgtJbj30tdn2jC8cBGw21NEiooYAA/gJpuGbAF6CjI20YHEzJI5K//3N8EHZbQ8kdC2Z/RtwBdta7lNEhcSWNsGwsJWqXy8lkUk5yVmHkp1l+pWfRVxuQStUPsRHrHuxuqtGc7NWak396dfKpKO26poSq2VFlvFR0W0FTHfJVrJFYiG3HYRfBjE8ABrYmmiaN737oz2wLLuvy/MpDshmilT/ZBi7yuO9cDCjAiqW9ZqVgtf8Y3OUx6kRaYa5GWclC8i2Xe86uL7CbyJVcD/Few==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRtRUxEHPAOUWt6rXL9LZA/slwG7zJxJMRF8CWShZJo=;
 b=TgNgN0VA17buFCvXwhE2/b+WtUoKBS9H10d3cMHD6A0JWDP206Ulru8psDi8n9FmJxAkbTYqR9i0IpNCKWiTG87ZV7pVy7GbHNd8B4bp89v2Wzoutj3MnrsOa41eSsGqKmXulPraSqZ94yj/vH5sXtgcn2pxQqb34w9hBqt5xR9e+Q8TDDuDJG47wmPv/lLo79DkWeWxWAFL297NILcyvFjedT7/Otjho9gGFR48nL1rM5w4j01oD4CHuDhb3ihquXqyaSkvwIPXZ5pJtJ+h4Df56F90LdpeZS+u0/c0ShQwt4yUGLW57tj45JzUkP4IvjHPYpgMpkR8w+cUMBOq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRtRUxEHPAOUWt6rXL9LZA/slwG7zJxJMRF8CWShZJo=;
 b=jW9nTRKG+J2+i1UY3cW/FZRZd6HVoWN3YgQvXabLR0qk0hyG964B/dtOv2g7amhBhZVkbR3g0ABch8LhKVb2KEo9qmNeQy/g4CzdHNO2+rnUKkRP+U8WENYktGUe8CTUoIE5WwsJ6hzj2SEoBYzjbMZuTTg3OOFXr7ndjJjn8ro=
Received: from CH0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:610:119::32)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 18:11:18 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::7c) by CH0PR03CA0363.outlook.office365.com
 (2603:10b6:610:119::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 18:10:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 18:11:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 7 Nov
 2025 10:11:17 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 7 Nov 2025 10:11:17 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Clear mailbox interrupt register during
 channel creation
Date: Fri, 7 Nov 2025 10:11:15 -0800
Message-ID: <20251107181115.1293158-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: da13d04a-a765-40fa-c3ef-08de1e290c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gwfriBodNF6FVR7nFFWoqLquOHkL+moFZTGGPRNSSpeMtqhD69AgVcMG5p37?=
 =?us-ascii?Q?N79Up7JS/vpaq1NUBTeb5XG4XAxD0J3dQOCubceAPJFgZtx3RCEAZu0+wJhk?=
 =?us-ascii?Q?7+ULgInqm0xeRFQnWfBXKDQJJmBkI2bL2NkFAJvgXVJb8fKeyJRKqJNyeeyN?=
 =?us-ascii?Q?ImEFFwbjfMArcOWA28hjbFzQVDqNkAdP0O9rkZLzkDZMRYN+ZmOCcTtGClxl?=
 =?us-ascii?Q?D8Gd9fErPRQp3I0F+qE6WURlX0lbUavi0R315rPQZ6F/wkX6btamzr3KmvpN?=
 =?us-ascii?Q?0XDA83ou19YrPL7dnvde22x9R4+yA4TeXFl6XIBE0COmp5EDTjj7EES9tyY2?=
 =?us-ascii?Q?X0I/segAwnXKhdwSScMRqKqZAvz7OWbmEXUCFwzoSKUD7D5M7f2KZ+YRNGnK?=
 =?us-ascii?Q?l2tzsMXWkaXygVDAfNCZta7C5cp166PqXGjn6vNp8FoqzKnO/nBMNDidSgwu?=
 =?us-ascii?Q?/spdwFELSlgbbnkEn8l1N+/Tj3b0lMGVJRlzw49k/coGHei8dJERCFl9x1z2?=
 =?us-ascii?Q?W64OtSF4NuvtUdZPTWTmCvI1C5sXyOkFbOKX1eLe7JAei2IUwhW0qvq6bZnt?=
 =?us-ascii?Q?EzlgfTSUAtPhVWzIFJw4HarrrZuqEwcedGfJgBW1WiE1+yhcxepX5p4qUSuT?=
 =?us-ascii?Q?fRPseNJ+L6FRMiiWykep5YISGlzDEQkPaTyvhnN1EubbtJJG6zkcL8S7JNt9?=
 =?us-ascii?Q?6FF/JTCZEUk/LdJHpNQ444gKKPxOisMFz51GM1XCXxzprDJu90Y51Z87iKH+?=
 =?us-ascii?Q?yf0f9ff4EPQFcBgmosVEJykTj3LhWGsuSlLFCx9TmsXRw74207eglhLBZhGz?=
 =?us-ascii?Q?SBDKgAgSei/u7bnOhtj+8MUa6UdJzjH1Y6VR/Zi+Tp7BldGzBspg06gg2Cs7?=
 =?us-ascii?Q?VODRUyRTeGswZhF9T/qMWvbQCBxodH4wpsLIMKXKgcUDyHNVUGUcOK5CR3+N?=
 =?us-ascii?Q?ZTpGtX7qTp9Uly1tsyoyPVw/4dimli5kvtSP0NemiOrDveQu/oB4vgpUA6YQ?=
 =?us-ascii?Q?2YLb6YgNNsjxg4vHLbaQyXZKIh+AQDBIuRmimTOamGugoCk8G+K0EkmmD2p9?=
 =?us-ascii?Q?Me9wnNwaDE0Du9f2FU1SEL2SP5u/WS6cf8Jp+jny5IxV2VJzwiDlNu4feiKt?=
 =?us-ascii?Q?vh1ulsOdxiOCq5SFbJ2XgdOITcgvesWvnvJZQl5YqyhNdiRt8WKLFFXhdvjW?=
 =?us-ascii?Q?UaYZidb1UHGp0qzeLuuaQnXm8//8y4s0EGLl5qKE0/+s2hOZ/Psz2NeiGpP8?=
 =?us-ascii?Q?+S5OrO2IlmJl77TeRiIpWBy1AlsoyvI76+zgjTMMavJY4c7Jt3X0iGJUBIyJ?=
 =?us-ascii?Q?JowYhsOmCbpPurZqw+OIQgq2zWIgp8FT790TQqNAZ6+sqjC16aulQUvkNez8?=
 =?us-ascii?Q?dfmo/4yEHjC4NKPPMaXPIscbrSz9lO6um6qMICFY2ef6C+R7Rcqx5pyVhyW/?=
 =?us-ascii?Q?5++b4PRW0KAZlmuUXwqXGX+G33W0Ip6HAVpUXjBWSeY85XM28bGzsm5do9iH?=
 =?us-ascii?Q?S8doxt/Fu1fu8HPXuskXtIpZk90x0kx4D6L44V89liRoNjbeXI0GWuclxdle?=
 =?us-ascii?Q?1BjQG+dcNPJeCUl2L24=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:11:18.3009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da13d04a-a765-40fa-c3ef-08de1e290c67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219
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

The mailbox interrupt register is not always cleared when a mailbox channel
is created. This can leave stale interrupt states from previous operations.

Fix this by explicitly clearing the interrupt register in the mailbox
channel creation function.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 24258dcc18eb..858df97cd3fb 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -516,6 +516,7 @@ xdna_mailbox_create_channel(struct mailbox *mb,
 	}
 
 	mb_chann->bad_state = false;
+	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
 
 	MB_DBG(mb_chann, "Mailbox channel created (irq: %d)", mb_chann->msix_irq);
 	return mb_chann;
-- 
2.34.1

