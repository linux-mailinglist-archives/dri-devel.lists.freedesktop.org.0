Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKdhCh9ud2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:37:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB588EE1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F031810E42F;
	Mon, 26 Jan 2026 13:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iv/LL356";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C052D10E41E;
 Mon, 26 Jan 2026 13:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYBPaq0UGZSEIK3KF48WMD+XUxvvhK9OHfpbRtGNFGM4NuoTJByKEHIKbUETcK7vk3iMjiNWGhXeSp8UDS71zrgHGpujOSn0+wBf3if2WnVhHP7KNgsZEhk6AYkkOzT61Pq3MXQCSV2pVZ8txoQnAa5Kept+ueGqYGGzgWGpzqMllo+ar9bZUjhcukMwrDTPeUeBsG+z5AGTqpqqF7buM9usFteA1J3rS9hb/CXRy9v/WEOGRltCe2ED6lJDv9qDr+uSVWdWWDGFZochYq46LQLd8YMLU+UqfcrnxhLIxfawQu9V1brDj+IQr6u0RlugoNpxLrFMAag4c/V4R9FHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1nT16lXSFx5rzdhUQDsqftfqxLlpMM8d/d/HUxlY/s=;
 b=lzeZ8UsuieiIeTL/iE71z5uNRmWBgYgSaASdTLVXYUxUshi59YqTUN7M3VaoAsI0iDcuGhnOnXOGp/R9mHQdF5oWhI1GKchXnmWmAcFEBhYcx02TC7donJ3KcYA6Zsl1PbzKt6SaOOuS3vs42xtAYTdVKDJ+STOReLQ6Yh4st4LRfSgQPqEp56Wy6lb8el4amatmtcoNT7YDck7S4n123pqcpBLPcqbJvx/m2+/2OREcWeDN9JfEokivakix/uyZ1UGxWZ/FAbeMuA27NjfgW6JLGUVLRCZenicKSSFLd/NZt7sgxyU+QebucEYY8Zk9YHfZwyGqPtfhrKp9W7YoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1nT16lXSFx5rzdhUQDsqftfqxLlpMM8d/d/HUxlY/s=;
 b=iv/LL356ptLkYxXX9DGgtRix5OwLGqCLqsHFuCwsJntnTqHxE6+2aaMNjfMcMXdoqX4kGKhpeMHBAcQlil2HRz99JotQqHBxpJA74fN7S6w+iBv89BcLfrB/Ifoh6pVXZfDFXd/dmZHz2s6AaEYLyHJ6e0Tpbzsb/iv57O+riKQ=
Received: from SJ0PR05CA0163.namprd05.prod.outlook.com (2603:10b6:a03:339::18)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 13:37:25 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::b9) by SJ0PR05CA0163.outlook.office365.com
 (2603:10b6:a03:339::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Mon,
 26 Jan 2026 13:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:37:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:37:23 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:37:11 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 08/11] drm/amdgpu: check entity lock is held in
 amdgpu_ttm_job_submit
