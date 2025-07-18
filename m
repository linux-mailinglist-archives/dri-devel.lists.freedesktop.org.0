Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53851B0A692
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E910E9D9;
	Fri, 18 Jul 2025 14:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HW447VkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042D10E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 14:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwe/BtBwKUdhAJgAMvFm3edw3AkjT7HBcKtOk8zn6WsCuvYj58UPNz+hdUgk2Cu/B8x0bIvn7JPRzkpWMSm1siBdQzU6tMTD4uk8hM06Ouk2zilPCH5Lk6FGNYmm8+TyC4aUGn4orKXXbBdzIgI2dG9gHNm9CeYfWP9uLK6+EXO8MLHDohYo2XV84lrjmqUYMSGwBbgAHeQNMK3zqUjb4/5hJl3sIMRM88bMwYdnB/N9NiITzJgrNejd95RY121mOGs4Im4M9xRkJKe1I7r/8tlwGzxB+5dIkxXwvgnM+cChS/16b/gtchuLoVvXiy8MwKHCGnZo3JH004rowxn6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAKHYk2/qIeYJdyVmxYTGmzLuz4aycl2z8WanCKUXkc=;
 b=TbDe+txGIRcE3aoom9MZZhKx0gM5fSMqAdYHKqfoN28TiSKcNar3pxPzw5Rrdw4BtTYc1eO0SHxngpS1nrl3Tr+jkjWfkVvajsWgFUJj1A24Xzho2x1yAp5qDfU6EFgFInD/+dud9KxVsYBuQMoQv+vmau4e9nWDgzPo4BvnyppyVjP0682ZqaZIHGJXTmdGmMJxfVESEELLhaJcfPGro24BmlZupmt8HAYurd2SsxnUHDzJbVsorzr4eJkMmCiFYQpE/NIvQ9OfPQvHoUaC3MiLnANzafRkfZXIjDVQU/XuOHX3vUuy+4hIlW3Mp9iSmZ6B3qTvto/udi3MODxTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAKHYk2/qIeYJdyVmxYTGmzLuz4aycl2z8WanCKUXkc=;
 b=HW447VkCNT7Dun7TAEH6FaYWPzXvybZhMbPAFe4o6ktlCeo14Fuu/qiqK9FgBs0iMRgVM0Dr+gdc7XoXBKQ29nvCPDGPc8fPbHILX6I/KGVnP1QT+Zih6AegaK9zjSljPI1TBFQwCMiKo9S7RBx2ILm9ocr8L0x8eqCQTr7oWAM=
Received: from CH0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:610:b1::23)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Fri, 18 Jul
 2025 14:48:41 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::ad) by CH0PR13CA0018.outlook.office365.com
 (2603:10b6:610:b1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Fri,
 18 Jul 2025 14:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 14:48:41 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 09:48:41 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH v8 3/3] drm/amdgpu: Allow kfd CRIU with no buffer objects
