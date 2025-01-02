Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788FDA0008A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 22:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF0410E3F9;
	Thu,  2 Jan 2025 21:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pYnkKKom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4041710E26D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 21:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFRSRfbt4Olzz4tiEbHAiBundjpyIvgnv6xGntKc8jORaxaRoOgtXIZTVarc7uSKesm209n3Rx1HJYYuu2l0Y/L7PLTo1P+6qwlbdscgoTV90DpS9/FSGtHQtrmgHA6zCNisR0fL+wJAIcAiw2cJG3FQERDSvQ6jNcbUOoBa6AyWLVfYcZnUW3AdDd6gn6rSzTs5ir1g/SqYuW53qXWFMmz2w9fOyX7L/i+h4l2H+NtWSgjDjhBtcpYlgtl1hk+vSJ9dU0YJhmcW97GL3H+EPK5uoZTWX3G/XCbtJblXgjqCvd3dBKDqYBlkhKe3rnWOQcAy/T9Tqr7+dAuTRuK2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9lD8hdcYumDkPwVtIQbDkc+w3yTNuVmfJ18iyAm5Io=;
 b=NfzUQi7WMvxhPD4IbzeZHo0SHqJySvIVBGxojyz4uDaol2fiiyBG7K7yCa2YoSwxkqQwBX398NLBTuJYl3+tjAs7kTfkl+qbWE6H0M/VvDtWqfdihDPx6CRTLsSpBFjZRaCjX2b8o7btKWfKnWDgt3AemdSKlTWGgjpOA09axvdssT4zKIQTM3vacNLHPNcevSere6Iq1YiiDeyBpWyxcni9psUDIGURRfJm29xIjMtZqeCRPyCRmcxt2WVp6jvd/slA/WY8nD1Ggaf6Akf2lG4rVRD9fifpkAM5atKkq6m+DcGMqwnZY/6/EtJseKKKA0yW7MDqZAL9U3zrOHqFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9lD8hdcYumDkPwVtIQbDkc+w3yTNuVmfJ18iyAm5Io=;
 b=pYnkKKomSeKMsOdjJxDwTzZYQQB3yFDJHAfv2SGHAUOdCZAn8TuXKLnapCOAe7LG5GrOzIAu3nUrKqEFiXddPiFub4Bm2VEvLb0sayfZaxlcKBDvomczFGbO1/yWUp6EW9gAdZ65oN4WTz6/wBJL1uHfTcb8rtb+JmeVIEQarew=
Received: from SJ0PR03CA0389.namprd03.prod.outlook.com (2603:10b6:a03:3a1::34)
 by DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 21:22:53 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::2e) by SJ0PR03CA0389.outlook.office365.com
 (2603:10b6:a03:3a1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Thu,
 2 Jan 2025 21:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 21:22:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:51 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 15:22:50 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH V1 3/7] accel/amdxdna: Declare aie2_max_col as static
