Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60125901E46
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DE910E3FC;
	Mon, 10 Jun 2024 09:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DedWSDVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A901410E3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZiUwSs1HtnX+QGE2Zl9KICBy9ex3+lEWzbjMxYLRGDA=;
 b=DedWSDVrsf8zs97+PQ0mGjb7Up3AhAldxY14kVCMVbzCXKFV23dCP2VnxSg4c6/HcFfMBR
 NDfiKJrMXIqejg0BPDjJ70d8NsoxOun0K0TkE0zcu6Y5vgWR8qo3GINSiw4msbDpynduTJ
 qEvuRF0lZ+KzUU9OKw/luaW5nF72V9A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-Iy-SYYN-PqGWc7H5SuA2NQ-1; Mon, 10 Jun 2024 05:32:05 -0400
X-MC-Unique: Iy-SYYN-PqGWc7H5SuA2NQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4218118d1efso1915015e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011924; x=1718616724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZiUwSs1HtnX+QGE2Zl9KICBy9ex3+lEWzbjMxYLRGDA=;
 b=Wc/f8QS7BMmsKVv32DfMzHsypYmdKVdsNgdHWc3HdIqofzCQG3tfs/ZMsSe6V5G6cA
 q82EhXHbCLuP36Atzy5k9cTyD+BIe3wWj9K6cvh86u0uTlbnLSLONRi8CaR49pSm7mix
 irNy1o9iSHDgo908/XDePHctZxSiiAvPWkZzFS0YdS1ZBceECiUYUgB7UEbpq193+3Oa
 mi9OBj43ZMyPD9cVGM/8ShyAbjYYmttwKxykDC0hCT1ob6VgtD6RYbORxsSMjOiB7mr8
 86zA3LTiA3PZLV8ON0o0GzDFzqb3LjImUv0EE9O4EBj/t4Hg+yN2eNAKR5UJRixBARiw
 7ozQ==
X-Gm-Message-State: AOJu0Yy7tsmzpPR0abco6HRYAZVGyTqLhCCNJZH6CpIg/j9yDExysSgn
 1xIlSOfY+T7/UUuYfZkkJAsA3syc6Pu50P5vjFCC1cqX418QS7sTG1/sl1xpMsFBwOPARFbfEyj
 mCusm+n36lxeLdhp9dGRaKjpLGZB0Pf2KiOUkVzMEI+o4g0U4rSJw8pHSQQeC+6fy1Q==
X-Received: by 2002:a5d:6c65:0:b0:354:fc97:e6e3 with SMTP id
 ffacd0b85a97d-35efee1d38fmr6464066f8f.5.1718011923972; 
 Mon, 10 Jun 2024 02:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHVbLME23XHqqxGSb/L2UcmsZWCbVxunmo7ktVNIV+TisnX0BItNxZ6wxaQvx45l+MZoucwQ==
X-Received: by 2002:a5d:6c65:0:b0:354:fc97:e6e3 with SMTP id
 ffacd0b85a97d-35efee1d38fmr6464047f8f.5.1718011923677; 
 Mon, 10 Jun 2024 02:32:03 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:03 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 04/13] PCI: Deprecate two surplus devres functions
Date: Mon, 10 Jun 2024 11:31:26 +0200
Message-ID: <20240610093149.20640-5-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240610093149.20640-1-pstanner@redhat.com>
References: <20240610093149.20640-1-pstanner@redhat.com>
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

pcim_iomap_table() should not be used anymore because it contributed to the
PCI devres API being designed contrary to devres's design goals.

pcim_iomap_regions_request_all() is a surplus, complicated function that
can easily be replaced by using a pcim_* request function in combination
with a pcim_* mapping function.

Mark pcim_iomap_table() and pcim_iomap_regions_request_all() as deprecated
in the function documentation.

Link: https://lore.kernel.org/r/20240605081605.18769-6-pstanner@redhat.com
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/devres.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 82f71f5e164a..54b10f5433ab 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -507,7 +507,7 @@ static void pcim_iomap_release(struct device *gendev, void *res)
 }
 
 /**
- * pcim_iomap_table - access iomap allocation table
+ * pcim_iomap_table - access iomap allocation table (DEPRECATED)
  * @pdev: PCI device to access iomap table for
  *
  * Returns:
@@ -521,6 +521,11 @@ static void pcim_iomap_release(struct device *gendev, void *res)
  * This function might sleep when the table is first allocated but can
  * be safely called without context and guaranteed to succeed once
  * allocated.
+ *
+ * This function is DEPRECATED. Do not use it in new code. Instead, obtain a
+ * mapping's address directly from one of the pcim_* mapping functions. For
+ * example:
+ * void __iomem *mappy = pcim_iomap(pdev, bar, length);
  */
 void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
 {
@@ -894,6 +899,7 @@ static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 
 /**
  * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones
+ *			(DEPRECATED)
  * @pdev: PCI device to map IO resources for
  * @mask: Mask of BARs to iomap
  * @name: Name associated with the requests
@@ -904,6 +910,10 @@ static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
  *
  * To release these resources manually, call pcim_release_region() for the
  * regions and pcim_iounmap() for the mappings.
+ *
+ * This function is DEPRECATED. Don't use it in new code. Instead, use one
+ * of the pcim_* region request functions in combination with a pcim_*
+ * mapping function.
  */
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name)
-- 
2.45.0

