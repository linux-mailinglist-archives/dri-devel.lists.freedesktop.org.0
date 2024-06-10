Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABA5901E36
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6393F10E3ED;
	Mon, 10 Jun 2024 09:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bM4h8Ohe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F057710E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTRnfk+xncNuJMn54sP5qzAQh4gcZ4Sy3yYao6iQeYc=;
 b=bM4h8OheRejkUtpWt4Z6jiLZ7MYTEl8V/THMuRIHhhUfIZkPIdTo2eG0juDE542qeVtVnz
 FrYsR1I03n8YaYLPXyy6k+TBwtbKIeAY3qfO0Mbp3AgH27dKDzeYL1RcJC2R8ahHlOvWUf
 uL1wOkItcyvcqoZx7Ajb4zyx1cVjizA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-iRiAkXlHOyqQ_JLOt4i0fw-1; Mon, 10 Jun 2024 05:32:03 -0400
X-MC-Unique: iRiAkXlHOyqQ_JLOt4i0fw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4211239ed3dso5276665e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011922; x=1718616722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTRnfk+xncNuJMn54sP5qzAQh4gcZ4Sy3yYao6iQeYc=;
 b=mnbA+9obN2cN52ZVshP2cNPrFXuKQ6DGGwEXIqMRYgcNJYaWkf5ot90z+j7eAwyL8r
 sxsilTn0iiTtoV9Rm0iErmY4DwkImwSuhAM07JdxBQPoTeaaFv5JOUWRCjnHwF0N+5bz
 RTyinZJbPrChFhcs++WugtilJGaaZjCKH23frUiR5ofg5Tcciw6AcOd1/TPzU0vCZWum
 eT+4H7VJgaZG8dV7KxXaJYFF1vEhXYvPSS2Epc9YdjR5pjTm0disnXYt3GAzsIJvDffu
 UbaeUTq1EtxtykNjGwzwu5U7PMG1r3IEmPq4+wUVgbs2mE00JHj6MELI/WmZEhzV2xy8
 ySBA==
X-Gm-Message-State: AOJu0YxrRBw558OwR6A2i51WAP45BOa231BcdiZFjfBnhzSdhan1KozY
 xLDoelyWCKvixgk8MgZAD+oxiaPclamcmHb03u2Dol1FsAAJI0tvrOqCJuKLw3tgIxPToCDzSEC
 npxUMr9tbwG3v4N5jKqzTuGZfV+W3m1cqQZaVkwPKRS192eMsZ18v8PkxgtVY6GxU4A==
X-Received: by 2002:a5d:588e:0:b0:34d:b5d6:fe4b with SMTP id
 ffacd0b85a97d-35efedd2e3emr6479218f8f.4.1718011921894; 
 Mon, 10 Jun 2024 02:32:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ34RIrsm60vplmSUHSp8HATp7AS7kEdOir9ms2KbhbicgUfnK/HnyWUyl28CP1kKuZ42sMA==
X-Received: by 2002:a5d:588e:0:b0:34d:b5d6:fe4b with SMTP id
 ffacd0b85a97d-35efedd2e3emr6479204f8f.4.1718011921628; 
 Mon, 10 Jun 2024 02:32:01 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:01 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 02/13] PCI: Add devres helpers for iomap table
Date: Mon, 10 Jun 2024 11:31:24 +0200
Message-ID: <20240610093149.20640-3-pstanner@redhat.com>
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

The pcim_iomap_devres.table administrated by pcim_iomap_table() has its
entries set and unset at several places throughout devres.c using manual
iterations which are effectively code duplications.

Add pcim_add_mapping_to_legacy_table() and
pcim_remove_mapping_from_legacy_table() helper functions and use them where
possible.

Link: https://lore.kernel.org/r/20240605081605.18769-4-pstanner@redhat.com
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
[bhelgaas: s/short bar/int bar/ for consistency]
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/devres.c | 77 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index f13edd4a3873..845d6fab0ce7 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -297,6 +297,52 @@ void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_iomap_table);
 
+/*
+ * Fill the legacy mapping-table, so that drivers using the old API can
+ * still get a BAR's mapping address through pcim_iomap_table().
+ */
+static int pcim_add_mapping_to_legacy_table(struct pci_dev *pdev,
+					    void __iomem *mapping, int bar)
+{
+	void __iomem **legacy_iomap_table;
+
+	if (bar >= PCI_STD_NUM_BARS)
+		return -EINVAL;
+
+	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
+	if (!legacy_iomap_table)
+		return -ENOMEM;
+
+	/* The legacy mechanism doesn't allow for duplicate mappings. */
+	WARN_ON(legacy_iomap_table[bar]);
+
+	legacy_iomap_table[bar] = mapping;
+
+	return 0;
+}
+
+/*
+ * Remove a mapping. The table only contains whole-BAR mappings, so this will
+ * never interfere with ranged mappings.
+ */
+static void pcim_remove_mapping_from_legacy_table(struct pci_dev *pdev,
+						  void __iomem *addr)
+{
+	int bar;
+	void __iomem **legacy_iomap_table;
+
+	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
+	if (!legacy_iomap_table)
+		return;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (legacy_iomap_table[bar] == addr) {
+			legacy_iomap_table[bar] = NULL;
+			return;
+		}
+	}
+}
+
 /**
  * pcim_iomap - Managed pcim_iomap()
  * @pdev: PCI device to iomap for
@@ -308,16 +354,20 @@ EXPORT_SYMBOL(pcim_iomap_table);
  */
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen)
 {
-	void __iomem **tbl;
+	void __iomem *mapping;
 
-	BUG_ON(bar >= PCIM_IOMAP_MAX);
-
-	tbl = (void __iomem **)pcim_iomap_table(pdev);
-	if (!tbl || tbl[bar])	/* duplicate mappings not allowed */
+	mapping = pci_iomap(pdev, bar, maxlen);
+	if (!mapping)
 		return NULL;
 
-	tbl[bar] = pci_iomap(pdev, bar, maxlen);
-	return tbl[bar];
+	if (pcim_add_mapping_to_legacy_table(pdev, mapping, bar) != 0)
+		goto err_table;
+
+	return mapping;
+
+err_table:
+	pci_iounmap(pdev, mapping);
+	return NULL;
 }
 EXPORT_SYMBOL(pcim_iomap);
 
@@ -330,20 +380,9 @@ EXPORT_SYMBOL(pcim_iomap);
  */
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr)
 {
-	void __iomem **tbl;
-	int i;
-
 	pci_iounmap(pdev, addr);
 
-	tbl = (void __iomem **)pcim_iomap_table(pdev);
-	BUG_ON(!tbl);
-
-	for (i = 0; i < PCIM_IOMAP_MAX; i++)
-		if (tbl[i] == addr) {
-			tbl[i] = NULL;
-			return;
-		}
-	WARN_ON(1);
+	pcim_remove_mapping_from_legacy_table(pdev, addr);
 }
 EXPORT_SYMBOL(pcim_iounmap);
 
-- 
2.45.0

