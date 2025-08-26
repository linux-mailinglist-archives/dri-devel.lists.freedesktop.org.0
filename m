Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320DB37135
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 19:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9691510E6C6;
	Tue, 26 Aug 2025 17:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RuZpYBh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933610E387
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 17:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WETtXZIDKvgo3jqfi7f6TqoO9yVEt2C2svDEEJVM7jTg+Omo2YrnQiB7Eze71j5dKt7QtYTgNkzv4Gc/nIIcq173mBO7UmB9jhFeLsiqPPaubXu6wgEvws1YXrMlEL4Y5ujAJmG5UNlQIXzQ7k08C/0KWPfZban8/g2tKGk0vn+/7qOuQeIKADxyObrMq33EgfmnEXLze5oryVLqsYKmETANVloJHjX/qC6zW8WyB14nZn4ZUjd8A6K2RFheqOkFdpUz9rFb91OyUI1noFfiCFuL6DNWYokW3aZhFuUaN5tK4DbmHjRZkld9a9qQeULFYbhQ6pONxLRhaB/n3ly2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD3zLrryjDyVDvHLjt4ZUb0pM/WfLQ6cRCqYZ+gl0B4=;
 b=FCYcxBr447goHNhObWrmLHSCIkbapRv76GpXRbKenHKZokoJfqwxFxFuC+hdvi9+HfMISaKo6CDvYHCeXJekA4y8G04labKXmAMATs8cOmOATi+Ci+tC4RsFuaAwJgJY+appvTgEKJrh3svmm+Slh15p/KDCrX82Y4RDZCWzI980oZQjnfytwZNnfeV4j5meLRtoN7ZTVNr0ip9fg22QltHQinrBxZJhNJxYxWYTIsIFFc62B61TIqsgp4+iNj9slWPHurV8n8JVavIVqEYvL6fsGtW1wOGZ7mSlLPFuU/MW0Gs1S+7oBD9YJdVuGx0igUc2iqX0nJyuiIlsIdZTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD3zLrryjDyVDvHLjt4ZUb0pM/WfLQ6cRCqYZ+gl0B4=;
 b=RuZpYBh1eIPDTegaVYD1msVQUFoOj1mGuE7I/Hflnyh1jiBDvx0amQ4ThuLaSI4N/ZtVczYmkaehQs4zR07HBmFVL0s2VSucK8htuda2oKLLW7F1OWz8dTsxepe7prIymfia/BJAUpL+b/+ZEgGN48qJCrW7eNjdpSuLfB8xWuQ=
Received: from BYAPR07CA0066.namprd07.prod.outlook.com (2603:10b6:a03:60::43)
 by SA1PR12MB7368.namprd12.prod.outlook.com (2603:10b6:806:2b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Tue, 26 Aug
 2025 17:20:01 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::fb) by BYAPR07CA0066.outlook.office365.com
 (2603:10b6:a03:60::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 17:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 17:19:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 12:19:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 10:19:58 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 12:19:58 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH V2] accel/amdxdna: Fix incorrect type used for a local variable
