Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F62C50F16
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1910E6B6;
	Wed, 12 Nov 2025 07:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l4fy3y7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011000.outbound.protection.outlook.com
 [40.93.194.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB80810E6B5;
 Wed, 12 Nov 2025 07:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qxn3DEsMRmFUJ8di12yiD1UHdwfF1mSDcgt2D1dGruM0JpO8pWf3GcSlQrBxAAhZD/wRsmdlHfVhltyiVOUbTihZfWFcZig1h8GmpTf+hbpzsshYOy26mCtNLi5/TBnyIKJytxk/AmG6S1aCWzmxCt8Cy/IOkUUE9OLsPqoo5wdqtlXaOv6ofUWRmVwvcBqrzBEeJEWuIC+tpg2PPZzM2F22NYxAfFn1tQx7NRVgyNnrNrZR4QhnKYzxM9oKE6y3CNUoZxlNoxR5DhMW4QBzedRhu5u5CaAXBUUHdNyEdldaBsSf/Ku0hmi9nrKmdtXAGYoQ6itsSPh8+Fyjh5sylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf2ELnFyESlPrHFJ8OdaJqsUv1coTV9WKEJXHjvGbmc=;
 b=T7YTyrq9Prv+8wuVbqymc7WYIr4IpzwieTXVNKEk+qtyd0xsl3eiEzYIl9UzYVRH8IUgN2GekrAUj7eOscnRpLjIUj1U7H1A2vYjMehEYi4mwsjchFYacu/2nOR+6rAOnx9iD8Ym9cPPA0Ua/4DH3BYsgvlA3+2lmgpVqLWIWUCNJdaDJih5x1Dfk3Ni/hgzbojfpAoSbg8zrMMJPRruO/3Fk2tbtOdkyI1i3agfl42dt/eu55ZoG4YDNzqlnUUtooxKURIs7+dCa9J9u9tVIFjQvvcZuFGArAYXNJ9fcDllNce8EpysR4ZuOPeBrHE60f921KN7I1pQDNJcLvEgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf2ELnFyESlPrHFJ8OdaJqsUv1coTV9WKEJXHjvGbmc=;
 b=l4fy3y7V0ujS4c/w1LsxzBr4zVPdnzz+GfO75hprocLtsk2KC+DX+r0+cbCpG4FE4m/jauXVBVwVbjOutpN6bq2W6NTT2Ts3BQ/3GvqkJ723eBPHxa42t7JvPCuTD95gMu7b4W+rLEMYW/GWfd4Sv2gfZn1mxgkFSTkn1n/0hXA=
Received: from CH2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:610:5b::23)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 07:30:16 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::95) by CH2PR07CA0049.outlook.office365.com
 (2603:10b6:610:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 07:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:30:16 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:30:01 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuang@amd.com>,
 Honglei Huang <Honglei1.Huang@amd.com>
Subject: [PATCH 3/5] drm/amdkfd: Add AMDKFD_IOC_SVM_RANGES ioctl command
Date: Wed, 12 Nov 2025 15:29:08 +0800
Message-ID: <20251112072910.3716944-4-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112072910.3716944-1-honglei1.huang@amd.com>
References: <20251112072910.3716944-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e18423d-4356-47b6-6e5e-08de21bd536e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G6PplAgkXJeRyMne9prz6gQflNPZawFGvLoTIRpQOWyOLKKpGit7cEoMMPDW?=
 =?us-ascii?Q?5N9/3TtVMkhdhvAjatCWdQzuVF6AksaaibaQZXwPKB7Ds0EtUKamBlExl3Jy?=
 =?us-ascii?Q?zUZmunB4jkZSMRa4zDB2fgIMdfnsWv4eHMyr88kc6seyoEO2xH5pQYaPGXhR?=
 =?us-ascii?Q?ldNxXF8b+wty58M9ndUMRCDlJxJeFF/WWhEM9GmshAilg4vW/qTFwRt0hfCL?=
 =?us-ascii?Q?ccAw1yJEN0MNRzg0pkvn3wU0DrQDWzprA4qC1s2weKLG1xQvQfsW3YQq/iiw?=
 =?us-ascii?Q?EN0uMuCh2598EMxOTcZyyE/pJ8NOpTRv8R/tcGsISMLdMFvTXAu0mSFQ7DQa?=
 =?us-ascii?Q?/d4bSjGH4Xw36ezw7ChLdTCWZMSoEEuvj9EC5oeZACFYiBTXDNn89cAwLgKr?=
 =?us-ascii?Q?yXtpfeTd9mySp8gbZuIuC1/z/m/lI4dmlr3VnLugbfwwXOF8/rTyY9ZwNdg4?=
 =?us-ascii?Q?2Q1S2XAlMYzbptybuFblFfOwoa8VEukrZLx/b5o5T00iYEFZyK1esJNBMN3U?=
 =?us-ascii?Q?eh5Zij08+VbqJV7yegG+phJCr7LRkIZA+OHJu+tMkfkobFpw9jlS9Ngdc3qT?=
 =?us-ascii?Q?GzS8VfJMcAi1Wz5PYe8uZzaXg8qPXwfg/aQPeQMi45lhBbuLMBShjLGV6hbq?=
 =?us-ascii?Q?K2fQlm+zAUrJj13oivsDvBLoyl+MqQYZwKm83uYNQvcQthQr6xHs50ceOJ9M?=
 =?us-ascii?Q?u7N8JkaI6VrGnZyWnw1m9UcB35Ye1iG9/QjNf4SaFE1+9+GfG1zkxfOq1NPQ?=
 =?us-ascii?Q?RzE+MaK4aUD49x6kU/Tizpgy2NZcp1TG8dfAlJ3bx+Gs8j+1fbU9bRaGZV6T?=
 =?us-ascii?Q?+RJSS+t0d90FWKpREX+AWJWiitjBHEETfe7SHKeT8+Hjz9TtVIsT9A5JyAtM?=
 =?us-ascii?Q?eAgJW6SUkP2ifuLj0ZPIO4g/YWVfXpOBHZjsWrQlbLSYTmBQjdt1XET+TNUa?=
 =?us-ascii?Q?Y5kVOcSX/3Bc5dFnuz1rbItbG5Viwn1HyUb6fj3XRnjr6KOVwZDx+XnckTW5?=
 =?us-ascii?Q?TMtMqvWCQtVenl9WyINQHFGOWlDU+LFfcWp9y5aRslY4+XECBFhUXmPBQSaQ?=
 =?us-ascii?Q?xwWrNS7gZe7XcKy2tjpl/cYfH2NzokAUG2PYCL9yXeVLa8FvJV1/2LYYY0Wr?=
 =?us-ascii?Q?3fs+q7X+dQiXrSbxoAWg+aTVyHYboXutc2oLzA14G1rs9QLr+vqIgAPjq13R?=
 =?us-ascii?Q?gQtYZHYSlqhIj3dNOqHns3GO9HbXyLhkOBtifeD6/4Rq/6BWcvezSzE0IAHI?=
 =?us-ascii?Q?HoD0J3d1L1ds3ypzmIGJE1lmCVVMRzQKh5PNx93X2ebzDLeWvsF3hvNKB9QG?=
 =?us-ascii?Q?ZHAxVqpV1zF9Us//wdEGjtcdyqVusnS7gglLyvkXK9GGY2QlqkTg4E3zqpul?=
 =?us-ascii?Q?nS1fg2vRd+cTT3d4BRYVGGDOlBYKFYX4mQQxteDX+50AiYCjMOR8BtzPlE0i?=
 =?us-ascii?Q?L/LphLRBeNEwKqXg63KFhLFv+YvsC/u4AXilKJz/oz/S4bbnapro5AvGlnJ+?=
 =?us-ascii?Q?VmV3yDFhwH1wdFo99gC+EWWC/HpoGUFSfltuz2K95+tINE5zoHofEKmMQf+y?=
 =?us-ascii?Q?1qB45VpwyS6Jd/2ango=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:30:16.4936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e18423d-4356-47b6-6e5e-08de21bd536e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667
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

From: Honglei Huang <Honglei1.Huang@amd.com>

Define a new ioctl command AMDKFD_IOC_SVM_RANGES (0x27) to support
batch registration of multiple SVM ranges. Update AMDKFD_COMMAND_END
from 0x27 to 0x28 accordingly.

This ioctl provides a more efficient interface for userspace to
register multiple non-contiguous memory ranges with the same set
of SVM attributes in a single system call, reducing context switching
overhead compared to multiple AMDKFD_IOC_SVM calls.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/linux/kfd_ioctl.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index d782bda1d2ca..c5f9595ef30d 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -663,7 +663,6 @@ enum kfd_mmio_remap {
 #define KFD_IOCTL_SVM_FLAG_GPU_ALWAYS_MAPPED   0x00000040
 /* Fine grained coherency between all devices using device-scope atomics */
 #define KFD_IOCTL_SVM_FLAG_EXT_COHERENT        0x00000080
-
 /**
  * kfd_ioctl_svm_op - SVM ioctl operations
  *
@@ -1622,7 +1621,10 @@ struct kfd_ioctl_dbg_trap_args {
 #define AMDKFD_IOC_DBG_TRAP			\
 		AMDKFD_IOWR(0x26, struct kfd_ioctl_dbg_trap_args)
 
+#define AMDKFD_IOC_SVM_RANGES		\
+		AMDKFD_IOWR(0x27, struct kfd_ioctl_svm_ranges_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x27
+#define AMDKFD_COMMAND_END		0x28
 
 #endif
-- 
2.34.1

