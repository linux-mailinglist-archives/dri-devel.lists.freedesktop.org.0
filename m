Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5D63B0A3B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481D46E5BE;
	Tue, 22 Jun 2021 16:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65F26E2D5;
 Tue, 22 Jun 2021 16:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzIuBSXLYkqKXyFcs+KekZ7oMkMfA2K1PnDyzj0FtMgoknGzoEvACzQQbNz1w0u7rOw+rsUCxtJywNmirDU4vPY19oM6C1QhTX0biZ1cC6vWsOhzkVyL1zydYs7NEeVt2n/5IQ3O95rtsioZuWJ0wllObPcFkd+134eUBO0zl2NQzLXY+SXx1wKIuI1LdsQ/CVISepz9duBWoe8zk+jtDARp6G+1RvbU6LHrfQdbFQTmpkDC1sZKGmbtFv0eADQ/1nBtheah2F//fTtkcrRI5h5CLLruxxKTAVcN7G/9YQS/12H+rcbV+NSp9YkmaPgRVOe5GZi2zc+fmib4UNeDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIlbrlBQPhwCCtEJn+woubiFNTaH47GxA/pBqNMl0l8=;
 b=dm1UEVOcTvsteDvnC35SQ3yte3mkkvs3nPqZCgwHjWMUrJfEtwSn8wAQXL4gPxe2S33ib/y/LJVqtTxICQZdGo9jQA1C2J3JQb9kV1vP0JwoHiUnsf8m8yba09xtzMSQl1dHxdhmre8FyB5CnyYTYcAteqmZhTRT+AF7JfWENvbkef9zmfRP4EBLkvGV6JyrTqYd0E0HTx2s7tnRIaFXAG/uqJ0mTmsxamI6YOK9fd4fcCxnspT0/o68qcmX3A1RFyD4Y/idJ5MIKmGwRkSwfeqKcBZoxy/xgX7lGKraNBDJc+MgYYLGz+uPnKWKHT/JFu/mIPkarZ5AnjuSBkBtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIlbrlBQPhwCCtEJn+woubiFNTaH47GxA/pBqNMl0l8=;
 b=5Rw7pl8O4ecEHM9R5e63aJYlhjaJ+Bx6+FMInjyN8w3BLxmSIjYkRZHDiAEcoIWABFCcmf29EXyRCM2LE6gSDEjqe5hEGXTgbvnl6YKK9ZNgb6mKlzrrdICPHdpGbtS9sPFPDtBxRzHh/PzD65ZWopbMeEBcmMkw0ytjRWao8g4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 16:24:10 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 16:24:10 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu: user temporary GTT as bounce buffer
