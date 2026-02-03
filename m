Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK2UAUbNgWl1JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD9BD7927
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 11:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B226010E5E8;
	Tue,  3 Feb 2026 10:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oYX0CoFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980C010E5E8;
 Tue,  3 Feb 2026 10:26:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGF8rA9TajZcSadFFnkRFMoXSXCe8dQVWoKLnBPFDOZOpcLgUvY+G8YVsStdxqbb3JrKPMWMSW4hMwSqATOmnr9pJHleZvGWKvRYcVYC9LLIVwPczXFHp0VhLorQLeLi93WwMpvcb2wBqsBdNIs4WgmTk2LyusBvAcSO/X72julQ96e58RHvbHmZzZ7wz6MAq98Y2SYtXzmLItPKsXKkJLfRRM2/v3MLNg2Wa4sC8XP/hklvwA6kHttuZoskBjk4+6VAtV/P2GmYIDKAIExRZNTq4StQsuB0PsexcZOvtBA0La/JQmAlRyAIersVMukZpSg1lUM7KGnF59zYo8WFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQpvE6iqJdxIG4MumrXnT7riIXlBSZyqmcldyOF2uoA=;
 b=AXn+CuwGvrSts07SzwX1RYu2IBNxFIJp9qSVn8dWXk0sZLqWcUHL9K6my2aE7ZNycYaXorpuOwQ+9eIqeSXv21qyBWI1rVdImjr5d5Rc+pqFWtqZbq4u8ZWQf5tr0ej1trBGtLc5Sj8J8x+Pov24+5xKmvuH74GdGYHPDveEbNd68BJ7kN/fDgIXFdMLDGE6d312URH1pjDDZQm1UtJ+1W30o7NQladXV3D89xEG0Y5uhe6L2xg4LA/EMkwkZxndSc8fTwCvmumsGhCw0eXywWvU+mkQOZQriYXzkTUcnHUTHP96v4Aa/UJb2Oz1xHoPz4P5vNwpfxh1Kjx2ZzCYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQpvE6iqJdxIG4MumrXnT7riIXlBSZyqmcldyOF2uoA=;
 b=oYX0CoFF3WokqK4wxkTH67DVAtLfP7vetk/+bCdUi9CzgmBVGDIbBzq2QjZ2oUQLTGUwxL0tLbR8e4vaAHIFGw5I7F9dDDHHJ+56Xn+rDwjS7K6HKINbwxnhE7A35nMRmh1LEkffpYT0MGN2b/mpUOU8HKrudi7Cjk3b+qrGYm4=
Received: from BYAPR11CA0039.namprd11.prod.outlook.com (2603:10b6:a03:80::16)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 10:26:05 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::41) by BYAPR11CA0039.outlook.office365.com
 (2603:10b6:a03:80::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 10:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 10:26:04 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Feb 2026 04:26:01 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/12] drm/amdgpu: use TTM_NUM_MOVE_FENCES when reserving
 fences
