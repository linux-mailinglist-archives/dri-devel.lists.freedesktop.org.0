Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFf4LflYcmlxiwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:06:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213C6AC14
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 18:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CDB10EA24;
	Thu, 22 Jan 2026 17:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="D7f0Ik+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013031.outbound.protection.outlook.com
 [40.93.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7D710EA24;
 Thu, 22 Jan 2026 17:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYWHWB7E7e4HWguy+WBCudWg+JEsPAm+OcdAA9kKndvNAFLpJz7MGexFqaRiokVS8e3L+D0hsNS21Miu/72DZ8vQY15mAagw/tCQPfEvwtMU0FGo7f4658v//y5jioOFTKX4oQ05VAjQ36IJqfcldeQLI+Ae2zpzIs9XYfAttaHDKst75HZZ2Z2CpimZ0BO4gPBMUzOxex5dI3AFUbJk7LOpOjQw1UH2d9vN0a5C7X4IFnZp/v2ibi5lZVgiWbJuLeZvJaclVCqUguS0brGfBXAewwCVprLWGSv0SM7NGI5CA5j7wCnGRmfRVNDRGNGbDbBagZOuNZ2wKijSnoVSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCUBN92m79SJDop/aeXPFPNI94QACbsEKAeV/+FOZ8k=;
 b=x3J6sLPXCfRn1uD/b0UA/iMF2riRphYLe4A1MEN4c6OwO65SyGL1QeQX11fkhqEmsFAEeHJByJ0AP33FsVND2xWB7u/CwTXlvJnUsB2/5R3dOhwKxEuIPrg9hWYAmWnlrDb79p+PLgqRqpMm3LfDMz9ALSZuHPd/v9rCHNMzm3Ga7f4Qlp13tdm1WnspfF04lgJ3S7rSN3k31aBxO54tspE9xfJe3GB/BknbvMHrOiEy8oz1aUMpABDWYUlyQ5QXWI5dKQLzTyGAR2HwlMEl6j3d9Z7hqe4B/CwXYq/Gi4T593OqkRctkj1AwHCfUKMDFifU18SLGeXHvhMlZ1nR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCUBN92m79SJDop/aeXPFPNI94QACbsEKAeV/+FOZ8k=;
 b=D7f0Ik+xmMJU8n2KbjOmzaMgmAaXceGi6rb1fOW46pZo93H66Zn9pa0IHcFQbwHb/qp3TKpJb5fXuda9+oNBxwLqKgarNbG3dupnRG6P8iLkamuP+qUSZ+mtcYB9/Qz7NT3D8GCBwW+8TLYXbPE6klG+WAd1/GkZDXRdWjupej0=
Received: from BY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:a03:1b8::41)
 by DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:05:47 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::6b) by BY5PR17CA0028.outlook.office365.com
 (2603:10b6:a03:1b8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 17:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:05:46 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 22 Jan 2026 11:05:44 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 08/10] drm/amdgpu: use larger gart window when possible
