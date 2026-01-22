Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCqvMNVYcmkpiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E36ABBC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E4610EA23;
	Thu, 22 Jan 2026 17:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VYranPYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010020.outbound.protection.outlook.com [52.101.85.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6165410EA03;
 Thu, 22 Jan 2026 17:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWOnQhfiHln5gSNriH2nS6WGaHTQOEmxNc55FA6cjfvz/deDA+oSzBuTn2IlmqbdnqccMujgW2sZcNVdlPl5N0fHGMkub6ZOs5MYeTHmr91wMW4Jz6Zdabwk/f+Ir7OH+NyPkbV62cLDkp41QfddoGj1nXmGmrhgbIoZLdPsMZpCjNJOSDW186gYOK9FeImPQDmsd+pDt2+5VKNgzwduw2cIOP9hhjFPPJe6NvBiHxJUsKo9BG7f4oOM12avjmWjPMwcVNvJAFoP5PWDi2lgFqdy+O+IZZTBh1AH2BUD32Nv4UK3Bgqq9Wqw1IatZcjwFJnsz0y28BmWRiWM3u2yiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD+PJSwLJTZ0ra2sCD2JNtH3OEYaV/gaPmWfdBsaLrk=;
 b=STn41XsyAvwgsj/9As/g3AydHAeopzpz9oaCs9tqRo05H/opmfWGLxPFIR/e61Dwvwb3xb2iFcG5dkhxwtSWNjYDwJEJCCPsRWx3ZA6sTG1BlG18NGmnbeFc8mCvnBYmkhPWZ3t3/GZWfNgdD/oty4p0NwxBybKzh+W0vRxxCdAQmzIg6B7omnZZaPnH4gsXOfzlCzA7SAF79n7qdwkjwBeBL06CjPCtbsFth19bT2b4ztXIU476T4gMLSYCeDNWddYyA3gsZ+yjt6GQt2st1W4pvtoFbVmRSUEgOPthET69pwEYY1YsQteJ8uFRaI38NNm8/l1I1R0gNFVQ1hlEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD+PJSwLJTZ0ra2sCD2JNtH3OEYaV/gaPmWfdBsaLrk=;
 b=VYranPYYahfZFx2sb/RKoZZwK5YDtSkwTp738SsbhToeEncxiI2lRYmDOVYoYxSss08QXiBGivNEPrKD1SiRaQS4zLtuMHZi2jswy9yLAUHIF4BsbXHDQjARF9DZPdDuZVgLrHXfoJ0BFrAg7er9k5ZWhUwc3QhKa2mNWa473Jw=
Received: from SJ2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:a03:505::17)
 by CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:05:14 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::af) by SJ2PR07CA0017.outlook.office365.com
 (2603:10b6:a03:505::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:05:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:05:13 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:05:12 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 05/10] drm/amdgpu: add missing lock in
 amdgpu_benchmark_do_move
