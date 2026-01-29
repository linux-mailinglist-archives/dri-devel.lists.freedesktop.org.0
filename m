Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN/IEV1+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF1B18BC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442D310E897;
	Thu, 29 Jan 2026 15:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gq57Az3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF3210E897;
 Thu, 29 Jan 2026 15:35:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVtwB4RBzR8P/QmmRxf9g4Safh6s0tCqIHgv0cn/fNYFwZIf4giALNx7ON6l0ojrnJnKDOYkBDSiboPlZLtToND+/oDpnxkVSuKk4xFS8VoKeYWf5ZzvtD/Va/1+3DxsTx/Mt4UuKIrL/iMFdgMCS1aGp0DggIaxC+KH0ocqCuV6CnfeZavZguoS84Gvj0OAKiPuSBE4rRlI3LuTEeGNWKjFB3xy1fIDPl1sCqipw9kAvig2q+/s4YfOdrT2lCSwpnoalSEqblJB+0qLN39LlWRK1vF7SlE3eo/ZOvSRRrD8PqGAcaA6PWXxoPdLvmBOSw5hAMlELeujkhuGX1ATag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xr5lADiH3Ok9PAp3wwyVgDIwyLIQTT/j8CgoGSzlu0g=;
 b=EgW+CjwEsOW7Z3S21n7SaWF1z84f85gZbuGug01iJZdoiwnhaUcuxDtbdjvLjv3JMCAdojFkY/6XXc1SL9o8LGq6pbmh6jDcWCWO5BivNqM9BNesqssPljZXO2nJqgz8wGz45GBt2BEowdVnnftrZ9IJfSSHPPJKUKqlk088+JjHxMOwVEwzqNXqkKSV1yLCHBoYjtRIeSIXvU9wQ9Pe6Wf2dWv0Pe6sfv408Cp1gqVWJLkqGFKwcYVrCa5NNXsLEEJQ5RxcDxQ+r+s/ldvjDGH5liUVpwwy3z+JEj21V1d6cWMx6USIqaQdWJn1a2JkkCU/9A+j0uTWvsq40BDdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xr5lADiH3Ok9PAp3wwyVgDIwyLIQTT/j8CgoGSzlu0g=;
 b=Gq57Az3WvrZK7fEeksEZrqNUjai/t9TUvG2L4dzMk9EOXkEBXe8TEVMhrr/KLrKZuS6SIQNTtDHAPLMU6bM2kopvBtZ3Ph6rUDYptQc5E+31j4YqtRmJ+zzcZm7GaxVANcKHrSI0NkrbQHKYo+2inrTFCz52p++DLNXJVnr0Hrc=
Received: from BY3PR05CA0039.namprd05.prod.outlook.com (2603:10b6:a03:39b::14)
 by LV2PR12MB5871.namprd12.prod.outlook.com (2603:10b6:408:174::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 15:35:49 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::ab) by BY3PR05CA0039.outlook.office365.com
 (2603:10b6:a03:39b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Thu,
 29 Jan 2026 15:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:48 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:42 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 12/12] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
