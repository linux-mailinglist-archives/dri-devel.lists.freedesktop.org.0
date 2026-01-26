Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMv5J9ttd2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708C88E87
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A88910E425;
	Mon, 26 Jan 2026 13:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gy3dVRWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013012.outbound.protection.outlook.com
 [40.93.201.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3743D10E425;
 Mon, 26 Jan 2026 13:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl0O+1YMHKsNcuXusqt80Re0DMPW6LxJKdUSQW+BwVW28Cf6DFvvdVr60dSQcmSFgFQ2NZy6UagYy7Jj8FIdYJM/wAi87EIxVDsbbvtfgnx4i322O8yVMCRMoH34IOa2GdwZA/SXHSFF/ox+zYq5rVSHkQk3GWRnQg8WfY9fQfOyq6FnvPkMCmEMHuswLmH7OibyVROzWURONl3ZpKBqQmTMA268+EmwFrmDfOWxu1wdA4gcZBL5lNbSiTwDSKXRz0uKPRSRO2o6QmpXrD8D5Cd/oZX+lrWXYRa6gxLTaiI4H8Ja7mFch4NTIjxALuUkBTtr7Q4HPWG5O90N/YddRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkAmAfPQPk2CNp8ztuG/QV9jlUEdXMbaa71Wtafv3M=;
 b=fd8hSHtvJvQTfrPeOrK24mM4JJl/qfMFXRZb9o+ZF7cWf3B2if9t7UMgf5C8SLkZk+EgHyh1CwUfGzZZXyugiboTiOB5/jtLKcuLaSH8OYEkuKlvU3meNqSmgIbP1UJfaL4sbOVKqlI5ycdpBCh188aIlLuKNrFvH9FRyg5AQUUN6+vdDgj9FS5P230FRrrFIw0K2vV/qNUeAy7tZSSnwhqpuDLckgja3xwotWVLwXDDoHEwmbXLYajnHsbecUpCgGV+vQHadYRpMDRZlpwZyxlfaku7B+T5c+vLcI7AnuYlW5if9o6+PmhWyLIYDhrmFqrjxy1tGm0/pEJi0zQTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkAmAfPQPk2CNp8ztuG/QV9jlUEdXMbaa71Wtafv3M=;
 b=gy3dVRWdKxQXsUr7gR1GJTIcqqy4qPTC//j3fH/DM4k1HZUaqKtgTd45B1JCGx0oeXLgJUco3pGxj9+FI4TM6lna63pze3w9Dv57LqjL98Iy8dR/YBuycqkp3GzXPbZj/iI6BGlJZcowDd8gGmVjOO6TrHECMoZ8G2hvuec0M3g=
Received: from BYAPR03CA0014.namprd03.prod.outlook.com (2603:10b6:a02:a8::27)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:36:18 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a02:a8:cafe::c3) by BYAPR03CA0014.outlook.office365.com
 (2603:10b6:a02:a8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:36:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:36:17 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:36:15 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 03/11] drm/amdgpu: add amdgpu_ttm_buffer_entity_fini func
