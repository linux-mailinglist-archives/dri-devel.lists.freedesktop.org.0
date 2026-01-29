Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBQiLP99e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:34:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB66B1809
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A276410E88E;
	Thu, 29 Jan 2026 15:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VKiUg8s7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E7210E883;
 Thu, 29 Jan 2026 15:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpAX1aYKA9/04Qr2HE2WhnTzGYPP6uxC7DYV9hsaQP1nn1zk16nDFy3PoSgglNYtdw9lB5ssI6HvdflyQHAR0AbulTLUJlNduT1MKw/s31AYv5wTbLZwoCCYV+/A4oQh5FoIaBcz3sLXBi833FPNynMX0TGL1kPwslvXQXal3Nn3wKPc6oRbGindReSoTjIs7JhYCv4m7nTus+adJavX+YuUlEHdqQ8LpiFrULVKnsQ26GrLjVwgNJYAc8EJBznfPZfBLR6f96rKXqsjNrp/BpkdSfjhUeObqgiSHyyQWQ2ddrFhZ+7CkhtLJI9xu/nl+ozr16m2Dg0swHXWZvX2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7EK9MOEX9miS2tYFGSlsz/m5KBza+zxxXOOCldkn9c=;
 b=n/Ppq26T8IKkzWETSbxfnO8aN52tE6WlVCKsM0REnUD+q4DwIqv0hdby1U1KsHmBZrI5L58P5P6lHC4hKrqAWQsZ1/vh2QdfRKCdSLsjg1YfGfBhorrJGXwg5tltQ8ChgiDeZLSxEFcxJalnpKtTY7/xfSPMAvBEWCSC+uG8QJZ+6blX4ZOXmpUYyK+bvdeELEwoTf+zZlwdeK2aQ0kZgkkZsRdVGQVhUDH4PFi43pQMmcx5syO0H5fAPwxBdx/W93NM4Le9cng4Q1FSd476X0DNTZIseiO3c8ucoowPdpS8jOFWot1KX5HYHQnkaV6xMIXMADENJcAJu7t/L1Ql6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7EK9MOEX9miS2tYFGSlsz/m5KBza+zxxXOOCldkn9c=;
 b=VKiUg8s7SWTbE1Q1YSAsg2G9VJHI9LGNtOD5e1fL6t+7YWLEJHCYrjkmiVc4jpP9cGvm9u4hpq+pfFwunUt9IIKADn1d0OFuj/oqX3e6CbDm5IhiMk+IzSC3a8dKC3aszA8IzTyLKW6P+8MjKzIDzLKYCFTb7YRzTQDTKrI3nws=
Received: from BL1P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::14)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 15:34:16 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::9) by BL1P223CA0009.outlook.office365.com
 (2603:10b6:208:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 15:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:34:16 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:34:14 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 01/12] drm/amdgpu: remove gart_window_lock usage from gmc
 v12_1
