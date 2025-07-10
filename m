Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44058AFF9B3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 08:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B94110E875;
	Thu, 10 Jul 2025 06:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IGsBjwn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BD210E370;
 Thu, 10 Jul 2025 06:23:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDWpRxjGs9eWHaHT2sWvZ2k7Xr5F29u6iXm9b1cqMUy5dhi/P9Bx4YQJhWmZDWks2gM5YN88oppFV2tRp7xQd9IFLEUogX/ULPkZg752R+K3HW9dRZtUEdgafAYrUAsLinfM1wKVrKw5sn1TWwFvC/P9zgenKwpck5poKu7bslUBWYY3ttbkc5+75A8UcRkm0HwxeP7wMkyBGx3lgDiuVASMNp1blEq+xvtaYo82C0fgoPVG45YxN93GVeuVkZ/Fr+npmm7DZrj/TXBRtf6s0gpeSVh3NCfMO/eursChHH7ZnvnHHcjnTc+j0+ir47cZjwodm91gXqzsYLkNS4wOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTT8ARgfjZ96BXHNzxfBs2erck2fbvYj4k+1BworKok=;
 b=gBO08F+SAJrwgy4MqmUCjUnJBRdfNIqf7an4UHZYlQcjEIDV/vCSFTE3nFpveZsQ+24nfBOwxJC2u8hxLbhF4hQczbv+DuSCUZuSRtEu8E33kByy4UOcNeM30nCd1Jcy1P4xZSA/iV/OhnC7iu/k6rAxshhRlJeeDlBaxke0ElFSMdIRjC0UxLMYxMpg+pmJkm6hDOlCPziixq5dN41Q6CSdta7ItrdwGjcsdkPnoCC0x+Gph8pcLWtEwctY/Wh433PYw1SA6mQhZJwMYDS2yrGvPKthCewQWY/yXTxZRMOennNq3EeFOf4VUyQxZz27lqqu7PRuaGy99kHCkqnU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTT8ARgfjZ96BXHNzxfBs2erck2fbvYj4k+1BworKok=;
 b=IGsBjwn7OuXjCmovbEXmunM/4A2MzfeV2SIy1kczGsrQzy3+7o5GmqGGVx2GwuHiVBa/9Rbdwc9A7Kex8fE+U/Wx96OK9vTY5bx69+GCbObH2elUd5XlgiL/XkeDp1fEjHW1OX06Ch4qPpfCOc/hegfg1CTQCiIzVUi65+8tFZg=
Received: from DS7PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:2a::7) by
 IA1PR12MB6386.namprd12.prod.outlook.com (2603:10b6:208:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 06:23:45 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::e7) by DS7PR06CA0006.outlook.office365.com
 (2603:10b6:8:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Thu,
 10 Jul 2025 06:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:23:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:23:44 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 01:23:39 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v6 3/5] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