Date: Mon, 26 Jan 2026 14:34:58 +0100
Message-ID: <20260126133518.2486-4-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f36c6ae-c2a0-494a-d873-08de5cdfe2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGpHQ3JTbi91NHdIdTFnQVhvNzBhTEZ3ejZabC9SV0h5eHFxOFB0aktDMkRK?=
 =?utf-8?B?U0Z2VUtGaWc3RTBEZDlwREFCdDV3b0RzOWMzRGMycWJXYnJ1S25CSFFqM1ZS?=
 =?utf-8?B?VG0ySHhNeDNIUTloTEpFeDlKWFhrbkdvNXR1aDArWWN0amRuUS9ibS9tTTR2?=
 =?utf-8?B?Ukd3SHRWb0FHMDd2QlIvUkxWSFRINjF1d0QySVA3clJmZ0toTm9mUHFKYzZT?=
 =?utf-8?B?WVlIR3p4MlRGdXJTd2RIbi9HRkJEZUxlamtkbFBENElCUG5JWmVOdHFXeGxv?=
 =?utf-8?B?OWhndUdqWVZyVllDa0ZyRHBtK1I5WFBQcTBSSE5OMW90c3VXVVV1WCt2c2JO?=
 =?utf-8?B?c0FwYWtmNi9wdE90UDAzbUorTUc3Ym1lRUFNbUhDTjBiaUVlNXFkSGZ1TnpZ?=
 =?utf-8?B?QVJSZ1JkTEp0TnRlNGVHMTNLbm1aZERIb2RkUjBGZTUzUkYvVllsL3A1cStG?=
 =?utf-8?B?K1hzLzF6SXpZb25nSHZVZHVJYjRFR3Y0aTltNElFd29TL05QSXZHLzZ1b1NP?=
 =?utf-8?B?ZGRQM2Vxak9hWmNoK01oL0IwRG5PK2d3SlozWUNqVVNIalpsNk03aEFCTThZ?=
 =?utf-8?B?V0tuQldFRnUzN1ByeS90WXJLRnkwTEUrT1lTQzREdk1acmtIODZqaW1NZTEz?=
 =?utf-8?B?SVZJelEvTkU4Z1N5d2xteHFwd1c2N0JiOWpvRXgzVXBDeHBvdVdwSStPTnc1?=
 =?utf-8?B?WlBaU3ZpUE9SSUZPd3JSd0FLZnFJenAyTUNEY1hyRDN6bmVpNmlqRXZnZTE2?=
 =?utf-8?B?WjM5OUNNRHFjQmtpaVBLR2RPeXVrSzBlZUhYd0hlU2grNCtFTTRPWnRlNTZP?=
 =?utf-8?B?M0ROWGMzTXUvazQ5dXJvNVRUVGFlckU2WFZ2R0Zia1ZvckdpWlpObVgrYmRI?=
 =?utf-8?B?WElyZnVXd3FQVS9Ocm4wTGVDL2kxb0lZNUczcURUZmVRV0o0dUQ1dXVkV0ty?=
 =?utf-8?B?SUJrWlpES2ZDbmhRM2RPZ3JjbjZMVTFmUjFKMGdHSlpuODBrZ2gxeDNVWUZu?=
 =?utf-8?B?MVppcVFzbUZtTEVJM05teFBtcFFzUjF1eCt5UXNLc3NPYk8vaGkvcVRUaVMx?=
 =?utf-8?B?TUNPVnJIVzNGQjdIV2xPNlZEbG8zUDBzVWVXUm5CNzh3S1dYN2FVa1Z6NjNF?=
 =?utf-8?B?UStRVGNsUE04SGF2Zm9XZDA5THh1WGhlNldnSDJVSDNDcDFOVHZycGxicjBz?=
 =?utf-8?B?ejNFaWlDUWZ4K1d3dWQ2azVtUDZrWU14QnZmYkE0NDIzTjA3NDZiRUVWTTIw?=
 =?utf-8?B?K3BOaE8xTWY2YllYQWZ3dXhCWHM3dUFwUGtqcEhzaEFWc0p3WXNkcUF5S080?=
 =?utf-8?B?V2hyS0NGWndtenZxOXVFSFBITWNJaXh0Y2FTTllSTndGYUtCWjQ5Z2xON25L?=
 =?utf-8?B?NkFJMTE0Zk10T2lWMWZ0akZYeVBQOTNRUnlvL0ZOdlQ2WUhqK1JFeVZEY3hV?=
 =?utf-8?B?R25ZdjhRc2pucTNuL3Q2TmwxT1RhcXBhY2Q0R0ZYa1lmY20wQTZZK0NYeXBS?=
 =?utf-8?B?aDRiWUhsT3dxT040cjh3dmdEQjlQRnRzRG9EWHNDelNkUUpqQzJzT2ZDbXZu?=
 =?utf-8?B?NGtVOU04dE5GaEhIdnFqczFjSjU3aHVMVXhtdytYSFVaWFYwWUtQY1ZxL0hq?=
 =?utf-8?B?K3N5djBaNSs0RHY3U1hwN1JFUWZBS0UxM1dHSFhNd0x2U25Kb2NIQnhLU2lo?=
 =?utf-8?B?YjZjTVhCbjYxYmQ5ZlBibXB6VHFVMEd6S2hrL2VOVUsvdE9xbzF0VlFhaWhS?=
 =?utf-8?B?M1Q1dFM1enFlaWdadnQ4MmRQbkVON3pSaVBUV2tSeEtOMUs5bVIrVlozZ1d4?=
 =?utf-8?B?a1dqTk9YLzBRRXJzL3IyMmdOVm5xcm11Zml4SHRNOFFWN202KzdVOENuTW9Y?=
 =?utf-8?B?YlJOdGhMUG5BYzJsSWo3aHNaQ3NuK3c1N3lFbTNIamUyZmF2Ym0zVDg5clBQ?=
 =?utf-8?B?VTlMSEFPN3NTaXJlR3lhbnB1Q2lQNzRObHV0Y1ZiSEFVc0htUlRtT2dxMFlk?=
 =?utf-8?B?ZHhhVXYyZFhKSjJXcy9IYmZZUUZpZVdjYnVJQ0Z3Zmd4NTVjOUxvemRaMGd6?=
 =?utf-8?B?Z1JWSXRKcGdKdzNscEdWcmlKaDJ1Nlo0MU1QOGlwVWdyN0RwM0dyTlJsUzJ6?=
 =?utf-8?B?dUxUQVpCUWpySlZPc216ckJheHltYXc4bU9uamY2clNsQ2NuMEJjWENBK1V6?=
 =?utf-8?B?aHo1ZjFHVkFyL3d5V2g4cEV2K3IxaE9USWJERlVxUVNNS0p4Ulc0dUV5WEUr?=
 =?utf-8?B?YlNzS0hhYzhFN3FKNU5yZUcyczJRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:36:18.3206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f36c6ae-c2a0-494a-d873-08de5cdfe2ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
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
X-Rspamd-Queue-Id: 2708C88E87
X-Rspamd-Action: no action

