Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F4286E051
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8270E10ECAF;
	Fri,  1 Mar 2024 11:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xv7LxAFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64CC10ECAF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709292631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDrBrW1QyBkIZW9XXC7FxnbgE53QwXCFFfi0uuWv0Ls=;
 b=Xv7LxAFO63kyj+nclIKvoLVJYyE9miA5sikMuYUSTYHuIJcbjn1ptfvWtRpNgIhQSmN1nl
 vHkykRg4tDjnisQLeVohJIqU39O+dWZnn9hIVi4DESXhKRjtPjfX3gwCbXJQ5L1uBT9DTt
 XU49iNbyxy+NyFnc4NEKGTzoK8YArgw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-5Rp0aSTAP4aHps1s39DiWg-1; Fri, 01 Mar 2024 06:30:29 -0500
X-MC-Unique: 5Rp0aSTAP4aHps1s39DiWg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-68f5e085773so4419566d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 03:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709292629; x=1709897429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nDrBrW1QyBkIZW9XXC7FxnbgE53QwXCFFfi0uuWv0Ls=;
 b=Qma2+oVxUYvqH6C63LKsneyofK9chhgAtk/6hMyJKyxxjH1A+8msxAI1N4ugYm29le
 UozDUKjE9wxv0cw6AjGpzA6+4RvCzwPeZFLIPy5K3MrglIgXucdrNPrqLoBvfpE9aQEQ
 bvYuNIW6kSqlQjlUWucyd1FQXverDt1nLYqtFj5xryrUSjRhJUvz/wqAWBz2KuVPG5JP
 M1J217dNyqL3zt+CFzTvAapIRouNvamys3UQBToCoFXqKQ/99tM2EaKZaNjH58Wg28oF
 xL0rvcrmQOOzfO0qwrUpVhZ1Ifp4ji73Rvy9YX4c9F34VDEQU6fCFDiB7IDPqnWERYzw
 SLlg==
X-Gm-Message-State: AOJu0YzgxbzIASoiIBVm7jvNhi1gdLeX00646inDfdFCCIRyptTfL2WE
 SH2wt1RR1tM/BNO4kbVlz2HbHJSp9A94c0fJlTTh7LKUg4FB1Z6bTlXY6ijtTXLS1w875c5DZBA
 WNOHjXzSGD+kEyUF7iMUElk+uBqYZDHpX+9B/05C48tdetO6/Odmzix3k98nykVXRj16K/yhQ4A
 ==
X-Received: by 2002:ac8:58d0:0:b0:42e:c9b2:5846 with SMTP id
 u16-20020ac858d0000000b0042ec9b25846mr1388320qta.5.1709292628963; 
 Fri, 01 Mar 2024 03:30:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0USADji0WQ4vStz8axm9yU2LeR4404cTuRyF3UBhbQb+Uq0hGVzuRwtUe65EkPR+o7q1ATQ==
X-Received: by 2002:ac8:58d0:0:b0:42e:c9b2:5846 with SMTP id
 u16-20020ac858d0000000b0042ec9b25846mr1388291qta.5.1709292628661; 
 Fri, 01 Mar 2024 03:30:28 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac86781000000b0042eb46d15bbsm1596239qtp.88.2024.03.01.03.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 03:30:28 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v4 09/10] PCI: Remove legacy pcim_release()
Date: Fri,  1 Mar 2024 12:29:57 +0100
Message-ID: <20240301112959.21947-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301112959.21947-1-pstanner@redhat.com>
References: <20240301112959.21947-1-pstanner@redhat.com>
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

