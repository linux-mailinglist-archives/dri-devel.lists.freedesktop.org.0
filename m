Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582A389BA91
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465751122BD;
	Mon,  8 Apr 2024 08:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ciJidQA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F62F1122BA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712565885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQbNzzWRGbAMJ/ZvXVtvXB/7D5Q8r5XT3mcCvFUlfNA=;
 b=ciJidQA6CV7jx2JaABOVsPVBJoh+cA8OtZOX7oGNMMbg9eWoRNqXzRbomPkI1hNJTLx2Dq
 5pjzXceHqzsHdZAanOS5Ysdw5VSUrsrvtKSgs/DHrdpeKPwrp2rzeLiT7tI9DKxQRDFERH
 Za5yjC9RziMU+pdrJLLJLWGW+h8QzD8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-eiwRWjJXPvC6_zg38rE15A-1; Mon, 08 Apr 2024 04:44:44 -0400
X-MC-Unique: eiwRWjJXPvC6_zg38rE15A-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-78d670996e4so2636585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712565884; x=1713170684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQbNzzWRGbAMJ/ZvXVtvXB/7D5Q8r5XT3mcCvFUlfNA=;
 b=PuOFJEo/d9hc8q7PPDPJt30J8TzwGNBrOJoCZTuLUBlq0UUEVVWoLwqtBeUght5iNb
 KAfUfCNI+XeL6S+YRVLmOPsvwM1Jh1r5Hol7HEeI/dtkpOMqb1pDMi/sJ2Zp8VClFQRn
 fY2zHArBH7Wd6AkCu+k6Z1dpY3tbK41g2pgLwGMQY/bQzUmZaNzqyWMjX9cr9OkeKDkM
 sV8b0Bv+BILZvMojb1SA/EgdO2mIrdSLejGo4Petzw7I5Y6Da07hWfajKNN3ddZNMTyR
 mj63o9b573vi0D+2cZ8yyRUt/XD2i/Pg9F7PPn0z6S+JOFVUGg+KHRLZY9ilqQXjDh2D
 sFOg==
X-Gm-Message-State: AOJu0Yzdf7nD5JZMxprZcMqoo4DIkQEvQTeVqGVCwtxDJpqJwBqM4Azc
 E6G3rhXwxmSDEsSTi/x19cVprbGw7YMf/PKNetpT6L2qDY9uyyiEfYu99vQPshEtbhHBVua30MD
 AME8xCSjdLaKDIHA9GB21NzV2zgS/hHq8r8mfiEc+BGcau0d+RbVX58IaIgODw3syVg==
X-Received: by 2002:a05:620a:19a9:b0:78d:6439:127d with SMTP id
 bm41-20020a05620a19a900b0078d6439127dmr3282079qkb.0.1712565883923; 
 Mon, 08 Apr 2024 01:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0qa1JgWscwtLKGJLtJEsFGCHRLEHSbkg6kELrSv9oOSNF02qqh4zCKM10yPLZo0wFlJ4eGw==
X-Received: by 2002:a05:620a:19a9:b0:78d:6439:127d with SMTP id
 bm41-20020a05620a19a900b0078d6439127dmr3282068qkb.0.1712565883582; 
 Mon, 08 Apr 2024 01:44:43 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 oo15-20020a05620a530f00b0078d54e39f6csm2036989qkn.23.2024.04.08.01.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:44:43 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v6 07/10] PCI: Give pcim_set_mwi() its own devres callback
Date: Mon,  8 Apr 2024 10:44:19 +0200
Message-ID: <20240408084423.6697-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240408084423.6697-1-pstanner@redhat.com>
References: <20240408084423.6697-1-pstanner@redhat.com>
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
index fb9e4ab6bcfe..e257c212cd9c 100644
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

