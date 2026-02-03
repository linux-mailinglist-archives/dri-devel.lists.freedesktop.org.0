Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBgaO5bNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:27:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF5D79AD
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A8F10E5F1;
	Tue,  3 Feb 2026 10:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B2xXfYzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B923C10E5F2;
 Tue,  3 Feb 2026 10:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6tcWjtF/ZvN8Lmj3NFW3uSqGONfCUrassT5DuZ46olXcsFPP5IAeE9cAD1eXo31assAcnrwomZCnFY8SWzniprbjDpHWrEWhMLBqAn25LnXCm08Ec985XOGsfDXs+L8cufE/usWb1SIu9RGVPXk5Wa/8GFpzJm1ZICWwaMDoZJLJcnpL7Oanbcysy8zkX6M2YHQnvMCJ2dUnp06xRtIyRmB3p/za4bvC+gnscSYrOCQ1JKISMXAjJKOSOdSf0AwC5w6sHU7rNAW+i4z018Iw+v2riHsEEMVDTrfuFD0wpjxtxCxt0uscq/flTTgN3oDTHHdt0cloywuvuaI2VzAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJs4j02XAu0sh4oGdaCXgEIrknUzsnh1wb/8snS1ON8=;
 b=DSbYlqqhLTXQbOPA1Or5axFLoCuf1RpG729xeH3Uxj+OMJd5KAC/VHfUpGcIV+Ln9DETSeMx2DMBppD0vmOh+/x+Afo0C+Qcsie9R7g2OsmddbtMfjaKRtnGbJqoz7DU9WQej12SEa8/jmfphWVyyAxtkr2zs1V52KHemo0YSKKVXSRc5vum0SrbAkaAMP950KfQPFQNFXuSFFe8DugHLbiBnYDOawI5NCRzt4kKOZQAduxzO4WN6f3P9ricPXqcrukzgu4EvBQjZfm/yrYZ7Ne9v2WI9bgHHUgJI+0o73M2CkGs7l7rLBzrnL+M20fk+6BY/KQ9JwbeyaTeRrDb9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJs4j02XAu0sh4oGdaCXgEIrknUzsnh1wb/8snS1ON8=;
 b=B2xXfYzj8DutgroC2a5mAs81V2YGG5DA9yh1yDmb9LbPEyCpFLASY774Yz+nK03fTucw8qiBjDmUOX/HsrHrT1CSiF894nwXtzfMjSR6ANGBBcpjEYCatIV/tL7OjYZo+xjtAfKVjGYUi/7OwVCq3gtlL2hr+JVXUSNR1c9NKBk=
Received: from SJ0PR13CA0065.namprd13.prod.outlook.com (2603:10b6:a03:2c4::10)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 10:27:26 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::2b) by SJ0PR13CA0065.outlook.office365.com
 (2603:10b6:a03:2c4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:27:25 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:27:21 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 07/12] drm/amdgpu: only use working sdma schedulers for ttm
