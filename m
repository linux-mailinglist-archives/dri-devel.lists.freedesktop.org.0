Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3912901E41
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54010E3EE;
	Mon, 10 Jun 2024 09:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZHYvfUgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428CF10E3F8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYVaQkWqZSrx/i/zySmVb2SXxUjFViRl1HRUPLR6DN4=;
 b=ZHYvfUgZcs/aYDGFWX7fkh/jVJ05hr0uidWfXCKhFb2qU+gfAkspN0kD10jLCyzUJsfoDI
 S85T6E5D2e355rQZoNtWWnry8bcgzhzlU4064FXh9RaH7FNc+sCfTc18hQ2Vy3hFPcA2Ks
 bn0WqW4zxNK7YBpdNJY53hhKB4mqi5Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-zdTPC_Q8P8KP8nkJex2ONw-1; Mon, 10 Jun 2024 05:32:13 -0400
X-MC-Unique: zdTPC_Q8P8KP8nkJex2ONw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4217e21bcd4so1990635e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011931; x=1718616731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYVaQkWqZSrx/i/zySmVb2SXxUjFViRl1HRUPLR6DN4=;
 b=e2e/6LB+C1Tg70v+9QnjxJgBuZIaubtqJfsd2rLgPi7vIfY4LPsK0OhipEisZXpdSl
 5s8Av1QwptvjVPpkOotj34FDPtJ6i7eL7emjnssmtsyRb2V9dbBse8pR5LOPe0CsZCXZ
 9Hz4GcKDQzYFLNxeOChPRjoYzIdEUUKSijEKFGlUg58YzZylFI9KDQ7kkTC7DqWZpjNg
 RNmbudR8AqupvRZNf5upgQpZT79/2XkxPZmCnPJl4y5E5DzBNORBOy0Y0ZjE8NpIVq3x
 CA+R2YXfTh1i0FhYBn8418GQhdeHcaKpWi5s86rxBV3O9hFSl1RQE4nLcIPkJdooBHEf
 mkvA==
X-Gm-Message-State: AOJu0Yz1a7a1VMt5LkUld4n+1dcZBMWvPcj+ikhJyjJtU80YWbFj2r4P
 xpqb8+VN+IY9G8WKfi4KBT8k3kJyC1cL72dihTVY8pM5lda8x1wJTnejQP+xlhYj85DBeCCuKXX
 QSwOeMnn3oVQzXLM2knV7bOK5aR3n4evvkPB0rwvl1TkDfz/Q1drLCyLXjDXF1JpaOw==
X-Received: by 2002:a05:6000:1ac7:b0:35f:229e:9c6d with SMTP id
 ffacd0b85a97d-35f229e9eafmr2316701f8f.6.1718011931039; 
 Mon, 10 Jun 2024 02:32:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC5EISwyWHtH2eTnirfsjXBBnu5C7SW4kxtaGwTzx8vXOIkqsWX8QFdvGZWKIwJ9P9VX916w==
X-Received: by 2002:a05:6000:1ac7:b0:35f:229e:9c6d with SMTP id
 ffacd0b85a97d-35f229e9eafmr2316683f8f.6.1718011930743; 
 Mon, 10 Jun 2024 02:32:10 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:10 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 11/13] PCI: Remove legacy pcim_release()
Date: Mon, 10 Jun 2024 11:31:33 +0200
Message-ID: <20240610093149.20640-12-pstanner@redhat.com>
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

Thanks to preceding cleanup steps, pcim_release() is now not needed
anymore and can be replaced by pcim_disable_device(), which is the exact
counterpart to pcim_enable_device().

This permits removing further parts of the old PCI devres implementation.

Replace pcim_release() with pcim_disable_device().
Remove the now surplus function get_pci_dr().
Remove the struct pci_devres from pci.h.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 53 +++++++++++++++++++++-----------------------
 drivers/pci/pci.h    | 16 -------------
 2 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 0bb144fdb69b..e92a8802832f 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -465,48 +465,45 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 	return 0;
 }
 
-static void pcim_release(struct device *gendev, void *res)
+static void pcim_disable_device(void *pdev_raw)
 {
-	struct pci_dev *dev = to_pci_dev(gendev);
-
-	if (pci_is_enabled(dev) && !dev->pinned)
-		pci_disable_device(dev);
-}
-
-static struct pci_devres *get_pci_dr(struct pci_dev *pdev)
-{
-	struct pci_devres *dr, *new_dr;
-
-	dr = devres_find(&pdev->dev, pcim_release, NULL, NULL);
-	if (dr)
-		return dr;
+	struct pci_dev *pdev = pdev_raw;
 
-	new_dr = devres_alloc(pcim_release, sizeof(*new_dr), GFP_KERNEL);
-	if (!new_dr)
-		return NULL;
-	return devres_get(&pdev->dev, new_dr, NULL, NULL);
+	if (!pdev->pinned)
+		pci_disable_device(pdev);
 }
 
 /**
  * pcim_enable_device - Managed pci_enable_device()
  * @pdev: PCI device to be initialized
  *
- * Managed pci_enable_device().
+ * Returns: 0 on success, negative error code on failure.
+ *
+ * Managed pci_enable_device(). Device will automatically be disabled on
+ * driver detach.
  */
 int pcim_enable_device(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
-	int rc;
+	int ret;
 
-	dr = get_pci_dr(pdev);
-	if (unlikely(!dr))
-		return -ENOMEM;
+	ret = devm_add_action(&pdev->dev, pcim_disable_device, pdev);
+	if (ret != 0)
+		return ret;
 
-	rc = pci_enable_device(pdev);
-	if (!rc)
-		pdev->is_managed = 1;
+	/*
+	 * We prefer removing the action in case of an error over
+	 * devm_add_action_or_reset() because the later could theoretically be
+	 * disturbed by users having pinned the device too soon.
+	 */
+	ret = pci_enable_device(pdev);
+	if (ret != 0) {
+		devm_remove_action(&pdev->dev, pcim_disable_device, pdev);
+		return ret;
+	}
 
-	return rc;
+	pdev->is_managed = true;
+
+	return ret;
 }
 EXPORT_SYMBOL(pcim_enable_device);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9e87528f1157..e51e6fa79fcc 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -810,22 +810,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 }
 #endif
 
-/*
- * Managed PCI resources.  This manages device on/off, INTx/MSI/MSI-X
- * on/off and BAR regions.  pci_dev itself records MSI/MSI-X status, so
- * there's no need to track it separately.  pci_devres is initialized
- * when a device is enabled using managed PCI device enable interface.
- *
- * TODO: Struct pci_devres only needs to be here because they're used in pci.c.
- * Port or move these functions to devres.c and then remove them from here.
- */
-struct pci_devres {
-	/*
-	 * TODO:
-	 * This struct is now surplus. Remove it by refactoring pci/devres.c
-	 */
-};
-
 int pcim_intx(struct pci_dev *dev, int enable);
 
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
-- 
2.45.0

