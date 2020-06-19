Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B82006A0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124906EC75;
	Fri, 19 Jun 2020 10:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EC76EC6F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:11 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103710euoutp011242bdc244715ca60707acb1e1383034~Z66NYJKkD1849918499euoutp01d
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103710euoutp011242bdc244715ca60707acb1e1383034~Z66NYJKkD1849918499euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563030;
 bh=Q6nmdHxiLcADSmmOczfWQ1kCLD9EfF+zt7aqe3afHuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VHefC+JluP5Qj9mL1rqlzJ5Mwi6i+VmN0PI3DSZX3mC6EZoTRF3R9qCpbOvbbI+Yx
 AO+zze1FItWiPcD2nRjl0pgTufThZWqTrRRLsyCUZu29Uu8J6VFAKhqRyl2cNTCR+H
 4hjv4h89AnE9SvAnKUpg3DurLeWXDTZ+xaRkBh5w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103709eucas1p21d6de6a02ac0a38a1c40613598ad7c02~Z66NDFxOM0715307153eucas1p2E;
 Fri, 19 Jun 2020 10:37:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DA.9D.05997.5559CEE5; Fri, 19
 Jun 2020 11:37:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103709eucas1p12c32fa6377caf78e5dc28ce0ff51e7a0~Z66MxwK080706007060eucas1p1t;
 Fri, 19 Jun 2020 10:37:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103709eusmtrp1073acf67ba92e93a81c52f0c01cf0521~Z66Mr3ezn0959609596eusmtrp1S;
 Fri, 19 Jun 2020 10:37:09 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-fa-5eec95557eb9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 03.1B.06017.5559CEE5; Fri, 19
 Jun 2020 11:37:09 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103708eusmtip20f150a4cbcaa1a29d802f5e72289a3ee~Z66MCpa440111401114eusmtip2N;
 Fri, 19 Jun 2020 10:37:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 24/36] drm: xen: fix common struct sg_table related issues
Date: Fri, 19 Jun 2020 12:36:24 +0200
Message-Id: <20200619103636.11974-25-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7qhU9/EGbTPVLPoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12iw+r37NaHPzwhNXi
 +5bJTA68HmvmrWH0uLN0J6PH3m8LWDy2f3vA6nG/+ziTx+Yl9R63/z1m9ph8Yzmjx+EPV1g8
 dt9sYPPo27KK0ePzJrkAnigum5TUnMyy1CJ9uwSujL1d7UwFfXwV0y82MzYwvuXuYuTkkBAw
 kTjxYDFbFyMXh5DACkaJvmezWSCcL4wSTxZNZYdwPjNKbN1wCaiMA6zl5XVziPhyRolr736y
 gowC6/h0SBHEZhMwlOh628UGYosItDJKnOjlAWlgFvjBJHFu2Ql2kISwgL9Ew7+HjCBDWQRU
 JfZtlQEJ8wrYSXy5foMd4jx5idUbDjCD2JxA8dctB1kh4pfYJSZNlYGwXST6HjyHqheWeHV8
 C5QtI3F6cg/YNxICzYwSD8+tZYdwehglLjfNYISospa4c+4X2GfMApoS63fpQ4QdJbbuOsoM
 8TCfxI23giBhZiBz0rbpUGFeiY42IYhqNYlZx9fBrT144RIzhO0h0ToZ5ENQWE1klOhf/oB5
 AqP8LIRlCxgZVzGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgQmqNP/jn/ZwbjrT9IhRgEO
 RiUe3hchr+OEWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHL
 WCGB9MSS1OzU1ILUIpgsEwenVANjH6doi+B3Ww2Tp/s6C3QZzxm8qjzYXvNOXWRum2pUd2/W
 zxS/t390RTPrts7KS1OLfrpMpK1Xa/fxTXlFDgosQtdv3Li98fSe6CzdmTxar1XltXWfJEs+
 VDnxPmwZQ9VXyad+3c9LFv8tZ+jYnrakUe7r6RuMn+/ESby6LpegcZvxz1bD6eFKLMUZiYZa
 zEXFiQAV/hk2TAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsVy+t/xe7qhU9/EGRzs5rPoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12iw+r37NaHPzwhNXi
 +5bJTA68HmvmrWH0uLN0J6PH3m8LWDy2f3vA6nG/+ziTx+Yl9R63/z1m9ph8Yzmjx+EPV1g8
 dt9sYPPo27KK0ePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
 m5TUnMyy1CJ9uwS9jL1d7UwFfXwV0y82MzYwvuXuYuTgkBAwkXh53byLkYtDSGApo8SHW9tY
 uhg5geIyEienNbBC2MISf651sYHYQgKfGCXOz2cGsdkEDCW63oLEuThEBDoZJaZ1f2QHcZgF
 /jFJnNi7nQmkSljAV+Lwmz2MINtYBFQl9m2VAQnzCthJfLl+gx1igbzE6g0HwIZyAsVftxxk
 hVhmK7F8wXvmCYx8CxgZVjGKpJYW56bnFhvpFSfmFpfmpesl5+duYgRGzLZjP7fsYOx6F3yI
 UYCDUYmH90XI6zgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BbppIrOU
 aHI+MJrzSuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwlmusllia
 NLd7y62CFuePloqXituO9YR6/ZO6rzIt21juU8GFFSfZL/efrg2oSN8tMuGiU8KrcJn2FkUb
 gQf9M9+3Opyq+8+745SblW2lyrO6l009Fz4tftktE/BzpZfBkvCZy1WUK39+MTYv/OEwZe/v
 sqo3E1I2blmcn6KqqxvGx3K/5mKvEktxRqKhFnNRcSIAGXz7bK4CAAA=
X-CMS-MailID: 20200619103709eucas1p12c32fa6377caf78e5dc28ce0ff51e7a0
X-Msg-Generator: CA
X-RootMTR: 20200619103709eucas1p12c32fa6377caf78e5dc28ce0ff51e7a0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103709eucas1p12c32fa6377caf78e5dc28ce0ff51e7a0
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103709eucas1p12c32fa6377caf78e5dc28ce0ff51e7a0@eucas1p1.samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

Fix the code to refer to proper nents or orig_nents entries. This driver
reports the number of the pages in the imported scatterlist, so it should
refer to sg_table->orig_nents entry.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index f0b85e094111..ba4bdc5590ea 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -215,7 +215,7 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(ret);
 
 	DRM_DEBUG("Imported buffer of size %zu with nents %u\n",
-		  size, sgt->nents);
+		  size, sgt->orig_nents);
 
 	return &xen_obj->base;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
