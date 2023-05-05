Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CDF6F8333
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A4C10E5E4;
	Fri,  5 May 2023 12:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87EA10E5E4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683290709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjX6kqPEJ/qzmXANpzOrPz2+nR/DYefmobmnJ058wHA=;
 b=bgxj7L1bkAaacihUKMuG0OAHC7wc1UcGG8gEOUmvIJheIrJwV3+30InxKKhfGBJP6BQURE
 mS28UHHIG1jH0vTMgf0XuDGYdr8uh6z2ErU/ybMkPfaS4nT1W17rPpFHGOdgJifJ57URiP
 tksqIST2itq54hsuMgZIMIXiX8yTPmw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-KofdnPEmOp2IXgRs4dC8yg-1; Fri, 05 May 2023 08:43:57 -0400
X-MC-Unique: KofdnPEmOp2IXgRs4dC8yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 237B4884629;
 Fri,  5 May 2023 12:43:57 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D12D2166B31;
 Fri,  5 May 2023 12:43:55 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [PATCH 3/4] drm/mgag200: Add IRQ support
Date: Fri,  5 May 2023 14:43:36 +0200
Message-Id: <20230505124337.854845-4-jfalempe@redhat.com>
In-Reply-To: <20230505124337.854845-1-jfalempe@redhat.com>
References: <20230505124337.854845-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
 drivers/gpu/drm/mgag200/mgag200_drv.c | 41 +++++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h |  3 ++
 drivers/gpu/drm/mgag200/mgag200_reg.h |  3 ++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 976f0ab2006b..3566fcdfe1e4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -110,12 +110,43 @@ resource_size_t mgag200_device_probe_vram(struct mga_device *mdev)
 	return mgag200_probe_vram(mdev->vram, resource_size(mdev->vram_res));
 }
 
+irqreturn_t mgag200_driver_irq_handler(int irq, void *arg)
+{
+	struct mga_device *mdev = (struct mga_device *) arg;
+	u32 status;
+
+	status = RREG32(MGAREG_STATUS);
+
+	if (status & MGAIRQ_SOFTRAP) {
+		WREG32(MGAREG_ICLEAR, MGAIRQ_SOFTRAP);
+		mdev->dma_in_use = 0;
+		wake_up(&mdev->waitq);
+		return IRQ_HANDLED;
+	}
+	return IRQ_NONE;
+}
+
+void mgag200_init_irq(struct mga_device *mdev)
+{
+	/* Disable *all* interrupts */
+	WREG32(MGAREG_IEN, 0);
+	/* Clear bits if they're already high */
+	WREG32(MGAREG_ICLEAR, 0xf);
+}
+
+void mgag200_enable_irq(struct mga_device *mdev)
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
 
@@ -153,6 +184,16 @@ int mgag200_device_preinit(struct mga_device *mdev)
 	if (!mdev->vram)
 		return -ENOMEM;
 
+	mgag200_init_irq(mdev);
+	ret = devm_request_irq(dev->dev, pdev->irq, mgag200_driver_irq_handler,
+			       IRQF_SHARED, "mgag200_irq", mdev);
+	if (ret < 0) {
+		drm_err(dev, "devm_request_irq(VRAM) failed %d\n", ret);
+		return -ENXIO;
+	}
+	init_waitqueue_head(&mdev->waitq);
+
+	mgag200_enable_irq(mdev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 9e604dbb8e44..02175bfaf5a8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -291,6 +291,9 @@ struct mga_device {
 	void __iomem			*vram;
 	resource_size_t			vram_available;
 
+	wait_queue_head_t waitq;
+	int dma_in_use;
+
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
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
2.39.2

