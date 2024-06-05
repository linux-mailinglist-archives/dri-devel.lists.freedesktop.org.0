Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC98FC5D4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570F710E6F9;
	Wed,  5 Jun 2024 08:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QvJOhwNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B4A10E715
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FprLruSafewJCGyfXmuQwDL1Jg/OKDGH6ODfzThcTic=;
 b=QvJOhwNHybJ+jE2WhwfUgDEvOjfFaiwdIQlPKonOexy4DFZu6L7qq5GC85e/+twWkVjIbI
 Bh/LJtYyg1o0+Sw+WWGbtkiqe5UKJB0RjPcZTo/S4Hm28LqEnFvneWL85jYV+WKLcbxgsu
 clbE2gWuEYpdc+PF9FOym7Z5xLEPT4Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-tcLaOchLMYufzlRWdo7lRQ-1; Wed, 05 Jun 2024 04:16:39 -0400
X-MC-Unique: tcLaOchLMYufzlRWdo7lRQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a68aa5ca81eso17769766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575398; x=1718180198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FprLruSafewJCGyfXmuQwDL1Jg/OKDGH6ODfzThcTic=;
 b=jB4MQIGIrUNHjUIh2nKqLyWWC6ousogc/TDcKdlE4pcts65+wuI2I032ZX7ci6dmai
 1/d0NiMXak5V/O2/DJwzBzhTsma2MzkGmj/BHVQOPXMtVYufZgzH7wxBXdxIIwshfoeW
 3MHkmucRckpwYjTDBY6YSa296Ov8xjcQ7RGYdGwwLT46hP+lEFzJv9VjUaNCLYygH0AP
 M2rAMkv0BeE2Y0JeEAFotprRxVJPdR74HAfyFcjB/Nn4AkxX1zyYgnVB4WHlztARnDu8
 AM34lQCz6Qr/z0Gf9B9UBCjijTvxIIIV/j63eFSmY83flPTvHt2dJgA8T8eoQ6mA9k74
 5S2g==
X-Gm-Message-State: AOJu0Ywd2XWnIRNlw2QDsPR+VxYU510E3+gY2AWwqtXbbCnfwZyLHYil
 Irw4cRWqQaMrhN+5YnHyNZscm+0A+yQWc5E6ZsOtP0nesgrQixroH3ZL7wBPVEcbuU3USXqKO9Z
 5eG55VzGNVL4ImUfuDMAfKoEwDRNf7jRATVYHdelr0xrVDIzGffrGdZn+WW3MdT0/McMWIIB7oA
 ==
X-Received: by 2002:a17:906:2c18:b0:a68:67e4:7f11 with SMTP id
 a640c23a62f3a-a699faad11fmr110517166b.2.1717575398271; 
 Wed, 05 Jun 2024 01:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH01zzkiwwO2rlaNoVMW4xlWaRAMHnpBHn33IIaKEoTGFWWRSfd/BTk6G3QT5BqGH8wLV82w==
X-Received: by 2002:a5d:404d:0:b0:35e:83dc:e6ed with SMTP id
 ffacd0b85a97d-35e83fcb079mr1241057f8f.0.1717575377322; 
 Wed, 05 Jun 2024 01:16:17 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:16 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 01/13] PCI: Add and use devres helper for bit masks
Date: Wed,  5 Jun 2024 10:15:53 +0200
Message-ID: <20240605081605.18769-3-pstanner@redhat.com>
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

The current derves implementation uses manual shift operations to check
whether a bit in a mask is set. The code can be made more readable by
writing a small helper function for that.

Implement mask_contains_bar() and use it where applicable.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
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

