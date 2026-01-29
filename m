Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFE7EGJ+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:36:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E016AB18E0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B88C10E89A;
	Thu, 29 Jan 2026 15:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L1S8pbUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011041.outbound.protection.outlook.com [52.101.52.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F034A10E897;
 Thu, 29 Jan 2026 15:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+YbNwG0u24euQhCOi8XU7oaz4SjCxW7+s9hs2mwAEsmJs331WWBgEekSAaEw1rUwvkvnWhElcpIySeRuGVr/8voHG7bAsMgTdP43yrFGLjDBRznYXBUOQQijSmrPzooPmYr3oCJ1BsYZe8mf/+fAu7M+PdJukPfYsk2KX3DCU8iI6bmYNOGKC6A59T7zYdjOHV7WSic5JayFXSb3ceq+3wO0Q/w3WYBGhGRW7QLtYIcPirLBdtPc8fNQwij+auDGlO69/aQsygJoNoygrpxkOEnglDogRdusAvAVzdPcgely7FZcTdMtqVUj3csTs+HWIUuw9QgR8Eif07FQumlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUJgQNaRBrdks0IGOfQ2wLHG2cwB7r1CNUk9b45BhBs=;
 b=ri5uK5X3U7o7c4jPw8ZlyhElBBkfo/6ppree6Jj0VuA4bGbjs2EYLsT0g3/WRRjX/1f3N0E+4Oq/ENeQBwk4Lzn1e/k3mVfLfOQ/9hLpyvJfBRwqZ2ltjFf3mj4PtomgcjV0W65UAqPmT9dskwoDQAkbl0vDtZAdCPyLb/ocIWYFUuoV7ho/4L2VVhjLgFS4xguLMPYTx6Aje4c+c8y+Os+Pd6CxEz9LDyVwlNczMru4ysrNuMLR1+9e086IveM1w+I81FE5qYURxQ3KbcrskNUXFZeHUoZIXwZGGGDQtqIvP32dXcD9R9E70AQ/E37APrnbXQfXpReq3cXs8VXU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUJgQNaRBrdks0IGOfQ2wLHG2cwB7r1CNUk9b45BhBs=;
 b=L1S8pbULWsKNgODZO/D8z8GnKXxvREYubt7u4MCj+eKoMBX/AVgvpJ7xQ7uMfRbYF20avBO11J35pNHtA5m5BXNTjkz1fljxQhx87r43uwIOHanD9NoTfVZc+lzh9ejBlgr06mswlJM+ScZwTwzMdkMB6DZlQAGOLIEDco0ahDo=
Received: from BY3PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:39b::12)
 by CH1PR12MB9672.namprd12.prod.outlook.com (2603:10b6:610:2b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 15:35:48 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::29) by BY3PR05CA0037.outlook.office365.com
 (2603:10b6:a03:39b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Thu,
 29 Jan 2026 15:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:35:47 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:35:38 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 11/12] drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
