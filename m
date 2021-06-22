Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5B3B0A3E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C5C6E5CC;
	Tue, 22 Jun 2021 16:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0306E5C8;
 Tue, 22 Jun 2021 16:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeRB1fCPeOaA3fCKc81b7YZGK7hD5Qxhp2VI+i/JVCu3rjNMrDxG703I/5VwJ9EmHhYx1wpazaxFzF+aIH+6gyqrsu9DA8EEG1uv82a0M+23F/1cpXmK6dJ44P+qqTOu1ZDYM89R8aLlqR3+BmE/Db5BAWTL34/CRzEl5+MYy4inJxiUNr5/XuSlozofHuu3jK0R9Ex13gsJvX+2srhga/9IdQnQFkmTZQst5FG9+fq52c/jCm2dSesM25Es1Go9Uh58LQJnPGuRPhj2oOej1ipFVxpF+ZtiahnzPZlx+RQTQAaTHPYRcZkZ5xVNdkSRmQDOvxQ2KxuZ2OqtVnE1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CaiVlPbXcMzNAIKpwZZwB1jg9zp/xGy6bWKgEEYdfw=;
 b=gXvH0Ra9+kWEixBR2PWBREbVU+67LATDQ5R1M3kOmnDy4OS6iSkLiz8Tq9ypa9PiyExYEVsROq3d0ZxBmuKrtKxvRy/xHA1T2xAwil+acKRlm/Y9TCKmtOXQfnFX8aYYL9lAGJLMd0rolK7OYnoZGF7JWrxwB8NxMdfqkkWB9YQIy7A5VFxNYw36f5fEHRtIEBVrXZVeDgZOoZlDMUJMBHa80dEyLjHjEEU78gYRtBScCZNoRLo99sn+3EtFcrYiJ+siB3EFl1Q14UlLc/FIcK+4YoNi9EhOB/jfC9Mq0m0HLyRSeOVSSDWH8SXESUvR3GnNdyNBwN64pIiKAgBfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CaiVlPbXcMzNAIKpwZZwB1jg9zp/xGy6bWKgEEYdfw=;
 b=3JnNnu1ysrgUjKgCuyiabtgadEAO5bZOgyDxI7FWHitbMAXoZTGmp0EMo5QLZS6MhwqhbH9M9VzrWzpyIckmOqT6OC0LkhQir4PLaM7EcXgRzoKerwTXttjHtSIBDqHCiDSXBE4bN99CruFeXXFn3ld4fsmgt3J0lLFbTsgv64k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 16:24:13 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 16:24:13 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: switch gtt_mgr to counting used pages
