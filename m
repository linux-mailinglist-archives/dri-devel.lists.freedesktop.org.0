Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEHZHDnNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99ECD7912
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230C210E5CC;
	Tue,  3 Feb 2026 10:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vlldAtih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D88A10E5CC;
 Tue,  3 Feb 2026 10:25:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhjIv247qrs7q4fORi6/6puI/XCLu9Q7v9bpg+wB4FIazoa6iJ8hzHnTthzvNjGqBiZkcKxevu80gD0bmhPvAKwfLoXegT4ND6sLz2l109twBPK4Xrxf8Umv/zxe098hqoADp0gmF0fWcZAAMLB1sHWGg9WmYoHEPNpWYQ7UHEguFZB+X0BYUA1Bhcw7KmtlAmGNOZyAOzEPBK8OkD2fhgUv+HeOdtD76CZwEYdcvdiKBZesaOOnGNt4AWdgA0EZ85tvu0VCL4xPBugUVgzdaYgn5zgvvSV32/gZ+XZv42LWTksIWV7vb+dC06eRQzQgGBkzejaoO231gT/02I2oXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjN+VL7IrS3L5GMRulRjDoqQK701AbGLDje8APkBY08=;
 b=NS4YiBo5Slo7UFDOt+6jeoKXUjjN06AYhPfJgJ7C9YgpJrgdWjNo/7xLWF8+kTsldC9HJ0XhDP1wi9YcI0y/eo3VzTDnLAHWP2DuQ1eNyyestQU0bMi4lBdVEvpFKYghR5ZmDihh72Ud6PqzCalKnN+8DytoAJ+dhGrzu04cCenluE46hbIniR17Fl+QbeeAN7kGQYO5FQpwmG5vjMab1vZLYz2+9uzMYE6VmpAZ1FnQS31dei9sITmInuGSwV9UlctI/p+cq8oDHUnh983RVs0PDAssZGtIHuCcoAMx3a/uScceqlO2m4FQR7S2mpiLNN0Xdz2uNAqrbWpHfa2ENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjN+VL7IrS3L5GMRulRjDoqQK701AbGLDje8APkBY08=;
 b=vlldAtihX172FqgQ37sNN8Zp4vovxulBSanTgcIEZbOiCCRoTOL2+IhY9TL1t4Sd06PY6CLU2HMjGRLenE7sEKoI3GUFLy2CTi7B5GMJdvJMcNXbfWWoB3NmPXKwOxn0gVj+F3nqA6Vn0B0dUQ72/YW2Z6kA+RIHUsyddatT9C0=
Received: from BYAPR11CA0046.namprd11.prod.outlook.com (2603:10b6:a03:80::23)
 by DS7PR12MB5789.namprd12.prod.outlook.com (2603:10b6:8:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 10:25:55 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::61) by BYAPR11CA0046.outlook.office365.com
 (2603:10b6:a03:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:25:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:25:54 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:25:52 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 03/12] drm/amdgpu: round robin through clear_entities in
 amdgpu_fill_buffer
