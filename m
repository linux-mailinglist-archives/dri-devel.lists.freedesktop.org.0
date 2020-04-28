Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8761BBEFA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 15:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753FC6E3F0;
	Tue, 28 Apr 2020 13:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E16F6E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:26 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200428132025euoutp0169b0926e96f99fa3d124bfb852979162~J-l55Ebun2027120271euoutp01C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 13:20:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200428132025euoutp0169b0926e96f99fa3d124bfb852979162~J-l55Ebun2027120271euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588080025;
 bh=OxDEFS2C+4zsa/daLx0+CIujQUwnMAMxcbNcxMj9NlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pl8TzdjqhvB4N3GlCSSCgc7o3Y0K6uySFsoYwOZnhhrZTFV9YSXuon1opTiVi/nJG
 9Px5z8YXExt1GOxeOgz75eTVGVPGW9FK1S3knsNM7YXGHW72tXaWIrJbhk0KJpKcxu
 lvIUVesZKc6ybBcZYUnAgsZIa2n4vYb0ENC3U6ZI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200428132024eucas1p295fc97f6c6a1e8570f6d628c430b4ca7~J-l5ix-GY2650626506eucas1p2G;
 Tue, 28 Apr 2020 13:20:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 84.B4.61286.89D28AE5; Tue, 28
 Apr 2020 14:20:24 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200428132024eucas1p1c51178774db6fb4cab748522c86646cd~J-l5Kj5qR1367713677eucas1p1O;
 Tue, 28 Apr 2020 13:20:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200428132024eusmtrp2f07a13212ee3633f0b648d4aad903b4c~J-l5IkYSz2140321403eusmtrp2F;
 Tue, 28 Apr 2020 13:20:24 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-6b-5ea82d98aab6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 99.96.08375.89D28AE5; Tue, 28
 Apr 2020 14:20:24 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132023eusmtip290db16384e4e88da08574c1d4a03ba7e~J-l4i21JQ1062310623eusmtip2k;
 Tue, 28 Apr 2020 13:20:23 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [RFC 04/17] drm: etnaviv: fix sg_table nents vs. orig_nents misuse
Date: Tue, 28 Apr 2020 15:19:52 +0200
Message-Id: <20200428132005.21424-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428132005.21424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSWUwTURiFc2famSm2MhYjFzUa6xKRABJ9mAgYjAtjfJAnH4iio0wAaZF0
 AAsPAlWMVjAoJhJFaEAse7Egq4IgWhZtsaCCgMhmglpFKItgwJZxefvu+c+558/NJVBpg3At
 EREVwyqjGLkMcxJUvfhp9sz0LAjZufiaotJMbQiVr0/GqYeZeiGlbm7HqKWqGyjVPf0dowqL
 nyPU3fQKhNI2+lK27iGEMoy8FVJddVkYVdoygFNNE6NCqn1gCg9wpkuySwD9ZEYroPvfPsbo
 6pmPQnrwmhGhK+4n0n2LIyid0aMDdH1vEkZfrywC9JRhQ9CKYCe/UFYeEccqvfeecgo3ZMZG
 p7moki3fhEkgldQAEQHJ3dA68wHXACdCShYAWNE5hTgGUtIG4KccjucpAPtbxH8D2W/mcV7X
 AdijPcuH7f4vvfMCxwAjfaDGqsEcvJpMAbA1TewwoWQVCkd1LctpF/IITK39JXSwgNwKW5Pf
 LOsS0h+aaxZQvm0jLC5/uswici/MHx7DHBdB0oLDkbxxwJsOwLlf7zCeXeBnYyXO83q4VJuD
 8IGLAA6ZSnH+kApglzrzT9oX9pvm7WnCvp871Nd58/I+eK91DnHIkFwJe6yrHDJqx5tVt1Fe
 lsArl6W8exu8Yyz7V9vUafmzPw1z1TaEf6EbANr0OjwdbLzzv0wLQBFwZWM5RRjL+USx5704
 RsHFRoV5nTmnMAD7r+pYNE7WgGnL6WZAEkAmlpSLC0KkQiaOi1c0A0igstWS4fAHIVJJKBOf
 wCrPnVTGylmuGawjBDJXya7c8RNSMoyJYSNZNppV/p0ihGhtEjh6aSxShB52uzUZ2TgX+WxT
 4mskveRWkG/n+ACyZs9siluun8ecTV7/KuvrMYHW2KDbb9JXz+ZdFRdiEYOKLXll7KPJ50vD
 bv15Hj8CrCLDiL9qc8T2toWJ986B1aWzLxMYzSF3dUaG14XgQGfzwY7QMpNCzfirzCs7+uJU
 5uMyARfO+OxAlRzzGzh75GBRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7ozdFfEGexplrPoPXeSyWLp+kZ2
 i40z1rNaNB06xWbxf9tEZosrX9+zWaxcfZTJYvaEzUwWC/ZbW3y58pDJYtPja6wWl3fNYbNY
 e+Quu8XBD09YLU7d/czuwO+xZt4aRo+93xaweNy5tofNY/u3B6we97uPM3lsXlLvcfvfY2aP
 yTeWM3rsvtnA5tG3ZRWjx+dNcgHcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFW
 RqZK+nY2Kak5mWWpRfp2CXoZm2aUFvQKVzReesfawNgj0MXIySEhYCIx7+ov9i5GLg4hgaWM
 EjO+bWGGSMhInJzWwAphC0v8udbFBlH0iVHi2tN37CAJNgFDia63EAkRgU5GiWndH8FGMQsc
 YJboPn+SCaRKWMBbomfnH7BRLAKqEicar4J18wrYSpzf8RtqnbzE6g0HwGxOATuJpY+eAk3l
 AFpnK3G5JXcCI98CRoZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgdGz7djPzTsYL20MPsQo
 wMGoxMO7gWdFnBBrYllxZe4hRgkOZiUR3kcZy+KEeFMSK6tSi/Lji0pzUosPMZoC3TSRWUo0
 OR8Y2Xkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhirZNyWPZyk
 uGX+rFKuDdFP/3oJRnsK9f9iD9q+6f/PCRPbH/3QK3ye6/dSerOlt6HCG9mu67JV2UtWleVp
 HJzPsPuaYd2lWW3if9Or5++au0FNMXvzRqGdet6yRVOmlc39J3YgMcarUeZR8BUvzteu1yfk
 z5rJdy4u+nOZvP97xg8z8w7NWXhFiaU4I9FQi7moOBEAQ0EbbbQCAAA=