Date: Thu, 29 Jan 2026 16:33:23 +0100
Message-ID: <20260129153336.7473-12-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|CH1PR12MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ecbe80-f341-430b-1e9e-08de5f4c1300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEZpcm1QZlhRbGxQTkJJbkxxVS9yM3dPR2FuRFBlNjN4WDZkMVh4TkFEcUxq?=
 =?utf-8?B?dkZzNWVmNFVJWjFBZjFPUUVLNWtTc1RiaVdqdFNSNElnODlaSWZoZmtUbUdP?=
 =?utf-8?B?TngydzlpMUVGKzZKQXdKbEhLMEtBVk9pMkVSRzBEQzA0WG5pbXkyVTNWUnpP?=
 =?utf-8?B?NUxVNGYzZmRENmVkdkZDUDZEUlBFQkdEc1lpN0w0YVhFVGlMcDFZVmczb2hH?=
 =?utf-8?B?N0N3Qzh2bVVBWFJhS0EwTzE4M2ttRFBTSWRoOGhicmZJbFRiSkVkN1MvTEpq?=
 =?utf-8?B?WjNZV251WS9rVTJJQ0tUYVYzSTJaMXExNkRyTlk0NDUyRzROUlJvby96ZXBo?=
 =?utf-8?B?RXliZy83TVBIcmRQVXBmVnFySHhZb2ZuZzJkWGFjdjVLTE02dkpIRjdxMWlm?=
 =?utf-8?B?Y2habVBENzFUZlovcjJBWkMrN1hVRlAwajZoZmJUNkR1VU9kY3JuOGc4ZFND?=
 =?utf-8?B?T1BMcjFBTCtZc1lzei9FQ1VVYUJjVEhDOU05WVJaODJUZjBmWlNDVHFGakFC?=
 =?utf-8?B?TUF5NkZScXFPa0g3Z2s1bDRadkdXK3pIZEp4dDBkN2poM1h4MVkydlpiY09Z?=
 =?utf-8?B?Zml6Ukx1bUx0UlZYNUNCWHZGaFBOQkduWkdGcUppZERDYTlORlBCOVFjdUpS?=
 =?utf-8?B?d25DUTUySWgxM0Mwa0pUY2hxbkIyWWgySWVMNUFWV3hZaFJhQzVSaDRMeDJ6?=
 =?utf-8?B?ZFRvRURPZnh5SGxPVGJST28xZlFuSkpzSHNwTVc2aVpIMDBPWU8yYzMwT0xK?=
 =?utf-8?B?bVRhMmFJQW1adnc2Zlg3b2VMQUV6SjN2UVhJdzdrRFFjRGZGdFNuS0JJNHhy?=
 =?utf-8?B?ZVBmVlJ0dGRyK1k2TFI0eHYyR3BVanR1NHg2ZUgrdmF1SVRFRHJLWnhrTHk4?=
 =?utf-8?B?ZkJPaFJNR1kzc1c2N294Vit6c281YjBLVndvM2dFZjFwNHZ6N0c4Z3BSNjI4?=
 =?utf-8?B?UkRaTTJNSzFCYkZnak9DTzg2aHg5QWduejQ3S2dsMC82SUZYS29ENVVmS3Qz?=
 =?utf-8?B?d3ExMVZSS2QrdnVNS0dlOTZSU1VUbTdCRk1zSk9POEZYOUFrMGFQdjY5cDI5?=
 =?utf-8?B?NGdvZ2NMUTFwaTB4NVRaYmhXOVNCa1M4Wm1Xamw5YnFvSm84YmpScXlZcGFk?=
 =?utf-8?B?Y2R6ZXVQWElKdXVkWmI3Uk5qeTZVRkhEU2FGQnJ3aVpORGNTSkxTYlBvcUc5?=
 =?utf-8?B?VUFEQW1wV3BBS2Q4S0s0VmtscXJpTUgySVluMGx3Q3JkKzh0cWlucGp6cjVE?=
 =?utf-8?B?Q2FPaW1CdkVNV2U2cGZ1WG1Ya3FDVEpYd3hQYVVJS29ta2Qvdm1nNVgrYWQw?=
 =?utf-8?B?eDJiQzhFYU1yVjBlbFFIL00zZ201aU1lRC84QjVmRkZ6Uld6VkI5U1UzRGpr?=
 =?utf-8?B?NEp4VGN4cTVxbE4xclJqMFo0TDBqeVdFTHFiUlBkQ1lCNTJJOWZFTW5UTGJ4?=
 =?utf-8?B?YkVFdmEvVFFoeHhGcnAxcHNpZzlOV3Zib3Jqa01kUnVuTE53UlAySnFPSThz?=
 =?utf-8?B?cFRrL1h5L0RtUXdZWkJ6WUtVSUplaGtmL3pLa0tsYVZxYUplQUpmM2N6VE5u?=
 =?utf-8?B?Y3FpVFFpL1c0UGJHZFpXeC9TMjlBclYxRGNtNFdZbFdPakRYWjRSSGNTc0lw?=
 =?utf-8?B?bDRJMmdjY0pNNDNubFBScEkwdjRRbzdtYUMxcW0vRTJZVUhJWVRjR2VxYzZH?=
 =?utf-8?B?eTRoSk5DandvQVFNN2VwUEFvQWVzVEpFMmZCM0w1bURDTS81SXVVbDJXOXBa?=
 =?utf-8?B?SUFsT3pSRys3RDFZOVI0ek10MU8yeks1MUxRT0IxUE83UHRIU284ZWNHdEVK?=
 =?utf-8?B?S05RUE90V0p2eERodmg5bjFJdEM2TDhyeWVvOXJEV0o4NXZPVDdDNHkxOUI4?=
 =?utf-8?B?cHY4NlFJbC9JRFIyMGtNOVEwWitIWFVYTnBiYmdOVVFDZmxmeXRtNW1SVVlU?=
 =?utf-8?B?MENSS3Z5a1NVbFhYaEpkOGV0ajBnQThkc0FCNmZkWnZjWkZiMTBoeXo5bGhm?=
 =?utf-8?B?U0RnYWUvTXZ5TnRyajlQU2pkdTBQallVZmJjaW1IQzF1YXRyU3ZVRjRQeTlM?=
 =?utf-8?B?WS91aXdpVHE4bGpzV0taMldDVmZ1NWhWMSthQWpaS3JQalE4SXBMaVJFVXQr?=
 =?utf-8?B?S0RzTmsxNkF2aFZoOHBJeGVXc2dtSzB3R3RSazVPQlVTNHJVREQ4a0FCb2lR?=
 =?utf-8?B?NlM2Q2xnbXlUNVNPL3gxdHY4MjBXWEdtNlQrTk9yUWQvUmZQTU9rYSsxYTc3?=
 =?utf-8?B?ditxa00zT2NrZmgxd3NtK096M1hRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sTXJrJd0Oql9+MpBoPIZHhMJdx2zBSK8/byO4DXz8QWvJJhxZAym03uKdKVruMNzYdhosd4EtC8TaVMfzo9FkyyHTwj6Ej0/3raUTRxF8yJJctYRYtDXUYp5uz7P/mK8qn3qiY4MAb8dTxnahjwmiyjPdLg9drVhu/23Q9DfFqyP/pNJ5VKomNnUpL5zLFqcwp8gHJhyhmKKYEFjs8tzwKuSoW2tojueB9irk4E4IfdnFNaY2DxEvKzkyqKDtnK53h6iHfWXoUT7KalPbLaUYou5LRLXPb7c2BC+YwJ9gaOrhZuAGzhKUURVh8LsZhwIAzeC3IUqdFR5MfDWuvr/tp5hvyJCkzKiIYFTykuMfBbmca7iH8XepZ3PMvXInq4FTZpX25eW0dDWAFkZ22Edg2yM/XNUPn8CKIN3hQ5ueRBN4oYEnmZHQiO7WnytEcjb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:35:47.3387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ecbe80-f341-430b-1e9e-08de5f4c1300
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9672
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
X-Rspamd-Queue-Id: E016AB18E0
X-Rspamd-Action: no action

