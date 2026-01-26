Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLGgKVlud2m8gAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:38:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B61E88F30
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991DC10E437;
	Mon, 26 Jan 2026 13:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t46eK48W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDD710E430;
 Mon, 26 Jan 2026 13:38:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXF/vl4dJujKU5UJK+AjcLwKzlpVR8UmVDJzuTN7giMJcAAoh4xjiapu3uHgb64HTYqDn61YZ/KBXUF3qICV3Mw7szQjDcV5GhMMs3w4WS4Msqr1bVuviSQfdzKn+F3o6EFYA8D+Jode1iWwMBXRn2ss9c4T2A8IwySZdeIhqnUz4IZVyClKHuYaLQY+75rZKm9aB1KsVylFjJfruZLrVzSimejgK4DLV7qN9t2bkKnr3S1WW9f334wcuBs8qF93SPW68ztQ7WDijWGTbB0Z94Louuv6RwJyK8uP6zSnu87gc/NRXDXE493N7DL9KQ/Vv67hUCRxY1I8x5y3vSf8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUJgQNaRBrdks0IGOfQ2wLHG2cwB7r1CNUk9b45BhBs=;
 b=cs7w6/4Kf1Sjn7kxmkBRPay0E9vcSFa/6tSMfotnhLGkqzm0thbu/lDEE7Cd/vYzKymQnIX3aH3QJIZBHq2D7H7FU00ZgkGbhjOP9zRhEzLj3BmhsfZIek5m0hbw0tC1DBN6oCbCUSHzVsAcv0YXokynq2r+UGSUE4Moif1fipOnSF9IXW0BOsLODaU+kVijX77ZLPejpHJwcSKv+a1iFOY+l2iVB0qDRZ5Gy2vxthnz9tYxa0Q5XEHjMNBNX5Vy65WHrvLOBOQEz7B0+y/vttGuqURBD8/IFLbG+AY58qi+5+oCu9O4xaAi+LL5kkiNrrEQIL6PSdvV+MezscKb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUJgQNaRBrdks0IGOfQ2wLHG2cwB7r1CNUk9b45BhBs=;
 b=t46eK48Wvi4aYfdRN1tABqMTYTKvPYW4vwaMP0Ig/q+H9l03R/LdhAur0aPxILkai9bR/Swf9DacTRvwTU21oEm3Z5aZ6Lv3iqFIXg81JcYCIB16uTW5Nx6FATTSoFEGVnEArfmf87fF7abvCdWbmN+qhsOBchKaoE8701tkBR4=
Received: from SJ2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:a03:505::13)
 by DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Mon, 26 Jan
 2026 13:38:21 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::87) by SJ2PR07CA0012.outlook.office365.com
 (2603:10b6:a03:505::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:38:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:38:16 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:37:27 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 10/11] drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
