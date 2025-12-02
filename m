Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C921FC9AFA3
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2628510E5F9;
	Tue,  2 Dec 2025 09:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jhpjnlxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012001.outbound.protection.outlook.com
 [40.107.200.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE5E10E5EB;
 Tue,  2 Dec 2025 09:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAwfYNMP45UDVUoz4/0N0BDCsjDFXyHXVeUSWibYhFrePXKJA4T1HabwDg6T3ucEqZNISh7u6pfSySYWX3zA7Wk6XVg/M/Vx/TpH5Ge1fl9Rspocg8bgML3xtT7SEvF527p7V8XyAFrG7UGWwrq0M26dU1Wgy12kMDdnuAA9yK0rI2lhMJ2FO3uin9Izo/V9BVdcXMjoBeK6glcLVS/Sdp7BKUkPJSE9p4xgz0sxq5BH46pBNo7xGeNosSWla0XfqnVluim3OH2/h6bySwBa93ba9t4mjPFV2/btPDXLXnva8PrXhqf0Jsx9FGSYWkguKod0oOBXG/r3Y5+hO3/AwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LGisU0K6PssBQAQsltEni5VummLOUVbizxcgh5+ueU=;
 b=ubHDW65DXSqBtu4GY9EgRrLeKl/7Zw9TOtLhz9sEbExpRWs2CwgOQxoLqZjS6w3Nbundgmp6ugYcnU1NOMHEEjPTEKZc66z7W8D6C8d/B1RTMQBmxss+K+owseL2DiWidfButNI7Bz6ZwLC385xTQCTLwP0KDfgyb+8zasnPM4roxghSuJbFITJCGCpz/7J/Hf7XmvSy8N6hw+X7oYsZC1QHXO3YFUrS6Ti6OSFcMz+QAVVGqj3s8W4vz/ciQNJOYPXivnYQncG+a5ZJ9shTeZeBaPqFGc0ky1Kb8JlKDXBmYPDgrIGnXCe4tRnm0iDssk4UhJYTpNbJi64IVRtmBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LGisU0K6PssBQAQsltEni5VummLOUVbizxcgh5+ueU=;
 b=jhpjnlxTgIcwkq/vp30rLNmS9FgtzNUx5EkUqjAZdNMdTPiRe1J8MPyxzHw9rcatHzdJup4YcoMzC/ZYnGPuw6n9a7O3eK2fwJBBuFRPnLmsBPbE5Ax+FrlOqaLBt0/Mjwp5lZT+0P1s5WYMKY5w+IGVatJdKC/awCWVdLPP7fQ=
Received: from SJ0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:a03:39f::12)
 by LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 09:52:31 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::9b) by SJ0PR03CA0217.outlook.office365.com
 (2603:10b6:a03:39f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:52:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:52:30 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:52:24 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 13/13] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