Date: Tue, 3 Feb 2026 11:22:11 +0100
Message-ID: <20260203102236.3456-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: e27317d6-5288-4475-652e-08de630ea300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTNuNlhRQ0N6RzlIZTFCdkxtcnlGdWZQRkZwampZdHIrcER3UVR5Zko2L1lD?=
 =?utf-8?B?dVBDNW1Fb1V2Z1dSdS84UnRTTWVwZnhzRG9oQmNBODZxZHlzaCtQTFgzdmlH?=
 =?utf-8?B?NXE3VXpxSllqTXNSTWZ6WU9IM2VuQVJ2QW1ncmNCcE1WVDVGcUhtb3VZVXlo?=
 =?utf-8?B?RHR0YStyYTZPNlVvOUdiWWhEWENKbm11VmNVRFpJSU5MQlBtOG9ET0NCODZK?=
 =?utf-8?B?b0h6WGFLY1NBcUFsVkxha2R4YjNaU0JqL1pTempsU093d1cwQVJXeWhRL01n?=
 =?utf-8?B?VVBYUkVENnYwTW1SRnR1Y2JPdFZudjdCY2xmZmtxVXBpRER6cXNDSXRTZC9S?=
 =?utf-8?B?VTlTUU5wdjRlT2J3b0tvOGNReWJ0eVI2NWY4OHNDVGZLbG5mTVRFNVFOaFZm?=
 =?utf-8?B?RjgxdzJ3Wlh1Y1NlUXprTlZrbjRiUEdTVWpGVkdvZkV5a053eEVlZ2J3cFhV?=
 =?utf-8?B?T3RjWjMzcWZCOUNhRmVvMDFoWHVONE00dGcrUUtwRDUzTzN4RjcwdEYzN1dY?=
 =?utf-8?B?c0JhU2lnbk9iMFVtdkJERGswWEVCWGF6N2xLdjg1eGZxVUdlMHc2NmppZlZt?=
 =?utf-8?B?anhVaTRjakE0V2c0N2x3T3J0NEZyNDk3dGF1S0dyUG8zS0VISWxHQmYyaDhi?=
 =?utf-8?B?UlpOYU5ZOCtXT3BXcFk5ZDFhakZhSk1TYkhORmVxVU9aWTRiRDlaUEtneXJ4?=
 =?utf-8?B?bDdkVnJIdWNGbkErN1pMSXVMcjArY0lzRHhKblVhaTVuTUJURGVnSmdydktm?=
 =?utf-8?B?ZVpaT1oxR0tHVDA5MnFXdDZGMC9hWEpqL3ZqTnRZTjNubDdwSUVhT0Y3a0pL?=
 =?utf-8?B?WWtzMHpvdFdtZkJZRHZtUTNrVGk2S29QTWpHU3VKdXhUSW85MXU0cUhIbzFj?=
 =?utf-8?B?cEtFZ1lTNTJVMkFwZlk3MC9PQWdyZnJnU2lxVlJJMmFaNGpxRXZWcUk3Nk95?=
 =?utf-8?B?TVNxT2Fsa0tJLzIvOEwrcXlpWFZRbVRmUDdXQ1VCUHgzUmhyUE55bXdHbUZn?=
 =?utf-8?B?V2RXOHpZbmVGaWdBNi9Od0dpV01XSFRuM2lDd3h5VEJ0SnlNemtIdUc4WGdD?=
 =?utf-8?B?VloyeXYxRE1XaU1YbnZna2dyajJFRzU0L2lPWUdQdTJ1Lys0SWFzcytnUWhY?=
 =?utf-8?B?TmN0OE56d2pEQndTZDVwS0ovWCt4S0NxUHI5U3VXeDhLTWF3YVQ3Ym5uVTM5?=
 =?utf-8?B?SnNoRWoybDMzVUZaVmlHaUlOaWQ0eVh3c1RpQmlvVGZZcUNwenFkcE5kVHRz?=
 =?utf-8?B?KzdRSnFoQ2xZSHUvK1Yva3F2bTdubXJFblB2TDIrREtPR3I5Q1FZblU4c1Vx?=
 =?utf-8?B?WVhlMXBnSVUxekEzU0NGZ1hYWlQ4eXIxNU4rVGQzN0EvbzJzdElKWnVrVHVW?=
 =?utf-8?B?azRkdVNIOGh6WDZsdFZTVzliVXRqSWpWdW1KdndzclMwSndOSG1RWXc0eGZi?=
 =?utf-8?B?ck00R0FmMjlrOTdCMEdLdkhyNVBWRjBPUGM2QUtsN00rY0N0RDcyUTBZVHBU?=
 =?utf-8?B?aFNiT0hIbmlBOWpDclpic2ZqY1o1blhqSmZuM1BZU00rQ1JnQkN6SU4yZjJl?=
 =?utf-8?B?QXNRUmZsczhEK3NuUTZMejVpZHhwQ1RVR3YrcXp3azNEWHp4NjFBa3E1K21y?=
 =?utf-8?B?em5BVFQ5eDBQOUJRM0M0YzJxdWZyYnNaR3dnUkY0ZFF0WHhidTkwekhndVhu?=
 =?utf-8?B?K29nT3hEZ2NWMU02Y3JHTVd6NTBJcFp5RDc1QXFuY3Vncmxrcm1kVEtCS2Zq?=
 =?utf-8?B?ZGJRd0pBSm5sc2t6S2RaSEhyUXZ1ckorUmVGWDgzakRtQm1EdnQ2NUhZUHY2?=
 =?utf-8?B?bXBYenZYZ3l3MjdMbmxWVnMxVGZHN2d4L0tjOUVWalR1ejBwTEhCVS9wOERk?=
 =?utf-8?B?NWZmV1hqdThJbkhGa3VLT05IdnRKKzdCcVlabEhGL2R5VDFEUklqc01PdUs5?=
 =?utf-8?B?U1pobnNORk1kdGZwaGt5L0plUkFoeS83THZmdXJGdDV0U0o5VVA3L3RmODQ0?=
 =?utf-8?B?c1Y3eE90OTd4djdvbHlKTDZBVHNxdnJUemwvSnhjcFF0NTZNS1l3RmlBS3VF?=
 =?utf-8?B?NFRRU1pXbkoyT3dRMmt4RkNWWFRlbWNhU0Q4bENIZDY0eVdBekdPOXlPSnFQ?=
 =?utf-8?B?aUhwMFN0ekV6VkFRRnFoN3JJNFJsVzFISFh0bVBZWHRIV25uYWJSVjk1ckdX?=
 =?utf-8?B?dzNudVhYZ0lqL24vbVFRS25semx5b08rczhRcWh3N0tjcW9tcncxZXUrSDNL?=
 =?utf-8?B?RG5xRWxHeEh2T0lMeHJYWXFNdlRnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0XoaJ4RPwwEQ9uocbFqK6rYieslrlbwzVPQAgGnkxWhyGmcKZfbqGBTCVyTqhuSsTcwhU+8sh4YpIfDgD0/qflfgtACBhcAOLz+fv0jBlduFH3VwKrvyZkOaNerrWChuIr52zfpuHcY13dWYteIiBJ+5X3/2GOrytlkrEHBL66QQqmyddwP0zJslGV8LyNn/ztp9SmX+PAirfSsMnF7VuhWcoPgCzhaHNemA50nd3nak8JJRiFjxKc1U0+a9XA36Bss/w1ikDoC/jbi87kHhwE1w/N53Tgom7TAy5DiAgwzPifBTzH6gPIvtsvA2QNzLY9Jb0mUHOiu/iu3uvDrjtcBxPufbT+UTrqIk2Qd0TB3qzbfFDX9YXxWhVST7aFH3eYBRUbING6zrP47zp6Cq35ThpwCMFejr6D8UbQdKOftf25iJfWD317tUeLnHIUKQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:26:04.7261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27317d6-5288-4475-652e-08de630ea300
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 7BD9BD7927
X-Rspamd-Action: no action

