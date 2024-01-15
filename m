Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C07C82DBB2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 15:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E3B10E305;
	Mon, 15 Jan 2024 14:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984BE10E301
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705330055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EAnPeJipP0+07a3Rzv2/tb0sjf4e9bqcclnBtzQ1Hw=;
 b=Cx6fSw5TJk9PenIZrEnwo/hD4cq2tvNRYIczgs+yOXMTzvlEXaj9CKBe0L3DR4tFL66kRy
 pJsYrgYiqxg3v6Ou7GohcWWlgJkg/qufKuKMlGsNJHiDHy/3FM+KT+H8Hx3jNVVCg/SMAC
 BDMlAC8VTpvcbGvv9aLOrv6XTguzTz0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-m_PfQ5uRNCynHMsoo1rYzw-1; Mon, 15 Jan 2024 09:47:34 -0500
X-MC-Unique: m_PfQ5uRNCynHMsoo1rYzw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5fbfa11838cso5004597b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 06:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330054; x=1705934854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6EAnPeJipP0+07a3Rzv2/tb0sjf4e9bqcclnBtzQ1Hw=;
 b=kQgZ8jKEB9Z0JXsH4zwiv/fqdJ7r/Pf1LlS65LN69J/UNRub+3s8YpXC5V3q8FEarn
 R0ao3qUWNoE4MzN0vwtDt3rT8ovpgmjGgKh/BjkMi3Op6Ui5A3wUIMVxfyQL/U+FdhF+
 SRa+Auz9zJHK1ulRtiKAh7ksibn0mBq2fMXZLuKEnKEqr+TogsnSNCn0mwwIOOs4sCIq
 WLJ3LY9kpvZSGkd0kbpCZTFXqypEYlTe4TprrqzEwTK0gT45u7AHMrG3Q3WXpy+G6cQP
 +yNUpESIo/+ccKQ3+ypaiv1TzJAZDW0c5BI2lvQglCFyGNTC/rFspneikBnSQaMy+Zwn
 0LDA==
X-Gm-Message-State: AOJu0YwVuHq+3Yv/M51G87Qb8yrjlhVr6RAk8/iJsRbL3vo9YnQdJJzP
 LkIttxvU9x6PYSXmcNGRHqEjOD4fLZn4YN52u/DKpNdGQ9+/B106QA9/n2moI8J7r5OuXB0AVOE
 RcWCIU82A8sSUKFtbukn3WPxwEBxEVzXnGzVy
X-Received: by 2002:a81:9201:0:b0:5af:778e:d53b with SMTP id
 j1-20020a819201000000b005af778ed53bmr4653022ywg.0.1705330053953; 
 Mon, 15 Jan 2024 06:47:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcCQGz1Mr7VFhpZST+41Zk2azRO3t8k7Tu1u+nJkXT6NHZsv59rkNJWBrwhybUyX7sFdqIfA==
X-Received: by 2002:a81:9201:0:b0:5af:778e:d53b with SMTP id
 j1-20020a819201000000b005af778ed53bmr4653002ywg.0.1705330053647; 
 Mon, 15 Jan 2024 06:47:33 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ne13-20020a056214424d00b006815cf9a644sm1020720qvb.55.2024.01.15.06.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 06:47:33 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH 09/10] pci: devres: remove legacy pcim_release()
Date: Mon, 15 Jan 2024 15:46:20 +0100
Message-ID: <20240115144655.32046-11-pstanner@redhat.com>
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

Thanks to preceding cleanup steps, pcim_release() is now not needed
anymore and can be replaced by pcim_disable_device(), which is the exact
counterpart to pcim_enable_device().
This permits removing further parts of the old devres API.

Replace pcim_release() with pcim_disable_device().
Remove the now surplus get_dr() function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 7c4edcaeb8fe..87bc62be21eb 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -464,48 +464,26 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 }
 EXPORT_SYMBOL_GPL(pcim_intx);
 
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
+ * Managed pci_enable_device(). Device will automatically be disabled on
+ * driver detach.
  */
 int pcim_enable_device(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
-	int rc;
-
-	dr = get_pci_dr(pdev);
-	if (unlikely(!dr))
-		return -ENOMEM;
-
-	rc = pci_enable_device(pdev);
-	if (!rc)
-		pdev->is_managed = 1;
+	devm_add_action(&pdev->dev, pcim_disable_device, pdev);
 
-	return rc;
+	return pci_enable_device(pdev);
 }
 EXPORT_SYMBOL(pcim_enable_device);
 
-- 
2.43.0

