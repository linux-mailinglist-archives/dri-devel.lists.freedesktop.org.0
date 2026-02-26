Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO1iKAcVoGlifgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:40:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072C1A39B5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD4710E89F;
	Thu, 26 Feb 2026 09:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TmcAlFAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B858E10E89F;
 Thu, 26 Feb 2026 09:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyESEZDMTUZKVh4VwBNPI3n8hz1BhdhGTz8qWrzGnYKst4bKotgpy5P9Hq7W2m5g5uKD3Za1xi3Zbk/hrcS7T/blSwnTvmg8IRrcxglhBcMOJAC2gmxUd7AcUArtwPOWjfIWYEfCcWT8QUPtH/kaBjgghL0S4BANvI2Nl7BRarn3QVj3k6Aqe7WqNYKE6LGdGmVIa9DmH1JsWIJkQnTQzpbZq/IO9uQrBqhSEC8A/MWD+QIbOYSpcui7XZ1DrTLs0wRVb23Ujwb3hN92FVsf1qW2HfXtMaLw3pga/zyTxDD9sa/f4161FjJT0jlxXIaQIitszqF12PLMWDOZ33vpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5UeF9KHowhowIcXZdFv+4R/1sY4ee0nCp67VGvgbjw=;
 b=eAqsI605UELxrorqkW0YJpGieLUZWG4DXmkstcRhvmvmdE7LQaz5umYYCxGRpLoIV9TaffVR8W0l7A9T6uG5jbzT4kpRY7bszVJ/SZX9hIbZxufTdcxvd/FQtwn4uAr38Q/HdWlhciCTHJFlcfNlKm66Jlooupa9LvovpGAMu8NlsuRDsrrRLFc3lxVKpyq0ZJabrWSECRwI99C5QiNP6pcsaYZZAmA0D09+PyILmPUlt+76gXQeFokyajtBrexVdMEqpCGkm9yJw9dbK+C/ejwOlW06g7TmqOoGtNheOjepa6vG+hgZkOYD/9JrWz0mjqKETh2JHtwDW9umIduyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5UeF9KHowhowIcXZdFv+4R/1sY4ee0nCp67VGvgbjw=;
 b=TmcAlFAqF7pkWt5Ohq6N3UkAuE1sfO2lqAQNQGIvadVSxvP1s1l9oKXAmY44fstescGReLMzwUVp3+80GLQi+3AnT4s8jlbVnsUEiF7kqsJQzPm49Y57UZfSW4l9fZ6tAsAG0hlrrv73Mgv6BLij3Ref/q+bjVnoe1nwzwVpKKU=
Received: from SA0PR13CA0026.namprd13.prod.outlook.com (2603:10b6:806:130::31)
 by SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 09:40:12 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::6f) by SA0PR13CA0026.outlook.office365.com
 (2603:10b6:806:130::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Thu,
 26 Feb 2026 09:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 09:40:12 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Feb 2026 03:40:10 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/6] drm/amdgpu: dump job ibs in the devcoredump
Date: Thu, 26 Feb 2026 10:37:24 +0100
Message-ID: <20260226093727.2584-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SJ1PR12MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: c81c9c72-09eb-45ab-9b7e-08de751b09b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: UBjNDJ8PBZZc2MHk+4Yr5lIjmTayF2By8DKZHUaQidKQWbEtMVzWMSnbbkw/2QG7YhWC7bTFoSuXhXT5BsHymBgpe+0Z/e4vw3bWGl37aOrAuvi7OMBXygPjmxqdzTVCY0rnijVjOSfydNhlqilANby5QQ7NMMtPotZzLsBiiqtOYs71OOX/bsNUzvTNTK7LQjRs8os6VXhon0RwACYlFG0ENrp7czs8Jw9Q77rTZYpu8j4Y2lpjAl+qjCRi96fWO7U8bcdBY+DVb9A/Utf5Djlty4ImFJ1/kfj2avnm6fESdZRD0V62ONPW+WqM+5DY0yK00PugRKUAgot0y5nVrmUFV9/BoRhvuNATMagZKgvUqiswd34e9wlsl3t0wdPrOYuf7lE4owxdQbUZDqPrY2IOnZrAK9Qw3lTlYUm57/sHnFJ4cV7d5yQWQYq7yFWFaosOZCwMpARQb9WvadgaJrb8jdL72N8mu36jCi5qO7Cbz7DCXo6YwdFVR6V9MiWWdWlk5vpyAS82vtFVVLVrr7zYiPZqmh9quKHFdMCBguPSCeLsNfKH2gSH2C7bp1CeqMmTHWiQoBE+cJsNZqr3T2SrIxaN2RrTPpIfCe9PrmIRhrJpeMKsljK2hE3GMMqMn3dl5gyUv9INUYSfp2chEfgvsp5lB0ZqP4zv1/x6yt9POWmx/uV8diHvKEKwPnZ4/ovoO5YDJqPVl267ks0l3+S4SEaJ1UDpjKlX4hcAzUUGyc7t5CAhnZQ/UgheiJoEGN9LGHlgSeLDhUMKiIcK3ub+2BD0J5ohluSiTDIZMX2dmiw8zlLwmQrWLQ+VF+gv2rrjlCvzNDGWUhZpMXW7Hw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JEpiAAm56XBZ56P4Xw5HvBdANTJpg18Anuvl9I5AcNI6Bq7F9w72Na+Pc5vpDLqZSy8uSfPEuPXif7vUlaw+XL1WXq5drlLqkfT7yjBmGFaDjfE7BVO1I6jUlpqU/74TS+HOjsaq+6J2iZZ1Y0MZky3t6nzeepJ4htGfJdf9XjU52TUbRBQpRDLuPnyrDt5EQRGDFN9O4Yc2aUnHj/BfIBUiQn/bvRwE0ra7XVyZ74gmWUBXM+kSmF2D9SqxxLqAGoKRt4zKJhkrMAjV5cqzSwi0e+br2MNYQnNHej5xccRpg6yNFGmGXWENUOL1rUh/PnTQSI399vUsaUAev6Lx+ENGxEo+JATWT1QyZojcq6xky+yrHgeVajhZOsFWr4t4zJV38sV3HV+dq0wVhXB9cjseiTBvzl6T7nfEeFDPqi0NkqB9oTAs4MHQuUIQXkuz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:40:12.0396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c81c9c72-09eb-45ab-9b7e-08de751b09b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6028
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 3072C1A39B5
X-Rspamd-Action: no action

