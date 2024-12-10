Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C579EB8E8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 19:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB4E10E955;
	Tue, 10 Dec 2024 18:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ls/lk0x1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE27B10E94C;
 Tue, 10 Dec 2024 18:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGXZvqxYMVxNDACCqiUrxeUKtZXa72AnyLjtfoYeTIb2F5mpsBt83ofCKCaENEYBfyua18xy/zGFNOd+G1Qk/2CDhBRCKqwENAVO2MfdaBpj+cRJjY2OzBrpWxnTwJvyc9CT4YYLN2NKKWI0a0FP0VfErmxhbrHdQcYr95n14YO2VbRbr46jvsq7MqZndbYDknRooFw1WCFkNutgNJNcY30bT1Txx/iEIuqdBTbESGIqAzw0kkx/WnY3jwnjdYZAvlH/koBI7bSkpYKdWVJe93jl0TyXj0QKS0iO7gJRsMx1+5zp8OoVAko/wI/goSVIaoqClEchiqZT7Rlta0ZibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ldky3Jp0v2BpI2Ruukws9uFdNGjxaiQlSt7HgPxOL44=;
 b=ko+uBThMgwNiDPnZrONFZ+cwVPoOvbNrxC63wPRmhvVxqE8/x8ZH+mDw963cuwJWnSSq+UsgU0hyjuV2u51N4MpV6kYie4N3jG1rN1XElvvS2TJxYfGg13plEyo+IyJuvqHyypPZo+qvZDhBebzXnftRAWHr9ofZkXtZNVs5G2EGXcjoSAlVIH0/iR6nqLcpNQLqFcKdMh3foTyQGyORQaxz76I2edIh6oHHtdP3ERtOSHkKKuWrQ16JovSbbn/40YYTAGQJluTp/v5Okuh7YbScnv1VguwNuSAoM0EJMWgNP0HdabVSdkJyssTfjC+e2C0z/4beXypQATyZVCdevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ldky3Jp0v2BpI2Ruukws9uFdNGjxaiQlSt7HgPxOL44=;
 b=Ls/lk0x1tLCXHdzR5WFVvqmrzyP84OZOIbJ7FIvEREiGlpPGiJHlRDk+jvT5YZlAd87iDTIJmCoPGVvq8/ATLJgFazQ0vURkCkFBjDrlrd/6U3g2ouKvPBMlZSIZOhz0XeKnS/PpZI/oNlD75cCO0pDmd62YSeQboNWna293IxM=
Received: from SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23)
 by DS0PR12MB8477.namprd12.prod.outlook.com (2603:10b6:8:15b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 18:00:09 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::b5) by SJ0PR05CA0048.outlook.office365.com
 (2603:10b6:a03:33f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.10 via Frontend Transport; Tue,
 10 Dec 2024 18:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 18:00:08 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 12:00:04 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 3/6] Documentation/gpu: Clarify drm memory stats definition