Date: Fri, 18 Jul 2025 10:48:23 -0400
Message-ID: <20250718144823.1157760-4-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718144823.1157760-1-David.Francis@amd.com>
References: <20250718144823.1157760-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffac103-71e1-4221-e3c3-08ddc60a3053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iy4Zv09/ULyDmGWJf85397Xi9lvg/HCRNNsdS8ceVSjsmyi4Gg2qn9gD53cF?=
 =?us-ascii?Q?3Q436kgjQs1t0n7GlJiWb7hJjXKsi1oyJCundshtFwN8XDykHGybd0CFc/w7?=
 =?us-ascii?Q?rH3YaysqWQzCGXFPNcwBjniAYObHPXmPeVgq8Ztg4grVgOUwBHvOY3uOMS0x?=
 =?us-ascii?Q?sVvyd03Ro8xuPNmwzNt7yi1b+rVyr3u17SFmrXSnuMz5AzZagj8Oq961Yz2h?=
 =?us-ascii?Q?+dwWRtY5qDO+uFnleEczdX6VYvyBqSMEvY1OiyPhzw+sLxfwAbDPPxX1iZJk?=
 =?us-ascii?Q?QmMvsFd9qOBGwpJ211VKEuXyPYs5Vu82Sa6CuF77sxjypVmMyK6FS66Y4fc3?=
 =?us-ascii?Q?ClPXth/fkqoMOtmymKqSWRtIDsGi4pf2I+8UewK2vCQ/QZCnKdkL2QsLsjfD?=
 =?us-ascii?Q?PSeYgDe5wa+ITTYU8UEMxgc22H4dFTkbiVi37x4uRK6JnjyiO1pPFm/GCiEu?=
 =?us-ascii?Q?UMgPT4lJZjD/ChIbnPUoCLzSVc99uY+XQ5mVV2T8zguNIhaSenou8iOFn8P5?=
 =?us-ascii?Q?RJ9CWaI75Pw62vG1QqMRKxilCBzn0xo5jOa9ig4jH5TTUSuJca1lQtTZyqjE?=
 =?us-ascii?Q?aZLKjvd1dGvfSNtbitnwMHMVUBs/cMkgZNFSvsDJa879Ju4j7O9I2zVGxZg0?=
 =?us-ascii?Q?Q32uvlowp/i0i8CnmRQj/Vefu0pTZ6atmFAG5bFS6UbjymFlHyoOVNRFhOhU?=
 =?us-ascii?Q?lKMkfhxDr9SVwgkqj9C3pA5Zhgr/N+1nz6rKGHokWgh0x4DC2Im9gnNhpAxX?=
 =?us-ascii?Q?tSzT6MM2Jy5lhL99+9CMGLQotLcgQxh7QPDOm5gpt6BpgXNxLwhfKx6jr02f?=
 =?us-ascii?Q?fkSFOxBWBYykNblwmr1s6ECoguZx4KOk0Ca23tCsJW+b2UAWfRyaFOG3rCCP?=
 =?us-ascii?Q?hl65qHuA+NMlmx2K6PqaJn+s/N/wo+Z6EST5/eU51FyO0RCvpVLDpIqqDzPr?=
 =?us-ascii?Q?N6ugvCHXZIRYdtA1nBxk7Ya2Fupc0+XhDXv7ExWnDEw9aF0l73M+6jdLtDgV?=
 =?us-ascii?Q?ne9hciGWwWcPOV7vjtZKde/ayLjFuffLxc+fc4iQ6COUYMi4pN1qeA/cOe9a?=
 =?us-ascii?Q?k075R80mSlzSUpUolinD1zR9js9n8p/EZjD9MScQYXx3NNhV01GcXJSD5fsa?=
 =?us-ascii?Q?RrnMiBl0zBaT5bjQ0QHf4gKf/nlH0C4c2LDl45FRw41pHztBdUtcaznLukOy?=
 =?us-ascii?Q?Jk4YF7MQqmdPdkikrzzr19XIGNay7i8ub6fHFMQ9TxsaDtgLO3VDDW7zXnuQ?=
 =?us-ascii?Q?gVRV/C/H6e9SpvyCV/jl0G/wux8ek7otAkRZfnAez8NcaGVxhJLHefuwQ1bi?=
 =?us-ascii?Q?NFnFTATCGrmPBX9GwhJlCxUTQwnCki3rbaBQbgVPwaHREtuxKmeuCckeT9/2?=
 =?us-ascii?Q?yq6cqFQp8tIvILQJcCaabgHZ5Lz5aB6sAAP43cIusuZQc9I/dK2FiKI/40ob?=
 =?us-ascii?Q?Pl8MOiTejQBagF0c9qoJW7+k5+CmetENT3EGuYZ/lXfji8SgUPmJURBTF16f?=
 =?us-ascii?Q?VQgEJPdBLb1HdQRWQnpVXkISk4u2EzM8Q9QX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 14:48:41.8697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffac103-71e1-4221-e3c3-08ddc60a3053
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024
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

The kfd CRIU checkpoint ioctl would return an error if trying
to checkpoint a process with no kfd buffer objects.

This is a normal case and should not be an error.

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 828a9ceef1e7..f7f34b710d3e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2566,8 +2566,8 @@ static int criu_restore(struct file *filep,
 	pr_debug("CRIU restore (num_devices:%u num_bos:%u num_objects:%u priv_data_size:%llu)\n",
 		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
 
-	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
-	    !args->num_devices || !args->num_bos)
+	if ((args->num_bos > 0 && !args->bos) || !args->devices || !args->priv_data ||
+	    !args->priv_data_size || !args->num_devices)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
-- 
2.34.1

