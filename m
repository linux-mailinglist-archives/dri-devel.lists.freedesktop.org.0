Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA939901E45
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ACC10E3F8;
	Mon, 10 Jun 2024 09:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RM7nPcJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FEA10E3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8U3rxW1s1YIVMSUu9ZuPsxLMiEiJVd/mP29b/0kZtc=;
 b=RM7nPcJe82Y4hvN13h9+Rkk0YKRP9/9xqh9ieuKord8EjilC1SYKYV1Ugah1OyYkFZGeHi
 BV5GeErfEKDVGs/ulCNO98SfqML2//QSCfi9DHsfIe8mCPpHu5mUMXR7heapbW2rOrx17n
 LmVMAnLr61ehOAr1Xag09QQRILE1p50=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-86ddR6YvPsSVpi1f14dtGg-1; Mon, 10 Jun 2024 05:32:08 -0400
X-MC-Unique: 86ddR6YvPsSVpi1f14dtGg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4218118d1efso1915205e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011927; x=1718616727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8U3rxW1s1YIVMSUu9ZuPsxLMiEiJVd/mP29b/0kZtc=;
 b=jEmNpdhOmyPkpjHDemGJ8Gmfssg0IxlgdYSzofG4H9b7cfpouKyT/0cP0eCHSTVpvD
 Yh+5FY+UTRNdfxbxonCrajqup2EalCVSsWe5s4L6MYVynJFFBog9qfpdfm3mGzueNRSQ
 dsuDdpI4kQVfKP4y4HkZH2TGClseXDwyTfV8PkAjogSQ06q8Q4rPmkBSgY8kCD5wEmE3
 C1b9Lfrs/xN8rVR4Nv3/BSfB5CyQwb4jk4ReiJAiw5g3kQnPwVru+l9Zam9gd09kAUQA
 1EzmLXqPGdOJ4/rWPk7+slzESYzAs8IKItHbem9QzzQX9ZaQZgkAGTVlXK5bbN80dQap
 otkg==
X-Gm-Message-State: AOJu0Yz2E55W30UkaOqeS8vQT6CEip3tbWEpWyM0ppXBF3MxLs/cuBuu
 vEJYh8CIDe5EYmKvr+tzjYGiF3+zfKWEEXInpH+obb8QY9TYJhLhLms9wDW0r8fy20n6jwXet+G
 K9z4h7GuUrn02XaHkQ+z5dSxweolvOsZ4tpjKhe2hk7SjZ/KFH8oP6+UtZwb5cayA7A==
X-Received: by 2002:a5d:5988:0:b0:35f:1b2f:8697 with SMTP id
 ffacd0b85a97d-35f1b2f890amr3471330f8f.1.1718011927084; 
 Mon, 10 Jun 2024 02:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqdCkgAR+1q+z4vuNJAhn568KdHv5oS6P7/Q9rNnLG+Le3g8tuihyGLjdodx7ImjfadRMULg==
X-Received: by 2002:a5d:5988:0:b0:35f:1b2f:8697 with SMTP id
 ffacd0b85a97d-35f1b2f890amr3471320f8f.1.1718011926842; 
 Mon, 10 Jun 2024 02:32:06 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:06 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 07/13] PCI: Remove enabled status bit from pci_devres
Date: Mon, 10 Jun 2024 11:31:29 +0200
Message-ID: <20240610093149.20640-8-pstanner@redhat.com>
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

The PCI devres implementation has a separate boolean to track whether a
device is enabled. However, that can easily be tracked through the
function pci_is_enabled() which is agnostic.

Using it allows for simplifying the PCI devres implementation.

Replace the separate 'enabled' status bit from struct pci_devres with
calls to pci_is_enabled() at the appropriate places.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 11 ++++-------
 drivers/pci/pci.c    |  6 ------
 drivers/pci/pci.h    |  1 -
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index f2a1250c0679..9d25940ce260 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -403,7 +403,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (this->enabled && !this->pinned)
+	if (pci_is_enabled(dev) && !this->pinned)
 		pci_disable_device(dev);
 }
 
@@ -446,14 +446,11 @@ int pcim_enable_device(struct pci_dev *pdev)
 	dr = get_pci_dr(pdev);
 	if (unlikely(!dr))
 		return -ENOMEM;
-	if (dr->enabled)
-		return 0;
 
 	rc = pci_enable_device(pdev);
-	if (!rc) {
+	if (!rc)
 		pdev->is_managed = 1;
-		dr->enabled = 1;
-	}
+
 	return rc;
 }
 EXPORT_SYMBOL(pcim_enable_device);
@@ -471,7 +468,7 @@ void pcim_pin_device(struct pci_dev *pdev)
 	struct pci_devres *dr;
 
 	dr = find_pci_dr(pdev);
-	WARN_ON(!dr || !dr->enabled);
+	WARN_ON(!dr || !pci_is_enabled(pdev));
 	if (dr)
 		dr->pinned = 1;
 }
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 5e4f377411ec..db2cc48f3d63 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2218,12 +2218,6 @@ void pci_disable_enabled_device(struct pci_dev *dev)
  */
 void pci_disable_device(struct pci_dev *dev)
 {
-	struct pci_devres *dr;
-
-	dr = find_pci_dr(dev);
-	if (dr)
-		dr->enabled = 0;
-
 	dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
 		      "disabling already-disabled device");
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 2403c5a0ff7a..d7f00b43b098 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -821,7 +821,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * then remove them from here.
  */
 struct pci_devres {
-	unsigned int enabled:1;
 	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
-- 
2.45.0