Date: Thu, 2 Jan 2025 13:22:40 -0800
Message-ID: <20250102212244.1586340-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102212244.1586340-1-lizhi.hou@amd.com>
References: <20250102212244.1586340-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b060ec1-68cf-4793-08a5-08dd2b739de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1PHjOxJr7EcYNcyYR13cUZ5aAfmwRTe2W1Tbtj9xJGWzRsH7iZ9RrqQdQOss?=
 =?us-ascii?Q?R/8fY3Bc8shKHzD72NNeydRCiPpbEGwzHk3jUPYjoQ8cG7tQajpXQo+/wPNc?=
 =?us-ascii?Q?z8d1LNb6Th0iTJ3/CjmXjZIjqXJBtGMj5ZFuhAYDsYL9yg34U+BEskwDYk+L?=
 =?us-ascii?Q?dX8kvdsNKJu9jKWVuLz7yoM7WjD8eVJpTOBTYVqu+efahnYN0wF+NWHmf0Qo?=
 =?us-ascii?Q?Zyx8tDiU6LaqXQmojyYZoF0P1O5pZmM62FzMiEj+04dyCPTDhbWmKKy/TMoj?=
 =?us-ascii?Q?Xnl1iX23whNNBJNAmA+2KD+IdMkG5qkkByIS0XcXgc/dTvMgVO0ll7hGLzIB?=
 =?us-ascii?Q?hzW4mbvBTb3C8+schSzLJFC5NT3avzfP+pTQTy/aWLgITuauamchnHRKMkTj?=
 =?us-ascii?Q?4j00mjp0qR9a6dPfS9DsnRppUljiy2uW8F4J7vvu7kDjW0JMYOr1KaTvepz0?=
 =?us-ascii?Q?duWnUtQqN5E8vK+TvC/kPP2rmWCQGbln3D0PwEc6W8Utrd/GDy2bqdTHb6JU?=
 =?us-ascii?Q?8qZNKS6ThrbXMkz4Pv7qow7vxSZLJpWuifxmf3TAE0hGiXjpx918XDvJsgcZ?=
 =?us-ascii?Q?y7AHU9Bex9Zga6Jtw6Ox+8MgRAk1ewxKs3SHlxenm2SgjJmCqCj8XrwnEQvJ?=
 =?us-ascii?Q?3IFjToyMyTk6111Or4mfCQcl9U3XewOTDOxnwZWyyzuUi8uTSDy9AeoL8Rnp?=
 =?us-ascii?Q?B5473VyIDMCyTZiGdoLz3WdYjBQdmjPqHnICvgl0sgVb5d1NfpfYeD9zrJeF?=
 =?us-ascii?Q?j2MVeexQNSnnk/aQxosmM6viTYxejskDZL0UHpy/qYGlkx2kvI2btwFAK7QY?=
 =?us-ascii?Q?NvqNsJzT6EtqJoNw5bWU9YoqVWi+hZKhf3SHzQAjGxIz3//9UU9eX9WzBkQy?=
 =?us-ascii?Q?mjD28BsFagP/rGB4Hdd/5pscB6QwcWnwyYOcJbNpNL1vH/ixp3NZE15r+BB4?=
 =?us-ascii?Q?oHn/FGNLKN01ek8mOl2uJT00vzVUh06AzuL49LNFAoOHrC/7Yq7F2R1qLctm?=
 =?us-ascii?Q?1SW7uzbBmR1RBxbPr4jM2UiWLU7KaJuAt7jp+5zD4IdMqvkMb8Hp86C3m3LH?=
 =?us-ascii?Q?20M5kUf6hE2yPFHP+07GNQWHHYOdoyZlieloUG2BYg918rOpoFz062yGVLyu?=
 =?us-ascii?Q?BIVMbNimLmL1O4R15FWJJ9UBajE+tulr9FNWDZkJLT1IxmPyM/lN5J9oDewG?=
 =?us-ascii?Q?I5YFCR+rkB9O6Nz7CGIUkM+GNNIP19/QyAVaq66mlnwB7J/uR9vC6T0nyBwF?=
 =?us-ascii?Q?98/+EZ6hVxpCRkNbGgN3+O2Tu8tMRveXnvXiet28/Jk9JKmozPlB2o7QGptD?=
 =?us-ascii?Q?+hUyq3xT1c44VWZLzkQ0t49qdiOZDQnGG+TKTCjbk8c5PK5ccywNglkye0PG?=
 =?us-ascii?Q?LgIM038HyUODmClNtg/h75g27qksnbxvY9qdVpInh7ID/uWkT+P6/PhtXdcW?=
 =?us-ascii?Q?VFPls+2GpfupBaZaB6onYMESTJ0oYKLIBYCVNpU43Pg7Kd64qYQCayXb3oCk?=
 =?us-ascii?Q?7VjBR0aGFnNOql0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:22:52.5116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b060ec1-68cf-4793-08a5-08dd2b739de4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499
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

Fix the sparse warning:
  symbol 'aie2_max_col' was not declared. Should it be static?

Fixes: c88d3325ae69 ("accel/amdxdna: Add hardware resource solver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412311028.x2UtcSHm-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 8b273bc7db44..5a058e565b01 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -25,7 +25,7 @@
 #include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
-int aie2_max_col = XRS_MAX_COL;
+static int aie2_max_col = XRS_MAX_COL;
 module_param(aie2_max_col, uint, 0600);
 MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
 
-- 
2.34.1

