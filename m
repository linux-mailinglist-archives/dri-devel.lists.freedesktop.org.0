Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOXeNHPNgWl5KAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CABD7981
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAA810E5EF;
	Tue,  3 Feb 2026 10:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H5G1b4xy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F90710E5F0;
 Tue,  3 Feb 2026 10:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR9CLlUK+I5UkansLL+Zxiokrw4iidQt0IOco2zM7eSUTDcAg5nC2K7VhnP4yUggdGUx5e+51yaBOmrG0V9XnPufJb8iQqSJXFxO+ZpkR5Fb+XqMTuDwjutjOQDwA3cu40DwNmcrSMjp8UrtCs7LO2TsIkg1t6ofFLAnWaztmqDX3HU8JnscWpPSmC9PfjoaWlVl96l1ukzFO9cX5aTH6d4Zsajmhr/z3hYBQa77VnEFBtPo1+9tERs8tgH2WmExp/iNCEitjVAUBChjsGfYSIKlovlK3TvsKlTMUlQuMWRn3DWaLnORxDX0j4Dnl6ialjHCUR2Qy1BFDuK5Y9G+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRjqMe4GG74XoulDeZpGJCdG9/MnqiJx0XB8TSk2ep8=;
 b=oX+mSe6qHKEeVnq3JN+3ATJou8AQWxRPNlt0rLOCWrDn2dcYvkE7NSjknzzr/PhPHrssoZ9RvbIylYPUW53V3hQp60isr1QB8yQlsoDfjc39Vx1givlr1v3k0Umf34kxNF3zDO5tA6PKEiqlQzX1loHu4+wmdTN+j9/yBDhcAW8pN3GxRP3lpXaDZKOr5xns1GPo8HPg1WuDKOjAmNC7FiXSjEtIRqgXtSgkLI1c++gNKdKjs7YewxJ9IplLUa13Iik3UVVcQoRL1neqdannwGCogNq2qmQ3NS5mX2nnvu+esu8uj+FoVyB7c6P1ge3eUa62wlz9FjAcRvwldSq6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRjqMe4GG74XoulDeZpGJCdG9/MnqiJx0XB8TSk2ep8=;
 b=H5G1b4xy77DtTR/Go+jUaiSzaAvZQXofP4RdPyC2IGt7SAWhSz8a2gYxW2gb33dgDhgtzO+3FYIs75M36v+m/0r6AwAPSDHdDpwLUUbrUhMe23kQ830IkBJK/LJWw35XoLZq9N1M0JDLv81oiCwwvmNbqAb/WQK+8/u8tLVttpk=
Received: from SJ0PR13CA0064.namprd13.prod.outlook.com (2603:10b6:a03:2c4::9)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:26:52 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::61) by SJ0PR13CA0064.outlook.office365.com
 (2603:10b6:a03:2c4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:26:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:26:51 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:26:48 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 06/12] drm/amdgpu: pass all the sdma scheds to amdgpu_mman
