Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJAREih+e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED578B1837
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1613B10E88A;
	Thu, 29 Jan 2026 15:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mpkfbm/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4D510E888;
 Thu, 29 Jan 2026 15:35:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XV1cuKRbOkdbXM7rKpw2FlDcjdqX32oi3pRiHyF3oaBoEFWw0OjR1fVkjJih9/NAu/UujzDDQXqLPGkWFj1Vp9JtQbsPuVPEZv6KnHHlaWLtz2W8ZxEy/IcWydNN/bGaKYghuLsdNuo8OgkNvfulpkf84lNOVWse1XNFGdp/X+pu0z+PhRf3oF+HmThBBcjPj3jcoiVGumA3SuxTCGMJSGtoEsm48ueOwBboEZl76ixQCDg1e8pPfjSdQ0dfM1RiGdUA/hVSkJAjKlUUHdinaN9wMqqkeRKaLnmehI8rNarFgsRXnYaRJt9Xlw06JWhb4HQSk6dS/JE09/M/C8x6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReMT6THVCDRL09KEFm9SSmhwfGGCO/fs8dnr+m2U9OE=;
 b=FBfa14UfBgc5x4SlFgEpqvzAHfS8mL79eusytTAo20Rr1huEcNWre30UULgg5WEMYixWBnwm2TesBFon6F/3DX6CzM9O15VI+Fw8Fc4drGSjKNH3CqS2IjyXRzZZ8Phsa2mpBZEBkQGoMgYG2izzjAhMtfJReNvPHCNhuKGoji77NRoTClN+QUuTodWAKJEiYPOf3+C7F+dUNSj8C3uFawyreodqHH2Dvu3XZxx5XW9pgPenGws5lTigZz7NMOJbCvZ3EjKNHzOI8r4FfCB1BpE0kvPX/nX1dhe1kOjWfIRFTQLiSaxSHTXqsukPrYuJtNZy0n4kbEeJmMvghdvFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReMT6THVCDRL09KEFm9SSmhwfGGCO/fs8dnr+m2U9OE=;
 b=Mpkfbm/CVEHJ60mWnBl5ELrQsQOi/lLYMPvduq5d33cUu+gabROHlkPW5EroSqtVA0Kjf9uIcjR56CvpltoPzmuZHcZT7TQDSyJewFlQpGSDJcg4w6qjCFBBSpuZlrPzM2vOd1NN7kg95dKA1ZKg6yBxGe0oV4PlTDhrVl0hbSg=
Received: from BL1PR13CA0182.namprd13.prod.outlook.com (2603:10b6:208:2be::7)
 by SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 29 Jan
 2026 15:34:45 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::43) by BL1PR13CA0182.outlook.office365.com
 (2603:10b6:208:2be::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.3 via Frontend Transport; Thu,
 29 Jan 2026 15:34:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:34:44 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:34:42 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 02/12] drm/amdgpu: statically assign gart windows to ttm
 entities
