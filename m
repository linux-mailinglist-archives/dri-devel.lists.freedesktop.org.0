Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RJenNNsUoGlifgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB61A3959
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF23F10E89B;
	Thu, 26 Feb 2026 09:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vPQPzVkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3060910E17C;
 Thu, 26 Feb 2026 09:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVhIr7Ndk318eGhV5R2pLf4eJERtTCD+Yj8ykLOmbnb810+jlHfE8iON384Wtmw6xSUAqabB34yKBPHT2TqYHGGSA0yIkz7d2d23ZVxjW9ttKZmJFnKNQF0TsVKO5NZQl1Rbrv8NjqG6Ndm9YQqhwu/S2ueA+SZx86rz5lZEHby4untu9+A+5C14Z3/NOZo6yWx8tBee1ZdebMUCPkVqjXFDKcmwir14clHS91cc4YcTvod5N7ivYamUnjIjwf0G0H0CMn9Doc/B4rBRm3746Tit2pjE9HkcW1CRAeZidslO10oTrquF/4CTDkFn+2TgVb5Jh3gXptnWYG1e7gvMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5mSS/2B83e1V4Oua2AWjI9yinkiG4V4SVdE1umzYZw=;
 b=fKnvRQa24rmWrJCj7fC/VNlPe9wf2Ro2pOci7Ho7UsEqXICq72OvIrK8NqT0QghCLwvMr39QVGRb2uGDQt0mMag6LfhXYfH4gdGv/AyHvMPPiLFNIXKP0elBzHrt5Oq2qEAp8zsL/RPHcm9EnyyNNuEYGM+NRMrtFNp9i6Cp7f2JIErV4FrUNRlH/mlg1eVyfuHOxZ7jwimgHxvWSK8yJftMC+aUwmpHnaOi9UF7aPzcuQTn6lG9CESgMe5sn88mPAoPOLEiyrF3p8yE895JtkJlRh+K6O0Mu4T8O01hNhV0LY0INAWTZqhRYWmrOzgLt7GCso49kRxGMGZjP2+Hlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5mSS/2B83e1V4Oua2AWjI9yinkiG4V4SVdE1umzYZw=;
 b=vPQPzVkHMkvM94r+ASZnYt4MDqWQ1uKyDUnWhIIep14ccCythNGEDETwQzOdsdcjX4I37IIWXloQo29qhlT07yCA+1cVaNh/2dm5GqWV98QY5KuV+q7fUkB5XmXuxXDz4btBWM3/FbRZGeV8VgqXvCbk6Y2kQXHZlmeGZTG7CEI=
Received: from SA0PR11CA0203.namprd11.prod.outlook.com (2603:10b6:806:1bc::28)
 by DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 09:39:29 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:1bc:cafe::3e) by SA0PR11CA0203.outlook.office365.com
 (2603:10b6:806:1bc::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 09:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 09:39:28 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Feb 2026 03:39:26 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/6] drm/amdgpu: save ring content before resetting the
 device
