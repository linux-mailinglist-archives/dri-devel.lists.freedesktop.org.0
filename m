Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5E53ED3C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 19:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C418920E;
	Mon,  6 Jun 2022 17:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4185111BC52
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 17:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654538008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfD1tbvBdtS906lBuWttr7mz/0+ljzq4D8mcZKfR97o=;
 b=RgdQeNsybHbQR5TViplrz3IT3putidA/20VQXpT+PuH4cpT0Ot7h6CzC1ao+6z4QW7h1Vj
 iucOewHC8uB13DkyrqENwORI8FQIBWJNLJjnLjlUTQmC1lUxNEAxqBK0WSzsVqKu/j+RM9
 pQ6gOKXO5KWzAa+K+WY1EUH2AbYyyh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-qFqYIho4N0G1S-XqmJmQmA-1; Mon, 06 Jun 2022 13:53:24 -0400
X-MC-Unique: qFqYIho4N0G1S-XqmJmQmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A72801E6B;
 Mon,  6 Jun 2022 17:53:23 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.35.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0A411121314;
 Mon,  6 Jun 2022 17:53:22 +0000 (UTC)
Subject: [PATCH 1/2] drm/aperture: Split conflicting platform driver removal
From: Alex Williamson <alex.williamson@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 06 Jun 2022 11:53:22 -0600
Message-ID: <165453800256.3592816.10844562232615146019.stgit@omen>
In-Reply-To: <165453797543.3592816.6381793341352595461.stgit@omen>
References: <165453797543.3592816.6381793341352595461.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: kvm@vger.kernel.org, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the removal of platform drivers conflicting with PCI resources from
drm_aperture_remove_conflicting_pci_framebuffers() to support both non-DRM
callers and better modularity.  This is intended to support the vfio-pci
driver, which can acquire ownership of PCI graphics devices, but is not
itself a DRM or FB driver, and therefore has no Kconfig dependencies.  The
remaining actions of drm_aperture_remove_conflicting_pci_framebuffers() are
already exported from their respective subsystems, therefore this allows
vfio-pci to separate each set of conflicts independently based on the
configured features.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 drivers/gpu/drm/drm_aperture.c |   33 ++++++++++++++++++++++++---------
 include/drm/drm_aperture.h     |    2 ++
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 74bd4a76b253..5b2500f7fb8b 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -313,6 +313,28 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
 }
 EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 
+/**
+ * drm_aperture_detach_platform_drivers - detach platform drivers conflicting with PCI device
+ * @pdev: PCI device
+ *
+ * This function detaches platform drivers with resource conflicts to the memory
+ * bars of the provided @pdev.
+ */
+void drm_aperture_detach_platform_drivers(struct pci_dev *pdev)
+{
+	resource_size_t base, size;
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
+		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
+			continue;
+		base = pci_resource_start(pdev, bar);
+		size = pci_resource_len(pdev, bar);
+		drm_aperture_detach_drivers(base, size);
+	}
+}
+EXPORT_SYMBOL(drm_aperture_detach_platform_drivers);
+
 /**
  * drm_aperture_remove_conflicting_pci_framebuffers - remove existing framebuffers for PCI devices
  * @pdev: PCI device
@@ -328,16 +350,9 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						     const struct drm_driver *req_driver)
 {
-	resource_size_t base, size;
-	int bar, ret = 0;
+	int ret = 0;
 
-	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
-		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-			continue;
-		base = pci_resource_start(pdev, bar);
-		size = pci_resource_len(pdev, bar);
-		drm_aperture_detach_drivers(base, size);
-	}
+	drm_aperture_detach_platform_drivers(pdev);
 
 	/*
 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
index 7096703c3949..53fd36fa258e 100644
--- a/include/drm/drm_aperture.h
+++ b/include/drm/drm_aperture.h
@@ -15,6 +15,8 @@ int devm_aperture_acquire_from_firmware(struct drm_device *dev, resource_size_t
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 bool primary, const struct drm_driver *req_driver);
 
+void drm_aperture_detach_platform_drivers(struct pci_dev *pdev);
+
 int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 						     const struct drm_driver *req_driver);
 


