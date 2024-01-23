Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43124838A9C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8033510E751;
	Tue, 23 Jan 2024 09:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82D110E41D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706003107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8ldR1APM7FCb8Va/7W7rWsZ/5PXg9NQPlDweLxrFR8=;
 b=VLjA+Q4X985sd+zvu0DqOvwOwqu408qk6ga/G3tUt48JAgIvkjwaUEVWww7pHnGq4QamIq
 hCgBY3AogR7tnxPI76jdbY7h6KoKz9zZcShi7u2n2WF2DE2gIo6h/sJpVNWkXugiXiPUTS
 V/XOMN+ezaDWA//sHzMFDr8Iws2DghM=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-KQlmSa5hNfOAEUWQT97OQQ-1; Tue, 23 Jan 2024 04:45:05 -0500
X-MC-Unique: KQlmSa5hNfOAEUWQT97OQQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-46a9d50a8b4so216869137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003105; x=1706607905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n8ldR1APM7FCb8Va/7W7rWsZ/5PXg9NQPlDweLxrFR8=;
 b=cmDNPN6IO2t2DNgTRAjoyGMFh7AlXme95QK3eZWIAZJZa5q9+5ve8pbcuTtY9jVqUe
 YZ83dPffLjw9ARdIdKlEE4z8C2hzCiF521+Cyt2G9pS8xVgQ/0m6AWAwLsUMSahkaIPE
 dKjl6HMT7ewhvSPee3k3nDxoNFl0AgywSuVL+hUZh7DcugdbwYjeqRqRCxiAvFbi61re
 +7n/toJ4QQj9NgbEn/hhOxTPgg/IG27M3GgbjdaYnjM8VhphDcnbd5LzTqKYANmW6sy8
 2LU7bNHHOFhFWw45Qhv5Ml5FF+f+pl+GfU6tqk4N+jqdWCphgFdEmoMe6j1+eXp1GN2W
 Lwqg==
X-Gm-Message-State: AOJu0YwrIuxkd7RocPhAu4inH32KcmqqM+XGjc72Opt27Y+I0YLnGmpw
 66d/3V6gEfbLDbdNchhYb0m++eb72H1BexpkxOj3EnCvmEX4FszLDnyGE9f1l82RmHLDOTNy9UK
 lWkEli4x6Lu5s/5PAz+cjZBl9qJbfqQ54uf7y8t58lmBpUquRvjSlNmghFIaR7H5p0g==
X-Received: by 2002:a05:6102:5493:b0:469:b7ba:85e2 with SMTP id
 bk19-20020a056102549300b00469b7ba85e2mr3802821vsb.1.1706003105396; 
 Tue, 23 Jan 2024 01:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBtpt9W0N9DjO3th5WheR6cQoXtCbywpbrf12aGS9J/9nurG+TirAyDVaNm7jxUkx0ffoI5g==
X-Received: by 2002:a05:6102:5493:b0:469:b7ba:85e2 with SMTP id
 bk19-20020a056102549300b00469b7ba85e2mr3802807vsb.1.1706003105097; 
 Tue, 23 Jan 2024 01:45:05 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:45:04 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH v2 09/10] PCI: remove legacy pcim_release()
Date: Tue, 23 Jan 2024 10:43:06 +0100
Message-ID: <20240123094317.15958-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
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

Thanks to preceding cleanup steps, pcim_release() is now not needed
anymore and can be replaced by pcim_disable_device(), which is the exact
counterpart to pcim_enable_device().

This permits removing further parts of the old devres API.

Replace pcim_release() with pcim_disable_device().
Remove the now surplus function get_pci_dr().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 49 +++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 4314d0863282..f368181c6c92 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -463,48 +463,41 @@ int pcim_intx(struct pci_dev *pdev, int enable)
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
+	if (ret != 0)
+		devm_remove_action(&pdev->dev, pcim_disable_device, pdev);
 
-	return rc;
+	return ret;
 }
 EXPORT_SYMBOL(pcim_enable_device);
 
-- 
2.43.0

