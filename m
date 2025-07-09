Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10411AFE03B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12FF10E732;
	Wed,  9 Jul 2025 06:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ctmOYHZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19010E731;
 Wed,  9 Jul 2025 06:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhdlqBGsBK0h0NqRY1LynuuXucjobMuLIbPt/xmqxnciuOOFKFT/jtAGcsp77/YsdSciBa8YgFAoxKkdHcaa5g5qQ4H0VW71+iFM/fqUTgeuOLDdXSs9v0BJ0J7nZbt6lqY0wIRvCZ85bJI0MtONFuvlhU0HwhRBsDberu++KOb1lB91OoeWoeuBZbCASIU/Auxl/KR2CDdl99UVU9q7cZBz89FFZZwS6yQv4hGLMLl98dKfWZZ6Iuk3O5mxqvTeCJuLk9Wt7WKLNSL8Wk+N4T6aO5KhQfQZ6hmsxWhE8hNgWvnBxL4vSI69kHiByVebv1V42kTy8xX/k/FY+823Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoHTEnZKNxQwWmck8BFskTfr9fp6tbIxa6dAuUSSrZE=;
 b=X8ApNtr8qFSkxA619jPW5XFm8oAnwHJQ2qml15eqqGDPul9D+hisnkKhy5bRaPprrnC9HJLnqRxVy1TX2fGfnQkRKfeqARNkfkEddjk+Dl0j2pCUneG+pXkug2ggco9qcnHtnj/TBgprnDcxGPVtoO4MyFdgFW8KAXBDnOmMAugvyVPvDdIkJUFDQgaU4y05zAtP7tjor+M94WTppPQNonNdG/TG8f43cX/Kuyi2Cx6AiU7OQBplJVqi12TOJ9ZZlLkDM92M0+wQfdpTsooCpMOJNGqhn8Lj5j1EDzrFX1LB6Q169Z+8E/3jaL/+oEgbzvOgzxfh3a6zlfy6ljPbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoHTEnZKNxQwWmck8BFskTfr9fp6tbIxa6dAuUSSrZE=;
 b=ctmOYHZeHREIM3TlXi5VSeH1hJFUmx3Pzi/2tX7QGRqNkxsm+P6XXR/YiYUXqULBDHei1RVRnrjMvxEBLnW9JjZQTm6r/syAyuaIx7VC+Da5PGo7g9NMRY5mrXlk280Ty3m/jpMVlxiZl6KTPp9zHX47TKqu5Odxm9NzZ6x6/O4=
Received: from BN9PR03CA0137.namprd03.prod.outlook.com (2603:10b6:408:fe::22)
 by MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Wed, 9 Jul
 2025 06:44:29 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::d3) by BN9PR03CA0137.outlook.office365.com
 (2603:10b6:408:fe::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 06:44:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 06:44:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 01:44:28 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 01:44:23 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v4 2/5] drm/amdgpu: move GTT to shmem after eviction for
 hibernation
