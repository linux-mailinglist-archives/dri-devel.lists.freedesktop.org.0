Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E394A2E0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09A110E467;
	Wed,  7 Aug 2024 08:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZeG79+zJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B6210E471
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723019431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OfBj6lBAY4VJsMws6sBIFpxuMUursLja0EGRzFyXM78=;
 b=ZeG79+zJ4qPsNktE62ib3+6pWY8PciiIHLePlZTeKl/sU2p/+W0rPrdoLBnLfqxdc6LPIa
 rK7Llz3USPmfhh/YAdqz3dz169JWZBpKIjsmxYTBnhG9nGACyht9XQhtdKuaIK3e8yV2LL
 +LYGCljLFIP4WdUE5fk78T6xYcq//xU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-UqEkq9OPOsSRyer_c4M_DQ-1; Wed, 07 Aug 2024 04:30:27 -0400
X-MC-Unique: UqEkq9OPOsSRyer_c4M_DQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4281d62be91so1293175e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 01:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723019426; x=1723624226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OfBj6lBAY4VJsMws6sBIFpxuMUursLja0EGRzFyXM78=;
 b=d0EqibrKP0QPzTVnhY9LzeqnLSity57oEDunr+2I80+RW0oUXSrgg5Rgg9b16v6fBl
 K9atgYTuh3DETPqjkHf0Fv5yBLZi7l08IXPJ4OUJIamkuvBKSooXJ7W3Z8hH6GFBHbS5
 /heoKDZl1qcSW2Xiy6qf+CfytmpYOMZEz+t0guP9ilqZyNmer1JFkJUq3DewlKsdw1JN
 Xsxcr1n0af/evoIp6EYP3TT99NI8JsdMikPR3UVEYzkIrUCo7EKPNObelk8efuycZrGI
 BQ1kHwEHbS5CZJ9P9XUMvCBjQiSgSovZbSQSq1rg7kPUFx1yRVoHHjTsk53LrUbUcha3
 ioSg==
X-Gm-Message-State: AOJu0Yz4+vGXdFpJCfiz/0B6CUVhypbcNPUSgivMe7g/uv021cKNJXsW
 GiBIciDJWHWpe8+5WAdq4Ht19HuqpTTqD3zY1y64/1dX3opVwoD6Y0VfX6CbYZcpKa/IHHLnsjx
 UvhTN8/s8gRllGmr9BfeZM7TEl7ZnnxANW12IncIbyxmTIOFc8fuCH3UZQeLbfn0DSA==
X-Received: by 2002:a05:600c:4591:b0:426:6f48:415e with SMTP id
 5b1f17b1804b1-428e6aea795mr73821005e9.1.1723019425857; 
 Wed, 07 Aug 2024 01:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdhIO0KlL48PS+jaZDCPIETER1vQyM9Ppq36CYnKYH6adnAP4mB8NMbC+bOkQ6YfKhAfEWRA==
X-Received: by 2002:a05:600c:4591:b0:426:6f48:415e with SMTP id
 5b1f17b1804b1-428e6aea795mr73820815e9.1.1723019425354; 
 Wed, 07 Aug 2024 01:30:25 -0700 (PDT)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290580cb80sm18544835e9.45.2024.08.07.01.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 01:30:25 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 1/2] PCI: Deprecate pcim_iomap_regions() in favor of
 pcim_iomap_region()
Date: Wed,  7 Aug 2024 10:30:18 +0200
Message-ID: <20240807083018.8734-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
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

pcim_iomap_regions() is a complicated function that uses a bit mask to
determine the BARs the user wishes to request and ioremap. Almost all
users only ever set a single bit in that mask, making that mechanism
questionable.

pcim_iomap_region() is now available as a more simple replacement.

Make pcim_iomap_region() a public function.

Mark pcim_iomap_regions() as deprecated.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 8 ++++++--
 include/linux/pci.h  | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 3780a9f9ec00..89ec26ea1501 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -728,7 +728,7 @@ EXPORT_SYMBOL(pcim_iounmap);
  * Mapping and region will get automatically released on driver detach. If
  * desired, release manually only with pcim_iounmap_region().
  */
-static void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
+void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
 				       const char *name)
 {
 	int ret;
@@ -761,6 +761,7 @@ static void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
 
 	return IOMEM_ERR_PTR(ret);
 }
+EXPORT_SYMBOL(pcim_iomap_region);
 
 /**
  * pcim_iounmap_region - Unmap and release a PCI BAR
@@ -783,7 +784,7 @@ static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
 }
 
 /**
- * pcim_iomap_regions - Request and iomap PCI BARs
+ * pcim_iomap_regions - Request and iomap PCI BARs (DEPRECATED)
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to request and iomap
  * @name: Name associated with the requests
@@ -791,6 +792,9 @@ static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
  * Returns: 0 on success, negative error code on failure.
  *
  * Request and iomap regions specified by @mask.
+ *
+ * This function is DEPRECATED. Do not use it in new code.
+ * Use pcim_iomap_region() instead.
  */
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 4cf89a4b4cbc..fc30176d28ca 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2292,6 +2292,8 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
+void __iomem *pcim_iomap_region(struct pci_dev *pdev, int bar,
+				       const char *name);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
-- 
2.45.2

