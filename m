Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHFWG+RYcmkpiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E026ABD1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371EC10EA25;
	Thu, 22 Jan 2026 17:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K8nuJPeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012037.outbound.protection.outlook.com
 [40.93.195.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EF010EA25;
 Thu, 22 Jan 2026 17:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIhBdf5CRMb9ebJda+lJG1euDpZ7flWm8ODud4G9KjkGKYz3CLFE9w59Flgq3u+5zU4nIKSKzQR1fz0kfGRmZ+Qb0Hk5gNuv0ifLc5dYOz32yLTi+UFJVkWJ2sKH1sfRiUyYD9lz1e60e2PGIfhFa6eTbtf3UWhF1o/3DVjGXm+gx/81G8m0m0dr183o4lKlJMOodqcby737qAfuD1xW6F+6f57XAFcS1seyEbTJuc/uwxXKUF/1OTwCk+kStnyFGnqGMPtXLiEZhMSzYeIr5W7l+ntaFuW+tzX+9ctx9O06IphZc6r6KL4Ax7YyRUPJPBmjRIlz+sFO+UXqpxcMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1nT16lXSFx5rzdhUQDsqftfqxLlpMM8d/d/HUxlY/s=;
 b=EOs9wySiZgYbByxgzeodr5hzQBu8ETvYbiFG0T4lBEbyb/vt239eXlFUpPmbL+rbgjcWP+GSph/SA4jtBvx7BBqWcZoQAMqKaA+Cipuj1bDQPPOkm5O5cWmMmmPywhwk2X58mO7AbAs5V3mUtfqPR7gVdjuVO+ZbM1Qr2KtVOWtQWIgqI62ZIItG0/5GyMKeq9ot7kni61f46QYA51g924N/tidK0OkEXSAGoU5xDYdSS2ZAx6v5F/0QXatkILTmY4cMwMHc5NjOPkOoyn5OlF/LMZfbCNCNISrtfNhFJpR1AMcqq4Kfjw4WbGbxs6lTeYSOT34b+i7XJ8sV0HGW/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1nT16lXSFx5rzdhUQDsqftfqxLlpMM8d/d/HUxlY/s=;
 b=K8nuJPeH+7WPg/YRpiGkO43XI3KjgCHZPxSEcpUM2spks1ZQG8HxIzcbfrQ50+ZXVDh3v9zwXsh9tyYsiAK+bLTA4DaoaatL/YkLClxcUIvJbB6O0XoE9YzNH/0UTV8rz2dsAUDgRR9KET3eZvveytDhwuk2tJCR9wzfQpbuB/A=
Received: from BY5PR17CA0011.namprd17.prod.outlook.com (2603:10b6:a03:1b8::24)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:05:25 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::45) by BY5PR17CA0011.outlook.office365.com
 (2603:10b6:a03:1b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:05:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:05:25 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:05:23 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 06/10] drm/amdgpu: check entity lock is held in
 amdgpu_ttm_job_submit
