Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FC200686
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5277D6EC6B;
	Fri, 19 Jun 2020 10:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334596EC62
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103659euoutp01263264c8f624a00f00f01680f9edce4c~Z66D_Yk0s1761017610euoutp014
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:36:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200619103659euoutp01263264c8f624a00f00f01680f9edce4c~Z66D_Yk0s1761017610euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563019;
 bh=tj4USkT4mmzGAYtGQ+Hrc6tAZIJTZKbcemrdU4KaPkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NCaorwvtF1B061Y1FGVZpGUd2JhtOOQh13D8b5EE2sBQ+fpDq0eFWV2dTpramTbn9
 Tzdk7JoJtzBXyynGo65hnIfTVxR+IUkZ/EXRxXH5gUUMDf1XfW0th4POxmFGbnUXcB
 wCCcigUba3BAi9enF2K3Qv0aEU4PTGxogs+vK/BQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200619103659eucas1p29e2d23773b26ece4c38249039db1201a~Z66DqWCGb2889228892eucas1p2m;
 Fri, 19 Jun 2020 10:36:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 82.9D.05997.B459CEE5; Fri, 19
 Jun 2020 11:36:59 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103659eucas1p27ece9865ea4cdd82d4ca4df06edef7e6~Z66DR-74h3081530815eucas1p2W;
 Fri, 19 Jun 2020 10:36:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103659eusmtrp1d4642a1ea7423c2baf8305e7543fec7c~Z66DRSmTS0959609596eusmtrp13;
 Fri, 19 Jun 2020 10:36:59 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-da-5eec954b7c6a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 84.0B.06017.B459CEE5; Fri, 19
 Jun 2020 11:36:59 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103658eusmtip2a06a75f290a330ae46a368429b0a0578~Z66CiexGq0246802468eusmtip2f;
 Fri, 19 Jun 2020 10:36:58 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/36] drm: i915: fix common struct sg_table related issues
Date: Fri, 19 Jun 2020 12:36:09 +0200
Message-Id: <20200619103636.11974-10-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSbUhTYRjlvXd3uxsurzPwrSxjpZlQZoncMMrK6lIIBUIQZK28uMhN23WW
 FSSpEUtjqaFprpXJ1qZZc6yamW6YS0wTtaVYWW0/nB/04bKSmG1etX/nOc85zzm8vDgqsmPL
 8VPyHFohl2SKuQKOpePPmw0Hbk6kbXK+W02W9HQi5OPKRoyctdxAyYGfX7nkA+NLhKxWNyGk
 tjWR1PU3ArLlLkJ6Bz4jpMnlxMh+620u2dD+gUfavrkxsrXKyUsKpuo19YBqmdZyqNrnHoR6
 Mv0JozSdh6iRaw6Earp/iRr2uVCqbFAHqOahfC513WwA1JRp1cGgI4Jt6XTmqVxaEbv9uEBq
 NNRwsrXh5+4MrM0HjjAV4OOQiIfq8l+YCghwEaEH8L7PwGUHL4DlxvcgoBIRUwBW/ExdcHxp
 c/NYXgeguRhdNBRaXNzAgkvEQdWkag4vJYoAfFUSFBChRDsK+7TOuauhxEHYX+fGAphDRMIP
 3mdzV4XEdmhuGkHYtAhofNSGBjDfz48X2ua6QsLJg/XWGpQVJcM2i37eEArHHGYei8NhV1kx
 hzUUAPi5p4HHDsUA9l+uBKwqEb7vmfF3xf391sNGayxL74TaGi8aoCGxBA5OhgRo1A9LLRXz
 tBBevSJi1VGwyvFwMdbW2zdfjYKt09857AvdAPCHuxpVg4iq/2FaAAwgjFYysgya2Synz25k
 JDJGKc/YeDJLZgL+n9Xlc3ifAuvfE3ZA4EAcJBxNHU8TYZJcJk9mBxBHxUuFu7q70kTCdEne
 eVqRdUyhzKQZO1iBc8Rhwi33PEdFRIYkhz5N09m0YmGL4Pzl+SDGt+vNnphhbCJopd022Kr/
 qHHm7CiKtq5DQgW/9Y+SExL2tpeDF7s71hRIL7w0DederPaNeGR8/WDKp9cyOurvaLnGEz4T
 Fl1UW9cbeyZermx2Hy5N0Xil+1yZQqxj6K2tuyfx4QTOL5wdYYLHQuJvX3ZIk7bujzSm65bd
 Uos5jFQSF4MqGMk/uX37v1UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7reU9/EGRx/xWrRe+4kk8XGGetZ
 Lf5vm8hsceXrezaLlauPMlnMnrCZyWLBfmuL5ZfXM1rsXchk8eXKQyaLTY+vsVpc3jWHzWLt
 kbvsFgc/PGG12D/rGrsDv8eaeWsYPfZ+W8DisXjPSyaP7d8esHrMOxnocb/7OJPH5iX1Hrf/
 PWb2mHxjOaPH7psNbB59W1YxenzeJBfAE6VnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdo
 bB5rZWSqpG9nk5Kak1mWWqRvl6CXsXrVXJaCBTIV86+oNDAeF+9i5OSQEDCReHTgCXsXIxeH
 kMBSRol3m/6zQyRkJE5Oa2CFsIUl/lzrYoMo+sQosefDLLAEm4ChRNdbiISIQCejxLTuj2Dd
 zAJnmCV+b/AGsYUF/CQedmwGi7MIqErc/bITzOYVsJPYsvk+E8QGeYnVGw4wg9icQPHXLQfB
 FggJ2EosX/CeeQIj3wJGhlWMIqmlxbnpucVGesWJucWleel6yfm5mxiBMbTt2M8tOxi73gUf
 YhTgYFTi4X0R8jpOiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYTYGOmsgs
 JZqcD4zvvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjJJ9b1+v
 Mbj/ZFNYaF61h2ZHHtctt8Z3vy3rO765TrAXNFZf6Ns8cetR5VfLnRgeyhw8FsNr++Z4v5Xc
 k9c2d84ImKft5/3ftYttbonvRyFrzVsn/1V+iDl3f4n7s70ZG9+arvuaMuuA+/FLJ4x45Krv
 KhfaTDxp7Ra7TJ9tGYvAtjnPA9YKvVZiKc5INNRiLipOBABPJHtdtwIAAA==
