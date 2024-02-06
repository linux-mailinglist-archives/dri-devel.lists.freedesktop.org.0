Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBFF84B6A2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DAC112BF7;
	Tue,  6 Feb 2024 13:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H9Vv3PxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BC1112BF7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707226852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AZZPeDLSIQhGpyqdXYj5Wako5b4bPLUCKUFeVUAK8s=;
 b=H9Vv3PxDaa5/gTEXsGm+But/UCENaPslzzvPgX8DL4FP96+5P9NOXKWi7kcKu6S2lejBum
 u8FY6UsNGcSzbe3p8F+qWdDvO+FYqW4vBtb76y3ZrqT+ePqLan5VXqqcn/ZWRvHmm1RoBx
 pGbiYhDlXYfRftlW3k8s/JTclAuIgP8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-AWAZ2Cb6Nbq-sIgKCOcQkA-1; Tue, 06 Feb 2024 08:40:51 -0500
X-MC-Unique: AWAZ2Cb6Nbq-sIgKCOcQkA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78543d8dfd6so47976085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226850; x=1707831650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AZZPeDLSIQhGpyqdXYj5Wako5b4bPLUCKUFeVUAK8s=;
 b=rzEsGy9YTL+vVEnZvSQIWaj1cPxVMVD+RkH5QvQgp42KmnsmDvemkhN9eHNKjMBkD6
 O4aODsJMpv5TUJpDMZMmJuBNBhC+gSCZ131CvvSq5YQ8PNkyADPsK1jiDc9lPbOKBcbo
 0m+jVDR2ClkWmLRiRyT6rzB4OtSfatc0saBTUGO1hDnUUTB1VsOm/V8BoZQzN5NRLabK
 g3g7oU4M3YOaijbAsbu8Sr9jS6TT/yaHwNjFIYfSqkThBx25wXOGRCj99XqkwpzQg24O
 YPe2v+AL430i1cjYpRaCa4FzrfKozI1EE8mBQ+lvDp3eIDiW2uXuxIPk4z3uU0aTL8h9
 LcFQ==
X-Gm-Message-State: AOJu0YxK38ywOCYbXthrYAPQv30Ss2OlLYGOtSCXTiVLaYanXh/1/wuv
 NNPj6nhhhHaj9ZGAO+M9EfmoUbvShqHeyQye7LPC8xS9a5IyzcN3YFGRAobrz8ps+I/vBKg2ho/
 DNJhdkCjx9MbhZmaWJ64lRU9BCkgSCiICuOSEG3LpftXIXRnl34kwErBDSJEwzGeauA==
X-Received: by 2002:a05:620a:4714:b0:785:65bc:6cc1 with SMTP id
 bs20-20020a05620a471400b0078565bc6cc1mr2808217qkb.5.1707226850498; 
 Tue, 06 Feb 2024 05:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGA3J2SmhDbLIkmBgpnKC5JdiwJtMw1ckxnT3hwEWV0axzm5SHplj8KnispOqMd1RbncWsow==
X-Received: by 2002:a05:620a:4714:b0:785:65bc:6cc1 with SMTP id
 bs20-20020a05620a471400b0078565bc6cc1mr2808193qkb.5.1707226850162; 
 Tue, 06 Feb 2024 05:40:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWxKz2AS2kCg26W1YFQSCC6cN1TQFyl00vI8SJusbemv44LJDN294ZNx81ZJTllVzo6lrDYzd9cB9u2oUv/09MqwrPZMkh+cmCIjsyWL/V5LIkRYx150ArqnQekZaEu9Gw4ZKQmIPFG9mFjy2eFjaoHxoZpj9Wqas5mrNDPaAXdH9g0P2JNNqXBvb7aD1Df5LmUywY3BqqckFtKGmHWfGl8JxXokTkpbxqEo2LGQmOidzl6+nkC5S7gyDkomYtorhMcYCQVaRM8RTMnAqh8VFdCPAeK8I/tAPufT5yUwq22SxbR/clnAu17itZMQbSGnNxW4FjnviRCGUWOqd6zxcI/CtVYyCazSInsFGpRzGpoO9yDr58I+rPaTOhNNcGAS2YJojI3
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b0078544c8be9asm903791qkn.87.2024.02.06.05.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:40:48 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v3 07/10] PCI: Give pcim_set_mwi() its own devres callback
Date: Tue,  6 Feb 2024 14:39:53 +0100
Message-ID: <20240206134000.23561-9-pstanner@redhat.com>
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

Managing pci_set_mwi() with devres can easily be done with its own
callback, without the necessity to store any state about it in a
device-related struct.

Remove the MWI state from struct pci_devres.
Give pcim_set_mwi() a separate devres-callback.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 29 ++++++++++++++++++-----------
 drivers/pci/pci.h    |  1 -
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 628cde665e77..89d2d6341b19 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -370,24 +370,34 @@ void __iomem *devm_pci_remap_cfg_resource(struct device *dev,
 }
 EXPORT_SYMBOL(devm_pci_remap_cfg_resource);
 
+static void __pcim_clear_mwi(void *pdev_raw)
+{
+	struct pci_dev *pdev = pdev_raw;
+
+	pci_clear_mwi(pdev);
+}
+
 /**
  * pcim_set_mwi - a device-managed pci_set_mwi()
- * @dev: the PCI device for which MWI is enabled
+ * @pdev: the PCI device for which MWI is enabled
  *
  * Managed pci_set_mwi().
  *
  * RETURNS: An appropriate -ERRNO error value on error, or zero for success.
  */
-int pcim_set_mwi(struct pci_dev *dev)
+int pcim_set_mwi(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
+	int ret;
 
-	dr = find_pci_dr(dev);
-	if (!dr)
-		return -ENOMEM;
+	ret = devm_add_action(&pdev->dev, __pcim_clear_mwi, pdev);
+	if (ret != 0)
+		return ret;
+
+	ret = pci_set_mwi(pdev);
+	if (ret != 0)
+		devm_remove_action(&pdev->dev, __pcim_clear_mwi, pdev);
 
-	dr->mwi = 1;
-	return pci_set_mwi(dev);
+	return ret;
 }
 EXPORT_SYMBOL(pcim_set_mwi);
 
@@ -397,9 +407,6 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_dev *dev = to_pci_dev(gendev);
 	struct pci_devres *this = res;
 
-	if (this->mwi)
-		pci_clear_mwi(dev);
-
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 586b2047c275..eaec3b207908 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -813,7 +813,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 struct pci_devres {
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
-	unsigned int mwi:1;
 };
 
 struct pci_devres *find_pci_dr(struct pci_dev *pdev);
-- 
2.43.0

