Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D752A8FC5C6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0355210E6DF;
	Wed,  5 Jun 2024 08:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MOVMaM85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6E10E715
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEB31yOtYoIre4MIRkuOCh7GA8J//awJNnm4ltdU4bo=;
 b=MOVMaM85oz0vm7Xs/76zzZ4oa5O/4yQt+hnj8HOMe4U67LNf7zSHc3Omz2swCxqLSikHDP
 +IavFb7VvMi/9KGgTXQ0+EDFihwg/NO9cQpGVEywLhGhhvKu5gVarF9sjJ9fyrGA+HMzGm
 o/pc4Xa5qmIKB0MW3BEUp8Qb+i2uAVc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-EWwZchi9OJKwJHRs5ZAKhg-1; Wed, 05 Jun 2024 04:16:24 -0400
X-MC-Unique: EWwZchi9OJKwJHRs5ZAKhg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35dc02bfc28so390623f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575383; x=1718180183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEB31yOtYoIre4MIRkuOCh7GA8J//awJNnm4ltdU4bo=;
 b=DFKQydSYO6Gch9K7G4DjjoNqe0aMS24yHYLVsCcqWk4ffv57gBnh0P4xw1xtgnE6FX
 piIRrAHxw2ifezvbyu3IS8uD/hRpGXQymBrDevOZlG3ofhllvyJ+GoPewZYZAmYbBr/q
 HEXIpus9fvcZrGb3+lSJ/wfVjHxFDQZPYZygr2BuP6NW6jxoY7Y404n+m7gQuxfsEdfc
 GE4P0AQ+i7BLoDTeBOw0v965AA6yvUpTf6Hk4DOeh2IHX88HDkrsr+XCRyQjeoi7xvPX
 OmOUdyDegbnKbdltzUuzOdqkYHr/BEZIOf7lHNPPM4SkPJhhhg1CXjIcn5bNUf2kP9B4
 EkIA==
X-Gm-Message-State: AOJu0Yzz6OWnkDtXOFb0yJYdK4aspFKB/ouF7jMCXftDXm/l5XdYj3ae
 SjMKTzoWn83mqIZjN5SvkGxzkbD3Bdd316MrwE+WfnLLrl7SlJfn4egEPZCiMQc/zm9gRhROqIb
 5li7IusSxWy1WIdCKsOviFAmFigmVYdNSEtlFmMJSdBICZeXbiTkrbd7coQ7m2zbJjQ==
X-Received: by 2002:a5d:58e5:0:b0:354:fa7d:dcf5 with SMTP id
 ffacd0b85a97d-35e83fd7bcdmr1226781f8f.0.1717575383546; 
 Wed, 05 Jun 2024 01:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6YjKkvVSUFoGcDbJ+SMXSxLwos65XaniDE58RD/+F87WgYW7Zh+OCWAsYEUg9t6JsH1PI+Q==
X-Received: by 2002:a5d:58e5:0:b0:354:fa7d:dcf5 with SMTP id
 ffacd0b85a97d-35e83fd7bcdmr1226764f8f.0.1717575383238; 
 Wed, 05 Jun 2024 01:16:23 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:22 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 07/13] PCI: Move dev-enabled status bit to struct pci_dev
Date: Wed,  5 Jun 2024 10:15:59 +0200
Message-ID: <20240605081605.18769-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240605081605.18769-2-pstanner@redhat.com>
References: <20240605081605.18769-2-pstanner@redhat.com>
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

The bit describing whether the PCI device is currently enabled is stored
in struct pci_devres. Besides this struct being subject of a cleanup
process, struct pci_device is in general the right place to store this
information, since it is not devres-specific.

Move the 'enabled' boolean bit to struct pci_dev.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 11 ++++-------
 drivers/pci/pci.c    | 17 ++++++++++-------
 drivers/pci/pci.h    |  1 -
 include/linux/pci.h  |  1 +
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 572a4e193879..ea590caf8995 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -398,7 +398,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (this->enabled && !this->pinned)
+	if (!this->pinned)
 		pci_disable_device(dev);
 }
 
@@ -441,14 +441,11 @@ int pcim_enable_device(struct pci_dev *pdev)
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
@@ -466,7 +463,7 @@ void pcim_pin_device(struct pci_dev *pdev)
 	struct pci_devres *dr;
 
 	dr = find_pci_dr(pdev);
-	WARN_ON(!dr || !dr->enabled);
+	WARN_ON(!dr || !pdev->enabled);
 	if (dr)
 		dr->pinned = 1;
 }
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8dd711b9a291..04accdfab7ce 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2011,6 +2011,9 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	u16 cmd;
 	u8 pin;
 
+	if (dev->enabled)
+		return 0;
+
 	err = pci_set_power_state(dev, PCI_D0);
 	if (err < 0 && err != -EIO)
 		return err;
@@ -2025,7 +2028,7 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	pci_fixup_device(pci_fixup_enable, dev);
 
 	if (dev->msi_enabled || dev->msix_enabled)
-		return 0;
+		goto success_out;
 
 	pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
 	if (pin) {
@@ -2035,6 +2038,8 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 					      cmd & ~PCI_COMMAND_INTX_DISABLE);
 	}
 
+success_out:
+	dev->enabled = true;
 	return 0;
 }
 
@@ -2193,6 +2198,9 @@ static void do_pci_disable_device(struct pci_dev *dev)
 {
 	u16 pci_command;
 
+	if (!dev->enabled)
+		return;
+
 	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
 	if (pci_command & PCI_COMMAND_MASTER) {
 		pci_command &= ~PCI_COMMAND_MASTER;
@@ -2200,6 +2208,7 @@ static void do_pci_disable_device(struct pci_dev *dev)
 	}
 
 	pcibios_disable_device(dev);
+	dev->enabled = false;
 }
 
 /**
@@ -2227,12 +2236,6 @@ void pci_disable_enabled_device(struct pci_dev *dev)
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
index 9fd50bc99e6b..e223e0f7dada 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -823,7 +823,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * then remove them from here.
  */
 struct pci_devres {
-	unsigned int enabled:1;
 	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 16493426a04f..110548f00b3b 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -367,6 +367,7 @@ struct pci_dev {
 					   this is D0-D3, D0 being fully
 					   functional, and D3 being off. */
 	u8		pm_cap;		/* PM capability offset */
+	unsigned int	enabled:1;	/* Whether this dev is enabled */
 	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
 	unsigned int	pme_support:5;	/* Bitmask of states from which PME#
 					   can be generated */
-- 
2.45.0

