Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45841C0EEE
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8546EC06;
	Fri,  1 May 2020 07:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068576EC06
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 07:40:07 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id e6so2071143pjt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 00:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pbJ0rXWHkCLJRyK9vXiUuFPqdQtHbtzqJkW11UYQ0Gg=;
 b=vb0wY5RB7Avh9W40PInSuMIMfqVVX8c5gNx4ovRY8kJyxvZpFLdww15R4N6GP0BdJO
 kgrgqAzooQ68Q9h97J83Z4uygdncUlx9LUQNXlDR83RSSuYlXcMHM61ShwEckSNa/w7j
 zGeH7KfIJLwO4jcDE+hc8uyeYhlVyv3TJoSE5JPRSbPgtGRPc13KO8L6QoWmL398HqVa
 3w+KMqQFA5upozNshMJzy7mU+yY6mts1x0PnRbUfUkevtqmFalyAtIiDrHPV6U79ju0B
 RGvaj1qzRpkf+1dHg8hx94nkYH28ELKWwg+2aR17hsgwFDSTrgW0H37OI6J/sl2XNoQk
 7nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pbJ0rXWHkCLJRyK9vXiUuFPqdQtHbtzqJkW11UYQ0Gg=;
 b=E8tMXk5NZVuu6H+PpWUgeKlSnMN/uUfdcC6EwgNWR1x6pT4EaE30veEDcGG04nx0wN
 wGgCY7NJh7WNW4+lurQ0H0HDqgbVYE2h4+VMMv1AS5ouQ9fxk4aDtUiyJCHoJ/9pkh27
 W7xD2iCXdSvNXBVu07yKRg0mBKon6GHIgBMjh1h1BtBVxuAvWjDBK/CqNWBS3oliCDnm
 EmvQnVdZ89dyEJkv3LwmvtvdtwqNOSN3bcrdvQYRiG/dbLehSyB/AwYF3Hz9qp2D/eGk
 QmESymVx8cRLl9f33XDb9Z22soCnWMkE27v1nB+v9vZHZ5KIpbqyKfve6K/eYvQhB9ea
 Vg4A==
X-Gm-Message-State: AGi0PuYkbls1HTyeu9J/Jb3EonsvIhdYMV46kyc6FwBauxEs1xTyATzy
 z1bSs3xXSWPK4krHJuNRNR36ow==
X-Google-Smtp-Source: APiQypJrHuK513hl/mWNZ3CMK5SALK94WvqJyZlw7ryX0HGGvoYccP4SvWf/0xIaXWcS+grMnsx+6Q==
X-Received: by 2002:a17:902:6b01:: with SMTP id
 o1mr3395641plk.64.1588318806626; 
 Fri, 01 May 2020 00:40:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 w12sm1557841pfq.133.2020.05.01.00.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 00:40:06 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 2/4] mm: cma: Add dma_heap flag to cma structure
Date: Fri,  1 May 2020 07:39:47 +0000
Message-Id: <20200501073949.120396-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501073949.120396-1-john.stultz@linaro.org>
References: <20200501073949.120396-1-john.stultz@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sandeep Patil <sspatil@google.com>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm@kvack.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a dma_heap flag on the cma structure,
along with accessors to set and read the flag.

This is then used to process and store the "linux,cma-heap"
property documented in the previous patch.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Chenbo Feng <fengc@google.com>
Cc: Alistair Strachan <astrachan@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mm@kvack.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 include/linux/cma.h     |  3 +++
 kernel/dma/contiguous.c |  3 +++
 mm/cma.c                | 11 +++++++++++
 mm/cma.h                |  1 +
 4 files changed, 18 insertions(+)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 6ff79fefd01f..d8b8e6ce221c 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -25,6 +25,9 @@ extern phys_addr_t cma_get_base(const struct cma *cma);
 extern unsigned long cma_get_size(const struct cma *cma);
 extern const char *cma_get_name(const struct cma *cma);
 
+extern void __init cma_enable_dma_heap(struct cma *cma, bool enabled);
+extern bool cma_dma_heap_enabled(struct cma *cma);
+
 extern int __init cma_declare_contiguous_nid(phys_addr_t base,
 			phys_addr_t size, phys_addr_t limit,
 			phys_addr_t alignment, unsigned int order_per_bit,
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8bc6f2d670f9..f667fd51daa2 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -303,6 +303,7 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	phys_addr_t mask = align - 1;
 	unsigned long node = rmem->fdt_node;
 	bool default_cma = of_get_flat_dt_prop(node, "linux,cma-default", NULL);
+	bool heap_exported = of_get_flat_dt_prop(node, "linux,cma-heap", NULL);
 	struct cma *cma;
 	int err;
 
@@ -332,6 +333,8 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	if (default_cma)
 		dma_contiguous_set_default(cma);
 
+	cma_enable_dma_heap(cma, heap_exported);
+
 	rmem->ops = &rmem_cma_ops;
 	rmem->priv = cma;
 
diff --git a/mm/cma.c b/mm/cma.c
index 0463ad2ce06b..ec671bd8f66e 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -55,6 +55,16 @@ const char *cma_get_name(const struct cma *cma)
 	return cma->name ? cma->name : "(undefined)";
 }
 
+void __init cma_enable_dma_heap(struct cma *cma, bool enabled)
+{
+	cma->dma_heap = enabled;
+}
+
+bool cma_dma_heap_enabled(struct cma *cma)
+{
+	return !!cma->dma_heap;
+}
+
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
@@ -157,6 +167,7 @@ static int __init cma_init_reserved_areas(void)
 }
 core_initcall(cma_init_reserved_areas);
 
+
 /**
  * cma_init_reserved_mem() - create custom contiguous area from reserved memory
  * @base: Base address of the reserved area
diff --git a/mm/cma.h b/mm/cma.h
index 33c0b517733c..6fe2242c724f 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -13,6 +13,7 @@ struct cma {
 	spinlock_t mem_head_lock;
 #endif
 	const char *name;
+	bool dma_heap;
 };
 
 extern struct cma cma_areas[MAX_CMA_AREAS];
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
