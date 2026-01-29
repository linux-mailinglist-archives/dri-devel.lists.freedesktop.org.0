Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMcaEz5+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB628B187B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0237310E893;
	Thu, 29 Jan 2026 15:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R+d9SEoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED0110E891;
 Thu, 29 Jan 2026 15:35:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bumNMNi3rQvYyr2OQS3igrC/KhXv2PTOacXc8Y0GrKESgxhxhDNQzoRXLuICtEyurgLPpJqNdWm0ty1PspP4x2vrhMAk0fwF+94aIAiMCBVlGrn8eWUqDo3dEhIjjpexAnAmLBTW+qQNRPOJgANw2PFm7+St0J4QBgF7K/B0XalyHwlyARHhTiPL54LAZNt/mGMB7e0rfbVxN03raRZLrK6wtZ8uefIwEMjyoE6OIW8/xrWIaF1LGH5Vp3TE25NnAgF2/nZJSqwZVs+wuweZQDq3x4zaTm4xjEXKBlEeSxVZjWdggegYHcnrL4WwB/efUWOcKq/hx+eqQBNwjUT6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD+PJSwLJTZ0ra2sCD2JNtH3OEYaV/gaPmWfdBsaLrk=;
 b=tMtW//pcBTVrBIOUC2tDNKsP0A7vkX2pVjgvnpSFFqsixvDYKvoo8OI34Gz9lSAND3RPa2hq9dysmGTN2t4JBkoblys6HtZYE7TenKTa05Eux/A+Vc6bC59F2kVuKum07hapdOtl0KntJAO9r6KTjo5hl45z9qkylrGdW7YvuM67htmkHVw8kycNzQbwf3vwjn5HTdSiu/gSwB1J6Q4f3eozFCcZeYRf1hZAtw5TjR+reOsZly2jsHEs9+BlciW5RhbifvGPmIotOv2onIKQC+bnpcSah22DNK0MxZ/0ipb4ID7LLoQP8nS/U+GBMWMoMTOxHE1YmAvgLoI/ORop0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD+PJSwLJTZ0ra2sCD2JNtH3OEYaV/gaPmWfdBsaLrk=;
 b=R+d9SEoZ+yrFVyAazSDfYVIcaI/6oCTfVVWMef98oSqDPnX4MYXvhJyMI6DhDWAkKsH1eD5lpvAnoHvJYsHVZg2ReuTuboWK/IvuoG5CwBuI9PHPmOOu7aOPZ+GuckjXz0+L31ZQ4hzbbsy2OZtiSt43eyHOvbO88QeBiDG3Nsw=
Received: from BL1PR13CA0419.namprd13.prod.outlook.com (2603:10b6:208:2c2::34)
 by IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 15:35:20 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::38) by BL1PR13CA0419.outlook.office365.com
 (2603:10b6:208:2c2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 15:35:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:20 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:18 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 08/12] drm/amdgpu: add missing lock in
 amdgpu_benchmark_do_move