Date: Mon, 26 Jan 2026 14:35:03 +0100
Message-ID: <20260126133518.2486-9-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 464c21c7-f592-4310-b09d-08de5ce00a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UE5hWGxEdSs2WWYzVmcyZFVRa1FtNzM5azE3dTM1UjNueW55dG1oMDczWU8w?=
 =?utf-8?B?SDBqN1BkYkRiVUcyd1dtYURjbWcyNnZmdkczeEV0UnFRUHpqd3BGdzRBREhQ?=
 =?utf-8?B?UjF2aHFpQktlVUtVWngxYjYva3NSd1hlalpFYkRZWTZ4Y0ZuNzlReFdGNDQx?=
 =?utf-8?B?ckU1T1ZTNXNNb2FEQy9FdzFTWHg4VlFNbkpLQ0pSZGFTWjVnRUZveVJBeU9v?=
 =?utf-8?B?UEVVeHBtWEtuS1Q0bEtuSFBvQmx4S2hhbk9HZ1oyWk5tUkdMNURRRDkxNjZh?=
 =?utf-8?B?SDNkbElDUXNDdDBFQnZpcCtZaWVRT0pFcXl2eXI1aXo1b0tNTUZxNG9kTlJq?=
 =?utf-8?B?ckNDZFFJSitIQ2h2enJYdUdXaUlpMTJrNk9vd0dzelFNclkvaVVhYkFlUWpo?=
 =?utf-8?B?TGZGbUhaRngvUWNxRFpOdGtWaEFyRVhBaEpDR1VIRWd6RTR3SGNOUHVVSEpY?=
 =?utf-8?B?dUhBSm1wYVhGTU9RZUtOV1ptSXFMbE1qOXJGUi9aUTVrTGpIdDhmM2RmSCtw?=
 =?utf-8?B?UW5LK1p0TC9GMmVHRzZ5WVpxd3ZjNnJtQm9GOFRtNUJ6RktYWjFocGNvRG1H?=
 =?utf-8?B?SmhjQnR0OEluMmVRN3lZRnJ2d3gvOE1qTk5jaEV6Wi9KMHEydU9JN3hJajVw?=
 =?utf-8?B?Ny91WjZlaTZJdG9jUENoWHU1VThJTmVDZU5CZzdudW1RdzlGRkIybm1EdzRa?=
 =?utf-8?B?bWhCWk5JbTBhL1M1NmRoZWhCR1grMEtDTjdxcG1CSmZZOURnSGJZdDlhdkV6?=
 =?utf-8?B?aWhJUmpGOG9OR2hjTE5GUXJyVHp4V01BR0tVNm9DWGRiZGpCM2Zqa0ZmbStY?=
 =?utf-8?B?WHpJK1NxUHlXZFRsdk41ZUNOMlJyNkZPdlpGY1V3SHhqMUVicFg4emdna1FT?=
 =?utf-8?B?T0RVUmNwYktjVS9nR3lkS3d5OVNzYWEya0RaWHV5a1JXaFpMbG9aWWRnZGtN?=
 =?utf-8?B?Umx6M0QxYmR4MHA0NGsrMzI0OFFGRDRlVTNoZUdzSEZFWlBuVFlpejZoRVJG?=
 =?utf-8?B?ZkVMUXFYRlVpcVhPdkh3T1hvYnZiM2N4RGs2bmVIenRpK0ZBRkEyRU94bnpC?=
 =?utf-8?B?MnA2ZUxEU3FOQlNXdnlUcm0wN045cCs2b0xIL1dCVkhFVm5qbStXN0xZN0tr?=
 =?utf-8?B?R2F3SnB0ZGZ4WktvQ2NjMDVLR2NBY0tQc3V3dmpUaEFseG91dTVaTjdDTFU4?=
 =?utf-8?B?dGN0ZzVDS090S3Y1RHY3bU1pSDNRaEUzTUVNd0g1bDF6cHBRYm1mczF5VEMv?=
 =?utf-8?B?NUtxemU2SHY0bXVnUDd6VUZpNlovNUM0cUg2dmg2WW9OQjZ4WkFIRXg1WCtx?=
 =?utf-8?B?dGFXeWVqcjk0WVRuTjVWOFQvUUVVWFFrV2VXMTV1TjJJUFBJbUdXWHBCNjRR?=
 =?utf-8?B?U0E1QzFMTlhmQUt0NXd3VWh3RjVaRnhBckdnZXEyR29ucVRXSXpKKytoZ2ds?=
 =?utf-8?B?N01LTElZWlZ5b1hrK2N2Qm80ZzNZd0VkbExFTjBPR2Rlbi9BaGZDSTU5aU9i?=
 =?utf-8?B?VkdraWw5WTV1VHNiSnJZTW8rOEVmdkFTWk5qbElMd2w0Ym1DeDhoUGc4Q3dv?=
 =?utf-8?B?MlFJTGxxeEZ4RHJsOTJMUzMvaXJmY0tGNVJ2ZjZSakhpc0hLUituYjVheEQx?=
 =?utf-8?B?aFJtTjFtNXMzVWhlQVVLRHY0Q3RFUHl0UWMzSUlVSFlzdnRrNWdxamR1Qmo0?=
 =?utf-8?B?OEI4MVBRV013VEJhZDlwNFZNTWIxL2RuVFNEWjZOdHcyS2d3ekZLaXc3bWY0?=
 =?utf-8?B?VC82OXFkditKb3d4aU9Wd0gxaWhWbGVsa1RodXYvTkluYi9zd051QzZhQmxW?=
 =?utf-8?B?cUV6UVR3Mk03b0FvdHo5OFdqSi9EU2g2cU1mVWg4aW9VMm5lOW9NaUpoOE4r?=
 =?utf-8?B?eHh5SmRCTEZhV3JhZjJFMHNlMzdxTlBRd2hMNk9ZY29RV2p4QmtOMng4NDl4?=
 =?utf-8?B?a0NmWnl1cElxUVZQSFh4Z3c1VTlSZW8zendPREJ4MG4zVjdPVlZGakxzbFNV?=
 =?utf-8?B?c0lIWWRFaGgvUWhGT2VVSlA3MmpCQ0dyWEppbVdQa1FlejVGcVVPZFpjZUhE?=
 =?utf-8?B?MHAyOWRCZXpVOGVLNUplMXRUTlhLU2t4L3EyUndWd2FoSWRNNnU0bkNCSEpH?=
 =?utf-8?B?bkVqejJRb2xkWU9Pem1pbmFZeFB2ZlVBcXlCSjdsV3pmTkM2NDBRblY2YnJt?=
 =?utf-8?B?Z3llR1gyQldpZC9SS29KVGxwTjlpVW5DczQvMlhuZnNGQWZKVDl5elRXT3Vl?=
 =?utf-8?B?UUE1VmdaQWYzUWRIMlZHdE45WWVRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:37:24.4849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 464c21c7-f592-4310-b09d-08de5ce00a23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3AB588EE1
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

