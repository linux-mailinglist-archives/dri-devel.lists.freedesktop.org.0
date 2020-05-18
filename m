Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C91D7071
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 07:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC9B89F6F;
	Mon, 18 May 2020 05:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103B589C48
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 05:43:17 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec220270000>; Sun, 17 May 2020 22:42:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 17 May 2020 22:43:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 17 May 2020 22:43:17 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 May
 2020 05:43:17 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 18 May 2020 05:43:16 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.175]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec220740002>; Sun, 17 May 2020 22:43:16 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/etnaviv: convert get_user_pages() --> pin_user_pages()
Date: Sun, 17 May 2020 22:43:15 -0700
Message-ID: <20200518054315.2407093-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589780520; bh=Nw/n11knSNrp8BRVAAf0yZA96pwzBUISJeQpKg/G4dc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=Y8OzVbBUzW9w/9M2Wg03/k4DFOeTeW4XJIAYKYx24E2BSAh2InaXI3chth31KBebn
 lUcWz5ZaKYceDrBL1IHvIVaOHxmoBsTn3TEs95oCFOUX9A52yqKzaDww8i029K+b6P
 Y3FidGcZZpH+C/U79Fownhl7VNNTogejGlc6MgA+i5ajT9RVCnRZ6EfS8op0fmH9sP
 QIJofhVM9SmAicaoEj7NSfzcb+qYfRLgnm4pCjBy0AbbxSn/MiiwO4VT/jlWmDD99o
 u4Qf/CI+JzYMdIlhzasehts4HJ3mE1n1X0LU6rlaKtP06hRnCXhHFfDCh88xa5XJff
 GVW/CDgkRIg3Q==
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
Cc: David Airlie <airlied@linux.ie>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code was using get_user_pages*(), in a "Case 2" scenario
(DMA/RDMA), using the categorization from [1]. That means that it's
time to convert the get_user_pages*() + put_page() calls to
pin_user_pages*() + unpin_user_pages() calls.

There is some helpful background in [2]: basically, this is a small
part of fixing a long-standing disconnect between pinning pages, and
file systems' use of those pages.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
    https://lwn.net/Articles/807108/

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

Hi,

Note that I have only compile-tested this patch, although that does
also include cross-compiling for a few other arches.

thanks,
John Hubbard
NVIDIA

 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index dc9ef302f517..0f4578dc169d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -675,10 +675,10 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 		uint64_t ptr = userptr->ptr + pinned * PAGE_SIZE;
 		struct page **pages = pvec + pinned;
 
-		ret = get_user_pages_fast(ptr, num_pages,
+		ret = pin_user_pages_fast(ptr, num_pages,
 					  !userptr->ro ? FOLL_WRITE : 0, pages);
 		if (ret < 0) {
-			release_pages(pvec, pinned);
+			unpin_user_pages(pvec, pinned);
 			kvfree(pvec);
 			return ret;
 		}
@@ -702,7 +702,7 @@ static void etnaviv_gem_userptr_release(struct etnaviv_gem_object *etnaviv_obj)
 	if (etnaviv_obj->pages) {
 		int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
 
-		release_pages(etnaviv_obj->pages, npages);
+		unpin_user_pages(etnaviv_obj->pages, npages);
 		kvfree(etnaviv_obj->pages);
 	}
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
