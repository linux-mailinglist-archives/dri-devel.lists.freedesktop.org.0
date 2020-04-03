Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9501919D862
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065916EBDF;
	Fri,  3 Apr 2020 13:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC2A6EBD8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p10so8651135wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkMWsQdGG+Q+tuJrIJzHRP6W4Wlyf3RIf397ziMu47M=;
 b=c3cqlFO2TUqOxTpQT6AV95t/66eSAvw1/eg97kofMNCruq5xjfTy1G/ZWzGvCpfS97
 vWyU0jUZXAUb0kHC6kO1gGzPosSZy7L6jzrK6JIDfVQz5+oXiYH3kckaf05wdULAGwve
 sh+H2OyLxndDtBZ2KTXsXDTgBVSNahcPdpQKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkMWsQdGG+Q+tuJrIJzHRP6W4Wlyf3RIf397ziMu47M=;
 b=Jc+5xQOc7OtREvV0jGBzsP51ntCX/a0m4cRTz6S0oqHkg1mdqaEtdI0VjgEhB07VlC
 InuQLNrOSl8tkcehjHvN9ETeUI0XC1VUh/2/tLcbYqG6tA7uyTU0nJMp+xQ74N6dB8V8
 BDPJGVwzPaF0qSggMFgt9Qj7OBmDurScO+7ZSVMXSAXAc1+sYwWOIM2t+PFtXq1lbXR7
 SQmDUpNgYWV9KnVeoTVADj9SRxynxtwSXYKlo6f3F8cZC9ANW2kw6FUzOTpqXKYDkudu
 GpFEO2/1TDea40kJU2pMADdtjGJByEY6SYaO8SwSabmehlpwWuq1E4PHcoXmiqEifKvl
 NGBQ==
X-Gm-Message-State: AGi0PuYrntsiQiDWi7UjnSYnVrUjFUSdZqwJpvCjUt7voyPM9vNtoAc+
 gmyam4+eBuwUFDzyIBtrA4GxMnzF+ZM85A==
X-Google-Smtp-Source: APiQypI00Wr96aw5h63zrKvgT/V0rD+3WrNCLxORugkZIp+F5FaFY6+g53dqcLF0y4xP7jLgBPPjWQ==
X-Received: by 2002:a05:6000:370:: with SMTP id
 f16mr9572564wrf.9.1585922348939; 
 Fri, 03 Apr 2020 06:59:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/44] drm/qxl: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:14 +0200
Message-Id: <20200403135828.2542770-31-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: spice-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also need to remove the drm_dev_put from the remove hook.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_drv.c | 15 ++++++++-------
 drivers/gpu/drm/qxl/qxl_drv.h |  3 +--
 drivers/gpu/drm/qxl/qxl_kms.c | 12 +-----------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 09102e2efabc..6b4ae4c5fb76 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -81,13 +81,16 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -EINVAL; /* TODO: ENODEV ? */
 	}
 
-	qdev = kzalloc(sizeof(struct qxl_device), GFP_KERNEL);
-	if (!qdev)
+	qdev = devm_drm_dev_alloc(&pdev->dev, &qxl_driver,
+				  struct qxl_device, ddev);
+	if (IS_ERR(qdev)) {
+		pr_err("Unable to init drm dev");
 		return -ENOMEM;
+	}
 
 	ret = pci_enable_device(pdev);
 	if (ret)
-		goto free_dev;
+		return ret;
 
 	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "qxl");
 	if (ret)
@@ -101,7 +104,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		}
 	}
 
-	ret = qxl_device_init(qdev, &qxl_driver, pdev);
+	ret = qxl_device_init(qdev, pdev);
 	if (ret)
 		goto put_vga;
 
@@ -128,8 +131,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
 disable_pci:
 	pci_disable_device(pdev);
-free_dev:
-	kfree(qdev);
+
 	return ret;
 }
 
@@ -155,7 +157,6 @@ qxl_pci_remove(struct pci_dev *pdev)
 	drm_atomic_helper_shutdown(dev);
 	if (is_vga(pdev))
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
-	drm_dev_put(dev);
 }
 
 DEFINE_DRM_GEM_FOPS(qxl_fops);
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 435126facc9b..86ac191d9205 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -276,8 +276,7 @@ struct qxl_device {
 extern const struct drm_ioctl_desc qxl_ioctls[];
 extern int qxl_max_ioctl;
 
-int qxl_device_init(struct qxl_device *qdev, struct drm_driver *drv,
-		    struct pci_dev *pdev);
+int qxl_device_init(struct qxl_device *qdev, struct pci_dev *pdev);
 void qxl_device_fini(struct qxl_device *qdev);
 
 int qxl_modeset_init(struct qxl_device *qdev);
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 9eed1a375f24..91a34dd835d7 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -108,21 +108,13 @@ static void qxl_gc_work(struct work_struct *work)
 }
 
 int qxl_device_init(struct qxl_device *qdev,
-		    struct drm_driver *drv,
 		    struct pci_dev *pdev)
 {
 	int r, sb;
 
-	r = drm_dev_init(&qdev->ddev, drv, &pdev->dev);
-	if (r) {
-		pr_err("Unable to init drm dev");
-		goto error;
-	}
-
 	qdev->ddev.pdev = pdev;
 	pci_set_drvdata(pdev, &qdev->ddev);
 	qdev->ddev.dev_private = qdev;
-	drmm_add_final_kfree(&qdev->ddev, qdev);
 
 	mutex_init(&qdev->gem.mutex);
 	mutex_init(&qdev->update_area_mutex);
@@ -138,8 +130,7 @@ int qxl_device_init(struct qxl_device *qdev,
 	qdev->vram_mapping = io_mapping_create_wc(qdev->vram_base, pci_resource_len(pdev, 0));
 	if (!qdev->vram_mapping) {
 		pr_err("Unable to create vram_mapping");
-		r = -ENOMEM;
-		goto error;
+		return -ENOMEM;
 	}
 
 	if (pci_resource_len(pdev, 4) > 0) {
@@ -293,7 +284,6 @@ int qxl_device_init(struct qxl_device *qdev,
 	io_mapping_free(qdev->surface_mapping);
 vram_mapping_free:
 	io_mapping_free(qdev->vram_mapping);
-error:
 	return r;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
