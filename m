Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C622E838A9F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405F010E151;
	Tue, 23 Jan 2024 09:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0910E72E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706003098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJOcERA6WkIGWk0k/QFxozz5e8Wq1nBqoQjIfxjRAsE=;
 b=g4E1o2DwvEZabAT0/ohEq0A3uMvVma34i64xF+LA0nlJBXQk1D3wTwaURgC/ptMgD4StzU
 oa/RkSENip3iPmTDKrictisRwwtUiEttvzUbRigqsIlyz55SazA+HgC2euPz06tulPJJbm
 WG+vnd7L6s7/kf5yfLq4NSpLHCUajOQ=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-ENEieMEKMryr8tgJEa5ZbQ-1; Tue, 23 Jan 2024 04:44:56 -0500
X-MC-Unique: ENEieMEKMryr8tgJEa5ZbQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-469c0622932so183450137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003096; x=1706607896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJOcERA6WkIGWk0k/QFxozz5e8Wq1nBqoQjIfxjRAsE=;
 b=t6hdIFjqbDgLZACYIS/mj23JCVJEpsYZHPvbW0l06wUUur5O+JDDz7vek4s9zwCW2o
 9SIU3UXwDlzjr+bL6zpQadg6SNAbyj5va2dPqTdBXfkww6iJtC+PYNTJZ6DFTplLoXYi
 yIY+rqo4hkiz6rx7i5HeWA+wWu0Bmg7dbdihCgs81J+dzq/oznsrWzOQ21Tt2GkjSjqN
 pzBQoX/ZnTzCjeTRWLydb8pm/3nDQcdvTS0kT2KxsMGEjhSSV7MsHXkVrpaajPXxRW7S
 mv3T6K73dlGwNoHhm7Bxiz2Y1+YAjrpGS0C4HPDJIVcX5p72osHn30p2G7z7eqtPvo/H
 tG9Q==
X-Gm-Message-State: AOJu0YxMoK37ynjY8htjmLqYlK2PwM4S6uA0keAp6W9x6KWSLjmh0E91
 RVX8Oo0hw2pVfqQGl6SC1/ooSxa4PH5PFDODZs8ESCrZbr4sTDW0OcdfuK+Riz9y5nyjhyeIgFH
 AOZ0eWqkvLMkDxC5MQjd8W0klgprw/ZK5agDlEe05bYg70GO2ZlhfNCqxeOHGXTlg+w==
X-Received: by 2002:a05:6102:300f:b0:469:a5a6:6d0b with SMTP id
 s15-20020a056102300f00b00469a5a66d0bmr5387239vsa.0.1706003096237; 
 Tue, 23 Jan 2024 01:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfiHCQyTaU9QSY0mi169Dtu5iV731XTwQIfoBCycLdQ++32x8wjMJie+l0KlKJveytXiqnhA==
X-Received: by 2002:a05:6102:300f:b0:469:a5a6:6d0b with SMTP id
 s15-20020a056102300f00b00469a5a66d0bmr5387218vsa.0.1706003095921; 
 Tue, 23 Jan 2024 01:44:55 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:44:55 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH v2 05/10] PCI: move dev-enabled status bit to struct pci_dev
Date: Tue, 23 Jan 2024 10:43:02 +0100
Message-ID: <20240123094317.15958-6-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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
index 7bff17633bc4..696541c65c8f 100644
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
index eb3ec59e8822..ab8d66e05662 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1953,6 +1953,9 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	u16 cmd;
 	u8 pin;
 
+	if (dev->enabled)
+		return 0;
+
 	err = pci_set_power_state(dev, PCI_D0);
 	if (err < 0 && err != -EIO)
 		return err;
@@ -1967,7 +1970,7 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	pci_fixup_device(pci_fixup_enable, dev);
 
 	if (dev->msi_enabled || dev->msix_enabled)
-		return 0;
+		goto success_out;
 
 	pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin);
 	if (pin) {
@@ -1977,6 +1980,8 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 					      cmd & ~PCI_COMMAND_INTX_DISABLE);
 	}
 
+success_out:
+	dev->enabled = true;
 	return 0;
 }
 
@@ -2146,6 +2151,9 @@ static void do_pci_disable_device(struct pci_dev *dev)
 {
 	u16 pci_command;
 
+	if (!dev->enabled)
+		return;
+
 	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
 	if (pci_command & PCI_COMMAND_MASTER) {
 		pci_command &= ~PCI_COMMAND_MASTER;
@@ -2153,6 +2161,7 @@ static void do_pci_disable_device(struct pci_dev *dev)
 	}
 
 	pcibios_disable_device(dev);
+	dev->enabled = false;
 }
 
 /**
@@ -2180,12 +2189,6 @@ void pci_disable_enabled_device(struct pci_dev *dev)
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
index 7c2181677760..dbb76a3fb0e4 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -809,7 +809,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * when a device is enabled using managed PCI device enable interface.
  */
 struct pci_devres {
-	unsigned int enabled:1;
 	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 641ee30f7d2d..a356bdcc14cc 100644
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

