Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA8901E3E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42B10E3F6;
	Mon, 10 Jun 2024 09:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CL95gIFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E00C10E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718011931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0E+yd/NqAYSK8WFgRSEHpHq5LwGzPXxKeB5ucvUWBek=;
 b=CL95gIFzuER6R9wcpY8cQSL2ClarpYzmxPCP/4P2UCDNVgizlg7Iq32K1ToDD1s8vvJlz2
 bdMWe8e3TkUx8oinx/07WjK9l3qlzaShZNsYoPklBMcyV7mWJ99zHC/suw4gf+eNG950H4
 Q4yABKDKTZmNPcpTkH7EWGAshXlXjr0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-nG4LG7ZqNImYXZ9WIcZQ7A-1; Mon, 10 Jun 2024 05:32:09 -0400
X-MC-Unique: nG4LG7ZqNImYXZ9WIcZQ7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42180a0730dso1799585e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718011929; x=1718616729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0E+yd/NqAYSK8WFgRSEHpHq5LwGzPXxKeB5ucvUWBek=;
 b=xDPxSRih1wc5mGyszkW1MvVcNT7cKjrIUwe5f+2yWQXkKEgl8I11uFuBBGDNVBD9nD
 IvMN6s9IzaNXmBenqLiROrdYlEZ1u9fEyFmOtZkLkn2iYmElAzsN6cJMT2M2ItRwtjnf
 056xIxOJ4Hq/Tnv3HaNMb9HBrJMfGqaYS4bxsj6CmdT5cq1SFHHHieV3KwemkRRqK/Ig
 j01R9cSd6/mK51M7dQqR4lxhgBMLAdnJjX/6y30zVmnZyTE/oEwP6TVYm9qvNY0c7Dpr
 wUehyC7z/I7O3L8uchiKQxjW8F5Akx22h4g/9s2wg2dNd1oaVPbFxSkdUNce9T5+tmZq
 a1YQ==
X-Gm-Message-State: AOJu0Yw8vuDnm6/eIWlJ4Og1/Fj9vustIlCHXWqJ9kaDCD9cz5l9n92/
 7NDuC8GYJxZVl+TZoPbUpXCcS1eOdtQZsnYLJMs1JugtowxS/BKiW6W09haGzDyONgeepOoSgqc
 MnQ6biikeFPQiXlrQ4rs/7TnBHBOHS6914JnDUgKjBJoHiGdHvaBAAxQ/cbARzUp1Yw==
X-Received: by 2002:a5d:464b:0:b0:35f:247e:fbcb with SMTP id
 ffacd0b85a97d-35f247efda6mr1269299f8f.2.1718011928887; 
 Mon, 10 Jun 2024 02:32:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrZxYD3HEuC5SQMDdGziGt7mw/V9beP3O+PtWTxv0mACsmhdqWKMeo5TR1WqKS8I+N5uEZTw==
X-Received: by 2002:a5d:464b:0:b0:35f:247e:fbcb with SMTP id
 ffacd0b85a97d-35f247efda6mr1269289f8f.2.1718011928640; 
 Mon, 10 Jun 2024 02:32:08 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0ce4b62fsm7257545f8f.80.2024.06.10.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:32:08 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v8 09/13] PCI: Give pcim_set_mwi() its own devres callback
Date: Mon, 10 Jun 2024 11:31:31 +0200
Message-ID: <20240610093149.20640-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240610093149.20640-1-pstanner@redhat.com>
References: <20240610093149.20640-1-pstanner@redhat.com>
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
index 2696baef5c2c..a0a59338cd92 100644
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

