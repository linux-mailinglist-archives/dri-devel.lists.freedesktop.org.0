Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FBnOJJYcmlxiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848CE6AAF3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9796410EA18;
	Thu, 22 Jan 2026 17:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jnK+D4Nc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010070.outbound.protection.outlook.com
 [40.93.198.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F93610EA25;
 Thu, 22 Jan 2026 17:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eosT7cycLEKZLr+HJp/rrxaHW22COsHqcgbZv7yMygvNhRH3uTYOKqMFnXdHIuvAmIFf3mBvCJOpCZanFqNiisG8E8K2rokeOgvX8Xy7HATvnGRoKjD8qIhnrbo1cHf3+J0Fei1txRnrjRhjUgKXPV+sclsHpaUlvKZeSZeK/g2rkSJ/MR7KOkAAAWAThu1tY8d7CyvkXJH1AjSoT5OEfQFIop6vrcqO2QAsCLqFlyJVyPQsOg43ZiEjftX2KE0HWPpvScgjdVP2YsqampsD9rcvT4tqTvilIiTpk2KPQ+Zvgryzf+lbb512wVRJ2uSaVFSQvcW1mzUOeeErDNPAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReMT6THVCDRL09KEFm9SSmhwfGGCO/fs8dnr+m2U9OE=;
 b=YUCVAe3fPe7oT6T+jQjz6N4wPbhYpk6KzVkbYTpCuEXu9cZATKHQ9oSdMYx0/1ha2145hlG5hLsDWD5cQ2bZsJUgeZQ2b+lnthARVi+yr9nzEYeVy6UT/HEDCsjkLzLnXzLDkPl+USBuBRYZ4/n1GAO1jpkaxV9D+kr+RolHaAHNQgTwPR4S7/3NvxeX6j2mi+q/H+5SOLv9zrx/SAZAggdyT1eKbcw5YGPQcQtLPfsuL225jTKWBd6ly7O8iaLBhnKjCdQ/gKpopLRbpN5aY3hDWnQlgLsFImIpggM+TLqgO2E8u4yAHxbIjgO245B2k+e5Jdb1WrxfRD/k+oSU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReMT6THVCDRL09KEFm9SSmhwfGGCO/fs8dnr+m2U9OE=;
 b=jnK+D4NciLnAvjjYJ+wUPRj6Vryywv2Why9zRpjutKtRuxoWWfz7sabD2KNcKAqKGk5OhIgVrmFKcLrTobq5XMVnMFrIrLtT4sREkvTJqoywIl36TIbRhsRmJMAFkhiqQ4hdXN7awH1v9N3Or53vI33MjPHrUOnB4BvCFT8GxS4=
Received: from SJ0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:a03:333::20)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 17:04:10 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::80) by SJ0PR03CA0105.outlook.office365.com
 (2603:10b6:a03:333::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 17:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:04:09 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:04:07 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 02/10] drm/amdgpu: statically assign gart windows to ttm
 entities
