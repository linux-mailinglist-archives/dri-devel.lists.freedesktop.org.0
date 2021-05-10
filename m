Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71954379424
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D79B6E8B9;
	Mon, 10 May 2021 16:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6136E8BD;
 Mon, 10 May 2021 16:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNiOhVsJN61CPRtei+G0z7dS8rHFIb56yD/Yi3bff0EZ7qI1a+HMkflaaf9oQZ/l03byeFNpnJtOEnWK6N/Ux6ytp/KZYCKIFBKKbJeH4NKA0l1uIuWEoYLsi9DmdQm5g4qODsI3+1LJAjaqacp2BcbGDb/t24Wnk88ti74rRb90PSYZYGVvXxKMzKYP9Cq3YY4zajQL00qx6dmSrZrO3rrE4nZT4WVjTUpt88EUyL6pROWXttCMw3DeR66GnRRBXh0eo60bchMxBtX32wE43Y/orROzs+0i4uIjtQZGJupd5GXee/nicBP0/9v4HoabmTYeyqTTfR7MIvyqspL9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DstkaeNteEXkR2rRWOuxwCTbNBJAyOp8exCoBjZvTNw=;
 b=eLacPs1zskEDr5hnSLOtY+6r+Lqg+nTudDYoNG+28Br0BRo1HXJjCnxdM51ROWq7Upmjxsytu5Bba2mczcq9qa5dOU67za8VVFoxiStuTOST6NfoMkhBf5v3b+0saAKatbfRnng2o9BHcYjoM6fKz8GkPHfk3Wv/YY8miKpcUF/IiFLax1Y/HPIeB+J+1SiF7eL2bW+tlC6/LYlnk68wKEuJcIt84n2eH2mngKo91X7MVCOb2W8VP2OutAe1xT2HxfggXh1nGWgAmDDE+az+AJG15CV2TXB6G4OmzR2ioSWKKO6rCpB7caQmbjmOv6Qa/HMwOY4ltHFzUIkYGYm1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DstkaeNteEXkR2rRWOuxwCTbNBJAyOp8exCoBjZvTNw=;
 b=poL5sTkHVMACH6XPnfO7qODf4vRcJO9yKy02QUOq333vr8MLn2qQxDLHlNXWDfs7szzn4imdt+IHUXM0k9hKGWtRpT2mCK9SvsA4DTIc2waE7rmYvZ/0mTLZ3lVmDMVC2arHMGoz4j+lhUYUQrMT1RA9knIPshFO9tt0hxj/UCU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2397.namprd12.prod.outlook.com (2603:10b6:802:27::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Mon, 10 May
 2021 16:36:59 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:59 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 10/16] drm/amdgpu: Guard against write accesses after
 device removal
