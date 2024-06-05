Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DA8FC5CA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C941710E700;
	Wed,  5 Jun 2024 08:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pekg524l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2B210E6D3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ieun1xthf8lb2oACtUs9qte0ySrDx5Lfq1im4lgm338=;
 b=Pekg524lk2bv0PZq7omPPONZym/+/nJN/4sP3I7ky0UOiVX33tRg2XEYxUpAXycboE5NSF
 kLgglX8QHhxoCg1DjZlCdCNikIvTBnztiJ8ePerE3Fd9Axq0h4lWdqVEJ1VLgDt2v+/6GB
 zbwlIXVyf6B8Xk7Y/A6y+KXC9SgfCG4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-xTHkFaBhNBOQDaco1EVEAQ-1; Wed, 05 Jun 2024 04:16:28 -0400
X-MC-Unique: xTHkFaBhNBOQDaco1EVEAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42159aeaf59so30885e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575387; x=1718180187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ieun1xthf8lb2oACtUs9qte0ySrDx5Lfq1im4lgm338=;
 b=uvjTRRB+fSyhPCAd+EaBJjPTRQOhzGW+HwGsmeVcAf/SxS3I6naybD/1Ngg1rl7o+Y
 BAKB/GEluO2dLQnRqa7+sHSzFpF7phnYwUsmnjCwuUlWUgK6eEdEOkfMUfKrbOM/C0Pn
 ze6WmthgOkE4wDX6zkYD5xR0COeazG7zx9JnMLrFi+soccuauJwGhE/1kRZBxPkVRpQj
 Vw0hSSWWLmsBa/rajuTuEkUZeZSgLm8ZoP281eF2s9/7McMCnCFsN9mk5VW6ooibHnW0
 aqrYFwgCluTa87Y1+ObJMr1I8oeQsLht246otzkZtQAvbmrC1z6k0B/4Nzv3b70RSZ3t
 /0xg==
X-Gm-Message-State: AOJu0Yzt0VmbFuvqqo/CtWG7C2q3fwIXxjFpJPtToMM8e5rGzag6K2GS
 YDQxnclJ5n6/HpSDxht6TKwq0lINwUgXt1CJcTrUcu9wllgNxdNFA7gcYpVokEcWlGJ4u9I7DYN
 gD9aVJ4tNlLCFdRdTZUn2SfwJgFng3todNV9waRPQJGVfij3mdvG60UzQiMXDWVbewA==
X-Received: by 2002:a5d:49c5:0:b0:354:f768:aa00 with SMTP id
 ffacd0b85a97d-35e8ef8f11amr1107243f8f.4.1717575387781; 
 Wed, 05 Jun 2024 01:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7QWZ+wzLRj89HwPmCo4cwm181tYKPOfVL2iFfJrmO0D+uX56tjbvKzLXtnA0YMX0uy5FvKA==
X-Received: by 2002:a5d:49c5:0:b0:354:f768:aa00 with SMTP id
 ffacd0b85a97d-35e8ef8f11amr1107226f8f.4.1717575387480; 
 Wed, 05 Jun 2024 01:16:27 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:27 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 11/13] PCI: Remove legacy pcim_release()
Date: Wed,  5 Jun 2024 10:16:03 +0200
Message-ID: <20240605081605.18769-13-pstanner@redhat.com>
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

Thanks to preceding cleanup steps, pcim_release() is now not needed
anymore and can be replaced by pcim_disable_device(), which is the exact
counterpart to pcim_enable_device().

This permits removing further parts of the old PCI devres implementation.

Replace pcim_release() with pcim_disable_device().
Remove the now surplus function get_pci_dr().
Remove the struct pci_devres from pci.h.
Remove the now surplus function find_pci_dr().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 53 +++++++++++++++++++++-----------------------
 drivers/pci/pci.h    | 18 ---------------
 2 files changed, 25 insertions(+), 46 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 9a997de280df..271ffd1aaf47 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -460,48 +460,45 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 	return 0;
 }
 
-static void pcim_release(struct device *gendev, void *res)
+static void pcim_disable_device(void *pdev_raw)
 {
-	struct pci_dev *dev = to_pci_dev(gendev);
-
-	if (!dev->pinned)
-		pci_disable_device(dev);
-}
-
-static struct pci_devres *get_pci_dr(struct pci_dev *pdev)
-{
-	struct pci_devres *dr, *new_dr;
-
-	dr = devres_find(&pdev->dev, pcim_release, NULL, NULL);
-	if (dr)
-		return dr;
+	struct pci_dev *pdev = pdev_raw;
 
-	new_dr = devres_alloc(pcim_release, sizeof(*new_dr), GFP_KERNEL);
-	if (!new_dr)
-		return NULL;
-	return devres_get(&pdev->dev, new_dr, NULL, NULL);
+	if (!pdev->pinned)
+		pci_disable_device(pdev);
 }
 
 /**
  * pcim_enable_device - Managed pci_enable_device()
  * @pdev: PCI device to be initialized
  *
- * Managed pci_enable_device().
+ * Returns: 0 on success, negative error code on failure.
+ *
+ * Managed pci_enable_device(). Device will automatically be disabled on
+ * driver detach.
  */
 int pcim_enable_device(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
-	int rc;
+	int ret;
 
-	dr = get_pci_dr(pdev);
-	if (unlikely(!dr))
-		return -ENOMEM;
+	ret = devm_add_action(&pdev->dev, pcim_disable_device, pdev);
+	if (ret != 0)
+		return ret;
 
-	rc = pci_enable_device(pdev);
-	if (!rc)
-		pdev->is_managed = 1;
+	/*
+	 * We prefer removing the action in case of an error over
+	 * devm_add_action_or_reset() because the later could theoretically be
+	 * disturbed by users having pinned the device too soon.
+	 */
+	ret = pci_enable_device(pdev);
+	if (ret != 0) {
+		devm_remove_action(&pdev->dev, pcim_disable_device, pdev);
+		return ret;
+	}
 
-	return rc;
+	pdev->is_managed = true;
+
+	return ret;
 }
 EXPORT_SYMBOL(pcim_enable_device);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3aa57cd8b3e5..6a9c4dd77d68 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -812,24 +812,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 }
 #endif
 
-/*
- * Managed PCI resources.  This manages device on/off, INTx/MSI/MSI-X
- * on/off and BAR regions.  pci_dev itself records MSI/MSI-X status, so
- * there's no need to track it separately.  pci_devres is initialized
- * when a device is enabled using managed PCI device enable interface.
- *
- * TODO: Struct pci_devres and find_pci_dr() only need to be here because
- * they're used in pci.c.  Port or move these functions to devres.c and
- * then remove them from here.
- */
-struct pci_devres {
-	/*
-	 * TODO:
-	 * This struct is now surplus. Remove it by refactoring pci/devres.c
-	 */
-};
-
-struct pci_devres *find_pci_dr(struct pci_dev *pdev);
 int pcim_intx(struct pci_dev *dev, int enable);
 
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
-- 
2.45.0

