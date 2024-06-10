Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DACA901E39
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D91310E3F0;
	Mon, 10 Jun 2024 09:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S7tWIJ1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B9310E3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzRgXuNR+5R6UFNTz4a6dQ6zzeQCJg+lenadNGYN7bg=;
 b=S7tWIJ1efWDQH7QnAsz02iTPC3XopsEhCENgy6S/387GRVbdIvg+qVyOP6GMU6AQaSF1h4
 tqz3JPDDpPn4+kChJdvzn8TLHGU6wJq2eW7g0nVtJHLJp+bmcimY2Cy98zGz2cxTHaNhgC
 K7Z/5KLG4dHN2cP6G3OP0Gz7+pkRUVQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-CBmU1HhuMFmKoqlhCNNqww-1; Mon, 10 Jun 2024 05:32:06 -0400
X-MC-Unique: CBmU1HhuMFmKoqlhCNNqww-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4218118d1efso1915115e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011925; x=1718616725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzRgXuNR+5R6UFNTz4a6dQ6zzeQCJg+lenadNGYN7bg=;
 b=DDionGdmGeKDII5nd8cORL4BvLnVI+PODZUGpF0SoDjwBirAfR4ZGA3j4cmpLP4usz
 Nbe/xLn2gPnr1z0F/IZ/408bcwArZzhPLtmxtYx4mvvBymNPHXgI7AjcO5/k49WjvrgS
 /uJKI6HyBBW0WRmjY4KKEq+4BTfBR8LvdR2cdTcfn3iIug4VoQoMEZARl5bprPI/A5he
 o0qKLMIQUBMGY30jLYsvPiqzoZ4pd/hXTVnx1lLc+PNB+OnzHXbOmHLC39S3z89XaLiD
 /7l4lJHJHypkNE3fVKlzeVhOUJuZFKB6xT82Y9ukPvpqzyjdgtCPs/GAuqfOpYuJBEHh
 5sLA==
X-Gm-Message-State: AOJu0YzUnu3dFv3P6+YQ+igZwBVgyYqQHnSFM8IUeFHM6wujtwV5kCaW
 qHLPD8IrLHodZvyxvPIQmZi+1eMMbyuQEUlMy9Ev/FhrlsKI+xtQ7LBdcq4+lSP6DjVsmvWq8N9
 tBJEl3xYRaeoXU6/S8WgKrUkop9iYPEI2tHZbXY5uN+zkKX77JiVerY+eMxENp0hGpQ==
X-Received: by 2002:a05:6000:2a1:b0:35f:2287:7b97 with SMTP id
 ffacd0b85a97d-35f22877d54mr1983939f8f.4.1718011925305; 
 Mon, 10 Jun 2024 02:32:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnJj+pjvnt6EbKvh468//5k+11F9WXb809fPmNpxRIYhVMOIHvE6nxXbo9J+kfKJh1cgO5QA==
X-Received: by 2002:a05:6000:2a1:b0:35f:2287:7b97 with SMTP id
 ffacd0b85a97d-35f22877d54mr1983925f8f.4.1718011924931; 
 Mon, 10 Jun 2024 02:32:04 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:04 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 05/13] PCI: Make devres region requests consistent
Date: Mon, 10 Jun 2024 11:31:27 +0200
Message-ID: <20240610093149.20640-6-pstanner@redhat.com>
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

Now that pure managed region request functions are available, the
implementation of the hybrid-functions which are only sometimes managed can
be made more consistent and readable by wrapping those always-managed
functions.

Implement pcim_request_region_exclusive() as a PCI-internal helper.  Have
the PCI request / release functions call their pcim_ counterparts.  Remove
the now surplus region_mask from struct pci_devres.

Link: https://lore.kernel.org/r/20240605081605.18769-7-pstanner@redhat.com
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/devres.c | 53 ++++++++++++++++++++++----------------------
 drivers/pci/pci.c    | 47 +++++++++++++--------------------------
 drivers/pci/pci.h    | 10 ++++-----
 3 files changed, 45 insertions(+), 65 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 54b10f5433ab..f2a1250c0679 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -24,18 +24,15 @@
  *
  *    Consequently, in the new API, region requests performed by the pcim_
  *    functions are automatically cleaned up through the devres callback
- *    pcim_addr_resource_release(), while requests performed by
- *    pcim_enable_device() + pci_*region*() are automatically cleaned up
- *    through the for-loop in pcim_release().
+ *    pcim_addr_resource_release().
+ *    Users utilizing pcim_enable_device() + pci_*region*() are redirected in
+ *    pci.c to the managed functions here in this file. This isn't exactly
+ *    perfect, but the only alternative way would be to port ALL drivers using
+ *    said combination to pcim_ functions.
  *
- * TODO 1:
+ * TODO:
  * Remove the legacy table entirely once all calls to pcim_iomap_table() in
  * the kernel have been removed.
- *
- * TODO 2:
- * Port everyone calling pcim_enable_device() + pci_*region*() to using the
- * pcim_ functions. Then, remove all devres functionality from pci_*region*()
- * functions and remove the associated cleanups described above in point #2.
  */
 
 /*
@@ -399,22 +396,6 @@ static void pcim_release(struct device *gendev, void *res)
 {
 	struct pci_dev *dev = to_pci_dev(gendev);
 	struct pci_devres *this = res;
-	int i;
-
-	/*
-	 * This is legacy code.
-	 *
-	 * All regions requested by a pcim_ function do get released through
-	 * pcim_addr_resource_release(). Thanks to the hybrid nature of the pci_
-	 * region-request functions, this for-loop has to release the regions
-	 * if they have been requested by such a function.
-	 *
-	 * TODO: Remove this once all users of pcim_enable_device() PLUS
-	 * pci-region-request-functions have been ported to pcim_ functions.
-	 */
-	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
-		if (mask_contains_bar(this->region_mask, i))
-			pci_release_region(dev, i);
 
 	if (this->mwi)
 		pci_clear_mwi(dev);