Date: Thu, 29 Jan 2026 16:33:14 +0100
Message-ID: <20260129153336.7473-3-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|SA3PR12MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 6274f403-386a-4f70-c434-08de5f4bed90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU9XQjZMVmN1VGNBVitMdjdEdXo0VHBJenAyVUlPTlJONnVmdFFONXhNS0lq?=
 =?utf-8?B?eUZHbDFkQ21BdGVaT2thMERmdUtSdXZLZWxPd3IzTlBMZVF3aGFFVmRwdG5H?=
 =?utf-8?B?K21ncm44UER2eUlPODFDc0FhNktTWmFOZm0vQ3VsMHJ3SkJuWjVQdHpNcU1S?=
 =?utf-8?B?NmxuNU5GMjZzK2R4bWNrZkQxVTFzSkx4d2xzNWJSVUpRbjcvQjdJcmZzWlNs?=
 =?utf-8?B?VDBiRDVvblRWWHRwV0ZXNmx4T1A1MUhKR1pXOEg2RTdRMVlXOHhPR3Z4M1dn?=
 =?utf-8?B?bGdnSklzYlgyTHh4dDY5RDhzeTNySTdyeWtXS2lQZ1BPNGQvNEdueWI2ek1K?=
 =?utf-8?B?aTBDaVRXaVZOdXZpdjFQRkp4MlFKTlVJV1JKZ2g4NHBxTTZ6Zm9lNDdDSWU4?=
 =?utf-8?B?aVFRNHpVdTFJTk5iYkp5OGllOGFkSzZ6LzNaMTVCeTFYT293elVlS0FCaEN1?=
 =?utf-8?B?OEVnNzdxMFZVREhuTm55eERxVHUwL09nOHVSK253MHZuQko0V0t2YWlLQUlZ?=
 =?utf-8?B?TVFJTnJCT1ZQa0s5M1dPelZUb2l3MFlMYjhvZ0k4blFrWjA2Tmgyb05BdE5a?=
 =?utf-8?B?L24yV0dtN2VMemJ6SlhIN2QzUHVBUFRXVWR2YWJSUmdsSzhIYkJZR0JhcGZJ?=
 =?utf-8?B?dkdyN0ZqY3BUQnU3TzlGL1c1a013NDk1djdNQm40cVdJNE13MzJVaG5FWXZK?=
 =?utf-8?B?dkRicS85eFY3djNqNEM4cjZvWGxRVTNlQWVtQnVSN2ZVY0RYaWJ2RDFVWkdy?=
 =?utf-8?B?Q2s1NVdXcGFMbGtLZ1Q3QXRDdUo0UlZJcFg4cVk3K2dGbjVEY1p4WVFFbzBL?=
 =?utf-8?B?OElha0xMVGFQWWZrQVAzcUNNYUNsN3JDOWt3ekpINmRhNTJKTk1Rc1BkN2dx?=
 =?utf-8?B?dW1nVHNzck1TTld4VnAyVHVDYURrV0FpSkM2Um9YS3ZYN1dqUkpsOERpMk1h?=
 =?utf-8?B?dkk4N0h4bFhMck43NTRuM0tDUnZPUUFNcHRqV01rWVNWYXM3NUpmWXdyL3Qw?=
 =?utf-8?B?VTFOTWxEeXhaVXdDVGF0MVVpcFVEYUJPRHJWYm1YOW1XUE1KaUU5YkpuMlJl?=
 =?utf-8?B?c01tamw1SFBoUk9nTWJZVDV4S0hCTStaUkN1UFNNQk5iTE5oQmZVbCtIOTc4?=
 =?utf-8?B?MXBkSVFwck1BWlloNks0elpwa0pBWnhhTDN6TjJ5RmwxZ0N5SFhjWk1SelRJ?=
 =?utf-8?B?QkZlNDdrTUVFd2duS1o5aElwdzFqcWIzT3JpUHdFcnJyLy80dG1SbXVhVUtP?=
 =?utf-8?B?VzhpbWdubmZyT3ZQTm1CUjFwNXlvMXNIa29HclBMYWpxeDkrNHFDZWdMbUZl?=
 =?utf-8?B?cXROS2RJTWFrN1ZCUktqckEyRTV3RGNQQUtZNnJqTVBYSjRKSlVzYXhGdUxi?=
 =?utf-8?B?ZUVFTGNYbTJBZzAxSXdKeXcrQng1WjJGb05KeXdHWnZuUzhsbURMa0FiRlN4?=
 =?utf-8?B?cVVhZ2s1SWQwdUZZdGFtN3FaV2FHdFpHOTV6M1krQzlYSXhCZ0pEbXRkRVR2?=
 =?utf-8?B?SFZNVnpyNk45L0hjWCt4UytIYWh3RDR3Y1pMWDdPWDdzM3pDQTZzU0FqdytV?=
 =?utf-8?B?R3ZnN1FtWDF4OU82N1VIZEZoNG1pUTQwYkdsc0xLR3c4dmJaOTRWL3NjbHBZ?=
 =?utf-8?B?Yk9CcU9KV2NuMUEwMk9IYXprYldPK0gzNENzcGViSnp6OWM2R3NNNEpXV1gw?=
 =?utf-8?B?eDVEa0Y0VVQ5V2huRjNpS2Z2bWw0SDlCQ0h2SXMyaVUxeHZyajlaNWFvRk1k?=
 =?utf-8?B?dndMajV2a1IwZ25BNzdDbEp4RnlDbS8weUVWRlMzOThnRG40aXRKcjVoT3gw?=
 =?utf-8?B?eGVHc0pabWFtZW5oUkJsTlFwZ0FQMjUyejNXMStUT3ErdmVqTENWY25IR2Jq?=
 =?utf-8?B?VUUzSGJmSUthZTRnOC8ya01jRjkzOWJ5akFKZHBVYnV5S3JMWmdpS0IrMXBC?=
 =?utf-8?B?SzUrV1RseUc0TWY0eWw5a25kajFDd0tKMllJY1pIWFBKdXBMZ2lYWlB4K0V0?=
 =?utf-8?B?UXlvYVNtaU9MeUt4R1FuT0hWWTBicGVPZ3ZybEluZENDcU44NkJFN3I5bjVq?=
 =?utf-8?B?RklwT3IwNE9vS0JRZWg5QXI0T21ZdzljeXpBMjRFQjdtZmpGeis2MW8xNmFn?=
 =?utf-8?B?b0wwUDd3ZGxaWHBmb2R0TGlteEhQOVRsdXFrWkZLUHFESzVCcWltaGlmdkJE?=
 =?utf-8?B?N1F0bUdoYWVaVmRIem5Pa3ZCN2V0ZHg1YXN3VmRTaW5NcFAxSW1mekN0YjFW?=
 =?utf-8?B?S203Unc4YVlWNUpua3I4L1NUK05BPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0rdc1BUmBrUmDERzV55juwsZxe7vq3EWQqML9DEwyyB7cbaiKVJntZafstyOAQ3FkwMHTm7mNrjioqg0ITgrJyFzzyK2XkUAIIIiTVuwgK+egGE3VQhqcddZPT7Zsqhri9PJVh+aLAPBPqZXT75O2vn/qFv9Bebi1ClxyGJKLLNc2Ig9B70JRTeF/VrQX5fw/sljm67AhtV9+n0hyCcdUPIgSYk+7scbHvNsVEt7GTflZXXviLkvCNhSK4GZFMBHQUraTtac4Wk/XhEZ2TOMwG139Zshp51SNvFpclHzY+EVxrTp3fcjUYM8T8d8ZSpKbFFtdEgykmShoAqECzzAZacjir1FsyJMCalKri0WIPK4iiKVekZGEjdmLP9VeaIydxHIJ/K9P/csk3MYxKps5a5NXpb+uc7tnjrxlDpcuvBX+QjCfG0DT3glI8PAaxlO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:34:44.5616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6274f403-386a-4f70-c434-08de5f4bed90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8761
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ED578B1837
X-Rspamd-Action: no action