Date: Tue, 3 Feb 2026 11:22:14 +0100
Message-ID: <20260203102236.3456-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260203102236.3456-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: b166ff29-d80f-42f9-903a-08de630ed332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qtMO8IqprMKsR/2KknCljHFvXOkFS8vq7b2H9zPKr4T/iOMK51wgwNnB6hK2?=
 =?us-ascii?Q?MSCvmj1htvgCXqWOGgALkYhkg+v0f7cwi5s/AiYwPUZfCgXg38uEm/TTWwEf?=
 =?us-ascii?Q?3Dqn4sUOSuuvSPDeTTc660iFTm3cTeIoooVtBf+LlSHaDm6IcgqFbOpwUZd6?=
 =?us-ascii?Q?hinUF9RzLhrF0k46lkxUcGNPxGaVI3luZWe2D+Bo0V9zfVLNoFlS6UjQ9MBE?=
 =?us-ascii?Q?tueFI7snLYqJOo2P8Kzf/mj2HxHZBgH9UaMpq8JnT4C1K1PhOrioE14oGh9U?=
 =?us-ascii?Q?Jyin6EYQnvCY+deLyDMUsatg4eAFLQBdmHX8iPY5zs5y61eFEI+/YwsIKA3D?=
 =?us-ascii?Q?qSokBvyB6MaI3n84RVc/6mJnHpRud7HEhHmaHeLAvRjJqBVmJMRFeCDln0df?=
 =?us-ascii?Q?QlMQh6K43VbYZK+Qk8TVxv7ctHPcC9rUn3drLqPA1tajztNAvW8x22zXUJ+5?=
 =?us-ascii?Q?A/dF6fIWkzah9cCZR08fFlhw+f3ssU4jRhc1pl6n8vvto1gNGW38h6gOSQG5?=
 =?us-ascii?Q?QVirdfVfB/bIeRZAvbVIb4uiivYZIXq8PTZyUo+sgwHlKWHaYDfs6UMxBrz/?=
 =?us-ascii?Q?dn1a7e+sE4qo0ZeSgrLF7tHX7ebyTHEWiynijamna5ns+AL2Cpqgb3PyQRbJ?=
 =?us-ascii?Q?QEmV1u3qqwxso7BuvQtiPi90GnIbw9dFmsowzEnlWss3hiJojYKXF5Q3rQVK?=
 =?us-ascii?Q?MLe6LJhMFstAyghCiBhbpZhXHRM8tV5PhCbTzagWuo3GXXgfdaw+L01a4TYb?=
 =?us-ascii?Q?RvgBlFRxOFD4rK2RfaCXYGtOUyxEuxsoUruTIUnntMRXzYbnffgmIxDUw6Hi?=
 =?us-ascii?Q?gWrdUjCV4p7FEQfqqc28vl/Bf5gy2Zx1JPa3Q8Eq4LSxSjqQw3m8Jf9HRz81?=
 =?us-ascii?Q?7QArsqrjZUSjRngs4wzcf6d5LyCLr/+8yeIXv+shkLW1ZYaw2/JOgDq1gwjH?=
 =?us-ascii?Q?UcVVDTG5ClZDFYcijZdsdhe30jgVsOkQrgQFTh4R/rPlouwqtb4u/MR7vW2p?=
 =?us-ascii?Q?PFGtG8kf+ShSrp4vYqGdZuC3F75GMpcansJD/duECO+X9IMJyjAQsSbe46dg?=
 =?us-ascii?Q?ncGDvY0K9X6lML+HSKxgKo5ukBzE0NyNFjV5DsxdRuJ+aPGWDWY/OF/soFVK?=
 =?us-ascii?Q?VWGhFw8ggWv3B01ElXJZHK7w+Bbk1THuXSwxHLF8qRjTRceC6Y6t137MC9Zh?=
 =?us-ascii?Q?EKwrWAKS1D+tNE7F3L+guEJBoyLb84jwR2uEhy9m08m3bHSquJ0Zs96m8WW2?=
 =?us-ascii?Q?fZsqeJDwv2OwU92dWIGCr56SP93hf9wBOm+YEG7fnXopcplc4gC/z5mUWjYe?=
 =?us-ascii?Q?2MfAcudMZEy46Ch3uC0eJ+h56krbAezdac/TuzIXIlRS+joHlsCMvH317MKt?=
 =?us-ascii?Q?iVOujRNCsr3yhrrFP10THyd6EqOnyZOxieKj8uxdgxcZI3L1Vud1e4l40ex/?=
 =?us-ascii?Q?wF6fvxAsOipb7flrZzIk3C7ZVEh5UPRlNNmYf10sCD4fTIXGT2Dz5VMk89vk?=
 =?us-ascii?Q?9fGLc/l0osVmvVzPcN9lQMbIj8/GaVBRBdxSXYV48T0mtiEFpyBALFBU2k0R?=
 =?us-ascii?Q?totunVhzSGOirdh10RXox7nbf5kM9aHY5N3h8TjKqGl78ei4vWDTdmDLmGTN?=
 =?us-ascii?Q?mr5a2aJIKHE0FIIHHIhTtYqbvtB4fJJQgcUennCBG81v8j7Nwvy3mwK0pDHc?=
 =?us-ascii?Q?MUngPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oHaH+HYmzDugJnDKuHwwBwOW1ol2fH2x54tC0xs0JUB7eF+uyRnGsi8ZL3KWxj3LlPmvDywApFGkOe9koUXubYFz6kKxlfVa/jiwHbxFuIALnGFyKsjxrqC8bsmM27xDaKQBQ7RPwvsoU5VofjPjeJGS9dcVnO3r+2k9F0RpJfQj4veeiauOd0/wi1a7p8U4tBEXsu1qEHOsJWURq7lSTES0lwLNPO5wqMBgz6kVbf1+r58knfR5obAoPSWcYAIQtF/qN9O0GjlEUcergmU9RXiJ3kG/tXPwaDcKs5EY97yAa3V2RrSrJCS3sTGqMgZHFxV1MeTg1thKRJOdjIr7L294vUtC8RD4yuXPUf/a6MnBzFtH2V7U2kZtd5eZTBEWdKqbj7SRcdShQSWeRRQ8nUYmzaHSqM5spRQNiTCUJ68E+z48jKuHI13vwhi7Gz1Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:27:25.6319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b166ff29-d80f-42f9-903a-08de630ed332
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9DCF5D79AD
X-Rspamd-Action: no action