Date: Tue, 3 Feb 2026 11:22:10 +0100
Message-ID: <20260203102236.3456-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|DS7PR12MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bda6721-8936-487b-6340-08de630e9d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3VhUHExS0JvZ24wZEdFbG93L1UySjV3VXlCd2N4TU5BN0xrcG91amtreUl0?=
 =?utf-8?B?UUhJYmJNZHY3TUpJdUF5a21KTmJlcnJXbU9KTEJmWTAwUXhHNm52QXh3ayt0?=
 =?utf-8?B?UmpNQ0t5WHo3YUJPekxVZ3JhYUZBRy9NTlorQStxV293UWtpbS9GWnYyV3Nz?=
 =?utf-8?B?aVZGME03UEJWOWVHZUZyVkxVTkFnQUlWRzdKVlozcGlOclNVR0dKVDgvUTVu?=
 =?utf-8?B?R2hBaERWUnRuT1lrcjcyVEZBRXNuNEtmeS9LcWdGODRJVW5CT3FNYVloS01J?=
 =?utf-8?B?b2FsNGVwZ0FYeng0c0FpbEtad1NsM2xlZjBpdmJHemtoM0VOdERDTDBjNFYx?=
 =?utf-8?B?SlNyS2FGYnRVZkhoZ0JJblo1TUZGb1lZUjN6bklLZ3pLVUV1ZEJRWDI4aERt?=
 =?utf-8?B?Sy9jeU00N095TFQvSVJ1KzcxNlBtK2J1dlJWckRJRnNOMG1Pa2J6UUE0V0F6?=
 =?utf-8?B?bUFmL2VsQ052cDQxT056TzUrY0k5bTVvRlQwVXVLTnBodEtYVVBiRyszSUl6?=
 =?utf-8?B?Z29Da0ExVzNZUS9tSlpleVB1R1F0bTUyMGoyYmJ1eUpGd093S3dMVzI1N2Vh?=
 =?utf-8?B?ckFoUlA4TFJ4WDhMSTVqMWVNVDZVUWNNZmNXK1VFcHZyYm1HUFRmSlBCQ0JP?=
 =?utf-8?B?NUFUbzlsUjdBUjBvNUcrdFBOSXRiaXYyVEk5dCtDejdvM0t5WWlkSEpLZ202?=
 =?utf-8?B?bjB6WjFPa0NPaTlWcDFDazZUVkxpcmY3LzdtSlJYU2VjajA1TE0wYjcreHg0?=
 =?utf-8?B?RnNPVmtNTGVRMHBMMDlmb3Z5MmxVVjZZQlFjWDA3K3YxS1BRaldYSzErNFZu?=
 =?utf-8?B?R0tIbGpWNFhIaFI4QW5SMTVCRTdxL3d2S1F6WjlvWjVzM0I4RGhnT2lHUDVu?=
 =?utf-8?B?ZmZYVUg2aUZqV3F3TVRMWHNGaCtvNXRKSmJXdjVqL1duV3lzOFdNeWFpVzFy?=
 =?utf-8?B?eGM2VmVQOTBpNVJxOUlhSkRLanhEMlRrVGpTMXRZQUFQaFBZSmorcXk3ZWV1?=
 =?utf-8?B?Mlg0cDlCQ1NrL1E2YVl5ZUFpWnNCM3V4ZldCNWd6WGNZOU5aQjk5NXZHdUU4?=
 =?utf-8?B?V3I4TmIrYjNCTXNyQ2pHaVRhMVN2Sk82TXZwbEZVeU5vT3o2eDd2VW5nNEZu?=
 =?utf-8?B?N05xeFNEaVlXaG5rWHd0amhHVkpPUEI0MVIvSE9oNkQxS2RZOEtZUzdRU2pL?=
 =?utf-8?B?bVQzVzdhL2xYL1Vyd1o0LyttNlpSRUE0OFNlVWFHREJXY2hWWWluczdWbWxE?=
 =?utf-8?B?YjBmekM3Ulg2a2NkcnFWcGkybUVKMzdxQXdCL0ppSnUzTjYvQVh6RUhsQXRm?=
 =?utf-8?B?Yk1BUUhzRG5BQk1DTlZOSnA3VkhOL09DLzgzREdSRTdPdTVFQXc0b0doUHNa?=
 =?utf-8?B?S1hUVXVKMzFZUUZvd0kzZ1JxK245S0doK1UxNzdRcWE2cUViVXBYVU1aVXc1?=
 =?utf-8?B?Y2hRT2tDamxIT1lVbkV3SFJIa1lsOTVjNEVDTmZwZHI0UWdOTmZvMGQ1MFE0?=
 =?utf-8?B?UnZ4ZTlwR1gwTm10YlRudi9qSXF4dXhFbkdmV1VDNXRUZU9uTHRZVHRRc25Y?=
 =?utf-8?B?R05tNGs0N0xPOXFXOXB1VVEwbHV1d0FuQ3gvWXJtRU5KYlYrYWNrd1lYV01u?=
 =?utf-8?B?eTVMVXh5TThybG5UTzVPMmJNbTVMS1pzTVVPd1VKUUhjL1VlL1hQMVhNR2hU?=
 =?utf-8?B?RWJOMy9SVGgwZm0yNXdrbzJOT3BNZ1ZseVRZb1RYcHJIMDBDazhjQkFkSFlw?=
 =?utf-8?B?Z1B6UXgzMHo4Qk1VSS82clkzNEg3NjhmVEtWd0ZTL3ZQS2hjby8xWUJ0WTBv?=
 =?utf-8?B?bkwvMkE1ZHBNQ1ZuYkoxWjFSRW9pVkgyUnVoS2l3TWpPbk5HQ01SR2JSOXRM?=
 =?utf-8?B?TlRvMzNjVlp1aERnckFlK1czN09nZm85WG42Ry96amtGbXFGSzVKNE90QWRD?=
 =?utf-8?B?RS9EczBQbVpmZ09zM0VzZ0ZzNU1vOEpZVUgrK1RZUWxrdnJLaGptRTZnTnl2?=
 =?utf-8?B?VkRuOE1POGFkSVlMVHVtR2FQZlRORTNhQlBFRE5USHFHZlozcjZlQ1BXRnBl?=
 =?utf-8?B?K2VCcjd4d1p6RHg5NUlQb3BaVkVFUFNmeXpEKzBmUEo3L2NFMFgrWUxldEth?=
 =?utf-8?B?T2s2SkM2emo3N0R6N05ZUjg4NFFlYXVlSWNhWE1WcVB5ZmZZZXo0WWVHeXdK?=
 =?utf-8?B?cFd2QmtLQkFvRVQ1ZHRDTGV3a3pCckN1MDgxaVlwTng2aGdKR25aOGxDakc3?=
 =?utf-8?B?bitmRXo5K1dvMW00R0VGMUYvRmxBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: slzT8ZxW08Poxk97VfrRG6ZuK1kmwfb5k05H82T2uvgsBEQ84g51OrchvC05JbnEciqfBQ6rO+RIDgwh76jr2u5lv1tbIJXN9l2g6XNskIoGBZJTJcMEjs+VlBo81/D3ER2QltulWGn2py3qhX1zUGhK0rbBajo/SYvINQO86xt+VzCbCQmXxTNWJhgVpAuhGUIDk/SZqT7VZOxEPEagOJPUrXDH+emoqBqccDf0tyAYUIlkEBnclm8HWYCQESApJI7i3xivA9h/3QFWawxK+d4jle6tdE6/5H7q5vIB+nzTKkkd+w95SiuRxQGKZy/p3w2r6rwNOMi8jdBIM3E7vuyKTjACiNcuFgB30HLXOix9sU4GTQ1Ja03iFAICToF3+v2/meKnhGwiKuiCm3g74DYCNRIPC9whv9YBXE9MOBuJJOXQshsWk/xPPEbvoFlY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:25:54.9019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bda6721-8936-487b-6340-08de630e9d25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5789
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
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C99ECD7912
X-Rspamd-Action: no action

