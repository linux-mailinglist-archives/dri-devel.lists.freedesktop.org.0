Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76C86E04C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F2910ECAD;
	Fri,  1 Mar 2024 11:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eLcNlOT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5050D10ECAD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 11:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709292624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivdu8iiMoXpDkyzYV+DyKD6eGNB0PhvUs/32A1olwX8=;
 b=eLcNlOT21/wPtVCG1ZnscAaEbL8Q/4ipl8GZIwQ2cOHokVKZ9pvlVaR4o99klSNDWhnhOg
 jHUl59uye1Ws5HBrd4PRMAYpNl8stw00or5H3VKOZOBn1LcnQcd/B9XAb1gmYKn/vR5mLc
 YJQledrq/PLqVWJ16ZfcHGMtdKtWnVA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-OD1hx5CWPUKUJcJrkJ8jKA-1; Fri, 01 Mar 2024 06:30:23 -0500
X-MC-Unique: OD1hx5CWPUKUJcJrkJ8jKA-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3c1aba536a1so155398b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 03:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709292622; x=1709897422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivdu8iiMoXpDkyzYV+DyKD6eGNB0PhvUs/32A1olwX8=;
 b=OAGHgOkGgGsXnNepqdnlQ6T09tCbO3U0U4zL4h1Ml2OXLMP53Kucfy3zDZs+PPzfUG
 iCnEzLMk6Vi+c/yrpUymXJj9TT1CIvV8sE0ellTiK4afH5t6l6UGro6BcALwk203NaqZ
 AHbZD9Kt78iTV4RrpRdvbQg2icaWU6eKaYi/L8Ui3ki3p3BA1h2dNmT6ZHuGy4YkGLnH
 +1eTX/6764zmIIhaXTbuNVsXNK4HkWEOsComSApW3IlLWSxwWwcCBHaaRBrPeFdE6vPR
 OrAoLDT0YMuVZw810w8gzsizurmEPUUT2KrrO/s0TZWTVy2huk7RZYZKnB0q1qJn+Kw5
 Gx3A==
X-Gm-Message-State: AOJu0YySU/zs9pypTJBEoDNJzoFOpGToDv+6kgGV156IeOeVvr2VMPax
 YvEgG327arMLdOkIj5VWY0tQRo0wt8p5mi2zKYOgaevNrnPCEczDApm8CT5OvQDqGY1gb96KVBe
 vDN0iBhE2CZNy8X0aeez96uukCt2EmNiAiDclDe93d5nK4VkTVHiFmaCaqK6IIkJ90w==
X-Received: by 2002:a05:6870:1b89:b0:21e:be91:ae48 with SMTP id
 hm9-20020a0568701b8900b0021ebe91ae48mr1406133oab.1.1709292622695; 
 Fri, 01 Mar 2024 03:30:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8ckx+w8g4Wwwu8eFQ5kKdvTt+sQ5kL9bsz1OBV7fqZNxqMuodycq5A8JPNFFAp2o3NusiBQ==
X-Received: by 2002:a05:6870:1b89:b0:21e:be91:ae48 with SMTP id
 hm9-20020a0568701b8900b0021ebe91ae48mr1406108oab.1.1709292622384; 
 Fri, 01 Mar 2024 03:30:22 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac86781000000b0042eb46d15bbsm1596239qtp.88.2024.03.01.03.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 03:30:22 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v4 06/10] PCI: Move pinned status bit to struct pci_dev
Date: Fri,  1 Mar 2024 12:29:54 +0100
Message-ID: <20240301112959.21947-7-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301112959.21947-1-pstanner@redhat.com>
References: <20240301112959.21947-1-pstanner@redhat.com>
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
better if this information is stored in struct pci_dev, because it
allows for checking that device's pinned-status directly through
struct pci_dev.

This will later permit simplifying  pcim_enable_device().

Move the 'pinned' boolean bit to struct pci_dev.

Restructure bits in struct pci_dev so the pm / pme fields are next to
each other.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 14 ++++----------
 drivers/pci/pci.h    |  1 -
 include/linux/pci.h  |  5 +++--
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 6bf93c6cbb66..076362740791 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -403,7 +403,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (!this->pinned)
+	if (!dev->pinned)
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
-	WARN_ON(!dr || !pdev->enabled);
-	if (dr)
-		dr->pinned = 1;
+	pdev->pinned = true;
 }
 EXPORT_SYMBOL(pcim_pin_device);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 97bd1c074d26..0a4220aa303e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -825,7 +825,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * then remove them from here.
  */
 struct pci_devres {
-	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
 	unsigned int mwi:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index f29c9289b378..fdf579e0d6ec 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -367,11 +367,12 @@ struct pci_dev {
 					   this is D0-D3, D0 being fully
 					   functional, and D3 being off. */
 	u8		pm_cap;		/* PM capability offset */
-	unsigned int	enabled:1;	/* Whether this dev is enabled */
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
2.43.0

