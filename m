Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B39D10DDA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475BB10E03F;
	Mon, 12 Jan 2026 07:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zbUoqUfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C67310E02E;
 Mon, 12 Jan 2026 07:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyWULbhzyPKLHAXJf/ZzecjDAdvdXChqUY3QihCdgqSruEHMclRDXvYYxLzEoXpplyl9gIBZ1zSkuIim8OozF/wOKdqkx+wbMhastDZu3fC6d3RLBxhFhx/90WcrdIxcossUi52RdEl8VezXiuZWdA22VpLga9HVp2tZCLy0U77Ia0JD9rI7gUi0Y7MtGJYyJGJJgNTedYfLFxNAPJ1BzHOPN7QX+YxuuL/85FGsQ94jPKx962dxkf5DyJq1Hw0XsSkzoQR8UcFK74nk+Ts9Aru/1tJu5rpVxpu8qCvgHB25ff1pL7/ycsIOgCHji49vuUhaa2yhwFTVc1yabjHfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0qG7T8a1XQRghwpukTou1c5O9quQXpV3Pqjw0tpZ4A=;
 b=dkjZscPl7dObxwvrMRM5Phc/REByWH2uJXOb9I/J2m0TL0ib0EGalp4crxs2aYMS7HU/xBHqpbXB+ooX3Hn9hIfABPXpvs7I9nh9dYB3bLswUmiKenYez+tsvJRhJZCyWC4aBEtMhYj4GXry6TuzT5lIrrb859uF61cJu9z0Ex0A+NzhBGRXH8Ce6RUyrHfLZE/HxtYIk8wq3SJc15+4r3fR1BrWJKKZYdgJ7qdg3kaRVh8MXaUYtUHVchMT3Ra9ec6KATncaE40CP9Cepb8SxaWcnJ6x69g4z/lnjlAtztr5QP5jMPTDbKhVfluSomrlOKJKO6siqoGBJzyOW1d2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0qG7T8a1XQRghwpukTou1c5O9quQXpV3Pqjw0tpZ4A=;
 b=zbUoqUfxDmPqyXNqavytBOz0tD9ZqUDAczIrNBRWe+tNkD/XVMlAWi+0KTpFiE3kmfl/9LwfeCNQhzD3UuDDF07F7KCjFUYx4s330L1jP7DNQ/RBbbYsQyefxj120nVFpWYQMIpP/VQYw3VrwWinlbhUB5mrTcWU+sYYuEMaYus=
Received: from PH8P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::18)
 by CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 07:28:26 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:345:cafe::a2) by PH8P220CA0014.outlook.office365.com
 (2603:10b6:510:345::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 12 Jan 2026 07:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Mon, 12 Jan 2026 07:28:26 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 01:28:22 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] MAINTAINERS: drm: add maintainers for DRM buddy allocator