This allows to have init/fini functions to hold all the init and
teardown code for amdgpu_ttm_buffer_entity.
For now only drm_sched_entity init/destroy function calls are moved
here, but as entities gain new members it will make code simpler.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 73 +++++++++++++------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5850a013e65e..8b38b5ed9a9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2013,10 +2013,18 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
 }
 
 static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
+					 enum drm_sched_priority prio,
+					 struct drm_gpu_scheduler **scheds,
+					 int num_schedulers,
 					 int starting_gart_window,
 					 u32 num_gart_windows)
 {
-	int i;
+	int i, r;
+
+	r = drm_sched_entity_init(&entity->base, prio, scheds, num_schedulers, NULL);
+	if (r)
+		return r;
+
 
 	mutex_init(&entity->lock);
 
@@ -2033,6 +2041,11 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
 	return starting_gart_window;
 }
 
+static void amdgpu_ttm_buffer_entity_fini(struct amdgpu_ttm_buffer_entity *entity)
+{
+	drm_sched_entity_destroy(&entity->base);
+}
+
 /*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
@@ -2317,7 +2330,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	u32 used_windows;
 	uint64_t size;
 	int r;
 
@@ -2331,47 +2343,36 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
-		r = drm_sched_entity_init(&adev->mman.default_entity.base,
-					  DRM_SCHED_PRIORITY_KERNEL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
+						  DRM_SCHED_PRIORITY_KERNEL, &sched, 1,
+						  0, 0);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
+				"Failed setting up TTM entity (%d)\n", r);
 			return;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
+						  r, 1);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO clear entity (%d)\n",
-				r);
-			goto error_free_entity;
+				"Failed setting up TTM BO clear entity (%d)\n", r);
+			goto error_free_default_entity;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.move_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
+		r = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched, 1,
+						  r, 2);
+		if (r < 0) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
-			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
-			goto error_free_entity;
+				"Failed setting up TTM BO move entity (%d)\n", r);
+			goto error_free_clear_entity;
 		}
-
-		/* Statically assign GART windows to each entity. */
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity, 0, 0);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
-							     used_windows, 2);
-		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
-							     used_windows, 1);
 	} else {
-		drm_sched_entity_destroy(&adev->mman.default_entity.base);
-		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
-		drm_sched_entity_destroy(&adev->mman.move_entity.base);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
+		amdgpu_ttm_buffer_entity_fini(&adev->mman.move_entity);
 		/* Drop all the old fences since re-creating the scheduler entities
 		 * will allocate new contexts.
 		 */
@@ -2388,8 +2389,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 	return;
 
-error_free_entity:
-	drm_sched_entity_destroy(&adev->mman.default_entity.base);
+error_free_clear_entity:
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.clear_entity);
+error_free_default_entity:
+	amdgpu_ttm_buffer_entity_fini(&adev->mman.default_entity);
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
-- 
2.43.0

