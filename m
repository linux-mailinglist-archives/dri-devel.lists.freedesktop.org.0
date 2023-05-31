Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A83717BB2
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8F10E49E;
	Wed, 31 May 2023 09:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F8510E499
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685524884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIF8X9OsdTzv6HWmBfbtRw1tUf5obHITLc3L/FiN9fQ=;
 b=i66pLPP6N9AsOs33BpVPBAOMQ1UiFrChLhtLm69hzDz1dmkJ1WHHVQn3bwfeyZo4hWZDOl
 O7/qNTbdZzLU3B4xgge8lEgjd63w0wYXMRdeav1TGbM063/XsVEq7NPcBomeINGc5Sgz0E
 OgdjYMNbPedr8g2GwA7uJ3trgCNgwQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-eaTGOfFXOD6OgoOtfDVyfA-1; Wed, 31 May 2023 05:21:20 -0400
X-MC-Unique: eaTGOfFXOD6OgoOtfDVyfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F131C85A5A8;
 Wed, 31 May 2023 09:21:19 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E854D492B00;
 Wed, 31 May 2023 09:21:18 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH v2 3/4] drm/mgag200: Add IRQ support
Date: Wed, 31 May 2023 11:21:09 +0200
Message-Id: <20230531092110.140564-4-jfalempe@redhat.com>
In-Reply-To: <20230531092110.140564-1-jfalempe@redhat.com>
References: <20230531092110.140564-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register irq, and enable the softrap irq.
This patch has no functional impact since softrap
irq can't be triggered without DMA.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 38 +++++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_reg.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 976f0ab2006b..a5851dcc6bdd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -110,12 +110,41 @@ resource_size_t mgag200_device_probe_vram(struct mga_device *mdev)
 	return mgag200_probe_vram(mdev->vram, resource_size(mdev->vram_res));
 }
 
+static irqreturn_t mgag200_driver_irq_handler(int irq, void *arg)
+{
+	struct mga_device *mdev = (struct mga_device *) arg;
+	u32 status;
+
+	status = RREG32(MGAREG_STATUS);
+
+	if (status & MGAIRQ_SOFTRAP) {
+		WREG32(MGAREG_ICLEAR, MGAIRQ_SOFTRAP);
+		return IRQ_HANDLED;
+	}
+	return IRQ_NONE;
+}
+
+static void mgag200_init_irq(struct mga_device *mdev)
+{
+	/* Disable *all* interrupts */
+	WREG32(MGAREG_IEN, 0);
+	/* Clear bits if they're already high */
+	WREG32(MGAREG_ICLEAR, 0xf);
+}
+
+static void mgag200_enable_irq(struct mga_device *mdev)
+{
+	/* Enable only Softrap IRQ */
+	WREG32(MGAREG_IEN, MGAIRQ_SOFTRAP);
+}
+
 int mgag200_device_preinit(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	resource_size_t start, len;
 	struct resource *res;
+	int ret;
 
 	/* BAR 1 contains registers */
 
@@ -153,6 +182,13 @@ int mgag200_device_preinit(struct mga_device *mdev)
 	if (!mdev->vram)
 		return -ENOMEM;
 
+	mgag200_init_irq(mdev);
+	ret = devm_request_irq(dev->dev, pdev->irq, mgag200_driver_irq_handler,
+			       IRQF_SHARED, "mgag200_irq", mdev);
+	if (ret < 0) {
+		drm_err(dev, "devm_request_irq(VRAM) failed %d\n", ret);
+		return -ENXIO;
+	}
 	return 0;
 }
 
@@ -184,6 +220,8 @@ int mgag200_device_init(struct mga_device *mdev,
 		MGAREG_MISC_HIGH_PG_SEL;
 	WREG8(MGA_MISC_OUT, misc);
 
+	mgag200_enable_irq(mdev);
+
 	mutex_unlock(&mdev->rmmio_lock);
 
 	return 0;
diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
index aa73463674e4..748c8e18e938 100644
--- a/drivers/gpu/drm/mgag200/mgag200_reg.h
+++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
@@ -107,6 +107,9 @@
 #define	MGAREG_ICLEAR		0x1e18
 #define	MGAREG_IEN		0x1e1c
 
+/* same bit shift for MGAREG_IEN, MGAREG_ICLEAR and MGAREG_STATUS */
+#define MGAIRQ_SOFTRAP		BIT(0)
+
 #define	MGAREG_VCOUNT		0x1e20
 
 #define	MGAREG_Reset		0x1e40
-- 
2.40.1