Date: Mon, 10 May 2021 12:36:19 -0400
Message-Id: <20210510163625.407105-11-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8472f9cc-06ca-4b62-c189-08d913d1d506
X-MS-TrafficTypeDiagnostic: SN1PR12MB2397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB239750851244077995F3AF75EA549@SN1PR12MB2397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FG15+OyWUcVlblH8YeNmkHD7KTVougqlIt6EK6QB+VKXjJg6yr68HE5B/QN0O7tTuQI7UP3Lca5tx43x07tfrj34G11IBuzh8LF+HUGn5HhXjIaeHHt5nGqt98PRnsvkuNMU45WSRQUs8bC6pX2Us7gO1xuX5ejvHJHYBErRcXXJcKoyohZJEyVy8Lye+dcKwA5YlVyD88JsaW8boIs1nRG19FECJnaJE9PTXgVSlq31HHAakvUqs/y5/8p7aawNCAXEAqb8Pf2MlLhu/crMYd50/K16mojmmlVBnqPhIwnubIwM2umUxS28tSssh9HQksywXmXDwj2QqndrkfCkkGsmyroKuAn+11RWB+PPih1tfuVLMN/ysFn8AUOeYyON4VDM3CytB/O2dv5rW/fYRi5AR1LXqsIpSGWAQxPjKzUEOwik0VNtjLmfsnBT6/OUW2LI1jmGJnzusX16djxLxgNs3ecLBV9FPcFxhPZFlPLza9iYZsZU6etNBcoAUdmcTWuvo9fCes+mybOusoIUckOEVJf8uAV2ZuKYV/e+TjDOfg2p8/nDhJzM194zmexPDUIiVIG16mCzqVAuIpBKHiLf/W+HNOCwevGchLn5QWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(1076003)(6636002)(44832011)(83380400001)(30864003)(6512007)(66946007)(66556008)(36756003)(2906002)(66476007)(6666004)(316002)(16526019)(5660300002)(52116002)(4326008)(8676002)(6506007)(2616005)(8936002)(6486002)(86362001)(38100700002)(186003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z/9xJLz5ecfZ9cbqsIWU9Y3YuM8aNPVoslTeIeJZR8Dpat7dLrR7704nBuXr?=
 =?us-ascii?Q?D7/aXZX+JDFQlx74yGhL0WTlb7QnC7RrP0BmYKlBsaasCUJzwK3ZsGkQEWps?=
 =?us-ascii?Q?ZJnUmqi91oi9BcOtaFPQ8ucl8GpPrTSt81kq/yQCs24TBM7nLS/9Vjn49SOV?=
 =?us-ascii?Q?/HucSYq1qhVt0psQkd8cT81tC+WRahV9gLtfO4CIoh/jtUawaz8BOMFV89AT?=
 =?us-ascii?Q?tZW703VbGczUso2HKDSoeDFo/LFpt7pn5+UrPbIFsSMVsTpYPs+PU0lhBloZ?=
 =?us-ascii?Q?CCIEGo2ZEpg/UylKfJWZ/1+lx7lzJTb93h1B3Kq4v1zN/IRt2gHnC3hyKHnB?=
 =?us-ascii?Q?NtIjD5pfCBnIJ+TZAVVQbxU6fgSv+U5XmRt/5y8IO+HolOmo2spopyzN0Ldr?=
 =?us-ascii?Q?IWvgjz5S2CG0D0gNGn4NL+1ztQkC+w/4OLjJYbQPHdWQJyuGQC5d1laeFvHO?=
 =?us-ascii?Q?lfLJtkXOJFhMqRZKg4VLjr2+lHxiNMKwIdV63Tv3D9T55KzVsC5xXghts4vE?=
 =?us-ascii?Q?kJ+xBSS6QImBmRnDKcxt+2wopUWzqooyretNnJAR9dr/jclaekk9DzhBPc8A?=
 =?us-ascii?Q?xH36qa5KCvqbnOV5auv20hDKOLMquSuoPk29e8r0sUeJxj+J1v9L89QMnkVR?=
 =?us-ascii?Q?Fqhn8Lmd3v8PqbCHIHQI0xJchZS+7NIShqG0k6AoJSdxd6mpwmDMqXIE1siM?=
 =?us-ascii?Q?27wdtjS0kuf4W6oPwC+Te3gnm5dSnH5unhUcsVXAGrXT5ioQYhZU5B8nHLWK?=
 =?us-ascii?Q?oKFbWd39MDdad5EvF01OR6/hA+05eVbvvYL8aPIkNuln7tF457scd0xsgFU4?=
 =?us-ascii?Q?IPVxJGXVNHtL+rZ2xH7pkeIZDkZq9r8NbTIuhmcrzHDoPlyVDebvoLeXhsJp?=
 =?us-ascii?Q?GjlftBsQwNLdJ63tmXHlO4MS3R6DPqnsATIV22FztxIa4Yog37QAqHrPqO6g?=
 =?us-ascii?Q?5RnPSvh8X5yghGPZ0duY/vfD+3E/Kml1oG2ObL1v8mr7rSkUOD/pt+uLH76G?=
 =?us-ascii?Q?JhlpPqg9uGLXvldx7Reteotlq/Cw41ZnDelT9f0CSDnYDG/PTttEsEGDLMuv?=
 =?us-ascii?Q?SGXL+fHwcWQ94c+ifSdz4iWuyqCs1WCwGBqwGJdYzLyEDlnB933B/JOS2R82?=
 =?us-ascii?Q?SA9jspPxfiU/Am1whkY/1sQL+nTf11L/g2eNOOg+c4UoaS382R7IiRlu6Sdo?=
 =?us-ascii?Q?ZySZOwWYXzxzqmxX+H8GMnW+m2o19wXW7a9yZk1BCcgJWm1x1rlX4hB1V/am?=
 =?us-ascii?Q?uN9yYQGoGHJxSNiKS4Gwnnb0y3nEHLphfSyXq6NL2MxUjhIyHNYIytVx4no1?=
 =?us-ascii?Q?+j9TzfJourjJ8+1Rk4lqZD6KXEWqKhktpWm8L40zVHbhV0zZyfbyoo+xYU/O?=
 =?us-ascii?Q?MiPJTV8marwUXqEit8QNJrYulRNL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8472f9cc-06ca-4b62-c189-08d913d1d506
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:59.4817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLFqzNQmETsXfKEb6SYbVd8EMqYv4XCcCL8bo4hw3zKPGZMYVnC99Gxwq8gV1PtCeGDQYAe8C551M40fyL81LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2397
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should prevent writing to memory or IO ranges possibly
already allocated for other uses after our device is removed.

v5:
Protect more places wher memcopy_to/form_io takes place
Protect IB submissions

v6: Switch to !drm_dev_enter instead of scoping entire code
with brackets.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 11 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  9 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        | 17 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 63 +++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h       |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      | 70 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      | 49 ++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       | 31 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       | 11 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 22 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  7 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        | 44 ++++++------
 drivers/gpu/drm/amd/amdgpu/psp_v12_0.c        |  8 +--
 drivers/gpu/drm/amd/amdgpu/psp_v3_1.c         |  8 +--
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c         | 26 ++++---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         | 22 +++---
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c |  2 +
 17 files changed, 257 insertions(+), 145 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a0bff4713672..94c415176cdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -71,6 +71,8 @@
 #include <drm/task_barrier.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_drv.h>
+
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
@@ -281,7 +283,10 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
 	unsigned long flags;
 	uint32_t hi = ~0;
 	uint64_t last;
+	int idx;
 
+	 if (!drm_dev_enter(&adev->ddev, &idx))
+		 return;
 
 #ifdef CONFIG_64BIT
 	last = min(pos + size, adev->gmc.visible_vram_size);
@@ -299,8 +304,10 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
 			memcpy_fromio(buf, addr, count);
 		}
 
