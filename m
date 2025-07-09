Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80CAFE4EE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D1010E782;
	Wed,  9 Jul 2025 10:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ulbW41wN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6608610E77A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 10:04:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5694tX8i317115;
 Wed, 9 Jul 2025 11:04:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=F
 xD1z5yPidGXrQ4pKEj7IdqHsdw2txmMPZDo/Il/3jE=; b=ulbW41wNYgWLIfp3t
 WqysebVx4F/HC8ptQin9SsVkfpiwBE+27MgCe9HzWX1us9PbYg1ZtfdB7N6VmecP
 Hss5I/Vf5JN3s2ot5DkAW+/IVG7PxIdLGlWzEqK7pub2D+6M3xbNHwJdvvSW2gHZ
 ouXqsoF4IOas0QUo5QeFkHyTN0gW2qCuTwldOOpaTlD8DVgiL//Y+aDl1+i96Hnu
 xxh5QORlCsvn2a6jpjHsJMJ12KuuKDBYMRkPWWTe4WwP7kywOf9yBNWfQ8YkWQK6
 TIqN99fwW184farVTlYh4pj2SXWJhixYJmO6ZTnY9zgm823kT5OIxB1M/STqMX4I
 bGkog==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47pv4t3q37-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 09 Jul 2025 11:04:34 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.2.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 9 Jul 2025 11:04:32 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Wed, 9 Jul 2025 11:04:10 +0100
Subject: [PATCH 2/2] drm/imagination: Use struct_size_t()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-flex-array-check-v1-2-8adeb0bf0cde@imgtec.com>
References: <20250709-flex-array-check-v1-0-8adeb0bf0cde@imgtec.com>
In-Reply-To: <20250709-flex-array-check-v1-0-8adeb0bf0cde@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Matt
 Coster" <matt.coster@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=AAhsaKXoeTKToXDgfqzCr2N3fPxs3y7JThutds5j/Tc=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWTk2a0/wlO/6PQMXQ8//VPPJ/wNZe7Qe2LVtOn629mXD
 JZ1bWNg6yhlYRDjYJAVU2TZscJyhdofNS2JG7+KYeawMoEMYeDiFICJROxiZHjUdLyHg+2fbJHw
 4YWsdddK9b5u9fzWWs9wfftj5rlZNdcZfrP8VF4gll3B0JFkmPR7R/MmDSXuvLlfDI95L+jJPup
 jywQA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.2.134]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: K5oXViUFKwd7h8LrljoQThUFr5ttJy_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAyMCBTYWx0ZWRfX756bTb+Ytbjs
 PmlYgaI4E6/MXiL4IlXEQHUOe1+5yQeOh0dL51KkD9Wz6sB0YLxLABLwIUFE8BIj8Mw8n0rNZtX
 I650tKMC1sUhpdfCZaU1+tuSqincdauhQxzmaiCEcwR4c2FKbTAPBmj1Or/WXqV/w3bLJqUYIEB
 ufxTGJBkHNQVpK6UMRiA8x9Jw6OHjExmP6RiDw8gQSQanjHfuNJkTIDudHk55ZXJnp4bJdgYl6I
 9c9ftfYWiHAQRhT51QTdWRTPlTDzLfaP8JQIUZ3X4Psr7oxf57W5xJWxa7ThxjzaDmPp5jvsqsv
 SZsC0lFaHzwkfCGyPnkw8c4qn5VFv25vgQ6PLUsYl5Ki3qC/QKPE4hJIkU/zunk7PfMwsXfrVIB
 nFQiMEx2
X-Proofpoint-ORIG-GUID: K5oXViUFKwd7h8LrljoQThUFr5ttJy_7
X-Authority-Analysis: v=2.4 cv=fMw53Yae c=1 sm=1 tr=0 ts=686e3eb2 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=OXfeAiaCWNgA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=r_1tXGB3AAAA:8
 a=yjSvmlsFm-r5wrLTlc4A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

The helpers for dealing with flexible structures exist, so let's use them.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 5a41ee79fed646a86344cd16e78efdb45ff02e43..094a854576a5a63f56e56acdebf01bdf542ae4d5 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -3,6 +3,7 @@
 
 #include <drm/drm_managed.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/overflow.h>
 
 #include "pvr_cccb.h"
 #include "pvr_context.h"
@@ -35,9 +36,8 @@ static int get_xfer_ctx_state_size(struct pvr_device *pvr_dev)
 			return err;
 	}
 
-	return sizeof(struct rogue_fwif_frag_ctx_state) +
-	       (num_isp_store_registers *
-		sizeof(((struct rogue_fwif_frag_ctx_state *)0)->frag_reg_isp_store[0]));
+	return struct_size_t(struct rogue_fwif_frag_ctx_state,
+			     frag_reg_isp_store, num_isp_store_registers);
 }
 
 static int get_frag_ctx_state_size(struct pvr_device *pvr_dev)
@@ -65,9 +65,8 @@ static int get_frag_ctx_state_size(struct pvr_device *pvr_dev)
 			return err;
 	}
 
-	return sizeof(struct rogue_fwif_frag_ctx_state) +
-	       (num_isp_store_registers *
-		sizeof(((struct rogue_fwif_frag_ctx_state *)0)->frag_reg_isp_store[0]));
+	return struct_size_t(struct rogue_fwif_frag_ctx_state,
+			     frag_reg_isp_store, num_isp_store_registers);
 }
 
 static int get_ctx_state_size(struct pvr_device *pvr_dev, enum drm_pvr_job_type type)

-- 
2.50.1

