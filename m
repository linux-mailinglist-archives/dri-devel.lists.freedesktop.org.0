Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBLkKhRud2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:37:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7F88ECC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A66C10E101;
	Mon, 26 Jan 2026 13:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zb1bUZ3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AA110E0E9;
 Mon, 26 Jan 2026 13:37:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rejFAI17tVcyhqbySnrgfZn7l2ZZjmXBuWlvJ9OzBEY1STuMOARphPIf4c3chOU4vQKnwm3p7abpBASUHxrmYsBr2ycZFudd6UdN+MZE7y9nDqG83kEGhh8DFm7xO8jZm9MjLxJBXxeXc4T5+ZLCuj2l8oMUwglWoUaBsTm+ljkFC3cZaPXfp+uuGszgGbtFqDaQyjRv4PZqFDCJ6zJ71/klZcJMGH6o1UQgZapKfmwKIGDA2Z/J1/0sub6CjoTzjOmBTL7YxwJAZO6Z++v0vYbMTtsMUXPC27B9jyM3t+qDPwSqIgd4ZkjWWmbf3G73gB9+L310I9jr8/J7fIfNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD+PJSwLJTZ0ra2sCD2JNtH3OEYaV/gaPmWfdBsaLrk=;
 b=VEGuKH/9JdtIoIrcxRm2bcqsg88JDO9GDJt7d/o7M85cMKV6tjSmAiHagFHj7Aw2okYcRbfMoNdvQVYsRMj/b8y4pOsDa5kCxgCJeaPiBGANsHKPteiMBCP2fbrIQ9WCZWUZSh/jmHxM069GbgOXTO3NGEUXIekgCYl3P0i57gs83PNgTPRdU0HCVLqRNzhAbdZx4jSOzJZWZwXGvy6wkPY97HrFQgdwU++DPGpjjI5+dxDJ39pKeVQjoj7ub/a+RhCZ+zLb0i5aRUH0QbH7hB1tz3+0sTNySD4fqfhTCqJ0l/Kpwy3rfCLonIQNoqz4jfdMJaJIziNTYZLvQQb8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD+PJSwLJTZ0ra2sCD2JNtH3OEYaV/gaPmWfdBsaLrk=;
 b=zb1bUZ3d0NDvaC75IM2D10VBhtal+0XAFWx/H6LyF9KJyDirdhiWGbUmtxFleT/tliJx52dT0sdhTlELhYqBqXTO18xeZfV/wURdazZst8vUfXCGtoSkH90b2Cl803qPU7RLszK3KXJU3tMUFiL/Ww7VJ3U5hHK4iN5bvuaw59c=
Received: from BYAPR06CA0067.namprd06.prod.outlook.com (2603:10b6:a03:14b::44)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:37:14 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::1d) by BYAPR06CA0067.outlook.office365.com
 (2603:10b6:a03:14b::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:37:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:37:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:37:13 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:37:00 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 07/11] drm/amdgpu: add missing lock in
 amdgpu_benchmark_do_move
