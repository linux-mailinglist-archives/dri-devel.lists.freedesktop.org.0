Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E666901E49
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9836B10E3FF;
	Mon, 10 Jun 2024 09:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ECgDw/Vb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F86C10E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmBGcmpGbvOFP1AIf55egClciELzX12rkzdK4Dy+Hd4=;
 b=ECgDw/VbfZ+vfQ4Vrm53BGkGPfaRSaFJ87hDTKjJAOCtNKP7itdwbVruOqGOwe6mU+Enoo
 jpZvkdLXL8YAaO1AFiCNH4cJPYMbT01wooMLtIdnSB2MSGS4P8MEunnyjSboFqPcoyJNUC
 j1ppWvwdf1Nbv5W44SpgRpZ0DGxRThE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-7nd3VrYdMEO_FJlkv7hrXQ-1; Mon, 10 Jun 2024 05:32:11 -0400
X-MC-Unique: 7nd3VrYdMEO_FJlkv7hrXQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ebd69e45b3so2133681fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011930; x=1718616730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PmBGcmpGbvOFP1AIf55egClciELzX12rkzdK4Dy+Hd4=;
 b=i+pGaENxL/nZEhYaL8/V7tRvEXYWLtBZdUWXyfaFvRUP+rAyVcQ1DcTJyvm03ZOT+A
 zT1sgoKkAGBYXVK4JEfMZ0k6mg7I7GWa3UKIeZnEQcXc8SItkmDPZiCgLnw4WJ4vTCIj
 8ICnJE+nNyz8UhCh8uNJnIM8C34eeGktGs1yeXXJjhQJKf2bF/2zmiTUgBgZjzg+pwhR
 V2V0KHisioISy7Cs6c8Cw3emV3CMyJ6eXtjlfJl8ccnWZC/10dVCdoHCF/wuy9fYcrwf
 Th+j3w5vgki5Z2A2V4Ddpdwp5aEHmCLFAhb22SA3Or8/VPYQn4RONMNsHxTuQdQn28H5
 GG6A==
X-Gm-Message-State: AOJu0YyH28HTTEMaDEuQicKYQ3ZXePC/MstFT7PST2Qu/8FhhG5T/TAn
 uTyFuArKSgeW8QlA2AsN2+AAfIoOIwFz47mrWsK2cqfl7L6CK49/2bHMNTsvc7mYuA8FrWNq3NU
 QDZWyJ1vpp7cNVslqcfkzoKigBa4a7ny5VLTuK8Pg/8jiTwDUoXeJ8xS72leihlwlYQ==
X-Received: by 2002:a05:6512:551:b0:52b:8325:6eed with SMTP id
 2adb3069b0e04-52bb9f76f7dmr5384556e87.2.1718011930240; 
 Mon, 10 Jun 2024 02:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgbn5PpJ3Jnv5nGP2smWEohtnvWJ0KNMfA5EI1Y5tPrYLamq+qiSktIeCn16zhQ6SoTJbiEA==
X-Received: by 2002:a05:6512:551:b0:52b:8325:6eed with SMTP id
 2adb3069b0e04-52bb9f76f7dmr5384538e87.2.1718011929791; 
 Mon, 10 Jun 2024 02:32:09 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:09 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 10/13] PCI: Give pci_intx() its own devres callback
Date: Mon, 10 Jun 2024 11:31:32 +0200
Message-ID: <20240610093149.20640-11-pstanner@redhat.com>
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

pci_intx() is one of the functions that have "hybrid mode" (i.e.,
sometimes managed, sometimes not). Providing a separate pcim_intx()
function with its own device resource and cleanup callback allows for
removing further large parts of the legacy PCI devres implementation.

As in the region-request-functions, pci_intx() has to call into its
managed counterpart for backwards compatibility.

As pci_intx() is an outdated function, pcim_intx() shall not be made
visible to drivers via a public API.

Implement pcim_intx() with its own device resource.
Make pci_intx() call pcim_intx() in the managed case.
Remove the now surplus function find_pci_dr().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 76 ++++++++++++++++++++++++++++++++++++--------
 drivers/pci/pci.c    | 21 ++++++------
 drivers/pci/pci.h    | 13 ++++----
 3 files changed, 80 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index a0a59338cd92..0bb144fdb69b 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -42,6 +42,11 @@ struct pcim_iomap_devres {
 	void __iomem *table[PCI_STD_NUM_BARS];
 };
 
