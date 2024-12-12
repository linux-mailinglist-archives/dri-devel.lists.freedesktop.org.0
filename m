Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF99EEDF9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 16:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C70610EE16;
	Thu, 12 Dec 2024 15:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HxDqQMxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84BD10E8DF;
 Thu, 12 Dec 2024 15:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEhaw3XHooBfLS8Xm3xv4JdcMXb3T4WZnIxjEzEahh3Wi+vodgwrlRcCvGCIy5EMptBu2d1fMExhsL2XstJ3G/aU+hxsSmn/IKiLSD0Y9R394vx0w9h5rNbAh8y0ku07QfO/3+8/E5RAlonb9Q5F6nmyLmxQ6wTnRr3LDJQh2Ws4MvRR2kbyROSpQ5cX6n/dVCHhq0FoyvCBkMcLI0EYPzFa4UEgFLaDF6mGtSXbx/n9rjaj2ViyhGIBnaNSrOrcVMEoOmU9Vp+M3YIUo/sUV+dnZWTVremFZ68oAOKt95rJ1uQnqGUnqxcTFJh7x9Z5e+ynrO62Wuo3axDzBNxR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFe9ydPOVOG8BiHpreYF6KvWrtIpi4LmApbR1QLX8H4=;
 b=IJRHpBBJ/Gy3KyFKWiT9En3/Elg3KZ8NdurzsLJaQlczug5sSXyvgqvr9SrnEv6pwvYebu+XPvaizJE36VnieIjUcIX1kUTiFw5OT+MsVhRt/U3LIGOvYg5aS0peZma1Qhh7DChPtxDs0FAfg32XLAaHyuuOrcSC0Bx7Nai/fwHgtLgo1xB92jX0w+/R6sGLTE9vmul8nZxzm3yfJeYBPSm5qvQadD45jscyaG5DyXsSgtAr2JzVEvcFhm1Z78BFXCQzaHyQrk4HZ29ds1ORgv/ECmScAma11jGCxkPMtFbxz/cC/Qswf4dafMN/FxejUmF4Pz/l1sMXaTMQWhyGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFe9ydPOVOG8BiHpreYF6KvWrtIpi4LmApbR1QLX8H4=;
 b=HxDqQMxFGTkEuS79z3piVLTF4ahEzW+lFYyvmV5E6/fo01vMUXXGtpJhiwWwAZtYvbcVSNGCltRFaAyy+DC6cyHXknrnN+bsCZhXXoMAl5iiing0b1juVwlR2PefQni5OK5QBtcKVZAZX2X9iI1145UJXjQ1T0PSxRavLoblTno=
Received: from CH2PR10CA0007.namprd10.prod.outlook.com (2603:10b6:610:4c::17)
 by SA3PR12MB7807.namprd12.prod.outlook.com (2603:10b6:806:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 15:52:24 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::9f) by CH2PR10CA0007.outlook.office365.com
 (2603:10b6:610:4c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Thu,
 12 Dec 2024 15:52:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Thu, 12 Dec 2024 15:52:24 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 09:52:23 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v11 3/5] Documentation/gpu: Clarify drm memory stats definition
