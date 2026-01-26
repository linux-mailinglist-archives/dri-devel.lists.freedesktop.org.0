Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFZcEehtd2mMgAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D8288E97
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3817E10E428;
	Mon, 26 Jan 2026 13:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Khyo54x2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013022.outbound.protection.outlook.com
 [40.93.196.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8673010E428;
 Mon, 26 Jan 2026 13:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paPxMy4T62MJ5zAUtgbevwa6aitgFxXD8l0BTCbO+VVIiNQMYhBAP7PSpJDCmBgiQP4lFKRj05dipr+xa5aLfIzKn47ICUeiE7O/ROYZz/hgirp9AAbT33/vMO817dCVEwtCdgrq7p013HVK+uOZUsbY4Kt9clRCy7QMONMAkJSvPnFc178PRCOAsYqCw7MoPUbMxw8Q7CJWWhVGr+NEryY+UzUl8YuPRmm/tYs4cfF6v9JIYC+FmlykttbYQQb4jPOTaaDbFJ8p3UZtryKOQOqrPgpX76Krb+Du4UtN+XAo95XcrzT9Phe96Y8dcmVNdcQ7pb/uso58hQZWWEzg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRI72FrlNvSOO5ZIthxWAHjK7iHUWsS6dvnexwB7MoE=;
 b=YO6WMVry7kuiBG3cZejzoa+0CeOfOizmi8eEXLEwtHLLVpOZxM5G+slErwz4OIYskO+E7vEjD2p55HtGVqZCXFJ2J9ywqlUzI1zuaPtBB6+fRPmVQXKKteKxj4fOrIkdFRnj3hteIyHuMEBxNHT0BP3/tBw8Bcc3PWY57zi6rAHEJSSZPrbVyOXhaBx/ls0IWJ4TrJgU1I6BHpIFBL+M7R714KmyGrmlH66MmigjLxUyKeOTaa3BFaimg37xa++O07AQYBRBKJa/wHRf2F7YSK/AN1PSwU7HdTFHIynHzAhgVx4/0pupR247rQ8++Lt0c3SxEWmfFe2LVzmUuwjsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRI72FrlNvSOO5ZIthxWAHjK7iHUWsS6dvnexwB7MoE=;
 b=Khyo54x24dNGmp/KPU/af9rbXGr4K0IWYnyln2s43BMURBSt0kx4G910kY1oILtC24TXb17A/lGCfco4chJVTDZJtSLsCHkCxe/+MCYY+euiEzrcSoeA9Jh6fKcUN4J6BAkp/s8KG/YFMpeU/lu6EaJ0tIZMPFz0QPAaI1qumsk=
Received: from BY5PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:180::34)
 by BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 13:36:30 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::96) by BY5PR13CA0021.outlook.office365.com
 (2603:10b6:a03:180::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Mon,
 26 Jan 2026 13:36:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:36:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:36:30 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:36:28 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 04/11] amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries
Date: Mon, 26 Jan 2026 14:34:59 +0100
Message-ID: <20260126133518.2486-5-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|BY1PR12MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 46aa0e3f-8560-46b6-dd2a-08de5cdfea12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bWCCOXG+4bjOIubeS14ziBVhFmhu0S7b/aU6Y5o7HLw9DebBJSw3voJCXC+k?=
 =?us-ascii?Q?1fAfhvOQDzbuSAp9Y9/JJ67rsPWqX0yjm4R6YQCX4jv5zr3URKztGMQabONb?=
 =?us-ascii?Q?3K0Fwlgx9nkU0wQNMa956DquqdyH4mmvLo8ocoKIQP1lTP5DtUxCGO4mAlD6?=
 =?us-ascii?Q?VECxk6iCMXf+pPawTGRtEc7aVv6tKLywTaMWQ3OwVaxzZISyZrBxNvvl9mxf?=
 =?us-ascii?Q?Dv7S8MxJ29HStZYxS8JPdarsJb+TcCuuI5phxEykhk0RSNGRtpaNDjGF+WLW?=
 =?us-ascii?Q?c1gLjn76nkUhi6kQa7QKLdPzkQFM1fhJaGjYLguAAdQ7WunAHb5ekxZ7wmkh?=
 =?us-ascii?Q?QhbEyWlH7/+l/5KpmxGB4jJ7ls/rOt8nRgipbBqUhdwHnC/WZcyMttSWTyei?=
 =?us-ascii?Q?6+RC6ENm7N2NHADlaUG7StPsOdhqzHAcJRN42sGg4hTl6j6kyRggwTCd9+FE?=
 =?us-ascii?Q?qgbq+de7t/J2Uf6uucbXTiIdYy2Ou3yNP2B26mrrCLRxLsTL2E4FpgnWKa4o?=
 =?us-ascii?Q?I+3Q5VInfl5A5DSSkJMTUP87g7zLIOQ6meSvCpiEaoGRi/w1anbwS+k0erET?=
 =?us-ascii?Q?27XAVnLBZwamRNWdJmOfZM312h5tdc2Or1hkV84j2W2KaMYoKnfFykmA5Xce?=
 =?us-ascii?Q?axrvuua3kTLatEQGZwxOamkXxbt9WjkerTgjjBO83/l0VwRzssAnAzJXrx0j?=
 =?us-ascii?Q?eTI3HvMRWEWZvNiyCehOpey+hu+yHkRMRKqXWWcDM84Wb1sn+dJS02n8zadJ?=
 =?us-ascii?Q?J3HtdIfRZjs9NSb26Z9Pm62HpmorcXJPV4rF66oNUeY/YOv9FukfpQDSfrab?=
 =?us-ascii?Q?DfXQcRNQ2Srb59rV80jkvH/vJ09Ifv9ArW8Ww11/x40Y/wfzct8ijNbdrNzF?=
 =?us-ascii?Q?wx5JMHSwGQH3yT2W9p0Ro8Ywzk4n55fwZE3EGTohhrDDR/8OEW98KKYBq75G?=
 =?us-ascii?Q?4Ax4X3dlWEZbT9zi/lt8xO4kJ7tfzxMD656k7r/lXsp4yW7tqQKQLp4wi3Fs?=
 =?us-ascii?Q?Dbk4D4M8G868eyVv86TdvWUI/a3QOSyAtYarWLmWNjAHhSWI8IGeSJFVlhEs?=
 =?us-ascii?Q?R7+sCD84AB3H1ivAA16Hb9NCB8u4+UaKGZz0pBgMR4c9CfXhJIAy1p9C6h6i?=
 =?us-ascii?Q?8BFDgercZVCYRnn0Jg2Z2vhedAm+KOaHz/PivSI6XjAVB2CAQUrjoinIbIrK?=
 =?us-ascii?Q?GoG+o0AqtrRfPjvAskG56w1WPnt5uKxkgD8cHpTEKLNITowKySranB314iJw?=
 =?us-ascii?Q?dr/6klbVZ2HGAgg9KaKbZap8qW1XGPiF1NP6K+H+5iLee2y77DDhpYmS668W?=
 =?us-ascii?Q?qFbN8v0b/8krMJVUfcJtoLQxigVuPrZviznCUPGBFW7nsr6yNL6d2ajm0+vR?=
 =?us-ascii?Q?+zD1E37xL4oxJeDXeWa7hmkZC+n73rE1J5uIm/uE+orcJKVR376ru25Cbi08?=
 =?us-ascii?Q?v1zvXhuR8n4KqAueWcI6GHHrygaeXvM0wc3mzngzP9M0ZcVJ8SW2pDWxsP2K?=
 =?us-ascii?Q?lCIq9x/KDUBQ/HNaMnBJ/B6BdebXOuPRD8ovDAwNgp9C/CRU6N/Wtn5T29zu?=
 =?us-ascii?Q?fb3DGMA745/rHRYzwT76t2UwqcD24kMvdU0ExtQVd0LBjzOZ3WyEaY4M0V47?=
 =?us-ascii?Q?GL7sfWeKtLl6Piluc9iE8wROJoEbMT4sRCANFqdOf/ivG1++qBrZ93bDxgPv?=
 =?us-ascii?Q?zHXVrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:36:30.7021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46aa0e3f-8560-46b6-dd2a-08de5cdfea12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0D8288E97
X-Rspamd-Action: no action

Instead of reserving a number of GTT pages for VCE 1.0 this
commit now uses amdgpu_gtt_mgr_alloc_entries to allocate
the pages when initializing vce 1.0.

While at it remove the "does the VCPU BO already have a
32-bit address" check as suggested by Timur.

This decouples vce init from gtt init.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 18 ------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 32 +++++++++++----------
 4 files changed, 18 insertions(+), 35 deletions(-)

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
index 1c3464ce5037..a59d87e09004 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
@@ -52,6 +52,7 @@ struct amdgpu_vce {
 	uint32_t                srbm_soft_reset;
 	unsigned		num_rings;
 	uint32_t		keyselect;
+	struct drm_mm_node	node;
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
index 9ae424618556..bca34a30dbf3 100644
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
 
@@ -541,21 +536,24 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
 	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
 	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
+	u64 vce_gart_start;
+	int r;
 
-	/*
-	 * Check if the VCPU BO already has a 32-bit address.
-	 * Eg. if MC is configured to put VRAM in the low address range.
-	 */
-	if (gpu_addr <= max_vcpu_bo_addr)
-		return 0;
+	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
+					 &adev->vce.node, num_pages,
+					 DRM_MM_INSERT_LOW);
+	if (r)
+		return r;
+
+	vce_gart_start = adev->vce.node.start * AMDGPU_GPU_PAGE_SIZE;
 
 	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
-	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
+	if (adev->gmc.gart_start + vce_gart_start > max_vcpu_bo_addr)
 		return -EINVAL;
 
-	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
+	amdgpu_gart_map_vram_range(adev, pa, adev->vce.node.start,
 				   num_pages, flags, adev->gart.ptr);
-	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
+	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start;
 	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
 		return -EINVAL;
 
@@ -610,7 +608,11 @@ static int vce_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 
-	return amdgpu_vce_sw_fini(adev);
+	r = amdgpu_vce_sw_fini(adev);
+
+	amdgpu_gtt_mgr_free_entries(&adev->mman.gtt_mgr, &adev->vce.node);
+
+	return r;
 }
 
 /**
-- 
2.43.0

