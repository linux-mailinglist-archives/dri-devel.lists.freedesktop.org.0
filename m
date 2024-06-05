Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3428FC5D2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E5F10E703;
	Wed,  5 Jun 2024 08:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pkj2XVOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808010E707
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQF/RRtq2M1mXHCVQZRIWcpncx1S//L9Tm5LTcwCt7g=;
 b=Pkj2XVOtpvJ8JMGO5hzKm/8XXAMvEFEAMLqglAewCHrx34eJ27VVcC468TGLStW94zWEn/
 VhqGeUI+/Qw2NFxEVtOdFvF6QaOC2ZJ1aTHeH98ZRboSe9LMML5X340fD58WtsSu9qgHxr
 KLLJuXEnS+Nf9T/Ay4o/hmiuYkKwIw8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-9VxqiL41PfKoC7xFeHu5Vw-1; Wed, 05 Jun 2024 04:16:41 -0400
X-MC-Unique: 9VxqiL41PfKoC7xFeHu5Vw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a68aa5ca81eso17770266b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575401; x=1718180201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQF/RRtq2M1mXHCVQZRIWcpncx1S//L9Tm5LTcwCt7g=;
 b=NlFVTfwh0IbpaJTMFlxInGQ6iV/icqNLfKcD4+5ZD+B0llwE5Y8X4FSC+TrHBbhWGl
 C/KMRC/5L1eRolHKYA+OpyDmpUYp5adAxXC2ydh1VeX5A1x7KkUs2vOqiOH89Y4Q4p2o
 ohgXciyvIAmZ1hupJ0EoKmpHUmevKvRFTpZwt4pyoW5iz48nKcZGt7TObVO5yUrc/ItK
 HfxWyeiCmpEQ0vUPQU5V/N//N326P/xG/31+bmQDLwbFWB7fFUJRTq5d4IZ2f2II+ih1
 OdH8Tl4U+tmZKEmlM4G3aSd7Li6eXjhSF9gscDhoHEJvXUrp8PDxTq9zs42KJpgfK5tx
 +0OA==
X-Gm-Message-State: AOJu0YyJdDUtJiM1L5TE9iUeCI/hWIOhjxVhGEBR6aGZpNOnnxb7z1vb
 Gw3H7BUZg19XiXJR9rW9KCZWl2/XNSce+YlzqNIKiNu5NoSwDhZgGIzhC1v2MQWwE2lydtSr5vj
 t0xKQim/ocsCwc5l8ZtychXnp+OgkaMDt0IAj5eAZR5Z6N1liSLKWI1qiSLI+IkX3EA==
X-Received: by 2002:a50:9983:0:b0:57a:2069:e91 with SMTP id
 4fb4d7f45d1cf-57a8b674ab5mr1282379a12.1.1717575400718; 
 Wed, 05 Jun 2024 01:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnDWsmeGVuf2mez79IRf+VouIvlEPmoOV19RR5wEUe4IIflrHEB7JVXR7OyM17+DSycTI2BQ==
X-Received: by 2002:a5d:62c4:0:b0:358:a09:2677 with SMTP id
 ffacd0b85a97d-35e84046ff8mr1214838f8f.2.1717575380210; 
 Wed, 05 Jun 2024 01:16:20 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:19 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 04/13] PCI: Deprecate two surplus devres functions
Date: Wed,  5 Jun 2024 10:15:56 +0200
Message-ID: <20240605081605.18769-6-pstanner@redhat.com>
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

pcim_iomap_table() should not be used anymore because it contributed to
the PCI devres API being designed contrary to devres's design goals.

pcim_iomap_regions_request_all() is a surplus, complicated function
that can easily be replaced by using a pcim_* request function in
combination with a pcim_* mapping function.

Mark pcim_iomap_table() and pcim_iomap_regions_request_all() as
deprecated in the function documentation.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index e6e791c9db6e..f199f610ae51 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -501,7 +501,7 @@ static void pcim_iomap_release(struct device *gendev, void *res)
 }
 
 /**
- * pcim_iomap_table - access iomap allocation table
+ * pcim_iomap_table - access iomap allocation table (DEPRECATED)
  * @pdev: PCI device to access iomap table for
  *
  * Returns:
@@ -515,6 +515,11 @@ static void pcim_iomap_release(struct device *gendev, void *res)
  * This function might sleep when the table is first allocated but can
  * be safely called without context and guaranteed to succeed once
  * allocated.
+ *
+ * This function is DEPRECATED. Do not use it in new code. Instead, obtain a
+ * mapping's address directly from one of the pcim_* mapping functions. For
+ * example:
+ * void __iomem *mappy = pcim_iomap(pdev, barnr, length);
  */
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
 {
@@ -886,7 +891,7 @@ static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 }
 
 /**
- * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
+ * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones (DEPRECATED)
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to iomap
  * @name: Name associated with the requests
@@ -897,6 +902,9 @@ static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
  *
  * To release these resources manually, call pcim_release_region() for the
  * regions and pcim_iounmap() for the mappings.
+ *
+ * This function is DEPRECATED. Don't use it in new code. Instead, use one of the
+ * pcim_* region request functions in combination with a pcim_* mapping function.
  */
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name)
-- 
2.45.0