It's possible that some sdma instances aren't working so we shouldn't try
to use them from TTM. To achieve this, delay the call to
amdgpu_sdma_set_buffer_funcs_scheds after the rings have been tested, and
then use the 'ready' property to decide if a sched should be used or not.

Note that currently it's not doing much, because if the ring helper fails
for any ring, the whole sdma block init fails.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 21 +++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    | 10 ++++++++--
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   |  5 +++--
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   |  5 +++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   |  9 +++++++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c |  6 ++++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   |  6 ++++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   |  9 +++++++--
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c   |  9 +++++++--
 drivers/gpu/drm/amd/amdgpu/si_dma.c      |  9 +++++++--
 12 files changed, 67 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6df3a4659172..4857b5abdfa5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2361,8 +2361,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	if (enable) {
 		struct drm_gpu_scheduler *sched;
 
-		if (!adev->mman.num_buffer_funcs_scheds ||
-		    !adev->mman.buffer_funcs_scheds[0]->ready) {
+		if (!adev->mman.num_buffer_funcs_scheds) {
 			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
 			return;
 		}
@@ -2744,20 +2743,30 @@ void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
 {
 	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
 	struct drm_gpu_scheduler *sched;
-	int i;
+	int i, n;
 
 	adev->mman.buffer_funcs = buffer_funcs;
 
-	for (i = 0; i < adev->sdma.num_instances; i++) {
+	for (i = 0, n = 0; i < adev->sdma.num_instances; i++) {
 		if (adev->sdma.has_page_queue)
 			sched = &adev->sdma.instance[i].page.sched;
 		else
 			sched = &adev->sdma.instance[i].ring.sched;
-		adev->mman.buffer_funcs_scheds[i] = sched;
+
+		if (!sched->ready)
+			continue;
+
+		adev->mman.buffer_funcs_scheds[n++] = sched;
+	}
+
+	if (n == 0) {
+		adev->mman.num_buffer_funcs_scheds = 0;
+		drm_warn(&adev->ddev, "No working sdma ring available\n");
+		return;
 	}
 
 	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
-		1 : adev->sdma.num_instances;
+		1 : n;
 }
 
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 26276dcfd458..120da838ac28 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -939,7 +939,6 @@ static int cik_sdma_early_init(struct amdgpu_ip_block *ip_block)
 
 	cik_sdma_set_ring_funcs(adev);
 	cik_sdma_set_irq_funcs(adev);
-	cik_sdma_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &cik_sdma_vm_pte_funcs);
 
 	return 0;
@@ -1000,8 +999,15 @@ static int cik_sdma_sw_fini(struct amdgpu_ip_block *ip_block)
 static int cik_sdma_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
+	int r;
 
-	return cik_sdma_start(adev);
+	r = cik_sdma_start(adev);
+	if (r)
+		return r;
+
+	cik_sdma_set_buffer_funcs(adev);
+
+	return 0;
 }
 
 static int cik_sdma_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index c6a059ca59e5..93ec52c1f367 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -828,7 +828,6 @@ static int sdma_v2_4_early_init(struct amdgpu_ip_block *ip_block)
 		return r;
 
 	sdma_v2_4_set_ring_funcs(adev);
-	sdma_v2_4_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v2_4_vm_pte_funcs);
 	sdma_v2_4_set_irq_funcs(adev);
 