All sdma versions used the same logic, so add a helper and move the
common code to a single place.

---
v2: pass amdgpu_vm_pte_funcs as well
v3: drop all the *_set_vm_pte_funcs one liners
v5: rebased
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 17 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 35 ++++++------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 35 ++++++------------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 31 ++++++---------------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 29 ++++++--------------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   | 29 ++++++--------------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c   | 29 ++++++--------------
 drivers/gpu/drm/amd/amdgpu/si_dma.c      | 31 ++++++---------------
 13 files changed, 113 insertions(+), 249 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9c11535c44c6..31b63f88de0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1528,6 +1528,8 @@ struct dma_fence *amdgpu_device_enforce_isolation(struct amdgpu_device *adev,
 bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
 ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
+void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
+				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6a2ea200d90c..24c1f95ec507 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3227,3 +3227,20 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
 		task_info->process_name, task_info->tgid,
 		task_info->task.comm, task_info->task.pid);
 }
+
+void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
+				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs)
+{
+	struct drm_gpu_scheduler *sched;
+	int i;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (adev->sdma.has_page_queue)
+			sched = &adev->sdma.instance[i].page.sched;
+		else
+			sched = &adev->sdma.instance[i].ring.sched;
+		adev->vm_manager.vm_pte_scheds[i] = sched;
+	}
+	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
+	adev->vm_manager.vm_pte_funcs = vm_pte_funcs;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 9e8715b4739d..22780c09177d 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -53,7 +53,6 @@ static const u32 sdma_offsets[SDMA_MAX_INSTANCE] =
 static void cik_sdma_set_ring_funcs(struct amdgpu_device *adev);
 static void cik_sdma_set_irq_funcs(struct amdgpu_device *adev);
 static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev);
-static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev);
 static int cik_sdma_soft_reset(struct amdgpu_ip_block *ip_block);
 
 u32 amdgpu_cik_gpu_check_soft_reset(struct amdgpu_device *adev);