If multiple entities share the same window we must make sure
that jobs using them are executed sequentially.

This commit gives separate windows to each entity, so jobs
from multiple entities could execute in parallel if needed.
(for now they all use the first sdma engine, so it makes no
difference yet).
The entity stores the gart window offsets to centralize the
"window id" to "window offset" in a single place.

default_entity doesn't get any windows reserved since there is
no use for them.

---
v3:
- renamed gart_window_lock -> lock (Christian)
- added amdgpu_ttm_buffer_entity_init (Christian)
- fixed gart_addr in svm_migrate_gart_map (Felix)
- renamed gart_window_idX -> gart_window_offs[]
- added amdgpu_compute_gart_address
v4:
- u32 -> u64
- added kerneldoc
v5:
- removed gtt_window_lock
- simplified gart window creation and use: entities using a
  single window now uses window #0 instead of #1
- fix dst_addr calculation in kfd_migrate.c
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 64 +++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 21 ++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 12 ++---
 4 files changed, 72 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index d9ff68a43178..fcde88e3a6b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -737,7 +737,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself at least for GART.
 	 */
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.default_entity.lock);
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
@@ -750,7 +750,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	fence = amdgpu_job_submit(job);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
@@ -758,7 +758,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	return;
 
 error_alloc:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6d7a5bf2d0c8..5850a013e65e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -228,9 +228,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
-	*addr = adev->gmc.gart_start;
-	*addr += (u64)window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
-		AMDGPU_GPU_PAGE_SIZE;
+	*addr = amdgpu_compute_gart_address(&adev->gmc, entity, window);
 	*addr += offset;
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
@@ -248,7 +246,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	src_addr += job->ibs[0].gpu_addr;
 
 	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
-	dst_addr += window * AMDGPU_GTT_MAX_TRANSFER_SIZE * 8;
+	dst_addr += (entity->gart_window_offs[window] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
@@ -313,7 +311,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
 	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (src_mm.remaining) {
 		uint64_t from, to, cur_size, tiling_flags;
 		uint32_t num_type, data_format, max_com, write_compress_disable;
@@ -368,7 +366,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		amdgpu_res_next(&dst_mm, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	*f = fence;
 	return r;
 }
@@ -1580,7 +1578,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	if (r)
 		goto out;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.default_entity.lock);
 	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
 	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
 		src_mm.start;
@@ -1592,7 +1590,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 				PAGE_SIZE, 0);
 
 	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
 		r = -ETIMEDOUT;
@@ -2014,6 +2012,27 @@ static void amdgpu_ttm_free_mmio_remap_bo(struct amdgpu_device *adev)
 	adev->rmmio_remap.bo = NULL;
 }
 
