Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EB906C7B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6785210EA42;
	Thu, 13 Jun 2024 11:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aTH7zU4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B9310EA47
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CL+kLbe+Y26ksl0hcQ0e5foEJJ8TqrY6DSq54p9TklM=;
 b=aTH7zU4z/+LROhY7QC9XU5fPD3sCLWcDbfF4suBzOv1YSm9ZCkezj4D1zCoqFxIwXTydj2
 HE8Py6HEWm+RzAXQXV/XhwZJqDCNT2MCR1VELO0sniaQfzvsgzX7BBFajs/Dqti+ytja7H
 t+GbOkuIJt8kKlkT6t0SvD/TNRe/bEU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-TIi4mvvBNkSd49mFP2uNUw-1; Thu, 13 Jun 2024 07:50:50 -0400
X-MC-Unique: TIi4mvvBNkSd49mFP2uNUw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4210e98f8d7so1509705e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279449; x=1718884249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CL+kLbe+Y26ksl0hcQ0e5foEJJ8TqrY6DSq54p9TklM=;
 b=C8y9QDnSgL+a4yV1BPoKMJbl3aSlViKYROWKw6J/DkWuJc4m3M3KCA1ZmCEKW56rJk
 CKz0SHa85A8tRagWjIGac6Ua5ZlwQOnhmOetgeIqgsmiozNy6aZRU3yMvPv2NgsaZXdX
 oz+n8WelynfJpuRwuby7t4+N36kPqcmHTWbK67nEgI5f8JE0SEaRjWYjTmcarD6HgnCN
 pRjFI+8mxKuvmwUMePdmq+OVddaxFeI3e2/mKV8cnohMzhctTSXlRv0atuOENVc32sXZ
 BuTiw6Rn77vVJLJizQ+yCvSYMvC9BsRKtxLHqv8FRo+fIEmUMlsL1MFQ7KTAdBnPdX4z
 vnpw==
X-Gm-Message-State: AOJu0YxeicJ21JjMbOJSTAqi65aJIPqg3+vUTN+Pk/pmCq5DBxhz/uvI
 KrMn3VKG6gGMC/wg/kYQyS1QnOHhD0GrAekbYtmvg7y3gtFjhR4oouYjxf8RRoCczWGpOWcwalC
 wQXTDy0OjI58eZwX/HwE9vb4sakUwFqavnaZtR3Vo6azrVUb3VySiSeQkXw2n2fq4YA==
X-Received: by 2002:a5d:5f93:0:b0:35f:306f:1587 with SMTP id
 ffacd0b85a97d-36079a50f05mr208528f8f.5.1718279448835; 
 Thu, 13 Jun 2024 04:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEPTiocjmZpdSuZITHvA9vbQ/P9nyYz57aqk+QbvsZnFOIEMIsJGsexzqpTKeFCx6yJ+Ucbw==
X-Received: by 2002:a5d:5f93:0:b0:35f:306f:1587 with SMTP id
 ffacd0b85a97d-36079a50f05mr208519f8f.5.1718279448583; 
 Thu, 13 Jun 2024 04:50:48 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:48 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 04/13] PCI: Deprecate two surplus devres functions
Date: Thu, 13 Jun 2024 13:50:17 +0200
Message-ID: <20240613115032.29098-5-pstanner@redhat.com>
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
index cf2c11b54ca6..5ecffc7424ed 100644
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

