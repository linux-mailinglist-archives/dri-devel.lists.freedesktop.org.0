Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B67937805E
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 11:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A6D6E888;
	Mon, 10 May 2021 09:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BDA6E888
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:52:49 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id q15so8664718pgg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N9YtEc1AKRWzrvXmeOPdeOSLAm21S21YZtTJBnrwUb8=;
 b=K1N6EXk85Wvc+hEOva4wXm/pG0LlShcwRNR1nzYaMJRORgqDZTx8d0OHgKA7EZWdW9
 DKVvH5XQc7hrxaIcoiPBWcXqLtVTb0ShzjIeG4+8nxjarb1dd1TCqieDYri51cXF3WJ3
 rTKZnoW2Yosw5eCi0THzxANV5pwO1EvAdcAaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9YtEc1AKRWzrvXmeOPdeOSLAm21S21YZtTJBnrwUb8=;
 b=a28EkrMr/8+ipfl6Jz1LayjQswecwtYCobirBUaCvJ5KRN3wMp2ZJpHxBNaW5eMIPN
 c/R3VY0h7MzOfEFFEnAzhKIbJxkt/8zv6E3nlcTZMSDsww/HbYaWvYNWaRLgR7IQkMZd
 IDAde901HCjIQ96ClMcmobqPAmu5JpHfEz5D9kjK/b6gGXtGCAkK6pM3wjmgq6I35ANq
 duC58DmB2XGE1O4OKeRgU7oWgpemLXnu9GePvH/90LXRqT6oWivnT+wxQ86ftywUC7ga
 f8xjtei7iv2/4yUcWnjEagEh264XHSIT/e/iny2O4Z+N8KlfwRbKwevXg4SAISln0y28
 YPUw==
X-Gm-Message-State: AOAM532uLBu8e1i+qW9L6P7j3FClJ2a9HO5sNVvbzabFfOZAbbu7iug4
 xmv+r2V/cb5qbdtVGcbzdZ+dbQ==
X-Google-Smtp-Source: ABdhPJx4HfAA4wpH8/Kt4ymLNpegRYw4Z9ZhxTLF9qKqtTWcfssB+nzDFXYh+57Un66kEi/PTJPfag==
X-Received: by 2002:a62:28b:0:b029:28e:e592:fe65 with SMTP id
 133-20020a62028b0000b029028ee592fe65mr23864386pfc.75.1620640369611; 
 Mon, 10 May 2021 02:52:49 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a524:abe8:94e3:5601])
 by smtp.gmail.com with UTF8SMTPSA id k9sm4190684pgq.27.2021.05.10.02.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 02:52:49 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 15/15] of: Add plumbing for restricted DMA pool
Date: Mon, 10 May 2021 17:50:26 +0800
Message-Id: <20210510095026.3477496-16-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210510095026.3477496-1-tientzu@chromium.org>
References: <20210510095026.3477496-1-tientzu@chromium.org>
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
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a device is not behind an IOMMU, we look up the device node and set
up the restricted DMA when the restricted-dma-pool is presented.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/of/address.c    | 25 +++++++++++++++++++++++++
 drivers/of/device.c     |  3 +++
 drivers/of/of_private.h |  5 +++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index aca94c348bd4..c562a9ff5f0b 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -8,6 +8,7 @@
 #include <linux/logic_pio.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pci.h>
 #include <linux/pci_regs.h>
 #include <linux/sizes.h>
@@ -1112,6 +1113,30 @@ bool of_dma_is_coherent(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_dma_is_coherent);
 
+int of_dma_set_restricted_buffer(struct device *dev)
+{
+	struct device_node *node;
+	int count, i;
+
+	if (!dev->of_node)
+		return 0;
+
+	count = of_property_count_elems_of_size(dev->of_node, "memory-region",
+						sizeof(phandle));
+	for (i = 0; i < count; i++) {
+		node = of_parse_phandle(dev->of_node, "memory-region", i);
+		/* There might be multiple memory regions, but only one
+		 * restriced-dma-pool region is allowed.
+		 */
+		if (of_device_is_compatible(node, "restricted-dma-pool") &&
+		    of_device_is_available(node))
+			return of_reserved_mem_device_init_by_idx(
+				dev, dev->of_node, i);
+	}
+
+	return 0;
+}
+
 /**
  * of_mmio_is_nonposted - Check if device uses non-posted MMIO
  * @np:	device node
diff --git a/drivers/of/device.c b/drivers/of/device.c
index c5a9473a5fb1..d8d865223e51 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 
 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
+	if (!iommu)
+		return of_dma_set_restricted_buffer(dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure_id);
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index d717efbd637d..e9237f5eff48 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -163,12 +163,17 @@ struct bus_dma_region;
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
 int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map);
+int of_dma_set_restricted_buffer(struct device *dev);
 #else
 static inline int of_dma_get_range(struct device_node *np,
 		const struct bus_dma_region **map)
 {
 	return -ENODEV;
 }
+static inline int of_dma_get_restricted_buffer(struct device *dev)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* _LINUX_OF_PRIVATE_H */
-- 
2.31.1.607.g51e8a6a459-goog