@@ -919,6 +918,14 @@ static void cik_enable_sdma_mgls(struct amdgpu_device *adev,
 	}
 }
 
+static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = cik_sdma_vm_copy_pte,
+
+	.write_pte = cik_sdma_vm_write_pte,
+	.set_pte_pde = cik_sdma_vm_set_pte_pde,
+};
+
 static int cik_sdma_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -933,7 +940,7 @@ static int cik_sdma_early_init(struct amdgpu_ip_block *ip_block)
 	cik_sdma_set_ring_funcs(adev);
 	cik_sdma_set_irq_funcs(adev);
 	cik_sdma_set_buffer_funcs(adev);
-	cik_sdma_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &cik_sdma_vm_pte_funcs);
 
 	return 0;
 }
@@ -1337,26 +1344,6 @@ static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = cik_sdma_vm_copy_pte,
-
-	.write_pte = cik_sdma_vm_write_pte,
-	.set_pte_pde = cik_sdma_vm_set_pte_pde,
-};
-
-static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &cik_sdma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version cik_sdma_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 92ce580647cd..0090ace49024 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -51,7 +51,6 @@
 
 static void sdma_v2_4_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v2_4_set_irq_funcs(struct amdgpu_device *adev);
 
 MODULE_FIRMWARE("amdgpu/topaz_sdma.bin");
@@ -809,6 +808,14 @@ static void sdma_v2_4_ring_emit_wreg(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, val);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v2_4_vm_copy_pte,
+
+	.write_pte = sdma_v2_4_vm_write_pte,
+	.set_pte_pde = sdma_v2_4_vm_set_pte_pde,
+};
+
 static int sdma_v2_4_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -822,7 +829,7 @@ static int sdma_v2_4_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v2_4_set_ring_funcs(adev);
 	sdma_v2_4_set_buffer_funcs(adev);
-	sdma_v2_4_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v2_4_vm_pte_funcs);
 	sdma_v2_4_set_irq_funcs(adev);
 
 	return 0;
@@ -1232,26 +1239,6 @@ static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v2_4_vm_copy_pte,
-
-	.write_pte = sdma_v2_4_vm_write_pte,
-	.set_pte_pde = sdma_v2_4_vm_set_pte_pde,
-};
-
-static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v2_4_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 2,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 1c076bd1cf73..2526d393162a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -51,7 +51,6 @@
 
 static void sdma_v3_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v3_0_set_irq_funcs(struct amdgpu_device *adev);
 
 MODULE_FIRMWARE("amdgpu/tonga_sdma.bin");
@@ -1082,6 +1081,14 @@ static void sdma_v3_0_ring_emit_wreg(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, val);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v3_0_vm_copy_pte,
+
+	.write_pte = sdma_v3_0_vm_write_pte,
+	.set_pte_pde = sdma_v3_0_vm_set_pte_pde,
+};
+
 static int sdma_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1102,7 +1109,7 @@ static int sdma_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v3_0_set_ring_funcs(adev);
 	sdma_v3_0_set_buffer_funcs(adev);
-	sdma_v3_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v3_0_vm_pte_funcs);
 	sdma_v3_0_set_irq_funcs(adev);
 
 	return 0;
@@ -1674,26 +1681,6 @@ static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v3_0_vm_copy_pte,
-
-	.write_pte = sdma_v3_0_vm_write_pte,
-	.set_pte_pde = sdma_v3_0_vm_set_pte_pde,
-};
-
-static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v3_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			 &adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index f38004e6064e..a35d9951e22a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -129,7 +129,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_4_0[] = {
 
 static void sdma_v4_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v4_0_set_irq_funcs(struct amdgpu_device *adev);
 static void sdma_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 
@@ -1751,6 +1750,14 @@ static bool sdma_v4_0_fw_support_paging_queue(struct amdgpu_device *adev)
 	}
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v4_0_vm_copy_pte,
+
+	.write_pte = sdma_v4_0_vm_write_pte,
+	.set_pte_pde = sdma_v4_0_vm_set_pte_pde,
+};
+
 static int sdma_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1769,7 +1776,7 @@ static int sdma_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v4_0_set_ring_funcs(adev);
 	sdma_v4_0_set_buffer_funcs(adev);
-	sdma_v4_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_0_vm_pte_funcs);
 	sdma_v4_0_set_irq_funcs(adev);
 	sdma_v4_0_set_ras_funcs(adev);
 