-		if (count == size)
+		if (count == size) {
+			drm_dev_exit(idx);
 			return;
+		}
 
 		pos += count;
 		buf += count / 4;
@@ -323,6 +330,8 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
 			*buf++ = RREG32_NO_KIQ(mmMM_DATA);
 	}
 	spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
+
+	drm_dev_exit(idx);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 4d32233cde92..04ba5eef1e88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -31,6 +31,8 @@
 #include "amdgpu_ras.h"
 #include "amdgpu_xgmi.h"
 
+#include <drm/drm_drv.h>
+
 /**
  * amdgpu_gmc_pdb0_alloc - allocate vram for pdb0
  *
@@ -151,6 +153,10 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev, void *cpu_pt_addr,
 {
 	void __iomem *ptr = (void *)cpu_pt_addr;
 	uint64_t value;
+	int idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return 0;
 
 	/*
 	 * The following is for PTE only. GART does not have PDEs.
@@ -158,6 +164,9 @@ int amdgpu_gmc_set_pte_pde(struct amdgpu_device *adev, void *cpu_pt_addr,
 	value = addr & 0x0000FFFFFFFFF000ULL;
 	value |= flags;
 	writeq(value, ptr + (gpu_page_idx * 8));
+
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index 148a3b481b12..62fcbd446c71 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -30,6 +30,7 @@
 #include <linux/slab.h>
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "atom.h"
@@ -137,7 +138,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 	bool secure;
 
 	unsigned i;
-	int r = 0;
+	int idx, r = 0;
 	bool need_pipe_sync = false;
 
 	if (num_ibs == 0)
@@ -169,13 +170,16 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 		return -EINVAL;
 	}
 
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return -ENODEV;
+
 	alloc_size = ring->funcs->emit_frame_size + num_ibs *
 		ring->funcs->emit_ib_size;
 
 	r = amdgpu_ring_alloc(ring, alloc_size);
 	if (r) {
 		dev_err(adev->dev, "scheduling IB failed (%d).\n", r);
-		return r;
+		goto exit;
 	}
 
 	need_ctx_switch = ring->current_ctx != fence_ctx;
@@ -205,7 +209,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 		r = amdgpu_vm_flush(ring, job, need_pipe_sync);
 		if (r) {
 			amdgpu_ring_undo(ring);
-			return r;
+			goto exit;
 		}
 	}
 
@@ -286,7 +290,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 		if (job && job->vmid)
 			amdgpu_vmid_reset(adev, ring->funcs->vmhub, job->vmid);
 		amdgpu_ring_undo(ring);
-		return r;
+		goto exit;
 	}
 
 	if (ring->funcs->insert_end)
@@ -304,7 +308,10 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 		ring->funcs->emit_wave_limit(ring, false);
 
 	amdgpu_ring_commit(ring);
-	return 0;
+
+exit:
+	drm_dev_exit(idx);
+	return r;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 9e769cf6095b..bb6afee61666 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -25,6 +25,7 @@
 
 #include <linux/firmware.h>
 #include <linux/dma-mapping.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_psp.h"
@@ -39,6 +40,8 @@
 #include "amdgpu_ras.h"
 #include "amdgpu_securedisplay.h"
 
+#include <drm/drm_drv.h>
+
 static int psp_sysfs_init(struct amdgpu_device *adev);
 static void psp_sysfs_fini(struct amdgpu_device *adev);
 
@@ -253,7 +256,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
 		   struct psp_gfx_cmd_resp *cmd, uint64_t fence_mc_addr)
 {
 	int ret;
-	int index;
+	int index, idx;
 	int timeout = 20000;
 	bool ras_intr = false;
 	bool skip_unsupport = false;
@@ -261,6 +264,9 @@ psp_cmd_submit_buf(struct psp_context *psp,
 	if (psp->adev->in_pci_err_recovery)
 		return 0;
 
+	if (!drm_dev_enter(&psp->adev->ddev, &idx))
+		return 0;
+
 	mutex_lock(&psp->mutex);
 
 	memset(psp->cmd_buf_mem, 0, PSP_CMD_BUFFER_SIZE);
@@ -271,8 +277,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
 	ret = psp_ring_cmd_submit(psp, psp->cmd_buf_mc_addr, fence_mc_addr, index);
 	if (ret) {
 		atomic_dec(&psp->fence_value);
-		mutex_unlock(&psp->mutex);
-		return ret;
+		goto exit;
 	}
 
 	amdgpu_asic_invalidate_hdp(psp->adev, NULL);
@@ -312,8 +317,8 @@ psp_cmd_submit_buf(struct psp_context *psp,
 			 psp->cmd_buf_mem->cmd_id,
 			 psp->cmd_buf_mem->resp.status);
 		if (!timeout) {
-			mutex_unlock(&psp->mutex);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto exit;
 		}
 	}
 
@@ -321,8 +326,10 @@ psp_cmd_submit_buf(struct psp_context *psp,
 		ucode->tmr_mc_addr_lo = psp->cmd_buf_mem->resp.fw_addr_lo;
 		ucode->tmr_mc_addr_hi = psp->cmd_buf_mem->resp.fw_addr_hi;
 	}
-	mutex_unlock(&psp->mutex);
 
+exit:
+	mutex_unlock(&psp->mutex);
+	drm_dev_exit(idx);
 	return ret;
 }
 
@@ -359,8 +366,7 @@ static int psp_load_toc(struct psp_context *psp,
 	if (!cmd)
 		return -ENOMEM;
 	/* Copy toc to psp firmware private buffer */
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->toc_start_addr, psp->toc_bin_size);
+	psp_copy_fw(psp, psp->toc_start_addr, psp->toc_bin_size);
 
 	psp_prep_load_toc_cmd_buf(cmd, psp->fw_pri_mc_addr, psp->toc_bin_size);
 