Use TTM_NUM_MOVE_FENCES as an upperbound of how many fences
ttm might need to deal with moves/evictions.

---
v2: removed drm_err calls
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 6 ++----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 3 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 6 ++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 6 ++----
 5 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d591dce0f3b3..5215238f8fc9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			goto out_free_user_pages;
 
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			/* One fence for TTM and one for each CS job */
 			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_NUM_MOVE_FENCES + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
@@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 		if (p->uf_bo) {
 			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
-						 1 + p->gang_size);
+						 TTM_NUM_MOVE_FENCES + p->gang_size);
 			drm_exec_retry_on_contention(&p->exec);
 			if (unlikely(r))
 				goto out_free_user_pages;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index e548dc9708a2..2f874241ce16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -328,11 +328,9 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		domain = amdgpu_display_supported_domains(adev, rbo->flags);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index fcddb54a439f..06c74511b529 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -628,9 +628,8 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
 		}
 	}
 
-	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
+	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
 	if (r) {
-		pr_debug("failed %d to reserve bo\n", r);
 		amdgpu_bo_unreserve(bo);
 		goto reserve_bo_failed;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 9e709caa7a4c..838c528a009d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -952,11 +952,9 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		domain = amdgpu_display_supported_domains(adev, rbo->flags);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index d9527c05fc87..110f0173eee6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -106,11 +106,9 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
 		return r;
 	}
 
-	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
-	if (r) {
-		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
+	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
+	if (r)
 		goto error_unlock;
-	}
 
 	domain = amdgpu_display_supported_domains(adev, rbo->flags);
 
-- 
2.43.0