Date: Mon, 26 Jan 2026 14:35:05 +0100
Message-ID: <20260126133518.2486-11-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DM4PR12MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: a460de77-4c22-4285-2bec-08de5ce02c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW1uNE9rb1Rxa3IxYVFUOC9zNzcrLzdicGgybGNvczlXNnk2ellZSlRpdXdy?=
 =?utf-8?B?NU9zRmlmWUt1Q01YTG9taFFwUDJJTVR1blZMdU9XK3lDM3hHaGJYRnlRMEdv?=
 =?utf-8?B?YkNPeDN5SkZ2Y0tad0EzZ3hqTHBEK3B3c0R6SDdkQk9CSGNyWkhESHlSWUFI?=
 =?utf-8?B?VFFIcXpQU2dmRkJjU205S2cycmlDSGh6U1BLQlZxcE8xbEgxa0VNTnpuRis3?=
 =?utf-8?B?WS9KOUZ1VFM4aEpScGZnWjBGTVExdWtNeWo3ZnRmeFNZbmJNTE0rbHcrcXAy?=
 =?utf-8?B?NFJjenJ3cmtyQXAvSldxQ2c0dEs1aWRWTTFpQmRrVi9OWENnTk1wTUgrTW9q?=
 =?utf-8?B?L0krWjNLN0kyZlZBVlVXekRFcitnRTBaUEEvT3EzYjR5WWFuZE9RamxuL3p5?=
 =?utf-8?B?WTNpeGVhMGprY1BXRGtETkZEanUxY0s1cTFHYWY3aHltQjhPZ2pmWDZ2cXVh?=
 =?utf-8?B?NHhzY3FKL01BUGxBbGhnRzRSS0ZRbkYzbTdVbm1IREpRQnpEU2RrZnpyZmxL?=
 =?utf-8?B?YnVqNjF1WVd0ZVJQSFFvejFXUWgreU9ybFFjRmRWVEpKYzZMRGxOM2pnL215?=
 =?utf-8?B?ekR1S0NtVGVpdG9UandlWmlXeVkyUTZ5c0xQVTRBZUM1ZnAwWG5CcStWOTNr?=
 =?utf-8?B?SjYvQ2dlRG5YMDZHeTRFL0lNUUJQYTVHV2lDVWlkcTB4blRSSlJ6VUd1Vm5V?=
 =?utf-8?B?aGMrVUhwRG5QakpDSTdYT1gzZ2FzT0laY0RsN1lVc3FVUkMrWGVKMzZJU0tn?=
 =?utf-8?B?eW81eEltaDRxajVKYW9HbjZZWldEUml6d1dOaldlL21FZGhHSHlBVjhhYnlB?=
 =?utf-8?B?b3lIQk92MGtPKy93cjQ3dGkxc2ZzZEltNEZ3QldzRnVyWk9PVkIrbUtKc1B6?=
 =?utf-8?B?Y3lpSjd6cXR2OXprSDBIT1FNbEtwcTd2c3V5cThxb050b1F2S3FlS1FYYzMz?=
 =?utf-8?B?WjNRdHp0c3JLbWdLTzkzU1piZUNUc2hIbVYzRlNsNUZRTWtpL1g3K1ZObU1r?=
 =?utf-8?B?aVBHQlVTQXAwTmVCTFI2V1JKZmJHWE5IN00xVUN1WTEwMTNpYm5NeHZQcWNP?=
 =?utf-8?B?am45WDgzQ2xEa1VNWVhLMGxOdWpVMjRybzlXU0tQMGFtMnhmM0x6bWRBZVNZ?=
 =?utf-8?B?bGRhblN2QnZRR2IwQU5xNFhENWJUcXVGUUx0dmZNa0RETjVoN3hQVmlYbEpY?=
 =?utf-8?B?cnVmSEJuczVnSWpod2pXZEc4c2RJV0FKVi82VExRbkYwRUY1bUMydEp6Y2tv?=
 =?utf-8?B?VHJucVNuS2tJeGxwaERCaGVZeitCQnludlNGVTB6c3JoaUZiaG9DNGxsTURI?=
 =?utf-8?B?QmJLM084emNKb0pOajVVSFpLdXl6dElySU85Y3IzMEhkanV0Mnd4cVBYeTlz?=
 =?utf-8?B?a3RaZ3dMTk1UamNYK1FRblFvTVBUSkNhVmZEVFF2QlRpZllEd3ZQRXBtWGpr?=
 =?utf-8?B?NVVoRGpnRDlsaEcvU2hhSTUvSEdoaDdBaG1SalgrUDUxVFpxbzdHSHlkeEh2?=
 =?utf-8?B?bFV6RkR1Sm9KMzZIWklCMlpHWXBicEZaaWFyeXBUOU9BT1JvZU5OZUNseEwx?=
 =?utf-8?B?dUwxZ3A3ZFQ1NitxdTQ1TEFBMFBlTFI0KzlianhBb3dxM0JqcjN3ZndVZnF0?=
 =?utf-8?B?bDl2eW9aV1FhbEtDS0wrclcvZjVFNVpqUUhld1BaR3pqMUVsS2pqSHAvRCsy?=
 =?utf-8?B?akJkUXRYRjE1NFBOMjJwZzErc1FKSHdWVGFwVlllakhmYVd4T2VNV1lPTklC?=
 =?utf-8?B?dnVEK1FkdnF1anMvOFBHUW43ZEM2WUNMajZpQlZnNEpDdmdnUGZwUFZiRXQx?=
 =?utf-8?B?OFFjOHd5SUczQnMzS2xVN0d5bHRWSkxhMFVTa2lXbnBIelR0a1dNajFXVitL?=
 =?utf-8?B?d1FiZUMrWVE1VXltN3JwbngyZXJHYzZ4MUd0cmZ3OGpja2M1Yk5URVpxNFZo?=
 =?utf-8?B?OENnV2RmVXZzbnpoUXpRMlF0cmVhemNwZUhhY0MzQTFDWG0rdlhuZ1JDWHR5?=
 =?utf-8?B?aFh5bTBWdVZyRFhKZ0JaL2txRGVsb0lmMEEwdGFkcGpTeFNqRnJrWnlFYmds?=
 =?utf-8?B?WkxNdWg1bmQ0dWhSMUxzNm1tZllhaFQwL0tHbVpDZTlvZ2hSU3orVHB2bVlu?=
 =?utf-8?B?OFNlem93NDFiVHdWbUY0RVdoR0k2U25zUDlhQ0hsbFVoeHFseGpBb25kdUxm?=
 =?utf-8?B?ZUFhTk9oeE9pbHRvcXpnbGdibnY2dDRpWk02THRUdkV1VlY5SFpnRCtkR1dB?=
 =?utf-8?B?T0c5OU81YVJkUmVEUXBTZDF3NnVnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:38:21.3200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a460de77-4c22-4285-2bec-08de5ce02c03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590
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
X-Rspamd-Queue-Id: 4B61E88F30
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

