Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L2eLcTNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:28:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83CD7A28
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B327710E5FB;
	Tue,  3 Feb 2026 10:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5pktEoRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A510E5F9;
 Tue,  3 Feb 2026 10:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8IakOa4ophdAW3xs4/ocpYRpycKy11binzIJD+rO1YlgoIjv/f5x1aYfP3W2AZGgTMVwv4bOpnuRfGA6Z0jDN/an0xV3Q3YXI5W1m69EZ/iilD9L64qhV4TuEew9ZOSppCgf7DSdZHW1N/gvZrMp0UjxfNQ250LeOCy4stqusQ6pqGf+BqrO6MtvO7A8C1qJT1YSyG6+enE0qyUMbiLXAJtLQzmPUlzLP0hcle/wjEhJxWKkdyIBs/m03wrYcIpR4VGsmLylmN/oq5UU9dgo2kTcdp9BiP6phiScjb/EbUImqmDZLv6s2pHhPkKAeJGhnUFrf3Qqcm3Ma/LP/GW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xboBfU4k403mlrk8kaFfJ1D6MYgw8nbBFKHpiR8qp04=;
 b=KVlbCxu7rtsNVyTL06+EDVep91vXUHUCio7A4cuDq3/7iy8h0L0oCUHK57qGbdJtsGNlSv1b99VuglIqpV2LvcNH5Ln9ZS1BmtblV9M0A6J2P/ergLfqGI0s+Vrl1lxk862Qpbn1Q2LxqPTg3Sb3r3xCl3vXnicAQLUHMAlRBUZGQ0lvb9+YzC1l9470Hrg2k+TbipSLNpITZ7dzVowiCnf+bVyjCLQ9JlfocLsfDrVkAuQW4suhHNAUjJMOBw/MWvzfB73qieaSAEEnvidOhO+ygfu4p1L4glL244wl/MxrpsSQMhOYuu321YT5/xCu3pZQ+izVO97mAPZyWcGa/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xboBfU4k403mlrk8kaFfJ1D6MYgw8nbBFKHpiR8qp04=;
 b=5pktEoRPF5fPE/QQIp5qohktg0hR08pxDxAT3pojEWfByL5nyGmpg6Id6UfYde070pLoRRzplYml39SUsa/JhNc/xEVfXfch9T8DNciQkXA0z5ZvXdGfgACS570W1dDfwDdXL5Vd4xAaDBTZETPYTsOhVLCEpxxh92HGieOnHUU=
Received: from MN2PR20CA0044.namprd20.prod.outlook.com (2603:10b6:208:235::13)
 by SJ5PPF816B88375.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Tue, 3 Feb
 2026 10:28:10 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::8c) by MN2PR20CA0044.outlook.office365.com
 (2603:10b6:208:235::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 10:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:28:10 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:28:01 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v4 11/12] drm/amdgpu: rename amdgpu_fill_buffer as
 amdgpu_ttm_clear_buffer