Date: Tue, 22 Jun 2021 12:23:35 -0400
Message-Id: <20210622162339.761651-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
References: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 16:24:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39e8f2a5-0b89-44f6-3f23-08d9359a2a32
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44622C7C805A9BC4EE859256EA099@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l95BeDMYyx22SoNxA9JHF5gWTpbJixZccbDJzLJQVQBUxiR5MyBj1Sj5QG+iwu5lH6iUaLN1bvKACxTvo+gFPJtolYgH+b7ZUG9sYHY0AO3774O60NmindHwNSMJxVdU0i6U/AwY4yUgfO5pi4QdfsKgZUBseZpElFSyA+YzgTDweq6/U3YYT0vIj4+MQsmfP43UwB8Ngpqz35CB2FFMJIJzHcHOQjAp22ZhCmWmpuultJLFCsWZTsud8GbLI8ApaA6uB6TkE+MvYVvk+Qxsf7E8dPtrtpvgJhRTklwdlNkxwAa6QcHKnvrAO0XXPM4nGQ3SZZ78bqmzvvoA2KXWirtJcfwNgVYOOR4zMeDljZi0MCHWSHNgyN/Ss/5J7DLhCoJj+xvsViH6/4ewYIdCe7j+lYxqG5oSk2rqjUzCIsVgEZ0CqbGGUiRQ8UEDfWyOeJj2Ixj2KNqGbntAbmzVEjqTx+vLx881uS6zczc8AOq398p+JwNfJz1y64fkIx2ZQrax/eFOq28P2inyTFztSwT/Dc9OcXip0qe01jTnNQZoW/zLoYEa73VZLl7fHIH+wNxBJOkOeLnRpFEO8ewK9PEKF0tyFE8u58CuKnXKmEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6486002)(498600001)(5660300002)(1076003)(52116002)(16526019)(8676002)(83380400001)(6666004)(36756003)(44832011)(38100700002)(66574015)(6506007)(4326008)(6512007)(66946007)(8936002)(86362001)(2616005)(66556008)(186003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UktPMFVHUjYwTjFadk9sc21iMGZnVThuM3VTOWh5TXVqOGdmakZ2cGJvdWl3?=
 =?utf-8?B?SldrSmxXN2VaZjRCamJZMTlneTBhV3EweTNNZkJaYzd6bGNVNVVGc1JpV2VX?=
 =?utf-8?B?emc1WElOemRDbzViRmNQQUx3cHAxTnJ2K2VISE8zVXJKb1JGSXRmd2FHTTlp?=
 =?utf-8?B?NnE0dGZYaFRoL3IyMDV6dzNid2VKdVBpanhLTzdjRk1oSFZuVGpzTzVFa0ha?=
 =?utf-8?B?azFJSEIrcDV4MENVUk0rcjVRK1R6UTRFUW5QU0lKbElIRWZUNENHMy9sWTVm?=
 =?utf-8?B?WWF3cm53dEVqR0RJVEVPS0RpaEx2Q2hmY1B5RCt5RUovRER2NnNJbHRBTHBO?=
 =?utf-8?B?ZUxjaDNlTHUwUmpIUmJ5U3pYNTNTWHh5N29rdUdXK3YxclJzOGlIc2VXSXJk?=
 =?utf-8?B?azExZTk0Z3BqbXNMaGNydk03VkhMeXI2YnZTT2VUcHVLMzl6dXlCN1YwbmZG?=
 =?utf-8?B?U21zWDg4ZndvSnJMTndyNUdGNmZVRk1nQUNaSzFlQnBSNU83V1hzcDg5bktH?=
 =?utf-8?B?TVk4SFVmaFF0U2JwdWYzNGNYNUFnTCtsc05yaCt2SHRrYnpyR3VBME54M01L?=
 =?utf-8?B?SUczUWxIZGZ5L2NHT3VNUjJGL3B2b0FBU3QrVjVzbU1EOU5tYWxaT2s0Mjh6?=
 =?utf-8?B?eE5WcmNSdm1NR245d2thcCtlK0d1ODVQZ2hPeU9KNFc4Z1BReVFBOEFVVGpu?=
 =?utf-8?B?ZUdjcndtZzViRk5uV0FzU2pzbCs0dnVINTBXL0NkVW9XdVo4NWl6VnlvR3J5?=
 =?utf-8?B?RmpTVmRMQWR0L2UvWUxlaGgvdC9KbFEyT2ZDMkViaExwbUY2aUdDMkRXMDE5?=
 =?utf-8?B?WXduR080TkorZnpIMENFQ3I0QUFaYm5KWm9najlPai9OTGFvMmtVemlqaW04?=
 =?utf-8?B?eDJPNkVhUHFCdHdHNDdFOGlJVE8zZTA3Q0NmSUNjeW9ETjNFYXc3dFBTWS9X?=
 =?utf-8?B?SHhnb0JucFZzVEV0Snlwc2hEN0RHV2JSSi9Fa0tucFhlQWMxYzR0NkNZcWRP?=
 =?utf-8?B?ZjloZmVyaS84S3U0T1VsWW9wajRydm80Rk8zMm9qYy9YSlJPb2lEL1lCQnZx?=
 =?utf-8?B?eE5RRHdEeFNrWURVZmN3Rm5selc3MHRwTERTdk9oMktXeXR4SlRPcUpsQlN5?=
 =?utf-8?B?dkdGcDZKSlFlV2M4dlZlSXU3TjZoVVZsa2FORnZmL2tQckVDUkM2WXNjYzZk?=
 =?utf-8?B?UWR3TlhlazhYR0pQOGFDYlc2ZXVEUTN2NmtGZks0eFFhNHo5NThEcUZIMGI4?=
 =?utf-8?B?R3NYNk1waGxtZnFsY0dnQk9RYlpSdERTOWp5QzlPbXJzSVU5eGtkZEV1VndP?=
 =?utf-8?B?SU9oTmVwYmJqK1lQMHZkT3NBVDhwd05kaWxDbUVZNVFIby81ekRZYzd0UEtz?=
 =?utf-8?B?Qnc0OTY4QU5DYW1IaWp3cll5NER6OFZEZ1BVcjhFaUtwY05NVEhTRCszRGRH?=
 =?utf-8?B?QlpyMkVpcTBDNFUySGF6MzBJWVlFWUsrbC9JU2U1SUZxeEVyMnF3czNrWUJB?=
 =?utf-8?B?QmF1WUw5SUtsNS9ZdmVLaG92YlFPQUxBN2pQQnUvWjdKSE1xNE1sancxdlQx?=
 =?utf-8?B?V1hDdVlBUUYrK0p0RlAyNE5ObDBpUE1MNmJrdW9WbVFTRGRMMlBJMzdkdUdU?=
 =?utf-8?B?UVhJY2VoMDJ1OGR5UmJkYnhwL3U1SUJlZllNQ3JGWnZiamxXaTRIQTRCSll6?=
 =?utf-8?B?R0RYZHNJWGl5TDFldERpYURYTGZMdzBYVlU3R1cyQ21QWVIvR0MzcDlxamIy?=
 =?utf-8?B?SktWaWkvSzFjaG9ZZWJOb3B0dzYvL3dualFxLzBMSW00RUJoejZkQVlIRlJ6?=
 =?utf-8?B?dzFLbUJQNGJtNTcxUUwrWjcyRmh0MkJWYlE1eDVUQmZ6ektkaEt4Vmg3b3dF?=
 =?utf-8?Q?1eZR9VQIE9rnM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e8f2a5-0b89-44f6-3f23-08d9359a2a32
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:24:10.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7iYFtoLMx5y/Uszr7KWBpzPZORTf7C8q9pX+1avJFSGbOiEkVfMEZqkL5uUiRP1NyS5Pd5W7RleqZVVF9ZLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: ckoenig.leichtzumerken@gmail.com, Lang.Yu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lang Yu <Lang.Yu@amd.com>

Currently, we have a limitted GTT memory size and need a bounce buffer
when doing buffer migration between VRAM and SYSTEM domain.

The problem is under GTT memory pressure we can't do buffer migration
between VRAM and SYSTEM domain. But in some cases we really need that.
Eespecially when validating a VRAM backing store BO which resides in
SYSTEM domain.

v2: still account temporary GTT allocations
v3 (chk): revert to the simpler change for now

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 20 ++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index ec96e0b26b11..b694dc96b336 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -132,14 +132,15 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_node *node;
 	int r;
 
-	spin_lock(&mgr->lock);
-	if (tbo->resource && tbo->resource->mem_type != TTM_PL_TT &&
-	    atomic64_read(&mgr->available) < num_pages) {
+	if (!(place->flags & TTM_PL_FLAG_TEMPORARY)) {
+		spin_lock(&mgr->lock);
+		if (atomic64_read(&mgr->available) < num_pages) {
+			spin_unlock(&mgr->lock);
+			return -ENOSPC;
+		}
+		atomic64_sub(num_pages, &mgr->available);
 		spin_unlock(&mgr->lock);
-		return -ENOSPC;
 	}
-	atomic64_sub(num_pages, &mgr->available);
-	spin_unlock(&mgr->lock);
 
 	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
 	if (!node) {
@@ -175,7 +176,8 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	kfree(node);
 
 err_out:
-	atomic64_add(num_pages, &mgr->available);
+	if (!(place->flags & TTM_PL_FLAG_TEMPORARY))
+		atomic64_add(num_pages, &mgr->available);
 
 	return r;
 }
@@ -198,7 +200,9 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 	if (drm_mm_node_allocated(&node->base.mm_nodes[0]))
 		drm_mm_remove_node(&node->base.mm_nodes[0]);
 	spin_unlock(&mgr->lock);
-	atomic64_add(res->num_pages, &mgr->available);
+	
+	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
+		atomic64_add(res->num_pages, &mgr->available);
 
 	kfree(node);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 80dff29f2bc7..79f875792b30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -521,7 +521,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			hop->fpfn = 0;
 			hop->lpfn = 0;
 			hop->mem_type = TTM_PL_TT;
-			hop->flags = 0;
+			hop->flags = TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
 
-- 
2.25.1