Date: Thu, 22 Jan 2026 18:02:02 +0100
Message-ID: <20260122170218.3077-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|CY8PR12MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: c43a8617-6718-41e9-7dd8-08de59d868bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmFoNm5YVEh2UXJiWWFpS0FoN0NxS2R2RzhRa1Z0QngwQmZYbDU4dHg5SlA3?=
 =?utf-8?B?SFRYK01uRE5JQ1RvWFpPeThVV3UrSFRrZEE4MWhVemFrRjJZK1ltVGxCZ2ZB?=
 =?utf-8?B?bVQzSWNvQlpoS09TY0NRY0tQd2wzTmN1RjhLMjdsVzV1Z3NXUXVkVFVhc0dJ?=
 =?utf-8?B?aU5lK2NBekx6eTZmeFdYTmNjZDZUWitLeDhtOWxNVTQvZ08wMmhHTGZUQXEx?=
 =?utf-8?B?UmNsOEJlYWhUdVB4SytxNkpOR0FObWJYN2hYOExoeWVHQnBlcHhrY3lOMk8x?=
 =?utf-8?B?TVJoWXYvZVVOMmdHNUZDSzMvR1g0K0hkYS9DdzVGOVRhVFAyaytMYml1N1RF?=
 =?utf-8?B?UTYwVUxBUVo2Z1ZHd29hN00wTG1Ic0tIa0E3c1d0b3pmZ0V0VTd4WW1zc0hH?=
 =?utf-8?B?cGJ3eXBxU2o3KzV2eXFkL3IzWDJmdklZdGQ5dS94cFRsUFFXNjZYOTZJQjRh?=
 =?utf-8?B?ZFdjMXVKRmZNamt5eUs5dU9vMGs4U3c1TVVKYmxhS050R25UOXg2bDBxUDhN?=
 =?utf-8?B?bUhhVHorQUY5ZWRjaHN4TnhHeFhWSDBpeGtLQlBzMDE3c3hsOWg1YjlaQVFE?=
 =?utf-8?B?Vno4SUg3SHlrUUdCNUhTUGtlM01sdHFzVXJpdzhwTnpxMmhnZEhxRXA4ek5Z?=
 =?utf-8?B?SjZZOUpSdXNPRXdJZnU4WUVrZUpkVTgwamJjL2U4U3RzeHZZRlErdnVSa1FF?=
 =?utf-8?B?d1g5M2xoNVYxdWljYnVsVHc2V0NQQnN1MzM5cEo2Z3hWS3M3UWpqMDB6S0ta?=
 =?utf-8?B?cEZGT1dVbm5WZTNXVmdRVFlRbVZ4UStXay96RGVrdzdxL3AzVjFUQ1ZkazVE?=
 =?utf-8?B?UDQ4Y3E4ZC8wbHBDNlNpMVJUWUxWcmZLNjlZUHhMaFppSmg1SUFkakJBWDVU?=
 =?utf-8?B?cWhLSWNjQnpDejNFTXlHOUhzZFc2NEMxQWMyZHdLcUE3ay8xeWJBVUsxY1Fv?=
 =?utf-8?B?b0c0Rk9QUGhvTVUwNzBsL2k5bW9TZmdSSXRuYkZFR2MvQkFBditNaXdkbi9p?=
 =?utf-8?B?ME5QS1ErdGpKSzBYa29iWE1wak93KzE2QnJydjBOVGd4ZnVuUzFLU1hCaXdl?=
 =?utf-8?B?L29lR1pnZ0I0NmVqS1ljTkVPOFVpV0FPVFZ0cEhodTduRW9UWmVhY2VodlhO?=
 =?utf-8?B?Q2VmdWJEeXczRFljdjBTUkZEWjlkM0dxRHdlL2xISWt4ZXJNTlhjYmgzYTcw?=
 =?utf-8?B?VkdNcHpBMGpYNmx5NEM1SEllek5RZ0JmMWlmMTVXUTNQSEl0VUt6UjVaQUNr?=
 =?utf-8?B?aVV4dEpwMUcxR3gwRU1QOGEwN3dXZ1RBRGFZd09WRFYxb2hFMlQwUHBYUTZw?=
 =?utf-8?B?NTdHam5BWGMvWkdFY3Rrem0rUTg3bENmaEtheTcyZmJ1ZVY5RjFXZGI0QXZY?=
 =?utf-8?B?bENmT3hOdk5OdlU0cmZHUkRYZy91WXhQVmhQbFpaYzk4VGs4YkRiTFVGdzBv?=
 =?utf-8?B?YWY5VnFhand4TDBkcFBBdFg3S25xTmJueFFCQ3RlVnYzYW5xTUlyZThiZjJG?=
 =?utf-8?B?d1RrZjlXVEc2dXE4Zk91a0NHN1Uvb2NZaElaWjNjeUZuR1hoanQ5ZUVFbk55?=
 =?utf-8?B?L2k5Rk42M3ltZndkTE5qTlJvOW00YTY1Q29CcUNuZm9ka2JPSDkxUkVPeE4v?=
 =?utf-8?B?S1Y3SDJxYXl2MXRzNWdranN5MVdyVUpGZnBZd3I2bkdYeUl1Q0tCTlNzbVl2?=
 =?utf-8?B?a3dBcmNDREw2eE5NTmdEVHFMWGtoZGoyMjBQbXdtYnN1U0xYSWRtUXFDcGNN?=
 =?utf-8?B?Mzg3b0pQK0lrOWRTMFgwaHBRd3NWYUVsMXpEWXIxU292ZGhyWUJMOW9naGxQ?=
 =?utf-8?B?dDJPRUhrbEFsNmsxY3J5b25pUlo0Wm9PdDIyM3NCcnhodVhsb1FpZjRSUHRa?=
 =?utf-8?B?eDJWQ0x6MmR2MTd1MTR2azFHT2ozcHBSM1plUTA3c3Jqd09sQkYzWHFERkkw?=
 =?utf-8?B?MmtGS055dU1zcERicFllQjM3TGRmUFQ2cUViQ0ZiWU1SOFdkaGJrbXdwVjc2?=
 =?utf-8?B?OVBkdUJub0JnSGpHN3VyZWZGVVIwK1FGMitmbGdPMkJLdHhFZit2dGh0enBP?=
 =?utf-8?B?TkZCTk96eXB2dUdWTVhNRUtSS0Z4RXAzK0V1L0pxNHpOZW9TT3doR2lOd1Rh?=
 =?utf-8?B?VzZFZFExSGtjSXpOeDV6NStPWjIwUlpvOENTNDlzRlgwdzFpZUQ2YTBsL1oy?=
 =?utf-8?B?Q0kzNmJJMGdiTU5XdDVFQlN2NnNyend6MVZxRG04YnZJeUIrNHlOekx5WTFs?=
 =?utf-8?B?N3NoNmlpdEV2MEt1dURBb1BEbTh3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:05:13.7492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c43a8617-6718-41e9-7dd8-08de59d868bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7516
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6A2E36ABBC
X-Rspamd-Action: no action

Taking the entity lock is required to guarantee the ordering of
execution. The next commit will add a check that the lock is
held.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
index 1cbba9803d31..98ccd7ab9e9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
@@ -35,6 +35,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 	struct dma_fence *fence;
 	int i, r;
 
+	mutex_lock(&adev->mman.default_entity.lock);
 	stime = ktime_get();
 	for (i = 0; i < n; i++) {
 		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
@@ -47,6 +48,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
 		if (r)
 			goto exit_do_move;
 	}
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 exit_do_move:
 	etime = ktime_get();
-- 
2.43.0