@@ -625,8 +631,7 @@ static int psp_asd_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->asd_start_addr, psp->asd_ucode_size);
+	psp_copy_fw(psp, psp->asd_start_addr, psp->asd_ucode_size);
 
 	psp_prep_asd_load_cmd_buf(cmd, psp->fw_pri_mc_addr,
 				  psp->asd_ucode_size);
@@ -781,8 +786,7 @@ static int psp_xgmi_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_xgmi_start_addr, psp->ta_xgmi_ucode_size);
+	psp_copy_fw(psp, psp->ta_xgmi_start_addr, psp->ta_xgmi_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -1038,8 +1042,7 @@ static int psp_ras_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_ras_start_addr, psp->ta_ras_ucode_size);
+	psp_copy_fw(psp, psp->ta_ras_start_addr, psp->ta_ras_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -1275,8 +1278,7 @@ static int psp_hdcp_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_hdcp_start_addr,
+	psp_copy_fw(psp, psp->ta_hdcp_start_addr,
 	       psp->ta_hdcp_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
@@ -1427,8 +1429,7 @@ static int psp_dtm_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_dtm_start_addr, psp->ta_dtm_ucode_size);
+	psp_copy_fw(psp, psp->ta_dtm_start_addr, psp->ta_dtm_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -1573,8 +1574,7 @@ static int psp_rap_load(struct psp_context *psp)
 	if (!cmd)
 		return -ENOMEM;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->ta_rap_start_addr, psp->ta_rap_ucode_size);
+	psp_copy_fw(psp, psp->ta_rap_start_addr, psp->ta_rap_ucode_size);
 
 	psp_prep_ta_load_cmd_buf(cmd,
 				 psp->fw_pri_mc_addr,
@@ -3022,7 +3022,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 	void *cpu_addr;
 	dma_addr_t dma_addr;
-	int ret;
+	int ret, idx;
 	char fw_name[100];
 	const struct firmware *usbc_pd_fw;
 
@@ -3031,6 +3031,9 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
 		return -EBUSY;
 	}
 
+	if (!drm_dev_enter(ddev, &idx))
+		return -ENODEV;
+
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s", buf);
 	ret = request_firmware(&usbc_pd_fw, fw_name, adev->dev);
 	if (ret)
@@ -3062,16 +3065,30 @@ static ssize_t psp_usbc_pd_fw_sysfs_write(struct device *dev,
 rel_buf:
 	dma_free_coherent(adev->dev, usbc_pd_fw->size, cpu_addr, dma_addr);
 	release_firmware(usbc_pd_fw);
-
 fail:
 	if (ret) {
 		DRM_ERROR("Failed to load USBC PD FW, err = %d", ret);
-		return ret;
+		count = ret;
 	}
 
+	drm_dev_exit(idx);
 	return count;
 }
 
+void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size)
+{
+	int idx;
+
+	if (!drm_dev_enter(&psp->adev->ddev, &idx))
+		return;
+
+	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
+	memcpy(psp->fw_pri_buf, start_addr, bin_size);
+
+	drm_dev_exit(idx);
+}
+
+
 static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
 		   psp_usbc_pd_fw_sysfs_read,
 		   psp_usbc_pd_fw_sysfs_write);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index 46a5328e00e0..2bfdc278817f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -423,4 +423,6 @@ int psp_get_fw_attestation_records_addr(struct psp_context *psp,
 
 int psp_load_fw_list(struct psp_context *psp,
 		     struct amdgpu_firmware_info **ucode_list, int ucode_count);
+void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 688624ebe421..e1985bc34436 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -35,6 +35,8 @@
 #include "amdgpu.h"
 #include "atom.h"
 
+#include <drm/drm_drv.h>
+
 /*
  * Rings
  * Most engines on the GPU are fed via ring buffers.  Ring
@@ -461,3 +463,71 @@ int amdgpu_ring_test_helper(struct amdgpu_ring *ring)
 	ring->sched.ready = !r;
 	return r;
 }
+
+void amdgpu_ring_clear_ring(struct amdgpu_ring *ring)
+{
+	int idx;
+	int i = 0;
+
+	if (!drm_dev_enter(&ring->adev->ddev, &idx))
+		return;
+
+	while (i <= ring->buf_mask)
+		ring->ring[i++] = ring->funcs->nop;
+
+	drm_dev_exit(idx);
+
+}
+
+void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v)
+{
+	int idx;
+
+	if (!drm_dev_enter(&ring->adev->ddev, &idx))
+		return;
+
+	if (ring->count_dw <= 0)
+		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
+	ring->ring[ring->wptr++ & ring->buf_mask] = v;
+	ring->wptr &= ring->ptr_mask;
+	ring->count_dw--;
+
+	drm_dev_exit(idx);
+}
+
+void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
+					      void *src, int count_dw)
+{
+	unsigned occupied, chunk1, chunk2;
+	void *dst;
+	int idx;
+
+	if (!drm_dev_enter(&ring->adev->ddev, &idx))
+		return;
+
+	if (unlikely(ring->count_dw < count_dw))
+		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
+
+	occupied = ring->wptr & ring->buf_mask;
+	dst = (void *)&ring->ring[occupied];
+	chunk1 = ring->buf_mask + 1 - occupied;
+	chunk1 = (chunk1 >= count_dw) ? count_dw: chunk1;
+	chunk2 = count_dw - chunk1;
+	chunk1 <<= 2;
+	chunk2 <<= 2;
+
+	if (chunk1)
+		memcpy(dst, src, chunk1);
+
+	if (chunk2) {
+		src += chunk1;
+		dst = (void *)ring->ring;
+		memcpy(dst, src, chunk2);
+	}
+
+	ring->wptr += count_dw;
+	ring->wptr &= ring->ptr_mask;
+	ring->count_dw -= count_dw;
+
+	drm_dev_exit(idx);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index e7d3d0dbdd96..c67bc6d3d039 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -299,53 +299,12 @@ static inline void amdgpu_ring_set_preempt_cond_exec(struct amdgpu_ring *ring,
 	*ring->cond_exe_cpu_addr = cond_exec;
 }
 
-static inline void amdgpu_ring_clear_ring(struct amdgpu_ring *ring)
-{
-	int i = 0;
-	while (i <= ring->buf_mask)
-		ring->ring[i++] = ring->funcs->nop;
-
-}
-
-static inline void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v)
-{
-	if (ring->count_dw <= 0)
-		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
-	ring->ring[ring->wptr++ & ring->buf_mask] = v;
-	ring->wptr &= ring->ptr_mask;
-	ring->count_dw--;
-}
+void amdgpu_ring_clear_ring(struct amdgpu_ring *ring);
 
-static inline void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
-					      void *src, int count_dw)
-{
-	unsigned occupied, chunk1, chunk2;
-	void *dst;
-
-	if (unlikely(ring->count_dw < count_dw))
-		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
-
-	occupied = ring->wptr & ring->buf_mask;
-	dst = (void *)&ring->ring[occupied];
-	chunk1 = ring->buf_mask + 1 - occupied;
-	chunk1 = (chunk1 >= count_dw) ? count_dw: chunk1;
-	chunk2 = count_dw - chunk1;
-	chunk1 <<= 2;
-	chunk2 <<= 2;
+void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v);
 
-	if (chunk1)
-		memcpy(dst, src, chunk1);
-
-	if (chunk2) {
-		src += chunk1;
-		dst = (void *)ring->ring;
-		memcpy(dst, src, chunk2);
-	}
-
-	ring->wptr += count_dw;
-	ring->wptr &= ring->ptr_mask;
-	ring->count_dw -= count_dw;
-}
+void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
+					      void *src, int count_dw);
 
 int amdgpu_ring_test_helper(struct amdgpu_ring *ring);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index c6dbc0801604..82f0542c7792 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -32,6 +32,7 @@
 #include <linux/module.h>
 
 #include <drm/drm.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
@@ -375,7 +376,7 @@ int amdgpu_uvd_suspend(struct amdgpu_device *adev)
 {
 	unsigned size;
 	void *ptr;
-	int i, j;
+	int i, j, idx;
 	bool in_ras_intr = amdgpu_ras_intr_triggered();
 
 	cancel_delayed_work_sync(&adev->uvd.idle_work);
@@ -403,11 +404,15 @@ int amdgpu_uvd_suspend(struct amdgpu_device *adev)
 		if (!adev->uvd.inst[j].saved_bo)
 			return -ENOMEM;
 
-		/* re-write 0 since err_event_athub will corrupt VCPU buffer */
-		if (in_ras_intr)
-			memset(adev->uvd.inst[j].saved_bo, 0, size);
-		else
-			memcpy_fromio(adev->uvd.inst[j].saved_bo, ptr, size);
+		if (drm_dev_enter(&adev->ddev, &idx)) {
+			/* re-write 0 since err_event_athub will corrupt VCPU buffer */
+			if (in_ras_intr)
+				memset(adev->uvd.inst[j].saved_bo, 0, size);
+			else
+				memcpy_fromio(adev->uvd.inst[j].saved_bo, ptr, size);
+
+			drm_dev_exit(idx);
+		}
 	}
 
 	if (in_ras_intr)
