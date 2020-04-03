Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2B919D579
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 13:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C4D6E0E1;
	Fri,  3 Apr 2020 11:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E02D6E0E1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 11:06:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z14so1838858wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AInyrihTvCeAr+ReDyJQpECyBOfMn7nZ3JLC3z6Bbsk=;
 b=VUTzkBNsYHit9AoGn5e6nvX+/3lDaskqQ34OtkbIhg8b0Q1MFDpyrmAtQQBbNRVvFR
 Mtm5uQ/t9Ll1DsZXp5onA1FAnj0ZaQ0GCnodBHTVPSSBWCC0uh/Jn3LR40re1+faTEQQ
 I86STAJNdLb3YnIhSTWYU6KQzMK/hTIKEVYkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AInyrihTvCeAr+ReDyJQpECyBOfMn7nZ3JLC3z6Bbsk=;
 b=W0hXX1aZRa6bqVkljYGwcxhHsIhBphE+sz5LehbsVYVhEe2wpcRP4LJ3zdGPEh/uKD
 O+54TNfLpRQqxAmyA6LzMUD51dRqlGfi8/egYw8NpeRhWbA7Jp/UFK0SrcridfWV+kt6
 jEiIypEvDo2LTe2S+kfapP76KxsbdpdPapz3WQlVbDQ0x8V3iNWVP9A1/JvgzAK6kNOR
 GptfTpJR6si2lPK8zA5HZV4AOiqS5SScfeOp48xmHrbDoZf1HvtPe8aKPOP+F5V4lp0/
 wNYTiWUfHCKBW3xuC4/mJVNkysnfQdbdq91Sn4CSiUsYF/m72TxeLzxTCEzHihwX2O/W
 zYsQ==
X-Gm-Message-State: AGi0PubM/Krx5V8emFKEahd0UxGCufo6JcFdBlqWUpXsVxrm858m+01l
 Y2erfPWvjPRfUyZudcR8DLiDx7SAL0pVWg==
X-Google-Smtp-Source: APiQypLBbRwypZT/9UzgZvYuM6iKemet0okoDdga1IzngCBU5hDfj6cVv8uuktLgiYty33tNeRcs8g==
X-Received: by 2002:a1c:b642:: with SMTP id g63mr7781748wmf.108.1585911976728; 
 Fri, 03 Apr 2020 04:06:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m19sm10011419wml.21.2020.04.03.04.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 04:06:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/pci: Move drm_pci_alloc/free under CONFIG_DRM_LEGACY
Date: Fri,  3 Apr 2020 13:06:09 +0200
Message-Id: <20200403110610.2344842-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All other users have been removed, yay!

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_pci.c |  3 +++
 include/drm/drm_legacy.h  | 15 +++++++++++++++
 include/drm/drm_pci.h     | 26 --------------------------
 3 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 81aa21561982..131b7a139fda 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -36,6 +36,8 @@
 #include "drm_internal.h"
 #include "drm_legacy.h"
 
+#ifdef CONFIG_DRM_LEGACY
+
 /**
  * drm_pci_alloc - Allocate a PCI consistent memory block, for DMA.
  * @dev: DRM device
@@ -93,6 +95,7 @@ void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
 }
 
 EXPORT_SYMBOL(drm_pci_free);
+#endif
 
 static int drm_get_pci_domain(struct drm_device *dev)
 {
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index dcef3598f49e..b53c3686c5fc 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -194,11 +194,26 @@ void drm_legacy_idlelock_release(struct drm_lock_data *lock);
 
 #ifdef CONFIG_PCI
 
+struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
+				     size_t align);
+void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
+
 int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
 void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
 
 #else
 
+static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
+						   size_t size, size_t align)
+{
+	return NULL;
+}
+
+static inline void drm_pci_free(struct drm_device *dev,
+				struct drm_dma_handle *dmah)
+{
+}
+
 static inline int drm_legacy_pci_init(struct drm_driver *driver,
 				      struct pci_driver *pdriver)
 {
diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
index 3941b0255ecf..1bf31131960e 100644
--- a/include/drm/drm_pci.h
+++ b/include/drm/drm_pci.h
@@ -34,30 +34,4 @@
 
 #include <linux/pci.h>
 
-struct drm_dma_handle;
-struct drm_device;
-struct drm_driver;
-struct drm_master;
-
-#ifdef CONFIG_PCI
-
-struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
-				     size_t align);
-void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
-
-#else
-
-static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
-						   size_t size, size_t align)
-{
-	return NULL;
-}
-
-static inline void drm_pci_free(struct drm_device *dev,
-				struct drm_dma_handle *dmah)
-{
-}
-
-#endif
-
 #endif /* _DRM_PCI_H_ */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