Date: Tue, 3 Feb 2026 11:22:18 +0100
Message-ID: <20260203102236.3456-12-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|SJ5PPF816B88375:EE_
X-MS-Office365-Filtering-Correlation-Id: f824f133-aa63-41c0-20d9-08de630eed9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXM3QjJrN1YxR1NSemdOM3ZjSFNvOUlyKzVXcmxQSTJFcEFkWWFsU1dVVVFM?=
 =?utf-8?B?blcvWVBzNEVJT3h1VHJGVlNtVVplNzFQekI5OWcrMCtoaTRncVJzVm1rL1lu?=
 =?utf-8?B?NFFtbUVlTGxWdWNyV1pPTW9JQjVDUk1SeVowNk50RHhObktsNGcyQU1lbVBv?=
 =?utf-8?B?WmhQNUhhWlZMM1JXd2FQZU1Mc29jalNyUDluMTJvcnIreWJuYVNObWViWHp0?=
 =?utf-8?B?RzhxQkdjbWhzRnE5ODFKd0VJcVduTHJNL3BvWElOMGYyeTA0dHNuZjRZVEVh?=
 =?utf-8?B?dkNQZ29tKzlPbG05NjBqSmx4b3Z0dDFLWUtYUHlGTkhvbFNiek1tSC9TTndy?=
 =?utf-8?B?NzUxMDBEeUtwTU9EY2YzRiswYjI2S0VQbk5HbnFKVm1xZDVjYzB4VEpTcXdQ?=
 =?utf-8?B?U2N5UHhKOUc5bHFwZisrMnZ4amlxT2NTR1NsQWcwaS9iVFhyNDhVZlhvdDZl?=
 =?utf-8?B?U0xsbzhDYkRnMTgvRmk5WmxjOVhTSXdwUnNIaS85SDJVZTFlcFQ4N3JCdnk1?=
 =?utf-8?B?UGNBWk5TSVBzaHhhejF6aHhPNWVMeDI2S0RPc2R3OTcrbEdybVpGOTdSWWlZ?=
 =?utf-8?B?ODRsRXA1VnFDd0I5ckxuMVBOWVQrSTQxOGtYVFpVSVJiUS9GT2J4V2ZKK2NE?=
 =?utf-8?B?UHlpUGZ6ekMrVU5SbDdueEFzZjBCMFN0ZnZ0ckVZY0txOVlCblA0dDZlL3Z4?=
 =?utf-8?B?ZkxoaVhPWGh6N2l4NmJKejZNcU9XM0ZVUU9hR2psUFJDUkhRdjlVVW9hQ2JH?=
 =?utf-8?B?NWlmVXk2Mkh3SjRPSWxBMTBBN1g3U0lQWmZ3K0J2Z1oySUNPcnF0eWw4RjVL?=
 =?utf-8?B?SUdtbUZpN2xWNEpFc3QyaEQySjZJZ09JZXZuK09tQTF4b2plZHdhSS9zKzhv?=
 =?utf-8?B?U2N0ZFJVRU9tWnlzaVZtbnhoK1ZxNU9CckZROXBHUWllWW9sWUcwbU1GZ3p2?=
 =?utf-8?B?N1JWVEhLUGJYMGxxWEtUbVRYOWZUU2NycWZPTU5aRWkzSUJ2NklIbjlFQkQv?=
 =?utf-8?B?d2hqYW5LUUtSbTdQOVl3b2JGRW01cDR0TExNb1BjK0RHR2p5d05xM05sZ2x5?=
 =?utf-8?B?a0tnT1czdU9pSlR6SEVwdXBLS2NZdVFJSEw1NzBncDB5WlplVjFBaVF5TmZ5?=
 =?utf-8?B?WklBZFVlWHc1YjRZbjkvT3gxOStGa1o3bXVYUzY4OTU1bFNaR0NDVysyVmRw?=
 =?utf-8?B?cFVLK0NFM0xLTnl4ZEw3UkFZckFvNkF2cGxyNjBxMTZBVGo4L282TWI0QjNq?=
 =?utf-8?B?OWc5N3cyRnFFY1MxNVUvZDBlOVFzTUpiaTlSNm8ySnhtK2VsSmpTQXFKdzNm?=
 =?utf-8?B?YUovRDVUc1R5dTNGa2x3aFdjdlFFRGVIb2NqUlFBQzZhYldHczFRbjdBMEdv?=
 =?utf-8?B?K0x5QnRSSTk5ME1UVHA3cXpsbzdpc0VMSlNyaGJnajZDZkJFaXdvcG1BVE5E?=
 =?utf-8?B?MnhzY0Q5SUlTS0EwRHRtQzNFM1RjcVF2WWo1M2J1c2c4blEvTjZuWkg5VXIy?=
 =?utf-8?B?NVJJSFlmMnp0MEtzMVVqVXYyOVZPeHMxK3B5eXNYSDlhQzNVSng4OEw2VDVC?=
 =?utf-8?B?Y0lwYldPVXA3L3RINXZtQmtPYS9SNGJqUE5oRkYyVEd6NFNSOHNBNmZVNitQ?=
 =?utf-8?B?bDM3Tlgzb0EvRC9CTE9LY0oxTnBRR0tLZDBsWkhVV3V3dkdqRXR2YWNQcy9G?=
 =?utf-8?B?cmxpaGNiV2xiS1JqeDZWTi95NWFFczVnTEtDbWZ2b1g5a3ZNOHg4SnY2eGJ4?=
 =?utf-8?B?NlpUTDFHK0phMkgxRjZuR2U2U0RxdnZrNlRaaTJuUTd6SFNNbzhvVWZVWWJN?=
 =?utf-8?B?MFh1K3dGRmlmeWhYYi84MnRvNjF2QTk3cFNTVllNVW4zaVdneVBPUnlSemtr?=
 =?utf-8?B?S25Yd0VsTnFrUUE1ZkVBdlNkd2t3VDExNDhBclZrTFEyeEVDMU1Pb1pWbUc1?=
 =?utf-8?B?NUFBS1AzdVd4dUNYWFphZTE0SDRweVVRcmFOcmNEZEo2YWRydVg5SFBHUFBy?=
 =?utf-8?B?SEpmZWRHeXN0REJ0cHhHanNrSlM0NG9SVzRZTEZpUW55QnRnTVJoeTBXYnRZ?=
 =?utf-8?B?a0pNaHdzWFlOeEN6TVBCZ1lRdFN0TG5yb2tvN0Q1cmI2d3B2L3NJMXZNYVpk?=
 =?utf-8?B?dVNObEJNaFVOTVlQSE15eVN4T0loZWw5RW1JREtpc0o5OTg1cm8wTk5aZzhI?=
 =?utf-8?B?dEhaSEkwWGlFMktaM2FCR3RhODRVK2ZjRUlOU1NFQSsrU2xDWWpOaUFyMFRy?=
 =?utf-8?B?RHJReGZsTlZGeFA5L2pLUlBKUkF3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NPt7nOa1TKqSRmN9wQt5DCUtZMtFwNCXNtPTRRfXC0CxJNPq+iVYBPtLuN45fNihmrXqv5OKPJl+EpfY/lv4sEDdAeDwoZbK8HS2B1EIOJU04xcJrvcYjr/6rmbV+x6efhUmzwGgwj8mBaTP3LoFb0MC63/xWt7ZyooY3KpY4ZRboWqHB0to6ZIv5cSbyX+WjAon1m9bh7kL387BsXZVe0LrY1VzuzMJBmV8K3VjJvDpEGDX15NQWKLz25zjjXSSFS+CUqDbuqHOYShF/HUxakfxUGKcdVUavholVKD4/ijlBfFBS9cnNG6HKGfNXvNkQ3NkuRa81y2+85dDRukDwzWIOzO2s1pA2wvWYjEf5Vw72H7y9CgXJermnBL5mYb9IjfRfvBm7h2KZe1hApQgUx9ognWbsK8rBdZmy2GxdJBuHIyd2+aSnqHclAbW5lKF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:28:10.0077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f824f133-aa63-41c0-20d9-08de630eed9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF816B88375
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
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6B83CD7A28
X-Rspamd-Action: no action