Date: Mon, 12 Jan 2026 12:54:47 +0530
Message-ID: <20260112072447.299685-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CY1PR12MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: e960c829-96a9-4767-aea2-08de51ac2cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+p4wq72EJ4eBHlHVj03xpRj7m/ispZ9wgHOd+o5BqDk7crQ2Yn7sedkwmRkY?=
 =?us-ascii?Q?wjfMGgW1I8MmGZDtm9LJ6oQKOYmhjFnASxkRiQPlLY8X3DKarPhruyXIyJGc?=
 =?us-ascii?Q?eWOy7COG0xVNegsRmR8J1WolXy158kXWXTtqYVHoVDAinn2nEToFOg9UVk5l?=
 =?us-ascii?Q?/6mZIPpzZ6YOPBsrTlvBPO/OVaSJqsiR4RXKgRgn2ZGCL/Yy8Dygp+j8rPMf?=
 =?us-ascii?Q?k2zF5kOZS5bkkCdLg+YHA6nkQ0S0vrymAVkv0+Qe11ZtCuQkRcOqFTVJw1/2?=
 =?us-ascii?Q?GQ43CokaFVXnyYe2nBTMSuJEIWuHYxZDsgU4Rbe4xvEGVen5vBE8r6sBNgZc?=
 =?us-ascii?Q?KdubbI+fvyAO/YOHd9Ut+1Jt4Oap/8VkfCJT5V56TiyPkf5jmdH6dGh5qUik?=
 =?us-ascii?Q?Af45fY6AURpjHkpV0A9uhFUxFqkRCfqouXXmKcfUPjop1HjhRQWyXutfoIX6?=
 =?us-ascii?Q?b89BdktekE/VB9loLMwN9RBfSfsY3ccZH37BCvOpSr0HIBeg5dfyvA7XlOwr?=
 =?us-ascii?Q?9zGtrr/GoCx9326CoFv5o7HWq0d4GzSeDaEcNkDGf3ZB4jty5TdPp+lh6t0B?=
 =?us-ascii?Q?1BCk0i99t4tSCKZRukxjC+7H3iBaFL9PpCTOyvA37BPnzvpm/lg6TSIEr4oS?=
 =?us-ascii?Q?+q4iM1cG3jQGmpqPJ4eyOKz/O9v2yrlxmNcVLjT3Ir5CG8p6FTG1ohQudRJm?=
 =?us-ascii?Q?+SPTOduiq2tQNkWBJufU7X7mTMHPIABuIliuggR4JPoFCxvnJtUGwgTs25v2?=
 =?us-ascii?Q?ghnTnuQfSLOiab6tbcl5urCUK2voK6MQnG9dv5CD+oqt4rFV6UNYPpAk7gAz?=
 =?us-ascii?Q?juUhMGQSM6NZNYKXgrgsRrqUj/TrFaP7ksBjk9kOUQ79pH5IGa/0Qhfz+rnA?=
 =?us-ascii?Q?du/Zv0tJO/ZWSShFVC8bvnNEPOdpPSLC2/tl1RB5zNi5RI7ID8gpOMmJV9Ly?=
 =?us-ascii?Q?q7qEjjDCipCLsZXxZmIz5NTKRn3qvRviIK4Sr5UKvCfNeVMcaQqI5a2nhsm6?=
 =?us-ascii?Q?8SQDoRL5+IiPfbl1IcVpef0Fv1Q4Pe3fWnRWjqVmA17vOEUiR9+Yi8PeETki?=
 =?us-ascii?Q?FVN6oXTRBjTJ1LPLLbglQvlbOo9QBbZmoqG90kTMhHyGnvMV6SsuHSLNzWWr?=
 =?us-ascii?Q?2JDRa7miGscW4nfM3YdkJuQWP8EXCxr5w9ZZQpGllXNfFvjfxtnmU6nqVbEE?=
 =?us-ascii?Q?ajea/HHjuMTubsWoxY/CW7NcNtGBj+DZv36Oye7sbfDdJ61y3/6SoTdiECEJ?=
 =?us-ascii?Q?PmGKzJSt50dhhtl3SDKvyNUrJIL/CK7LbdEfiyFY5ld2hYKZ3XFqZ8EwGn87?=
 =?us-ascii?Q?dUQ7ZgKPATT4d5WVURd1T0h5TYwtHNUkUvWr6dYZYNwWwnY8YpCvsXVQkFXG?=
 =?us-ascii?Q?wvSEbKeclAhp2LLGMeTf4vXM07F+06OTvl+dKnsc7UoI0n+x2uB5gvMJhUC/?=
 =?us-ascii?Q?LdejsE8VJEhFaVGIs5wUKFUm3toetd8fBvKGOyjDuU0kT3e3dAotJ7O/9nKQ?=
 =?us-ascii?Q?5ha+PGOPP5F9Hgd31/hteqQod5dWzbTGhf86?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 07:28:26.0475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e960c829-96a9-4767-aea2-08de51ac2cd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9558
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

The DRM buddy allocator is a shared DRM memory management
component used by multiple DRM drivers.

Matthew Auld and Arun Pravin have been actively involved in
maintaining this code, including patch review and functional
changes.

Add a dedicated MAINTAINERS entry to reflect the current
maintainership.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6169bd4d7bac..3cd69f6905ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8780,6 +8780,16 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
+DRM BUDDY ALLOCATOR
+M:	Matthew Auld <matthew.auld@intel.com>
+M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
+R:	Christian Koenig <christian.koenig@amd.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_buddy.c
+F:	include/drm/drm_buddy.h
+
 DRM AUTOMATED TESTING
 M:	Helen Koike <helen.fornazier@gmail.com>
 M:	Vignesh Raman <vignesh.raman@collabora.com>
-- 
2.34.1

