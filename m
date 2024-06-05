Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855BA8FC5CD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7808310E6FA;
	Wed,  5 Jun 2024 08:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HX5ARUGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D4210E6D3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADSvqA1AO3nQbqjqWDmd4LNpBLOwxbzjerhA1UP/7Ik=;
 b=HX5ARUGjMwI+XBXjom8Oh7PS1xRobrTzSds16P8UK3ohjUmDb59O59tp9XX9fiNeYfuGFN
 v0V7hqXg5VEs2Q+FY6phBSkRc8viXln+c7m98tci5iig9uYBVSd0juDEhMGXG46PdhYG6p
 I3fqG6CsT21+nwyU8iDyPRbge/MgscY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-CezT26dBOci1UsWBQ0I8-g-1; Wed, 05 Jun 2024 04:16:25 -0400
X-MC-Unique: CezT26dBOci1UsWBQ0I8-g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35e0f2512ddso240535f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575384; x=1718180184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADSvqA1AO3nQbqjqWDmd4LNpBLOwxbzjerhA1UP/7Ik=;
 b=mgtR/nQ4fcjsGv4NFPGAzdFUb1IclakdNAAomqkeb+ING6MPJcTAowhlaZLaDvf+sb
 6jt7xEZv99U1mrNuyzmHzP0vTM3BdEMHIcpNPD2MY3vNf2s9tcY0URoYtxczRczuzG0M
 T0n8WiPL+RyEN0SFTCcaGaNhMev8ClqzkzjXIoQVIB1WfjVlGQNJNhnAeFS+CNLAnsGJ
 ujIhDx5upRZOYQraJvCFqPY3kUm+KFHok8CGQur+Y2D33XO2ZTboeDLdvj6gihQ9zJ5r
 YvSTgh5lZbtcix0pRiHOb6VlIw3Vum6iOKyw5NV0NJ26hLBCUR/B3RILdp8xphC51GHU
 gm8g==
X-Gm-Message-State: AOJu0YyTiFjJ+r/2SeFtpkA+/nDMkKy5yywp1IOR4U6lzqkvzbqsddBu
 JWrOUSuMsX02ybkrXCnVWZOlZeUWSEX5Ek48I/3eQlyzFjdpIRrPTuf4I9xI914T2077cCSwIEC
 6mcb9taKnzgvIqYX1I4awoOcfm2NgVLj+HrsszkeDo2xWSqmkIKXozJ1Ka16TWLRo6A==
X-Received: by 2002:a5d:4a8f:0:b0:354:fa0d:1423 with SMTP id
 ffacd0b85a97d-35e840559afmr1138370f8f.2.1717575384543; 
 Wed, 05 Jun 2024 01:16:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYXXYRwMmc/wItTwuhNim5zt2S5LTm7hN7b8qr/oaCOGVDkg9BBwyql/IirFuwik1TYGpeQ==
X-Received: by 2002:a5d:4a8f:0:b0:354:fa0d:1423 with SMTP id
 ffacd0b85a97d-35e840559afmr1138356f8f.2.1717575384289; 
 Wed, 05 Jun 2024 01:16:24 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:23 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 08/13] PCI: Move pinned status bit to struct pci_dev
Date: Wed,  5 Jun 2024 10:16:00 +0200
Message-ID: <20240605081605.18769-10-pstanner@redhat.com>
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
 include/linux/pci.h  |  5 +++--
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index ea590caf8995..936369face4b 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -398,7 +398,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (!this->pinned)
+	if (!dev->pinned)
 		pci_disable_device(dev);
 }
 
@@ -454,18 +454,12 @@ EXPORT_SYMBOL(pcim_enable_device);
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
index e223e0f7dada..ff439dd05200 100644
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
index 110548f00b3b..3104c0238a42 100644
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
2.45.0

