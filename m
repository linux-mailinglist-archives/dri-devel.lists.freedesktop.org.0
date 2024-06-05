Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D888FC5CB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0A010E6EE;
	Wed,  5 Jun 2024 08:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X28/LcsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF5310E6EC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717575391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aq3kAX8nkbuHPE3PafYDv6N/LvIBaqvSpbXV+kCTCaI=;
 b=X28/LcsNVhbPfsxnHRnI4mEaUHsKHwl5OL87qfgmGljsPgK2HIWUld3tnGcKGfBuZh7Qp8
 7rwjdQv5lvngM8QD2OtKFQXKvtAzGatkhRh5LXNB6rMq5i3RbI5Ts6Pm73UuDdV0BwX8nu
 bCZbooP61EQm7VHsXSCZPoWovk5yG9Q=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-yBnZhiLqM7G-5rA__sDx4Q-1; Wed, 05 Jun 2024 04:16:27 -0400
X-MC-Unique: yBnZhiLqM7G-5rA__sDx4Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2eacb8b2ff1so338811fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 01:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575385; x=1718180185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aq3kAX8nkbuHPE3PafYDv6N/LvIBaqvSpbXV+kCTCaI=;
 b=Ph2qPWy9s7IDbXF21mpKjHHX3DHN4KbElbSVFGjMPhZiplrb9tJ7SC9dIGNfGoSK3f
 snJChMGa4hyDqEE7J9FV2FL8SMwOb1xUX4nPigsOZfrT0kijkedObbtk1J8v1kxVhorz
 Pxxmz6o0GzjHpU1PopiFpSsc60EqyOaGnZqM2GpnfKI/ujt+kzhtCUYBQwK4wb8oTEBz
 gjpjQQrjwK5lqe4jRAXTR3b0XTOXYbmVusziQ8MHYGUrd+vheTrfoe/9j8Qjq92SUMEm
 tv918aAoC5U/HXBbiWiWSbbGnQN6nHFcA/7ORovu5AlP932AmNXeNAqs4MiTKeC3Kb4K
 cp+Q==
X-Gm-Message-State: AOJu0YwRzdIkohCTaWZROrbn75FpvXaNza7i2JbX5N4PcQV/ZSj5478V
 SywA9heB/2iPzOMzGunlJahQtV4T/g8dxd7evmEfY6oM3iAr5hYZtW8W9NCgflq9KDbNawSC9nM
 HPKtluTuu9AcZtyN8QKLpMQE+I5r8XHXEzsl1JMiVONB77Lo34LiHkYi3pl3EaIcn3g==
X-Received: by 2002:a2e:7307:0:b0:2ea:9449:7713 with SMTP id
 38308e7fff4ca-2eac7775f64mr7590361fa.0.1717575385674; 
 Wed, 05 Jun 2024 01:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfUtE9m1ruCD6JqFnfuBOCwZgT/GH33J2kpoHwk2yAvGJmqDf2EMoDqqUDaKApN4Naw9gsyQ==
X-Received: by 2002:a2e:7307:0:b0:2ea:9449:7713 with SMTP id
 38308e7fff4ca-2eac7775f64mr7590191fa.0.1717575385284; 
 Wed, 05 Jun 2024 01:16:25 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 ([2001:9e8:32e6:e600:c901:4daf:2476:80ad])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm13739163f8f.76.2024.06.05.01.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:16:24 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v7 09/13] PCI: Give pcim_set_mwi() its own devres callback
Date: Wed,  5 Jun 2024 10:16:01 +0200
Message-ID: <20240605081605.18769-11-pstanner@redhat.com>
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
index 936369face4b..0bafb67e1886 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -361,24 +361,34 @@ void __iomem *devm_pci_remap_cfg_resource(struct device *dev,
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
 
@@ -392,9 +402,6 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_dev *dev = to_pci_dev(gendev);
 	struct pci_devres *this = res;
 
-	if (this->mwi)
-		pci_clear_mwi(dev);
-
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ff439dd05200..dbf6772aaaaf 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -825,7 +825,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 struct pci_devres {
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
-	unsigned int mwi:1;
 };
 
 struct pci_devres *find_pci_dr(struct pci_dev *pdev);
-- 
2.45.0