@@ -2615,30 +2622,6 @@ static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
 		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v4_0_vm_copy_pte,
-
-	.write_pte = sdma_v4_0_vm_write_pte,
-	.set_pte_pde = sdma_v4_0_vm_set_pte_pde,
-};
-
-static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	struct drm_gpu_scheduler *sched;
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v4_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->sdma.has_page_queue)
-			sched = &adev->sdma.instance[i].page.sched;
-		else
-			sched = &adev->sdma.instance[i].ring.sched;
-		adev->vm_manager.vm_pte_scheds[i] = sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 static void sdma_v4_0_get_ras_error_count(uint32_t value,
 					uint32_t instance,
 					uint32_t *sec_count)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index a1443990d5c6..7f77367848d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -104,7 +104,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_4_4_2[] = {
 
 static void sdma_v4_4_2_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_set_irq_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_set_ras_funcs(struct amdgpu_device *adev);
 static void sdma_v4_4_2_update_reset_mask(struct amdgpu_device *adev);
@@ -1347,6 +1346,14 @@ static const struct amdgpu_sdma_funcs sdma_v4_4_2_sdma_funcs = {
 	.soft_reset_kernel_queue = &sdma_v4_4_2_soft_reset_engine,
 };
 
+static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v4_4_2_vm_copy_pte,
+
+	.write_pte = sdma_v4_4_2_vm_write_pte,
+	.set_pte_pde = sdma_v4_4_2_vm_set_pte_pde,
+};
+
 static int sdma_v4_4_2_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1362,7 +1369,7 @@ static int sdma_v4_4_2_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v4_4_2_set_ring_funcs(adev);
 	sdma_v4_4_2_set_buffer_funcs(adev);
-	sdma_v4_4_2_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_4_2_vm_pte_funcs);
 	sdma_v4_4_2_set_irq_funcs(adev);
 	sdma_v4_4_2_set_ras_funcs(adev);
 	return 0;
@@ -2316,30 +2323,6 @@ static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
 		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v4_4_2_vm_copy_pte,