+static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
+					 int starting_gart_window,
+					 u32 num_gart_windows)
+{
+	int i;
+
+	mutex_init(&entity->lock);
+
+	if (ARRAY_SIZE(entity->gart_window_offs) < num_gart_windows)
+		return starting_gart_window;
+
+	for (i = 0; i < num_gart_windows; i++) {
+		entity->gart_window_offs[i] =
+			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
+				AMDGPU_GPU_PAGE_SIZE;
+		starting_gart_window++;
+	}
+
+	return starting_gart_window;
+}
+
 /*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
@@ -2028,8 +2047,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	uint64_t gtt_size;
 	int r;
 
-	mutex_init(&adev->mman.gtt_window_lock);
-
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
@@ -2300,6 +2317,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	u32 used_windows;
 	uint64_t size;
 	int r;
 
@@ -2343,6 +2361,13 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
+
+		/* Statically assign GART windows to each entity. */
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity, 0, 0);
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
+							     used_windows, 2);
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
+							     used_windows, 1);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
 		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
@@ -2501,6 +2526,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2511,11 +2537,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	if (!fence)
 		return -EINVAL;
 
+	entity = &adev->mman.clear_entity;
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (cursor.remaining) {
 		struct dma_fence *next = NULL;
 		u64 size;
@@ -2528,13 +2555,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity,
-					  &bo->tbo, bo->tbo.resource, &cursor,
-					  1, false, &size, &addr);
+		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
+					  0, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
+		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
 					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
@@ -2546,7 +2572,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		amdgpu_res_next(&cursor, size);
 	}
 err:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 
 	return r;
 }
@@ -2571,7 +2597,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (dst.remaining) {
 		struct dma_fence *next;
 		uint64_t cur_size, to;
@@ -2580,7 +2606,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		cur_size = min(dst.size, 256ULL << 20);
 
 		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
-					  1, false, &cur_size, &to);
+					  0, false, &cur_size, &to);
 		if (r)
 			goto error;
 
@@ -2596,7 +2622,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		amdgpu_res_next(&dst, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	if (f)
 		*f = dma_fence_get(fence);
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 143201ecea3f..871388b86503 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -29,6 +29,7 @@
 #include <drm/ttm/ttm_placement.h>
 #include "amdgpu_vram_mgr.h"
 #include "amdgpu_hmm.h"
+#include "amdgpu_gmc.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
 #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
@@ -39,7 +40,7 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
+#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -54,6 +55,8 @@ struct amdgpu_gtt_mgr {
 
 struct amdgpu_ttm_buffer_entity {
 	struct drm_sched_entity base;
+	struct mutex		lock;
+	u64			gart_window_offs[2];
 };
 
 struct amdgpu_mman {
@@ -67,8 +70,7 @@ struct amdgpu_mman {
 	struct amdgpu_ring			*buffer_funcs_ring;
 	bool					buffer_funcs_enabled;
 
-	struct mutex				gtt_window_lock;
-
+	/* @default_entity: for workarounds, has no gart windows */
 	struct amdgpu_ttm_buffer_entity default_entity;
 	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
@@ -205,6 +207,19 @@ static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,
 }
 #endif
 
+/**
+ * amdgpu_compute_gart_address() - Returns GART address of an entity's window
+ * @gmc: The &struct amdgpu_gmc instance to use
+ * @entity: The &struct amdgpu_ttm_buffer_entity owning the GART window
+ * @index: The window to use (must be 0 or 1)
+ */
+static inline u64 amdgpu_compute_gart_address(struct amdgpu_gmc *gmc,
+					      struct amdgpu_ttm_buffer_entity *entity,
+					      int index)
+{
+	return gmc->gart_start + entity->gart_window_offs[index];
+}
+
 void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct amdgpu_hmm_range *range);
 int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
 			      uint64_t *user_addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 3df2bbd935e2..b3d304aab686 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -59,8 +59,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
 	void *cpu_addr;
 	int r;
 
-	/* use gart window 0 */
-	*gart_addr = adev->gmc.gart_start;
+	*gart_addr = amdgpu_compute_gart_address(&adev->gmc, entity, 0);
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
@@ -78,6 +77,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
 	src_addr += job->ibs[0].gpu_addr;
 
 	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
+	dst_addr += (entity->gart_window_offs[0] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
@@ -116,7 +116,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
  * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
  * the last sdma finish fence which is returned to check copy memory is done.
  *
- * Context: Process context, takes and releases gtt_window_lock
+ * Context: Process context
  *
  * Return:
  * 0 - OK, otherwise error code
@@ -136,9 +136,9 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	u64 size;
 	int r;
 
-	entity = &adev->mman.default_entity;
+	entity = &adev->mman.move_entity;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 
 	while (npages) {
 		size = min(GTT_MAX_PAGES, npages);
@@ -175,7 +175,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	}
 
 out_unlock:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 
 	return r;
 }
-- 
2.43.0

