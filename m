Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65978967AE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 10:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071E81127A4;
	Wed,  3 Apr 2024 08:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Cd8tmHDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8911127A8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 08:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712131657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cue9RiOq2u8xaSRa3oZ0BA3tVb1Vqx6Ro2Uj9/y6Eog=;
 b=Cd8tmHDoo2pvJeWa0vCkwUQtmMzK3Y0bWwys36oKymCeJqBpexKb1y6CaUCE8kFXKsKcSY
 gv5vvN7pig31qq/oh9NRpve85+WZM2foLAdTXhpPYAZh9iYvLR5/5+qkH69nHrjZdzFLOg
 VyKF33agv7XmkHpqpCX6pJslfAhAZFw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-lbFE85PpMcumLAQc5zX48g-1; Wed, 03 Apr 2024 04:07:36 -0400
X-MC-Unique: lbFE85PpMcumLAQc5zX48g-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-516b89a9304so137717e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 01:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712131654; x=1712736454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cue9RiOq2u8xaSRa3oZ0BA3tVb1Vqx6Ro2Uj9/y6Eog=;
 b=PS7ahVgKtQSWnEjBMua+uCCiaBSf83ecU6i+cT0o3lxEoNkiU9fBFts614WeLpG5k5
 5raJHC+7C+LOzvAu+WF/9gBnhIjztYSIdlZ1AdUATog/w+JrmcQjijHREzS21PyqawTg
 kTXu8p/r2Z9YIKltFg/qNsdT3uV1QPqq2popNYEofP7r2rpyvQpkbzYyIgiyBINOWLY9
 4SEYT0WfzBW5iebxZ32Y1oeafiF6sAj5mM5pAXCpbtxqVtV4Dgib/vcUX1Js9w0/dwt/
 yroK1RdbOwlusviTB/4qePrGRCNoz9mBFS9nweDP4NMyBB1jIZUjPy05iVvK7ABLNwrH
 nHlA==
X-Gm-Message-State: AOJu0Ywttf58wsZotGl66Ov6mBR+14ElG+nilNBdqhsG5MxbMUoZHIcx
 vxsoNPz2pejUVyE4y25KdLBaxDyRHJACBny4UoKKWKpf6RiCWtc4F0ixErQl6iDemMFYUFg8glV
 LhRs1Et7L0E2oebuMk4j0M/s2NK7tUY6Ve/Unwi8kq6/4XjuPK0QYtZcMyWs1CyFfeGs5k56BbA
 ==
X-Received: by 2002:a19:6408:0:b0:513:ec32:aa89 with SMTP id
 y8-20020a196408000000b00513ec32aa89mr9634492lfb.2.1712131654435; 
 Wed, 03 Apr 2024 01:07:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZr6Moc6yeNkVktye+4f5uvCTSx03uQs8gFxj+LYLLOGMp3Q773YJIcp1E3B3wobP5BG7d+g==
X-Received: by 2002:a19:6408:0:b0:513:ec32:aa89 with SMTP id
 y8-20020a196408000000b00513ec32aa89mr9634474lfb.2.1712131654077; 
 Wed, 03 Apr 2024 01:07:34 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 fa14-20020a05600c518e00b004159df274d5sm5504535wmb.6.2024.04.03.01.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:07:33 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v5 07/10] PCI: Give pcim_set_mwi() its own devres callback
Date: Wed,  3 Apr 2024 10:07:08 +0200
Message-ID: <20240403080712.13986-10-pstanner@redhat.com>
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
index 076362740791..e417bd3ea96f 100644
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
index a080efd69e85..c98de280b16e 100644
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
2.44.0