-
-	.write_pte = sdma_v4_4_2_vm_write_pte,
-	.set_pte_pde = sdma_v4_4_2_vm_set_pte_pde,
-};
-
-static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	struct drm_gpu_scheduler *sched;
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v4_4_2_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		if (adev->sdma.has_page_queue)
-			sched = &adev->sdma.instance[i].page.sched;
-		else
-			sched = &adev->sdma.instance[i].ring.sched;
-		adev->vm_manager.vm_pte_scheds[i] = sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 /**
  * sdma_v4_4_2_update_reset_mask - update  reset mask for SDMA
  * @adev: Pointer to the AMDGPU device structure
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 7811cbb1f7ba..445e2b4828b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -110,7 +110,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_5_0[] = {
 
 static void sdma_v5_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v5_0_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v5_0_stop_queue(struct amdgpu_ring *ring);
 static int sdma_v5_0_restore_queue(struct amdgpu_ring *ring);
@@ -1357,6 +1356,13 @@ static const struct amdgpu_sdma_funcs sdma_v5_0_sdma_funcs = {
 	.soft_reset_kernel_queue = &sdma_v5_0_soft_reset_engine,
 };
 
+static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v5_0_vm_copy_pte,
+	.write_pte = sdma_v5_0_vm_write_pte,
+	.set_pte_pde = sdma_v5_0_vm_set_pte_pde,
+};
+
 static int sdma_v5_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1368,7 +1374,7 @@ static int sdma_v5_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v5_0_set_ring_funcs(adev);
 	sdma_v5_0_set_buffer_funcs(adev);
-	sdma_v5_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_0_vm_pte_funcs);
 	sdma_v5_0_set_irq_funcs(adev);
 	sdma_v5_0_set_mqd_funcs(adev);
 
@@ -2073,27 +2079,6 @@ static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
 	}
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v5_0_vm_copy_pte,
-	.write_pte = sdma_v5_0_vm_write_pte,
-	.set_pte_pde = sdma_v5_0_vm_set_pte_pde,
-};
-
-static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	if (adev->vm_manager.vm_pte_funcs == NULL) {
-		adev->vm_manager.vm_pte_funcs = &sdma_v5_0_vm_pte_funcs;
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			adev->vm_manager.vm_pte_scheds[i] =
-				&adev->sdma.instance[i].ring.sched;
-		}
-		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-	}
-}
-
 const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 5,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index dbe5b8f109f6..4a98042a6578 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -111,7 +111,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_5_2[] = {
 
 static void sdma_v5_2_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v5_2_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v5_2_stop_queue(struct amdgpu_ring *ring);
 static int sdma_v5_2_restore_queue(struct amdgpu_ring *ring);
@@ -1248,6 +1247,13 @@ static void sdma_v5_2_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
 	amdgpu_ring_emit_reg_wait(ring, reg1, mask, mask);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v5_2_vm_copy_pte,
+	.write_pte = sdma_v5_2_vm_write_pte,
+	.set_pte_pde = sdma_v5_2_vm_set_pte_pde,
+};
+
 static int sdma_v5_2_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1259,7 +1265,7 @@ static int sdma_v5_2_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v5_2_set_ring_funcs(adev);
 	sdma_v5_2_set_buffer_funcs(adev);
-	sdma_v5_2_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_2_vm_pte_funcs);
 	sdma_v5_2_set_irq_funcs(adev);
 	sdma_v5_2_set_mqd_funcs(adev);
 
@@ -2084,27 +2090,6 @@ static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
 	}
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v5_2_vm_copy_pte,
-	.write_pte = sdma_v5_2_vm_write_pte,
-	.set_pte_pde = sdma_v5_2_vm_set_pte_pde,
-};
-
-static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	if (adev->vm_manager.vm_pte_funcs == NULL) {
-		adev->vm_manager.vm_pte_funcs = &sdma_v5_2_vm_pte_funcs;
-		for (i = 0; i < adev->sdma.num_instances; i++) {
-			adev->vm_manager.vm_pte_scheds[i] =
-				&adev->sdma.instance[i].ring.sched;
-		}
-		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-	}
-}
-
 const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 5,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index eec659194718..45d13ac09f9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -120,7 +120,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_6_0[] = {
 
 static void sdma_v6_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v6_0_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v6_0_start(struct amdgpu_device *adev);
 
@@ -1280,6 +1279,13 @@ static void sdma_v6_0_get_csa_info(struct amdgpu_device *adev,
 	csa_info->alignment = SDMA6_CSA_ALIGNMENT;
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 7,
+	.copy_pte = sdma_v6_0_vm_copy_pte,
+	.write_pte = sdma_v6_0_vm_write_pte,
+	.set_pte_pde = sdma_v6_0_vm_set_pte_pde,
+};
+
 static int sdma_v6_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1308,7 +1314,7 @@ static int sdma_v6_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v6_0_set_ring_funcs(adev);
 	sdma_v6_0_set_buffer_funcs(adev);
-	sdma_v6_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v6_0_vm_pte_funcs);
 	sdma_v6_0_set_irq_funcs(adev);
 	sdma_v6_0_set_mqd_funcs(adev);
 	sdma_v6_0_set_ras_funcs(adev);
@@ -1902,25 +1908,6 @@ static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 7,
-	.copy_pte = sdma_v6_0_vm_copy_pte,
-	.write_pte = sdma_v6_0_vm_write_pte,
-	.set_pte_pde = sdma_v6_0_vm_set_pte_pde,
-};
-
-static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v6_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 6,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 8d16ef257bcb..f938be0524cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -119,7 +119,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_7_0[] = {
 
 static void sdma_v7_0_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v7_0_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v7_0_start(struct amdgpu_device *adev);
 
@@ -1264,6 +1263,13 @@ static void sdma_v7_0_get_csa_info(struct amdgpu_device *adev,
 	csa_info->alignment = SDMA7_CSA_ALIGNMENT;
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
+	.copy_pte_num_dw = 8,
+	.copy_pte = sdma_v7_0_vm_copy_pte,
+	.write_pte = sdma_v7_0_vm_write_pte,
+	.set_pte_pde = sdma_v7_0_vm_set_pte_pde,
+};
+
 static int sdma_v7_0_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1294,7 +1300,7 @@ static int sdma_v7_0_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v7_0_set_ring_funcs(adev);
 	sdma_v7_0_set_buffer_funcs(adev);
-	sdma_v7_0_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_0_vm_pte_funcs);
 	sdma_v7_0_set_irq_funcs(adev);
 	sdma_v7_0_set_mqd_funcs(adev);
 	adev->sdma.get_csa_info = &sdma_v7_0_get_csa_info;
@@ -1843,25 +1849,6 @@ static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
-	.copy_pte_num_dw = 8,
-	.copy_pte = sdma_v7_0_vm_copy_pte,
-	.write_pte = sdma_v7_0_vm_write_pte,
-	.set_pte_pde = sdma_v7_0_vm_set_pte_pde,
-};
-
-static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v7_0_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 7,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
index 5bc45c3e00d1..16031b8d310a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c
@@ -110,7 +110,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_7_1[] = {
 
 static void sdma_v7_1_set_ring_funcs(struct amdgpu_device *adev);
 static void sdma_v7_1_set_buffer_funcs(struct amdgpu_device *adev);
-static void sdma_v7_1_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void sdma_v7_1_set_irq_funcs(struct amdgpu_device *adev);
 static int sdma_v7_1_inst_start(struct amdgpu_device *adev,
 				uint32_t inst_mask);
@@ -1248,6 +1247,13 @@ static void sdma_v7_1_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
 	amdgpu_ring_emit_reg_wait(ring, reg1, mask, mask);
 }
 
+static const struct amdgpu_vm_pte_funcs sdma_v7_1_vm_pte_funcs = {
+	.copy_pte_num_dw = 8,
+	.copy_pte = sdma_v7_1_vm_copy_pte,
+	.write_pte = sdma_v7_1_vm_write_pte,
+	.set_pte_pde = sdma_v7_1_vm_set_pte_pde,
+};
+
 static int sdma_v7_1_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -1261,7 +1267,7 @@ static int sdma_v7_1_early_init(struct amdgpu_ip_block *ip_block)
 
 	sdma_v7_1_set_ring_funcs(adev);
 	sdma_v7_1_set_buffer_funcs(adev);
-	sdma_v7_1_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_1_vm_pte_funcs);
 	sdma_v7_1_set_irq_funcs(adev);
 	sdma_v7_1_set_mqd_funcs(adev);
 
@@ -1764,25 +1770,6 @@ static void sdma_v7_1_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs sdma_v7_1_vm_pte_funcs = {
-	.copy_pte_num_dw = 8,
-	.copy_pte = sdma_v7_1_vm_copy_pte,
-	.write_pte = sdma_v7_1_vm_write_pte,
-	.set_pte_pde = sdma_v7_1_vm_set_pte_pde,
-};
-
-static void sdma_v7_1_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &sdma_v7_1_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version sdma_v7_1_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 7,
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 74fcaa340d9b..3e58feb2d5e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -37,7 +37,6 @@ const u32 sdma_offsets[SDMA_MAX_INSTANCE] =
 
 static void si_dma_set_ring_funcs(struct amdgpu_device *adev);
 static void si_dma_set_buffer_funcs(struct amdgpu_device *adev);
-static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev);
 static void si_dma_set_irq_funcs(struct amdgpu_device *adev);
 
 /**
@@ -473,6 +472,14 @@ static void si_dma_ring_emit_wreg(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, val);
 }
 
+static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
+	.copy_pte_num_dw = 5,
+	.copy_pte = si_dma_vm_copy_pte,
+
+	.write_pte = si_dma_vm_write_pte,
+	.set_pte_pde = si_dma_vm_set_pte_pde,
+};
+
 static int si_dma_early_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -481,7 +488,7 @@ static int si_dma_early_init(struct amdgpu_ip_block *ip_block)
 
 	si_dma_set_ring_funcs(adev);
 	si_dma_set_buffer_funcs(adev);
-	si_dma_set_vm_pte_funcs(adev);
+	amdgpu_sdma_set_vm_pte_scheds(adev, &si_dma_vm_pte_funcs);
 	si_dma_set_irq_funcs(adev);
 
 	return 0;
@@ -830,26 +837,6 @@ static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
 	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
 }
 
-static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
-	.copy_pte_num_dw = 5,
-	.copy_pte = si_dma_vm_copy_pte,
-
-	.write_pte = si_dma_vm_write_pte,
-	.set_pte_pde = si_dma_vm_set_pte_pde,
-};
-
-static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev)
-{
-	unsigned i;
-
-	adev->vm_manager.vm_pte_funcs = &si_dma_vm_pte_funcs;
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->vm_manager.vm_pte_scheds[i] =
-			&adev->sdma.instance[i].ring.sched;
-	}
-	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
-}
-
 const struct amdgpu_ip_block_version si_dma_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
-- 
2.43.0

