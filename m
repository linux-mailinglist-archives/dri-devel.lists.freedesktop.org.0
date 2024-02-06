Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15DE84B6A0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E67112BEC;
	Tue,  6 Feb 2024 13:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VuE58d94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD0112BEC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707226847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9Jq7nnvSUuT+9XIHZBABjxVtcpsKSdKyI5Paa1Y+pE=;
 b=VuE58d94MZY6KTnP3/ZhxP+WtPNFmMbc75fwf+oaQWyV0eNorqhX64Ug73J1hb0hS6MnOv
 msNdh/UnWtGVkgTft9A7FsnAyZRR1a9JYS0+mnhzbrgfOiUryXJ/tp36vFIBO5tsSimPEW
 xFNZ4/tsbkARAvgj4GS32poCAhEyWDU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-z7y-vEflNDmlZcrKIK8C8g-1; Tue, 06 Feb 2024 08:40:45 -0500
X-MC-Unique: z7y-vEflNDmlZcrKIK8C8g-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-78356ddf3cfso293214685a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226845; x=1707831645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9Jq7nnvSUuT+9XIHZBABjxVtcpsKSdKyI5Paa1Y+pE=;
 b=f6JxS8ZiSs23rA/cXs0Ls3W42abLAbca+W2kixRF5jRf3x4KYIXQsSssdOcF/bminC
 lYKqUgeFWQFR0WxVtY9BR9MmCtDQhL/qPylEVUhjtN5rrgmQQLDBzUU2rqLB+8NKXo4W
 mf9/G0Cs/hAbYHxmn3gYVQsj4gYwUSEK4Yg/Pxv284xmGh5F/rmDjcshok9npuBD8OPg
 DwyFMFtgtHZNwFhMlfODAj7OZus2tR+YJtGCL7OvVwrGHpemktAY4mGxBzMGuip4AHSd
 VgJtidw4tFoGkPjucy5SIFf/oFS9UvcedYH8+1kukVY/Hk4n+rfFhx5qRHi9VL8/A3eP
 sjrA==
X-Gm-Message-State: AOJu0YxDzISugxDRu2dIYSj0sxJJKIXfPE0YgalVXhQmlA6gAOnQZJ6B
 EDtPklwHJ0IWKQZs864Hkukd8p7jWyxTxW5LGtD/BiKyBCSV4c1RNOdPm4JVQ/Iru6TNsIxHcyx
 kSSMF09s86Cvb5JX5zzOR+oHagJicg3Lqq50bVco8jTtrW5KphDe4NCPjK/STOByDtA==
X-Received: by 2002:a05:620a:460f:b0:785:8aa0:a317 with SMTP id
 br15-20020a05620a460f00b007858aa0a317mr2924515qkb.0.1707226845437; 
 Tue, 06 Feb 2024 05:40:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGplv4rXaksSsn0IgLWcv3sZH7DfrcCyUE5bflBdaEXVGG5jWc8RYZFW2IA6Ml1nSK5zWnLrw==
X-Received: by 2002:a05:620a:460f:b0:785:8aa0:a317 with SMTP id
 br15-20020a05620a460f00b007858aa0a317mr2924486qkb.0.1707226845127; 
 Tue, 06 Feb 2024 05:40:45 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXN2QOuE+kU+UnrJ98Xqwnwk3jc22gdIjYBQVhbuoIxlt0r+kYzNbjiRtQA+Pf4Kq0oojmXSPzQFcepw46xsipquBkmG+gucNTra5EPE0xDkg6wEKhZac8+AJuJBBYi1IscHr724HN37Fy7kx4s+kheM102+jo8Y52kbocRFE6iQIeHfHcBQ5GAPFT3gHguujXDesRI24vTPC1DoVsyRCObqct21+YK9jhmGW/YaQDmRCp87zAzY36O4OAOl5YHAnbdEJN97bQwySadese6yBP74jPL0IeKBhHQa7ODzyXBlIbMgPS74tqO7r4ujuY0GquxM9pyL2dXfBoFN+3tDHFuAP1sEL12WA7GoJBj/AoFXEJiHed/fJduPr6GjtaeIHy4xziV
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b0078544c8be9asm903791qkn.87.2024.02.06.05.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:40:43 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v3 06/10] PCI: Move pinned status bit to struct pci_dev
Date: Tue,  6 Feb 2024 14:39:52 +0100
Message-ID: <20240206134000.23561-8-pstanner@redhat.com>
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
index 3d84f13ec9b7..628cde665e77 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -403,7 +403,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (!this->pinned)
+	if (!dev->pinned)
 		pci_disable_device(dev);
 }
 
@@ -461,18 +461,12 @@ EXPORT_SYMBOL(pcim_enable_device);
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
index 9038d7c822ae..586b2047c275 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -811,7 +811,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * when a device is enabled using managed PCI device enable interface.
  */
 struct pci_devres {
-	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
 	unsigned int mwi:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index f3ed3ee6b9c4..3d8e75a8b3f6 100644
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

