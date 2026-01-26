Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAxhEsNtd2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF1388E60
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A7510E421;
	Mon, 26 Jan 2026 13:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="veoFl3/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010018.outbound.protection.outlook.com [52.101.85.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6425F10E421;
 Mon, 26 Jan 2026 13:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS0Dq5xEHF4NeNf4Z9H+hP6ejk6V+ZEZuMxWoYGC4960PVl26aA1dwmDYIC90+CCoK4Sl3GisAoMsRs+zbdGo3ecXJYB/QOaEn4mIpugnrdcCQy1K7Os34l9GOdzzp+Ole3VH1nP3BOAuyyV3qFY3SQUrWeqHDGeeEZR9R7bOlIQNhIAvEz5CijSHXIvEgVow804FbLT/PEEZfEHghhaur5/q/uOLnSYQ5hyq0y9Sn2UhOcOFCKneOp5NspNl1RJvyB5X1inMqAbWexUYEKiWOiGsq8+hGShyoUR7nM0txB1T5R6e0/wRfb4n22Yr3HoIgaeD0bvVXrvMPnruL49yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7EK9MOEX9miS2tYFGSlsz/m5KBza+zxxXOOCldkn9c=;
 b=scHECGHbjplm1yzd5BMNgyQpOiz7ul4Wx9aUSuOYvuNQsDtZnKHXzISKxRXeurxV7OAw8mZ1lkhOMu8tplUvS3DTABjF+hWP52R1uWjugNBJh34U5rRB2XegeDIPWIKwWzMJxykAXehlNN0la5XmtxLUegNundgcJFNptg0G0SxAOqHkfLBChu29heRdV6ZNpBpAmIlYYOr0YRgUQ/Muz0OLrB3uWIW+9Ju+e9sMNr6ewzsZTM9HS3Gt8sX9B41TMlCGo+9rKpeHU0XCiYgYZcCqvkRlwmaFMk3Mw0WvFirITAtkpKNLrkBW96YoIWj223eU7FWzjYVXsh7Gxa1Ziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7EK9MOEX9miS2tYFGSlsz/m5KBza+zxxXOOCldkn9c=;
 b=veoFl3/wj9Uxm7985WvYkyhlpX4CC6seP9SD0vbJrmcvAfP8hRsvQiirj/xefgv9eqnnUNBPbSi0sHSuW136fExpNb3kkESWWTY5Y+S3UsPhmxdgh8HG4yhXFXzvAzohU8+R3sy5hmbdDF/pKpLgTjBxN34yeTOc3IddX9jvUOY=
Received: from BYAPR06CA0054.namprd06.prod.outlook.com (2603:10b6:a03:14b::31)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:35:56 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::fc) by BYAPR06CA0054.outlook.office365.com
 (2603:10b6:a03:14b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:35:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:35:56 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:35:54 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 01/11] drm/amdgpu: remove gart_window_lock usage from gmc
 v12_1
