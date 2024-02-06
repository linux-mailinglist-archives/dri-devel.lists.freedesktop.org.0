Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479F84B69E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBEE112C00;
	Tue,  6 Feb 2024 13:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Yp+G9MV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA24E112BF7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707226840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQlpJfDup+dDGOwPHLvFIbkEOafdDPtlHCm5JScFyak=;
 b=Yp+G9MV8SwL58jQzIOZvsrz8+MwSjpkiJlnB9DDLZX7OSfEDnuCJ4WZblTqqRp3JVPT7pN
 atsb6XRLY4JJSAPMKvvvTHQsvRuRyn4bjQ/Tgq7E9bUSVmrlYlzdtC0S953zkxtWjwvynS
 8pH9NOz1TVlkg9g3Cn9XkX7NCi9VrD4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-PomD3qFYMbKy5uu0STd7iA-1; Tue, 06 Feb 2024 08:40:39 -0500
X-MC-Unique: PomD3qFYMbKy5uu0STd7iA-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-59a95f8618dso909617eaf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226838; x=1707831638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JQlpJfDup+dDGOwPHLvFIbkEOafdDPtlHCm5JScFyak=;
 b=pZbLqNqRMOksJGdUyii36x0PxN+xhfSsUNo7YcR5bZmshnTD5jtFgZrnib+qGeHXOC
 BFjxNyGqNdjZnZ8o9dDwezrWEFX+Bko9sDtm+RGYY2qedv6i29wwVQT8KXNVvVDYRUMo
 Dq2YlhP0MaGFuA3wyDV4McwfxWQCb6gS1grbkJ2J4ChKoqE+LvVXDgEEya8w5mtqInpZ
 /WjNYun85NoXjweoGILj4s9yvt59+BGylMsZ8S2N4CdLQtB2mA0OPzXpVVt1Oq+uqS20
 yhh9RQlhQlHe+1yn8JxMPye8qskxchPvDqbDL+jtD+1zmXZd79Ugomc0XsNh+oZKyYJr
 xCtA==
X-Gm-Message-State: AOJu0YwRCgdAepioww/4CwG8MwznRBTQ+OhijvFgyYqqrivQwLvdxu7j
 7XaqaxG6BJWyPNXTxsAGDEVmcAIHK23QPnWPrdEbewUzQ0fpM99IbT0S84iTOQ75pUYlOn8pCwA
 Z1/M9QWee3/5yL3eAW1ym5UQP0BZQ0+XtEIhU0m3qyP5LMdV8UvvAH3t8byFPbJYsYw==
X-Received: by 2002:a4a:a446:0:b0:599:e8ff:66d9 with SMTP id
 w6-20020a4aa446000000b00599e8ff66d9mr2755247ool.1.1707226838483; 
 Tue, 06 Feb 2024 05:40:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzyrKpPHzyW118htPu1nhrMh6GnhdDlpezvBTokm6fHEqEfzz/t8tkRkaytr88g7f6ijVFcQ==
X-Received: by 2002:a4a:a446:0:b0:599:e8ff:66d9 with SMTP id
 w6-20020a4aa446000000b00599e8ff66d9mr2755229ool.1.1707226838133; 
 Tue, 06 Feb 2024 05:40:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWU+2Py4oVZMn22mLfoM2xIqMZc/38FGSw2MgLnBY8Wr2BUEuzhQHfvNKHm3WFoodpY+EXTDq1RYZu0W1BMZkdvaqzuTQZT/DY4WwXuLmAvrSxdSVcd19JLtSLh68IMMTJhkbpU+D0ENxZWqk37knbLlUmMWYQpVBmDbaMf3QVOhm91V68H0cClZGtgS0+pA9CKC5czCOAUPDkCGSj0jIlX1nWMlz61FxCIncnPcBb4oHwfnZ4HeRX86Ou2IVSNktBhJ/smPmsYuLHgZzFZN0dohpJPlT/U2+5AvEeALNhHXGg/LxBc6ZlMweJeqlLZctMfp9RE64qtd2qoMAEduXBz9OTid2jbtNFzyIPiZJ0hiXxKTOcaGz29nch7GtKZLr5+l4lx
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b0078544c8be9asm903791qkn.87.2024.02.06.05.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:40:37 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v3 04/10] PCI: Make devres region requests consistent
Date: Tue,  6 Feb 2024 14:39:50 +0100
Message-ID: <20240206134000.23561-6-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206134000.23561-2-pstanner@redhat.com>
References: <20240206134000.23561-2-pstanner@redhat.com>
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
implementation of the hybrid-functions which are only sometimes managed
can be made more consistent and readable by wrapping those
always-managed functions.