@@ -420,7 +425,7 @@ int amdgpu_uvd_resume(struct amdgpu_device *adev)
 {
 	unsigned size;
 	void *ptr;
-	int i;
+	int i, idx;
 
 	for (i = 0; i < adev->uvd.num_uvd_inst; i++) {
 		if (adev->uvd.harvest_config & (1 << i))
@@ -432,7 +437,10 @@ int amdgpu_uvd_resume(struct amdgpu_device *adev)
 		ptr = adev->uvd.inst[i].cpu_addr;
 
 		if (adev->uvd.inst[i].saved_bo != NULL) {
-			memcpy_toio(ptr, adev->uvd.inst[i].saved_bo, size);
+			if (drm_dev_enter(&adev->ddev, &idx)) {
+				memcpy_toio(ptr, adev->uvd.inst[i].saved_bo, size);
+				drm_dev_exit(idx);
+			}
 			kvfree(adev->uvd.inst[i].saved_bo);
 			adev->uvd.inst[i].saved_bo = NULL;
 		} else {
@@ -442,8 +450,11 @@ int amdgpu_uvd_resume(struct amdgpu_device *adev)
 			hdr = (const struct common_firmware_header *)adev->uvd.fw->data;
 			if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
 				offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
-				memcpy_toio(adev->uvd.inst[i].cpu_addr, adev->uvd.fw->data + offset,
-					    le32_to_cpu(hdr->ucode_size_bytes));
+				if (drm_dev_enter(&adev->ddev, &idx)) {
+					memcpy_toio(adev->uvd.inst[i].cpu_addr, adev->uvd.fw->data + offset,
+						    le32_to_cpu(hdr->ucode_size_bytes));
+					drm_dev_exit(idx);
+				}
 				size -= le32_to_cpu(hdr->ucode_size_bytes);
 				ptr += le32_to_cpu(hdr->ucode_size_bytes);
 			}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index ea6a62f67e38..833203401ef4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 
 #include <drm/drm.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
@@ -293,7 +294,7 @@ int amdgpu_vce_resume(struct amdgpu_device *adev)
 	void *cpu_addr;
 	const struct common_firmware_header *hdr;
 	unsigned offset;
-	int r;
+	int r, idx;
 
 	if (adev->vce.vcpu_bo == NULL)
 		return -EINVAL;
@@ -313,8 +314,12 @@ int amdgpu_vce_resume(struct amdgpu_device *adev)
 
 	hdr = (const struct common_firmware_header *)adev->vce.fw->data;
 	offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
-	memcpy_toio(cpu_addr, adev->vce.fw->data + offset,
-		    adev->vce.fw->size - offset);
+
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+		memcpy_toio(cpu_addr, adev->vce.fw->data + offset,
+			    adev->vce.fw->size - offset);
+		drm_dev_exit(idx);
+	}
 
 	amdgpu_bo_kunmap(adev->vce.vcpu_bo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 201645963ba5..21f7d3644d70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -27,6 +27,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
@@ -275,7 +276,7 @@ int amdgpu_vcn_suspend(struct amdgpu_device *adev)
 {
 	unsigned size;
 	void *ptr;
-	int i;
+	int i, idx;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
@@ -292,7 +293,10 @@ int amdgpu_vcn_suspend(struct amdgpu_device *adev)
 		if (!adev->vcn.inst[i].saved_bo)
 			return -ENOMEM;
 
-		memcpy_fromio(adev->vcn.inst[i].saved_bo, ptr, size);
+		if (drm_dev_enter(&adev->ddev, &idx)) {
+			memcpy_fromio(adev->vcn.inst[i].saved_bo, ptr, size);
+			drm_dev_exit(idx);
+		}
 	}
 	return 0;
 }
@@ -301,7 +305,7 @@ int amdgpu_vcn_resume(struct amdgpu_device *adev)
 {
 	unsigned size;
 	void *ptr;
-	int i;
+	int i, idx;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
 		if (adev->vcn.harvest_config & (1 << i))
@@ -313,7 +317,10 @@ int amdgpu_vcn_resume(struct amdgpu_device *adev)
 		ptr = adev->vcn.inst[i].cpu_addr;
 
 		if (adev->vcn.inst[i].saved_bo != NULL) {
-			memcpy_toio(ptr, adev->vcn.inst[i].saved_bo, size);
+			if (drm_dev_enter(&adev->ddev, &idx)) {
+				memcpy_toio(ptr, adev->vcn.inst[i].saved_bo, size);
+				drm_dev_exit(idx);
+			}
 			kvfree(adev->vcn.inst[i].saved_bo);
 			adev->vcn.inst[i].saved_bo = NULL;
 		} else {
@@ -323,8 +330,11 @@ int amdgpu_vcn_resume(struct amdgpu_device *adev)
 			hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
 			if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
 				offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
-				memcpy_toio(adev->vcn.inst[i].cpu_addr, adev->vcn.fw->data + offset,
-					    le32_to_cpu(hdr->ucode_size_bytes));
+				if (drm_dev_enter(&adev->ddev, &idx)) {
+					memcpy_toio(adev->vcn.inst[i].cpu_addr, adev->vcn.fw->data + offset,
+						    le32_to_cpu(hdr->ucode_size_bytes));
+					drm_dev_exit(idx);
+				}
 				size -= le32_to_cpu(hdr->ucode_size_bytes);
 				ptr += le32_to_cpu(hdr->ucode_size_bytes);
 			}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9f868cf3b832..7dd5f10ab570 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -32,6 +32,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -1606,7 +1607,10 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 	struct amdgpu_vm_update_params params;
 	enum amdgpu_sync_mode sync_mode;
 	uint64_t pfn;
-	int r;
+	int r, idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return -ENODEV;
 
 	memset(&params, 0, sizeof(params));
 	params.adev = adev;
@@ -1715,6 +1719,7 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 
 error_unlock:
 	amdgpu_vm_eviction_unlock(vm);
+	drm_dev_exit(idx);
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index 589410c32d09..2cec71e823f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -23,6 +23,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/vmalloc.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_psp.h"
@@ -269,10 +270,8 @@ static int psp_v11_0_bootloader_load_kdb(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP KDB binary to memory */
-	memcpy(psp->fw_pri_buf, psp->kdb_start_addr, psp->kdb_bin_size);
+	psp_copy_fw(psp, psp->kdb_start_addr, psp->kdb_bin_size);
 
 	/* Provide the PSP KDB to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -302,10 +301,8 @@ static int psp_v11_0_bootloader_load_spl(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP SPL binary to memory */
-	memcpy(psp->fw_pri_buf, psp->spl_start_addr, psp->spl_bin_size);
+	psp_copy_fw(psp, psp->spl_start_addr, psp->spl_bin_size);
 
 	/* Provide the PSP SPL to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -335,10 +332,8 @@ static int psp_v11_0_bootloader_load_sysdrv(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP System Driver binary to memory */
-	memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
+	psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
 
 	/* Provide the sys driver to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -371,10 +366,8 @@ static int psp_v11_0_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
+	psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -608,7 +601,7 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
 	uint32_t p2c_header[4];
 	uint32_t sz;
 	void *buf;
-	int ret;
+	int ret, idx;
 
 	if (ctx->init == PSP_MEM_TRAIN_NOT_SUPPORT) {
 		DRM_DEBUG("Memory training is not supported.\n");
@@ -681,17 +674,24 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
 			return -ENOMEM;
 		}
 
-		memcpy_fromio(buf, adev->mman.aper_base_kaddr, sz);
-		ret = psp_v11_0_memory_training_send_msg(psp, PSP_BL__DRAM_LONG_TRAIN);
-		if (ret) {
-			DRM_ERROR("Send long training msg failed.\n");
+		if (drm_dev_enter(&adev->ddev, &idx)) {
+			memcpy_fromio(buf, adev->mman.aper_base_kaddr, sz);
+			ret = psp_v11_0_memory_training_send_msg(psp, PSP_BL__DRAM_LONG_TRAIN);
+			if (ret) {
+				DRM_ERROR("Send long training msg failed.\n");
+				vfree(buf);
+				drm_dev_exit(idx);
+				return ret;
+			}
+
+			memcpy_toio(adev->mman.aper_base_kaddr, buf, sz);
+			adev->hdp.funcs->flush_hdp(adev, NULL);
 			vfree(buf);
-			return ret;
+			drm_dev_exit(idx);
+		} else {
+			vfree(buf);
+			return -ENODEV;
 		}
-
-		memcpy_toio(adev->mman.aper_base_kaddr, buf, sz);
-		adev->hdp.funcs->flush_hdp(adev, NULL);
-		vfree(buf);
 	}
 
 	if (ops & PSP_MEM_TRAIN_SAVE) {
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
index c4828bd3264b..618e5b6b85d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
@@ -138,10 +138,8 @@ static int psp_v12_0_bootloader_load_sysdrv(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP System Driver binary to memory */
-	memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
+	psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
 
 	/* Provide the sys driver to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -179,10 +177,8 @@ static int psp_v12_0_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
+	psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
index f2e725f72d2f..d0a6cccd0897 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v3_1.c
@@ -102,10 +102,8 @@ static int psp_v3_1_bootloader_load_sysdrv(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP System Driver binary to memory */
-	memcpy(psp->fw_pri_buf, psp->sys_start_addr, psp->sys_bin_size);
+	psp_copy_fw(psp, psp->sys_start_addr, psp->sys_bin_size);
 
 	/* Provide the sys driver to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
@@ -143,10 +141,8 @@ static int psp_v3_1_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos_start_addr, psp->sos_bin_size);
+	psp_copy_fw(psp, psp->sos_start_addr, psp->sos_bin_size);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_36,
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index 8e238dea7bef..90910d19db12 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -25,6 +25,7 @@
  */
 
 #include <linux/firmware.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_vce.h"
@@ -555,16 +556,19 @@ static int vce_v4_0_hw_fini(void *handle)
 static int vce_v4_0_suspend(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int r;
+	int r, idx;
 
 	if (adev->vce.vcpu_bo == NULL)
 		return 0;
 
-	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
-		unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
-		void *ptr = adev->vce.cpu_addr;
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+			unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
+			void *ptr = adev->vce.cpu_addr;
 
-		memcpy_fromio(adev->vce.saved_bo, ptr, size);
+			memcpy_fromio(adev->vce.saved_bo, ptr, size);
+		}
+		drm_dev_exit(idx);
 	}
 
 	r = vce_v4_0_hw_fini(adev);
@@ -577,16 +581,20 @@ static int vce_v4_0_suspend(void *handle)
 static int vce_v4_0_resume(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int r;
+	int r, idx;
 
 	if (adev->vce.vcpu_bo == NULL)
 		return -EINVAL;
 
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
-		unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
-		void *ptr = adev->vce.cpu_addr;
 
-		memcpy_toio(ptr, adev->vce.saved_bo, size);
+		if (drm_dev_enter(&adev->ddev, &idx)) {
+			unsigned size = amdgpu_bo_size(adev->vce.vcpu_bo);
+			void *ptr = adev->vce.cpu_addr;
+
+			memcpy_toio(ptr, adev->vce.saved_bo, size);
+			drm_dev_exit(idx);
+		}
 	} else {
 		r = amdgpu_vce_resume(adev);
 		if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 3f15bf34123a..df34be8ec82d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -34,6 +34,8 @@
 #include "vcn/vcn_3_0_0_sh_mask.h"
 #include "ivsrcid/vcn/irqsrcs_vcn_2_0.h"
 
+#include <drm/drm_drv.h>
+
 #define mmUVD_CONTEXT_ID_INTERNAL_OFFSET			0x27
 #define mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET			0x0f
 #define mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET			0x10
@@ -268,16 +270,20 @@ static int vcn_v3_0_sw_init(void *handle)
 static int vcn_v3_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int i, r;
+	int i, r, idx;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
-		volatile struct amdgpu_fw_shared *fw_shared;
+	if (drm_dev_enter(&adev->ddev, &idx)) {
+		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+			volatile struct amdgpu_fw_shared *fw_shared;
 
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-		fw_shared = adev->vcn.inst[i].fw_shared_cpu_addr;
-		fw_shared->present_flag_0 = 0;
-		fw_shared->sw_ring.is_enabled = false;
+			if (adev->vcn.harvest_config & (1 << i))
+				continue;
+			fw_shared = adev->vcn.inst[i].fw_shared_cpu_addr;
+			fw_shared->present_flag_0 = 0;
+			fw_shared->sw_ring.is_enabled = false;
+		}
+
+		drm_dev_exit(idx);
 	}
 
 	if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
index aae25243eb10..d628b91846c9 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
@@ -405,6 +405,8 @@ int smu7_request_smu_load_fw(struct pp_hwmgr *hwmgr)
 				UCODE_ID_MEC_STORAGE, &toc->entry[toc->num_entries++]),
 				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
 	}
+
+	/* AG TODO Can't call drm_dev_enter/exit because access adev->ddev here ... */
 	memcpy_toio(smu_data->header_buffer.kaddr, smu_data->toc,
 		    sizeof(struct SMU_DRAMData_TOC));
 	smum_send_msg_to_smc_with_parameter(hwmgr,
-- 
2.25.1

