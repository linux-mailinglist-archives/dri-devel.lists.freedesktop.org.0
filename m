Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BxdJBdBtd2mMgAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6488E71
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF110E422;
	Mon, 26 Jan 2026 13:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QtjRgsLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34DB10E41E;
 Mon, 26 Jan 2026 13:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poOIeAicnbS25geMHufxfrizHmyZd5XyuCVJq76jwv92gvAs3fzNsBq0lQ3fJkg9N7AvY8w8Loh53y8wX6O4AjlfHC1HlAUeLWN3w73h5ycKcEd0KG/AfQD+QUF18d2hcKGlnkBMM2Zk93NbmWQTEzrU2/MG4fU6NvRdewO212AJwkipSHCEIzHMWjuuUQkWBBb3FM4fALJ+VfwSJKvT7AnV7y4bFSQ3tPXWxzHxOp3WfuvHN/GMl6dHWWXoXWYGKv7xz/vTzvQ36VIV2L5ze2TBavRPufyb20iWzkESLQPkGzzF6WGurp9WxgRNjvHCZSknIDmi9rQ6t+qbJFHwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReMT6THVCDRL09KEFm9SSmhwfGGCO/fs8dnr+m2U9OE=;
 b=BxPHho4Dg0qnjvJAPqmFmVGyy2FYfwnZ1GdCh5d/InBrKtaZRPpOezOb4pZ9bEdyBJUFUtc9l62gJI1Jo6BTrvVoGMhechGquvf8pViI3J0RfBgaa/ttv1mJbZL4dOUtIchbuSyoNGogO3HtvnEyEqEXTlHnIzjCTHEQiiAD6xCapDhrRH7x+y7V2wj5/vuYNB5pmPnaz0CXt/ixxGawXtoFr4AY+CrpfMlSsHnEh+Y9CzpssORcq7Bhm+zTVpHXuAYXf24aZox4r+0pWC9r6oHYX2fvfG088hbh3gQFGwtKlgGpC8Fkr48C2TAPLSy8O4yHu1rGlhxyocLrnt+hxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReMT6THVCDRL09KEFm9SSmhwfGGCO/fs8dnr+m2U9OE=;
 b=QtjRgsLkr+eQEehVfcE20myEeRd5NrkJUi0Ws1lhH7vScWTK71vUg/RmIUzo5ITAU1gpqw84qIDuZGTzkbyPN5Ut+egzdehoXLIY15CiYUF+DbVnZQ/3NO5Kuvb09el6ffEjH6iuDwTwVayKSxK2SIiXpfXEvklHxcDzdyxAnEw=
Received: from BYAPR06CA0067.namprd06.prod.outlook.com (2603:10b6:a03:14b::44)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 13:36:06 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::27) by BYAPR06CA0067.outlook.office365.com
 (2603:10b6:a03:14b::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:36:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:36:05 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:36:03 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 02/11] drm/amdgpu: statically assign gart windows to ttm
 entities
