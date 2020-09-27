Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44254279F05
	for <lists+dri-devel@lfdr.de>; Sun, 27 Sep 2020 08:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9286E23D;
	Sun, 27 Sep 2020 06:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D1C6E239;
 Sun, 27 Sep 2020 06:47:00 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B2A023A04;
 Sun, 27 Sep 2020 06:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601189220;
 bh=X0Gx2aQ5HAIcUm/V+07epd86vOJhBgOcCwwTjg4zaDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K4Ior6ILrlGRKpyGEEUKlL1f/2LiM3+lhS3EnTrH1srs0Abz9bV5NZgx68aaIGJTP
 djnmHurCY9sNUaX/vb5TRzCIACdJhdfMiAkgNam+RJP4hqdPDry4Q0xkmFPrBz1kEk
 3cEphCTgiiI2weVFh7SvR4Bt8eGnpGLoSZmI5DxE=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH rdma-next v4 2/4] tools/testing/scatterlist: Rejuvenate
 bit-rotten test
Date: Sun, 27 Sep 2020 09:46:45 +0300
Message-Id: <20200927064647.3106737-3-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200927064647.3106737-1-leon@kernel.org>
References: <20200927064647.3106737-1-leon@kernel.org>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A couple small tweaks are needed to make the test build and run
on current kernels.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Maor Gottlieb <maorg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 tools/testing/scatterlist/Makefile   |  3 ++-
 tools/testing/scatterlist/linux/mm.h | 35 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/tools/testing/scatterlist/Makefile b/tools/testing/scatterlist/Makefile
index cbb003d9305e..c65233876622 100644
--- a/tools/testing/scatterlist/Makefile
+++ b/tools/testing/scatterlist/Makefile
@@ -14,7 +14,7 @@ targets: include $(TARGETS)
 main: $(OFILES)

 clean:
-	$(RM) $(TARGETS) $(OFILES) scatterlist.c linux/scatterlist.h linux/highmem.h linux/kmemleak.h asm/io.h
+	$(RM) $(TARGETS) $(OFILES) scatterlist.c linux/scatterlist.h linux/highmem.h linux/kmemleak.h linux/slab.h asm/io.h
 	@rmdir asm

 scatterlist.c: ../../../lib/scatterlist.c
@@ -28,4 +28,5 @@ include: ../../../include/linux/scatterlist.h
 	@touch asm/io.h
 	@touch linux/highmem.h
 	@touch linux/kmemleak.h
+	@touch linux/slab.h
 	@cp $< linux/scatterlist.h
diff --git a/tools/testing/scatterlist/linux/mm.h b/tools/testing/scatterlist/linux/mm.h
index 6f9ac14aa800..6ae907f375d2 100644
--- a/tools/testing/scatterlist/linux/mm.h
+++ b/tools/testing/scatterlist/linux/mm.h
@@ -114,6 +114,12 @@ static inline void *kmalloc(unsigned int size, unsigned int flags)
 	return malloc(size);
 }

+static inline void *
+kmalloc_array(unsigned int n, unsigned int size, unsigned int flags)
+{
+	return malloc(n * size);
+}
+
 #define kfree(x) free(x)

 #define kmemleak_alloc(a, b, c, d)
@@ -122,4 +128,33 @@ static inline void *kmalloc(unsigned int size, unsigned int flags)
 #define PageSlab(p) (0)
 #define flush_kernel_dcache_page(p)

+#define MAX_ERRNO	4095
+
+#define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
+
+static inline void * __must_check ERR_PTR(long error)
+{
+	return (void *) error;
+}
+
+static inline long __must_check PTR_ERR(__force const void *ptr)
+{
+	return (long) ptr;
+}
+
+static inline bool __must_check IS_ERR(__force const void *ptr)
+{
+	return IS_ERR_VALUE((unsigned long)ptr);
+}
+
+static inline int __must_check PTR_ERR_OR_ZERO(__force const void *ptr)
+{
+	if (IS_ERR(ptr))
+		return PTR_ERR(ptr);
+	else
+		return 0;
+}
+
+#define IS_ENABLED(x) (0)
+
 #endif
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
