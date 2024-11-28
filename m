Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD299DBC4D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 19:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B3510E262;
	Thu, 28 Nov 2024 18:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZRMTKwo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F44C10E6C7;
 Thu, 28 Nov 2024 18:54:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuITKM8ttdZxN/A3ECH1ffGCpUG/7U/QYnVqppc2GLLN7Bkak3yIj7Kl6wZfqZVW/6vx5NGs8yW5gFrTFoxmyuW5X+Pibd6qDLnb41CHroflv/a+QqLnWJmNuI8CTV3tqhKpk1d+pFCH8iu6TxCr41u4sKdK4XgSnWBrOR+GZTpvHUNPZgDzXznc2vluPI79WPLSNy9gn6Dth8LgFvoEyy8TlphpMGUf4LwEzUrAL1IyvQ1NDFlw5hQKtsGW7EQGAC7njdoRG2uRfOV6lG6zmoyUza4Pv2hvzqvXOnaDnydqeGObn5twu+chwPleH7m5JKehfP57bibvx9CdBe/LLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJf5QQ+eMk/yRKAI+8sS9Xhdhu8kc+3V8cHpSKPmBU4=;
 b=DQlCTeQxbXpJ0ns5/JWepz+lDs+i4oz+2w+ZBHjGQLQTvQKC93mHJEuqU4wmGFuK4+bgMw3ViW3cslszN4KDaiHX37zkhMVRjlZFWTIZ4NBfDgBRb0+TC53yDzvxZIjfQHPwGvhvaFFoEtf0fy/3Tmib9zwYeGKEYtYT+uTe3x9uiXogkOO1O3KI6BcgWeJAzDn9SWPzmkrjABNNTbt68Oyq2ZL5eUzgnEmiuGCOaVVg4PaGGXhU/BpkCg1qePMZ08VW2bBqUHkOWh1W6VmR+PcUXcT/LwXdLTR8kyEX/XeCx/LnIdPMvYmtZkacgpkoBOANMVm+whkKEKPBV5euEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJf5QQ+eMk/yRKAI+8sS9Xhdhu8kc+3V8cHpSKPmBU4=;
 b=ZRMTKwo9TNmGAVH7JUeFKhW9zmpWHCUzDBlmxGcFsFl4FKtX24PwjYZRC/zNWPq8oLNLucYKKDg0UhvdOTsSPrjirh1AcR1w2VcDdGxE/TeI4ru9T43h9PkIIX2PbdI6R//qOiDZIu/YtXrpisX39sCAWXzJixg+jIsqEzwVo50=
Received: from MN2PR02CA0028.namprd02.prod.outlook.com (2603:10b6:208:fc::41)
 by IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 18:54:27 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::5a) by MN2PR02CA0028.outlook.office365.com
 (2603:10b6:208:fc::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Thu,
 28 Nov 2024 18:54:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 18:54:27 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 12:54:26 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 3/5] Documentation/gpu: Clarify drm memory stats definition
