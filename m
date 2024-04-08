Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6489BA94
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7891122C4;
	Mon,  8 Apr 2024 08:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EFvAU//V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897881122BE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712565890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIKnJtHF26OJHg4kpBO8DHHyo5/AIkRLYVzYG0l0EPg=;
 b=EFvAU//VNWGgnr6oki04znarIKg3bK42ihVSiBZLzcYBUIE0WqmbcPuLQeMey+rwazCJP/
 T2eWPzwMy0wLmAvW1tnqVYZaJm2vDh4cQdDy54BPxZ0IfaPVNDk7P40kvMmOyjK0N59NMG
 XKmmw3jHIjBL0rd/+KR9J+0YjfLJ81I=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-cVcFdJ-4MIaWaXZotI78EA-1; Mon, 08 Apr 2024 04:44:49 -0400
X-MC-Unique: cVcFdJ-4MIaWaXZotI78EA-1
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-479d52894a3so46250137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 01:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712565888; x=1713170688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIKnJtHF26OJHg4kpBO8DHHyo5/AIkRLYVzYG0l0EPg=;
 b=b1xsrZr13CEneM6SxNyd0R6KlcXSjvuA6RAR3hF2+jk4GDHjliDYN5e1PMFBrg8FAP
 UCSsH6jLTJuCHqNYcxXTe0fPklVQ/Dn58eJbx6Yr1lTb+Ng73t5ZFMngo3E0WsMruK+O
 kGEN9XxVi8ZfQO0g57jh8Pm+mtUURLGSwB87ZQ9nGYewX0YaRhL/HLHtpjScUszqQ5lz
 Fj8J23xq54E+1BRrGVA5+ua6Ds0ZTzwmBRRpOC0zmKX/ru3/6gie2KbsPrOZs4iiJfdw
 IqZ+N5gd3RwnX983Ux732npLIqBKGQCGBdQwsEje9xnAotYqNX5Jii/1en3xalgT0XCX
 YlTw==
X-Gm-Message-State: AOJu0Yx+CLMF+tUSy/J5eePHufCNzvumDMcfuyEgSTCOqXSM9XFVcABC
 LZr1fztEZ+4l6KlnuaXTzEhAQ1xfS2mpA7Z1xBK+AJHUJ9pjhCe2GjsAVk4OjV448Z3OBxKqcGP
 wfNRI++1IEL9FRX+hHj1ivO6lry++2JY24pL2+A7DHDE66r/qok/V0SOLUhFEqW4FrQ==
X-Received: by 2002:a67:f610:0:b0:479:dedd:565f with SMTP id
 k16-20020a67f610000000b00479dedd565fmr4684465vso.2.1712565888598; 
 Mon, 08 Apr 2024 01:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+VVRQtoyNoPL7BOIfq0nBVbWMHsJxHqXPuBD7jjNvaEZvxqdDMSuVChpXM2urhBCQM1pWA==
X-Received: by 2002:a67:f610:0:b0:479:dedd:565f with SMTP id
 k16-20020a67f610000000b00479dedd565fmr4684452vso.2.1712565888186; 
 Mon, 08 Apr 2024 01:44:48 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 oo15-20020a05620a530f00b0078d54e39f6csm2036989qkn.23.2024.04.08.01.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 01:44:47 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v6 09/10] PCI: Remove legacy pcim_release()
Date: Mon,  8 Apr 2024 10:44:21 +0200
Message-ID: <20240408084423.6697-10-pstanner@redhat.com>
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
index b81bbb9abe51..1229704db2dc 100644
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