Date: Thu, 22 Jan 2026 18:01:59 +0100
Message-ID: <20260122170218.3077-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c9ff85-7a83-45c1-d8eb-08de59d8424c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzB1N0M2bDdrblBOOGMrSk50c0VuNTZNNjFuZGtpQ252UnJVQk5DYTJUbVkz?=
 =?utf-8?B?encyMURnK0RIa1czK3VzdWpIV2JNNUl1NldYWmxWNFhuWTFrT3BVa0JYdXVs?=
 =?utf-8?B?dDN1UjZxMHdvdDRkM1cxZyswMHp3RW1laXQvMm5IZjlHdkgrVkJoTEkyTnJv?=
 =?utf-8?B?Q1pOaHlzb3lSallOUnBNaDBZbDB3cU01aExlQm5iZ1ZETDNHRDY0eTIyZjBX?=
 =?utf-8?B?V21lYVVndkQrZm1mMWQ2T1ZjUkhzNnBuVXVBOVpNQnpBbTl5ZE8wSG8rYkhI?=
 =?utf-8?B?anFTcjdnWG1obW4wc1N0U3JzNUJzWVRVMkxhQitXVXMxK3RIYWxjeWhMVHdr?=
 =?utf-8?B?ZUxCVTZyV0N5N0lmT2M4Q25lMXgwVHA3RFQ0ZEo4bjI2RUVnTUo5elRPWXZT?=
 =?utf-8?B?N29ncmpleTNiY1RFR2M5WW9vUitkL3pyN3lGdFNJS3hGU2xvbEREcjdZQVN1?=
 =?utf-8?B?c2hsYU1SUlZMa3NyUGUyRkNBNUJHWnBnM2Zvdy9xV001WUlOK2FuMTFtTUd6?=
 =?utf-8?B?RlBPS1c5WTVoNWNyM3ZBWnM4SlR5SzB6MDRMWnlrRnBGVzlpY0lpZ2pkU0h6?=
 =?utf-8?B?TXA1K1Y4bjA2ci9rUjRsbVUzQW8xVGFjSmVLOEd1UmVqUEcvRFRRTWJ3UzN4?=
 =?utf-8?B?NFlGNGx0LytCL0g1VENwM2Q4anIyZ2NIK0xGRjBlcVVPeWdTcndBYmpuc3Vn?=
 =?utf-8?B?M1UzRFBQVUdEWTdCeGExY3cyaFJqWGs1VDlKTHZwWUhVYnhxeGYrWkl6WG5I?=
 =?utf-8?B?bzZHYXBOVTJqNzdLdmdYTFdwLzJOM0h2SVNlUXNIN0pXaStjSklDZGZnQmFE?=
 =?utf-8?B?OXVvZERTdi8wR3I5cFBaQXppdmE1NVF1QnlCOE51d1VFeEpFTW1EQml5LzVQ?=
 =?utf-8?B?MW9FdjRMckQrYVcxQ0JNTVp3Z1VQMlVUUFVWeHAzZW8yMlNWME40bklIZVFs?=
 =?utf-8?B?VWJlTzkrZkw1VHVtL241cEZRcVBQbmpiNWtsQkVxOVJFYmRyeGs2OEJ1WUtS?=
 =?utf-8?B?c3FwWEpTMVpKTU9LMzZTR2JLK0NPdFM2ZDJpUW82US96OTEyRU5tNkczc2hU?=
 =?utf-8?B?S3dMUHZVRThtU1Q4Lyt0RkliaEMxbkNGWGlzd1hwQU9wV2FwUFZlREhHOUhI?=
 =?utf-8?B?QnJKZzNjVm9GMVR6MkxWMWREeEsrbGc5ZURKMW0wbWNBTXgxeU12aU9TUUcv?=
 =?utf-8?B?N0w4WXpCLzlma2dTTlFXblpRRzM3Tmt1ODFHdmZ2bmVERmkvdFpFOEVMblhG?=
 =?utf-8?B?WW9oT0RRb2FGY092UjdWOUZGTjVDZHB2d2ZjMzFHMUFBcm1JYWpEQjNUcGFJ?=
 =?utf-8?B?b05tNFhlQjQ0Rk8xa3ZOOXd3NWFYNGZaSHBYNzRnYlh3WVc4T0FYZUtUN3FK?=
 =?utf-8?B?L2FtQnlrTmJrdUJlaWVTcGdiaFJYYVhwK0FlSzhJd21oMFp5SkZOMDJZWldl?=
 =?utf-8?B?UmF2c1FnUGJDdjlXeXI3OFhKTk1QVGR0azdDWktjZG9qM0JtRW5iTHp2aHVz?=
 =?utf-8?B?YTkrRVhLMzlWSm4yVEdjeU9IL09nU2hHRWpCZUZBS0kwVGxoVWdaTWdYREJK?=
 =?utf-8?B?K2lHK1FWMzNKVEF2cjVrc1V5R2p2aUlzSXlpdFIwQ044dkpzaXV3R2xIN0RL?=
 =?utf-8?B?c0R5OWJmcDRlemZCTTB6RHNTLy92ZCt2QkxWOXZRMzhqcStJelpFUEs5WlYw?=
 =?utf-8?B?VkY0cTYveGwwTUNTWGZlYlYzQllrL0xBVVU5amV2Z29aS3JleG5KQzJ3Rnpo?=
 =?utf-8?B?bW1KV1p2b0ZYK2hYTHRPVmpzYXlRRHN0bVBPbDdqTkp4V0JES1ZrNjZJUk4x?=
 =?utf-8?B?Y3ArNGNxWExaOU00S3VabHA0Q0VCbWtWSTdsajlpSUVxS2swRHd6bjF5cEVF?=
 =?utf-8?B?djFLSzhVVU9XL0psQmludEVYWitJdUNqV3RnRzh3UXR0NHNWOU9IWUl5eHZ2?=
 =?utf-8?B?TGs3ZHJma0Z4dVRRdkxWZzV5aXhhMVU3c0pDM2R5czVVREdObnk4V0tPZFdX?=
 =?utf-8?B?dGdLbDVMK0RSSjRkamFRZXp4SEJ1OFRqNFRpRXF1ekJGYUdVeEhMR2RDaEJh?=
 =?utf-8?B?SzF0VDVMSUV3T3NZSmVQbmJJTjgvKzB5VFc2WWMrWkZtNVo0V3pueFNIVll5?=
 =?utf-8?B?TDkxK0NzQ1M0K21lMW51dmhNS0N3V2V1NUVHTWI4RTBrMFEzQUgrQ2JYV3kz?=
 =?utf-8?B?dWE0bWgzd0FtTms5bGx0YnVQdU5neWZNbTIzVlE4eWRRWWoyK1JCZGZ3cGQ4?=
 =?utf-8?B?TzJ5VTdmcSs4TkRlYnl4aUF0V0FnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:04:09.2000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c9ff85-7a83-45c1-d8eb-08de59d8424c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 848CE6AAF3
