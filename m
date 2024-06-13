Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F7906C89
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1B510EA57;
	Thu, 13 Jun 2024 11:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g1obZeU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF2810EA4D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVfgCjKnb7mN7tw6g3EsRXSFrlAe3Q6EtTbj0A26jHk=;
 b=g1obZeU6ItKzI+66Jkg1fGSgvdAx3oay6RSy8jWuhUdbm51F4rewt/9Pav5tPtL7tvxBut
 IaaBkEKnrLFrqir8QAJpHZLFjFFU7mhO+NKeAjkcjT6BFVzJpLIX6yatUvDxo8n7cK8UeQ
 nshmCrSCr9lPLhGdgELxLWHnxzneWJ8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-r6fy3vdrNVC-JHVtL6tQAA-1; Thu, 13 Jun 2024 07:50:55 -0400
X-MC-Unique: r6fy3vdrNVC-JHVtL6tQAA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ebf477ed09so1445311fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279454; x=1718884254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVfgCjKnb7mN7tw6g3EsRXSFrlAe3Q6EtTbj0A26jHk=;
 b=XjCQZTVv1CZlF3Wii62ewQtxVY5Li//cck9zlgXKDnPXJfue3FP2HOp3FT8zbrdWgL
 vP1U9xIb10AstbecjzDxW3npuETduz4NnuUCgrFro6LagdhXBrnUXgAShSv7iiXbPff1
 wpWg17HgpR6w79P09+K//J7yrFTySkiwA5Kw4fCLG7tSptnhcEOOPY91u+xTuf1UM3sv
 FJ62s2ZArf+ft2H2N9/ysuYgL5kbh/KMf+f0wXV2SR94T5jXU+c+7k2NfgC8MQKga2ZW
 kfn+jiyk64tvYQxzDkBND3et5oQ9BmPvPl98HvK64BQnfK+5d0LS/ST+IAdKDlp7n+zd
 8FqA==
X-Gm-Message-State: AOJu0YwZq+MkRFuLghu2LuoqJsFOVqeKiePWRn1DXzYM+O4Cim0RiN7t
 zXpA6utRcsiJRd8Fftb2qA8rjDhnA0+bUIDskcCBZ2Dy/ggXmK89CIdyDZDu8o8P252Cs9pYxYe
 Tvk0d76Kzp/eHBZAuf0CVZwMhgGVRkAcmcrwVG6uCotwrTlDUW2a7OjnBEeDy8ON6wQ==
X-Received: by 2002:a05:6512:ac3:b0:52c:9e80:387a with SMTP id
 2adb3069b0e04-52ca59e9d11mr72162e87.0.1718279453800; 
 Thu, 13 Jun 2024 04:50:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3dSZsb8l1qGTBxCy/CxpKhrwqSIxs3fGuB9Mz5Llia8E6mlHaM5OG7LJkgO+LSWP5CNnfZA==
X-Received: by 2002:a05:6512:ac3:b0:52c:9e80:387a with SMTP id
 2adb3069b0e04-52ca59e9d11mr72136e87.0.1718279453401; 
 Thu, 13 Jun 2024 04:50:53 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:53 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 08/13] PCI: Move pinned status bit to struct pci_dev
Date: Thu, 13 Jun 2024 13:50:21 +0200
Message-ID: <20240613115032.29098-9-pstanner@redhat.com>
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
 include/linux/pci.h  |  3 ++-
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 643e3a94a1d6..84caa0034813 100644
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
index fb004fd4e889..0c19f0717899 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -367,10 +367,11 @@ struct pci_dev {
 					   this is D0-D3, D0 being fully
 					   functional, and D3 being off. */
 	u8		pm_cap;		/* PM capability offset */
-	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
 	unsigned int	pme_support:5;	/* Bitmask of states from which PME#
 					   can be generated */
 	unsigned int	pme_poll:1;	/* Poll device's PME status bit */
+	unsigned int	pinned:1;	/* Whether this dev is pinned */
+	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
 	unsigned int	d1_support:1;	/* Low power state D1 is supported */
 	unsigned int	d2_support:1;	/* Low power state D2 is supported */
 	unsigned int	no_d1d2:1;	/* D1 and D2 are forbidden */
-- 
2.45.0