Date: Thu, 12 Dec 2024 10:52:04 -0500
Message-ID: <20241212155206.5030-4-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212155206.5030-1-Yunxiang.Li@amd.com>
References: <20241212155206.5030-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA3PR12MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 44de4d8d-938a-4968-a733-08dd1ac4f8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5O0ykD/ZXL42YDCsQT/e2X6ejRuY6G0dud48SJP3dLzDx4qJKjg6qvv7iR7N?=
 =?us-ascii?Q?RReGCUwP9KVUPV9I1ak5KQBAwE0HOdrcSC8XLYV8+htEpwQLHE0j2mhT1mNE?=
 =?us-ascii?Q?Y3oh60ljsb3szgRb9uN0TO0Oa/ULu2Q4xT80t6qRwkwIhzvYmQDRcYOkeCtC?=
 =?us-ascii?Q?FOTuIYFtyIOo0hZMfljFm/Ln0OaTECUBBajBznrUSiENYYzRHHRbL5HIjZz/?=
 =?us-ascii?Q?eRTB2AwqPb2HJqmQI37zw5dXc8E1kNuX2MVD6ojfal3Po1bGEH7d86dopLJd?=
 =?us-ascii?Q?4HENZ23K/Gwbu9fQt6SOvHvGLbwaeCRfHbBrGWfzhyahovE8YoOF/MjveZ0t?=
 =?us-ascii?Q?doZHPXhqRmwgRDxTaFS7ks9Fu1NYNi8q9v/6QixZFn8KCy7bNwnrbjU080hw?=
 =?us-ascii?Q?cNHqgVuZWNhDhQQ++BX5qXnHfxdFLvXF5iZUgRtXEgK6F6anazDtaL1onuWU?=
 =?us-ascii?Q?L5F7+UmHRnov3iHw883OSImrnLfUebkmVpcmsbk24OfHoJZeM4tXtZyo47mz?=
 =?us-ascii?Q?C4JYQpWR3VjO/M5ooIAvnibPaaubrZlr+mIePCgNRe1S5/u3NBENmWxKmpv9?=
 =?us-ascii?Q?tppLP/bzVB3f1m7ooOeczohjEgfMcSJnghFAsML9IOjuvQtiXgMaoB+Tk4fi?=
 =?us-ascii?Q?5/0BrH5VMvysb5uSzPQcnsfqq8QH2qsD65D0Ap8Vt56XCxBdocTGOf2b+MqK?=
 =?us-ascii?Q?5PnB9e/nIUPq9TfHB7UU3YPeR0Dx1pMiXvrjSrhpmC4r9ZWeXoLBcJ/b+mA7?=
 =?us-ascii?Q?pxHyhNz5UVMDz2Vw3iGNX4xR6QmNzKHL30lRuVqvFMkDG7NPoTRe25TrFNdQ?=
 =?us-ascii?Q?U1MCnyzbiGDS6hp3vG80ZKbY2nVzb0EIe1WzF4lvtCbyobUcK5DF+Bv5oXPZ?=
 =?us-ascii?Q?jySuci60W13JpIe6qrFh//j57uAGqlfEnFaeU148VjFN9nw884KyCDbnEBFr?=
 =?us-ascii?Q?3rmSsHKinFCHFpGTUNyZzIdbOvDpwP9ZIhOYoEj0SaiM4DmvwJ+X/5DPuSrO?=
 =?us-ascii?Q?BWUhOztzrE/sYw9ThjcNo49I81hwhGliPG/rzODwzYBQ2wWZDEOAQcpKbvju?=
 =?us-ascii?Q?pCzjiQkydcl8hZsUDjXxPCRmYPsWkpEKjf0Jc1TpPvBnzsx/vfcvbXPxVMtq?=
 =?us-ascii?Q?1wCfrxskSdx8RAkR+rOL4qmV3+XLOJbvEbwrqIu/Y536H3DE0atdP+UbZjEw?=
 =?us-ascii?Q?7oYrIrf3VHcJTNwDLVXckdXg3BU0RLeDK8lJgWzQZsAXG5ytjRJERnp/iojw?=
 =?us-ascii?Q?dEb6Qjowd4R8zSrv6AR60qSDkqG516GNGEhGZp3kEiGq1gdlSVf0KF9o2QRl?=
 =?us-ascii?Q?R/PepCocRnBEli+kezFxVmcX+LoevjRXiATr/cUUhqBC7Q6Id/4KGgIL5DyF?=
 =?us-ascii?Q?ODTjfCzWFQgWtqZmU7PuR1yFJoU3GHeUDy/Hvde9Y81jnAlCNZAPeHBK4TS7?=
 =?us-ascii?Q?dJbna1Sk/cQv2PXSvP4+QDWyKdl2225H?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:52:24.2951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44de4d8d-938a-4968-a733-08dd1ac4f8a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7807
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

CC: dri-devel@lists.freedesktop.org
---
 Documentation/gpu/drm-usage-stats.rst | 54 +++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index ff964c707754a..19a5323d0e682 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -140,57 +140,57 @@ both.
 Memory
 ^^^^^^
 
-- drm-memory-<region>: <uint> [KiB|MiB]
-
-Each possible memory type which can be used to store buffer objects by the
-GPU in question shall be given a stable and unique name to be returned as the
-string here.
+Each possible memory type which can be used to store buffer objects by the GPU
+in question shall be given a stable and unique name to be used as the "<region>"
+string.
 
 The region name "memory" is reserved to refer to normal system memory.
 
-Value shall reflect the amount of storage currently consumed by the buffer
+The value shall reflect the amount of storage currently consumed by the buffer
 objects belong to this client, in the respective memory region.
 
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
-This key is deprecated and is an alias for drm-resident-<region>. Only one of
-the two should be present in the output.
-
-- drm-shared-<region>: <uint> [KiB|MiB]
+- drm-total-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that are shared with another file (e.g., have more
-than a single handle).
+The total size of all requested buffers, including both shared and private
+memory. The backing store for the buffers does not need to be currently
+instantiated to count under this category. To avoid double-counting, if a buffer
+has multiple regions where it can be allocated to, the implementation should
+consistently select a single region for accounting purposes.
 
-- drm-total-<region>: <uint> [KiB|MiB]
+- drm-shared-<region>: <uint> [KiB|MiB]
 
-The total size of all created buffers including shared and private memory. The
-backing store for the buffers does not have to be currently instantiated to be
-counted under this category.
+The total size of buffers that are shared with another file (i.e., have more
+than one handle). The same requirement to avoid double-counting that applies to
+drm-total-<region> also applies here.
 
 - drm-resident-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that are resident (have their backing store present or
-instantiated) in the specified region.
+The total size of buffers that are resident (i.e., have their backing store
+present or instantiated) in the specified region.
+
+- drm-memory-<region>: <uint> [KiB|MiB]
 
-This is an alias for drm-memory-<region> and only one of the two should be
-present in the output.
+This key is deprecated and is only printed by amdgpu; it is an alias for
+drm-resident-<region>.
 
 - drm-purgeable-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that are purgeable.
+The total size of buffers that are resident and purgeable.
 
-For example drivers which implement a form of 'madvise' like functionality can
-here count buffers which have instantiated backing store, but have been marked
-with an equivalent of MADV_DONTNEED.
+For example, drivers that implement functionality similar to 'madvise' can count
+buffers that have instantiated backing stores but have been marked with an
+equivalent of MADV_DONTNEED.
 
 - drm-active-<region>: <uint> [KiB|MiB]
 
 The total size of buffers that are active on one or more engines.
 
-One practical example of this can be presence of unsignaled fences in an GEM
-buffer reservation object. Therefore the active category is a subset of
-resident.
+One practical example of this could be the presence of unsignaled fences in a
+GEM buffer reservation object. Therefore, the active category is a subset of the
+resident category.
 
 Implementation Details
 ======================
-- 
2.47.0