Date: Tue, 22 Jun 2021 12:23:37 -0400
Message-Id: <20210622162339.761651-4-andrey.grodzovsky@amd.com>
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
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 16:24:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb7a891-d1c4-43cd-4451-08d9359a2c21
X-MS-TrafficTypeDiagnostic: SA0PR12MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB439986DFC8C9101881B17D3FEA099@SA0PR12MB4399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5DiIst9sfXYH8/aTgFULAaGna1+G4lnMsTJnDKtSGuBhBCoA1e21ydta3Cm92HLomq91jqi8lkoSWHXLSa1BGojB3pcr3LACsLBOkiuCBHwF2vKXmDmClXh9RtoDw0gIA+cYA9uTbMWyLEIp7yEJpEq9wzcKvmK/E0CQj9SZ6b02D4hckpfQ+WvIw+s1qOuYQHIJNlJn58Y78Ol1tstsYDij3H65uveQutzWdc6b33I9yZmVfJYfW0b4nS37xWqSH3s6LWT1lBFRHzhU83qqcOLMS7NSUwGaWw61Lqw49eNL5ASvv74bBpFsJzLGtC8P3fwt9QTJQuDkPR5/zvq3kimByirUdOm879Bf8Oovu8RuZuLFgJwMzProNsHmIcR+61NxAvfgo34Ic3nSGCXfmGbnlcmpIGPq3fFRylwGb6cf/SpomoNOH4NThTu6fi7h9yw2YShQpCblco3xk/zyle8DzIn3SQVPlJPj/djRl9iqF1+4PO9P1jxHrM71oVP9oRiGiIwvS6kTS5phG6iCU4f7yYcDNtnIaz/ESv+35iLbpi5LEq1602AGoJ3F9xEVO2EBuwpqCpRgde08Itwb99Z0Xu+H2C9Q3jh7QlcMKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66476007)(66556008)(66946007)(2616005)(44832011)(2906002)(8936002)(8676002)(5660300002)(6666004)(86362001)(6486002)(16526019)(186003)(66574015)(6512007)(6506007)(83380400001)(1076003)(52116002)(38100700002)(4326008)(498600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGNXY05lTk1jbERtbWxYWU9RSjdhRUorMlpvSkRTNlNWT3RMV0hlMWpvZVFv?=
 =?utf-8?B?OGE4a0owSEc5RHc0a2I2dUVXQzJ2VUV4MlJHK3dUMlY1U0EzSWtXRmhzeUNw?=
 =?utf-8?B?NW40cE0ycWdKaHdMMzFrY3gvVWxtT1pXZmt6ejhwTnVHUU1WWjl1akVzOXRy?=
 =?utf-8?B?TTY0VHVqcEhWUCsxQ0JBNzFDSFNSbHJMZS9LZVR0STg1OTNFOWo2dnNwcHRm?=
 =?utf-8?B?b2RYVXJ0T2NEdVh3dnUweVFSNllSWmxuVHN1TjBXbk9GOHJmQ3RzdUR4VEpn?=
 =?utf-8?B?TkVxcTEwSjkxcTFFdTV4ZkU0VWE0MGhNMmJTaHJsQ0tzV3ZIeEpWTjZOaEts?=
 =?utf-8?B?ZDBZeWcwRkE5L3RsRFQ2V0hkU1AyNjhPOXpHd0hrVFp6dWZOc0RZWGVtbjMw?=
 =?utf-8?B?L1YvdFgwd0JORndkV2ZEd2x2Q0hpeDVOeTdIcjQrNHRLYnM0cGh3dnBxN1Jk?=
 =?utf-8?B?eGhEZGsraytHbmNRSmViQ1RWK2M1WTQ4OFRjMFJndzgyV05qZzJMODVaMjEv?=
 =?utf-8?B?SGNpRnc0RjNIMU1jbVFrSHhOQXNFYWJXNFgreWpiTEMvaVE1OE1xYW55SnIw?=
 =?utf-8?B?alI5aVZGeks4Yy9VbDlRNHcySTluSVFneHgwdVFCek92WnNFUG5pTFpkdjdw?=
 =?utf-8?B?VEVNc1FtQ3hwOWdmVnkzL1oyT3FKRWg4OW5sM1kwbUFxSllCeUNvWVowbEZM?=
 =?utf-8?B?Vjh3THltcTNCVkMybnU4NG9TeW5WZWJnZ2ZKaUw5ZmNlcGlsUXBxeDRLS1dn?=
 =?utf-8?B?dEc4Vy93R0dRV3hXNGdGeDFmMnJsSGtMbUhhd0h6NDNha3llRzBiSERzYzFx?=
 =?utf-8?B?ZkRFdkZoTkhwem5wMXc3bElwbkpkZStIbUtsd2VOam1lZGxoYnZDbEpMaEQ4?=
 =?utf-8?B?RG5nMVpXSWZudUhDQXFEM0d0VGNELzBXRHgxcVBSMTBrQ2xURlJFOEsreFJ1?=
 =?utf-8?B?anlnWE1MNUh4c3lkcFZjcmxIbXRUdyt2OW9yVEJVTjBTK3Z6aUx3RTNFN3U5?=
 =?utf-8?B?dXBIK015ckRFWTE5WlMwdnNiTDhzTWowTXgrdXF6VGFaMHBrRENCaXc2RVFY?=
 =?utf-8?B?WC9KTy9ZNGFZR0RLZWl2bGhMcFdMdmwyMnRMc3ZIaG9IbWliTnhCYXNOa0RV?=
 =?utf-8?B?cWJUSDhQL2RWYitiK1k4cDY1Y0hBMnJPaFlzZTlTQWc3bE1MWC84SVZucHd3?=
 =?utf-8?B?bDNyYkpydnVCOWhoTkkyeFUxbDZTdnVNSDNZL2cvYkdFNG04Rm5TVVlkWjI4?=
 =?utf-8?B?alQvQUg5QUtPL0ZzZE1NNEhscHVuSHhPSGZWNzJ6NmQvVlE0VVZYdWZ5N1d3?=
 =?utf-8?B?QzJJTkdvOGNEdm0waGpRYzlVb2hzeGdod2kvNVhEOXgvSHdFTzJTYWE2Ukt0?=
 =?utf-8?B?U0M1YVpjbFlHWjRHckhpTDdYbzZoaHBycVRwS1dmL25udzQ3NnU3ZXQ5czlo?=
 =?utf-8?B?ZW1QbVdFblBxYmFEbE11eXFjdkV1Z0N6czNqQlZPalNsM0oyekdsdThyb21v?=
 =?utf-8?B?VnRZYlZXTFRudGx3Unk4SVRNWkFzd2NOTXVqcWpxbWVyVkhpTDREUW9mbEZq?=
 =?utf-8?B?ekRkbzJLMnBzbGtwdHFIdThQUWcyb28wQ2ZqMmUyN2hhdk55dG9oRjltLzIw?=
 =?utf-8?B?VVV5b09tU1BaeFlFOEQxWWR2aHFDN3h4VXB5SlFvVzZwOUZmeUdLS3BFNHZ1?=
 =?utf-8?B?REY5bTYzUDJMSVZIWjc2UWtiN3dZWkJxanV6L3NpV1M4U29uVWcwU09YZENT?=
 =?utf-8?B?SlRjNUNxR01zV05CWFFIdGJqOHFBQ1BqMkk3QmxJbEdxaStkbDUrL0J2SmUw?=
 =?utf-8?B?a0liWHRqUVcvN2Z1UzhvV3RGV2NvRStEYlZMNDVVbU1KS1NXbkJlM25SbG44?=
 =?utf-8?Q?dkdHi3da0szqx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb7a891-d1c4-43cd-4451-08d9359a2c21
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:24:13.3567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kQdOc0n5sppYN9PfZqF2A7t+FwaAPtPm8Wd3n05sLz1ViAk4hY6BPQu2LdV4VHubphn2OdYuM0L1AF0a/3l+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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

Change mgr->available into mgr->used (invert the value).

Makes more sense to do it this way since we don't need the spinlock any
more to double check the handling.

v3 (chk): separated from the TEMPOARAY FLAG change.

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 26 ++++++++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 +-
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index b694dc96b336..495dd3bd4f1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -132,14 +132,10 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_node *node;
 	int r;
 
-	if (!(place->flags & TTM_PL_FLAG_TEMPORARY)) {
-		spin_lock(&mgr->lock);
-		if (atomic64_read(&mgr->available) < num_pages) {
-			spin_unlock(&mgr->lock);
-			return -ENOSPC;
-		}
-		atomic64_sub(num_pages, &mgr->available);
-		spin_unlock(&mgr->lock);
+	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
+	    atomic64_add_return(num_pages, &mgr->used) >  man->size) {
+		atomic64_sub(num_pages, &mgr->used);
+		return -ENOSPC;
 	}
 
 	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
@@ -177,7 +173,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 
 err_out:
 	if (!(place->flags & TTM_PL_FLAG_TEMPORARY))
-		atomic64_add(num_pages, &mgr->available);
+		atomic64_sub(num_pages, &mgr->used);
 
 	return r;
 }