X-Rspamd-Action: no action

If multiple entities share the same window we must make sure
that jobs using them are executed sequentially.

This commit gives separate windows to each entity, so jobs
from multiple entities could execute in parallel if needed.
(for now they all use the first sdma engine, so it makes no
difference yet).
The entity stores the gart window offsets to centralize the
"window id" to "window offset" in a single place.

default_entity doesn't get any windows reserved since there is
no use for them.

---
v3:
- renamed gart_window_lock -> lock (Christian)
- added amdgpu_ttm_buffer_entity_init (Christian)
- fixed gart_addr in svm_migrate_gart_map (Felix)
- renamed gart_window_idX -> gart_window_offs[]
- added amdgpu_compute_gart_address
v4:
- u32 -> u64
- added kerneldoc
v5:
- removed gtt_window_lock
- simplified gart window creation and use: entities using a
  single window now uses window #0 instead of #1
- fix dst_addr calculation in kfd_migrate.c
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 64 +++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 21 ++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 12 ++---
 4 files changed, 72 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index d9ff68a43178..fcde88e3a6b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -737,7 +737,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself at least for GART.
 	 */
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.default_entity.lock);
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
@@ -750,7 +750,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	fence = amdgpu_job_submit(job);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
@@ -758,7 +758,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	return;
 
 error_alloc:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6d7a5bf2d0c8..5850a013e65e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -228,9 +228,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
-	*addr = adev->gmc.gart_start;
-	*addr += (u64)window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
-		AMDGPU_GPU_PAGE_SIZE;
+	*addr = amdgpu_compute_gart_address(&adev->gmc, entity, window);
 	*addr += offset;
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
@@ -248,7 +246,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	src_addr += job->ibs[0].gpu_addr;
 
 	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
-	dst_addr += window * AMDGPU_GTT_MAX_TRANSFER_SIZE * 8;
+	dst_addr += (entity->gart_window_offs[window] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
@@ -313,7 +311,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
 	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (src_mm.remaining) {
 		uint64_t from, to, cur_size, tiling_flags;
 		uint32_t num_type, data_format, max_com, write_compress_disable;
@@ -368,7 +366,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		amdgpu_res_next(&dst_mm, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	*f = fence;
 	return r;
 }
@@ -1580,7 +1578,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	if (r)
 		goto out;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.default_entity.lock);
 	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
 	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
 		src_mm.start;
@@ -1592,7 +1590,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 				PAGE_SIZE, 0);
 
 	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
 		r = -ETIMEDOUT;
@@ -2014,6 +2012,27 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
 	adev->rmmio_remap.bo = NULL;
 }
 
+static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
+					 int starting_gart_window,
+					 u32 num_gart_windows)
+{
+	int i;
+
+	mutex_init(&entity->lock);
+
+	if (ARRAY_SIZE(entity->gart_window_offs) < num_gart_windows)
+		return starting_gart_window;
+
+	for (i = 0; i < num_gart_windows; i++) {
+		entity->gart_window_offs[i] =
+			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
+				AMDGPU_GPU_PAGE_SIZE;
+		starting_gart_window++;
+	}
+
+	return starting_gart_window;
+}
+
 /*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
@@ -2028,8 +2047,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	uint64_t gtt_size;
 	int r;
 
-	mutex_init(&adev->mman.gtt_window_lock);
-
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
@@ -2300,6 +2317,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	u32 used_windows;
 	uint64_t size;
 	int r;
 
@@ -2343,6 +2361,13 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
+
+		/* Statically assign GART windows to each entity. */
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity, 0, 0);
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
+							     used_windows, 2);
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
+							     used_windows, 1);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
 		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
