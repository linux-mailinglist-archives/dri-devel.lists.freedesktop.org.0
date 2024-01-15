Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC9282DBAF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 15:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5153910E301;
	Mon, 15 Jan 2024 14:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BBF10E301
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705330052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3vu21hkZlZsapFSJtp8nhKKQ/3OZTkpZfYIme9+49k=;
 b=Sg44nE4NTYepuXPKhVTedtOrtBUCtVtXmdBc5e4AV+7i3/BqsehhVuMcgxTwXEKGHBjAGm
 KLFm+pw4DzH/1SS/kjxDRxtQwzudgIyuoFg93ApUZ55dNCu1i1CADZW6rD+3Kvj3QodY8E
 kU1EhBxfBobZjLZxikXrkyh9g6l0WzM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-3ymTaK0cN3O2uAXnvT7VwA-1; Mon, 15 Jan 2024 09:47:26 -0500
X-MC-Unique: 3ymTaK0cN3O2uAXnvT7VwA-1
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-4b7bdc844fcso135151e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330046; x=1705934846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3vu21hkZlZsapFSJtp8nhKKQ/3OZTkpZfYIme9+49k=;
 b=obXOc+vgSklAC4qUBFuSiiKgU63i+HU1ew4iNoHe5hXVxdmXaUoBjJDGFs/3SJIpI5
 tAtXqbz3WmBvXvC/YxfJUQ+9IAXorqdtDQ0f/78qk4R2AhwzUR4PW8UHVxtcY2vj70p/
 w8flJJMOzr9u0y8IBUGX4LsTv/ZKR7+OVr4TO1RA/j6ebX3ubhuZCDHV0ceXbv1HkC+R
 31m3Pf8hrBBpj8gd4Uozbx+N2tS6aOkyX+zSQPt4glzDm1fc9GX6pz3eiu+ncM3cYBPZ
 Eeone2FfzNGaofQR4yME4zzpXse912KvIvcV3TeUCER7hK53/Krj4VDFgE9v/BZHgZS6
 KBnw==
X-Gm-Message-State: AOJu0Yx1M3ztq8TeZYS080hLTNixySAZ1+PNeeka00Gxlxdrv69oX1PC
 ZrdlVHkETyW5lXr1+4t5awCEOnEkl1kb1q1xYiVlSAAZGP67rkdmstgngidRkYPvcUGIWlOVisr
 oFZ7IK1kSo3c6XZHo4FoM6stkv8DULcIjfkkQ
X-Received: by 2002:a05:6122:2886:b0:4b7:32ac:f4e5 with SMTP id
 fl6-20020a056122288600b004b732acf4e5mr4682331vkb.1.1705330046100; 
 Mon, 15 Jan 2024 06:47:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl3g0muu7xD/Tj+Zr9TyY8gOWhOJboojbdmamx1smFfYvzduqw18AZ9+hpq2S3HXA+drCMKA==
X-Received: by 2002:a05:6122:2886:b0:4b7:32ac:f4e5 with SMTP id
 fl6-20020a056122288600b004b732acf4e5mr4682321vkb.1.1705330045850; 
 Mon, 15 Jan 2024 06:47:25 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ne13-20020a056214424d00b006815cf9a644sm1020720qvb.55.2024.01.15.06.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 06:47:25 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH 06/10] pci: move pinned status bit to pci_dev struct
Date: Mon, 15 Jan 2024 15:46:17 +0100
Message-ID: <20240115144655.32046-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115144655.32046-2-pstanner@redhat.com>
References: <20240115144655.32046-2-pstanner@redhat.com>
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

The bit describing whether the PCI device is currently pinned is stored
in the PCI devres struct. To clean up and simplify the pci-devres API,
it's better if this information is stored in the pci_dev struct, because
it allows for checking that device's pinned-status directly through the
device struct.
This will later permit simplifying  pcim_enable_device().

Move the 'pinned' boolean bit to struct pci_dev.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 14 ++++----------
 drivers/pci/pci.h    |  1 -
 include/linux/pci.h  |  1 +
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index bf957f0bc5ac..de8cf6f87dd7 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -411,7 +411,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (!this->pinned)
+	if (!dev->pinned)
 		pci_disable_device(dev);
 }
 
@@ -469,18 +469,12 @@ EXPORT_SYMBOL(pcim_enable_device);
  * pcim_pin_device - Pin managed PCI device
  * @pdev: PCI device to pin
  *
- * Pin managed PCI device @pdev.  Pinned device won't be disabled on
- * driver detach.  @pdev must have been enabled with
- * pcim_enable_device().
+ * Pin managed PCI device @pdev. Pinned device won't be disabled on driver
+ * detach.  @pdev must have been enabled with pcim_enable_device().
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
index dbb76a3fb0e4..3d9908a69ebf 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -809,7 +809,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * when a device is enabled using managed PCI device enable interface.
  */
 struct pci_devres {
-	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
 	unsigned int mwi:1;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index a356bdcc14cc..2f6f44991003 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -368,6 +368,7 @@ struct pci_dev {
 					   functional, and D3 being off. */
 	u8		pm_cap;		/* PM capability offset */
 	unsigned int	enabled:1;	/* Whether this dev is enabled */
+	unsigned int	pinned:1;	/* Whether this dev is pinned */
 	unsigned int	imm_ready:1;	/* Supports Immediate Readiness */
 	unsigned int	pme_support:5;	/* Bitmask of states from which PME#
 					   can be generated */
-- 
2.43.0