Date: Tue, 26 Aug 2025 10:19:51 -0700
Message-ID: <20250826171951.801585-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SA1PR12MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 61aaa9e4-0cc4-4685-a23f-08dde4c4c924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GFDHo2UZS55LqsvEnw3OM9C2kdqIQqguDa+40JxJbo43VN/WVwjlOCjSrrZn?=
 =?us-ascii?Q?rJxHX+pvglQiSvXBO9/AR/xxVa+GpsobaMDPhzHyBABApsJZnTsL7BBKI5AL?=
 =?us-ascii?Q?hzSxEvy9gwDbe9ZX89UFIp8Kn571+SQLIiS4yk39a74xcbBBfwBrsFr7AxZ2?=
 =?us-ascii?Q?FXFNxuuRa/hpbv+ct1dRSu2jDHzwrYEoRENk6/rBTPQXbY3rxYOXtNx8BQpD?=
 =?us-ascii?Q?UhasEWtuC17pkSh+JxNzwDCkUGIS4dLasy0OsmdiLA2fSgIt96BetaZLwiJr?=
 =?us-ascii?Q?fnz2+29g64A2tHy2gZlF0BCSdo2s+ygEq1qThoKG3wdhRWvuD9wcmJn0Folf?=
 =?us-ascii?Q?pcD2IrJ8H6tfgZkrn4O7Ik3akoW7j0ntA01acRY3WHJRLQI9/5q73hrgdEmY?=
 =?us-ascii?Q?WobZZKqkkxaUgoOmspgWZyYS+jTYqs6vtkpv2qwyE72rpluGIu32teWqTcwC?=
 =?us-ascii?Q?E6qzurPW11nrBnbXSNFn9FQNDhNf3hlvbO/319nUoykkQaT+YJdPtz8kXYDS?=
 =?us-ascii?Q?7K6g1HKB01+O1+UpQM262XYEP6V4aLgJ2/xwL7ctyenEtL0cpcLU+EABPb3J?=
 =?us-ascii?Q?DrCYrYiaxEntTCKWgVbRD2XKoTetdq001bKjkirZDH1RhSylOidJMfbKcAtI?=
 =?us-ascii?Q?PpF3Ufbp7ELQX9HA2vFzrIwHyEyrl5mfnqKAJnqRJdK0TWLNKNs151ZBgyi9?=
 =?us-ascii?Q?Yb3KwHLCFVDTaVu8uVWzYYglFn2OENMy5g6eAqER7auXEsqiw1JWUccJG22O?=
 =?us-ascii?Q?ojNxDrkwVG8QmGYsA2D/fxXL333sI4N/5kH4Efi4ZlfEe7Dl/CA36Zp0641I?=
 =?us-ascii?Q?r3LZFPY8MCOcmp7lVyf7QtMbykhkrxSuoAOgMLRatSQZr5dAQKitxtJBTJdE?=
 =?us-ascii?Q?Qi36QzGA0UWi8sEUfJ5QL6c6Vn1gifBbUYXW+s2Sq8Cffpw6ScGU7YmAByuj?=
 =?us-ascii?Q?qMay0aCChY5YxaoiKoNYzKp/tDMWZVCoxJ8V2QQ11xcsGrzVTjWG3avgl1Fq?=
 =?us-ascii?Q?Mb/FAaqsmLv/gk+zj+DKPiGWm1WU7JWAgvJeoeLOebg9l131LpyuHmt4Sjpm?=
 =?us-ascii?Q?q0pZo11U/Gc0X5l4PRkuolN2aCrnyubRU8b9/LZ5G+emiaRC/tf4LCse6142?=
 =?us-ascii?Q?epZNmOXKMjk33yPE5/YSeeoQS6G/VG8eBbOfib5xRm1/EF/D5bPMJL8ViAay?=
 =?us-ascii?Q?/luOrrO0qbQbp9yGtEv0JTByQXIdpQ1eoaUQCKKiKajm/lMM3jKzG9xbK7Of?=
 =?us-ascii?Q?ECDzpucHLJ0VGnbgOZjnruWUmclKZtZxZF6lt7uoC7TPUFkdXpHvKfyJDsYS?=
 =?us-ascii?Q?zmOSTenVsecwaOy+oKat3PnBXDhB2egXz67HTkm4VrpKjdZFrQop7hvul6Ea?=
 =?us-ascii?Q?+FIlobzTUa8PustyT91+/Z6J1AheIU2WYur8Zd2evqYEibeL4jBLLnEACq4U?=
 =?us-ascii?Q?3t3lrJx6Jhx+eQWHSJGB52ADmtfJPjsTkcxgoQ/7/PY/0k2sKVAcj0Zx/KgB?=
 =?us-ascii?Q?DIyM07N4cJyJW20OruZusYNNHR77XVT++Y4fIvJanr1oPERzaZ/NSXbA0Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 17:19:59.4928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61aaa9e4-0cc4-4685-a23f-08dde4c4c924
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7368
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

drivers/accel/amdxdna/aie2_pci.c:794:13: sparse: sparse: incorrect type in assignment (different address spaces)

Fixes: c8cea4371e5e ("accel/amdxdna: Add a function to walk hardware contexts")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508230855.0b9efFl6-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 16ac0cab4f44..7a3449541107 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -785,8 +785,9 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 
 static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
-	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
+	struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
 	struct amdxdna_drm_get_info *get_info_args = arg;
+	struct amdxdna_drm_query_hwctx __user *buf;
 
 	if (get_info_args->buffer_size < sizeof(*tmp))
 		return -EINVAL;
-- 
2.34.1