X-CMS-MailID: 20200428132024eucas1p1c51178774db6fb4cab748522c86646cd
X-Msg-Generator: CA
X-RootMTR: 20200428132024eucas1p1c51178774db6fb4cab748522c86646cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428132024eucas1p1c51178774db6fb4cab748522c86646cd
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132024eucas1p1c51178774db6fb4cab748522c86646cd@eucas1p1.samsung.com>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index dc9ef30..a224a97 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -27,7 +27,8 @@ static void etnaviv_gem_scatter_map(struct etnaviv_gem_object *etnaviv_obj)
 	 * because display controller, GPU, etc. are not coherent.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_map_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		sgt->nents = dma_map_sg(dev->dev, sgt->sgl, sgt->orig_nents,
+					DMA_BIDIRECTIONAL);
 }
 
 static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj)
@@ -51,7 +52,8 @@ static void etnaviv_gem_scatterlist_unmap(struct etnaviv_gem_object *etnaviv_obj
 	 * discard those writes.
 	 */
 	if (etnaviv_obj->flags & ETNA_BO_CACHE_MASK)
-		dma_unmap_sg(dev->dev, sgt->sgl, sgt->nents, DMA_BIDIRECTIONAL);
+		dma_unmap_sg(dev->dev, sgt->sgl, sgt->orig_nents,
+			     DMA_BIDIRECTIONAL);
 }
 
 /* called with etnaviv_obj->lock held */
@@ -405,7 +407,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 
 	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
 		dma_sync_sg_for_cpu(dev->dev, etnaviv_obj->sgt->sgl,
-				    etnaviv_obj->sgt->nents,
+				    etnaviv_obj->sgt->orig_nents,
 				    etnaviv_op_to_dma_dir(op));
 		etnaviv_obj->last_cpu_prep_op = op;
 	}
@@ -422,7 +424,7 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
 		/* fini without a prep is almost certainly a userspace error */
 		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
 		dma_sync_sg_for_device(dev->dev, etnaviv_obj->sgt->sgl,
-			etnaviv_obj->sgt->nents,
+			etnaviv_obj->sgt->orig_nents,
 			etnaviv_op_to_dma_dir(etnaviv_obj->last_cpu_prep_op));
 		etnaviv_obj->last_cpu_prep_op = 0;
 	}
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