Date: Thu, 29 Jan 2026 16:33:13 +0100
Message-ID: <20260129153336.7473-2-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a63d50-7411-4849-90c9-08de5f4bdcaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ynk1MzhnejhJanpzbTBjM0ZGcFdSVUxaL01TUkIvMkFnWjcwQ2NSenRoZmRi?=
 =?utf-8?B?Zlo3Y2xPVlhFVVFPV25seVhwVnVVVkJnN0J5RXdaYnJWOFRoTDNhUXdhRjh5?=
 =?utf-8?B?OXFOOHllblVlOEpwNTdiYmFVUjhsOTV3YkF6V3MxMm5tS0dVWXBTM2ZTR3ZM?=
 =?utf-8?B?NkVwTk45YjNnSmRDR1Z3MUpKaGhCN1dhMEhFNUpPd2JUdnV2OHZKRURKQnc0?=
 =?utf-8?B?Njl2SU80aE5aRStsRkNodGlOc1hIQk1VOVdlTHJkcEhSQmhnOUhHNU9wRlFR?=
 =?utf-8?B?RkpPTG5yL29VS0N0a012UVF3d3B2bkNrbnRiT3psWXpDelNnSnJwTHZacVVF?=
 =?utf-8?B?S1RMQk9nRXdWSjZ2YlVMZngybWY4aFc5Z29YdEZrcTNPdmdjWlRiQUNjaHBZ?=
 =?utf-8?B?YldzdXNtWXEvd3VwT2hEQXVqMzdzWm5kUEtZZ2tyOXdlNTZhM2hUelVQZUNr?=
 =?utf-8?B?akdoWk9oYUVaSzhZYTJZN1RpV09NYi9XRjFPSjZnY0RkeXV2QkhLTGlVUTF6?=
 =?utf-8?B?MUZ2SkZ5cDVPVE51Q3VvUmxDUGxGS3I2ekpKQnJHci8zN2E3dnlqaFp0QVJv?=
 =?utf-8?B?bkhhNnNHcG52VlJsUHVlVTM3VHhJbzlJQ05acEhlR3NFL1pCVzl5RU42aEFl?=
 =?utf-8?B?ZFZuMCtaaGZJd1NOREluOG1WYWlWeFdUcXFzSFBuZTZWMnR6ODd6TXJKUkRB?=
 =?utf-8?B?VFBUTXh1V041dXNWL0wzMFVSU2ZkdUdIRWVZV1hoTVArQTNKc1U4d0JnT2U0?=
 =?utf-8?B?OS9WcDFMVkxMSXd3UTZ0UG01ZmNkWGhienZFMlpJcjRDN1RZbFh0QmpvWE1M?=
 =?utf-8?B?aGo4QzNOQSs5d0hpblNBcnp5elRoRjZsNm5wYlY2Y2lnMUFmZi81NDgrY1Rl?=
 =?utf-8?B?MHhLL1pLeUt4MXoybXg1VWtZY3E1OEtGb21ZaExDaHBGdjk1ajlJUHY4SitS?=
 =?utf-8?B?Q25mQ2tCWDRzN1pVZjFPbmIwY1BRWlNhcTNOK2J0a2pIK0VwRnd2NDgvUnhP?=
 =?utf-8?B?bGh5eGtBZnZ4L05EL01GbGxwWnNsOUVwRFVZbkJyUzViaHVoQ0ZwRmE0QmNq?=
 =?utf-8?B?R0FhZXBBNHp3VGRMTEFHZUNwWlpSaTRSQ1ljbEhPem1xZmJBdFdpelMyZjBq?=
 =?utf-8?B?NHZzUDhEdUFtNjNNQmdScXRZMzZyTmN2SkxzZXhoUklGc1ZaS0w0dEwwV2E2?=
 =?utf-8?B?aEVnbnRpdFRGUnhpVUhxam9ySnVnbm5UOVFyaEhZSjRmdkgyRHM2MFVUdXlD?=
 =?utf-8?B?dTBzZWdLNkFGRUtIL3lBUE9WaXBVY1ZnRG1CTE02cEpVdFUxS2VJdVByN1hJ?=
 =?utf-8?B?MmYrTjJGejhpVW95MFloc25Fd0YrSENINkpMK0x5T1ZUM0RhU0pUZVMwRWdC?=
 =?utf-8?B?SHVqbjllb0s4cmY3aDQ4ZlFJRHU0MDdEU1VxeFRJd094L201TEY5MGIxMSty?=
 =?utf-8?B?Z0huZ0hZYXJYb0tXNGtFZk9HbjRSM1NqMEVrbllQeVJCSUtyd08rWVI1RkYv?=
 =?utf-8?B?dTh0b1gzRHYwdEN1azl3YlpwYnZUS0J2RXhzQ3NHaDRNb1hMVFFPcWlhR2l2?=
 =?utf-8?B?Nlc2S1RBdEFHTGxSc3JGNVYyM2hTT095QWxoK3BOMTFIOHZCeUZrQ3AyblNF?=
 =?utf-8?B?L2w1MVhYQVY0ZUVrNDVrQnBkZ3VnNFIyRzRzNkVodVBJYWZPaDZxOTNTZU90?=
 =?utf-8?B?ei81VWQvQk9TeTE2c05kTW80c3JWeHF3eWgyVU41dVN6TXJvVVFOK1NDbTdp?=
 =?utf-8?B?OFlJc0ZFMzZKWWpqTlNKSmQycWVPcU93dmZCV1VkeUs5SmhJRzljVm1rYUox?=
 =?utf-8?B?bVpKMGNIUEgybnh6aE55N21mNkw2bUMzZllZSTNSWWcwUjQ2eXFKb0o4NHpT?=
 =?utf-8?B?cE8vWnBMU1dyOE51MmNLL0hib3JQRUlxR2hHYWQ0aVBxVDVLVktQTFlGdnpy?=
 =?utf-8?B?M1B2aXJ3WjkxZXZZdDlpR2Z3YVRtV1hEYk9uOWNEeEhxL1g5UTJ6S2J3SEZ6?=
 =?utf-8?B?b0dEblFpcU5ZY0dkUFY2U0k0YkhGbEV6WitTQlJQd2lqTG1IdzZzcGI4RGYz?=
 =?utf-8?B?cWlDQ09vdUFiTFJ3cUI0em9jMXR4TGViRmZteWFxV001enJYOCtXYlhnZEUr?=
 =?utf-8?B?c3ZqMTZVVzJyelhhS2Mxb2xaMzNzMkMvRlZETHN4djh0allKNitZbWh6VzFB?=
 =?utf-8?B?aFNyNVpKNGRFc2d6Tld1UFhkSmsrVzU3emM0QW9abjBaT2xZNXhGT0kxQnVa?=
 =?utf-8?B?eDNISkRzbEFIRTJYUkRsb1lNM3NnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ch19xYqQi53TtZ3PPpY77VUq9RC8hjFZ8DMZ3AjuiokPI1taZixkwDi7DdSYxTVS086UDTwtGm4GYmk/SZ0lVx2smZCp91aHluYWzc8FJm4VQbyIitOy+wssWZxsB3LDorEhm62UBMOzcWugIUG6qZ2wtcvNn/3Pr8bMix4YFSMYNnYUisj06jQ9j8XRFDi0GtlE4IpCWkDLIG6BpGwvrYG7TX4K28W6fRp3OkLK3zilS5J6SxgUYEYLQYypAdB7sn8YS0gyk1J9cfpRCWCEtKWq1YSBBFYyJx/naKsAki1BLkHouKGfs5R+yThGjMdxESIVo2MRM8m2bfFJFstUYxJEFxRpbstX9h+8uehvsr/kTpaL9nnOjG3c4Fl+23gNv+CKnjm8Xj8GGvDHTQ/nUroYinYdlky9L55smIrf5jA74NDbXcmchW95HnXvajEr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:34:16.2104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a63d50-7411-4849-90c9-08de5f4bdcaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5EB66B1809
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

