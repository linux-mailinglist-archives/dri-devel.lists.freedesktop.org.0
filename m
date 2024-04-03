Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07F68967A9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13991127B3;
	Wed,  3 Apr 2024 08:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="exW6HzKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9498F1127A4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712131655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BoLOksgDfWbI16hyJ8yDaTAy/N4I72F11fYMQTrJEvk=;
 b=exW6HzKVUlVRREL/eK+ZebSOjE37bqjihLIsHtCsr5CN9KrsfGprIf0dI20NT4hfNDWoP2
 9eRhgfY4Iw2YeYpfoIJkSSpBIZ+G9obxDmIka2SsajfxMEoOxb9wuLceUajhtaSnrZyTJw
 1u7ZYxgMPCNd8ysxEqi/xgXXVCfv3JM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-6HkndhaoP9aZGNzoLWz3jg-1; Wed, 03 Apr 2024 04:07:34 -0400
X-MC-Unique: 6HkndhaoP9aZGNzoLWz3jg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-34370209778so339212f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 01:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712131653; x=1712736453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BoLOksgDfWbI16hyJ8yDaTAy/N4I72F11fYMQTrJEvk=;
 b=HoVWCrTeJr/Ul6v+hOD/kDBxh+IwAdVdB6/+lb6+2JQaEBTgTVf/y4cFGpQnsMl5FY
 tfGdmue5S6F28LK8Yc8NYKwh/+dT/WNhkQeG+Mndx/i3yb8DX0GU2xC0HzO+zzAYDSq1
 +Tf9VIxMhJz1CYsta5uvZy2V35DPzumONRX8LcpsWSiMB1zNN4N4YaidzKy8uWEqPYNJ
 qibIu3KsXWS2z6jITOi4iIKMzFYf2fJhbM6VZT4LVNrDJwI3etomg2aUnhJWZ8pkAGDF
 Dmt2CAVECcho7L75K8eEw12Dh14aTja2od7lui6j/nucVfSEGkDoovoJHyIdyHl7FsNz
 Msow==
X-Gm-Message-State: AOJu0YyTYivfW1GEuADsRROWVoCiZpdT0+cyi0xIljnh8kV7eMIUPAek
 +wHt9aHmHID/rzgiI88QAvE/xHoYxGHHvUfIvQcJFrpViI8kGOSw6ssAdww7EmBhW4HKQJtGsrt
 r3EvRBalbIS4sPJxzjOEgp4ou/9PDFhaS6dX0ewsqRGNvsqedLSZZajkNizMVE0ih9g==
X-Received: by 2002:a05:600c:5114:b0:414:8084:a2e7 with SMTP id
 o20-20020a05600c511400b004148084a2e7mr11598687wms.4.1712131653213; 
 Wed, 03 Apr 2024 01:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL1OZqcpCT4lUdvpXOXJzFl5uup5f2oesW1up00E+QvTRHiJaEGrozTM68bu2J6Gv2ppGWaQ==
X-Received: by 2002:a05:600c:5114:b0:414:8084:a2e7 with SMTP id
 o20-20020a05600c511400b004148084a2e7mr11598671wms.4.1712131652967; 
 Wed, 03 Apr 2024 01:07:32 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 fa14-20020a05600c518e00b004159df274d5sm5504535wmb.6.2024.04.03.01.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:07:32 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v5 06/10] PCI: Move pinned status bit to struct pci_dev
Date: Wed,  3 Apr 2024 10:07:07 +0200
Message-ID: <20240403080712.13986-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403080712.13986-2-pstanner@redhat.com>
References: <20240403080712.13986-2-pstanner@redhat.com>
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
index 2b6c0df133bf..a080efd69e85 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -823,7 +823,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * then remove them from here.
  */
 struct pci_devres {
-	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
 	unsigned int mwi:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 95cdd1bc73c4..9d85d2181083 100644
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
2.44.0

