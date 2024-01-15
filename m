Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAE82DBAB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 15:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720DA10E2FD;
	Mon, 15 Jan 2024 14:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CB810E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705330050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+s18P47JH053YQ7YJMWBY/f4LBPoNabsZFa7u4jw7Zc=;
 b=atqgXg+9UWyF1CtFVTr/TTi4tlV8vxp/vghADDo2enwZJxVjtRvlD3iSgU5/6WFcxBbdms
 HXeooRV1/Vy7YN9mxynhCYXOK0F3xXT27ZWvfmUGC3s16Z9Ddu3L8Dwa5kGZ1bu57Cr9fj
 +ysuINMw9MhRf46KqdjxBRQ1XArhKvk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-QNVgCTH3OH-VrnVASsitBA-1; Mon, 15 Jan 2024 09:47:29 -0500
X-MC-Unique: QNVgCTH3OH-VrnVASsitBA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-429d02a62f8so5664321cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330048; x=1705934848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+s18P47JH053YQ7YJMWBY/f4LBPoNabsZFa7u4jw7Zc=;
 b=mp/E0KE49P07mpE9dJkz7VgU6DjDhLCB489WBUwXrIcRqmXfcKjsveue9Dv50NTIc6
 EN3d76JymCIxIAeMCzji92Fw5ce3tSOZrkb+/JtPClqUbTrlNLv8S6jX+rsW+pJI0ls0
 1BwRQ0gXFH+FJL9ClnG7NRUtDfl4Bn/o6eHG+qtTo0diiwlhdPEtY9obNnvbSOtH7QwE
 jM1h7ZyIREbpUYznESXFSDvV4/h4E9RmRm2iBBuIF5TgH/EE42XodOwVq43fOBRj6Iul
 52o2UQdtzCZ40lRFHy7M+pRuSgiF36xZYfYh9m4qKZlTh6erlUDZiRtWrN1yfM9vzYyD
 jxhg==
X-Gm-Message-State: AOJu0YyagCc1AuSgtpylp+PqTT+Dot4TEu8xjWcqcT0dRv64YwXcP8vj
 u/uVPbEjr472YAIDMqv8dFJh88gS4kx0tzGc3GSb504+9/9Hs6qLiKtSNMwRSxvPUu6wzH5fLae
 CzK3PyQZ+ATyiOit+WYZoRDAygYi9whFAwgVS
X-Received: by 2002:a05:6214:20ca:b0:681:555c:8e64 with SMTP id
 10-20020a05621420ca00b00681555c8e64mr6594571qve.6.1705330048587; 
 Mon, 15 Jan 2024 06:47:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIFNFH3t9YBVxCpLVDR4bI9FQ3w+V6Y/t4RZxhNK4CjYtj3KjB51ezdoAU+KVMDwPukDm1tQ==
X-Received: by 2002:a05:6214:20ca:b0:681:555c:8e64 with SMTP id
 10-20020a05621420ca00b00681555c8e64mr6594555qve.6.1705330048349; 
 Mon, 15 Jan 2024 06:47:28 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ne13-20020a056214424d00b006815cf9a644sm1020720qvb.55.2024.01.15.06.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 06:47:28 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH 07/10] pci: devres: give mwi its own callback
Date: Mon, 15 Jan 2024 15:46:18 +0100
Message-ID: <20240115144655.32046-9-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115144655.32046-2-pstanner@redhat.com>
References: <20240115144655.32046-2-pstanner@redhat.com>
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

managing mwi with devres can easily be done with its own callback,
without the necessity to store any state about it in a device-related
struct.

Remove the mwi state from the devres-struct.
Make the devres-mwi functions set a separate devres-callback.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 23 +++++++++++------------
 drivers/pci/pci.h    |  1 -
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index de8cf6f87dd7..911c2037d9fd 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -378,24 +378,26 @@ void __iomem *devm_pci_remap_cfg_resource(struct device *dev,
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
-
-	dr = find_pci_dr(dev);
-	if (!dr)
-		return -ENOMEM;
+	devm_add_action(&pdev->dev, __pcim_clear_mwi, pdev);
 
-	dr->mwi = 1;
-	return pci_set_mwi(dev);
+	return pci_set_mwi(pdev);
 }
 EXPORT_SYMBOL(pcim_set_mwi);
 
@@ -405,9 +407,6 @@ static void pcim_release(struct device *gendev, void *res)
 	struct pci_dev *dev = to_pci_dev(gendev);
 	struct pci_devres *this = res;
 
-	if (this->mwi)
-		pci_clear_mwi(dev);
-
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 3d9908a69ebf..667bfdd61d5e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -811,7 +811,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 struct pci_devres {
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
-	unsigned int mwi:1;
 };
 
 struct pci_devres *find_pci_dr(struct pci_dev *pdev);
-- 
2.43.0

