Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95238967B0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B20F1127AE;
	Wed,  3 Apr 2024 08:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g/BkBe8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDD91127AE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712131665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0nMjCQAiDf49AN80TJHWT8W1hBn+/o753fWI/QiFHA=;
 b=g/BkBe8lyDOOz5xpOt76fo0xOxAECh28dgpfH+SDl1Y0RH3oHmSbHfbSjAW8CFYai4T1aa
 zzp1Jt7ZcGANxCtxG22BFlqpYb8Ff/uJuEI3ycRe8RpjGBJMfNNFAu82fRFK6DD3kCPbb+
 vj6gj+F3xECGAPQDVA4icWXxfxQ218o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-pPA59bbNM8WP9wNN_AYkMA-1; Wed, 03 Apr 2024 04:07:37 -0400
X-MC-Unique: pPA59bbNM8WP9wNN_AYkMA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-343740ca794so324873f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 01:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712131656; x=1712736456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0nMjCQAiDf49AN80TJHWT8W1hBn+/o753fWI/QiFHA=;
 b=DXAVBnI47gFrdWNvrk5j8/KfT0SYmNGfFTOFWaWV4gb6Lc8sG7d6Vt2plfC3R3s9N/
 cPX0s8RFNJBobY2htmY6qWAtdRub7JchqDoYYvB4/dyBb55erG003a4u06zGGCb7aKY9
 SoTP7c9oUxPmqcOJNPkMYkgna73nHWjJqO9S+t6S6C/pAOSMAX+pPoXOkxKNcDTGNZSs
 pcQglE7O7Si6fkMSZY9VdBiE3FsOaHsnLC9jV4R7Fkv9n6w8/AZPisApMtZUn6zte/te
 dQ3BxPPbE+XLyPYMRkAQcNPwAgD8TXF1oQwdqRnaDKvfvIoVzpl9reRTGRmue/zbRLTy
 aA2w==
X-Gm-Message-State: AOJu0YwJ2+bwLdEPU0XQTIv/rcbz2DTKah+myfHzkHp/suxF03l6fc+a
 N6L7BykbHaDb3oACkU9h7RZW2gwP7o6R4M3pQJUTHL0fzt5Mwv1QHfYv0KRjGVaTIecNvjYlWmj
 Im44IDb+akVOM487brVj3gudpYSTAMslct33XZrIgDHvnCbHFC0h5cmeF46aGT8xBhw==
X-Received: by 2002:a05:600c:1c8f:b0:414:6467:2b1d with SMTP id
 k15-20020a05600c1c8f00b0041464672b1dmr11645142wms.0.1712131656619; 
 Wed, 03 Apr 2024 01:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiVKQLb+f1OrEQQkeHaGoynxvE5CB8UQaKuohoK/Tyncy87LGCNAzMSYeiGEEBVT7VkIsd9w==
X-Received: by 2002:a05:600c:1c8f:b0:414:6467:2b1d with SMTP id
 k15-20020a05600c1c8f00b0041464672b1dmr11645125wms.0.1712131656385; 
 Wed, 03 Apr 2024 01:07:36 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 fa14-20020a05600c518e00b004159df274d5sm5504535wmb.6.2024.04.03.01.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:07:36 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v5 09/10] PCI: Remove legacy pcim_release()
Date: Wed,  3 Apr 2024 10:07:10 +0200
Message-ID: <20240403080712.13986-12-pstanner@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403080712.13986-2-pstanner@redhat.com>
References: <20240403080712.13986-2-pstanner@redhat.com>
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

This permits removing further parts of the old devres API.

Replace pcim_release() with pcim_disable_device().
Remove the now surplus function get_pci_dr().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 49 +++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 8a643f15140a..3e567773c556 100644
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
2.44.0

