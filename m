Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03BC3A91DE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 08:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01AF6E4EC;
	Wed, 16 Jun 2021 06:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC7B6E4EC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 06:22:26 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso3083171pjx.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 23:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6ZYMbmpZtiKwFDcQ7JFrtewUpbfgXD5Ls9ZoD2Zrzg=;
 b=PJvHRcLLv4fhlWeXvSfKMQcWBxKOg+Fvvldtj3Y2Rwy0NG+fV8esg1TcKHxfLuji8x
 fALYR4BBGda9gTcNxGVF5jiXo1hdqXLQ9/EojERkZznhsp+lq9qt4VGs9UqStorOUfPe
 QcYH5iC4/YfxuhCJrGU8L8Q0LpoEXtWiU0umg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6ZYMbmpZtiKwFDcQ7JFrtewUpbfgXD5Ls9ZoD2Zrzg=;
 b=RGsxKLKfnpkpiWRHd/AQEJOLeSMjkaYTlEVTHz96n7zM1NTsAbIv4gQ1IpbbkXeawa
 ndvTzK9z8Xy4XdYm8NAHLlKT5hagIJuZ8urXC5QOOsMMohBA+rZZyL9jde5GNxxw7hOF
 5P91JCLtmV/uWnmY8ZmyYEGsFOvN31zMpEqTNcQC3VA18MPZlBz+uMWaI4GfowRvJwFH
 6HT4SePdQNIgdN1kunxLzPjBQ/6ThLNKVy2f8Df/e7PK+PiR1yrjHH9fN2/YTE3mp2on
 BSOYmmnsA7Nir9ER8uwPKKP01H5a13TfjrBCB5yAjJrBakHX8CVcnn/0+s2537X9Etes
 GL3w==
X-Gm-Message-State: AOAM530YSJvunKAFI99Zr8wjxbsRFkfSI7hRUjGas935bYMAsvhCkFkx
 liCsUNkMTCYCuFPnJMlMMHeP/w==
X-Google-Smtp-Source: ABdhPJyVyel5b3yfzmvkqrYXS5Eq1yNF15/6agY067MF9HfP0+RZa2tjHWPks9M0csBX136+z0kj6g==
X-Received: by 2002:a17:902:860b:b029:103:b23b:f1c3 with SMTP id
 f11-20020a170902860bb0290103b23bf1c3mr7842702plo.34.1623824546376; 
 Tue, 15 Jun 2021 23:22:26 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id 21sm1024194pfy.92.2021.06.15.23.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:22:26 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v12 02/12] swiotlb: Refactor swiotlb_create_debugfs
Date: Wed, 16 Jun 2021 14:21:47 +0800
Message-Id: <20210616062157.953777-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210616062157.953777-1-tientzu@chromium.org>
References: <20210616062157.953777-1-tientzu@chromium.org>
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

Split the debugfs creation to make the code reusable for supporting
different bounce buffer pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 3ba0f08a39a1..af416bcd1914 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -670,19 +670,26 @@ bool is_swiotlb_active(void)
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
+static struct dentry *debugfs_dir;
 
-static int __init swiotlb_create_debugfs(void)
+static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
-
-	if (!mem)
-		return 0;
-	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
+}
+
+static int __init swiotlb_create_default_debugfs(void)
+{
+	struct io_tlb_mem *mem = io_tlb_default_mem;
+
+	debugfs_dir = debugfs_create_dir("swiotlb", NULL);
+	if (mem) {
+		mem->debugfs = debugfs_dir;
+		swiotlb_create_debugfs_files(mem);
+	}
 	return 0;
 }
 
-late_initcall(swiotlb_create_debugfs);
+late_initcall(swiotlb_create_default_debugfs);
 
 #endif
-- 
2.32.0.272.g935e593368-goog