This is the only use case for this function.

---
v2: amdgpu_ttm_clear_buffer instead of amdgpu_clear_buffer
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 12 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 23 ++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 13 ++++++------
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index d0884bbffa75..195cb1c814d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -717,9 +717,9 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
-				       bo, 0, NULL, &fence,
-				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
+		r = amdgpu_ttm_clear_buffer(amdgpu_ttm_next_clear_entity(adev),
+					    bo, NULL, &fence,
+					    true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
 
@@ -1329,9 +1329,9 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(amdgpu_ttm_next_clear_entity(adev),
-			       abo, 0, &bo->base._resv, &fence,
-			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_ttm_clear_buffer(amdgpu_ttm_next_clear_entity(adev),
+				    abo, &bo->base._resv, &fence,
+				    false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b7124356dd26..3b369b3fbce8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -417,8 +417,8 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	if (old_mem->mem_type == TTM_PL_VRAM &&
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
-		r = amdgpu_fill_buffer(entity, abo, 0, NULL, &wipe_fence,
-				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+		r = amdgpu_ttm_clear_buffer(entity, abo, NULL, &wipe_fence,
+					    false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2582,26 +2582,23 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_fill_buffer - fill a buffer with a given value
+ * amdgpu_ttm_clear_buffer - fill a buffer with 0
  * @entity: entity to use
  * @bo: the bo to fill
- * @src_data: the value to set
  * @resv: fences contained in this reservation will be used as dependencies.
  * @out_fence: the fence from the last clear will be stored here. It might be
  *             NULL if no job was run.
- * @dependency: optional input dependency fence.
  * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
  *                         are skipped.
  * @k_job_id: trace id
  *
  */
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       bool consider_clear_status,
-		       u64 k_job_id)
+int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    bool consider_clear_status,
+			    u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct dma_fence *fence = NULL;
@@ -2632,7 +2629,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 			goto error;
 
 		r = amdgpu_ttm_fill_mem(adev, entity,
-					src_data, to, cur_size, resv,
+					0, to, cur_size, resv,
 					&next, true, k_job_id);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 436a3e09a178..d7b14d5cac77 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -187,13 +187,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
-		       struct amdgpu_bo *bo,
-		       uint32_t src_data,
-		       struct dma_resv *resv,
-		       struct dma_fence **out_fence,
-		       bool consider_clear_status,
-		       u64 k_job_id);
+int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
+			    struct amdgpu_bo *bo,
+			    struct dma_resv *resv,
+			    struct dma_fence **out_fence,
+			    bool consider_clear_status,
+			    u64 k_job_id);
 struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
-- 
2.43.0

