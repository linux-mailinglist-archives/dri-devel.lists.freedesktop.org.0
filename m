Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP0oH2cKp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:20:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC031F39AA
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E5410E855;
	Tue,  3 Mar 2026 16:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X5m1oLwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B410E856;
 Tue,  3 Mar 2026 16:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvxupX1NAjEAcJH4URAl4APHbAJjGcHAsOXyvaIb+kOplQpwWsbLYtqoRS99+Dqg2UYm6rbhWmI0E+FQqZMw1l/YAZqL8sA2GnH0LE9ETwu28co9MH06ZSPS7KrPnloRfxvRe0ggJNfsRJ1Nvym/poieRgy2EscEatdcQBcuzIT0IXdjJeb491zvxN6Zcyo+MHosq5E7KVO64hrsh5wgVMU71oocYJ1akH87yp9ilPAPptAHlYj6vrTZEdfPHaTQvr77Gnl7sPLPFeWaHA++xe0StE2BScOSoxH6v1UMhHavbHuohtqxYLmI5bRrBsqcm30h/FqPhRvD4xcWgr7gCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjgl9TTAg98N2+x/BYZPZ4Guy4Yht+Hw9egt/s4xj0M=;
 b=iaAxhO4P7UEJdBHhGUMoeXj+RBUkZDl5dlyTHXuH9ETUO+HzUMGj1JIreHO24GEEOGO8HZd3ULE9RfqyI9BWMLKszFzBi0NGpqSc9987uKuo1Tk9tnzVq5dvvNd/5wzDaefrMK349luYmzc6tUYMUPQzVjZgcqRH65VXsGa+USWYOgbxCAwmmA0jhaePgtwnvN5Cv9HZbzcWZ9PGTHkfseG9IqXTfKntMYCHy0IFC7aFi4qcqE57VfiqPtsyZGc6xyBjMi+SNRuir00VS9KWyN1Fel35YkzRpWf3cj694SMYW4LWWPig0C178bHjq+2RkPQXj1FHvrjg9kzZ04qcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjgl9TTAg98N2+x/BYZPZ4Guy4Yht+Hw9egt/s4xj0M=;
 b=X5m1oLwjTqnkgHMnvOO6n4nP0QRgb0Pa26eI3irQk31kqf6J+idHjCAZV/hc552VujpwKTpvuPNc3QHuzPhUPnhls7UIIW7kdWt3hc9tk5+nYZ04HvQQGvcYkr26unAkq+GZp2OJi8xM54WJZbFMnGo6/UQg0a0JFxsAGbYDk2k=
Received: from PH7PR17CA0066.namprd17.prod.outlook.com (2603:10b6:510:325::15)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 16:20:42 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::77) by PH7PR17CA0066.outlook.office365.com
 (2603:10b6:510:325::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Tue,
 3 Mar 2026 16:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:20:41 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Mar 2026 10:20:40 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/6] drm/amdgpu: save ring content before resetting the
 device
