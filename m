Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBF2NEl+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8571DB18A4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C571510E891;
	Thu, 29 Jan 2026 15:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cbubDpqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CC010E88C;
 Thu, 29 Jan 2026 15:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKqBuuJPRyppRpoNvvKHWpNe4rzPyNTtfwiE5LaeRBkqybqSfs0m0B2WlIuRnpWshZTE6xOCCMZ/Fq8YTRqbQrgdzzjLeOxeJYDHxYVuhZ85MN5Zh6FINMT6hGeFQCAUHzPRxxeNQY7pVDvhuU/RDHuqTzkt5MhtPSP4Wx6Z8tF9YEVSf+1xZBfEGwleXcnAAIdjoo3iAovA6PY4uz1q6H/QAq986Y0hQF2GQum5nJs9mRfPOfPYD8COU6a00fCLtNjC/vrCLZngV0hZm/M8Qon2UryuZLRAxZ6asN8vBtVPtHjQlseaLf0voW0rwU6tH+8y13FMjJJvY3aLzOOXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCRMymurEL56VHpvC8C4h6pA7qYjuNASTtWdj+6dvZo=;
 b=y/7U1XcBDTHtUzImocC4lKVRSTNcPG3eL9EoJ2a/evC4l+1aCpZCn9lAfPCzi7V/7bOt9PSMxWeaH6TZZWwnK0QRI8D96mwtNnZf0LAqxKpbTvIM0r8NMmG4CfUEUatzUF7YQ5jX/02h0osm3buGiibr1ZRKqKAUgUNOXLIU2E28CAtYkqFkxbJpo26V6oFGY8BqIR3AI16jIHnP4WsIFK/CLXbSfH0rISpsIebMpZNGpPvpVGh9NIEZ+myP0Ux3CLCscBxmJANeonXyvxWKyMZf2Y60TIAHUjcnEz711/SfXSyvNjelDVmWrT+8rEe1I+EfRd+XhGd/VPFxZ7tIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCRMymurEL56VHpvC8C4h6pA7qYjuNASTtWdj+6dvZo=;
 b=cbubDpqVRqO0COnSja8T0eznJDmMdxq2r6LKmVZzYfoOfoP/3vWeSJyNpYKTT6Ae6N9Ps1VvETiklrBXDofLTjYAZdeoPApk79NiaZK3v6N3KDKnHJh2W3dMhW//28J8yto2VZ5dB1P4g1eoE1nKwIRTo9+W5QGdxkXKG+ZDhtU=
Received: from BL0PR02CA0110.namprd02.prod.outlook.com (2603:10b6:208:35::15)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 15:35:29 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::ab) by BL0PR02CA0110.outlook.office365.com
 (2603:10b6:208:35::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 15:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:28 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:27 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 09/12] drm/amdgpu: check entity lock is held in
 amdgpu_ttm_job_submit
