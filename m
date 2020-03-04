Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF381786DD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 01:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C130E6E988;
	Wed,  4 Mar 2020 00:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FF66E980;
 Wed,  4 Mar 2020 00:14:05 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e5ef2a40000>; Tue, 03 Mar 2020 16:13:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 03 Mar 2020 16:14:05 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 03 Mar 2020 16:14:05 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Mar
 2020 00:14:02 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 4 Mar 2020 00:14:02 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e5ef2c90001>; Tue, 03 Mar 2020 16:14:01 -0800
From: Ralph Campbell <rcampbell@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 1/4] nouveau/hmm: fix vma range check for migration
Date: Tue, 3 Mar 2020 16:13:36 -0800
Message-ID: <20200304001339.8248-2-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200304001339.8248-1-rcampbell@nvidia.com>
References: <20200304001339.8248-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583280804; bh=SQ1eDvDeCWzDB8hOaPPk8mCkrZrA+UiK7QY7KhDn+vA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=eOE1eePM6U4kNNM329y8Gl5WGeldxDqUGJerZpgExUrCrxqEr4jbbUGTAOhN2xm1o
 aaNfMgd7ckUMRK8ruFmK+eahQJg0BgPnK9Pn/GlnWvCeCFKox5NGwWHxW4PzAergFs
 Qm+fdUwKbtmbvSFzOY5UnOyBcUhTh+E+U7M+mTSKAFITuIFO8bZV2f4pKuEPpVlX5g
 BbgkY2zK0/nvGs+5jxz/qZt8sgEoY3CCQZkLIN1nbYIN2iv7haj++OACEmoFZPfcA5
 Kpnn9ffUGAQdJH3Fi8THjVMYgw6LYWRWh9Ri0qW/ciznn9oOQLzh93LFovaetPdvub
 s4ixUac8AM/DQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

find_vma_intersection(mm, start, end) only guarantees that end is greater
than or equal to vma->vm_start but doesn't guarantee that start is
greater than or equal to vma->vm_start. The calculation for the
intersecting range in nouveau_svmm_bind() isn't accounting for this and
can call migrate_vma_setup() with a starting address less than
vma->vm_start. This results in migrate_vma_setup() returning -EINVAL for
the range instead of nouveau skipping that part of the range and migrating
the rest.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index df9bf1fd1bc0..169320409286 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -179,6 +179,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		if (!vma)
 			break;
 
+		addr = max(addr, vma->vm_start);
 		next = min(vma->vm_end, end);
 		/* This is a best effort so we ignore errors */
 		nouveau_dmem_migrate_vma(cli->drm, vma, addr, next);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
