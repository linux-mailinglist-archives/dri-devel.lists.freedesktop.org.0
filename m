Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3767E838AA8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AD510E53E;
	Tue, 23 Jan 2024 09:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696CA10E72E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706003102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXd3AZjPKhslGVevCwKeJnsSWxdJPCffQSFxc+gLUxI=;
 b=htqIocic5wMEEigN3VqDERasVJICrfJzL0RIN0/7FPpBAO8VHMCFJGOlPhuX+4r3+mNyW0
 GdARNj6wMsEHqJNInzTpknWzEbmR1KSCPlOoAbJvI/oDH1kTFxv/uUWZnK/WMEJanwG/0U
 r6xJ/iAnSvTYNIcYC0DvfuljMm41PSQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-p1i-Nf_1MFKVnoqHVsn_1w-1; Tue, 23 Jan 2024 04:45:01 -0500
X-MC-Unique: p1i-Nf_1MFKVnoqHVsn_1w-1
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-469be81ec74so294612137.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003101; x=1706607901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXd3AZjPKhslGVevCwKeJnsSWxdJPCffQSFxc+gLUxI=;
 b=EbQ8kQVU657Ahu6sBTmEJRkF3uM4KJ1DZrqsIpNlw8y/FURBckcFo+sk0sFw/me53I
 /Dp4sEry3XAAiRsCWKRrIp1/UH8ujpOihGlFI8777DJGf8rU+JHGMrun4W33pSmv5y3+
 7mq4mUXgkbdT50gBbXaNwzQivlS1tK3NlU/HH7q9bi9Esj0UgxnCAQPacVTTZW9lGtx0
 P1Aag3rRAUFEOapJsAHlZkqHiUQJSlSwGVrs0GwMjxgNR4i+REEe9Y3qQ2qf8SposucK
 7jCZsxq2zJPtj8adDhiVS6bSDXh9hgFq6zDnLVoGZgZIdPilSE9fVoIgyUa5tfB1k9Qj
 YEww==
X-Gm-Message-State: AOJu0YyD+Pi74uJk7pCALRJjTWsx/6T9KVFnm9z99Jrdjq5GaAJycDAg
 esm98dHDc+S5sZVPyBkpMo74jWpA0Jr2KL9q5cg7tVUEZsQ+b0g790iHGG7WaXzBnsVt74EqxiZ
 0ZDk6iZJCE1c9kDMFFAVSRoS3sVsXiKFi8RuzEhqffpQd/0cyREZWnr9NYQHLJi5agQ==
X-Received: by 2002:a05:6122:1684:b0:4bd:4151:936f with SMTP id
 4-20020a056122168400b004bd4151936fmr409244vkl.1.1706003100834; 
 Tue, 23 Jan 2024 01:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRoL1ahcR75vBLXWQC/4Tfk26KCchDZ9UlSe50TIl+tMW6CAPN/T2lwZOJ68o/lL+18tX5pQ==
X-Received: by 2002:a05:6122:1684:b0:4bd:4151:936f with SMTP id
 4-20020a056122168400b004bd4151936fmr409238vkl.1.1706003100567; 
 Tue, 23 Jan 2024 01:45:00 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:45:00 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Stanner <pstanner@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Subject: [PATCH v2 07/10] PCI: give pcim_set_mwi() its own devres callback
Date: Tue, 23 Jan 2024 10:43:04 +0100
Message-ID: <20240123094317.15958-8-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
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
index 03336a2f00d6..d396d672a6f4 100644
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

