Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF08901E3D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFED10E3F5;
	Mon, 10 Jun 2024 09:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V4hyDU/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF0610E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YC1P2jDfqZ/b0bhQ66lkvDoa/VkJd5IY0GIkzmrgRyA=;
 b=V4hyDU/nHW1prKK7aXdbm8GDFFAl8Le8qamP+4+y0EcXfmSJ/KdBKIcWDJPraiOiw59P7u
 tlHmqHLx+Nv+ck2JjnXQFC/7w8Bx6+JBLOij8w9anGGMoBRgtXs2yhBoLNEqQBfRHAHBJz
 s+JpUTqyMTKtsnNpPyjSxwzMtP80sBg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-2kpXv1P9OICyh7uVY6Vdew-1; Mon, 10 Jun 2024 05:32:09 -0400
X-MC-Unique: 2kpXv1P9OICyh7uVY6Vdew-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4212974c99eso3872795e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011928; x=1718616728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YC1P2jDfqZ/b0bhQ66lkvDoa/VkJd5IY0GIkzmrgRyA=;
 b=HDH6CiQxrHblifHiyzpqwmUlEJ3TygKO6DC0LGSyUn0kuIkfhMgH/4n98GxDKZ5inJ
 ZOxNFRsiRXD+B/DdOa0BgHokucxHxwNArYuYac1lHlQL9nUcGkqTOXkIOIEZcW26VIxE
 7KFg0csrkuggO3Oxj7XaY44IgCbp0suBikSc0j82UZ5iaphoi3xsSakWfZT4qstCbgHc
 aNfGYIZhDwZYPAniGI/FqpufO/4zawVBXdfzyjRSMP4JLkZMKLG+8tQ1Aa2rY4H2yC8h
 hBLeFGhArfJPr2Tn4wQ+dhJjMTOVvIknQp/J6oYB7Zw2BIRlZ7SvO5Yy1PoiwKEvbGNf
 2YGA==
X-Gm-Message-State: AOJu0Yz5ZPm2pd4ygzV3Sej/ndRsoCEAXTut87GfHOYKDIhC5/Et6SQs
 1dS6T0dOiKSxN0JYwhuHYr5oQmYPVsjHu7Mn344a9DuvbFC4VuiosiI0SZ6crCuNyx/Jdxin27b
 BQMZij/prv3MmjbX5GuIRX7GpNKGl/xQm8SF75vq31ZXFcJscQ2gxxgE01CoI3E1ozQ==
X-Received: by 2002:a5d:6c65:0:b0:354:fa7d:dcf5 with SMTP id
 ffacd0b85a97d-35efea7e189mr6469037f8f.0.1718011928181; 
 Mon, 10 Jun 2024 02:32:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVJwLx4/C+jduwDhQw/dzOe6oYBT02eJHjQK+Qoax/SQHHf7G+cPrhRcc8vOfgRdZ1mMl4TQ==
X-Received: by 2002:a5d:6c65:0:b0:354:fa7d:dcf5 with SMTP id
 ffacd0b85a97d-35efea7e189mr6469015f8f.0.1718011927762; 
 Mon, 10 Jun 2024 02:32:07 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:07 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 08/13] PCI: Move pinned status bit to struct pci_dev
Date: Mon, 10 Jun 2024 11:31:30 +0200
Message-ID: <20240610093149.20640-9-pstanner@redhat.com>
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

The bit describing whether the PCI device is currently pinned is stored
in struct pci_devres. To clean up and simplify the PCI devres API, it's
better if this information is stored in struct pci_dev.

This will later permit simplifying pcim_enable_device().

Move the 'pinned' boolean bit to struct pci_dev.

Restructure bits in struct pci_dev so the pm / pme fields are next to
each other.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 14 ++++----------
 drivers/pci/pci.h    |  1 -
 include/linux/pci.h  |  4 +++-
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 9d25940ce260..2696baef5c2c 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -403,7 +403,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (pci_is_enabled(dev) && !this->pinned)
+	if (pci_is_enabled(dev) && !dev->pinned)
 		pci_disable_device(dev);
 }
 
@@ -459,18 +459,12 @@ EXPORT_SYMBOL(pcim_enable_device);
  * pcim_pin_device - Pin managed PCI device
  * @pdev: PCI device to pin
  *
- * Pin managed PCI device @pdev.  Pinned device won't be disabled on
- * driver detach.  @pdev must have been enabled with
- * pcim_enable_device().
+ * Pin managed PCI device @pdev. Pinned device won't be disabled on driver
+ * detach. @pdev must have been enabled with pcim_enable_device().
  */
 void pcim_pin_device(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
-
-	dr = find_pci_dr(pdev);
-	WARN_ON(!dr || !pci_is_enabled(pdev));
-	if (dr)
-		dr->pinned = 1;
+	pdev->pinned = true;
 }
 EXPORT_SYMBOL(pcim_pin_device);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index d7f00b43b098..6e02ba1b5947 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -821,7 +821,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * then remove them from here.
  */
 struct pci_devres {
-	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
 	unsigned int mwi:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index fb004fd4e889..cc9247f78158 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -367,10 +367,12 @@ struct pci_dev {
 					   this is D0-D3, D0 being fully
 					   functional, and D3 being off. */
 	u8		pm_cap;		/* PM capability offset */
-	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
 	unsigned int	pme_support:5;	/* Bitmask of states from which PME#
 					   can be generated */
 	unsigned int	pme_poll:1;	/* Poll device's PME status bit */
+	unsigned int	enabled:1;	/* Whether this dev is enabled */
+	unsigned int	pinned:1;	/* Whether this dev is pinned */
+	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
 	unsigned int	d1_support:1;	/* Low power state D1 is supported */
 	unsigned int	d2_support:1;	/* Low power state D2 is supported */
 	unsigned int	no_d1d2:1;	/* D1 and D2 are forbidden */
-- 
2.45.0