+/* Used to restore the old intx state on driver detach. */
+struct pcim_intx_devres {
+	int orig_intx;
+};
+
 enum pcim_addr_devres_type {
 	/* Default initializer. */
 	PCIM_ADDR_DEVRES_TYPE_INVALID,
@@ -397,32 +402,75 @@ int pcim_set_mwi(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_set_mwi);
 
+
 static inline bool mask_contains_bar(int mask, int bar)
 {
 	return mask & BIT(bar);
 }
 
-static void pcim_release(struct device *gendev, void *res)
+static void pcim_intx_restore(struct device *dev, void *data)
 {
-	struct pci_dev *dev = to_pci_dev(gendev);
-	struct pci_devres *this = res;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pcim_intx_devres *res = data;
 
-	if (this->restore_intx)
-		pci_intx(dev, this->orig_intx);
+	pci_intx(pdev, res->orig_intx);
+}
 
-	if (pci_is_enabled(dev) && !dev->pinned)
-		pci_disable_device(dev);
+static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
+{
+	struct pcim_intx_devres *res;
+
+	res = devres_find(dev, pcim_intx_restore, NULL, NULL);
+	if (res)
+		return res;
+
+	res = devres_alloc(pcim_intx_restore, sizeof(*res), GFP_KERNEL);
+	if (res)
+		devres_add(dev, res);
+
+	return res;
 }
 
-/*
- * TODO: After the last four callers in pci.c are ported, find_pci_dr()
- * needs to be made static again.
+/**
+ * pcim_intx - managed pci_intx()
+ * @pdev: the PCI device to operate on
+ * @enable: boolean: whether to enable or disable PCI INTx
+ *
+ * Returns: 0 on success, -ENOMEM on error.
+ *
+ * Enables/disables PCI INTx for device @pdev.
+ * Restores the original state on driver detach.
  */
-struct pci_devres *find_pci_dr(struct pci_dev *pdev)
+int pcim_intx(struct pci_dev *pdev, int enable)
 {
-	if (pci_is_managed(pdev))
-		return devres_find(&pdev->dev, pcim_release, NULL, NULL);
-	return NULL;
+	u16 pci_command, new;
+	struct pcim_intx_devres *res;
+
+	res = get_or_create_intx_devres(&pdev->dev);
+	if (!res)
+		return -ENOMEM;
+
+	res->orig_intx = !enable;
+
+	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
+
+	if (enable)
+		new = pci_command & ~PCI_COMMAND_INTX_DISABLE;
+	else
+		new = pci_command | PCI_COMMAND_INTX_DISABLE;
+
+	if (new != pci_command)
+		pci_write_config_word(pdev, PCI_COMMAND, new);
+
+	return 0;
+}
+
+static void pcim_release(struct device *gendev, void *res)
+{
+	struct pci_dev *dev = to_pci_dev(gendev);
+
+	if (pci_is_enabled(dev) && !dev->pinned)
+		pci_disable_device(dev);
 }
 
 static struct pci_devres *get_pci_dr(struct pci_dev *pdev)
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index db2cc48f3d63..1b4832a60047 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4443,6 +4443,16 @@ void pci_intx(struct pci_dev *pdev, int enable)
 {
 	u16 pci_command, new;
 
+	/*
+	 * This is done for backwards compatibility, because the old PCI devres
+	 * API had a mode in which this function became managed if the dev had
+	 * been enabled with pcim_enable_device() instead of pci_enable_device().
+	 */
+	if (pci_is_managed(pdev)) {
+		WARN_ON_ONCE(pcim_intx(pdev, enable) != 0);
+		return;
+	}
+
 	pci_read_config_word(pdev, PCI_COMMAND, &pci_command);
 
 	if (enable)
@@ -4450,17 +4460,8 @@ void pci_intx(struct pci_dev *pdev, int enable)
 	else
 		new = pci_command | PCI_COMMAND_INTX_DISABLE;
 
-	if (new != pci_command) {
-		struct pci_devres *dr;
-
+	if (new != pci_command)
 		pci_write_config_word(pdev, PCI_COMMAND, new);
-
-		dr = find_pci_dr(pdev);
-		if (dr && !dr->restore_intx) {
-			dr->restore_intx = 1;
-			dr->orig_intx = !enable;
-		}
-	}
 }
 EXPORT_SYMBOL_GPL(pci_intx);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index c355bb6a698d..9e87528f1157 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -816,16 +816,17 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * there's no need to track it separately.  pci_devres is initialized
  * when a device is enabled using managed PCI device enable interface.
  *
- * TODO: Struct pci_devres and find_pci_dr() only need to be here because
- * they're used in pci.c.  Port or move these functions to devres.c and
- * then remove them from here.
+ * TODO: Struct pci_devres only needs to be here because they're used in pci.c.
+ * Port or move these functions to devres.c and then remove them from here.
  */
 struct pci_devres {
-	unsigned int orig_intx:1;
-	unsigned int restore_intx:1;
+	/*
+	 * TODO:
+	 * This struct is now surplus. Remove it by refactoring pci/devres.c
+	 */
 };
 
-struct pci_devres *find_pci_dr(struct pci_dev *pdev);
+int pcim_intx(struct pci_dev *dev, int enable);
 
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
 int pcim_request_region_exclusive(struct pci_dev *pdev, int bar, const char *name);
-- 
2.45.0