Date: Tue, 10 Dec 2024 12:59:36 -0500
Message-ID: <20241210175939.2498-4-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210175939.2498-1-Yunxiang.Li@amd.com>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS0PR12MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: eab60fa1-dedf-4062-6850-08dd19447c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LXIEOcjEx4U/JNGU6d7COxVNf3tcZwy7IUWHvVoWxhnqBwOSX2W/JdrbkkbZ?=
 =?us-ascii?Q?qzJIGhJGfJCzjuq73RfOHsTspCuPrJGOcqXLJzv9JTgWSutESabI2S65aw2/?=
 =?us-ascii?Q?iag9imwy2ZKp9x2cjWqJZ8WYmYOPmpYXTGNRAGCkIgDjCJmZ7+zh6u+ujyYx?=
 =?us-ascii?Q?3jo9utHv3RK9B/m0yItXRe5uhGijQ0HHQ5XSpz/0SxB1Sjc+Z2WDcrnYlhrE?=
 =?us-ascii?Q?CHQ2DpsS4N/dduOt8tzk0gN1JwFx9ofj5dOdXClShEzd8OjVN1+2ATeDmGOh?=
 =?us-ascii?Q?3hRS/qCaTms2/bkPL1al1O7APZ3ynywudMrbwOOygi1xfAJNXo4v4ZLnfVb/?=
 =?us-ascii?Q?uxeGgAWE64aRVy3jsLONqtlZuWsgWeOB1Rc7/Y0taSUjWekji8MeJBV6oRPJ?=
 =?us-ascii?Q?9RmOsQezmdiK5IqFyymMZ205Iz4g/HKQ8SlKlZR7vKM3Y16ZwpA9rzGSEUCn?=
 =?us-ascii?Q?u4Sb10v7JLwZhV0qDb2OEyMIvF21qVfVpyJYj6qvsi0eHXXHdlpI1gfeGYx/?=
 =?us-ascii?Q?SgwzwKUK+AcILkUCTgTVnyMMorOmO8xrg44RcoHp0aU1UNByu3e4LVwaiAqj?=
 =?us-ascii?Q?qJxXToDaJhuEMLbXSb2yTxgjsJJxRSty5oyXP6OeMTjmJY6lsSpR/bg9PCKE?=
 =?us-ascii?Q?9r6AefezoAF6KgTivVind8CUIWVZEYqLI+hHk1QtuMNQka6+mivVtmFMr5D0?=
 =?us-ascii?Q?t+kKHOAovdJyoL4yxS6ToFD9q7umtP0kRKiLIlD6U4ltfBQrVQLcl9RW8YVa?=
 =?us-ascii?Q?BtJKS6qbh1PV/0uxHfgZ4+c+oYOeHRWrrysTmynl1ec6+2ZFvRI8R6u7jzWQ?=
 =?us-ascii?Q?YjZ8CoLQKmbwwy1HAuV9b1/xGhvQTOj/NGbeDUPY83+kLhTTlQaUohRtNi3T?=
 =?us-ascii?Q?l8uYB3tEonwZPS0s/Wk2CiUOBzdxLXne8k/BeXCfhBF2ZchtomKrdP5/HT4E?=
 =?us-ascii?Q?Vzjf9doUJWUdorpTOhtbq7PtQrSUzoGNVhorMOpR/62xZw+h8qAI4S7QFlE7?=
 =?us-ascii?Q?kcCru/wTPBarYv+wOMt85aWUovNalvR6nouyDuQUv2UQFLkZOwbjsvQ53jNq?=
 =?us-ascii?Q?lqFJPzwLr1HC+bjVthvY80oH/E/l7gLS/NfPWEtvqb+Q3RGD8Ibn/LEoMhfu?=
 =?us-ascii?Q?FZKnShPj1Hs9F50DKXLZ5T+qnuuMOh7Oe9/xI5Qqd8MBTBv1aFKN1pvNbxoA?=
 =?us-ascii?Q?zDq8koiZ3ThTMRgXjd/0NMmLKcHbJWF52fvhMfXE+j5ffglpc5Zr+JsLRkZM?=
 =?us-ascii?Q?NpXUSM3ZY/FgmV/jN9U7XOZLr1xq1tLdSX0JTxpj2gWdmBZiEI3IR6Y5AZSZ?=
 =?us-ascii?Q?H8AI6Usrcawaei7wel7rFLSW4UlwJU4Q+eB7s0GAfEMFzZe98DU1vsqx465k?=
 =?us-ascii?Q?eAKmyc8wWx2SQMLHEaTY8INycxUSYCO0Rr3eMXxlFdenC8nCjVeqOnO3rLsg?=
 =?us-ascii?Q?ftSa1Z8P5PoMHCeXAh7u9tnc0DTxja8G?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 18:00:08.7054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eab60fa1-dedf-4062-6850-08dd19447c39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8477
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
2.34.1