Date: Tue, 3 Feb 2026 11:22:13 +0100
Message-ID: <20260203102236.3456-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: 60df518a-1e2a-46c1-6e28-08de630ebf09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+VvqD2n3uH3X5RRLj2sVqXHYOqozpsPjSOLZuQ1sHg/S4SFxDM0I+wDIbQ/1?=
 =?us-ascii?Q?eIADbGVEhd6hPuv9F5UfTwuZBRx0zTcbJAlHuSwebc/x/YQK3zNsGudIaC7c?=
 =?us-ascii?Q?IvF4OHKS1Z9TShwylP58q0NULz7bh34tWc0tjYbjqEEaAAB0nCcQntzipSn6?=
 =?us-ascii?Q?GeDpe/xGNIOnBl8lqrQ7wtLK1nXOaUTi5z/7OSQfFeon98dornP8SMuzFxvo?=
 =?us-ascii?Q?wJ5C7ovUqkyKg18g/l//QfTcHVHkhz0xrY4bOHWPAe8fuO7KpxQTmOZjTgmZ?=
 =?us-ascii?Q?aMS4ddcUZy5JnK5Mlk1QfhiP+KF/vHHQf4C2m2F//UJ9Ki/DzcyvRjLGTFqn?=
 =?us-ascii?Q?8vH+XENGfypQofavJtUhySkxkl7C2MR3gM9Qb/Ax3nNvPOs5/Zx3GFGttM2j?=
 =?us-ascii?Q?iFmHLHHb2nyYmdhzlg1bx/7Sr80nFZXgBpoH3RJUz54GaRwXY6FxXk74b60Z?=
 =?us-ascii?Q?nH1ybYI2bHlnwvt3dEhJM8Nng1tktXZy0+nzSakQdO/Y5dBrYuP8dihU8+Eu?=
 =?us-ascii?Q?EB6D0ihgMmFsIiiOggCU6WSPexgpfSOuU9ZFK9szQ4pZT/EwHauBreiqWpLx?=
 =?us-ascii?Q?YGYkQBR6nkJNDTo1MrF4uG1KYW3nXGQFQRmbk6nerr0XxFLVli/pR1LLnWJJ?=
 =?us-ascii?Q?FgC8Z0Ra7TP3aq+6q0bUes1bS0JOCn6K1XJ9Ofh5vnrPIEr0DInW0W0HtV1e?=
 =?us-ascii?Q?agTUSRiG/NrwS/oqKdsPf84r7Ze+2hQf14irAcE4/2GrwnzfdppP6VoREMzq?=
 =?us-ascii?Q?cAePF15fSfPRtInqQiL7O7DZL/Zra7EybyEgyLI8f4hxGAEWFKp0Kypmwp6q?=
 =?us-ascii?Q?C2fU8RrPj3IRNToxZasAYMHqlh22vY0wNjnfWCUPjPK2m8xfdwA40SDGxUuq?=
 =?us-ascii?Q?R0G8u4vklTHtreMP4xG+x7OCza1+VdosfpTNLwAd1wQmUgVQmv7Rfw7p7NO6?=
 =?us-ascii?Q?VQl/rULSa8yBcLNfUp66NULl9UrbUIM0er0INxLssbChBZvbfezWOtCGGsu1?=
 =?us-ascii?Q?Q/by8+CucZhXIP4AIS6wCyyB16Jgzc/4YycZzUgQioEm26EjZmAc2w0OEiFx?=
 =?us-ascii?Q?u4p9DLCJeCSBNC3ytwtiyuQMVVtukj1/RmmMd+P2Vvebz/hcj8xn/OtoHmr4?=
 =?us-ascii?Q?U1NfsDPO4f8t6ixtaHd53BJ3vHuugE6THHswOfms7kr7S04FH6nOr+QsGD+f?=
 =?us-ascii?Q?XCxZtzKmqiZCc+iGXGrWoi6k54F2244m/+VK7+9W4nrhq+tsxb1W8f3KlgWA?=
 =?us-ascii?Q?Z6iopbtVpQ+m0JWe2gMP/aKyRJbKMSaOhaIG/lqHSsIvPtegoJxFpUTfJ4/j?=
 =?us-ascii?Q?EODNjrtyjsRhEf7RTviZmRP8+Tbsi4oB4JHmhJnrg9jp0Di1u8XUGJ1Q9BUW?=
 =?us-ascii?Q?bBMBsq5hywdPhL+x94AhjoQP3k1zXNgZLCnUipbxyiFMJf3Xr3YIcvK3XNTJ?=
 =?us-ascii?Q?TL4iuPmrAw2/AWWDxYr5fqBuZq411nPKcZsT84Wv6yF8JrlFqMYw85BM9Hzr?=
 =?us-ascii?Q?q4jkB5cl/7DFcD75C2yYlxxsegxJQbn/r2HQgKYBrYdMxsxfr1c2toX44ANM?=
 =?us-ascii?Q?XZLMmsdTe57Ok8sMgcRF4zywINThr3ThtVnraIpPmZO28A7l0f5IKQtTfekW?=
 =?us-ascii?Q?M/UQZtGQorC1QW54ApOlsqlEPlO/PfGuwKxSV6beLz4rwob6JIU0GNXdZqZl?=
 =?us-ascii?Q?n1V0WA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J+XDEd40Cv3oma2qTg5zcKXqj4+s/ebiMq9SWyrnwLLNo0h+bLJWLMaUaJ24l+Dz75HFeDWYic1E5cupWHvwYSDHpkZ3GM1AqaNU0VZuK7h08Tojunq50FHNSTv6OkeRyV9FqF4wpgyPKK0u1iBGbKVEX/EntNWlgmq0T+GCcJuaVYZwcPF93lxfiyxtgi9U1j04q0NBWdU4yvY+v6EzxtMTC3bHrqhSrbAhfzDsmQoa6hb4brXxJDG1IqUOeebxkYPJhpGtbmADLpTI0cjiiXLUqMskgA8Ea9hzAiYlZN50M2DfMVn54hSM/4hieNXXhkbGQgWQUNfmO0M/YdHLfqSlOXxUWLLA2G9psvWZkX8QY/yZV4wrep2KxTQv28GTReL8kKGB7L2S/NP8dAE/pBDq92M0MaHaE+HriNuRYXVLU0GYXTXZt4BIIdIIGMwC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:26:51.7599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60df518a-1e2a-46c1-6e28-08de630ebf09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 41CABD7981
