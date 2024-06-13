Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785E8906C86
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E616B10EA54;
	Thu, 13 Jun 2024 11:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cMndYOhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849CD10EA4A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718279455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMEejGKihJo2G832kSH48RcHSFeE2XrrHWpYzOQBaEo=;
 b=cMndYOhU+rATeI89+n8rUh+Te/KbTlBdkJhrl47M7vE5N/aw6olyU3qa2Pf6XOq9TG6ly1
 8UlgCdGrCqdT1QiTT6sM0gL7931gLpdMF5lMvF8p8UV6j6euQZ7kyHDIACx078SEOa7Y48
 c8DkZ+Zm00c3ViunsdZYUJkpPT8WkZg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-K0SmKit1NKOKbT1XIPcWPQ-1; Thu, 13 Jun 2024 07:50:54 -0400
X-MC-Unique: K0SmKit1NKOKbT1XIPcWPQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ebf1470cbaso443161fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718279452; x=1718884252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qMEejGKihJo2G832kSH48RcHSFeE2XrrHWpYzOQBaEo=;
 b=mF2ZsxCBBFZPaspEMKmx+/+bZ+EJVIyo6zBS4wkvEkf4sZ0kwZKdF7quhqYwSG/CeD
 r7GHQ4DqjJkvOun/Bj6vvEz6HfXavfBYMH0262aBvfP6vUNS6s5wdXE4tZ9zNk+9nRj4
 KN8kczAlX36lz93YSpYSNvpV6toOubVdJeIRHKdz9V7B+29rZ+skr5mJOvYrCqSbavSa
 fOuXBcVmsXCdXBOjPTd7HuPVzDSlzONQgnETx2dV4b1feCKaqp7XDGROI3b0mGRGSf3K
 2g9TChNGZjGLhdm56izIuz7+j3kJZW6+g65OSXjd7w28ENqu4bdmtXdcvL26PbSLeqYp
 Z2FQ==
X-Gm-Message-State: AOJu0Yxa9oyDc0Q2P+rtzRuavfEG10xxMEsa3R/9WZedSQkz0alBnV2g
 CU2brNf+YapxyOnveZ5k8LgKGcm0Ac72HJx6a3GDPNiWGVjkZq7dlu0AP2QEDyA/y1XhKq3dT0E
 CmL5dPWaxybFU/EmsKWc78ZBT7KXM+BbyQAjQqXzRUb7FAILHo0qLxECj64kWeZUpxA==
X-Received: by 2002:a05:6512:1598:b0:52c:8784:5b2c with SMTP id
 2adb3069b0e04-52ca5d03c67mr13443e87.3.1718279452682; 
 Thu, 13 Jun 2024 04:50:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEqupRIXquizQF60Ogvk1gSUj/lELnfPgWk0B7d0l5dOVUd+wsdDCM/WABqJ9TrRzGJhmkEQ==
X-Received: by 2002:a05:6512:1598:b0:52c:8784:5b2c with SMTP id
 2adb3069b0e04-52ca5d03c67mr13426e87.3.1718279452377; 
 Thu, 13 Jun 2024 04:50:52 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c883sm1510620f8f.29.2024.06.13.04.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:50:51 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v9 07/13] PCI: Remove enabled status bit from pci_devres
Date: Thu, 13 Jun 2024 13:50:20 +0200
Message-ID: <20240613115032.29098-8-pstanner@redhat.com>
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

The PCI devres implementation has a separate boolean to track whether a
device is enabled. That, however, can easily be tracked in an agnostic
manner through the function pci_is_enabled().

Using it allows for simplifying the PCI devres implementation.

Replace the separate 'enabled' status bit from struct pci_devres with
calls to pci_is_enabled() at the appropriate places.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 11 ++++-------
 drivers/pci/pci.c    |  6 ------
 drivers/pci/pci.h    |  1 -
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index d90bed785c3f..643e3a94a1d6 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -403,7 +403,7 @@ static void pcim_release(struct device *gendev, void *res)
 	if (this->restore_intx)
 		pci_intx(dev, this->orig_intx);
 
-	if (this->enabled && !this->pinned)
+	if (pci_is_enabled(dev) && !this->pinned)
 		pci_disable_device(dev);
 }
 
@@ -446,14 +446,11 @@ int pcim_enable_device(struct pci_dev *pdev)
 	dr = get_pci_dr(pdev);
 	if (unlikely(!dr))
 		return -ENOMEM;
-	if (dr->enabled)
-		return 0;
 
 	rc = pci_enable_device(pdev);
-	if (!rc) {
+	if (!rc)
 		pdev->is_managed = 1;
-		dr->enabled = 1;
-	}
+
 	return rc;
 }
 EXPORT_SYMBOL(pcim_enable_device);
@@ -471,7 +468,7 @@ void pcim_pin_device(struct pci_dev *pdev)
 	struct pci_devres *dr;
 
 	dr = find_pci_dr(pdev);
-	WARN_ON(!dr || !dr->enabled);
+	WARN_ON(!dr || !pci_is_enabled(pdev));
 	if (dr)
 		dr->pinned = 1;
 }
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 5e4f377411ec..db2cc48f3d63 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2218,12 +2218,6 @@ void pci_disable_enabled_device(struct pci_dev *dev)
  */
 void pci_disable_device(struct pci_dev *dev)
 {
-	struct pci_devres *dr;
-
-	dr = find_pci_dr(dev);
-	if (dr)
-		dr->enabled = 0;
-
 	dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
 		      "disabling already-disabled device");
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 2403c5a0ff7a..d7f00b43b098 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -821,7 +821,6 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
  * then remove them from here.
  */
 struct pci_devres {
-	unsigned int enabled:1;
 	unsigned int pinned:1;
 	unsigned int orig_intx:1;
 	unsigned int restore_intx:1;
-- 
2.45.0

