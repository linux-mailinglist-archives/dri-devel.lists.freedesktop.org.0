Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED7B392E97
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 14:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3F6EEB6;
	Thu, 27 May 2021 12:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB836EEB7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 12:59:39 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso2352203pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2YnMeaa21fO8GV3DprpFoE7sFhCpYEOshpAHonnB4Q=;
 b=CWN//86M7pfZwpqjk6Pz1G7HqyEoQV2evBjGZ2yUSjg4QlRX/avwG27ptvNDpwyHCw
 +v7KXNRKRgPheqlBZeQIo496WAVDVK7ga9R6f5STmR5c/U2eiCxGBrlIMJe+YfycLoea
 t6vNAhsA0F2FaNz1gwrhV3oLti0cIUc2nP7Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2YnMeaa21fO8GV3DprpFoE7sFhCpYEOshpAHonnB4Q=;
 b=OJPqBCjYJucgyiYk7dI5bZNMCINc658jy2e/mkHl1AF4FqD04gTBidP2SeGoJNjfZ8
 mkaXUj0G438vRN9ZD196ebP1OhpoTMIa1TGXumb+a5Pk5w5VhMUsTgyVpOU5mrp3fjzs
 331O/nkreH8OGUKrxEW3Ii4GXgvazXCpBtnfaIBG2RxHqA+InmwiEdTrdQJBmNUFTyIL
 tAa+Fuv2Xr+g1H+jnBDPeQEOOg5gOsrCHzn1aRYDhKP3DNtybu1mptCbL7dRV2KZmDYm
 8I1075sWk5QdS35VtzGqsaFygDLCBvEfkWoRJ8UHZO8U+umpFUFPX7JXxshj0Q7KoGu0
 TRZw==
X-Gm-Message-State: AOAM533vwsA90YDcdlRLMDemJHCrahXUYMTQ7PtCyIeZszdjtYlCaOK0
 mUGc5yhVWoM+5ftaDoLaRHypzA==
X-Google-Smtp-Source: ABdhPJy5Kn+yvqLcXzfzyvGlttPOTv6zxSUWOgHVrqd8CjcCzdgLfUd5wPMKRSdGsOL4+oXiuJ5KrA==
X-Received: by 2002:a17:90a:46cc:: with SMTP id
 x12mr9547674pjg.52.1622120379071; 
 Thu, 27 May 2021 05:59:39 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id o2sm1885997pfu.80.2021.05.27.05.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 05:59:38 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v8 05/15] swiotlb: Add a new get_io_tlb_mem getter
Date: Thu, 27 May 2021 20:58:35 +0800
Message-Id: <20210527125845.1852284-6-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527125845.1852284-1-tientzu@chromium.org>
References: <20210527125845.1852284-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new getter, get_io_tlb_mem, to help select the io_tlb_mem struct.
The restricted DMA pool is preferred if available.

The reason it was done this way instead of assigning the active pool to
dev->dma_io_tlb_mem was because directly using dev->dma_io_tlb_mem might
cause memory allocation issues for existing devices. The pool can't
support atomic coherent allocation so swiotlb_alloc needs to distinguish
it from the default swiotlb pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 03ad6e3b4056..b469f04cca26 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_SWIOTLB_H
 #define __LINUX_SWIOTLB_H
 
+#include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -102,6 +103,16 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem *io_tlb_default_mem;
 
+static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
+{
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev && dev->dma_io_tlb_mem)
+		return dev->dma_io_tlb_mem;
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+
+	return io_tlb_default_mem;
+}
+
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = io_tlb_default_mem;
-- 
2.31.1.818.g46aad6cb9e-goog