@@ -898,7 +897,9 @@ static int sdma_v2_4_hw_init(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 
-	return r;
+	sdma_v2_4_set_buffer_funcs(adev);
+
+	return 0;
 }
 
 static int sdma_v2_4_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index cb516a25210d..3fde9be74690 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1108,7 +1108,6 @@ static int sdma_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 		return r;
 
 	sdma_v3_0_set_ring_funcs(adev);
-	sdma_v3_0_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v3_0_vm_pte_funcs);
 	sdma_v3_0_set_irq_funcs(adev);
 
@@ -1184,7 +1183,9 @@ static int sdma_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 	if (r)
 		return r;
 
-	return r;
+	sdma_v3_0_set_buffer_funcs(adev);
+
+	return 0;
 }
 
 static int sdma_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index f234ee54f39e..a5aaaec02dcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -1775,7 +1775,6 @@ static int sdma_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 		adev->sdma.has_page_queue = true;
 
 	sdma_v4_0_set_ring_funcs(adev);
-	sdma_v4_0_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_0_vm_pte_funcs);
 	sdma_v4_0_set_irq_funcs(adev);
 	sdma_v4_0_set_ras_funcs(adev);
@@ -1961,6 +1960,7 @@ static int sdma_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 static int sdma_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
+	int r;
 
 	if (adev->flags & AMD_IS_APU)
 		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_SDMA, false, 0);
@@ -1968,7 +1968,12 @@ static int sdma_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 	if (!amdgpu_sriov_vf(adev))
 		sdma_v4_0_init_golden_registers(adev);
 
-	return sdma_v4_0_start(adev);
+	r = sdma_v4_0_start(adev);
+	if (r)
+		return r;
+	sdma_v4_0_set_buffer_funcs(adev);
+
+	return 0;
 }
 
 static int sdma_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index cd7627b03066..ddc08a0e9f28 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1368,7 +1368,6 @@ static int sdma_v4_4_2_early_init(struct amdgpu_ip_block *ip_block)
 		adev->sdma.has_page_queue = true;
 
 	sdma_v4_4_2_set_ring_funcs(adev);
-	sdma_v4_4_2_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_4_2_vm_pte_funcs);
 	sdma_v4_4_2_set_irq_funcs(adev);
 	sdma_v4_4_2_set_ras_funcs(adev);
@@ -1568,8 +1567,11 @@ static int sdma_v4_4_2_hw_init(struct amdgpu_ip_block *ip_block)
 		sdma_v4_4_2_inst_init_golden_registers(adev, inst_mask);
 
 	r = sdma_v4_4_2_inst_start(adev, inst_mask, false);
+	if (r)
+		return r;
+	sdma_v4_4_2_set_buffer_funcs(adev);
 
-	return r;
+	return 0;
 }
 
 static int sdma_v4_4_2_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 5da18f845014..9c5bdb9f4dec 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1373,7 +1373,6 @@ static int sdma_v5_0_early_init(struct amdgpu_ip_block *ip_block)
 		return r;
 
 	sdma_v5_0_set_ring_funcs(adev);
-	sdma_v5_0_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_0_vm_pte_funcs);
 	sdma_v5_0_set_irq_funcs(adev);
 	sdma_v5_0_set_mqd_funcs(adev);
@@ -1481,8 +1480,11 @@ static int sdma_v5_0_hw_init(struct amdgpu_ip_block *ip_block)
 	sdma_v5_0_init_golden_registers(adev);
 
 	r = sdma_v5_0_start(adev);
+	if (r)
+		return r;
+	sdma_v5_0_set_buffer_funcs(adev);
 
-	return r;
+	return 0;
 }
 
 static int sdma_v5_0_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 4133163fa24c..ecf4f1200079 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1264,7 +1264,6 @@ static int sdma_v5_2_early_init(struct amdgpu_ip_block *ip_block)
 		return r;
 
 	sdma_v5_2_set_ring_funcs(adev);