Date: Thu, 22 Jan 2026 18:02:05 +0100
Message-ID: <20260122170218.3077-9-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|DM4PR12MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d052cc-7384-43dc-5992-08de59d87c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1F6AYqEgXlroYFtj7SnHlxTS2qyAHHsnQCbH1QfWGciaFQxcAoTQSHKPOF+3?=
 =?us-ascii?Q?m4nJyamOLmgWng438coCoZGYB8lq/gVWaGxkInFPSQn1/q0huLPd4RtWdM45?=
 =?us-ascii?Q?4IhQB2UepP/ukSTu9gz17KqJGbgRq826wEFqHaLf4hzkY+mHu7aLF7dE0i5E?=
 =?us-ascii?Q?gtm/hzgJlPuVjjbDFPW8k9aedqLe5qzONoMST+YDewbXZ1JHIIZm0W3MSfha?=
 =?us-ascii?Q?5fKh6Of2camkbLIn99btd+I48W9dggFyNTPZgx1Sme5zorqfPnCjEbPJhmxR?=
 =?us-ascii?Q?wLVASHhmQX7buAT8gle/mpPmmit962b1IEAMg2BeueBA4gNQ//uji3p0bb7j?=
 =?us-ascii?Q?Fdc2ws2zUpmwqlHn2VvveiCjsd1muDjyAMCoHE/vRsuupFaMoz+kzXhmsv47?=
 =?us-ascii?Q?nX2UCfMYz18ot/yw2WaknP0PxQcrSaDbLEhakAzW9epFd+T7efS0FQEgnjPr?=
 =?us-ascii?Q?4deK+dryCVjqJKmksXrXKUXUsDGnfgNo9UJ3hH0m8pgEgeNREtoHlOWl7nol?=
 =?us-ascii?Q?VMYoNJ+qMV9Rkj1IGacEH0Q/pKoh1wcSq5IpPmts6QSzZpq8AbF9pUu7AvLT?=
 =?us-ascii?Q?AMIHHfHmzy/JsJkE8+9+mT0BgpCM+6RgLHRxUznzENGF0Pn2JKCeCYuYMPaT?=
 =?us-ascii?Q?QVGuLZwlt0/52FExGOAgmYwzw8DvR+w3wYSuUg8Fj3a9+0XZ6I8SCiXH93tA?=
 =?us-ascii?Q?JPBE6rGust3oscRNVEEhppwinFRyIk/jvaTWZZxrIuZvTQHVA7S58/wMhPtv?=
 =?us-ascii?Q?Ar23w+mvDIBEE457w+tFySMM2O/xAQUtq9ibFhQuHTlFZlM4149vwCtUgX+d?=
 =?us-ascii?Q?DHV6dAZ7mm2afc1qKBGsex+ENiNID6uwtVn5HndFggDGwBya5fkbSuDNfE2c?=
 =?us-ascii?Q?4QU+WljHiEsb08PaQqIiVsgSYGB7rDAlkvHT9fS7lA9k+nYBeiFweze3HsGt?=
 =?us-ascii?Q?BKsrkdHfQNmkGnGlfSFUgWaHga5TpmLVVdOYSH2DgP2Lwi4ap6rt6IRK7F0D?=
 =?us-ascii?Q?6Sy5mLa/cAABFfJ4KFPy5KGLQanMn4kLhVy6mdFcwXuWf6k9d9IFkC7GGydG?=
 =?us-ascii?Q?1t+89OS/k7L6OcoiIGgiUOzE/ltlcrgp0/U/tgcnBLTezUjG8qia+5+YJ6OU?=
 =?us-ascii?Q?b6N511Izog7M+SmzpZtLRZj96U9e9iS/iBdm/FXkFeHcZ5vl96Z2mGjf9o8e?=
 =?us-ascii?Q?gIH1BOTHKTjxYYAJ6Z1/l0a75jVlpifDkC4ZgKoXNPQWnYEwQYVVv+WSJyZr?=
 =?us-ascii?Q?s8qmNQmM5wg2BQCBgUecBwc4NkRjfLfpykCH35E4ork8h6k84no6upIl9a/C?=
 =?us-ascii?Q?bcC20YuHE3vzKMsB92qbJCdeUS1wiRBxuUqLuI6kOd/swQdMCmsSMxDbNqhR?=
 =?us-ascii?Q?YUTMiTN7YpmodBYrvAV4Ls2kElwsmt/452vic1wuPYR4qq09SVDBX0RQcBCK?=
 =?us-ascii?Q?Rvar7B9aB+nOrwK3ciVZHCVk/WaBuDCfVcdP1LQiL0fB/TWz00vr1c9jPAil?=
 =?us-ascii?Q?cjhkSL7d1l+JWCrUljjbZHpyUhUpIVmKGHlkFqszwZPYStqfdlIEIJREk9TB?=
 =?us-ascii?Q?FMcM0bU415JG5SDxz1UoP4biiC9X+zyEtDfapkRxrnvPOXyzKfiplcPLFgNi?=
 =?us-ascii?Q?bx30eZ1DVSe0US4amj4H7XZhIXDeqX+kOQn8p+tiVCO+lQ692LttgxITcfOk?=
 =?us-ascii?Q?jZtSlQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:05:46.6737 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d052cc-7384-43dc-5992-08de59d87c62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 0213C6AC14
X-Rspamd-Action: no action

Entities' gart windows are contiguous so when copying a buffer
and src doesn't need a gart window, its window can be used to
extend dst one (and vice versa).

This doubles the gart window size and reduces the number of jobs
required.

---
v2: pass adev instead of ring to amdgpu_ttm_needs_gart_window
v4:
- merge if conditions
- always call amdgpu_ttm_needs_gart_window before calling
  amdgpu_ttm_map_buffer
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 83 +++++++++++++++++--------
 1 file changed, 57 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e149092da8f1..7006c58a6992 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -177,6 +177,21 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
 	return amdgpu_job_submit(job);
 }
 
