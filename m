Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D3906C8A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BB610EA58;
	Thu, 13 Jun 2024 11:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PiAFtViR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5EB10EA4E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kh8+O2F7jgAFtGp/MUXcCP7XcWz8NnTH6l7tP4PdYbo=;
 b=PiAFtViRgML1w+g/qyBSKJpdbaRxNI5jIk6GTUp5TQ4W1ui+eEezWCDUC2fVJK7jKej+5l
 7jA0RS0Vi6ev6LpkqTbBNAIeEk7vSl0qmrCxPDolCsfusi3i0REIR5+bm9cuP9crgj1sXv
 z44lznyyWLrB4rSH9lHmNByJRLMi3I0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-Eu45Gc33N9e88W-B6Fl1EA-1; Thu, 13 Jun 2024 07:50:55 -0400
X-MC-Unique: Eu45Gc33N9e88W-B6Fl1EA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-354dfd4971dso106187f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279454; x=1718884254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kh8+O2F7jgAFtGp/MUXcCP7XcWz8NnTH6l7tP4PdYbo=;
 b=kyk3l3YpJpemx5/2pGzCFVC/tkf5CObm+G5Qq/TO8RrING2QYjCgGZv/Bv5hSH2KIO
 z82p0Irsv1Awx48EKsqkzivbBnRb9hl+lqVsdJRrLv4k5MCLRDs0Vy75fe56Z06S7qkt
 SZF68qZHp7ZofSCtk8zB9l0cpaN1f9tfLliG+8HGxVoHfTFdov74xc6CGyuYpghkoHxz
 I580GaHLDgjm8cKFKC9zrhGKhZT44JSzGi4qL4TLzflU8dpTrUWGRJVNa7Yiqr0emx2M
 xV3O3uv4xgYX/UO03WGhFbUSNFeB8YS7w9CzpgSO4rU/MxsHajDeR57cmjTcWXCxtEZs
 e00Q==
X-Gm-Message-State: AOJu0Yyqz2SGDDeh2R0mtC5PeVAxO2wn7Yh7yuMs3yTCvR5lX5MpTopL
 dyMT3t5cRgzq+bbTLRTTMk3Tj6mYq+fp/b+qj61v7BPhrfHIsi1q8lHNA4DPurabF53gAltnqUA
 vTOg/cjRLMQZYPfzNY4U/26U5OoJSULu951NyPL/2eIkEqpdFnG4xfa3TTDjY8cgj9A==
X-Received: by 2002:a5d:5f93:0:b0:360:6f5c:f5b3 with SMTP id
 ffacd0b85a97d-36079a6be34mr198407f8f.7.1718279454628; 
 Thu, 13 Jun 2024 04:50:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWMTtngZAgGMBECTjwydMRwQNlXRtCSyH8PxV40YfOhooXvc8s+2rU6f0CqUMNMS0veU1KZA==
X-Received: by 2002:a5d:5f93:0:b0:360:6f5c:f5b3 with SMTP id
 ffacd0b85a97d-36079a6be34mr198391f8f.7.1718279454381; 
 Thu, 13 Jun 2024 04:50:54 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:54 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 09/13] PCI: Give pcim_set_mwi() its own devres callback
Date: Thu, 13 Jun 2024 13:50:22 +0200
Message-ID: <20240613115032.29098-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240613115032.29098-1-pstanner@redhat.com>
References: <20240613115032.29098-1-pstanner@redhat.com>
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
index 84caa0034813..e8de93e95eb6 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -366,24 +366,34 @@ void __iomem *devm_pci_remap_cfg_resource(struct device *dev,
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
index 6e02ba1b5947..c355bb6a698d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -823,7 +823,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 struct pci_devres {
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
-	unsigned int mwi:1;
 };
 
 struct pci_devres *find_pci_dr(struct pci_dev *pdev);
-- 
2.45.0