-	sdma_v5_2_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_2_vm_pte_funcs);
 	sdma_v5_2_set_irq_funcs(adev);
 	sdma_v5_2_set_mqd_funcs(adev);
@@ -1401,8 +1400,14 @@ static int sdma_v5_2_sw_fini(struct amdgpu_ip_block *ip_block)
 static int sdma_v5_2_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
+	int r;
 
-	return sdma_v5_2_start(adev);
+	r = sdma_v5_2_start(adev);
+	if (r)
+		return r;
+	sdma_v5_2_set_buffer_funcs(adev);
+
+	return 0;
 }
 
 static int sdma_v5_2_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 1b9c1e659095..25d6eae560e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1313,7 +1313,6 @@ static int sdma_v6_0_early_init(struct amdgpu_ip_block *ip_block)
 		return r;
 
 	sdma_v6_0_set_ring_funcs(adev);
-	sdma_v6_0_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v6_0_vm_pte_funcs);
 	sdma_v6_0_set_irq_funcs(adev);
 	sdma_v6_0_set_mqd_funcs(adev);
@@ -1486,6 +1485,7 @@ static int sdma_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 	r = sdma_v6_0_start(adev);
 	if (r)
 		return r;
+	sdma_v6_0_set_buffer_funcs(adev);
 
 	return sdma_v6_0_set_userq_trap_interrupts(adev, true);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 0896f0dc6030..a5b341089e52 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1299,7 +1299,6 @@ static int sdma_v7_0_early_init(struct amdgpu_ip_block *ip_block)
 	}
 
 	sdma_v7_0_set_ring_funcs(adev);
-	sdma_v7_0_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_0_vm_pte_funcs);
 	sdma_v7_0_set_irq_funcs(adev);
 	sdma_v7_0_set_mqd_funcs(adev);
@@ -1432,6 +1431,7 @@ static int sdma_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 	r = sdma_v7_0_start(adev);
 	if (r)
 		return r;
+	sdma_v7_0_set_buffer_funcs(adev);
 
 	return sdma_v7_0_set_userq_trap_interrupts(adev, true);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
index ac63dc26ed53..586f04355abc 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
@@ -1266,7 +1266,6 @@ static int sdma_v7_1_early_init(struct amdgpu_ip_block *ip_block)
 	}
 
 	sdma_v7_1_set_ring_funcs(adev);
-	sdma_v7_1_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_1_vm_pte_funcs);
 	sdma_v7_1_set_irq_funcs(adev);
 	sdma_v7_1_set_mqd_funcs(adev);
@@ -1365,10 +1364,16 @@ static int sdma_v7_1_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 	uint32_t inst_mask;
+	int r;
 
 	inst_mask = GENMASK(adev->sdma.num_instances - 1, 0);
 
-	return sdma_v7_1_inst_start(adev, inst_mask);
+	r = sdma_v7_1_inst_start(adev, inst_mask);
+	if (r)
+		return r;
+	sdma_v7_1_set_buffer_funcs(adev);
+
+	return 0;
 }
 
 static int sdma_v7_1_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 155067c20a0e..549708075eb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -487,7 +487,6 @@ static int si_dma_early_init(struct amdgpu_ip_block *ip_block)
 	adev->sdma.num_instances = SDMA_MAX_INSTANCE;
 
 	si_dma_set_ring_funcs(adev);
-	si_dma_set_buffer_funcs(adev);
 	amdgpu_sdma_set_vm_pte_scheds(adev, &si_dma_vm_pte_funcs);
 	si_dma_set_irq_funcs(adev);
 
@@ -543,8 +542,14 @@ static int si_dma_sw_fini(struct amdgpu_ip_block *ip_block)
 static int si_dma_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
+	int r;
 
-	return si_dma_start(adev);
+	r = si_dma_start(adev);
+	if (r)
+		return r;
+	si_dma_set_buffer_funcs(adev);
+
+	return 0;
 }
 
 static int si_dma_hw_fini(struct amdgpu_ip_block *ip_block)
-- 
2.43.0

