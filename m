Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B951C87A7A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 02:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6049C10E4DA;
	Wed, 26 Nov 2025 01:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="4zYeDp57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6E810E4DA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 01:12:24 +0000 (UTC)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APHf2Rl786424; Tue, 25 Nov 2025 17:11:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=s2048-2025-q2; bh=0pwajfJmeTimpc9k6J
 HG6Zxex5YoS5wwfaShFryGPJI=; b=4zYeDp57KcBNA3YeNGWPs58Hr8F7AQ0S/M
 guQ76Y3JV9xYiMROhiaa817hfCV7iah8M71gcbf35S/NXnYg3AiQBM3Mm+Zg3yVO
 xfg5dib7uqc1olS565bn5kqgusWa3r85wtIwhl7aRo6RrHaLc1Vc26C5oGu/2jv/
 XiXojQgpd9QOguDmMTSOK5gm0PU3RXcSSu37RfgnP/G1488nkJ9X+G4SMGqkJMb2
 /VWvDOV8A/+2bad6jxLLYGc6mmAYvSVYFSkP5dV7PtfS1XnpTfQRIAdH4LNGySIL
 7EaxjdVBqexlz7GHB27foLAX/SlZIUmyxttekMDCWppghDaCvReQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4anh2qu47c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 Nov 2025 17:11:46 -0800 (PST)
Received: from devgpu015.cco6.facebook.com (2620:10d:c0a8:1c::1b) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 01:11:45 +0000
From: Alex Mastro <amastro@fb.com>
Date: Tue, 25 Nov 2025 17:11:18 -0800
Subject: [PATCH] dma-buf: fix integer overflow in fill_sg_entry() for
 buffers >= 8GiB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251125-dma-buf-overflow-v1-1-b70ea1e6c4ba@fb.com>
X-B4-Tracking: v=1; b=H4sIALVTJmkC/x3MwQmEMBAF0FaGf3bAJEQkrSweXJ3ogJolQV0Qe
 xd8BbwLRbJKQaALWQ4tmjYEMhVhmPttEtYRgWBr642xnse15+8eOR2S45JOFme9i6ZuxTWoCL8
 sUf9v+enu+wHmIfnEYgAAAA==
X-Change-ID: 20251125-dma-buf-overflow-e3253f108e36
To: Sumit Semwal <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Williamson <alex@shazbot.org>
CC: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Kevin
 Tian" <kevin.tian@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Alex Mastro <amastro@fb.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [2620:10d:c0a8:1c::1b]
X-Proofpoint-GUID: q8INm3I2xOg6cx0iIU4Kc3VRApXBjpn6
X-Proofpoint-ORIG-GUID: q8INm3I2xOg6cx0iIU4Kc3VRApXBjpn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwNyBTYWx0ZWRfX3XhekP/4jYMT
 h3vlGZOu7PIVj0MxvIyAWPxvb0dUEReVbwEsSMmKyToaIx2aOj91g42tgfrXUib6UyLFSWNr8qf
 7ODlUPowzwVsbZKHSPxA1Cit7LdE9nHT2mTRsi8mItZ6+MoE3NRow2svUKQY+gt6NBjPQ/KyOdY
 I450z/LaPqbAkuP6NwG8DWeOHoVdX/TXt9ZC9SX7f/j6vz/doHk2l4DLH+uLL8q0bal5fz65EAD
 J99aaYXO7w5uv3R5kPgOS9OxKZHevVk1EL5T/fU+nAci7mPyq62sruU+NWuQy4FTLziGRoAkvq7
 o++VYVWmnJ/baF8BRLlL+SGtwCJSJVVR7QJOv+dSVhTPlam+v2x3cWVV0kurbTljtP6emOpAsa2
 iLJVjmJp80u6z0mI7C31SW+LSuiglg==
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=692653d2 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=3j4BkbkPAAAA:8 a=Ikd4Dj_1AAAA:8 a=FOH2dFAWAAAA:8
 a=UiN8ms7W_JB_tl96y0MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
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

fill_sg_entry() splits large DMA buffers into multiple scatter-gather
entries, each holding up to UINT_MAX bytes. When calculating the DMA
address for entries beyond the second one, the expression (i * UINT_MAX)
causes integer overflow due to 32-bit arithmetic.

This manifests when the input arg length >= 8 GiB results in looping for
i >= 2.

Fix by casting i to dma_addr_t before multiplication.

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Signed-off-by: Alex Mastro <amastro@fb.com>
---
More color about how I discovered this in [1] for the commit at [2]:

[1] https://lore.kernel.org/all/aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com
[2] https://lore.kernel.org/all/20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com
---
 drivers/dma-buf/dma-buf-mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index b4819811a64a..b7352e609fbd 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -24,7 +24,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 		 * does not require the CPU list for mapping or unmapping.
 		 */
 		sg_set_page(sgl, NULL, 0, 0);
-		sg_dma_address(sgl) = addr + i * UINT_MAX;
+		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
 		sg_dma_len(sgl) = len;
 		sgl = sg_next(sgl);
 	}

---
base-commit: 5415d887db0e059920cb5673a32cc4d66daa280f
change-id: 20251125-dma-buf-overflow-e3253f108e36

Best regards,
-- 
Alex Mastro <amastro@fb.com>