Date: Thu, 10 Jul 2025 14:23:11 +0800
Message-ID: <20250710062313.3226149-4-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250710062313.3226149-1-guoqing.zhang@amd.com>
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|IA1PR12MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 531c7048-ab70-403e-56f7-08ddbf7a52dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2c3BMtAdKXGlU2YTVuKDvba3jZ3EIz+1bxJgDHyZDjV0NBmJOUSNK+5soKVV?=
 =?us-ascii?Q?/YLMnoBEuartAa43aiD06/MFjLCKnPNq2HnYZZhhWlHyVn9U3CfzrD7wQqsp?=
 =?us-ascii?Q?SQHPKBHEdeqsVHOJy7R6Fi1Y0kG6Fv982AaY8G139yciD0B9/SEpDG4ckmcJ?=
 =?us-ascii?Q?eqNO9KFr6Hlm+EOdEuir9HDGic6NwM8DvRKRpKZvaCDSCWFENYXqBGk/W/CJ?=
 =?us-ascii?Q?Sl9EuTVUecZ/CarMbsjdwOzFTUxgdNfRf8RWZ4QmgMFUCcCX0J6D11B2DuUd?=
 =?us-ascii?Q?XmTI7WCpuGErUqJocJd2EvY1j+zcdldyA9rwh0NI4hd2DpG+a/xI7WPgOflS?=
 =?us-ascii?Q?+leBRjEk0rvCnirj/mKFHKHK/iIBA/TXT+LDes3Z9eO6crCDveXGmt12Fu6R?=
 =?us-ascii?Q?vmYg11z6D2SxH1QED9gOYCwXsRn81dF+yis2DkGjc2Oe3b3CN6706FJwBF8/?=
 =?us-ascii?Q?snseAHDluw7zcEOSk+M1Bcqpiwjhy6p2qgyo0UnpnoZPbVm1lavswqK+Ls7D?=
 =?us-ascii?Q?MBs3eGWfzvJa8H6DVeHPuCgFg1Hj0NY2Jf1Bgr0/DweEm0XPSKT6M14mdhtO?=
 =?us-ascii?Q?pJCef/0wXt1/MDQUo9FBF1q6eCLz8TMXsahqkolAE6CXrRjc724ysoa4C5TR?=
 =?us-ascii?Q?i+jkeRE3PlGMIIKG51rUWNnj/poMLoV9GS+RroE2AwwZMZvtrROY7QZv0C8e?=
 =?us-ascii?Q?fUEgBPeNhKCKmtqYTHfD2uQ5XfqTw3F+Ti89xSdkv/bx4hzT9z91F2E7oG+q?=
 =?us-ascii?Q?vMRbWwk9EKbk9GlU6JSlVCf0+g21GrO1iBBrW6tEM64qJPbsPeaHh01k0QBQ?=
 =?us-ascii?Q?kuZdfKm5xnlL6dDUxTj2aeaw/r6x78aeZwkdbeCHpGGQvzxjxlbZW6NKJGPk?=
 =?us-ascii?Q?tDk7+Z2VE7krK/U1uvMgV/Ccytmr1VO7g7Ym7GPygfDk6I3ashylUpmpMUxq?=
 =?us-ascii?Q?e1fjJgTZD48Vyb+YRQzanbBRf2CJ8w12byo68nijEQPVBoWiEGitfmxRBrmX?=
 =?us-ascii?Q?STgjt3MH/L2PsqvolRtVLB0wZ33diwulkzbTyGXxHUV3rfvJCeYBklXI2QLD?=
 =?us-ascii?Q?Yx2QAjRgoTiTzQlGkZdaBXDFgkJJSE+L+O4H+XiaaizHeVWtmQhfbjbaFkkc?=
 =?us-ascii?Q?i5668j58bYqJT03P21KefrS2wP0Q4dJcVriwggCLOOPyYE6NZpyZ8i/tnEj8?=
 =?us-ascii?Q?YLY2pQVBWU3bw+c55IkqKBrsoXUErtTcmUjhnODKIfI7460ulvUHBKkwPsQb?=
 =?us-ascii?Q?tR26/E7M/8AZEy9xObTAt4AkMTvl45sK1D5G270zeVIPPFcOdKWKuEJ/GNrG?=
 =?us-ascii?Q?bwcKl537BqSrjCj8+YbVO+VgmqMiEKhzUOA5rA0yyL9C7QgDa/HfvTFFdi1q?=
 =?us-ascii?Q?POKupK9M+MVWbGKH5Thm1YeMabT+jZJN7mGhXQutfi0d769av1sj6LDwqKUS?=
 =?us-ascii?Q?FM7SeOPeFgBTrbZdZgQDWZejVlzsDBqm0c7SeHSTRuj4k46AwpzVUJAAfxmd?=
 =?us-ascii?Q?bMlkyQ9LudeNttwv2OabAw62E503Up04ZzCE21Rso4sWeOd98t0etyzdgw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:23:45.2730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 531c7048-ab70-403e-56f7-08ddbf7a52dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6386
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

When hibernate with data center dGPUs, huge number of VRAM data will be
moved to shmem during dev_pm_ops.prepare(). These shmem pages take a lot
of system memory so that there's no enough free memory for creating the
hibernation image. This will cause hibernation fail and abort.

After dev_pm_ops.prepare(), call shrink_all_memory() to force move shmem
pages to swap disk and reclaim the pages, so that there's enough system
memory for hibernation image and less pages needed to copy to the image.

This patch can only flush and free about half shmem pages. It will be
better to flush and free more pages, even all of shmem pages, so that
there're less pages to be copied to the hibernation image and the overall
hibernation time can be reduced.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
 kernel/power/hibernate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 9216e3b91d3b..1f1f30cca573 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -381,6 +381,23 @@ static int create_image(int platform_mode)
 	return error;
 }
 
+static void shrink_shmem_memory(void)
+{
+	struct sysinfo info;
+	unsigned long nr_shmem_pages, nr_freed_pages;
+
+	si_meminfo(&info);
+	nr_shmem_pages = info.sharedram; /* current page count used for shmem */
+	/*
+	 * The intent is to reclaim all shmem pages. Though shrink_all_memory() can
+	 * only reclaim about half of them, it's enough for creating the hibernation
+	 * image.
+	 */
+	nr_freed_pages = shrink_all_memory(nr_shmem_pages);
+	pr_debug("requested to reclaim %lu shmem pages, actually freed %lu pages\n",
+			nr_shmem_pages, nr_freed_pages);
+}
+
 /**
  * hibernation_snapshot - Quiesce devices and create a hibernation image.
  * @platform_mode: If set, use platform driver to prepare for the transition.
@@ -422,6 +439,15 @@ int hibernation_snapshot(int platform_mode)
 		goto Thaw;
 	}
 
+	/*
+	 * Device drivers may move lots of data to shmem in dpm_prepare(). The shmem
+	 * pages will use lots of system memory, causing hibernation image creation
+	 * fail due to insufficient free memory.
+	 * This call is to force flush the shmem pages to swap disk and reclaim
+	 * the system memory so that image creation can succeed.
+	 */
+	shrink_shmem_memory();
+
 	console_suspend_all();
 
 	error = dpm_suspend(PMSG_FREEZE);
-- 
2.43.5