Date: Thu, 28 Nov 2024 13:54:02 -0500
Message-ID: <20241128185404.2672-4-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128185404.2672-1-Yunxiang.Li@amd.com>
References: <20241128185404.2672-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: fdcd4762-1a4c-482b-ccdc-08dd0fde15cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|30052699003|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zDGnSK1wL4lzDy3oPlRAzdWdBoUeUVo6BWyqPt+6Eh7n49FqiRsm7pP3FDWO?=
 =?us-ascii?Q?/zFess4v6yzjphJ3j0oZvphrloYFpVawSr2sCvkgc89+P7ZDjWbDCrEVG6Zp?=
 =?us-ascii?Q?g4KjCz8pRiFMDk0zFQ9xbMERpdnbyXnKEjjY1KidduEG2eJ7QlkXpKFzLxXZ?=
 =?us-ascii?Q?i0bqj9+2+KvfBxwE7etKNfehkNYwaETOa7uNrYDnj7uc247tJNlED876GVNp?=
 =?us-ascii?Q?UsRRRrA5ErvLLVGlnEg454MSgwXnhKL+PiC0VJsS+KsZJbFXU11bJQ3fgcWP?=
 =?us-ascii?Q?M8ISrf9QzysPQfV4xcWPYO/ovkjdeTrR0Iqql2ATz0vTIi7WkaRwzS6viDaB?=
 =?us-ascii?Q?eo9ideKkx7HLo8LIcB79tQiJ6qcjp3LIRppXlp7L9mCUoLqVrqgdpM5gJOpT?=
 =?us-ascii?Q?KuHEJ0bafXX1iv/vvhreDAqpDb+pnYGB6MlSzXPMBTesFgzjJpXw0vXzVuwz?=
 =?us-ascii?Q?eQVccdTdFjFJoG/nfnax2WifSptQWa6nfo97L4jtzpwVIJWWJpyh5qpunDS8?=
 =?us-ascii?Q?v5wjW57quWzNK3KgGY+Su/SFRBxHR/9ehCFqOI9iKgj/aI36TsqaQQrH8ZlD?=
 =?us-ascii?Q?bJcoSq7CRMgzxYUbnMareFP4K6TXNm5ZiLg0WdSZazfzn2Q7WSOVElUmttfh?=
 =?us-ascii?Q?hELXZd1L+52pM4AtbhnG68ciF0SCmf2YAeGk9fm016DDq+irMJI1S4Mo8cSn?=
 =?us-ascii?Q?2rghZQWET0+eYyRHQrWRwGyAsU3JjNW3BmMf8LdpxvaleDWUFFrOVrH05dtg?=
 =?us-ascii?Q?uKtBhl14SI4bhyRZAiBtHVsSrtSeu3yt0ry00TcI6aUmzkbg4OzhWw6Mg8dz?=
 =?us-ascii?Q?UOibAXV9DZhNy9fOfgRMK4Q20wGf2EclTemML3xWP5FCnB5zfWtyBT/yuZWW?=
 =?us-ascii?Q?NE5j6nqdEHuw5+vobcXCPETmH6WQGfBaUlV5o75vjJuFoRrkiArJXokusN0k?=
 =?us-ascii?Q?/PPePGAuSbHeBzenF2G4MQ2135YMVHmcDSLWf6myINUBEfVYxPmNcjpdk6o6?=
 =?us-ascii?Q?PCu8dghfrO6sgC3V+LNNnCxrLjiRyS2KeDSOoPjhqcakl5eTsw0zWRK1Y/q/?=
 =?us-ascii?Q?uMu3BTwLdkpWec7AWM5AFy9uEetgnBz2e9YbZb/L7fiNXL8H3OOzdfaud1rG?=
 =?us-ascii?Q?yZyEvsvggESBBw1XAMM6UrptmIPOCAd8ohZMIHQaQ2Dtu+vJ81oEJXGBot3G?=
 =?us-ascii?Q?wckMNt556h3OxtVW7zFc3m4gwjcSjhvmyrX5/4FbR7WSzUd2bx14//ljXs05?=
 =?us-ascii?Q?JeDv8PEeKO/bFDzKYbkH8OnnktrDGfovlD10ftqB2VwjZ2UC7PCK/HU+GS25?=
 =?us-ascii?Q?WUdw8o0vPhs+lsJfn1H8HyHVdhdbVWX0nNiGPw1a774RtCu8NGHJUnL+27pY?=
 =?us-ascii?Q?3HTUVba0HqvNqMieoNxM7o1owBXa8OK1tJFZ78gwylwT4APygEmwSk2/8tYD?=
 =?us-ascii?Q?LFkHysUxCvEDG+yYvnydjiDnvdtEY+2O?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(30052699003)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 18:54:27.8687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcd4762-1a4c-482b-ccdc-08dd0fde15cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907
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
for drm-purgeable- explicitly. Remove the confusing requirement for
there to be only drm-memory- or only drm-resident-, and clarify that
drm-memory- is legacy, amdgpu only behavior. Re-order the paragraphs to
flow better as well.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
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