Date: Thu, 26 Feb 2026 10:37:21 +0100
Message-ID: <20260226093727.2584-3-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|DS7PR12MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 808d408a-8caf-43e0-8738-08de751aefed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: gZ4Dsaf95BXpqxEGi/QdQeoWgnz1vm99mHz0wksTt5SaFh0ZUX+WMTaXqcCLQANHyWasr4kaT8g2hM1iGrlEbCMRzpBLAAAo2Ke1cHRS4wFBnmnCxOx53tyiLvspXyNuR5x7V2nXFwVMF1jTJbhfC8S8HWOhp3xy9/jt8IfDTKYaLY9JDoRDbGGwVqWNwexDXsOAJjgUvHD4MEbluclRwuUgQr9nvJ/zMO01mOF5rqe1upl6VU0UexK8K7fDQJ0oHWAq+v5P08MjrVyx9xGYKQ/s6HW5qO8rccu28coX8X7p+EAXOKp88udMT1b8vWG2fp5kClgb+gE4eSTfcrasscpfIpgTJNxF2AiuEsyieSTIJWoxlCsig2BdzPU7c0I74tnuVPiep9zFOaoWKa2wClXi4vQh02EoH2pwm2rskjeIgz3wuipg4PJdP5vjYM6h10C23LgfSjdhsasicuE/Svv4JKB7sWPLkTtDXlAEH5s21XjozW/6Xkfcnbz3alLjLoPXS7neoXTB2/GIn/XZC6freqAevLVWyWroLJNQKGTewpjO3X6/YIGN5fmEg16692hBvBWeM5dAvzzi0A3R4K42S2ZsOJqe/XX/7VKzamyPWn3WJQi11wHEgsmSINxCs6NaMlqJ1SojjAZKJ5PPnoSStnU67EyIXmTRbHeW0gxRuV2fBCSyAIrIfu9f1DRkSUKzeRCCL/mC0DJtXtT8nqG/4cV562h2sfE8Iw7Zlrvk2DO2IKJ1TI/GXBLtJe/teAfPTxRoZX1o+k0PFm+zzC6RHCaUl2CsWfV+8SmiDMTFjNYVcy8tQDf1rtndS1ZTNm0z9Sk0PTykVizm8a9Diw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ggZpHMyQu/FZ5UTpA2fjzFoCLpSDKq0GNhJGUym+wC0wQkSihYkopA3c82xvvwxwFnJJybQCPb+MciUhLEQWjYAkFwYAEj1BbnoxpRlXiuOQ6Z+fLLDAy27ihuf3jur/Pjf+ECiw/rzQtY4iqHa/wwWxSzf5BLOERw6oWe+ckf7E2kzTLFpFZXavO7KvfOIRihjsNspqa0MreEIia41caF2FbcgI1JQlkfv5L6OXAMx2GLvePrGeCgOV5NrIFE7nFFxMbvEsh+ZdHoPE6Smqh+9DcWw6RDsGyXLeudGU7KV2joRiCODMc35XG5mxTlMq9MW8RRyf4+RKZe2Bm8nPaSmuvfGOV8VwuoF3/oRJwWT/TFVnHG43Ya7McesgHonTp/iZwGGDl+HN1b80uo28EkTk71ohKaF1tzULluU9l8MKMeyyAXIqevgBix+X6FZa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:39:28.7497 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 808d408a-8caf-43e0-8738-08de751aefed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8252
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 7CBB61A3959
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
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 85 +++++++++++++++----
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  | 13 ++-
 2 files changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 0808ca98ccd9..0bf85ab43204 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -204,7 +204,9 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 	struct drm_print_iterator iter;
 	struct amdgpu_vm_fault_info *fault_info;
 	struct amdgpu_ip_block *ip_block;
-	int ver;
+	struct amdgpu_ring *ring;
+	int ver, i, j;
+	u32 ring_idx, off;
 
 	iter.data = buffer;
 	iter.offset = 0;
@@ -294,23 +296,25 @@ amdgpu_devcoredump_format(char *buffer, size_t count, struct amdgpu_coredump_inf
 
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
 
@@ -354,6 +358,8 @@ static void amdgpu_devcoredump_free(void *data)
 	cancel_work_sync(&coredump->work);
 	coredump->adev->coredump_in_progress = false;
 	kfree(coredump->formatted);
+	kfree(coredump->rings);
+	kfree(coredump->rings_dw);
 	kfree(data);
 }
 
@@ -382,6 +388,12 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 	struct drm_device *dev = adev_to_drm(adev);
 	struct amdgpu_coredump_info *coredump;
 	struct drm_sched_job *s_job;
+	u64 total_ring_size, ring_count;
+	struct amdgpu_ring *ring;
+	int i, off, idx;
+
+	if (adev->coredump_in_progress)
+		return;
 
 	if (adev->coredump_in_progress)
 		return;
@@ -410,6 +422,47 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
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
+		kfree(coredump->rings_dw);
+		kfree(coredump->rings);
+		coredump->rings_dw = NULL;
+		coredump->rings = NULL;
+	}
+
 	coredump->adev = adev;
 
 	ktime_get_ts64(&coredump->reset_time);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
index 4c37a852b74a..1c3d22356cc7 100644
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
@@ -41,12 +48,16 @@ struct amdgpu_coredump_info {
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
 	ssize_t				formatted_size;
 	char				*formatted;
-
 };
 #endif
 
-- 
2.43.0

