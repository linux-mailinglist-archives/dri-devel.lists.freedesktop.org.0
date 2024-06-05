Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4788FC5D0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F091D10E705;
	Wed,  5 Jun 2024 08:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W1Z+YSey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929D010E6D3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEuAQpiyFkRTWU9yECucUjg03zi15bHltjbT7Mp+Diw=;
 b=W1Z+YSey7m4MTMbH2eXUKVFx/i/x5YOJ8KzRwsMvW0/Pm9HMGCQw2SvQOkFay5HcEkKMXr
 c3IYX+kPYq8Sxln4FkrgXWLMSJNpDAvPDgEhD+dyNxakE2CFabUdpnWYJRVNEK8cmZVcQy
 MUOwmSQVuo7l/MDWZQwLONFklo4ABv8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-zjUYUD_hPXm_62kjWNfsSA-1; Wed, 05 Jun 2024 04:16:29 -0400
X-MC-Unique: zjUYUD_hPXm_62kjWNfsSA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42156176983so1033515e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575389; x=1718180189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IEuAQpiyFkRTWU9yECucUjg03zi15bHltjbT7Mp+Diw=;
 b=Q6bjmRHUX4YY6IiA+NqfEBYrspO1n1thcKiZ9M3s1cKWEWXLjq17hHN5Sz3i5a1zVq
 U5hJjFZZkVMg8j4OYJq2qXxWfe5Vdh3ubV73ppEx82SJyuoVQOHFayX3U89+ffU2U6O/
 zLgYudO4Ej+KlSA7WRVY/y+aQESi4VBp87ba8U0X5/JX/90asc7QZ8I3VjuZRKttLx+H
 jVuFvC8dGSqrFj5Ea8/rG14CEID01FJ7AT6PqwpzHKj71NnQzTkJLAi5ihePtWgtFYLP
 0eoAbIgIo+7ZNFFcO2D60WQHH5MLQS6H9Iy6BOO/Ekwlygy1BM86vPMXR9QkiGHmCGXB
 psjQ==
X-Gm-Message-State: AOJu0YzBf1Zuj+MajncyFyfH63xXRrBIBOd7cMX1F1vFmwdyAUU5Guzy
 9rAiPTOQkKeg4oQtebN4BhlDN0WoskMJI17hyHDEQ3EKXX+bShmkZd3WWBj9CwhOP2oxOwoUICT
 rO+j2DHlqsYonC1gl+TsIQ+TjGJVu2rxmffNM80LMn+omuYCEgoZdwMjccpSVl4saFQ==
X-Received: by 2002:a5d:49c5:0:b0:354:f768:aa00 with SMTP id
 ffacd0b85a97d-35e8ef8f11amr1107299f8f.4.1717575388874; 
 Wed, 05 Jun 2024 01:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnjANmPeJW2fIkqitgTnO6d1I0TF2FhQLz3U4Vz0ir5jlCvF+wcPqPTc7AeKCFcFuNtzjdvA==
X-Received: by 2002:a5d:49c5:0:b0:354:f768:aa00 with SMTP id
 ffacd0b85a97d-35e8ef8f11amr1107276f8f.4.1717575388585; 
 Wed, 05 Jun 2024 01:16:28 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:28 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 12/13] PCI: Add pcim_iomap_range()
Date: Wed,  5 Jun 2024 10:16:04 +0200
Message-ID: <20240605081605.18769-14-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240605081605.18769-2-pstanner@redhat.com>
References: <20240605081605.18769-2-pstanner@redhat.com>
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
index 271ffd1aaf47..5ddcfe001d08 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -1007,3 +1007,47 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
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
index 3104c0238a42..f6918e49ea5f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2329,6 +2329,8 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
+void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
+				unsigned long offset, unsigned long len);
 
 extern int pci_pci_problems;
 #define PCIPCI_FAIL		1	/* No PCI PCI DMA */
-- 
2.45.0

