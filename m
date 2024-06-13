Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C936E906C79
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EFC10EA47;
	Thu, 13 Jun 2024 11:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RcBJgzvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5866810EA42
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oyizp71aDVZTVSj1hEgGPWD4Zgvxaje3MhAhMHAAQDo=;
 b=RcBJgzvXTgqSYukUs1AAXKl14w3NGNvNi0M8E+8+dV8PcHjPwQO1vSk4agoedXwYsqc0yM
 ABdeBxT72A1zkBLi5OV0FuHns5R6w5O0+do0l/Ia8REq68HiARuq+nFA8zL9fuVgLeBK0P
 pvEgh5ODmI0oH5P89bTTgyhZfhiOSz4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-d9MHUlXTMIeNZiKfqZHWbQ-1; Thu, 13 Jun 2024 07:50:48 -0400
X-MC-Unique: d9MHUlXTMIeNZiKfqZHWbQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2ebd962eb88so397681fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279446; x=1718884246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oyizp71aDVZTVSj1hEgGPWD4Zgvxaje3MhAhMHAAQDo=;
 b=Kq7k2Snu2pEIzYL0YnvCuNsxrw7RmTnzwFJy+Rq4raC7RXtdYVnt2Vfg87Hmyuvfgt
 1D1EstFxLjK/REfuOyEXHPMIGJeQ/cAnI+hLw2+VL5mnoy7Hdg2TI/ctL/S5G+LcWpdB
 SKwBI6M3yRANAigQTlq3BBeWlaQ0uRr6YaI+Wk2jIB4MWJfHcV942TbmX9Rb2N5M1vhN
 UPFR7LpOvO8cTx6VE+ue90Kq5G8SkkDPbMuHRewB5XeIg9extbFXB/VTSKseIqfDeWAH
 I65WaIoWc7Tom+F0+q46m44IGzi4NF2+sC0PnsxxQJ+uO7aRAFICmLsDQhSuULc52MO/
 P1gA==
X-Gm-Message-State: AOJu0YzbIE8uOo/od27Y+CKEQgSnKis2TCOOZplsZh2D8fIY3ihYs7s9
 1vd6G/tcLVaoTTLUATbVVOXJ+/M16FcDuZ/kfhMG30PcV5z7ChY70CivqekhSZMLLdSUKUZJw/R
 SMlQXzFSJ+zjqbwXQySVLEaHT2TnSVkdU4TsDC8hFw+dL+5j8z6vLLIkQqpnug9dXUw==
X-Received: by 2002:ac2:4db6:0:b0:52b:b349:c224 with SMTP id
 2adb3069b0e04-52ca59e8a34mr41627e87.0.1718279446135; 
 Thu, 13 Jun 2024 04:50:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLhEgk5PVdiMFlFsN3ltE7pAoZnfjyVgZ6hFXz98dULDmP/AUIKfgL84nHKqB6KbULbimrYw==
X-Received: by 2002:ac2:4db6:0:b0:52b:b349:c224 with SMTP id
 2adb3069b0e04-52ca59e8a34mr41612e87.0.1718279445706; 
 Thu, 13 Jun 2024 04:50:45 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:45 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 01/13] PCI: Add and use devres helper for bit masks
Date: Thu, 13 Jun 2024 13:50:14 +0200
Message-ID: <20240613115032.29098-2-pstanner@redhat.com>
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

The current derves implementation uses manual shift operations to check
whether a bit in a mask is set. The code can be made more readable by
writing a small helper function for that.

Implement mask_contains_bar() and use it where applicable.

Link: https://lore.kernel.org/r/20240605081605.18769-3-pstanner@redhat.com
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/devres.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 2c562b9eaf80..f13edd4a3873 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -161,6 +161,10 @@ int pcim_set_mwi(struct pci_dev *dev)
 }
 EXPORT_SYMBOL(pcim_set_mwi);
 
+static inline bool mask_contains_bar(int mask, int bar)
+{
+	return mask & BIT(bar);
+}
 
 static void pcim_release(struct device *gendev, void *res)
 {
@@ -169,7 +173,7 @@ static void pcim_release(struct device *gendev, void *res)
 	int i;
 
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
-		if (this->region_mask & (1 << i))
+		if (mask_contains_bar(this->region_mask, i))
 			pci_release_region(dev, i);
 
 	if (this->mwi)
@@ -363,7 +367,7 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
 		unsigned long len;
 
-		if (!(mask & (1 << i)))
+		if (!mask_contains_bar(mask, i))
 			continue;
 
 		rc = -EINVAL;
@@ -386,7 +390,7 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
 	pci_release_region(pdev, i);
  err_inval:
 	while (--i >= 0) {
-		if (!(mask & (1 << i)))
+		if (!mask_contains_bar(mask, i))
 			continue;
 		pcim_iounmap(pdev, iomap[i]);
 		pci_release_region(pdev, i);
@@ -438,7 +442,7 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 		return;
 
 	for (i = 0; i < PCIM_IOMAP_MAX; i++) {
-		if (!(mask & (1 << i)))
+		if (!mask_contains_bar(mask, i))
 			continue;
 
 		pcim_iounmap(pdev, iomap[i]);
-- 
2.45.0

