Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA084B69F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2CD112BF2;
	Tue,  6 Feb 2024 13:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dqgnaPw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E7A112BF2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707226842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3QB4wa/ZeBRooj+eB6dP6QJm1U/XuptG2DuaZLsRqk=;
 b=dqgnaPw4I4e0ock1JDCuWoVOy92FJU+R0GLclAqJBczZweAOS19sR1ltHf5obp7D/KmOUB
 0qYm34kN19U0nms5tmj6thJcVKrnqXN6YHXSigFOTLJVcx4zyPlhZcAfRcK8LmQWXdkG3R
 TDs1eF6x2ABM5x0hXJDWOIED4Um2DrY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-sa2eXd6BOamH2THoBF9dbA-1; Tue, 06 Feb 2024 08:40:41 -0500
X-MC-Unique: sa2eXd6BOamH2THoBF9dbA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-60482f88facso358727b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226841; x=1707831641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3QB4wa/ZeBRooj+eB6dP6QJm1U/XuptG2DuaZLsRqk=;
 b=Ldsy9HxFN23igYg/XZx2UeDFv5F5sg8JaMhtim+6HFu+cHxij6t5w3EaUj9Y9PY945
 /bq8gF3R0Gv5BGyLBszt2XxLV6WUQhhnxUqcvuk47rB59K9YR73J8kebfIHL3tWCNIRw
 5I38ww7BFkxFz/J6mpQhFRkT4I1bBaQKnE6LfbVmbcyFlnqbhHqUzg8BERJPqH8/N0se
 LKJIWb/N/N+tX1CZZcZFdLSedRVpfNyOTHyibW4xD4VQ4BpCu8z5yUBdeMH6elntl+48
 BIbEHlQuFKOxa9zAkKWhE4ZEEpQ4Ckfe6Ijosb2+aYGCsIQtJ3/5RaG3vv66xsxIt9yc
 RLQQ==
X-Gm-Message-State: AOJu0YxVm5dGuDVe2h85qjlOdM3n2GvGbIA6gYpVqYVozD3RFova33Up
 F6WfVmUXfwfPbh5O/1dz5AJDBpiEFEwDnbS5KvdxHeOU6W6bbTdQ/vv9XUh+JWdk2ECWllqdQyn
 4ssGeQIZMkuuJb87b32gryWf1zXlFm1NVg/RPhjiXcH1v2nuZjcL0/UYUflnNKclrmg==
X-Received: by 2002:a81:c542:0:b0:604:7ab0:dcc7 with SMTP id
 o2-20020a81c542000000b006047ab0dcc7mr1129891ywj.1.1707226841019; 
 Tue, 06 Feb 2024 05:40:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8/G4ktvjQYBWJ9XOMuvIr/+hFPsHHVcRV0pjyiDjiAIFKooshwXkqRfJAq7y8LqUPTyE38g==
X-Received: by 2002:a81:c542:0:b0:604:7ab0:dcc7 with SMTP id
 o2-20020a81c542000000b006047ab0dcc7mr1129872ywj.1.1707226840648; 
 Tue, 06 Feb 2024 05:40:40 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW4ChpH2LRg+my/aRS16W7LPb6AplmZo0EHMKniRUO0w+shgnOak1Q/IIGUrMQ8BLGe6fQuD5eR+frJ8KO2WcF+zxKo6oDfnwJapOv6j0mvLg6sZ9sVR4eUpwvpT/XPwucq4Bb/f/3XifcysR651YtpBhzZfIs0cUZ/pxFR7ktvEx73h0G1d6IBz1HbZ29T578T+GxMGw+fVvVnk+gsy3nqC0OfBtYSizlx5XHrYkOKUkeQ0xhQ2c2vIVAMhbwzfxNiqE3xyEmrzn+LXEu4GjPQMeYugVSrvjKxdrY/vQ9JoROMecA6h18RiX1MEV68WWWzIXMpoD1B2IfISEQLX0thVTyDJRZWLMpxZnXcKWMIOBFNhbRYyUYFe5+MbCfdLq3BJW+A
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b0078544c8be9asm903791qkn.87.2024.02.06.05.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:40:40 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v3 05/10] PCI: Move dev-enabled status bit to struct pci_dev
Date: Tue,  6 Feb 2024 14:39:51 +0100
Message-ID: <20240206134000.23561-7-pstanner@redhat.com>
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
index a0e8e47b2de9..3d84f13ec9b7 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -403,7 +403,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (this->enabled && !this->pinned)
+	if (!this->pinned)
 		pci_disable_device(dev);
 }
 
@@ -448,14 +448,11 @@ int pcim_enable_device(struct pci_dev *pdev)
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
@@ -473,7 +470,7 @@ void pcim_pin_device(struct pci_dev *pdev)
 	struct pci_devres *dr;
 
 	dr = find_pci_dr(pdev);
-	WARN_ON(!dr || !dr->enabled);
+	WARN_ON(!dr || !pdev->enabled);
 	if (dr)
 		dr->pinned = 1;
 }
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index c919f85a269d..a6b5140fc6f6 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2013,6 +2013,9 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	u16 cmd;
 	u8 pin;
 
+	if (dev->enabled)
+		return 0;
+
 	err = pci_set_power_state(dev, PCI_D0);
 	if (err < 0 && err != -EIO)
 		return err;
@@ -2027,7 +2030,7 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	pci_fixup_device(pci_fixup_enable, dev);
 
 	if (dev->msi_enabled || dev->msix_enabled)
-		return 0;
+		goto success_out;
 
 	pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
 	if (pin) {
@@ -2037,6 +2040,8 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 					      cmd & ~PCI_COMMAND_INTX_DISABLE);
 	}
 
+success_out:
+	dev->enabled = true;
 	return 0;
 }
 
@@ -2206,6 +2211,9 @@ static void do_pci_disable_device(struct pci_dev *dev)
 {
 	u16 pci_command;
 
+	if (!dev->enabled)
+		return;
+
 	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
 	if (pci_command & PCI_COMMAND_MASTER) {
 		pci_command &= ~PCI_COMMAND_MASTER;
@@ -2213,6 +2221,7 @@ static void do_pci_disable_device(struct pci_dev *dev)
 	}
 
 	pcibios_disable_device(dev);
+	dev->enabled = false;
 }
 
 /**
@@ -2240,12 +2249,6 @@ void pci_disable_enabled_device(struct pci_dev *dev)
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
index f5944e3cb7fb..9038d7c822ae 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -811,7 +811,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * when a device is enabled using managed PCI device enable interface.
  */
 struct pci_devres {
-	unsigned int enabled:1;
 	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 83a683a1f4e5..f3ed3ee6b9c4 100644
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
2.43.0

