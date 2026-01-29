Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC4mJDl+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F22B185C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A54D10E88D;
	Thu, 29 Jan 2026 15:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l9/dWta+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FD610E889;
 Thu, 29 Jan 2026 15:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISHA0CoWfowyfBbKW/8QuV27en9nGqwknYknOQIxHWwo0FDl4u415HdQWgaeni+15HNXmz7YEEtM63Ex1vqReklLoJTHwqKBJhhtmV0GzeQgiIeucillQZ/cDz64IN/s9A6LjPJNcNXhfA0DU/paj5uzNvbzYd1rptZoUdocnMKKqrKmjTFuaJFGTgt/aDQ/ZYqqYQPryZ3d6DwlSa8gkvZ7pAoQId3Vv6DNBk8GVQ8RZMxpCR2mi4/XhyJWhEYYILpEcjGJNmsooSRPyJsdP5UfT7sQF6/D+XnM1JecatXHyGDO+0ev1/+tg5/Yy36Y0x3lovi+3NZJkKxhY9f0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4E0t0C1xAQSECyBpUMWknVmkKVQcA7+x0fPwEQwFXc=;
 b=Qml+3HGuChDgi0r39jLw6PYbDaTDHJ42Bld9rZKMEGDM9kzjdPiPKqm7g2iPMc8JmyDiFY+ZBxh7vv1gNJq6m2I/CGQSGln5QZ/InM9J2rtYg0luABnPwukppoH4N8WqVeLUGsrLDbzqy6GOXLNClS8W6XU9IMg3UqSAdk9tx/v9q4L25r8zyRhUUlzUM8oL8qB6fgBVAdgiOcBvrcgvYZIv2ff7+CsBPCbJ4zCXFvsdUG8TuJbsJetFQgceJy2SyS720VdrAa0YwBwY05VWdumXPK70pl/YIXn2YBrvtxfP3U1jQ1E9xSYlI4eqtDFEK97hySmL2/MRrxIs8nSn1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4E0t0C1xAQSECyBpUMWknVmkKVQcA7+x0fPwEQwFXc=;
 b=l9/dWta+w/B1JtvPO4Q005DSIvsbKrVQINdZS6VL3Ox42xSqx1cfXTU2BSpvmnvD55u1xc/DI3edphCcEksqPX/0yJZLRK05e/6kXWxYx+HTYZxkv2zgCQhE4iM2BYYOCSf31/vjhlAT06x2N6rkVCr+Sg3r7hxZm+oKpv2jknE=
Received: from MN2PR06CA0025.namprd06.prod.outlook.com (2603:10b6:208:23d::30)
 by LV8PR12MB9642.namprd12.prod.outlook.com (2603:10b6:408:295::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 15:35:08 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::23) by MN2PR06CA0025.outlook.office365.com
 (2603:10b6:208:23d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Thu,
 29 Jan 2026 15:35:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:08 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:03 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 05/12] amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries
