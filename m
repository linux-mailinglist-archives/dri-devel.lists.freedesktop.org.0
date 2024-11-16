Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9299CFCB4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 05:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0435A10E3D6;
	Sat, 16 Nov 2024 04:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XS/x5NpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F3310E185;
 Sat, 16 Nov 2024 04:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOSa5ddmoiiPS3E4Qh3tENQQ6tGgWOvv2SEoY3CpvWlMkEth9olsTtPtTq2tY//t91/24YoctHlXWW6bqMrCbOvOW7xnNmRn8QzE9HLWbic+DDskfSeZK0U8KiO57yAfPNGI7aqelpkVQeIw8lDEqUmWpfP/f/fbV1swtWOMnQqxSjYT/hQNlu3dAC8P4LPfEIexflDJS4gUQpBjqVvA+Yj9bSXGVKGmLqr+YxP287KapD1QLlLfrnxGFusUsyRd8jcpeSrczk1VlZbRK0QTgduK5bpll79rM3katxfrt5GwaPlRlJKyVvNauE5GPuRDkGuFbIqWK1/WHv/ugeRsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szIvitrg0KqNNVTfHED1HC5Qdto6FEbXoYvgdi0YaTc=;
 b=GM3eOKn/djvD+kdAI1D/GKi0GnQmo9OmCljjjf7SpO8YqcfJiHkpX9AWyn1hcZBo8BgzbBBmIvSoAf2M6dEYmDJGsesS1bywNLBEPjPuJyKvIjb8w0Vw39/DD2kHvs3zZuWhYp0uOQNGsarhsUXO4gsKHM7bbzWZ/JP4u9TOrBEBK/EBtRbUm7QcB642krZrC7g7VaRZNBpUztKG04VmhKkXC6HJLABI+f69rA0aVXqj7OwkDebMWJZnE5p0ARdelmzbJ63uW3jj5na/aP0y3nxixr5duQuHz1IK+qhRREHuCh9872x1IgtkIWLzopOTg/0oZVLYx6rEnj6BtBUJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szIvitrg0KqNNVTfHED1HC5Qdto6FEbXoYvgdi0YaTc=;
 b=XS/x5NpKuCZ0Jb07iPMeqDKwrlBIJOub6U3SGEhIYt13TD4BwYv+p8ssM2LScKSAt9+XIS6rBsxf2RW2ClfqFbQkopQ73O8Vv8TniqCYAH90OtGVeuW7oBkCfW3ujkPpdpHPqJUiRmJ14TMccmvsHbFX4lYqtuz5DPrwB0sgz1Y=
Received: from CH0PR03CA0322.namprd03.prod.outlook.com (2603:10b6:610:118::27)
 by BL3PR12MB6403.namprd12.prod.outlook.com (2603:10b6:208:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Sat, 16 Nov
 2024 04:45:15 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::d7) by CH0PR03CA0322.outlook.office365.com
 (2603:10b6:610:118::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Sat, 16 Nov 2024 04:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Sat, 16 Nov 2024 04:45:14 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 22:45:12 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 3/5] Documentation/gpu: Clarify drm memory stats definition
