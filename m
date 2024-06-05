Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714E8FC5CC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB1610E708;
	Wed,  5 Jun 2024 08:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cRlsuZOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BE810E48C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZrCQX9R0uMZLnmEvnk0FOyHrEpxtR6m1CEijmNoZqI=;
 b=cRlsuZOHUrkR3XXcDszIysbYDoo+hQGjLdcwRWABTOULhbdRqMrGmZUjA3txE0gde3//Sz
 UTDaPOMRAXoEg3FRlXnfMzHcOZvhLxmdlr5l8FTl43HdwnvTmAhOq5nMYDucsoEEuIRiQG
 13vUpSEYLrP2WVz0/tsgIqWDdWFbK08=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-wzSAQpjQN7WyvOg4w9X9kg-1; Wed, 05 Jun 2024 04:16:19 -0400
X-MC-Unique: wzSAQpjQN7WyvOg4w9X9kg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42133136397so6119505e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575378; x=1718180178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yZrCQX9R0uMZLnmEvnk0FOyHrEpxtR6m1CEijmNoZqI=;
 b=fUjcNOwMWDTiKMHhMneZnqPwMQgFouTRrGCghksCzcVPG8vQJThbkenGZOZsebhyAh
 2uO4+cpKvFPjxHOCFQP/RHgfcBis2SS/zkwjf9pmnzRO/bloPbAtw34eicgDH6SrjXCe
 NNhQklrBOgT0miG05Sjqb8GKNLxgbeA9xnT2FsuYtqc5HaO5wuthSHGg5M7S0NRvjGZj
 mV/1JDX1JC5U73+hV43s35C156LAmgVzfkUzmr9EexEZAwrveAvDYiEHYnpwO5Vqa/+U
 wXj00qn5VcUXkinepA1m/bjZEB9PEqss7OtUceM/OJvqV+3fXr2r4HyhJNNj8PpLO7CA
 QE8A==
X-Gm-Message-State: AOJu0YwPrFlH6oOxzOAo+sfZmc+K89Pi2LIsXi6UXptisK7V7QsdF92R
 gNMHyZh10+xJQ8nEg1kMlq+8FpnQ5HpFAxNPnhWvc6/+CktZ/nLaphR6RkvwysukdjzK5CLEuXb
 M1X7Ge69HWxelkCY+ttd9EEWdQP+UvkjRH1wr1U0FKRSCNa1peYRYnR15tPCc6pvRcg==
X-Received: by 2002:adf:fe0c:0:b0:355:291:19da with SMTP id
 ffacd0b85a97d-35e8ef7f1femr1115399f8f.5.1717575378577; 
 Wed, 05 Jun 2024 01:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB4zVY6+VoEzLjRsWMaLUjiRNKwhy7h7Hs/HLcCXOD9gH84CvZuj8siARFwKu4gffWqGiURA==
X-Received: by 2002:adf:fe0c:0:b0:355:291:19da with SMTP id
 ffacd0b85a97d-35e8ef7f1femr1115390f8f.5.1717575378288; 
 Wed, 05 Jun 2024 01:16:18 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:17 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 02/13] PCI: Add devres helpers for iomap table
Date: Wed,  5 Jun 2024 10:15:54 +0200
Message-ID: <20240605081605.18769-4-pstanner@redhat.com>
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

The iomap-table administrated by pcim_iomap_table() has its entries set
and unset at several places throughout devres.c using manual iterations
which are effectively code duplications.

This can be done in a centralized, reusable manner.

Providing these new functions here and using them where (already)
possible will allow for using them in subsequent cleanup steps to
simplify the PCI devres API.

Implement helper functions to add mappings to the table and to remove
them again. Use them where applicable.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 77 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index f13edd4a3873..5fc35a947b58 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -297,6 +297,52 @@ void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_iomap_table);
 
+/*
+ * Fill the legacy mapping-table, so that drivers using the old API
+ * can still get a BAR's mapping address through pcim_iomap_table().
+ */
+static int pcim_add_mapping_to_legacy_table(struct pci_dev *pdev,
+		 void __iomem *mapping, short bar)
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
+ * Removes a mapping. The table only contains whole-bar-mappings, so this will
+ * never interfere with ranged mappings.
+ */
+static void pcim_remove_mapping_from_legacy_table(struct pci_dev *pdev,
+		void __iomem *addr)
+{
+	short bar;
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