This makes clear of different BOs run in parallel. Partial jobs to
clear a single BO still execute sequentially.

---
v4:
- check entity's validity
- use u32 for the index in the entities array
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 20 ++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  2 ++
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index bf98be8fd007..66c20dd46d12 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1325,7 +1325,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
+	r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
+			       abo, 0, &bo->base._resv,
 			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 75cb354084a0..56b4f560ea7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2380,6 +2380,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		adev->mman.clear_entities = kcalloc(num_clear_entities,
 						    sizeof(struct amdgpu_ttm_buffer_entity),
 						    GFP_KERNEL);
+		atomic_set(&adev->mman.next_clear_entity, 0);
 		if (!adev->mman.clear_entities)
 			goto error_free_default_entity;
 
@@ -2653,11 +2654,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	struct amdgpu_res_cursor dst;
 	int r;
 
-	if (!adev->mman.buffer_funcs_enabled) {
-		dev_err(adev->dev,
-			"Trying to clear memory with ring turned off.\n");
+	if (!entity)
 		return -EINVAL;
-	}
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
@@ -2693,6 +2691,20 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	return r;
 }
 
+struct amdgpu_ttm_buffer_entity *
+amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev)
+{
+	struct amdgpu_mman *mman = &adev->mman;
+	u32 i;
+
+	if (mman->num_clear_entities == 0)
+		return NULL;
+
+	i = atomic_inc_return(&mman->next_clear_entity) %
+			      mman->num_clear_entities;
+	return &mman->clear_entities[i];
+}
+
 /**
  * amdgpu_ttm_evict_resources - evict memory buffers
  * @adev: amdgpu device object
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index cd24ca851b6d..cf32db3defb1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -73,6 +73,7 @@ struct amdgpu_mman {
 	/* @default_entity: for workarounds, has no gart windows */
 	struct amdgpu_ttm_buffer_entity default_entity;
 	struct amdgpu_ttm_buffer_entity *clear_entities;
+	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
 	u32 num_move_entities;
@@ -193,6 +194,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct dma_resv *resv,
 		       struct dma_fence **f,
 		       u64 k_job_id);
+struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
-- 
2.43.0

