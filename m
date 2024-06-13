Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB137906C76
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9910110EA48;
	Thu, 13 Jun 2024 11:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eYQjn08/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AE610E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTRnfk+xncNuJMn54sP5qzAQh4gcZ4Sy3yYao6iQeYc=;
 b=eYQjn08/686k6VVYgZ36i9/zWZaS9EGOYhEzM5/3ifjj2iz70V1387CiZONXRa/Q9VeJmw
 ltBFoawfBkOAdgfXMJLAMX86WNhYOyTZwj+vTwZCf0HfFWSlb90S9qDfuN12pgyUTPDjSr
 VKLO2adr8CqW6APFK/+u2n2c6c4Vd94=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-koeO92UfNneK9iL-Dmgt-Q-1; Thu, 13 Jun 2024 07:50:48 -0400
X-MC-Unique: koeO92UfNneK9iL-Dmgt-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4217e21bcd4so1585935e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279447; x=1718884247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qTRnfk+xncNuJMn54sP5qzAQh4gcZ4Sy3yYao6iQeYc=;
 b=Rk1t+bCDgJZz8dVUNUVQmBZYQUjAKM08ua7B96DCFHeZdahIZsMgqarTSnba6FBjmg
 hJWbRYLOawbqsZsm5nYOMhp8i8Sm6LO7CiW5j+IKvQvk7T88rXSMnY71AqpGXdVSJ0I5
 lTwrsEdOXHlGElzusNNow9LKrwki/2qr5dE5OapoSXQNUNctmuu9yAkwW5sXU7nAqBFj
 b+kvyTvXSXLMayETFni5VyC21696prGPhJXQyWqa7g86aWpKW+YRkyfFs1Oijlwicfc6
 xwZM5Y+U3mfcz6wirnb+5vMzAKlENiRRoecVviQN32fCVRAFNiCMXt9dgFIIZwH2eRwQ
 WXnA==
X-Gm-Message-State: AOJu0YzjWAM84roJN15GCPAwzxkK+8rBV5pZtrUemMI9b7+XlImRjjac
 sA06zB/W8ke9dUoRp5ZRQ2Y32nBpFZKI8+FVw0VrS0pDIZUlyHvD0j89JGQE47Cu6P4/4LP9bdx
 I1nISQQzNGSwgLvw3MOR4wkGrUx4F8cRaOLSyFdgQVJKlyel0c5Q/ceRUwDDezvyw/A==
X-Received: by 2002:a05:600c:350b:b0:421:74d4:f32c with SMTP id
 5b1f17b1804b1-423041e1d4cmr1371055e9.1.1718279447052; 
 Thu, 13 Jun 2024 04:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv8ZBvdV4IZRRiIgJbZsBfiAJdHKRwnxvdFK5xMqJJnZPKz428Y6zIL/fRH5SPX2HOkbTO0A==
X-Received: by 2002:a05:600c:350b:b0:421:74d4:f32c with SMTP id
 5b1f17b1804b1-423041e1d4cmr1370945e9.1.1718279446627; 
 Thu, 13 Jun 2024 04:50:46 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:46 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 02/13] PCI: Add devres helpers for iomap table
Date: Thu, 13 Jun 2024 13:50:15 +0200
Message-ID: <20240613115032.29098-3-pstanner@redhat.com>
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