Date: Tue, 3 Mar 2026 17:18:16 +0100
Message-ID: <20260303161824.7765-3-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 38398ae3-72a3-4a1e-e1c1-08de7940d0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: XzcKT9g/KP7P10Smn8TU5O5AAQX/Tx3kuXLRQAVEvig/zu5GrSxlCVe7FHLvm+uEd+wje2EqCOhCJoJaFTQ1k4gWz4AqLxoVACA7QmeEO8Qj5Vr8DR21KiPYOiKMUFE5rD7u9s6KZkagSxEIZAJ1EJP3mlKu4RUpMTVgsIKIZpo4Zr4q47RH4SnM74s/P/KEkLYvkdYORCAQquhmmV66Vc+cHbxXHKiZemU+CgYtYyv5p+zlHjX1pLb4Xi0uy3iAdUnAYeF94ZFBtqwIGrvod3TYDHRNZqnAy5zTLUBZSll1MxO3toP0wzBg+85spCu84zYt+bSS3FWQ1o5Qdml8HzNB44UJk0R9jIKNDE+SLA6Pi/lSDyLk2a2QUCTix+0Kp+6DHg8QAFCr8HbyRjVvjFWkxEr/mi9tZDe3ZA2GJu50fP/Am7xBAV+dvqLwes3Efi25WZjrYO0kizXUBhNO5nSx0510QLqqPigGWwrz9sk3OULrF+nkmPRzlswijjKTaPi7PiGnDh0+0uOWLM+/qNpoHWIsbI+eSGOB7jwgDpZpJhhRtG1A7I8Zp7P9pf2JsJzon+F4zo0wUN6GJxpMfhtRsL3x6kLu7H9mrHXCELYLAnblpg7V66+AY3fdVSOU047ANuNVCYqgs1DBmaYlvScD3ye4P5T6Yv5LrtMNhwxTEKgc1/EBUBYzbfBa1GI4tRgu37tefpDNHORBWDMJkOxevAeCay7grn0yh+YEIT7NRxOZ4K0FT+j6xvvD5rJ0q3yNdtWgKKAXjT222JX+NQH+jKtYd/2J/3bi0Nhm7Kij1OiXy5STYkxwDqrafCAVMWkBB3jnNhDKpjh2m3FW+w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: orB0ulNSip4Cs2w3b51cgUct2CU5qzABPWUcy0sSQnYOaawhbD+J3mNTb5xmvdSTkZG2AHJ1B6bw6vtcgRL1zCdZ8NMLVQW1L8cUNooCMDDmW4mNlgfbyGhdzzwGMCJB0ZUKUIUR1rF3rmZ7JrT6n6ZhoJltERnu1yuocE/d0oPLbPDfrffPFStcGSAFWRHKf2BvzvRHi+FMGAzqZDn3qsKCROdpC7QdYUGbZDH0G81SvxqPg8P+fptLEftprfXHGZbPsXFtYoV6LCNfHuhYMCjxe8vd0H1aoYKIhn/+Yc95rNVNGrJXuysa7rCUx+cmiR8Zfr1WSBS9/gH2495dDSYcYT06RWwxQwoaHAHTL8uUjWxixlYv6gEPvPv9s8i02Opezrcue7YeSoS04XzwsFEoejR2GydRvJessRNe4rryTaOZDkGq8dA7QFHY0+W+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:20:41.7901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38398ae3-72a3-4a1e-e1c1-08de7940d0a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
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
X-Rspamd-Queue-Id: 2DC031F39AA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Otherwise the content might not be relevant.

When a coredump is generated the rings with outstanding fences
are saved and then printed to the final devcoredump from the
worker thread.
Since this requires memory allocation, the ring capture might
be missing from the generated devcoredump.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 82 +++++++++++++++----
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  | 12 +++
 2 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 0c7fc3800f17..58b2e764dd7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -207,7 +207,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
 	struct amdgpu_ip_block *ip_block;
-	int ver;
+	struct amdgpu_ring *ring;
+	int ver, i, j;
+	u32 ring_idx, off;
 
 	iter.data = buffer;
 	iter.offset = 0;
@@ -297,23 +299,25 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 
 	/* Add ring buffer information */
 	drm_printf(&p, "Ring buffer information\n");
-	for (int i = 0; i < coredump->adev->num_rings; i++) {
-		int j = 0;
-		struct amdgpu_ring *ring = coredump->adev->rings[i];
+	if (coredump->num_rings) {
+		for (i = 0; i < coredump->num_rings; i++) {
+			ring_idx = coredump->rings[i].ring_index;
+			ring = coredump->adev->rings[ring_idx];
+			off = coredump->rings[i].offset;
 
-		drm_printf(&p, "ring name: %s\n", ring->name);
-		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
-			   amdgpu_ring_get_rptr(ring),
-			   amdgpu_ring_get_wptr(ring),
-			   ring->buf_mask);
-		drm_printf(&p, "Ring size in dwords: %d\n",
-			   ring->ring_size / 4);
-		drm_printf(&p, "Ring contents\n");
-		drm_printf(&p, "Offset \t Value\n");
+			drm_printf(&p, "ring name: %s\n", ring->name);
+			drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
+				   coredump->rings[i].rptr,
+				   coredump->rings[i].wptr,
+				   ring->buf_mask);
+			drm_printf(&p, "Ring size in dwords: %d\n",
+				ring->ring_size / 4);
+			drm_printf(&p, "Ring contents\n");
+			drm_printf(&p, "Offset \t Value\n");
 
-		while (j < ring->ring_size) {
-			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j / 4]);
-			j += 4;
+			for (j = 0; j < ring->ring_size; j += 4)
+				drm_printf(&p, "0x%x \t 0x%x\n", j,
+					   coredump->rings_dw[off + j / 4]);
 		}
 	}
 