Date: Thu, 29 Jan 2026 16:33:17 +0100
Message-ID: <20260129153336.7473-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|LV8PR12MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c174c85-f5e4-4db7-af2b-08de5f4bfbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SWyKsaDsnbhnpDaJ+lz1zxSRB4nsEsadbPvJ8g6KKX+4vowxZgUH3dLUM0a/?=
 =?us-ascii?Q?t0JDdz1F1ON6Rk9l3U9yp4PN9B5CayvcSHQnLgX2gLhCxLjulwihlBQYfGI9?=
 =?us-ascii?Q?dwO7t8o0uvbXfxifSlJMbd2w8BXTF0tcR5ZqLgIrl+k2yZkf8oft5hB0TMPV?=
 =?us-ascii?Q?KOxfOIDo+7CEtEaG7FR/93BAaxK9avzw3tRm2hrwc4Rkc60njYH9lTOLJrs0?=
 =?us-ascii?Q?YpKrhz0uVMUc86vyCtrw3wFcJL5aZxg3qoZmfOe3kwAfKGYJxfRRKsAoHKLq?=
 =?us-ascii?Q?o/MTMAlVEMHyHne7ywYgBQUtOG3NPZC/zDp5ZYDzTnXTAKKMIRtOfiQikL3d?=
 =?us-ascii?Q?uF+vexovGVv5Xx5+IvC8Yi2VQfWT0oQcmxanJGMureeJ3p+QD/H2L+6fNwGJ?=
 =?us-ascii?Q?LRGpXHyfi45mWe7DMaWloWgZ2HGpz0TVjSc6d9bB/4XkTrVa2l4jPffZza75?=
 =?us-ascii?Q?OtR5XqopKSoIyGEHq2jEkWM8fPtrYYSdQZwLnmtqIr+Pco6yBu9kxLvVc+aa?=
 =?us-ascii?Q?NjJ8Xhh0BXT2sUvWRbFYcjcCUeMIZsA30c/rGjyP5qdJgUBjLLM2oYj0O5mJ?=
 =?us-ascii?Q?FGuPHOhEz+5c/aNNLbyCVwXofEv61ATIfHTVP10mxteamasFvgLRwu/5u0yT?=
 =?us-ascii?Q?PSQKhQX9TBnUb79XU+Sgz/WL/vWAAH4y2vgJj4zTnS0lW/FmtN9N/cHYBbJR?=
 =?us-ascii?Q?26wXtPI3ll3fCaam6QHRhMFN8HyfVZRfWej0MxuLpppv+tufagEbwn3wbDRg?=
 =?us-ascii?Q?+4uvjX+b8C/0FOC/pfuu3eEmHzFY+7fRRHfgpqYGKENN6DGSFTD7LOJPbRoY?=
 =?us-ascii?Q?WFla4/okkr7+5slgUSt5pr+S8mJ8cYktWUynoGOqxm/xRRoDvIA3OnoZf0B9?=
 =?us-ascii?Q?6EL24jYTGF3mRDj1zslW7bqXSnwRzMeoPbz4sWNuCoWAaZlkOr7/g2IPWPHd?=
 =?us-ascii?Q?iMTRTIMkfDDZ6d5ZxBqh5mU8cfHDns8bKT85XaDsATS69XzmXlOevKUQCola?=
 =?us-ascii?Q?WsWL//UKZ2Arcx1gN2KLTxdrxezAioSkg4F5+AuAWZKxzCgDFBPxm8TLu9mC?=
 =?us-ascii?Q?tFLTa5ECsZjOWgTCEbQBIC6Sow+sEr4oUHRAD9BlWhGudLXyjwlgRWo92uCJ?=
 =?us-ascii?Q?K7J5a5HMm+jdZC8Re2U3eE9MlgkqjG5mRRJKIt1pVe6ultfgVF1g0qEQ40c4?=
 =?us-ascii?Q?dud9H9/50nrYt0hkhUo7I9DTw1finH/sZWj5GCMvBJ22kaOF5eKnMG/G10Y2?=
 =?us-ascii?Q?xClrlhH8rGfCb1kq+4W1rof/T6edSHJ8zBj0GijIGSsFh6IjG3aR2BLH/lyu?=
 =?us-ascii?Q?EjchpQV5EdSO60+rOI0MGRWN3CYa4ZDBkp/CEwlonFe1tosjU9aPPWhS8OZM?=
 =?us-ascii?Q?39PlvdwAH68zisTyzdio6ZLMKwvTCGNWuqw40E5zBQUSpRCqNJuhLmgAb7ta?=
 =?us-ascii?Q?ylc8ZNhe37elrjETIZ3oRaNsFWgmXPZxcLev76iKPuNKfi4FFXGKe6LLSYk4?=
 =?us-ascii?Q?oBgrAgOvZRIsSCZ2eBjfAWjDBzNwMTBCA+yrhGpOs7zc6wcXpcfcOFCyud6o?=
 =?us-ascii?Q?6qLxVikEibgV50/G3e9qRCv054tRNQBKTg4bWkJ2I5fbu9lfrdMCI1UnTTuG?=
 =?us-ascii?Q?zIG8E2Toi81gQ2O80ngJBNykiwNXAcbeyOuxdavZRZncgFxTyhDqrDcy70cm?=
 =?us-ascii?Q?5vplBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FS/Kt37IlYmkzpE6A5R0ROuprul9SP/7tQCZ9kkfRQlBSR0sUW8Z/fNnjPl12Dskc5igWH9ebxArwfXKeIgH/1JY83if+uk3f5l8Hc4s6r8j39Vu6dgyD6WkuRZcuqibbRVTRTUVdW/AM7fuEU6pNdOwpqB7vmeJtfzUT4VuZax6cFt5YViahzqivBJUjAb+7ctgA+AUWVBlEnJvCYC0qsfvCfKE+QEtWdEH8P/xqU4FgrIHV92lNyv8GBK6vtxE3ckldxY4FnB/F1/j9UpLDR6OT/Q6StKYK8tFJ31l6Kn4K8hNX5RkqKEfMlXnFPKWOhjqdi2z8ogjbmtpSReVSgPS9A0LiQb1LvLVGzD+up5JFAVWj5a8MbaldOajdjk3epTwq+h99RjMeTqi+HsYUg0Fv632tDNiH4i+yg7c86rZq9W2rtz6YhZRpodt6CA2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:08.6914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c174c85-f5e4-4db7-af2b-08de5f4bfbf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9642
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
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 44F22B185C
X-Rspamd-Action: no action

