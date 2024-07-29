Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308E93F147
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3910E378;
	Mon, 29 Jul 2024 09:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HXrWF878";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F710E378
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722245824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42kYX+we7aWmN9i2s2pGfyq6/m9TDK9MaaqQ5jcnuoY=;
 b=HXrWF878eZzrnCEkXPN3fg6N3SNWg61nKJ+h7YOvOMKSNllny7lAsR7yE1/ilkybZjr4aH
 oE83jyn6BIltlrchYtFfCvK+v1p8+yRiGggZEJR3aonz30m73NpmX5yMnrNwvtzjD/NDGn
 PJWju3mkvpVpeN0LlFDQbKbv5ZcfhC4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-kZJCjH3oMIG6Bo51mOVtNw-1; Mon, 29 Jul 2024 05:37:02 -0400
X-MC-Unique: kZJCjH3oMIG6Bo51mOVtNw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6b7973ab9cbso7849726d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722245822; x=1722850622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42kYX+we7aWmN9i2s2pGfyq6/m9TDK9MaaqQ5jcnuoY=;
 b=SsTli3F0o30Mz9UzxSK39NdSc5uaArAuAVBMVy8B+z0/Fre8Nu1ackoq93dX3jsIOZ
 7FHXRHoKq5+v2bnCZadQUmgdE4cj7Y6aJcgKQHsvl9Ur6xW2k+qG0vXuCNOSdtCnCNSj
 GiBkvcFZKOAgeTSzdxTG2MiNpW7Ym04uHMYHW1eP9a8tFQtJmZgFcpF2GOXw5WAEOKHw
 m/lE7q9N20JgTtt4OiUW/bdyC70ogAr+h+yOiwrjTXopntwArntLy0Wqu9OREWPx3MAO
 xVziK7ZriszQGrdE18qNiCh2tsl7mAnlk+1idCiM8ifKlcPjDXYcF8idJsXf6umtyW9V
 qtCw==
X-Gm-Message-State: AOJu0YxhaOlz+O2y9P0ih8bb2xrmirnzPZ8U9q/U4Ne47/ZKnXs+mwss
 KxookaN5rLUx3vw2XJtk6jKH8xE66BEXxl94POf7/EZ6MSRi8cHUD09iYVMRlX1nujZp+WIgEJq
 ojqYR0v/6Prcqxsc7X1eivWQgseO3SSj4edAqr7M8ipzqtHLk8Kvp+ZHyd8sbYu+tUQ==
X-Received: by 2002:ad4:5f87:0:b0:6b7:586c:6db with SMTP id
 6a1803df08f44-6bb3e38b497mr93633356d6.9.1722245822101; 
 Mon, 29 Jul 2024 02:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkPP99cFbQc6WSD5piny1t+VTMR84B7lZvZiZJT2aKKHRfx8A/j8DuWgpWI66gNwcsld6zA==
X-Received: by 2002:ad4:5f87:0:b0:6b7:586c:6db with SMTP id
 6a1803df08f44-6bb3e38b497mr93633256d6.9.1722245821694; 
 Mon, 29 Jul 2024 02:37:01 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa94a16sm50047086d6.86.2024.07.29.02.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 02:37:01 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 1/2] PCI: Make pcim_request_region() a public function
Date: Mon, 29 Jul 2024 11:36:26 +0200
Message-ID: <20240729093625.17561-4-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729093625.17561-2-pstanner@redhat.com>
References: <20240729093625.17561-2-pstanner@redhat.com>
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

pcim_request_region() is the managed counterpart of
pci_request_region(). It is currently only used internally for PCI.

It can be useful for a number of drivers and exporting it is a step
towards deprecating more complicated functions.

Make pcim_request_region a public function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 1 +
 drivers/pci/pci.h    | 2 --
 include/linux/pci.h  | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 3780a9f9ec00..0127ca58c6e5 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -863,6 +863,7 @@ int pcim_request_region(struct pci_dev *pdev, int bar, const char *name)
 {
 	return _pcim_request_region(pdev, bar, name, 0);
 }
+EXPORT_SYMBOL(pcim_request_region);
 
 /**
  * pcim_request_region_exclusive - Request a PCI BAR exclusively
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 79c8398f3938..2fe6055a334d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -887,8 +887,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 #endif
 
 int pcim_intx(struct pci_dev *dev, int enable);
-
-int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
 int pcim_request_region_exclusive(struct pci_dev *pdev, int bar,
 				  const char *name);
 void pcim_release_region(struct pci_dev *pdev, int bar);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9e36b6c1810e..e5d8406874e2 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2294,6 +2294,7 @@ static inline void pci_fixup_device(enum pci_fixup_pass pass,
 void __iomem *pcim_iomap(struct pci_dev *pdev, int bar, unsigned long maxlen);
 void pcim_iounmap(struct pci_dev *pdev, void __iomem *addr);
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev);
+int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name);
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name);
-- 
2.45.2