@@ -353,6 +357,8 @@ static void amdgpu_devcoredump_free(void *data)
 	struct amdgpu_coredump_info *coredump = data;
 
 	kvfree(coredump->formatted);
+	kvfree(coredump->rings);
+	kvfree(coredump->rings_dw);
 	kvfree(data);
 }
 
@@ -390,6 +396,9 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	struct drm_device *dev = adev_to_drm(adev);
 	struct amdgpu_coredump_info *coredump;
 	struct drm_sched_job *s_job;
+	u64 total_ring_size, ring_count;
+	struct amdgpu_ring *ring;
+	int i, off, idx;
 
 	/* No need to generate a new coredump if there's one in progress already. */
 	if (work_pending(&adev->coredump_work))
@@ -417,6 +426,47 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 		coredump->ring = to_amdgpu_ring(s_job->sched);
 	}
 
+	/* Dump ring content if memory allocation succeeds. */
+	ring_count = 0;
+	total_ring_size = 0;
+	for (i = 0; i < adev->num_rings; i++) {
+		ring = adev->rings[i];
+
+		/* Only dump rings with unsignalled fences. */
+		if (atomic_read(&ring->fence_drv.last_seq) == ring->fence_drv.sync_seq &&
+		    coredump->ring != ring)
+			continue;
+
+		total_ring_size += ring->ring_size;
+		ring_count++;
+	}
+	coredump->rings_dw = kzalloc(total_ring_size, GFP_NOWAIT);
+	coredump->rings = kcalloc(ring_count, sizeof(struct amdgpu_coredump_ring), GFP_NOWAIT);
+	if (coredump->rings && coredump->rings_dw) {
+		for (i = 0, off = 0, idx = 0; i < adev->num_rings; i++) {
+			ring = adev->rings[i];
+
+			if (atomic_read(&ring->fence_drv.last_seq) == ring->fence_drv.sync_seq &&
+			    coredump->ring != ring)
+				continue;
+
+			coredump->rings[idx].ring_index = ring->idx;
+			coredump->rings[idx].rptr = amdgpu_ring_get_rptr(ring);
+			coredump->rings[idx].wptr = amdgpu_ring_get_wptr(ring);
+			coredump->rings[idx].offset = off;
+
+			memcpy(&coredump->rings_dw[off], ring->ring, ring->ring_size);
+			off += ring->ring_size;
+			idx++;
+		}
+		coredump->num_rings = idx;
+	} else {
+		kvfree(coredump->rings_dw);
+		kvfree(coredump->rings);
+		coredump->rings_dw = NULL;
+		coredump->rings = NULL;
+	}
+
 	coredump->adev = adev;
 
 	ktime_get_ts64(&coredump->reset_time);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index b3582d0b4ca4..5d6c58abf589 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
@@ -31,6 +31,13 @@
 
 #define AMDGPU_COREDUMP_VERSION "1"
 
+struct amdgpu_coredump_ring {
+	u64				rptr;
+	u64				wptr;
+	u32				ring_index;
+	u32				offset;
+};
+
 struct amdgpu_coredump_info {
 	struct amdgpu_device            *adev;
 	struct amdgpu_task_info         reset_task_info;
@@ -39,6 +46,11 @@ struct amdgpu_coredump_info {
 	bool                            skip_vram_check;
 	bool                            reset_vram_lost;
 	struct amdgpu_ring              *ring;
+
+	struct amdgpu_coredump_ring	*rings;
+	u32				*rings_dw;
+	u32				num_rings;
+
 	/* Readable form of coredevdump, generate once to speed up
 	 * reading it (see drm_coredump_printer's documentation).
 	 */
-- 
2.43.0

