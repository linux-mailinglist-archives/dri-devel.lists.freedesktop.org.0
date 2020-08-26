Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC4425272E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 08:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE8E6EA16;
	Wed, 26 Aug 2020 06:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D276EA03
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200826063541euoutp018f0c00eb80809ebcc88ef7eeb929d102~uveyoI1RD2035120351euoutp01L
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 06:35:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200826063541euoutp018f0c00eb80809ebcc88ef7eeb929d102~uveyoI1RD2035120351euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598423741;
 bh=M6LUpUR0yeAQpj3I0Hzt+0kX5PVbzJKyJpNcEwtoCPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IdY2twB6wuYfDlMptUp2KJ7OZNg2ew8kv8Lpp+bsE74SEp4HRl+CrgPzzHQ0Aqd1x
 aB3WJ0elgVTLaRHGF+7DRWQAPbP6C06Es/B9iwMtB9Hpk4OTSIeXKg/JkeibGk+0UL
 +JzrQDKwXplco+CM2GlANOOvkBzYyzvpqBr5kim0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200826063541eucas1p25d190a48f46f33e47788594980fc2ad1~uveyUv41l0402704027eucas1p2s;
 Wed, 26 Aug 2020 06:35:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8A.33.06456.DB2064F5; Wed, 26
 Aug 2020 07:35:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063540eucas1p2dc6829c66ae13b8e787ca40b9aede3df~uvexv_2_J0401804018eucas1p2k;
 Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200826063540eusmtrp262a1eb3c5d27915d22297ddfc0094071~uvexvaUnQ0466204662eusmtrp2Z;
 Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-d9-5f4602bd17a0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.53.06017.CB2064F5; Wed, 26
 Aug 2020 07:35:40 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200826063540eusmtip21783f52e3b3c400cdc13258da026b04c~uvexKjbwI0092600926eusmtip2C;
 Wed, 26 Aug 2020 06:35:40 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 22/32] drm: xen: fix common struct sg_table related issues
Date: Wed, 26 Aug 2020 08:33:06 +0200
Message-Id: <20200826063316.23486-23-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826063316.23486-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0hTYRjG+87Zzs6mk9O0/NJKGBRYpJkGJy3L0DhdSIv+KstWHlTUKZta
 Sug0spyXMqFMJFdzzWumybykqMs2Q1qllppaDaWwWPOeWsw2j9p/v/d5n4fn5ePDUUEL2wWP
 EifQErEoRojxWBrdgmFXK3IkbLey2JXMNbxGyNrCGja5pMlHyb5ZM0aWV75CSEWbHznTZ0TI
 utGPbLK3uRgjqztHOOREpZlNdkyMscnf9QXIIT5V9bAKUMOqJkC1zilYVMPcVzb1JVuPUM9L
 06ghyyhKFQyoAfVyoo9FvRiUYVRefQWgpuu2htif5e0Pp2OikmiJp/9FXmRJhQ7E5zlcvWkZ
 BjJgspMDLg4JHzjSOcuRAx4uIMoAlJXNo8wwA+BkmQyzuQTENICDHdGriU+D71cSagBHyxux
 tYRyMpdlc2GEF5Sb5MtpJ+IGgF259jYTSswj0PCki2NbOBLBcEr5HbExi9gGH3wuRm3MJ/xh
 YVkOytS5wcpn7cvMter67NvLbZAwcKBpsZ3FmALhz5YPGMOO8Ie+nsPwZrjUVIIwgesAGg3V
 HGbIAbA3oxAwLj84bFi0pnHrfe6wptmTkQOgLn0WscmQcIADpvU2GbXiXc19lJH58FamgHFv
 h0X6p2u1He96Vu6nYPtQD8K8UD6Af01yzh3gVvS/TAFABXCmE6WxEbTUS0xf8ZCKYqWJ4giP
 y3GxdcD6p7ot+qlGMNtzSQsIHAjt+QosKEzAFiVJk2O1AOKo0Il/+E33BQE/XJScQkviwiSJ
 MbRUC1xxltCZ7/14/LyAiBAl0NE0HU9LVrcIznWRAd+lXktAYOYYNPq65pyW7BQdD4mzH7GL
 UpxSVbVp693PZPk1Oy9eC0pS9d8TJ+wNOTpzLKh7o3nfQo13eVGoTibO7Nc1bMIHNdq3v0LP
 qTeoqegT1anqPbrwdam82pQ/B4JVLhk6bVZu1kFHk1Na6fg4p/vkjE+w0fyNuyX9kVLIkkaK
 vHagEqnoH0NqTbxPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xe7p7mNziDW7uNLXoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12iw+r37NaHPzwhNXi
 +5bJTA68HmvmrWH0uLN0J6PH3m8LWDy2f3vA6nG/+ziTx+Yl9R63/z1m9ph8Yzmjx+EPV1g8
 dt9sYPPo27KK0ePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
 m5TUnMyy1CJ9uwS9jPmrjjEW9PFVtP+7w9jA+Ja7i5GTQ0LAROLWzYvsXYxcHEICSxklTvzv
 YoFIyEicnNbACmELS/y51sUGUfSJUeLiqyuMIAk2AUOJrrcQCRGBTkaJad0fwUYxC/xjkjix
 dzsTSJWwgK/EnA1dYKNYBFQlZt6bwwxi8wrYScxY0cMMsUJeYvWGA2A2J1D8eHc/G4gtJGAr
 cXrtDOYJjHwLGBlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBMbNtmM/t+xg7HoXfIhRgINR
 iYd3AZtrvBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoCHTWRWUo0OR8Y
 03kl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgvaFs3chqfYVUQ
 vnHysfJ3To0GrZeHO5nWPZ9ZzJ87R+izkMiZ+y5/ko53pQQflFp5/+qfCtZZ2izmS59MnXkg
 mKmv9UTfZf3cmaEr9i+UEilgmMdzecYSN70TayRNuFrnlHnkqPF+rMo5xJO36IX0SQ7XtxsM
 tV8mCveoHZq32/tXzGuewFQlluKMREMt5qLiRACCkIX+sQIAAA==
X-CMS-MailID: 20200826063540eucas1p2dc6829c66ae13b8e787ca40b9aede3df
X-Msg-Generator: CA
X-RootMTR: 20200826063540eucas1p2dc6829c66ae13b8e787ca40b9aede3df
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826063540eucas1p2dc6829c66ae13b8e787ca40b9aede3df
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063540eucas1p2dc6829c66ae13b8e787ca40b9aede3df@eucas1p2.samsung.com>
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
index 39ff95b75357..0e57c80058b2 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -216,7 +216,7 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
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
