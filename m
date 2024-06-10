Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76C901E42
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5799D10E3F3;
	Mon, 10 Jun 2024 09:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YuPbmw6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9903910E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYyS0MFkgb40Rf9CNRl6khW3DB/TwdBG9c2B8GVIp3I=;
 b=YuPbmw6n3sizRRFLFttQhf1JNi0bAbZGt/3RUCElXlt8B5TH9uxywfgsD+jbO7PeJTfa1r
 cKhO4P9/G4ClI1TmjYfa7aFhCecNClA9pXmm2tARjf6/0yxC9J3I7qPrbYlYTTu9m24GJN
 MaUUlZLuC4tB3WVZUeagg01JkjxQoTc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-87mr0WdpMk2uofGrnC8aWA-1; Mon, 10 Jun 2024 05:32:13 -0400
X-MC-Unique: 87mr0WdpMk2uofGrnC8aWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-421ad3c2012so1209375e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011932; x=1718616732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYyS0MFkgb40Rf9CNRl6khW3DB/TwdBG9c2B8GVIp3I=;
 b=XMaQxAoBHlkSMeqvKrqtna34ssHgFvplrwnLC7iSCQIx1jQZM+cVBkTOM4oVQ4yc0l
 M5CplUhC0MDPdfyhkXFL1Rc6DlhoFghwvR3EpzrmpMjMXggxzFiQw0eWD1Laz6hUGcU9
 cE6OxAmV8EcAK87yp2473nmpOCHewD8B3I90sQQGxKX7+U823Uh8/iLES5Z9KIoWycip
 OGVzeLgbG8bG8Y+cfsmumzsISBGMuHFBI6J/uTr1Mfgc6e7RSpBDakBEDR5jsO0VPEK6
 8yKvn89ORZbIuBNFPqmjh08Fa+ILfZ70U7JkGS/yp+wvAAI9VQVBUqNmNxONUWxbnb7b
 nt9Q==
X-Gm-Message-State: AOJu0YyN+KRMANAIR6sELc7aWygqi4VgZFMopvG4yuzPGV/eYk/uWGku
 fAzRbxgh9gFOPhxWiTfnawCjeMqItjttb1o9n7B2nDhzS61ZuGgXLo+YOKqOdXwrgX5CFGOcF4T
 k0y8YyH9P9VYsBkNNlHh/U/+mtGV7KqgFNl1dUWwi2+iPTtRLs9x3EdmGWo31AoLziw==
X-Received: by 2002:a5d:526a:0:b0:35f:1412:fa8a with SMTP id
 ffacd0b85a97d-35f1412fcddmr3111490f8f.1.1718011932111; 
 Mon, 10 Jun 2024 02:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa4v7/IL4a5fGSrL47j3kH3zCfktetXms9w5+CrxpIYCETGQiN/XQkBtYRt2zSMtVQVzGA1A==
X-Received: by 2002:a5d:526a:0:b0:35f:1412:fa8a with SMTP id
 ffacd0b85a97d-35f1412fcddmr3111472f8f.1.1718011931796; 
 Mon, 10 Jun 2024 02:32:11 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:11 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 12/13] PCI: Add pcim_iomap_range()
Date: Mon, 10 Jun 2024 11:31:34 +0200
Message-ID: <20240610093149.20640-13-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240610093149.20640-1-pstanner@redhat.com>
References: <20240610093149.20640-1-pstanner@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only managed mapping function currently is pcim_iomap() which
doesn't allow for mapping an area starting at a certain offset, which
many drivers want.

Add pcim_iomap_range() as an exported function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h  |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index e92a8802832f..96f18243742b 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -1015,3 +1015,47 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 	}
 }
 EXPORT_SYMBOL(pcim_iounmap_regions);
+
+/**
+ * pcim_iomap_range - Create a ranged __iomap mapping within a PCI BAR
+ * @pdev: PCI device to map IO resources for
+ * @bar: Index of the BAR
+ * @offset: Offset from the begin of the BAR
+ * @len: Length in bytes for the mapping
+ *
+ * Returns: __iomem pointer on success, an IOMEM_ERR_PTR on failure.
+ *
+ * Creates a new IO-Mapping within the specified @bar, ranging from @offset to
+ * @offset + @len.
+ *
+ * The mapping will automatically get unmapped on driver detach. If desired,
+ * release manually only with pcim_iounmap().
+ */
+void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
+		unsigned long offset, unsigned long len)
+{
+	void __iomem *mapping;
+	struct pcim_addr_devres *res;
+
+	res = pcim_addr_devres_alloc(pdev);
+	if (!res)
+		return IOMEM_ERR_PTR(-ENOMEM);
+
+	mapping = pci_iomap_range(pdev, bar, offset, len);
+	if (!mapping) {
+		pcim_addr_devres_free(res);
+		return IOMEM_ERR_PTR(-EINVAL);
+	}
+
+	res->type = PCIM_ADDR_DEVRES_TYPE_MAPPING;
+	res->baseaddr = mapping;
+
+	/*
+	 * Ranged mappings don't get added to the legacy-table, since the table
+	 * only ever keeps track of whole BARs.
+	 */
+
+	devres_add(&pdev->dev, res);
+	return mapping;
+}
+EXPORT_SYMBOL(pcim_iomap_range);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index cc9247f78158..bee1b2754219 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2304,6 +2304,8 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
+void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
+				unsigned long offset, unsigned long len);
 
 extern int pci_pci_problems;
 #define PCIPCI_FAIL		1	/* No PCI PCI DMA */
-- 
2.45.0