Date: Mon, 26 Jan 2026 14:34:56 +0100
Message-ID: <20260126133518.2486-2-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f005e5-8f3a-4845-618a-08de5cdfd58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2xVb2VaWEE0aFJMRThraHJIMERVUGdBUzI3QlVRSUd3RGJlZ1dnZTZETHNM?=
 =?utf-8?B?WDdaRUozYzNBS04vbnlzazdqbUQ5d2NSYVljd0c2c3gvOE5vVnZtRGZTd1dJ?=
 =?utf-8?B?Mk1IdXlTd1kyVkt2djQ5QmNrMk9ZNEpQUnY2ZEdoWXJpakJMRTRNUnJEZkFH?=
 =?utf-8?B?VmdQNmlURGlKMWFUeFRCRnJIU0FYRGVsRHdCdlY1c3AvN201NGt6UXQxdy90?=
 =?utf-8?B?RjhDWk02NnJFTlJ3SWxsTlVKcExodEpVZW9kWW0rSW5tNS9PejRlZE5QM2RF?=
 =?utf-8?B?Sk54d3Q1QTRhdnZGbEtUQ05Ldy9GbGNFYkdFZGliY2V1b3E3Yy9rSW43N0o3?=
 =?utf-8?B?Z3R3ZkxjenlMcUlBOVVKQjBxaTJqMHdWMDJZb2ZKNHJmMWt3SjVnVHFrSDY2?=
 =?utf-8?B?RG5yK0dHL0RxM1NyOVEybWJ1VnZlQkw1cVV6M28zbFIxQ1ZTVVlkL2kwSnY2?=
 =?utf-8?B?SGFjSTFDdGRMc1g5Y2VxZDZVNmNkcXg5TGlMeVh2REdsUmRLQWh1K2txVzhT?=
 =?utf-8?B?QTl4ZGh0NkU4OEZVR0l3djZ1Wit1SnUzSDJzRjJNL01wTmliM3B2OVJ3YlRE?=
 =?utf-8?B?cTFsV2EyUmdiTXdlK0xab3VnME83LzJYYXJaMzZqTmZQL2ZBemYxMTd4cHdm?=
 =?utf-8?B?MFl6RVpmeTlvcWZOVFBBdVVEYUFuWDVIMGtzK1luRG8vYVRKZDNLbXZIK1JM?=
 =?utf-8?B?V1QrbDlHSkNFUHF4MUthL2l2TnJNS0Vpb1p0b1dqOEVIVkkycytMVjBWVWov?=
 =?utf-8?B?T0RjRWFlREkrVVhOS045L2hKd1o1UjNCMUxXNlRmdVNSWHB6d2NwSDg5Wk1W?=
 =?utf-8?B?QnVFZUJXaGE3YS95bGtad0toSEdIbFJsbFQ0TGZaKzhuUzZPYWh0LytZM0dL?=
 =?utf-8?B?Umd2djRYamYyZnA2WTFtZjArQ0QvcC9mWTNIVWZiVFlDYnFndjhqK1NLSHZj?=
 =?utf-8?B?VWoyM2NqbkFjbndEZUlPVjJNMXpOU0tkMWcxMFRXQmJNeHdNTEZneWtZSVFs?=
 =?utf-8?B?bnptWEo5c01pNkZ5MGpCYmRJUFJHRnJGcXEzYm9taFZKQ0V2VVNpNXo5bEpT?=
 =?utf-8?B?aGNJMFRyQ2RxN2tKd0FsQVEwODhrMjY1TmRSenRTM1hzbUhoeStBcmxQT3Vz?=
 =?utf-8?B?Sy81Z2VqQUt2ZWtnVHEyTG9Kb0F4LzRNNjJ3UjhNYjZSN20vK3NZK0FlVWJX?=
 =?utf-8?B?dDc2b3Q1d3BPSEtqQ1loQ0JWU2poMUlFM1lSWlFzL2NRTytIVlh1NlU0STEy?=
 =?utf-8?B?K3BpcTRxZmlOV0FTTVViZTlSL0FWbE1WbVZRMG1XY1pPMTdzWFNYUWF0Yjcw?=
 =?utf-8?B?d3lHekRVTGhMSlVNNEdXVi84TTdmN3lIbkdJaXAxanNlY3FTQk5EdS81NVZl?=
 =?utf-8?B?UnBWSFNOQVJZMVNmakZtbE1weUxIZXN1UGNaclpOdmtnVW1NdTBGOGtrbXll?=
 =?utf-8?B?aGU4dWlhQU10d25rWFpvcjRoUWYrM1lsYVk5QjhLd2ZGTU80a0RjUVFWSGZ6?=
 =?utf-8?B?SXFmaHdQYlBYUWNTTVhSL3RXU3VWYzdxNE5QOFJLUHVvVWgwbnlqM3Ywa1E0?=
 =?utf-8?B?REp2MXRHbGdEaERwL2taQWNzQTVyRXZyMFRTZzNFOWpucitiYzBIR1dWTXVT?=
 =?utf-8?B?SDBvVmsyemwwVnFFRTZLTE9yWnViUXprVVBsQTNJUWpZMFpmZk9NaXU3eFNK?=
 =?utf-8?B?TDk2WU5DZ3M1Nkd5WSszSVdtQ2NTQ2h5dndEa09ENmFuQzg4R3lJSmMrUkhn?=
 =?utf-8?B?ZWZWanJEWFpzbUpmYURaUkZ1d09OMlYvSGozOWFYV2Q5UDhPNDFmS3VSWUlP?=
 =?utf-8?B?RXd2WlNIRU1ZZDhzSjU1aUNJMi9mSXlvNUlWcXNDQlNwbkFVQXNVL1g5ZjFr?=
 =?utf-8?B?VW5wZms4RlhLNisrOTFxWmU3cEYxRytNK1YvdTR5WmhHQ09hRmF3S21scEdH?=
 =?utf-8?B?UTh3U0lOMTU3anlxeElHMDdFcFJlV1NKeFdhSXpVVkZlOER6cEVJa0ZyVThZ?=
 =?utf-8?B?alNkYTFNWlBaalBIMmlCNVgrWENnd28rUG5lU0l0VURlVXFQckZFNmpHOGoy?=
 =?utf-8?B?OWR5WlFYbmxuUDdWWXVoRmNpK29FSlAxVFp0WW55UGFtOVk0VDF3TU1KZmww?=
 =?utf-8?B?Tk1kTjRFeE44MVhyd2I3a3VYN0dOd0VEWmF6VjVDUmZnZXduZ24vV05icGZX?=
 =?utf-8?B?VHVVYU9oNHo5RUZ1NUJJR3hiSGFUTkhlM0lVYjhnYjBVOUFUbDkzQnpxY0d5?=
 =?utf-8?B?bkRHODBWeUtsNWlGb3NCNDdPcENRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:35:56.2815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f005e5-8f3a-4845-618a-08de5cdfd58e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
X-Rspamd-Queue-Id: ECF1388E60
X-Rspamd-Action: no action

Same as what was done in commit 904de683fa5f
("drm/amdgpu: remove gart_window_lock usage from gmc v12") for v12.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
index ef6e550ce7c3..dc8865c5879c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
@@ -345,9 +345,7 @@ static void gmc_v12_1_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 		return;
 	}
 
-	mutex_lock(&adev->mman.gtt_window_lock);
 	gmc_v12_1_flush_vm_hub(adev, vmid, vmhub, 0);
-	mutex_unlock(&adev->mman.gtt_window_lock);
 	return;
 }
 
-- 
2.43.0