Now that we have a worker thread, we can try to access the
IBs of the job. The process is:
* get the VM from the PASID
* get the BO from its VA and the VM
* map the BO for CPU access
* copy everything, then add it to the dump
Each step can fail so we have to be cautious.
These operations can be slow so when amdgpu_devcoredump_format
is called only to determine the size of the buffer we skip all
of them and assume they will succeed.

---
v2: added some comments
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 93 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index d0af8a294abf..e489bf089bc9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -200,14 +200,24 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
 static ssize_t
 amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_info *coredump)
 {
+	struct amdgpu_device *adev = coredump->adev;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
+	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_ip_block *ip_block;
+	struct amdgpu_res_cursor cursor;
+	struct amdgpu_bo *abo, *root;
+	uint64_t va_start, offset;
 	struct amdgpu_ring *ring;
-	int ver, i, j;
+	struct amdgpu_vm *vm;
+	u32 *ib_content;
+	uint8_t *kptr;
+	int ver, i, j, r;
 	u32 ring_idx, off;
+	bool sizing_pass;
 
+	sizing_pass = buffer == NULL;
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.remain = count;
@@ -323,6 +333,87 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	else if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 
+	if (coredump->num_ibs) {
+		/* Don't try to lookup the VM or map the BOs when calculating the
+		 * size required to store the devcoredump.
+		 */
+		if (sizing_pass)
+			vm = NULL;
+		else
+			vm = amdgpu_vm_lock_by_pasid(adev, &root, coredump->pasid);
+
+		for (int i = 0; i < coredump->num_ibs && (sizing_pass || vm); i++) {
+			ib_content = kvmalloc_array(coredump->ibs[i].ib_size_dw, 4,
+						    GFP_KERNEL);
+			if (!ib_content)
+				continue;
+
+			/* vm=NULL can only happen when 'sizing_pass' is true. Skip to the
+			 * drm_printf() calls (ib_content doesn't need to be initialized
+			 * as its content won't be written anywhere).
+			 */
+			if (!vm)
+				goto output_ib_content;
+
+			va_start = coredump->ibs[i].gpu_addr & AMDGPU_GMC_HOLE_MASK;
+			mapping = amdgpu_vm_bo_lookup_mapping(vm, va_start / AMDGPU_GPU_PAGE_SIZE);
+			if (!mapping)
+				goto free_ib_content;
+
+			offset = va_start - (mapping->start * AMDGPU_GPU_PAGE_SIZE);
+			abo = amdgpu_bo_ref(mapping->bo_va->base.bo);
+			r = amdgpu_bo_reserve(abo, false);
+			if (r)
+				goto free_ib_content;
+
+			if (abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS) {
+				off = 0;
+
+				if (abo->tbo.resource->mem_type != TTM_PL_VRAM)
+					goto unreserve_abo;
+
+				amdgpu_res_first(abo->tbo.resource, offset,
+						 coredump->ibs[i].ib_size_dw * 4,
+						 &cursor);
+				while (cursor.remaining) {
+					amdgpu_device_mm_access(adev, cursor.start / 4,
+								&ib_content[off], cursor.size / 4,
+								false);
+					off += cursor.size;
+					amdgpu_res_next(&cursor, cursor.size);
+				}
+			} else {
+				r = ttm_bo_kmap(&abo->tbo, 0,
+						PFN_UP(abo->tbo.base.size),
+						&abo->kmap);
+				if (r)
+					goto unreserve_abo;
+
+				kptr = amdgpu_bo_kptr(abo);
+				kptr += offset;
+				memcpy(ib_content, kptr,
+				       coredump->ibs[i].ib_size_dw * 4);
+
+				amdgpu_bo_kunmap(abo);
+			}
+
+output_ib_content:
+			drm_printf(&p, "\nIB #%d 0x%llx %d dw\n",
+				   i, coredump->ibs[i].gpu_addr, coredump->ibs[i].ib_size_dw);
+			for (int j = 0; j < coredump->ibs[i].ib_size_dw; j++)
+				drm_printf(&p, "0x%08x\n", ib_content[j]);
+unreserve_abo:
+			if (vm)
+				amdgpu_bo_unreserve(abo);
+free_ib_content:
+			kfree(ib_content);
+		}
+		if (vm) {
+			amdgpu_bo_unreserve(root);
+			amdgpu_bo_unref(&root);
+		}
+	}
+
 	return count - iter.remain;
 }
 
-- 
2.43.0