Date: Mon, 26 Jan 2026 14:35:02 +0100
Message-ID: <20260126133518.2486-8-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: 9043ad2b-5b9a-4fbd-5a5d-08de5ce003ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG4xd2ZnM1N4OFZNYUJvMllaYWVVWk9kMWtyT05Ha2laU0JLRkFIU082eGY0?=
 =?utf-8?B?NjZXMy9zZVViTUwxVTh6dVBTZDhIUjhCUzl3YTJiejlZYW5hckVrSXNYeDZt?=
 =?utf-8?B?bmpFQ3Q4eFRlelVZSTdvWTlmRGRISzd3TlQwN0J4OHQ3TnNGWGF6RG9KeVpo?=
 =?utf-8?B?Q01XVmJuSzRXNUo0YnpCTHFiN2Nsb3NJRFBNanE2dnZaYlZaV09kaElaZStq?=
 =?utf-8?B?emxvaFBDd05OMWw4ZnBIN3FwNStDZGREcjVNdW5aU1FuOHhIaWNXNmk1UW9H?=
 =?utf-8?B?ZnRmUG5hbFNHRU1ORHRKZjNmTkIxQi81OVZJTm5IcVhtQ2t5a2Rxa3k2bTl3?=
 =?utf-8?B?bTcxdDluK0U2RjJwVnJCcWprNldkUmphUGVxUS9IcmEyTWhPNnlUdG9oL1FK?=
 =?utf-8?B?dXQ4MjdUNjlhUHc0RS82NlZURUdqTUlmSDROdlYvWm4vOUhQdWZTeU52VzN2?=
 =?utf-8?B?c3ZiTStlM3NRTTU3K0U3UEFvN0JWSlNxb1IzaVYyTFhnR25KdVloblYyaEtq?=
 =?utf-8?B?djdSR1B0N3dxanUwcVcxRjRxNGppVlF2SzlSSXNCTlRJS1daVkplUWZ3dzJj?=
 =?utf-8?B?QzJnQXlVMUpUR2FiOU1VUHFUb1ZZb2JSYVBOREhsTXB5SnQyWitMSVlYTEZ2?=
 =?utf-8?B?eEljOE1meklEY3phOWVGVGV2TFFsTEJpQmQzNTZyNXZsOHdQOGtEMWJOSWhT?=
 =?utf-8?B?dmNqMDlxM0JiNjdRMlZiakhRN0F0VThnMDh4YU9Uc3JHejJic1BvRzVXMUZS?=
 =?utf-8?B?QjBQS3hLVXAyOXBEeGgyZ3pOYkxoalhXMUhEM2tiMHNvcVVscXc3MU4ydDZO?=
 =?utf-8?B?QitDb1VKaXBhTmlza3NDWEtBOGVIUzhHWjBJZGsyLzRmVXhGZS9tT2FmdHdO?=
 =?utf-8?B?NXJzOHl5YUZpNUtvZ1E4UlliRERJelRPbGhUb0VBeDhzdXovMVh6ZWNXdlo3?=
 =?utf-8?B?VGx6eUhNcEw0bFNvdytBUkxCalpVTEY5a3lYSXBqMFlnU1A5QTk5VlNQangw?=
 =?utf-8?B?bXc2SW5ndldQQmRkbE1hQ1JXVGszVXRnT2RweWpTbU54ZnJabFMxT1FkL3BL?=
 =?utf-8?B?ZFpJQXhnWGNoTEtNenRaZXZkN0diMXFvWTFMN0p5SHhkSzNlM2tXdk4zcGRF?=
 =?utf-8?B?eVVlYlRjNm1aWlhxVTJRZnM1ejVlMmE4emhFaEM3UnByd2hzTWdIcThXL24x?=
 =?utf-8?B?T3BRRzNMUFYzMFFTcjBBWWVZWUF1WThpV082SGw5bHZ4dWNQdzhSaVRUUisx?=
 =?utf-8?B?M1BqbWpHZHlqalpiS1h4WnNwS1hGa3pCQTVveUxLS3M2U0lOVW9KaE90cFJh?=
 =?utf-8?B?YzE5QUIzYnNwblZaL3NObzNEQjVNUWgvOWUzcHA0OHg4RDhlMXdieUJMTEFj?=
 =?utf-8?B?SFNsNUl6VHlVcXVuc0xwQVdYalNVWnRFaDNMamVwRE5TbFJHSnBhVDVFMkhl?=
 =?utf-8?B?U2UxS3BYY2NORGZHNVBRNVF2YjJJQlZORnVvQkdQN1NVZW15RHVya2h3eXov?=
 =?utf-8?B?Q3RjYmgzY3JLYWhqRzJzZ0l0UEdMOVNFSGZhMkVsZk52VUxIQ3pTZm05cVhr?=
 =?utf-8?B?Y3FOMWxTZ3pLalBZb1pNeVNhYW1TNWNOMU9VY2FSVE4zbS9BQlpJeEpidytj?=
 =?utf-8?B?L1BUa3V5U050TW83OUJTUXoyWGh4OG5vbUI1UzNoUG96cXEzbElLYzVtUldT?=
 =?utf-8?B?WDEwc3RuT05lejRUelQ1Q2Z3eVVSUW9vQ1Q3b3FVMHlFQm0xMUFGSnJ0SHVH?=
 =?utf-8?B?ampxcjRiN3JSdENHUk96SFZNT1dwQlhKM0llTHA2OGVEam1DaEN3WjRUZG45?=
 =?utf-8?B?RUVCK2ZnMUpyTnMrdWdnMXJNbXl0YUltSDZ3UllzZ1puMDF5NGp0NEV2TzF0?=
 =?utf-8?B?S1pHRGw2bjYrMWNvRWpKTTdOaXM0RGJBY2pUZmxoTFAyeFdpZCtxa1hKREZK?=
 =?utf-8?B?ajlpaUU3Q256cXBJWWplcDdRRERPV2RBaHlmLzc2cDZSQ2lDZEt6U1lhN0Nt?=
 =?utf-8?B?TGlmVGZKVVM1ZE1OZWVuNUZMbnh0dmNSa280b2xTZk9YZlYyWGVXaWhzOXJ4?=
 =?utf-8?B?UUhsVllBZFdlbDZQK2JZcGZ2MGhTSXRwU1lBWlpLdFpZYWhmNEpGNU5GRnVX?=
 =?utf-8?B?R242RDcwWU40T3dyeEZoUGVoakdObTUrckF5WUx4cFNmQUR4SDhocTFIL3Nq?=
 =?utf-8?B?UTJWc1BnS05xMCtTeVNhbkl5cDdTc1NXL2U5TDVmOHNTYWRpTmpsSTFqMkhC?=
 =?utf-8?B?R1VsZ01JaHk4QVV2RGhBeXFOQmRRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:37:14.0785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9043ad2b-5b9a-4fbd-5a5d-08de5ce003ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531
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
X-Rspamd-Queue-Id: 5BA7F88ECC
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

