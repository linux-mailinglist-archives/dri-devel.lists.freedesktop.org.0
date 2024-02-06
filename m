Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EF684B6A5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:41:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48134112BF8;
	Tue,  6 Feb 2024 13:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JRiCAHOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6CE112BF8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707226858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDrBrW1QyBkIZW9XXC7FxnbgE53QwXCFFfi0uuWv0Ls=;
 b=JRiCAHOfIYAs4SqwwALe3r1bXpXEYl4Rl9Hurdim3ZA0m9pAWagjG/sFto2d7MR32yGYmA
 ZRmeU5KyLQXC2F30cpmIozyZKfOr0SQiLX/qvn7y8RLve8djVbVXhO3uomE/Yxir1npysz
 emNzsu3NhsF4giVIFoke4Z5HKB3/WDA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-ozHT8aLWPimQY-6UkhKnYQ-1; Tue, 06 Feb 2024 08:40:56 -0500
X-MC-Unique: ozHT8aLWPimQY-6UkhKnYQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-78313358d3bso261634085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:40:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226856; x=1707831656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nDrBrW1QyBkIZW9XXC7FxnbgE53QwXCFFfi0uuWv0Ls=;
 b=U8MqAQViXStdrEE0kZu94jNYhJEiS2AELREmzZ32yHiWecUzoBKlNASIQXn+48q2Ft
 JHFmPnW/p54k8vI4ggBDeRA27tgS7ymW++wKEGc3cgphrOOcGMjKyrxYOKDvks/0XC8R
 tv3B4WJM/YwAkYRQ7g2yrFyoxCuqiKc5oWEHoR3qL9IK1ZFIYk8F411zg1Jpi5jyCQV3
 T1/vVapDHY3Ps+NfJZ37vlYcS+PKO62PWQzMKNOi7opScSKuF219dI0rRl0CJ87X+Wwh
 9nKkTo4iQtcZQNbSPbMuT0LizkgHj5rPG7mwzidsCnF9GeaWbz02N1qza7TNomkFmrzN
 wfOQ==
X-Gm-Message-State: AOJu0Yx6XnEQlPAFVjQiAPay9ddGcoQ/DaMHKYFTOL3ORxJ3Tul6/jCR
 UPBbk86S+D38WXtuCGVES+Sz8AZrd1UJX1qHmX06FMZt50JJGJQTQj2ISKDkqdPO4W87qyCfS8/
 2HicueKrII/Pdf4dT8MeW79dsB2J1GSlLh8EaA7HIMjevbHkUjg9biZDwA50wckjsOg==
X-Received: by 2002:a05:620a:4722:b0:785:4588:7a09 with SMTP id
 bs34-20020a05620a472200b0078545887a09mr2762765qkb.3.1707226856074; 
 Tue, 06 Feb 2024 05:40:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV1JhLewj2WzyuV6mJbjtKqCzdBMh7UJ+3tI4Yg38PSz9EUg3UpxjFWaNX43CrNpj4fEFLiA==
X-Received: by 2002:a05:620a:4722:b0:785:4588:7a09 with SMTP id
 bs34-20020a05620a472200b0078545887a09mr2762751qkb.3.1707226855798; 
 Tue, 06 Feb 2024 05:40:55 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXY73u7g+juzT4qNhBv3adaHj4fe+28SURqOK6AMlIWi7SNnZKGhEb2SSunmcFOciqesjrdctJWePLgX61nFQtGT5DaHz6Drpqx3G76kNq/mJa5K3DoJrAWl6f6g4DFCZF0ILo9JChZ4/clq2pplqhGRQMKv+BDBiNhFo86TN0jVsQ0QNTSA6pXfzo/lV39SDF7eXdr0HLEdQW8DLwItLzDNvPVqbSGxXWzQmvii1m9FK8AvubZrpLmdghe10es0xS+rE+5D09CNNgsmtT/eZjDpF1Pbzdgh0a3oxdS5CUX+UBfXjFLQWbZ8iPUzFmXBwQhDDVav0ymM1W7urvifsSe2K0KvynAiVS3TjOJqMuTG/VdoSvxMAAzsrZG9Gk6tkYfCuMm
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b0078544c8be9asm903791qkn.87.2024.02.06.05.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:40:54 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v3 09/10] PCI: Remove legacy pcim_release()
Date: Tue,  6 Feb 2024 14:39:55 +0100
Message-ID: <20240206134000.23561-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206134000.23561-2-pstanner@redhat.com>
References: <20240206134000.23561-2-pstanner@redhat.com>
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
2.43.0