Date: Fri, 15 Nov 2024 23:44:50 -0500
Message-ID: <20241116044452.5925-4-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241116044452.5925-1-Yunxiang.Li@amd.com>
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|BL3PR12MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac375a9-2412-47c7-a5ea-08dd05f9767b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gzzc6Cb51CoeIhJn6kw+H4vtY39+apQB1hUXMV/s1On2L27onqUkyeq2mkmn?=
 =?us-ascii?Q?2/I5ZNO8wERG89c3Mb31bRQazq+TMNsdICSDKWVcm5mNxFlF+TBMgq3NdRF8?=
 =?us-ascii?Q?ICyNTzlPtbaiFfCE+oDhqILk6Dog2zOBgoqevcjqVKobPE6IpIZk98QQ35Xu?=
 =?us-ascii?Q?vR6PxWNjiGLXonm1qSDTxl8sDCpWdGgSS93h+yiKyWdrQklcGjplNywZxsSm?=
 =?us-ascii?Q?+9lIwweIrYze4+JXuunzTZ67DQIbRmT4bbzfHnw/7tcGUdpmVCIcqeDfVeK4?=
 =?us-ascii?Q?1DSLBWWhlnyqHyZmLv1EOQGiQXF96jzb3brF3MoJDFiMpD37jCTPObZqtrdI?=
 =?us-ascii?Q?ASq+JF+qhZS2lgzGtOB3wwKpMPbCOnIHHH2HHm9ra/iyZfr33V9OQSc5rcGv?=
 =?us-ascii?Q?KfhbG9KhogNFt6r/vjoLZ7JRDedSXfyrHw6CwsjyS+aq4SdCL7ePWibNDuVu?=
 =?us-ascii?Q?ssADosorT3NITPKdFI0lGt5hG5LWzHn8+JkyMMMuNlerOyxjKKv5hZCoy5nc?=
 =?us-ascii?Q?LkaRcGOGsQOQM0WYPMXAJ4ZAP2mM2L8pCl8WSSmZVG1hrxUw0Gx0713a8QUB?=
 =?us-ascii?Q?1/Yzo/rsMBtbRpLcqkD3CuhQV3CmaBx9Cy50HqZSZbZFMTItq0i61OymLNa9?=
 =?us-ascii?Q?W76FxJzn8vnNrkS8Pve5HA1piQ8anMBC0LSQVf80ewnooGtadC3QHThjabkH?=
 =?us-ascii?Q?PBmdFWcPHS1Kq2tgOgenGZD+7lh1vDRbvTj9RYn9PIjmqjTdbE84UiN6xSMf?=
 =?us-ascii?Q?aEmZFlp2yheQDYv+KXkIvSBarqzXCFukRJ1ZLtPMjL8TN3iILqA4CMBt1oPD?=
 =?us-ascii?Q?/yligu83kZSFcB9Ufmowis/qzq3WRuR+42/+NabVIxPCBmoJp9Tmuw90u/jg?=
 =?us-ascii?Q?SfBbolxWnSSeimLYmFCatO1Lk92YpFXCf92LvcuoowTTO6xpG3RQyfrA2Dr4?=
 =?us-ascii?Q?rWa12iaN0RHqxNzUM5dX/aiV31KDOKJ/EYhW7RCvjU3DU9dW3/Axow/2L9/g?=
 =?us-ascii?Q?LPqGg88z9bHpSk/i9UN9gw7pYnOoYi+BqS4ZjIGlIjTpUimD6Q98Ut8RL1x7?=
 =?us-ascii?Q?gk4FASja2eam+TgeMTfF/JTy54N0IkYcXNwCCZ9Jephb4xwcV+dTMZb0JKsu?=
 =?us-ascii?Q?TT5PTZGCS+tjAYHqTNV/SQNroC6oZhktpnSeh+pr45Mb85pOpafp9I3VyNIB?=
 =?us-ascii?Q?afetQYj76sxJn0usAssK2+PJWLI331i0E5qlvl8DQpq/UG95u2oAQGg1RMtX?=
 =?us-ascii?Q?jtiO9guJ1N0cKFAXccNIh81AJRN8CYOcWPUT8lPvnCneBG1XnpjVg4MdhlT2?=
 =?us-ascii?Q?i1TKonDe4emNj4QDwajp0hy2FkkNUrd47evi5QN2WQE3vuLC2Dm787ZgjmO8?=
 =?us-ascii?Q?ni/auxa/vHIKRMig6pFNISfO9rB+FD9piY9knLXazzbbYTcJzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2024 04:45:14.8507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac375a9-2412-47c7-a5ea-08dd05f9767b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6403
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

Define how to handle buffers with multiple possible placement so we
don't get incompatible implementations. Callout the resident requirement
for drm-purgeable- explicitly. Remove the requirement for there to be
only drm-memory- or only drm-resident-, it's not what's implemented and
having both is better for back-compat. Also re-order the paragraphs to
flow better.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
CC: dri-devel@lists.freedesktop.org
---
 Documentation/gpu/drm-usage-stats.rst | 36 ++++++++++++---------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index ff964c707754a..973663f91a292 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -140,13 +140,9 @@ both.
 Memory
 ^^^^^^
 
-- drm-memory-<region>: <uint> [KiB|MiB]
-
-Each possible memory type which can be used to store buffer objects by the
-GPU in question shall be given a stable and unique name to be returned as the
-string here.
-
-The region name "memory" is reserved to refer to normal system memory.
+Each possible memory type which can be used to store buffer objects by the GPU
+in question shall be given a stable and unique name to be used as the "<region>"
+string. The region name "memory" is reserved to refer to normal system memory.
 
 Value shall reflect the amount of storage currently consumed by the buffer
 objects belong to this client, in the respective memory region.
@@ -154,31 +150,27 @@ objects belong to this client, in the respective memory region.
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
-This key is deprecated and is an alias for drm-resident-<region>. Only one of
-the two should be present in the output.
+- drm-total-<region>: <uint> [KiB|MiB]
+
+The total size of all created buffers including shared and private memory. The
+backing store for the buffers does not have to be currently instantiated to
+count under this category. To avoid double counting, if a buffer falls under
+multiple regions, the implementation should pick only one of the regions, and do
+so in a consistent manner.
 
 - drm-shared-<region>: <uint> [KiB|MiB]
 
 The total size of buffers that are shared with another file (e.g., have more
-than a single handle).
-
-- drm-total-<region>: <uint> [KiB|MiB]
-
-The total size of all created buffers including shared and private memory. The
-backing store for the buffers does not have to be currently instantiated to be
-counted under this category.
+than a single handle). Same caveat as drm-total- applies.
 
 - drm-resident-<region>: <uint> [KiB|MiB]
 
 The total size of buffers that are resident (have their backing store present or
 instantiated) in the specified region.
 
-This is an alias for drm-memory-<region> and only one of the two should be
-present in the output.
-
 - drm-purgeable-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that are purgeable.
+The total size of buffers that are resident and purgeable.
 
 For example drivers which implement a form of 'madvise' like functionality can
 here count buffers which have instantiated backing store, but have been marked
@@ -192,6 +184,10 @@ One practical example of this can be presence of unsignaled fences in an GEM
 buffer reservation object. Therefore the active category is a subset of
 resident.
 
+- drm-memory-<region>: <uint> [KiB|MiB]
+
+This key is deprecated and is an alias for drm-resident-<region> if present.
+
 Implementation Details
 ======================
 
-- 
2.34.1