Date: Mon, 26 Jan 2026 14:34:57 +0100
Message-ID: <20260126133518.2486-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|MN2PR12MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 9899a59f-7430-4916-0008-08de5cdfdb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHlwK0FVcm83dk8wQUllSGt6bTdsdDZyQWYvaDZHRklIZEkrZGVSVERmSzBP?=
 =?utf-8?B?L2FUYmtEMjRUcnBYU2h0ejlRRzkwR3lUbFlybFpBQXRDVGtZL2RuclNOcEJ5?=
 =?utf-8?B?cWx3WlhEQlZjNWJPeDRqbDMxK2RhU0h1S2FGZlN5RENzWVlqanhZNnlEVVdj?=
 =?utf-8?B?bkRudE4yTm5USjMwVk9SUGw1cW9NbWNra28xSFFVVm05VmIxUFpMQlVvQzVu?=
 =?utf-8?B?bW5MSjErRHFrT1BUZjRNRWc4cElLL1E4Z3VxSmllVExMOUgrbkRxckVyTUM0?=
 =?utf-8?B?UHJxdjlUQ2FCRFFYZlJPdnlocWtON2lLR1VUZUcyT3RuMUc4bXdOa3VYM2Rk?=
 =?utf-8?B?bU55WmhKaE9hcjJjdDZPSGxzNWZBbVJ0UThZSUluQTNPNDlBc1c0ZWlYMFFs?=
 =?utf-8?B?alBGbzBrTzFFMnI2VXdKdzZ0SVhqV1lwS05rVFgrMytSbVc2WVpRZHF5T2Mr?=
 =?utf-8?B?ZVRjVXRPOUpvekpja1FSZ3RYUndBcUUrQ1JQc1VzVTYxbzJiaGRBellNWnRI?=
 =?utf-8?B?RzFnRGpUSDhFUS96djFsT0R0N2tLVDdFR1lITW9HSlliWGE2LzZVQWlIcWQ5?=
 =?utf-8?B?aVdWSzlmdHl3SFI5VmEzcW8vU0F3ZEpMYSs5TDBsOWpFNGxkNEhxMU5vRExS?=
 =?utf-8?B?NjVpK0dHamJBUWRBL0dBSm1ZaUpvZTVDNXhSR2FqZ0gvbzNpZWpLanZwN0tm?=
 =?utf-8?B?alNWL1VpV25LbysvR1ltZ2I2VGNXWVlIZzhmQnpVVUNTUHNJWFppYmw1cDRN?=
 =?utf-8?B?akdrdysySUFsRGg2eEFvL2oxVk5XYmM3N0dvQkNWK3Nsdnp0VC85a3NCemc5?=
 =?utf-8?B?UkJ0T2l2dFZrOWpKa29JK2dyOUIvUWVzZC9ITW44eUxoOVBzZjd2UG1rbHFC?=
 =?utf-8?B?NzZsOXlDYk04aDVSQmtneUUrVlZ0N0ZjcWVCaUZVMFUyYXlHYk1YT1BnVEMx?=
 =?utf-8?B?cTNKQnJQcHdwbWR3eUZKZDJ4UklrMlNuUFR5YzdMTWp6SHlBV3FhVUpjRUUx?=
 =?utf-8?B?VlZZTmR5SHZzMXkyQVdLKytTNUNDam84ZnZpVHczVDgyTnRVRHZjZ1h2TG5B?=
 =?utf-8?B?cnNOcEtmSDZoSWY2RUp6ay9naGtVbEkzQVp1TGlEeE9ERmZQZjdpUWQ0Q1dC?=
 =?utf-8?B?U1ZsYzgxV2U2Q0dyaXdhMGY5eWdIcmRMN3FhTXJ6bjNmODQ2a1d4V2lzZGtK?=
 =?utf-8?B?ZnZkWWRZMzIwQmkwQVJMU1VBbHRjZ1Zjc3NjK0QyRUp6OFNCOUxTT2tYaE45?=
 =?utf-8?B?UDMzOGx5WloyMG95dXdpM2J5cWpvczBYdzFobEgwR3pZNnVuTmpyd2wreWkw?=
 =?utf-8?B?WXNETUNNQnk3eHhOK2ZWQU4rTVI0VXduZ0ZnMTJBTXBhWjVDSGVZU1graTYr?=
 =?utf-8?B?OWYxTTFqcStXVS92WDcyMmdSbUFxMnA2OGtHNHBYamM3UmZzWTJwRDRDZkd6?=
 =?utf-8?B?NWlCSkVWd0dyZXVpN1ZqUCs2NzlTRVBGdzd3T3g4NHhWdkhneGRyRFg4RExX?=
 =?utf-8?B?ZTh2VVU5WFRsOGhmK0FpWlFIeUxXbzIrQ2U3N2hGY1JFL3RLc2lhWnNLMllv?=
 =?utf-8?B?MGhGOXBWeGhPZVJIZ3lxemtJeGJFMGhxelY2aWE3amtYR24wUUFNKzJlVkhi?=
 =?utf-8?B?cGRjZ2RwSG5rdC9yOGJDL0FrMmNJYmNLc1lDYmVRU3dlcDE3T0VGTGhKYnMw?=
 =?utf-8?B?RFRLbjFqYUJjTE9sb05QT09ZbnBpU2FQY1hWTHpXeTBjM1JpcGN5S1FpcWo2?=
 =?utf-8?B?ZkYwNWZxcHdMSFlsM2ZuRzg2dEE2QnoyR0Q3M1BiT0diQVJ4bXVjaEpkZjdQ?=
 =?utf-8?B?QnFUakI3S0l6OUNPMUVMTDVBbVdBSFd0M25ZY3BoRTNWMlpkdFpLR0VDeUNt?=
 =?utf-8?B?MWZrVVlyVGpaMlM3bjE3L2hoazlpMXgxUWxjQzMvdHQ5RHI4Z0I2eUY2VVUv?=
 =?utf-8?B?YkhiU0R0WmVLR1lxcGhKOFdBSDErSmxlNEx0Qkg2ZUc5c0FZTm04T1M3WStz?=
 =?utf-8?B?UXJ1Y05HYjNQTEw2aHUxZ3RFZm9vY1pSZ25YUXM0UTNGanhKRVlLZ202ZGRI?=
 =?utf-8?B?WHkyblBPMVl5Mm9CdzUzcm45UEVmMHVvblMzQ0tEVXhyZ0g2QU55OE4zVEVv?=
 =?utf-8?B?K0IwTkdZM0JyeXptZWxJMkZRSE5JbkY0b2JGdEl0R0ZESWZ4ODcvMFdENmhP?=
 =?utf-8?B?bk5tbUpRbmVrKytDNmNhbzl1Yk1JbDg5R1lBOG9XREE5dTRXWlBEQUxlNDNl?=
 =?utf-8?B?WHFRZEE2WEI2OGdwbnE0TE40RXh3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:36:05.5072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9899a59f-7430-4916-0008-08de5cdfdb0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADF6488E71
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

