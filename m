Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D616EBE8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 17:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CA86E22D;
	Tue, 25 Feb 2020 16:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B766E22D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 16:58:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r11so15601557wrq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imYSGvk8az9NfnfHJz6SNju1SDAdm6o5oLcpywc6aNw=;
 b=CoUfEWCtZwhw0J4bUqrbM0g2ecyDbxLYirCaH1jphXn3F2ZePkje9qkZkBPztwDKe+
 WoG5BctKbk/sjUoS40QGPJeBdr27pypNnpWz9kTORtQ8xpH0XgFYEYWRw/jGWUPemDJM
 2rt4/SLp/c1lyhV7qhZaezWaj+LAdY5EERd5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imYSGvk8az9NfnfHJz6SNju1SDAdm6o5oLcpywc6aNw=;
 b=f9KbO9/m99Uf997fPDEK8u7xc/DNOPteAqThSNN08lvw6bfmmw9ZHhf9caIMCWCXm5
 A9Gg8BfOdUcTiImISuw91SM58Ks6pRAcDJCNBANQaL5/5iZpveEif2peF0sbFgb4I2I8
 SqlEoF4oIo1K7kLmoS8moOosedUS7eJXEy8Ea53leR9Yjtq5Rspqd77Qfe3N8Ojlzfr6
 1MvM17MmnlF9RCtg0bir4zdlVx5G5vowROZHQSzV518UM6r64dlaXESTpfRyayAbaxwr
 Grp72w+xyjbQ0WJtp8a0BF1Z0WNnm/zSbLdiKqNed346+BVIQKmcJpt6N+p+iRtWOAxN
 feAQ==
X-Gm-Message-State: APjAAAXIRE02wC6QcZA/6WID0IER4wExML66AhvL4Hd4TBtmKOnwJhQr
 KRShcbGr6qhlA9FeZtBIoXtTymn8BpA=
X-Google-Smtp-Source: APXvYqxYLXrBReczTp+7UmZjiQaxErIikf6TliI534YabB7BkUPtz5jiEc1eXythxJ1qORTRVefnTQ==
X-Received: by 2002:a5d:5301:: with SMTP id e1mr118035wrv.44.1582649921474;
 Tue, 25 Feb 2020 08:58:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y131sm5230192wmc.13.2020.02.25.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 08:58:40 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/pci: Unexport drm_get_pci_dev
Date: Tue, 25 Feb 2020 17:58:35 +0100
Message-Id: <20200225165835.2394442-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
References: <20200222175433.2259158-3-daniel.vetter@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only user left is the shadow attach for legacy drivers.

v2: Shift the #ifdef CONFIG_DRM_LEGACY to now also include
drm_get_pci_dev() (Thomas)

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_pci.c | 26 +++++---------------------
 include/drm/drm_pci.h     | 11 -----------
 2 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index c6bb98729a26..5218475ad7e7 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -75,7 +75,6 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
 
 	return dmah;
 }
-
 EXPORT_SYMBOL(drm_pci_alloc);
 
 /**
@@ -191,23 +190,11 @@ void drm_pci_agp_destroy(struct drm_device *dev)
 	}
 }
 
-/**
- * drm_get_pci_dev - Register a PCI device with the DRM subsystem
- * @pdev: PCI device
- * @ent: entry from the PCI ID table that matches @pdev
- * @driver: DRM device driver
- *
- * Attempt to gets inter module "drm" information. If we are first
- * then register the character device and inter module information.
- * Try and register, if we fail to register, backout previous work.
- *
- * NOTE: This function is deprecated, please use drm_dev_alloc() and
- * drm_dev_register() instead and remove your &drm_driver.load callback.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
-		    struct drm_driver *driver)
+#ifdef CONFIG_DRM_LEGACY
+
+static int drm_get_pci_dev(struct pci_dev *pdev,
+			   const struct pci_device_id *ent,
+			   struct drm_driver *driver)
 {
 	struct drm_device *dev;
 	int ret;
@@ -250,9 +237,6 @@ int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
 	drm_dev_put(dev);
 	return ret;
 }
-EXPORT_SYMBOL(drm_get_pci_dev);
-
-#ifdef CONFIG_DRM_LEGACY
 
 /**
  * drm_legacy_pci_init - shadow-attach a legacy DRM PCI driver
diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
index 9031e217b506..3941b0255ecf 100644
--- a/include/drm/drm_pci.h
+++ b/include/drm/drm_pci.h
@@ -45,10 +45,6 @@ struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
 				     size_t align);
 void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
 
-int drm_get_pci_dev(struct pci_dev *pdev,
-		    const struct pci_device_id *ent,
-		    struct drm_driver *driver);
-
 #else
 
 static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
@@ -62,13 +58,6 @@ static inline void drm_pci_free(struct drm_device *dev,
 {
 }
 
-static inline int drm_get_pci_dev(struct pci_dev *pdev,
-				  const struct pci_device_id *ent,
-				  struct drm_driver *driver)
-{
-	return -ENOSYS;
-}
-
 #endif
 
 #endif /* _DRM_PCI_H_ */
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