Date: Thu, 29 Jan 2026 16:33:24 +0100
Message-ID: <20260129153336.7473-13-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|LV2PR12MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 732a167e-ebbe-4f7b-e5d0-08de5f4c13c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFJaeVVCcERBck9LeExqemF6bE9vNDRtcnN0TEkyeHBJcHNIYUZWYmNkRTJr?=
 =?utf-8?B?clJpcnl4YnhTNTFTSW9DRjk3VW56djBhbEliTnBxU3FuMlNZTXNhOElRdGVz?=
 =?utf-8?B?U2dHVStORk8rSEFwaDcxZU8rd0FVOEkwaHk3Nzl4M3pWOHVKUWJvdVY1dm8z?=
 =?utf-8?B?OGUyNWtYak1scmVGeDBhK3pRb1dqS3V4WU1EdmtQMlpRSkI2TnpRNmVsYmk3?=
 =?utf-8?B?R3hMNzlpR3dyczJFL0RlbWQzNStmbW1Yc1YvWjlpM04xYTU2K2lhUm1FQlJ0?=
 =?utf-8?B?cFJ6NFI3WkI4MlpCdVoxbzREejZvZWY0YXVoblV4TzA0R2l2QTMxMEZKSzlx?=
 =?utf-8?B?TlZQWGNxZjhabmdaSFIweFRkTk03UW9wWXJSUlFOV2wzOTVNZXZSNkdiNkwv?=
 =?utf-8?B?THM0dG1oOW9jUk1QV2NYaHgvM1o4c3g3R2l2RS8yOWU1WU1wTjhuY292R3VQ?=
 =?utf-8?B?dnNpSHROK3VnZ1piWU4vRGRBWnlFWGk3bGZhNXh4SEhmTlFtT2VHZmJLMHda?=
 =?utf-8?B?WXJRT3RyQVMrbS9EVHJYbFBxTk1wekhDZC9iUzBPUHlUdjNXMTd1cEl3Y3lF?=
 =?utf-8?B?bmVQbHhJbCtxNWkxQSt0M1ZmWGVnMTJ6Sy9oR1NkeXhXZGpPaWE0VmVBMTB0?=
 =?utf-8?B?SjdUZGwyOVRTR3FKQmY4cG5laExZRU1vcHl6VFhqZ0lJamRhbU03dUlHUDhB?=
 =?utf-8?B?R241azBMY2tRTGMwcGtFYUNRUW00T0xiUkF4QkFLdzU1Q0tDTkx2c1o1OEYr?=
 =?utf-8?B?Y1lic0ZNTVJhanFzckluNHFvU3pDMWZRMDJaSUEzbkl3R285QlJQdVFjQ05T?=
 =?utf-8?B?c3k4VXZvbkQ1YSs0Q1ZtSG1DOWQ1aW9ERDJUK3VVQ0xiVEhPZTdxNTV6eTNU?=
 =?utf-8?B?T2J4SDR2OFpaWE1NcHBudWxCTyt4Y1RsZWNUQTc1U3RLV01FbTNGQTZMTERy?=
 =?utf-8?B?TjdCMys4S3VrOFNXbVRCSGlnaWxtK2lpam41R0ZCVGJ5VHJnVVpnd3E1LzVX?=
 =?utf-8?B?OG95bWtOTlhYQ0lDTTRvRFMxT2RCcGdvVEpIU2diMmZRVjZkRTFGQ3h4bkZu?=
 =?utf-8?B?cVhBaC94T0t1U1Z1NkFMUXZHYlAweEgxbGRoUjhxVTFYK3FDTHVsUS9ydFRN?=
 =?utf-8?B?cExqK2dUWG9QK2lJb2NucDVHYjdnSXl3WXZCdEV1UzlwdnpjbmRYRTBYYlUw?=
 =?utf-8?B?eHlUUlR0bXE2YXJrQTNQMUFRdmlJNjB2WHhsSEZHT0NJNk0vRUlwR05XT2JF?=
 =?utf-8?B?NzdhT0I5LzZjblFUTUszTEFKMEZaTlBWRXpWMEJkWkp6dVVBRTJNRWpBdll0?=
 =?utf-8?B?emJBQkk3VUZCeVZ4UWYrRnFST2lZc2xENHZTMnEwbDEzb0RjWENYM1JEcWI0?=
 =?utf-8?B?TGhhMVVDcmZPVFduV1l4Rko5bVpMZWFtL0lFQ2V0ekJtQWY0aHlvOGZGNjFR?=
 =?utf-8?B?Ymw4cFdCS3hGOVRWRU4rcUF1aXNOTDFSOTNtcUppTFRWYTRMS21HdG00a0Fa?=
 =?utf-8?B?Y0hZN3l5am9WdTQ4c1Z6ak5KRHkrMnJzbS9aZ2VpZi90L1Y2VDY3SUdZa2k5?=
 =?utf-8?B?Szc1RUFibjhPNU9tQ1JEWVQ3WGVQNE0vdG1kOGh6LzBFTFFDYU5Rc2MwN2VY?=
 =?utf-8?B?Yk9UK0lIL29XUUN3NW93ZmFrKzk2Q3VRYnBvMzFzeDdmZnQycUtNT1p3QWFx?=
 =?utf-8?B?ZGNEUnJuY2xBWk03dndOaHBXUUZ4YUFXSmt5WkxMb3hzMFdCdEhTbTRiRi85?=
 =?utf-8?B?alVydG5CVG9xa3NXWERhcmVVQzR6aFRpb2d6QWFqbzRLUmRoZFQ4U1J0YzZ3?=
 =?utf-8?B?VjRDMU54WXdiblhQVU0yamlQU0hJR1I4NVU2SWdZTUpFVExHZklzVE0xblBE?=
 =?utf-8?B?cllJdksvMlZTTlZQYTJnYTE4SGMzRmRNMDJyRjVJM0pQbWFQd1phcVZ4Vnds?=
 =?utf-8?B?TkR0RXR3UGhQaTEwTUJhdVlDZXlhVGVTU3A5RVVFUC83NytOMWd3eE1PZ1NC?=
 =?utf-8?B?eXF6cEJCUkFLcWhyaGhmUkZwWndCK0RRT3ZqUkdlS2x0UW5SOENCWnpGYWlW?=
 =?utf-8?B?MEJSckpSTmZJNTR5S3RsUEZwN3dKNmFZYnBQZG5WVStiNXI5Q092eVZqcEhT?=
 =?utf-8?B?REVkSlRIUG1sdWEyYVJUMUhJT2t6SUtrM1oyZXlMM25zNUpOMzN4UmNIUXlp?=
 =?utf-8?B?WWJpTU5BSUZSdER6aXM3UDhEdlZTWkN1eWhocFJRMm9OV2JiU0w0R0EvRWRp?=
 =?utf-8?B?WkY5OWNqMGJkQjk5L0lOZnp3Z21nPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kLhAauJRAqHa0kSBhlAPZkO46q2DFrTEqDyT0e2v4tB7Q+VcW9a1CljgPF76SfDYyGCL7R2QtPIEwEh5nWM+YVWZ+Oo4pgM3SS/per+Y0y4ZdX5/SRYnLyz9l5YYrAlfeZYq9tEoBYuaeidcst2xEK6N0OL6yqxs6FP3vjIA9EhUsVKl8MkWd6cud3Zt1DOMPkbsohP1N7lyirCKWnc/OQHSIM07T+Cu8dXv+NR4wBZa86+WVO+2S4eSuz1DOloe7td34NrlrKrwV1zI+ZUSwlhQSxGNBWyTjMKOQV+b1AwyN8K86VVCfxEIs+aVE60kCHuqsrorqhN9lcEWr0zWRD1GUTkOqaCyP8bHhHRV+LQO2Gv/wdneVUT69WMD+GB1wbK2+9ae3p5a/A8C681FfrKaoXhrrF6bUcStJP9S/fWgBOSIgZmA01OOdhnCNCgd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:48.5474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 732a167e-ebbe-4f7b-e5d0-08de5f4c13c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5871
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
X-Rspamd-Queue-Id: EBFF1B18BC
X-Rspamd-Action: no action

It avoids duplicated code and allows to output a warning.

---
v4: move check inside the existing if (enable) test
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 362ab2b34498..98aead91b98b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3158,9 +3158,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->mman.buffer_funcs_ring &&
-	    adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
@@ -4052,8 +4050,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	if (r)
 		return r;
@@ -5199,8 +5196,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	return 0;
 
 unwind_evict:
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 	amdgpu_fence_driver_hw_init(adev);
 
 unwind_userq:
@@ -5931,8 +5927,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
-					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
+				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
 				if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7eaaf5d4db94..10943311ce94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2354,6 +2354,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
+		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {
+			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
+			return;
+		}
+
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
-- 
2.43.0

