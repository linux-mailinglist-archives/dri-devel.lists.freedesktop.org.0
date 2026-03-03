Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNYMO4kKp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:21:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AEC1F3A09
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7ED10E84A;
	Tue,  3 Mar 2026 16:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GtRbykN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7F10E84A;
 Tue,  3 Mar 2026 16:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4JSMtUcKO2/RHn8c1wsni1zywVaKE4+KJxJT8vjmK2tWJ5ZZFiSEZ79xm1Kdt9fLwRkWPekphHtnOa8FZOsybHT3PQYSbpsP0SO+3fdiwH1oXhZZh2UkRl6O55+D1vVmGJvCp1jXbUA34vtLxP0RKRV7kzam4QhKwYBSuJuXhWnFhSlFoKc5/3cfVhCuPNtMSiHfzIQfFrCq5NmtSIJg/wTdHpHYBZpjmxT836/juTHglP3PjTxIS8Fa3DtTBctrZCtz7sbb6P1r5IKXlIJTDjDijSfVg6j3FrWusjZtPzfv9OVsbmE4BpxO3bIG6AVsUHMeIUN+NlMER3uogaa7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr/dR8E6Q3J4TdjtZXh/Rr1YMtbkY9VXydTOt/SLkzk=;
 b=eOQA9ohZqSwIs/QXNrrcZdDefFzoQoSk//eq2xXWMiDMadpHAmO8uIBUAUYzTMCTAreIMGMpEntX5iboPTtn1H96U9RUDHUNefNAGSAEFJgzrQkiELPXVbhj01wb5KUtNEUnb+lkASbjtZd4N3XwPyqjK6MLaeWR6FVPRsEvCGJiQwulq3k3O7Op2wGq/DU/7gy++OG+xYInXxdjPr0sJc0izttca74eoks3N4r7nWmkaJ8taczyCvX3sMOX4b+dZRSvmRosJhsUDzd9cAB/dKw0RDjRcy2pDgrDz/9IhvwSJcUgsLLRI5iljwNFLeqhavs5BjLtvjBHoROz1yp4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr/dR8E6Q3J4TdjtZXh/Rr1YMtbkY9VXydTOt/SLkzk=;
 b=GtRbykN67dAMJwrkko1XUM0aG8kNH/4+hmVV0qAP0BXws2eMbI8RauyOzz66lMd1KRNMgWpGEMBESvQ3P9KcqlV3XUOo61tTNZPDpOt4zacCcXhgtHEX/bKLv9uDXFendDDPGTz+MBl6SOA8q0Stk5M3Gwi4uO8iwV39GsA+fG8=
Received: from SN7PR18CA0027.namprd18.prod.outlook.com (2603:10b6:806:f3::22)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.21; Tue, 3 Mar 2026 16:21:22 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::4d) by SN7PR18CA0027.outlook.office365.com
 (2603:10b6:806:f3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 16:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:21:21 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Mar 2026 10:21:19 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 6/6] drm/amdgpu: dump job ibs in the devcoredump
Date: Tue, 3 Mar 2026 17:18:19 +0100
Message-ID: <20260303161824.7765-6-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 2630665d-f94a-4324-b788-08de7940e871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: 8gT99qSTKxev8GqaFya+bZYlN+9gf1Vtq6pI80GI9kH8Foa87LR6zuCsY3wXLbZBP/3vez6697du9NFP4PtOCAlI9lLquVkRZyTeV2/BwmeULJSjv4w7GymPGpiE1GaaTx60RXHYvPB5yM1pMee1K0zKMewtjcUwG5gAnTLFuVR/hUMYLlG9lvEseG5cN2/nrewyXQPwVNJ+5Ah+i9ZHpHzud8hS40YOahL3c5pTL9cwuLPhfpLZEu6+C1coiNla37hoICEwvMAHvwCBEVnneptIzhGiLKCuUpy6cnMsi6ouRi0EsdK1wp/RopMvXjl1q1b/RIFc4ljC8dvr240FqAwmcsGJGfT9tDGo1aoWBPTgOlFQd+yHN7AFCO4luCN8KjPD6nzoG/KBpPsuInQ8AYLnPjxSxSM9mcueOJnXtYl9+cj/W5XFT21FbunOGiyv0CYQDqnmJEAWfyq9CBG5Mz9NhrgWffI4l/JyvcbH7lUbNAY9/9z8bqrZ/EUCFIu7DnDRRpMS1kze2gYah5rI8mUt6RVDafYAomHkF9xQTGM/rQkH03us4y8KveeoUomkrGizfSrYz1+A+S4ZdQ16uJrg9gh9JXRSupe05G5xXiKVsdTomfGGy6JMUbtvSb+XSy/ZoNDUiS1VqiA84SNKd4i9VqypusEGLZU7ycPiNaUPGktkaw26rQkcTmtjMeIKpFaircXDRgMaN1MUM1IwGThv/be8ppWSTrVT8yl/UNzRO+8c7MQ/F0T7jQ9cfxt1FHPMaoOzUp3o5VWJzSKGybbIrsUoxsQwBFYvAY/4603+K+VTcSsR7OpmAohiFvQoYDIwOi84GGn7WKelGImDXw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5yGQ0HY7cjIH8/Nk8HiwdRW/xZB8ZmtiyqJVzp3BzLyiXXTeaWmCOF9l2VJTWH5X6YdoqmvtqKU/tfHwvz97aCqGXC6+x7eOM5bkHHiUt7Jr8ZcJS3cvFYXOnnPLLKKjYiEfrvlRe2MPZHagwI17V3Vzam263gvzcAZ57TKbk8Qo/vzgV6blk9O/9SgQyJXpLn+63d5oJRGMCk2uJwoUZ5GX/aUuT9fZfjYwSnAnLgb7bLj+xI9UhYkuY8LoCF4aF114IJGSXX+bXvP5YcKLwnyk9RONyOkWItMYAj+bF+O+EArnwcj/YjFpQWrV85xH8L+m85e/tBuYuEVa4F8VKZOfGhPbZl0pwCdONNtYTge8lww9poP/6QV1nnK+W09Vgt6cuT48S97qh3f97LSgADr9Cij7rhiAzLVpF0+8l65wtD50+38G6SY6/4g9aK5c
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:21:21.7174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2630665d-f94a-4324-b788-08de7940e871
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
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
X-Rspamd-Queue-Id: 92AEC1F3A09
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid]
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
v3: use kvfree
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 93 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 82814646695d..3115835617cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -203,14 +203,24 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
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
@@ -326,6 +336,87 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
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
+			kvfree(ib_content);
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