@@ -2501,6 +2526,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2511,11 +2537,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	if (!fence)
 		return -EINVAL;
 
+	entity = &adev->mman.clear_entity;
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (cursor.remaining) {
 		struct dma_fence *next = NULL;
 		u64 size;
@@ -2528,13 +2555,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity,
-					  &bo->tbo, bo->tbo.resource, &cursor,
-					  1, false, &size, &addr);
+		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
+					  0, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
+		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
 					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
@@ -2546,7 +2572,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		amdgpu_res_next(&cursor, size);
 	}
 err:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 
 	return r;
 }
@@ -2571,7 +2597,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (dst.remaining) {
 		struct dma_fence *next;
 		uint64_t cur_size, to;
@@ -2580,7 +2606,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		cur_size = min(dst.size, 256ULL << 20);
 
 		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
-					  1, false, &cur_size, &to);
+					  0, false, &cur_size, &to);
 		if (r)
 			goto error;
 
@@ -2596,7 +2622,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		amdgpu_res_next(&dst, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	if (f)
 		*f = dma_fence_get(fence);
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 143201ecea3f..871388b86503 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -29,6 +29,7 @@
 #include <drm/ttm/ttm_placement.h>
 #include "amdgpu_vram_mgr.h"
 #include "amdgpu_hmm.h"
+#include "amdgpu_gmc.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
 #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
@@ -39,7 +40,7 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
+#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -54,6 +55,8 @@ struct amdgpu_gtt_mgr {
 
 struct amdgpu_ttm_buffer_entity {
 	struct drm_sched_entity base;
+	struct mutex		lock;
+	u64			gart_window_offs[2];
 };
 
 struct amdgpu_mman {
@@ -67,8 +70,7 @@ struct amdgpu_mman {
 	struct amdgpu_ring			*buffer_funcs_ring;
 	bool					buffer_funcs_enabled;
 
-	struct mutex				gtt_window_lock;
-
+	/* @default_entity: for workarounds, has no gart windows */
 	struct amdgpu_ttm_buffer_entity default_entity;
 	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
@@ -205,6 +207,19 @@ static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,
 }
 #endif
 
+/**
+ * amdgpu_compute_gart_address() - Returns GART address of an entity's window
+ * @gmc: The &struct amdgpu_gmc instance to use
+ * @entity: The &struct amdgpu_ttm_buffer_entity owning the GART window
+ * @index: The window to use (must be 0 or 1)
+ */
+static inline u64 amdgpu_compute_gart_address(struct amdgpu_gmc *gmc,
+					      struct amdgpu_ttm_buffer_entity *entity,
+					      int index)
+{
+	return gmc->gart_start + entity->gart_window_offs[index];
+}
+
 void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct amdgpu_hmm_range *range);
 int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
 			      uint64_t *user_addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 3df2bbd935e2..b3d304aab686 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -59,8 +59,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
 	void *cpu_addr;
 	int r;
 
-	/* use gart window 0 */
-	*gart_addr = adev->gmc.gart_start;
+	*gart_addr = amdgpu_compute_gart_address(&adev->gmc, entity, 0);
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
@@ -78,6 +77,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
 	src_addr += job->ibs[0].gpu_addr;
 
 	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
+	dst_addr += (entity->gart_window_offs[0] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
@@ -116,7 +116,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
  * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
  * the last sdma finish fence which is returned to check copy memory is done.
  *
- * Context: Process context, takes and releases gtt_window_lock
+ * Context: Process context
  *
  * Return:
  * 0 - OK, otherwise error code
@@ -136,9 +136,9 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	u64 size;
 	int r;
 
-	entity = &adev->mman.default_entity;
+	entity = &adev->mman.move_entity;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 
 	while (npages) {
 		size = min(GTT_MAX_PAGES, npages);
@@ -175,7 +175,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	}
 
 out_unlock:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 
 	return r;
 }
-- 
2.43.0