X-Rspamd-Action: no action

This will allow the use of all of them for clear/fill buffer
operations.
Since drm_sched_entity_init requires a scheduler array, we
store schedulers rather than rings. For the few places that need
access to a ring, we can get it from the sched using container_of.

Since the code is the same for all sdma versions, add a new
helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
based on the number of sdma instances.

Note: the new sched array is identical to the amdgpu_vm_manager one.
These 2 could be merged.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 32 ++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c     |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c     |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c     |  6 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c   |  6 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c     |  5 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c     |  5 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c     |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c     |  3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c     |  3 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c        |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c   |  3 +-
 17 files changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index af4042387f3b..5275311eb09b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1538,6 +1538,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
 void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
 				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
+void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
+					 const struct amdgpu_buffer_funcs *buffer_funcs);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5e73b9d67325..b5c48ff3d67e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4390,7 +4390,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->num_rings = 0;
 	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
 	adev->mman.buffer_funcs = NULL;
-	adev->mman.buffer_funcs_ring = NULL;
+	adev->mman.num_buffer_funcs_scheds = 0;
 	adev->vm_manager.vm_pte_funcs = NULL;
 	adev->vm_manager.vm_pte_num_scheds = 0;
 	adev->gmc.gmc_funcs = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index e87cb8ccfcd9..f52c764d4c10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -707,12 +707,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
 void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 			      uint32_t vmhub, uint32_t flush_type)
 {
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 	struct dma_fence *fence;
 	struct amdgpu_job *job;
 	int r;
 
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
+
 	if (!hub->sdma_invalidation_workaround || vmid ||
 	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
 	    !ring->sched.ready) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 91fcf4f08181..6df3a4659172 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -168,7 +168,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
 {
 	struct amdgpu_ring *ring;
 
-	ring = adev->mman.buffer_funcs_ring;
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
@@ -2359,18 +2359,17 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		return;
 
 	if (enable) {
-		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
-		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {
+		if (!adev->mman.num_buffer_funcs_scheds ||
+		    !adev->mman.buffer_funcs_scheds[0]->ready) {
 			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
 			return;
 		}
 
 		num_clear_entities = 1;
 		num_move_entities = 1;
-		ring = adev->mman.buffer_funcs_ring;
-		sched = &ring->sched;
+		sched = adev->mman.buffer_funcs_scheds[0];
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
 						  &adev->mman.default_entity,
 						  DRM_SCHED_PRIORITY_KERNEL,
@@ -2507,7 +2506,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 	unsigned int i;
 	int r;
 
-	ring = adev->mman.buffer_funcs_ring;
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
 
 	if (!ring->sched.ready) {
 		dev_err(adev->dev,
@@ -2740,6 +2739,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
 }
 
+void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
+					 const struct amdgpu_buffer_funcs *buffer_funcs)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
+	struct drm_gpu_scheduler *sched;
+	int i;
+
+	adev->mman.buffer_funcs = buffer_funcs;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (adev->sdma.has_page_queue)
+			sched = &adev->sdma.instance[i].page.sched;
+		else
+			sched = &adev->sdma.instance[i].ring.sched;
+		adev->mman.buffer_funcs_scheds[i] = sched;
+	}
+
+	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
+		1 : adev->sdma.num_instances;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 3b1973611446..a6249252948b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -67,7 +67,8 @@ struct amdgpu_mman {
 
 	/* buffer handling */
 	const struct amdgpu_buffer_funcs	*buffer_funcs;
-	struct amdgpu_ring			*buffer_funcs_ring;
+	struct drm_gpu_scheduler		*buffer_funcs_scheds[AMDGPU_MAX_RINGS];
+	u32					num_buffer_funcs_scheds;
 	bool					buffer_funcs_enabled;
 
 	/* @default_entity: for workarounds, has no gart windows */
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 22780c09177d..26276dcfd458 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1340,8 +1340,7 @@ static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
 
 static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &cik_sdma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &cik_sdma_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version cik_sdma_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 0090ace49024..c6a059ca59e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1235,8 +1235,7 @@ static const struct amdgpu_buffer_funcs sdma_v2_4_buffer_funcs = {
 
 static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v2_4_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v2_4_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 2526d393162a..cb516a25210d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1677,8 +1677,7 @@ static const struct amdgpu_buffer_funcs sdma_v3_0_buffer_funcs = {
 
 static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v3_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v3_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index a35d9951e22a..f234ee54f39e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2615,11 +2615,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
 
 static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_0_buffer_funcs);
 }
 
 static void sdma_v4_0_get_ras_error_count(uint32_t value,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 7f77367848d4..cd7627b03066 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -2316,11 +2316,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
 
 static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_4_2_buffer_funcs);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index d72bd3adfccf..5da18f845014 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -2061,10 +2061,7 @@ static const struct amdgpu_buffer_funcs sdma_v5_0_buffer_funcs = {
 
 static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	if (adev->mman.buffer_funcs == NULL) {
-		adev->mman.buffer_funcs = &sdma_v5_0_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
-	}
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 5aa500fe554b..4133163fa24c 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -2072,10 +2072,7 @@ static const struct amdgpu_buffer_funcs sdma_v5_2_buffer_funcs = {
 
 static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	if (adev->mman.buffer_funcs == NULL) {
-		adev->mman.buffer_funcs = &sdma_v5_2_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
-	}
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_2_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 45d13ac09f9b..1b9c1e659095 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1904,8 +1904,7 @@ static const struct amdgpu_buffer_funcs sdma_v6_0_buffer_funcs = {
 
 static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v6_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v6_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index f938be0524cd..0896f0dc6030 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1845,8 +1845,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
 
 static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v7_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v7_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
index 3de76afe3e45..ac63dc26ed53 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
@@ -1755,8 +1755,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_1_buffer_funcs = {
 
 static void sdma_v7_1_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v7_1_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v7_1_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v7_1_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 3e58feb2d5e4..155067c20a0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -833,8 +833,7 @@ static const struct amdgpu_buffer_funcs si_dma_buffer_funcs = {
 
 static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &si_dma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &si_dma_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version si_dma_ip_block =
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7b089d22c367..f3e6ec68b167 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -129,13 +129,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			     struct dma_fence **mfence)
 {
 	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_ttm_buffer_entity *entity;
 	u64 gart_s, gart_d;
 	struct dma_fence *next;
 	u64 size;
 	int r;
 
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
 	entity = &adev->mman.move_entities[0];
 
 	mutex_lock(&entity->lock);
-- 
2.43.0