@@ -823,11 +804,29 @@ static int _pcim_request_region(struct pci_dev *pdev, int bar, const char *name,
  * The region will automatically be released on driver detach. If desired,
  * release manually only with pcim_release_region().
  */
-static int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
+int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
 {
 	return _pcim_request_region(pdev, bar, name, 0);
 }
 
+/**
+ * pcim_request_region_exclusive - Request a PCI BAR exclusively
+ * @pdev: PCI device to requestion region for
+ * @bar: Index of BAR to request
+ * @name: Name associated with the request
+ *
+ * Returns: 0 on success, a negative error code on failure.
+ *
+ * Request region specified by @bar exclusively.
+ *
+ * The region will automatically be released on driver detach. If desired,
+ * release manually only with pcim_release_region().
+ */
+int pcim_request_region_exclusive(struct pci_dev *pdev, int bar, const char *name)
+{
+	return _pcim_request_region(pdev, bar, name, IORESOURCE_EXCLUSIVE);
+}
+
 /**
  * pcim_release_region - Release a PCI BAR
  * @pdev: PCI device to operate on
@@ -836,7 +835,7 @@ static int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
  * Release a region manually that was previously requested by
  * pcim_request_region().
  */
-static void pcim_release_region(struct pci_dev *pdev, int bar)
+void pcim_release_region(struct pci_dev *pdev, int bar)
 {
 	struct pcim_addr_devres res_searched;
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d94445f5f882..7013699db242 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3872,7 +3872,15 @@ EXPORT_SYMBOL(pci_enable_atomic_ops_to_root);
  */
 void pci_release_region(struct pci_dev *pdev, int bar)
 {
-	struct pci_devres *dr;
+	/*
+	 * This is done for backwards compatibility, because the old PCI devres
+	 * API had a mode in which the function became managed if it had been
+	 * enabled with pcim_enable_device() instead of pci_enable_device().
+	 */
+	if (pci_is_managed(pdev)) {
+		pcim_release_region(pdev, bar);
+		return;
+	}
 
 	if (pci_resource_len(pdev, bar) == 0)
 		return;
@@ -3882,21 +3890,6 @@ void pci_release_region(struct pci_dev *pdev, int bar)
 	else if (pci_resource_flags(pdev, bar) & IORESOURCE_MEM)
 		release_mem_region(pci_resource_start(pdev, bar),
 				pci_resource_len(pdev, bar));
-
-	/*
-	 * This devres utility makes this function sometimes managed
-	 * (when pcim_enable_device() has been called before).
-	 *
-	 * This is bad because it conflicts with the pcim_ functions being
-	 * exclusively responsible for managed PCI. Its "sometimes yes,
-	 * sometimes no" nature can cause bugs.
-	 *
-	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
-	 * a region request function have been ported to using pcim_ functions.
-	 */
-	dr = find_pci_dr(pdev);
-	if (dr)
-		dr->region_mask &= ~(1 << bar);
 }
 EXPORT_SYMBOL(pci_release_region);
 
@@ -3922,7 +3915,12 @@ EXPORT_SYMBOL(pci_release_region);
 static int __pci_request_region(struct pci_dev *pdev, int bar,
 				const char *res_name, int exclusive)
 {
-	struct pci_devres *dr;
+	if (pci_is_managed(pdev)) {
+		if (exclusive == IORESOURCE_EXCLUSIVE)
+			return pcim_request_region_exclusive(pdev, bar, res_name);
+
+		return pcim_request_region(pdev, bar, res_name);
+	}
 
 	if (pci_resource_len(pdev, bar) == 0)
 		return 0;
@@ -3938,21 +3936,6 @@ static int __pci_request_region(struct pci_dev *pdev, int bar,
 			goto err_out;
 	}
 
-	/*
-	 * This devres utility makes this function sometimes managed
-	 * (when pcim_enable_device() has been called before).
-	 *
-	 * This is bad because it conflicts with the pcim_ functions being
-	 * exclusively responsible for managed pci. Its "sometimes yes,
-	 * sometimes no" nature can cause bugs.
-	 *
-	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
-	 * a region request function have been ported to using pcim_ functions.
-	 */
-	dr = find_pci_dr(pdev);
-	if (dr)
-		dr->region_mask |= 1 << bar;
-
 	return 0;
 
 err_out:
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index c09487f5550c..2403c5a0ff7a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -826,16 +826,14 @@ struct pci_devres {
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
 	unsigned int mwi:1;
-
-	/*
-	 * TODO: remove the region_mask once everyone calling
-	 * pcim_enable_device() + pci_*region*() is ported to pcim_ functions.
-	 */
-	u32 region_mask;
 };
 
 struct pci_devres *find_pci_dr(struct pci_dev *pdev);
 
+int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
+int pcim_request_region_exclusive(struct pci_dev *pdev, int bar, const char *name);
+void pcim_release_region(struct pci_dev *pdev, int bar);
+
 /*
  * Config Address for PCI Configuration Mechanism #1
  *
-- 
2.45.0