@@ -202,7 +198,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 	spin_unlock(&mgr->lock);
 	
 	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
-		atomic64_add(res->num_pages, &mgr->available);
+		atomic64_sub(res->num_pages, &mgr->used);
 
 	kfree(node);
 }
@@ -217,9 +213,8 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	s64 result = man->size - atomic64_read(&mgr->available);
 
-	return (result > 0 ? result : 0) * PAGE_SIZE;
+	return atomic64_read(&mgr->used) * PAGE_SIZE;
 }
 
 /**
@@ -269,9 +264,8 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 	drm_mm_print(&mgr->mm, printer);
 	spin_unlock(&mgr->lock);
 
-	drm_printf(printer, "man size:%llu pages, gtt available:%lld pages, usage:%lluMB\n",
-		   man->size, (u64)atomic64_read(&mgr->available),
-		   amdgpu_gtt_mgr_usage(man) >> 20);
+	drm_printf(printer, "man size:%llu pages,  gtt used:%llu pages\n",
+		   man->size, atomic64_read(&mgr->used));
 }
 
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
@@ -303,7 +297,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
-	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
+	atomic64_set(&mgr->used, 0);
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index e69f3e8e06e5..3205fd520060 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -52,7 +52,7 @@ struct amdgpu_gtt_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
-	atomic64_t available;
+	atomic64_t used;
 };
 
 struct amdgpu_preempt_mgr {
-- 
2.25.1