Date: Tue, 2 Dec 2025 10:47:23 +0100
Message-ID: <20251202094738.15614-14-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 66275f98-0824-41ec-48f1-08de3188828f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9pTZ+cKQxlQrU0Prv/m4TlIJ7jBkXuBX13qjhlNVGS0sokQ/Jp+yj4tmdZUt?=
 =?us-ascii?Q?H/h+SIxl4y/FnYog1AKbISWwEI6Z0X0igUFMUYbIfqwVqc2tn3KwlKgGJ3+x?=
 =?us-ascii?Q?hgcfh2EW8r0ryUTHdFImNBGBsd/AUcpWQL8mD84yPyRlbCWeho+hR0KbwcCO?=
 =?us-ascii?Q?ywqqialiC4SOb85fPi0wy3hxlLO2potfSV+JCxaMKBfgvYk8vaR2hF4f7Imj?=
 =?us-ascii?Q?FSKa+EHw20z3Zt3aaBX5AiL3+/Tm3wIW0tlZf9SeBMjQ+ezTAnfodvUtx73G?=
 =?us-ascii?Q?KG55QYB0Eln0hqFqwOkNjU3z6TlBw95FNnG5vPRK21nWgTM9Si1Bi5Zkr+xg?=
 =?us-ascii?Q?hnlem8SAsXtFbZkkZNuoraQnd0MXc4wqDvsMK2crQoSzj6KUoevB6RteC4br?=
 =?us-ascii?Q?yVmB5ttm3/tRtR4Pachyl50KTVmgeQG4UC6P/nhe1dK5JrvU6DOPltwKcNYa?=
 =?us-ascii?Q?k2G47ujbsFx/ZZdVbkMgLW/fM8/4+HqpHnzhR8IdwZmgmmyCyqW6UT5WFxOv?=
 =?us-ascii?Q?Chyto3FzdvE5LrKvVZSvQoY8Hf6mnPNQsvLTCP5zFOtFvA09WjTQzg3KV11J?=
 =?us-ascii?Q?ErAH/NwQbDK6X2kKiSH9Fr0KWY/5tk9I6Q8o5fbkeLeLGumhRgMFANaRSyvr?=
 =?us-ascii?Q?oP0bmLiLvDmn0jmblPEzL2B2Xccz1LXierSxXTwclHJ6vbuZeCzOphTR6+MU?=
 =?us-ascii?Q?dLpj+mYYRKLRbrOqvXKXHoZ4T91faR19nHKtz4deUow4TtFWHenUBR8rIei/?=
 =?us-ascii?Q?5jrRoZXL6CsJTsUVfMD4i1Yi3c/v35A4Z6nLJDjfhOpCfPn9whK6w6Um8Ez2?=
 =?us-ascii?Q?A33/eRf/jhruuVuDonpwEx8rT5anxDp9dWgIWbouKiZ+1vjkQPajXBimf+ym?=
 =?us-ascii?Q?xoF1Lp7QwbCdovJ4Vjhp/+r44zFbhrkSXzmptKGabU5bGBzFwDYSzoGqZBTH?=
 =?us-ascii?Q?N7z3zmOktV8kFoT6956M2LrGBgYmcN4fHlVuzI8UdA5zz7WTn2rZXug7A+2A?=
 =?us-ascii?Q?SQf0dd1yGxY/InEPUnoMrlfIE690vLU9kK8AamTG0tcWV/np/yuiPWInOI2P?=
 =?us-ascii?Q?IPWA5hZRyBIjM8q1vWLFRt9Bm78jH/BR5C2UVe+iXIVjXPzHhtLkl8A+0UBy?=
 =?us-ascii?Q?HLZajBY88iHYcNjq66jMgVAOa8p8oS0vVTCqxriVpEhK7bh4fXid4a1qzJ6L?=
 =?us-ascii?Q?zP9OWS9g5RIW3kv+Ch3ww1mihm3pDH8AubLbcb9W/xiVddnuyHLKyLDBo9Kf?=
 =?us-ascii?Q?q9xtMfzpj2RBZC+sAbiRA4BAaX/gB6PudNLhT/CPOzg42j1fpsUFo9agESBr?=
 =?us-ascii?Q?cV5GWa2Ngzk9t7lFO3gDDQJTTq69uzGzZoIcaMKGMJP/qFHRiQkvoqHi4GDR?=
 =?us-ascii?Q?QvUkJVP4qOgzIsEY3tZsuM8xBuQGWCbg34ePYu5JzXz+YfpR5I0HL1FS1IPD?=
 =?us-ascii?Q?rHR1Pl43bq01LErKzgHpSeaGSYWWzHHbwNuABL2XT9WBoTQVwK36OBNXuNfC?=
 =?us-ascii?Q?fehILbEVYcIPVP3z/i8c7jLCeh96DVwGlrMdjIcVRD0XrN6PldZ4Crhk8atW?=
 =?us-ascii?Q?G+dQV7qvc3NnXKQ6V2c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:52:30.7607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66275f98-0824-41ec-48f1-08de3188828f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965
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

It avoids duplicated code and allows to output a warning.

---
v4: move check inside the existing if (enable) test
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 54f7c81f287b..7167db54d722 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3309,9 +3309,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->mman.buffer_funcs_ring &&
-	    adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
@@ -4191,8 +4189,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	if (r)
 		return r;
@@ -5321,8 +5318,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	return 0;
 
 unwind_evict:
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 	amdgpu_fence_driver_hw_init(adev);
 
 unwind_userq:
@@ -6050,8 +6046,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
-					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
+				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
 				if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ad53789d0e2b..ef68c5f706d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2223,6 +2223,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
+		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {
+			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
+			return 0;
+		}
+
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
 		r = drm_sched_entity_init(&adev->mman.default_entity.base,
-- 
2.43.0