Date: Thu, 29 Jan 2026 16:33:20 +0100
Message-ID: <20260129153336.7473-9-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|IA0PR12MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 50000dac-f7bb-49b2-1ffe-08de5f4c0313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWdnSkhvTERueXpNZG9nSk5pbmdHamQxR0l5R2NmSDVNYWJzcnhtUWZYbmRh?=
 =?utf-8?B?WWxtc29Sb3V5R3VkZURTQVVxdU9RNW5zcnZyR08xOHNSVmJQS1pCYnVNY1VK?=
 =?utf-8?B?ZVowWHphV0wzQkh1NUJNNGZZSmpDVDlJcGZDMFlIYk5IeEh0M2hTbEYvVmwv?=
 =?utf-8?B?bzMxNmFCTXl5aWUrN0Y0YzNIYTA1VnovQmxJYU5Yc0lYWTF6L2M2bUxXOGdO?=
 =?utf-8?B?cDVpRE8xM2EzV2F4L0xHbzYwY2hXblRYRzNUOG5zeDlCLzgwYVNQdWVlQ1JN?=
 =?utf-8?B?VVI2dmZHTzZOdlg4K3R3dU1IaUlWcE40d1I1VXlHN3JtYS9ZVjZZd3dCL2lo?=
 =?utf-8?B?ZHI2cHhCeU1qK3lzMVhkeCs1NG1DVUwwNFE3dGt1R0VmbmpEZS9IWHlCc0pl?=
 =?utf-8?B?clZLSmNtTGNyU3VJekRuZk1MNHoxQzRMN0lkWmc4blRSakxMbkcvMStidHRL?=
 =?utf-8?B?VWNOZ1I5NEtabEtMWXdWV01YeDhzOTJIQ1BHbE5EWit1UTZjSWJCVjI1NXdv?=
 =?utf-8?B?Tnl2dWRpMXhMMXpTajlmQ3FqTGZkT1VTM0hXQk1sTDB6REJEUDZKQy9IYUR4?=
 =?utf-8?B?MDA4WGdjN1NWUGFQSWxHckdpaDNHSHV0R1FIR05uaUVCdkRWa0tWMlZGMWF6?=
 =?utf-8?B?S0E2V3JmcjY4T3dBWlVyd3hmbS94RE5oQmJsajc2VUtFUU9Tc3gxSUUySTVB?=
 =?utf-8?B?Y3FJVWdTMFpLUlZXeUZsdW5BUmlFZlorV1l1dndlY3BsdDBzRm5YODNERXdE?=
 =?utf-8?B?WjI4YWdGcWpaKzI2dzRwUGFKSjlPK0NOT2t2R1llaUprdFZWcWJEY0NnaEFF?=
 =?utf-8?B?RUNjbnVtKzBPWXcvZjRpbThyTGxqREt1UkRtNWlMMXdWS1NWMUJpenpKU2VT?=
 =?utf-8?B?U2svRUM4ZHJMZUFjUmZvNlF0ZFJFaE5EYmQzT3V3VlhkVVhVcmhSZ21mQjhC?=
 =?utf-8?B?QjFZSWlFZjQ1S0hGTVVRYWpxNUxLMmRXQnU0R0hLcU41MVIxa25QZFpVMFJN?=
 =?utf-8?B?UWk1VTlQQXdDUXpSSmEyRnZWdFFOMUhkN1RmbkhYWmpDTGRtUHJhK1ZoMU5n?=
 =?utf-8?B?NVlua0dVQ0tFOGVhOXg5RlVUQjhOKzJ5QmVUbTExRGkrVnY2Zk1CSjlIVjRU?=
 =?utf-8?B?Yjd6Yk1uOVVVbmVtZTJMNHIwM0hhSzd6ekxNL0dDQ3JQRFR6TUcxWmhaWFRk?=
 =?utf-8?B?bHN3WkVSZjN0d1FPQ0Qwa2dja20yamoyVjB2SCtvaktpb3V1RjkvQXdMNk5E?=
 =?utf-8?B?SzEzMnZPTGowUm9mbDRManM5a0JZRmgyU2VWd0dPem43S1duVHNDMHJFcDBy?=
 =?utf-8?B?ZnhZRy9HZE9aMDV3c2FhdHFHOHp3c0RkcFI1ME9LNldyQTlvMVl3aGZwOU1B?=
 =?utf-8?B?RTVpQThFNVQ2bXZXaEZzRlhYS0xRQ041NUtyRDBuQVVBYldtS01OZ0g5YjZk?=
 =?utf-8?B?cDRlOTI2Mlo4U1M2akltZ0prSFhWU1pRbW5QeENhaXhKNGdtVW5VTzBHK2Qr?=
 =?utf-8?B?VVJpTTBkRWdNdkpWQ001TUh3NWp4NE93S0RJMEdIa25KcGhHMnE1UjJDN3lk?=
 =?utf-8?B?ZFVEcnYzTFB1Q2gvYjJMSnBEWkwwU0xsUEVWaElXMFdMem9XbXJSVEcyczFQ?=
 =?utf-8?B?RjR6TjJQREdYMDlQLzZsekgzODNHd1FmTy9GY2Rjc3pZTVRsbHkvc0VMT3I4?=
 =?utf-8?B?aHA4SzVGUkR1WklrbWlGTkp4UExkTk5Lc212N25idDIydzVBdmdPM3hreU00?=
 =?utf-8?B?RGtaVlVYeDNVdzFreEpHSm9WakIxWGQvOUJyRnB6RFBqQ3pJNHlDaHM2S2ND?=
 =?utf-8?B?ZFdOdnBLQXhJeFVRY3RqS1pKbkNGZ1pHRXo5VFM3bmVGc3VWUFRYa0VFdjY3?=
 =?utf-8?B?MEl6TzF5ajhUcWQ0SHVMWHFxUzBoT3hOdDRvL0wrTUlaM2ZKeGtORG9HdnNI?=
 =?utf-8?B?QXhsTmJzQUhKc0ZDMzhMVVlqRkVHZDFYQ3A0Q04wb3FlSXZJS3MwV3ZqWUJ0?=
 =?utf-8?B?S1o4TkpLb2VaZU81R0VTQzJjQVUyV3BCa2Y4S2ZzTVBhVDdBUUEvUFA4ZWhU?=
 =?utf-8?B?MXdXOVBJODR6NkVHWHB3UlcxUHF3RWZsQ21ZZ00waDZxaXVnQVd0K0I0MFkz?=
 =?utf-8?B?cUVWNDhiU0h4WVMxMC9ERGo2YWpTd29BUFlha21PSEl5eVU5OVFienlTZGRq?=
 =?utf-8?B?dUI1bXIxcFRjSGxMcERsRXhyZk1EeVd2VzFnWnBITjlTQkFCVllRQXJSMC9E?=
 =?utf-8?B?d3h0b2dhd3BtMktxZ3czNFRxektnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J+lWVz+fMg3fZtCdC+PXGHYiuxhkYij54Cz79ftvArPeNlHXTnu05oSgzdCDtrynQr8HnlUrXyTK1Cz2ATWPgfh6Z0ZhMujEf/Fubt6u3hcHozQz4xu+k5jt1uIZjODnvuOL8MIGQLHGG6Z0SN1YLbER1T9sPnNpTDGgar44j+3iFaJzG+zxNtTir/NhB+h313SnA1HX6AH711/3bFhDT/D5NkTfj3vbahXM0PECRr+7rjExZceFArx34JQpgWOuzQdL11LDfqxHI7b3IBMIa3ZMwFnIpAoevEuq2rnnXgGsmd0FGrh9vTk9z3NEyNj6RVNyv8Xn3/ZkvNhURcVmL47dFWhE8wEZqd943a4zZz/TM4eyoEZTqrRefYlz0ymc2z5Hle9f3S5uJujobDaKyuf1MRJbD+yZapfA+jeFrEBPMcy06Rq30746ofRh+tpI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:20.6487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50000dac-f7bb-49b2-1ffe-08de5f4c0313
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DB628B187B
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

