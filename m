Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7745906D07
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921E310EA5D;
	Thu, 13 Jun 2024 11:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lg7pisEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032110EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=000KYz6ID2QoUMG52/WJvZNJGOa8UH1A+/S3718oumg=;
 b=Lg7pisEfIIlY00NXnLzmiMXjCgi28r7Xjgv2am1zByzwa9Q+dlK2OcSzahxxeGBP0pTHRm
 UIgefkxoEnl4t8OlIO1jE59O5HycRGmCblPkk72WbfVfJuIw0T1j00A+F2+OTBAtYpktDu
 hM4Tg19xgpfxeFxtQCHNS8/ilAFzGJ8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-mogWg9zPOnWv67h_kRsPpQ-1; Thu, 13 Jun 2024 07:58:11 -0400
X-MC-Unique: mogWg9zPOnWv67h_kRsPpQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35f22a02d14so157935f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279889; x=1718884689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=000KYz6ID2QoUMG52/WJvZNJGOa8UH1A+/S3718oumg=;
 b=IT9scv/ykedJAk1tdgXLuwLhdGpq0q13f7WRcOOwzaYGXyPOnMSa8C1F1SzymoYZ5w
 J/8bjJBPqDEOm/SjwXBxvBhX/TyGIUWdkK8kDnSlKhGB/enKCInqFpXNvxUrQuaiWEaJ
 /hU1Es/YV6TI2KGQU1mhC8mvIKoKUX/xCoL/UUvFCCkFw6MegPBENjNDnbvhn0M6EdeR
 GvniIObE+jLNlhBm7pVqO8SO1U0GS9PGm3dKyE/DBWJE1gqrYW8s80Hfapg+K5qAQv7A
 +I9KW2Rr+qTUNzzpLz08gOQ2MGS+/woxr8RYv0yXPuwbSO3Qk0Fo01IIYfAdp/1V5wqg
 Cr/Q==
X-Gm-Message-State: AOJu0YzZvriXVHz3MimyA7YKbdinbcdij8XT0xmyhunRreCrjV5WTE4N
 GXssVej0Zt4YKBvSL7CAG3vxYeSp/TVmYGyXL3n3ZUS4EW7y1vJI7Rp0iGpGvafU6ESiKdEKYe5
 RK+A2MjSe3gZuPRG2qmDVLl4fQYh0Eogk5ZQUjnwLhgL6UtDW++4HKt2dEyKH2awqUnUJiZ/6tQ
 ==
X-Received: by 2002:a5d:64c4:0:b0:35f:2929:8460 with SMTP id
 ffacd0b85a97d-36079a4bf08mr140273f8f.3.1718279889699; 
 Thu, 13 Jun 2024 04:58:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnhuJuSAKliDxcFbokg6egscMNv+7jsPTJ86B+AWP/UZU7fL3bpTZJKANl4Bt8/kMHQDmyzw==
X-Received: by 2002:a05:6512:ac3:b0:52c:9e80:387a with SMTP id
 2adb3069b0e04-52ca59e9d11mr72313e87.0.1718279457545; 
 Thu, 13 Jun 2024 04:50:57 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:57 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 12/13] PCI: Add pcim_iomap_range()
Date: Thu, 13 Jun 2024 13:50:25 +0200
Message-ID: <20240613115032.29098-13-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240613115032.29098-1-pstanner@redhat.com>
References: <20240613115032.29098-1-pstanner@redhat.com>
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
index 37ac8fd37291..2f0379a4e58f 100644
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
index 0c19f0717899..98893a89bb5b 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2303,6 +2303,8 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
+void __iomem *pcim_iomap_range(struct pci_dev *pdev, int bar,
+				unsigned long offset, unsigned long len);
 
 extern int pci_pci_problems;
 #define PCIPCI_FAIL		1	/* No PCI PCI DMA */
-- 
2.45.0