+static bool amdgpu_ttm_needs_gart_window(struct amdgpu_device *adev,
+					 struct ttm_resource *mem,
+					 struct amdgpu_res_cursor *mm_cur,
+					 bool tmz,
+					 uint64_t *addr)
+{
+	/* Map only what can't be accessed directly */
+	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
+		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
+			mm_cur->start;
+		return false;
+	}
+	return true;
+}
+
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
  * @entity: entity to run the window setup job
@@ -184,18 +199,22 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
  * @mem: memory object to map
  * @mm_cur: range to map
  * @window: which GART window to use
+ * @use_two_windows: if true, use a double window
  * @tmz: if we should setup a TMZ enabled mapping
  * @size: in number of bytes to map, out number of bytes mapped
  * @addr: resulting address inside the MC address space
  *
  * Setup one of the GART windows to access a specific piece of memory or return
  * the physical address for local memory.
+ * amdgpu_ttm_needs_gart_window() should be used to check if calling this
+ * function is required.
  */
 static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 				 struct ttm_buffer_object *bo,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window,
+				 bool use_two_windows,
 				 bool tmz, uint64_t *size, uint64_t *addr)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
@@ -212,14 +231,6 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	if (WARN_ON(mem->mem_type == AMDGPU_PL_PREEMPT))
 		return -EINVAL;
 
-	/* Map only what can't be accessed directly */
-	if (!tmz && mem->start != AMDGPU_BO_INVALID_OFFSET) {
-		*addr = amdgpu_ttm_domain_start(adev, mem->mem_type) +
-			mm_cur->start;
-		return 0;
-	}
-
-
 	/*
 	 * If start begins at an offset inside the page, then adjust the size
 	 * and addr accordingly
@@ -227,7 +238,8 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	offset = mm_cur->start & ~PAGE_MASK;
 
 	num_pages = PFN_UP(*size + offset);
-	num_pages = min_t(uint32_t, num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE);
+	num_pages = min_t(uint32_t,
+		num_pages, AMDGPU_GTT_MAX_TRANSFER_SIZE * (use_two_windows ? 2 : 1));
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
@@ -299,6 +311,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 				      struct dma_resv *resv,
 				      struct dma_fence **f)
 {
+	bool src_needs_gart_window, dst_needs_gart_window;
 	struct amdgpu_res_cursor src_mm, dst_mm;
 	struct dma_fence *fence = NULL;
 	int r = 0;
@@ -323,16 +336,29 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		/* Never copy more than 256MiB at once to avoid a timeout */
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
-		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
-					  0, tmz, &cur_size, &from);
-		if (r)
-			goto error;
+		/* If only one direction needs a gart window to access memory, use both
+		 * windows for it.
+		 */
+		src_needs_gart_window =
+			amdgpu_ttm_needs_gart_window(adev, src->mem, &src_mm, tmz, &from);
+		dst_needs_gart_window =
+			amdgpu_ttm_needs_gart_window(adev, dst->mem, &dst_mm, tmz, &to);
 
-		r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
-					  1, tmz, &cur_size, &to);
-		if (r)
-			goto error;
+		if (src_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(entity, src->bo, src->mem, &src_mm,
+						  0, !dst_needs_gart_window,
+						  tmz, &cur_size, &from);
+			if (r)
+				goto error;
+		}
+		if (dst_needs_gart_window) {
+			r = amdgpu_ttm_map_buffer(entity, dst->bo, dst->mem, &dst_mm,
+						  src_needs_gart_window ? 1 : 0,
+						  !src_needs_gart_window,
+						  tmz, &cur_size, &to);
+			if (r)
+				goto error;
+		}
 
 		abo_src = ttm_to_amdgpu_bo(src->bo);
 		abo_dst = ttm_to_amdgpu_bo(dst->bo);
@@ -2579,10 +2605,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
-					  0, false, &size, &addr);
-		if (r)
-			goto err;
+		if (amdgpu_ttm_needs_gart_window(adev, bo->tbo.resource, &cursor, false, &addr)) {
+			r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
+						  0, false, false, &size, &addr);
+			if (r)
+				goto err;
+		}
 
 		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
 					&next, true,
@@ -2629,10 +2657,13 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
-					  0, false, &cur_size, &to);
-		if (r)
-			goto error;
+		if (amdgpu_ttm_needs_gart_window(adev, bo->tbo.resource, &dst, false, &to)) {
+			r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &dst,
+						  0, false, false,
+						  &cur_size, &to);
+			if (r)
+				goto error;
+		}
 
 		r = amdgpu_ttm_fill_mem(adev, entity,
 					src_data, to, cur_size, resv,
-- 
2.43.0