Date: Thu, 29 Jan 2026 16:33:21 +0100
Message-ID: <20260129153336.7473-10-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: da343d98-6ab2-41a3-69dc-08de5f4c0802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnRDRGlheUZNcVcyUFIvRmd2S2Y5dnpHTnFZMVpBN1Q1dUF3ZVN2bnk3L3BI?=
 =?utf-8?B?eXNWT2hyMndLZFlaM1psK3RsNlpGazBWNG5vRUVsU2Vaako1bmJZWjBIZ1Zj?=
 =?utf-8?B?Z1RpWENGMTFVYVRPUjR6cjVHa3RudS9OVHVOOFFtVTVkR1haWWtkS1JsTFUw?=
 =?utf-8?B?QXI2RHNsak14M0h1ZUtZdGphZnhCU2FVUGJ6SjYxSHNZRWIxeVVFcXViS3Bw?=
 =?utf-8?B?QXltYVQxQ3FZdDJxay9UdjQzMDlIUjJ2dzBkSnJOeVo1NHFlN0ZFblJGTmxJ?=
 =?utf-8?B?UXhTU2tuS2xhRWZSRHU2RFFRd3RkbUlhckY1U2dxaWNCSzRWbmlQL1U5R0hH?=
 =?utf-8?B?bnNTOGhRUzV5cXdoUVh1b1BCSU1YNHRuQkUwdDB2YzVCdk1PWHFqbXFPYk82?=
 =?utf-8?B?YVRiRXpBaGhaa1FIaFBvd2NaWktVazV0Uk0wNVRubVRDRXMrVmpIMmcvQ0Q4?=
 =?utf-8?B?NU1XZ0VvNmtmbythU1h5ZDF3dytFOS96VkVaTkI0YnBXRzRqY0IzUXU2R2pz?=
 =?utf-8?B?MlB5Sk1GRGErcHUrOHNxUk1CWUQ4VGxBWDAzQ1F4TTk4VnRySzBZaHEzK3dR?=
 =?utf-8?B?cFRoL1BoVXZNa1FDWmJrREtHQXlFd3c5V0ZIK1hYaEQwbUFva3JUb2NyYVdC?=
 =?utf-8?B?dUwwNGVQM3BBVHBibGlGcVplcGRmUXJndE9VQVREd1VlZVJNcmlJMDRYUTU0?=
 =?utf-8?B?V3RZNkJMNnhxaTR4K3NNTFFYZVNVaGpXcGpwL3ZCWldNczYyT0NRVFNIZFlI?=
 =?utf-8?B?RmFvcFpDYXAwd3VsRjU5Wmdrb01MZHN5ZExoSlF5d2RYZDdBL2lmcFRkUXBz?=
 =?utf-8?B?U2dZL2J5UVQxaDNoK2dwNWloMzZ0MFFxcGtxK0wzTk0zVXU0UnZ0OWo1QlRy?=
 =?utf-8?B?UTBOQ2Z4TDRmUnIwVjBncjdLU0dhdFF5dnpjZUVRZDFOdVNCa05rQlc4OFVm?=
 =?utf-8?B?QiszaDJTR1VrOTZrTVBJMzJmL3NTNDFJTWRIUGlDU2hydm9vWDc3di84M3dl?=
 =?utf-8?B?aHdaTllZY0d6WHBLVFpjYzNuWVpFdXlNUTc3QmYwcm9FUkxuRTk4UklvN1Zo?=
 =?utf-8?B?eklWd2lBMmlQYXY3RmxsQ0Z4ZUF0ZDBidEpmMlJ4Nkt3eHBQSWpnT3hkdnU4?=
 =?utf-8?B?MFUxRExtVFNlTGp3YUFpNXg2bW1rVHh5M3Rmei9zVEhyaHNzSWhZQkZmL1Zm?=
 =?utf-8?B?UVpFNS9vR0wxc1FwdTBFM0ZyVmxKL05obURJZStyRW5hZStHU25VcU9RNVFr?=
 =?utf-8?B?TnJzUDhjblRHTG44blJaZkg1N3pZbUNPOXBkL3Rqajlzd1JMZ0JJT3VzSUhj?=
 =?utf-8?B?SHM1K2hydFF0TXlLY3o3NWFYYzJJYm40SXpxQnVPV1l1ZFRuc1hEOUV0ZFUr?=
 =?utf-8?B?b2dRam82WFhjNUlQTVhBdFVJeWFnczZDaG50ODJSVHJzV2JoTkQ3R3B0aUtF?=
 =?utf-8?B?KzZkSHdja28xL0NOR3dOYmhEMnkvOFYrRVNyUlVacGxmeTN5TU8vRFZKbWgv?=
 =?utf-8?B?K0w5S3RFUERpeVZDeWJRUDJnaGdJNmhiRW5GS1E0aFhLYTlEanJCZksvd0M2?=
 =?utf-8?B?eE1VQzEzeitwKzZiZWlhOElkOEJHY1gyS1daTnR3d1lwcUxycUJhWVNXR3o1?=
 =?utf-8?B?ZE9tN0NYQUROeThMaVFlNnhZN2R5R2cwK1R5SUtXand1cjRmb0t0MExKaVNt?=
 =?utf-8?B?L2kzdHZCalhKc0JZWWdGaE0wdURkYnltbTlUNisrQm44ZjIxRENYNVYzR3pi?=
 =?utf-8?B?a2lqTG1jSlhsNlI3U3hjUmtNMHY0dkJqblhNMUg0Tm5ab2haT1Ira0hBbTIr?=
 =?utf-8?B?Mmg3djkxZHRZNThHbDBuazExN0xPL051U0JpSG91VW0zRmw2QWcxT3pKaVc3?=
 =?utf-8?B?K0x4VjFwUi9yY2hHbUNxVTF0YWFGci9BL1FlUG50ekE3cEFEVlc3UGRPbldR?=
 =?utf-8?B?MVlhRCt1SzFFcS91VDBKaENYeTREcGtpVlpOVm5mZjFKa1RmZzdicStaTDVJ?=
 =?utf-8?B?YkFQaHVCSG90bFZhTU9RMWlrMWFOeldXMUQ0UEJLNWhZOHB3SCtHbFY4blVm?=
 =?utf-8?B?MUlQZmx3UUtyRkhhaklMQlhqMVcxOVp1MWdnMlphQUtDMTVlQVpRbzVGY25N?=
 =?utf-8?B?SUxVRE1GUUgrZDJlYmtjaDU3RnU4YndqK1Ftcm12VlBsbzhoNjBDeHVRV0g5?=
 =?utf-8?B?RFNkMkY1UEZsWkUvK3pjd0Z2T2RTbk11UlFtaGJ4UmYrYVRROEV0cDUyWUNl?=
 =?utf-8?B?TFJXK1g3UnE2cmlkOGw5bld4bEN3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZKR69h2PVWazMCM47quVu7sabvaZR2OMvXs77VIjyxw2SDzOjDZEIBY+84qkUzdJLZXXX1CzgGDCnExxgR3D2efcf6krpqZY0liqV1J8MOQln2IFVTyYVA6eJLHOGR0FW8C7a2iopslZ+DgNg2MIQNswXkHl6OXN6TWBOm/b6qQPmZWtCFhZmPL6y8EvaW5yccMnrbcXuScnt6Sl2GpCqGb2DJOlDqf6YOeMFEgBRyyrFLdaCY0MOy772klfCS5Kq6tFzJFLwvo1iV0qg5Hhd88UFAq9anQglNNJcMoNvwtULH4o+ZUV33dzJvOjb0JVJvHyxTZwyhS+nxzZHxV9QwxTCgysp1EcaPtDZNpn8At4NMdbntd+0ANRO7TeyclJY2FOXD9yoL7JIt6KCoysOt2owMuv7w0CngIkvpm9RTHg4l9nBS7QIIAX4nBrsYks
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:28.9282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da343d98-6ab2-41a3-69dc-08de5f4c0802
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 8571DB18A4
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
index 432bb2839dcf..7eaaf5d4db94 100644
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

