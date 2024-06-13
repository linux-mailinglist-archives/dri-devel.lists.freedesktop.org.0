Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A2906C85
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72D210EA52;
	Thu, 13 Jun 2024 11:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZzWhVW/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F8010EA42
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViBYsK7r7YHaCmYfaljCmdF+x2qktzp5uILOcoPl4ng=;
 b=ZzWhVW/FdvvT/MS1TSfFOgcb+941i27aYRKRCoEC5zQekIXV50eUi8/fwpKr4DWYIVhiGW
 AoGidn2sEEyeJtjFDGQt/zHK07Vd/GetyHHvVgb3i2lt7WXt/mVKmBrsekMXUo2tndJHdY
 hKDl3IowJdTpoYTbW3Vjwc1VkmPAU2g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-0YbZbTlVNG2C4xLYMRtjcQ-1; Thu, 13 Jun 2024 07:50:51 -0400
X-MC-Unique: 0YbZbTlVNG2C4xLYMRtjcQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-421920de031so1547445e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279450; x=1718884250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ViBYsK7r7YHaCmYfaljCmdF+x2qktzp5uILOcoPl4ng=;
 b=Na8TCBaOR5jc7IdfzxMnXDIaWBKZaKp9uHs4Bogqqn7brXofyN0jYFlG98CdOXYNAA
 1RPQc+t8WiX1XygW3kEcPZv+3PJYXOfrwiB8eGNqKuLmFxdhx4Y7ExiX0NVYUGAjdZIE
 FmsfAdBEPovtDeVfUjpXgkuYsDGnxPn0UzcPi+d2PJEbk+dLHYCsR87NcR5Gk6YmUlug
 drXuDCm6h48c/mG1rgMXertkxy3VTQlXJ3Maq0inbwfwOItvUZFq1fgaSr4HTxoFudOk
 jWOtAwk45POsTeJq7oDf4kPi5Y0YTp/6JAkSP8c+mYZ4hoz5EycWnEEqA+e+zTCSYREv
 UWxw==
X-Gm-Message-State: AOJu0YyKNzljIUEcPVXpcm3s/nss5V504Q+KthU4kRMJd1yv36jLBRw5
 pkkfJEPIBVpKL085kItWAZrUKKbHTr3T5cjjA8LqCqfhwOyQLDEra+f6uolanDIdGxaqonMNaU3
 IougVIKK8rA3eavtpS6TEi72+jOV8RJz3o1iKf/d3RlovberohbJseiRHKM19HQEGBA==
X-Received: by 2002:a05:6000:4023:b0:35f:2fd3:85d5 with SMTP id
 ffacd0b85a97d-36079a472f1mr168571f8f.3.1718279450572; 
 Thu, 13 Jun 2024 04:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBBfx4nYnLD/abQa3JiWhpHQ7DZlbaL9/HZMDFVCmtO64CnJnRENAa7IHgBrFFdGtk0NJd5w==
X-Received: by 2002:a05:6000:4023:b0:35f:2fd3:85d5 with SMTP id
 ffacd0b85a97d-36079a472f1mr168552f8f.3.1718279450264; 
 Thu, 13 Jun 2024 04:50:50 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:49 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 05/13] PCI: Make devres region requests consistent
Date: Thu, 13 Jun 2024 13:50:18 +0200
Message-ID: <20240613115032.29098-6-pstanner@redhat.com>
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
index 5ecffc7424ed..d90bed785c3f 100644
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