Date: Thu, 22 Jan 2026 18:02:03 +0100
Message-ID: <20260122170218.3077-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 813a0db9-65b2-4303-f81b-08de59d86fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2xKOXAwbjlnR2tURzdYL2F0VkpOKzdtbENub2dqeVpUOHUzTkdvSWJXV0Iv?=
 =?utf-8?B?UEszM3RZb2RFczV5SEpUWEF2ajN1T0VBa2wzMHluU0UvL2lST3dvbG1JOFEx?=
 =?utf-8?B?eVN5czNKT3EybkFaL1dFZG1meDZldW1aSjJWaExZNExSNFY0a1NyRmNENTBn?=
 =?utf-8?B?Zkp5M24xRDYzMTBKT1FPemEvalFSdzBUNUNoWUU0TkJZeDZTM2YxVXlZdFJN?=
 =?utf-8?B?SEJ1dXcxR3RFeCtNOTNONU5DeCtCWlZDakVCNENBc0I0WkhmNUt2c2s1SjdW?=
 =?utf-8?B?bzlvRWlOVWJFR1BGa1R0di82b0lYMlUzU085a2o5S05Cc2NUMmEyVk5rQzdF?=
 =?utf-8?B?OWVsM095L3I1eGIyQmJCN1ptTFdrOEdhNkpaVkVYZElDQ3lqUUxzRXdlWDg4?=
 =?utf-8?B?V2VWWkRXck96SldsMGxVL3N1Z2VjRDY5VUVVY1UxNW9oc0ZKTEZmUmY0WEVa?=
 =?utf-8?B?OEFaN2R6R0gvMEZqWVJnN0taaVRGa29FVEYxWTRuL1pKd3hxaVdOR2FNTUNE?=
 =?utf-8?B?bWxDSTlHTk1zSFNsZlVIVnhQWGNuTGFidVNzWHA5Rk1SeGxuSy81SHMwazRF?=
 =?utf-8?B?aXU4Tm1xSkFTVTViYkR3ODR3R1dyaEloM0p6WVdLYVpJbUdGZlZWdDJIYkpO?=
 =?utf-8?B?d3BIdDFEWkp3cWRmUUtuRG0wd0pidWFvZkF1aysrdVlUZ1NueWQya29EQlp3?=
 =?utf-8?B?RUI0b3VtZ2NlcGVkeEJXYkE5TTdyU3NOcFFrWXNRVkwzYjNya01LbmdBTHdJ?=
 =?utf-8?B?MmtkK1NuTXh6V0kvam5ubzd2b1VJcW14L0pNTU8raFZXaU9lcXJvbzdDWVdQ?=
 =?utf-8?B?OWF2QnVEcXVVdE5BSlVkQ0R3SlNsSFMwNmJoZll1YTYxNks0RG82L0RmWVFv?=
 =?utf-8?B?WE9xWUR5YjRqcE1vR082ZjFNMmhkVkpKMzZhcXlSc3lzblNZTGlDMWxxQnR6?=
 =?utf-8?B?MGJic1F0Tk9QeXRJZnNvZ3JZZm1KSnpyaE5XM1dhWUdRL0c5dUtGMHBYUWg1?=
 =?utf-8?B?MHVUK1FJcGs2aExrTE5lclhXV2o1ellUMVQrNmh4WFV1aUhJV3BhNGdsak96?=
 =?utf-8?B?Y1NqMlUzZEdCZzZsNkZMM05TWmdtZ21pbnB5ZGEyVWw2L1lieGUyZnBkaGo0?=
 =?utf-8?B?VVdIQWYyRlN6MWxGUUY5eE9BK2xsWmlVTXpzUG9pWU1makVRdDdBaVFlc3RR?=
 =?utf-8?B?MVE1N0pRYUp0OFJwcmUzTnEwbjlXeXdzdDN2Wm0zYUl3cThOUm9aLzhCc3lP?=
 =?utf-8?B?OEk5TXFzbFkwcXFkRGJNMkxHRzRXSVY4ZHNIZnUrT2VtYkgwMHdGbEsxdlJF?=
 =?utf-8?B?ZDhrRUU3di9oaUNZdFFvYlVha210T2R4YWhwdmNlMDNoeTBtLzBia0hlcUtV?=
 =?utf-8?B?eWdQMGlLUiszRUp5bmx6RWJZcDZuaWtNRXRLRVlBc1lNdFdVUmhMekNQc0NH?=
 =?utf-8?B?VFZpZ2NkQkt5ZVlQRmx4RUdyNm11SEh3UGswVjZtQWpYd29rN2tHcHpsdHJX?=
 =?utf-8?B?SGI2TzZ1cURZQ05sVGdHSyt4R0pFTnZxV3NIbWU0ZTNrYjZHcHN6ay9Jb3pZ?=
 =?utf-8?B?K0pBMXlDb2RsYmZ3ckZoaklmU2JhUHdnUmZnT2lqdEZxWVRhTnVjbmdmU29p?=
 =?utf-8?B?Wml1Y0M3aFQ3OGJ6K2JCSFBldTAvSHBWaWxjY1JXeVBJSCtsQTRva05xKzBm?=
 =?utf-8?B?c2JCY1NLUENzWUNobGs1YzRCTStFeXRZMHh4K0VsYnJqNVA0NTdCb255WWFo?=
 =?utf-8?B?aFlrREE2NWppR3JBUlZmVGRTaEJQU2Vsa1JjM3BKYzJ1ZmkvWXhrL0dvZnM3?=
 =?utf-8?B?d3FkN0FwM0ljNVVWTFV5VUNtRVQ5WXhhSjJQYWpaT1AxQzBaQkFCSWllVmhv?=
 =?utf-8?B?cEpUelJtNTVjTmNhYldERUZpUTZaQ3JBVHlIanZLVCtidE5JWWgvOHk3em8r?=
 =?utf-8?B?Z2wxUC9WQ1o1VW4rYzFoUkE2azBObURoQ3lrbEYwMC9aUVVOUkFMRzg0bkNs?=
 =?utf-8?B?SXVZMG5CdUN4MHk5OGhueDR3eGphWFhjdjV1WmRvS011OHB5OUxZajNmSTEw?=
 =?utf-8?B?ZFN4elJXUzl6MVQ2RmZIemdVL1VGellaaVpidGh2cmg0Um5ibitLb2FqUFBJ?=
 =?utf-8?B?d3JuZTZiZWIxODJiQnVKTXY5M1ZjU0NQUUxZQkVkQ1lSUTFUZVV3dzF5cFZJ?=
 =?utf-8?B?RTZ1OFh0STZQMmJaTm8xNVNqWVRuYzZKMTFYOEJCQWlMdG1uV3FPUElIWFUy?=
 =?utf-8?B?STQ1clZ3SldHMHA5QjJTUmJMNVJ3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:05:25.3489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 813a0db9-65b2-4303-f81b-08de59d86fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: C4E026ABD1
X-Rspamd-Action: no action

drm_sched_job_arm and drm_sched_entity_push_job must be called
under the same lock to guarantee the order of execution.

This commit adds a check in amdgpu_ttm_job_submit and fix the
places where the lock was missing.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d23d3046919b..e149092da8f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -163,7 +163,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 }
 
 static struct dma_fence *
-amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 num_dw)
+amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entity *entity,
+		      struct amdgpu_job *job, u32 num_dw)
 {
 	struct amdgpu_ring *ring;
 
@@ -171,6 +172,8 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
+	lockdep_assert_held(&entity->lock);
+
 	return amdgpu_job_submit(job);
 }
 
@@ -267,7 +270,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, cpu_addr);
 	}
 
-	dma_fence_put(amdgpu_ttm_job_submit(adev, job, num_dw));
+	dma_fence_put(amdgpu_ttm_job_submit(adev, entity, job, num_dw));
 	return 0;
 }
 
@@ -1589,7 +1592,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
 				PAGE_SIZE, 0);
 
-	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	fence = amdgpu_ttm_job_submit(adev, &adev->mman.default_entity, job, num_dw);
 	mutex_unlock(&adev->mman.default_entity.lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
@@ -2484,7 +2487,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		byte_count -= cur_size_in_bytes;
 	}
 
-	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
 
 	return 0;
 
@@ -2527,7 +2530,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 		byte_count -= cur_size;
 	}
 
-	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
+	*fence = amdgpu_ttm_job_submit(adev, entity, job, num_dw);
 	return 0;
 }
 
-- 
2.43.0