Instead of reserving a number of GTT pages for VCE 1.0 this
commit now uses amdgpu_gtt_mgr_alloc_entries to allocate
the pages when initializing vce 1.0.

While at it remove the "does the VCPU BO already have a
32-bit address" check as suggested by Timur.

This decouples vce init from gtt init.

---
v7: renamed variables (Christian)
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 18 -----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 33 +++++++++++----------
 4 files changed, 18 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index dd9b845d5783..f2e89fb4b666 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -332,7 +332,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	start += amdgpu_vce_required_gart_pages(adev);
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index a7d8f1ce6ac2..eb4a15db2ef2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -450,24 +450,6 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
 	}
 }
 
-/**
- * amdgpu_vce_required_gart_pages() - gets number of GART pages required by VCE
- *
- * @adev: amdgpu_device pointer
- *
- * Returns how many GART pages we need before GTT for the VCE IP block.
- * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
- * For VCE2+, this is not needed so return zero.
- */
-u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
-{
-	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
-	if (adev->family == AMDGPU_FAMILY_SI)
-		return 512;
-
-	return 0;
-}
-
 /**
  * amdgpu_vce_get_create_msg - generate a VCE create msg
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
index 1c3464ce5037..778c714c8385 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
@@ -52,6 +52,7 @@ struct amdgpu_vce {
 	uint32_t                srbm_soft_reset;
 	unsigned		num_rings;
 	uint32_t		keyselect;
+	struct drm_mm_node	gart_node;
 };
 
 int amdgpu_vce_early_init(struct amdgpu_device *adev);
@@ -61,7 +62,6 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
 int amdgpu_vce_suspend(struct amdgpu_device *adev);
 int amdgpu_vce_resume(struct amdgpu_device *adev);
 void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
-u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
 int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 			     struct amdgpu_ib *ib);
 int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
index 9ae424618556..5b7b46d242c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
@@ -47,11 +47,6 @@
 #define VCE_V1_0_DATA_SIZE	(7808 * (AMDGPU_MAX_VCE_HANDLES + 1))
 #define VCE_STATUS_VCPU_REPORT_FW_LOADED_MASK	0x02
 
-#define VCE_V1_0_GART_PAGE_START \
-	(AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS)
-#define VCE_V1_0_GART_ADDR_START \
-	(VCE_V1_0_GART_PAGE_START * AMDGPU_GPU_PAGE_SIZE)
-
 static void vce_v1_0_set_ring_funcs(struct amdgpu_device *adev);
 static void vce_v1_0_set_irq_funcs(struct amdgpu_device *adev);
 
@@ -535,27 +530,29 @@ static int vce_v1_0_early_init(struct amdgpu_ip_block *ip_block)
  */
 static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 {
-	u64 gpu_addr = amdgpu_bo_gpu_offset(adev->vce.vcpu_bo);
 	u64 bo_size = amdgpu_bo_size(adev->vce.vcpu_bo);
 	u64 max_vcpu_bo_addr = 0xffffffff - bo_size;
 	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
 	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
 	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
+	u64 vce_gart_start_offs;
+	int r;
 
-	/*
-	 * Check if the VCPU BO already has a 32-bit address.
-	 * Eg. if MC is configured to put VRAM in the low address range.
-	 */
-	if (gpu_addr <= max_vcpu_bo_addr)
-		return 0;
+	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
+					 &adev->vce.gart_node, num_pages,
+					 DRM_MM_INSERT_LOW);
+	if (r)
+		return r;
+
+	vce_gart_start_offs = amdgpu_gtt_node_to_byte_offset(&adev->vce.gart_node);
 
 	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
-	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
+	if (adev->gmc.gart_start + vce_gart_start_offs > max_vcpu_bo_addr)
 		return -EINVAL;
 
-	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
+	amdgpu_gart_map_vram_range(adev, pa, adev->vce.gart_node.start,
 				   num_pages, flags, adev->gart.ptr);
-	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
+	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start_offs;
 	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
 		return -EINVAL;
 
@@ -610,7 +607,11 @@ static int vce_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 
-	return amdgpu_vce_sw_fini(adev);
+	r = amdgpu_vce_sw_fini(adev);
+
+	amdgpu_gtt_mgr_free_entries(&adev->mman.gtt_mgr, &adev->vce.gart_node);
+
+	return r;
 }
 
 /**
-- 
2.43.0