Implement a new pcim_ function for exclusively requested regions.
Have the pci_request / release functions call their pcim_ counterparts.
Remove the now surplus region_mask from struct pci_devres.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 49 ++++++++++++++++++++++---------------------
 drivers/pci/pci.c    | 50 +++++++++++++++-----------------------------
 drivers/pci/pci.h    |  6 ------
 include/linux/pci.h  |  1 +
 4 files changed, 43 insertions(+), 63 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 724429ab4f64..a0e8e47b2de9 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -22,18 +22,15 @@
  *    _sometimes_ managed (e.g. pci_request_region()).
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
@@ -399,21 +396,6 @@ static void pcim_release(struct device *gendev, void *res)
 {
 	struct pci_dev *dev = to_pci_dev(gendev);
 	struct pci_devres *this = res;
-	int i;
-
-	/*
-	 * This is legacy code.
-	 * All regions requested by a pcim_ function do get released through
-	 * pcim_addr_resource_release(). Thanks to the hybrid nature of the pci_
-	 * region-request functions, this for-loop has to release the regions
-	 * if they have been requested by such a function.
-	 *
-	 * TODO: Remove this once all users of pcim_enable_device() PLUS
-	 * pci-region-request-functions have been ported to pcim_ functions.
-	 */
-	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
-		if (this->region_mask & (1 << i))
-			pci_release_region(dev, i);
 
 	if (this->mwi)
 		pci_clear_mwi(dev);
@@ -968,6 +950,25 @@ int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
 }
 EXPORT_SYMBOL(pcim_request_region);
 
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
+EXPORT_SYMBOL(pcim_request_region_exclusive);
+
 /**
  * pcim_release_region - Release a PCI BAR
  * @pdev: PCI device to operate on
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 5c8bca2c5945..c919f85a269d 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3935,7 +3935,15 @@ EXPORT_SYMBOL_GPL(pci_common_swizzle);
  */
 void pci_release_region(struct pci_dev *pdev, int bar)
 {
-	struct pci_devres *dr;
+	/*
+	 * This is done for backwards compatibility, because the old pci-devres
+	 * API had a mode in which the function became managed if it had been
+	 * enabled with pcim_enable_device() instead of pci_enable_device().
+	 */
+	if (pci_is_managed(pdev)) {
+		pcim_release_region(pdev, bar);
+		return;
+	}
 
 	if (pci_resource_len(pdev, bar) == 0)
 		return;
@@ -3945,20 +3953,6 @@ void pci_release_region(struct pci_dev *pdev, int bar)
 	else if (pci_resource_flags(pdev, bar) & IORESOURCE_MEM)
 		release_mem_region(pci_resource_start(pdev, bar),
 				pci_resource_len(pdev, bar));
-
-	/*
-	 * This devres utility makes this function sometimes managed
-	 * (when pcim_enable_device() has been called before).
-	 * This is bad because it conflicts with the pcim_ functions being
-	 * exclusively responsible for managed pci. Its "sometimes yes, sometimes
-	 * no" nature can cause bugs.
-	 *
-	 * TODO: Remove this once all users that use pcim_enable_device() PLUS
-	 * a region request function have been ported to using pcim_ functions.
-	 */
-	dr = find_pci_dr(pdev);
-	if (dr)
-		dr->region_mask &= ~(1 << bar);
 }
 EXPORT_SYMBOL(pci_release_region);
 
@@ -3986,14 +3980,18 @@ EXPORT_SYMBOL(pci_release_region);
  * NOTE:
  * This is a "hybrid" function: Its normally unmanaged, but becomes managed
  * when pcim_enable_device() has been called in advance.
- * This hybrid feature is DEPRECATED! If you need to implement a new pci
- * function that does automatic cleanup, write a new pcim_* function that uses
- * devres directly.
+ * This hybrid feature is DEPRECATED! If you want managed cleanup, use the
+ * pcim_* functions instead.
  */
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
@@ -4009,20 +4007,6 @@ static int __pci_request_region(struct pci_dev *pdev, int bar,
 			goto err_out;
 	}
 
-	/*
-	 * This devres utility makes this function sometimes managed
-	 * (when pcim_enable_device() has been called before).
-	 * This is bad because it conflicts with the pcim_ functions being
-	 * exclusively responsible for managed pci. Its "sometimes yes, sometimes
-	 * no" nature can cause bugs.
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
index 4883be71e40c..f5944e3cb7fb 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -816,12 +816,6 @@ struct pci_devres {
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
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 04a0065974e5..83a683a1f4e5 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2325,6 +2325,7 @@ int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask);
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *res_name);
+int pcim_request_region_exclusive(struct pci_dev *pdev, int bar, const char *name);
 void pcim_release_region(struct pci_dev *pdev, int bar);
 void pcim_release_all_regions(struct pci_dev *pdev);
 int pcim_request_all_regions(struct pci_dev *pdev, const char *name);
-- 
2.43.0

