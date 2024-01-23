Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92B5838AA1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9718010E41D;
	Tue, 23 Jan 2024 09:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEBD10E736
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706003105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPaQbXk8XLEaVElIGgvAHXLJscVCCVhCxcSL8y0kSzA=;
 b=VyzEA0GZz66rT0vY7S/r8vUnNPjQKRQRJS05kbeGZRyiE/Y4NKeUKXQYlyNcBwHT26UlP9
 8hPCH2U016HfvMFSz7VJOv6vKCxSriDA/q95hR99hNk1nwFqYA4FJE1LNihTMxIi92MhbE
 iIW+inIxM9EUlXFKb4NqQOAQUoSVt+8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-vfK7Wrg3Ovab41jkzEEtGQ-1; Tue, 23 Jan 2024 04:45:03 -0500
X-MC-Unique: vfK7Wrg3Ovab41jkzEEtGQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-783ad358941so8545685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003103; x=1706607903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPaQbXk8XLEaVElIGgvAHXLJscVCCVhCxcSL8y0kSzA=;
 b=OzTntmUUZW0hZg7+nBKSU+zhgyIf3ILswcd4M71gYjksop2GrBMn3oGz2nuVOT5Umg
 qnEGnswEMARJVc+pkmEacity8YWy6z8m+Gl9+27VYqeMbN4UMYaUfeEFS0qyvTEB4PYT
 ZrTAze7v9XsFLz6Vz2HH+Edj98Ji50Wy4ULAxKjc9vRTZt72vAu83u8aMtZFKxjNeRYi
 m13Lc4V8LId3KbSnUNeSVrrXh42qRFT0V/vL2fs5RhLVlu+AZwAZgdV/0c6b+W+a371K
 QXIKAcpVVg/eIwBTkbLZEYFmxKMmhSvYitLtToNxW5/5BUL7UAUIRsC34Mz43bfCWb3A
 gEAA==
X-Gm-Message-State: AOJu0Yw1Oh536UVhF6Hqi2Y2ZHSQFuu+txobU11e6oYWKg5iRvhbC+ob
 B9DIJdviLQeqKmZy7vZdMNcTeOz76fOz+3FTAXBoVN0BFuKSbfV26E1WVuvUKRM4xI/CdJ9771Y
 a0HWwlDPpzGwtlO1VCCFtAUwJD6UISB7jHq24Ho8nXQejv3HdmfhUhUpvWF8ELfG1yw==
X-Received: by 2002:a05:6214:f26:b0:685:7cfd:34eb with SMTP id
 iw6-20020a0562140f2600b006857cfd34ebmr9324905qvb.4.1706003103120; 
 Tue, 23 Jan 2024 01:45:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtcDj2ng1o0t8y8DdObSU32+uI7sQsarbF6v7QkK54odso969HOgDvhCFed+0S/Tvhd8Mu/g==
X-Received: by 2002:a05:6214:f26:b0:685:7cfd:34eb with SMTP id
 iw6-20020a0562140f2600b006857cfd34ebmr9324885qvb.4.1706003102866; 
 Tue, 23 Jan 2024 01:45:02 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:45:02 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH v2 08/10] PCI: give pci(m)_intx its own devres callback
Date: Tue, 23 Jan 2024 10:43:05 +0100
Message-ID: <20240123094317.15958-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pci_intx() is one of the functions that have "hybrid mode" (i.e.,
sometimes managed, sometimes not). Providing a separate pcim_intx()
function with its own device resource and cleanup callback allows for
removing further large parts of the legacy pci-devres implementation.

As in the region-request-functions, pci_intx() has to call into its
managed counterpart for backwards compatibility.

As pci_intx() is an outdated function, pcim_intx() shall not be made
visible to other drivers via a public API.

Implement pcim_intx() with its own device resource.
Make pci_intx() call pcim_intx() in the managed case.
Remove the struct pci_devres from pci.h.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 76 ++++++++++++++++++++++++++++++++++----------
 drivers/pci/pci.c    | 24 +++++++-------
 drivers/pci/pci.h    | 21 +++---------
 3 files changed, 77 insertions(+), 44 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index d396d672a6f4..4314d0863282 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -40,6 +40,11 @@ struct pcim_iomap_devres {
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
@@ -401,31 +406,70 @@ int pcim_set_mwi(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_set_mwi);
 
+static void pcim_intx_restore(struct device *dev, void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pcim_intx_devres *res = data;
 
-static void pcim_release(struct device *gendev, void *res)
+	pci_intx(pdev, res->orig_intx);
+}
+
+static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
 {
-	struct pci_dev *dev = to_pci_dev(gendev);
-	struct pci_devres *this = res;
+	struct pcim_intx_devres *res;
 
-	if (this->restore_intx)
-		pci_intx(dev, this->orig_intx);
+	res = devres_find(dev, pcim_intx_restore, NULL, NULL);
+	if (res)
+		return res;
 
-	if (!dev->pinned)
-		pci_disable_device(dev);
+	res = devres_alloc(pcim_intx_restore, sizeof(*res), GFP_KERNEL);
+	if (res)
+		devres_add(dev, res);
+
+	return res;
 }
 
-/*
- * TODO:
- * Once the last four callers in pci.c are ported, this function here needs to
- * be made static again.
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
+	if (!dev->pinned)
+		pci_disable_device(dev);
 }
-EXPORT_SYMBOL(find_pci_dr);
 
 static struct pci_devres *get_pci_dr(struct pci_dev *pdev)
 {
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ab8d66e05662..323d5b52f669 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3877,7 +3877,7 @@ EXPORT_SYMBOL_GPL(pci_common_swizzle);
 void pci_release_region(struct pci_dev *pdev, int bar)
 {
 	/*
-	 * This is done for backwards compatibility, because the old pci-devres
+	 * This is done for backwards compatibility, because the old PCI devres
 	 * API had a mode in which the function became managed if it had been
 	 * enabled with pcim_enable_device() instead of pci_enable_device().
 	 */
@@ -4465,11 +4465,22 @@ void pci_disable_parity(struct pci_dev *dev)
  * This is a "hybrid" function: Its normally unmanaged, but becomes managed
  * when pcim_enable_device() has been called in advance.
  * This hybrid feature is DEPRECATED!
+ * Use pcim_intx() if you need a managed version.
  */
 void pci_intx(struct pci_dev *pdev, int enable)
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
@@ -4477,17 +4488,8 @@ void pci_intx(struct pci_dev *pdev, int enable)
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
index 667bfdd61d5e..e6d4b81ff09e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -796,24 +796,11 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 #endif
 
 /*
- * TODO:
- * The following two components wouldn't need to be here if they weren't used at
- * four last places in pci.c
- * Port or move these functions to devres.c and then remove the
- * pci_devres-components from this header file here.
+ * This is a helper that shall only ever be called by pci_intx(). It helps
+ * cleaning up the PCI devres API in which pci_intx() became a managed function
+ * under certain conditions.
  */
-/*
- * Managed PCI resources.  This manages device on/off, INTx/MSI/MSI-X
- * on/off and BAR regions.  pci_dev itself records MSI/MSI-X status, so
- * there's no need to track it separately.  pci_devres is initialized
- * when a device is enabled using managed PCI device enable interface.
- */
-struct pci_devres {
-	unsigned int orig_intx:1;
-	unsigned int restore_intx:1;
-};
-
-struct pci_devres *find_pci_dr(struct pci_dev *pdev);
+int pcim_intx(struct pci_dev *dev, int enable);
 
 /*
  * Config Address for PCI Configuration Mechanism #1
-- 
2.43.0