X-CMS-MailID: 20200619103659eucas1p27ece9865ea4cdd82d4ca4df06edef7e6
X-Msg-Generator: CA
X-RootMTR: 20200619103659eucas1p27ece9865ea4cdd82d4ca4df06edef7e6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103659eucas1p27ece9865ea4cdd82d4ca4df06edef7e6
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103659eucas1p27ece9865ea4cdd82d4ca4df06edef7e6@eucas1p2.samsung.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Robin Murphy <robin.murphy@arm.com>,
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

This driver creatively uses sg_table->orig_nents to store the size of the
allocated scatterlist and ignores the number of the entries returned by
dma_map_sg function. The sg_table->orig_nents is (mis)used to properly
free the (over)allocated scatterlist.

This patch only introduces the common DMA-mapping wrappers operating
directly on the struct sg_table objects to the dmabuf related functions,
so the other drivers, which might share buffers with i915 could rely on
the properly set nents and orig_nents values.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 11 +++--------
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +++----
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 2679380159fc..8a988592715b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -48,12 +48,9 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 		src = sg_next(src);
 	}
 
-	if (!dma_map_sg_attrs(attachment->dev,
-			      st->sgl, st->nents, dir,
-			      DMA_ATTR_SKIP_CPU_SYNC)) {
-		ret = -ENOMEM;
+	ret = dma_map_sgtable(attachment->dev, st, dir, DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret)
 		goto err_free_sg;
-	}
 
 	return st;
 
@@ -73,9 +70,7 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
 
-	dma_unmap_sg_attrs(attachment->dev,
-			   sg->sgl, sg->nents, dir,
-			   DMA_ATTR_SKIP_CPU_SYNC);
+	dma_unmap_sgtable(attachment->dev, sg, dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sg);
 	kfree(sg);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
index debaf7b18ab5..be30b27e2926 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c
@@ -28,10 +28,9 @@ static struct sg_table *mock_map_dma_buf(struct dma_buf_attachment *attachment,
 		sg = sg_next(sg);
 	}
 
-	if (!dma_map_sg(attachment->dev, st->sgl, st->nents, dir)) {
-		err = -ENOMEM;
+	err = dma_map_sgtable(attachment->dev, st, dir, 0);
+	if (err)
 		goto err_st;
-	}
 
 	return st;
 
@@ -46,7 +45,7 @@ static void mock_unmap_dma_buf(struct dma_buf_attachment *attachment,
 			       struct sg_table *st,
 			       enum dma_data_direction dir)
 {
-	dma_unmap_sg(attachment->dev, st->sgl, st->nents, dir);
+	dma_unmap_sgtable(attachment->dev, st, dir, 0);
 	sg_free_table(st);
 	kfree(st);
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