Date: Wed, 9 Jul 2025 14:44:01 +0800
Message-ID: <20250709064404.839975-3-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709064404.839975-1-guoqing.zhang@amd.com>
References: <20250709064404.839975-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: be3a26f4-098f-44eb-aa7a-08ddbeb40dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWFVTXVYSFVISHpPVkxlK0F1T3U0VzZJU3oyVnhmZWQrUDBjZ1lIMFQ3aC9h?=
 =?utf-8?B?Wm1ucm5nSGNEeWhSelRpWHR0YWdOdnNXSklDVEFaR0NiSWxtMnBhb09acVMy?=
 =?utf-8?B?UmltanB5V0ZzTmpKUEVIRFU5TnFCYlkwNFhMTTNDTkFzQmpLR2Mzem5yckx3?=
 =?utf-8?B?UzVPUkpndXNkWTVlRmJQWCtDc3VmcGNJaGZCUGFZeEFMQ1gvSlYwNnJERW8x?=
 =?utf-8?B?OE43VTI1OFU2OTF4aGJwTTdCZWc4T0ZRM3pHcTV0VWI0bGNpZVUzTzJDVG9K?=
 =?utf-8?B?RU5WanhsR0c2b3BQL0QweXp0WXpYaDZBR0w5dGpLYnpETGxsV1plMUlzN2d5?=
 =?utf-8?B?MkhsNE5xRVZMNVF1VEJlZERvaU5xY1NWZjlqQlIzcDc0bjlDVjZKWGdUM0or?=
 =?utf-8?B?ZmE2dGFLZm5EOExISG11ZzZqZEVEL2VFWjN4Vjd2RW1ZSXd2QXBYdHFSU3Fp?=
 =?utf-8?B?MUJhV1ByV2lwWkU3ZGpxZU9aM3puTCt2S0hTNGNkVjlNT3dUVmRwWWxWbGc0?=
 =?utf-8?B?TnpwMnpqUm8wbzlNWW9mamE5WDZzeUhqR0JERUNTQzA1NlR6T3l0SU05MVNi?=
 =?utf-8?B?MkRGVFhEeFV2M0hBY3k4VkQ2bHNqekRPbzNRN3VORTU1Qk9xUXZMclFqUGlX?=
 =?utf-8?B?aHNQYWdKZEpLcGxJYjZWU3JOem1BWHBNS3J3R2tQOVMvN3ZmeE80bTREdG1Y?=
 =?utf-8?B?Z0dscVZiNGVGZUhuRGVrMnI0UjR1OXFJYjc0WTJPNnhiaTNNN3BsMjlwRkxr?=
 =?utf-8?B?Q1N3clJGU1hlK2EvTERlTTBJNGR5SjZOUjNMTFNKbCtIQnE3bndDWHFaUk83?=
 =?utf-8?B?dnBObGVrRHFPMXRXSjVFOVFJOVNpVUxEQW13aThaeCtQaFRvd3k3OVlWNEZk?=
 =?utf-8?B?ZjVzak1SRGY1MXFMNGNqY1FLZkd0dFlsaG84OU5OTlVoZXRIbTNRWVZwQkMy?=
 =?utf-8?B?NHZ6OGJxUHAyTytKNUtuTHp0SmxEYmFRQUUyZHhTS2tvMzVmb0d0cmt6dTNY?=
 =?utf-8?B?aGQ0RDUyYnBoUmpiZFRLYkp1cys0dlJaYVF4U0M1akozTWJwZG1oVWNSVXFT?=
 =?utf-8?B?ZmZHN1Uvc3I4YUFTcU4rQ3JPYmFXV0VMRld4S201aFg2MGlOWnFGdlVtdkdr?=
 =?utf-8?B?UmNudFNFMlZJVGg0SUZlN2JhdjlrZk9JT3Z6TGMzd28vSlVHMzhyeEZMUzdY?=
 =?utf-8?B?VHlRV1k1UCswT1lsaFRBZHNEclJxeG1qWkhrLzE1bFVabElwVTRhVk1LYjFY?=
 =?utf-8?B?dEhNcGpkeDhJUDdmSXE2MXNCbUR0cWg4L0dibEtEQVR1bmVTd1Y3ajZ6Rmpo?=
 =?utf-8?B?bUtxalVKZEUwVmxUZU1qY09BR0x3aDdXOXN3Y2xacWViUk92SzZPelo4Ris5?=
 =?utf-8?B?RlFERXVOWWpxaXJIMkNDUXVvMzdnZFNxUjh5Sm1FSEREcWNMZEJpa2xGU2JQ?=
 =?utf-8?B?MUh1dG1ndGlWUmdreDdzWGdvTXFpUHU2dlJzeDNZQkc0dXR6blV6VGg5K2Nj?=
 =?utf-8?B?TDNoSkJ5OXV3c3NOMXBaRUpMR3FoWDZMTVJnNmkxbkhMaU5LWXA0QnZWdk5T?=
 =?utf-8?B?QTU5QVNLbDRnVC9NSnlGMTRzbE9DdzJIQldRbFFpV0xPVVBmQlo1RTVkdTM2?=
 =?utf-8?B?UEJlc0JBSzFNSk43bjVHalViYXFLL3IxSkJ1d05wRWE3K2hDb3FlUzlMWnJj?=
 =?utf-8?B?cVRiejRyeksxdnpNREVtMWtWandYUkNqU2ppNVgvWlVwNzJFTkdCdFF1azZi?=
 =?utf-8?B?ME80SmRldGlkOUx6dHYyTE5OZWlTMEI1WEFtOUVqZVM2aldpZXNMRlN0WTd5?=
 =?utf-8?B?bXVYbnIyS0ZMMTl0NkVhSlFXNlpPMTdOM3N3VG53aVE5cDV1YVdyc0hTMm1F?=
 =?utf-8?B?bnVqZW9iLzFUbUJDUW50V05lM284M1VkRTdaUHFLem0xSjd4bXJGOGl1TTZI?=
 =?utf-8?B?NWJaZzd1NUN0Tk92cDNYeDlzZzBvNTJDT21UbDdiald0Vlo5TjFiQnVEbTV2?=
 =?utf-8?B?RDFtV1UxaFk5ZHhmdzl5aFl2WHRqZjRQaXA4YXhCTEV6S0ttdlFJbS9xOEJy?=
 =?utf-8?B?V1hYcklqVk1pRGRDK3hlNDFFNmgzaDFKb1VoZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 06:44:29.1197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be3a26f4-098f-44eb-aa7a-08ddbeb40dd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
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

When hibernate with data center dGPUs, huge number of VRAM BOs evicted
to GTT and takes too much system memory. This will cause hibernation
fail due to insufficient memory for creating the hibernation image.

Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
hibernation code to make room for hibernation image.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 684d66bc0b5f..2f977fece08f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5021,8 +5021,16 @@ static int amdgpu_device_evict_resources(struct amdgpu_device *adev)
 		return 0;
 
 	ret = amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
-	if (ret)
+	if (ret) {
 		dev_warn(adev->dev, "evicting device resources failed\n");
+		return ret;
+	}
+
+	if (adev->in_s4) {
+		ret = ttm_device_prepare_hibernation(&adev->mman.bdev);
+		if (ret)
+			dev_err(adev->dev, "prepare hibernation failed, %d\n", ret);
+	}
 	return ret;
 }
 
-- 
2.43.5

