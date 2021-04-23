Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E44F368D1A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 08:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40B86EB37;
	Fri, 23 Apr 2021 06:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E724F6E059
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 02:03:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so363672pjj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 19:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IuieRME0ZX49WQkT8/pWgkf+e5WFBLNqPERk5bUgGpc=;
 b=bErKqdPOKBIkf0xiJKWpN0lzQbTbT8Ai0v8Gpy51jT0+z6U7ekDJyaqmlO8NvyPGE1
 Fpy8E/0TElNxx89OJSmtVuIXnl0A2JMosSTFCqK8ywvAJEfI31/capuLMdEjGcs8Y/m5
 gLx3xSTIHYkAg46XkM987Vm/Abr+6N3mlDtHHX0Han/ajKNL2DuYCWti1fnlfWj8Rcnk
 eRh86VXSxv+zwBGFd+lSy9XGI1al1ybd6AuLB1vj1Ez9fBON/wxueHRtC+1DahLgrlYj
 V5jk/J77Y1HOwBvIhttIim6UYeuznP1iTc4LBYyDYzsvAB3ZrRvlm0COLuWAqaJafrVX
 js9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IuieRME0ZX49WQkT8/pWgkf+e5WFBLNqPERk5bUgGpc=;
 b=DiOYoV3NV17NjzTV6GTm4PEF+3l+w6n+r4PKSpvuZnHD0pXDOviwwfzwsnsZu19BDA
 r7IVv8DMq/NhBc4sWcdxNHhxszhCLZEVzJTWZmjufHxA6ceTH9XJf+FlQJ85O0QIKKXu
 9q619lU8MH+/xuITVHBu62TMh1fOSTYJbbPHdCusvkRcmW/J7CmsQ+C6zZjgvouL0+a/
 tjOy1x6EynK8TaERoW99qnixP9DXmYeUf+P+2mPKbxl4fHxulHt609xNXbAW1WHGTS1K
 EHVpf5heaG9Xs5a0pHgL8p3R2k/sxHx3mkKZTBw0aibmmKUq2WcIDWKoqH8KpHGeTbnB
 by6g==
X-Gm-Message-State: AOAM533ATIFJJ2sxnPJX8aZtJIqKzhbTXSsppeQ8mwSYFEmKrkyS//f+
 PiqAMBGFN4K2WuMYNqD2TIR355Pq0fJRrmK+
X-Google-Smtp-Source: ABdhPJyege0hSJyqx3I0kXWFd0PiaAcIhcH7EfbAZZIk4ucFRNIi969AOwHkmobN5qhjFNrcwKXCaQ==
X-Received: by 2002:a17:902:9008:b029:e6:f37a:2183 with SMTP id
 a8-20020a1709029008b02900e6f37a2183mr1721055plp.49.1619143430225; 
 Thu, 22 Apr 2021 19:03:50 -0700 (PDT)
Received: from localhost.localdomain (097-094-025-122.res.spectrum.com.
 [97.94.25.122])
 by smtp.gmail.com with ESMTPSA id u25sm3067793pgk.34.2021.04.22.19.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 19:03:49 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: remove legacy drm_pci_alloc/free abstraction
Date: Thu, 22 Apr 2021 19:02:44 -0700
Message-Id: <20210423020248.3427369-2-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423020248.3427369-1-joseph.kogut@gmail.com>
References: <20210423020248.3427369-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Apr 2021 06:24:49 +0000
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_pci_alloc/free abstraction of the dma-api is no longer required,
remove it.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 drivers/gpu/drm/drm_pci.c | 58 ---------------------------------------
 include/drm/drm_legacy.h  |  4 ---
 2 files changed, 62 deletions(-)

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 2294a1580d35..1a1a2d4046e9 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -41,64 +41,6 @@
 /* List of devices hanging off drivers with stealth attach. */
 static LIST_HEAD(legacy_dev_list);
 static DEFINE_MUTEX(legacy_dev_list_lock);
-
-/**
- * drm_pci_alloc - Allocate a PCI consistent memory block, for DMA.
- * @dev: DRM device
- * @size: size of block to allocate
- * @align: alignment of block
- *
- * FIXME: This is a needless abstraction of the Linux dma-api and should be
- * removed.
- *
- * Return: A handle to the allocated memory block on success or NULL on
- * failure.
- */
-drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t align)
-{
-	drm_dma_handle_t *dmah;
-
-	/* pci_alloc_consistent only guarantees alignment to the smallest
-	 * PAGE_SIZE order which is greater than or equal to the requested size.
-	 * Return NULL here for now to make sure nobody tries for larger alignment
-	 */
-	if (align > size)
-		return NULL;
-
-	dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
-	if (!dmah)
-		return NULL;
-
-	dmah->size = size;
-	dmah->vaddr = dma_alloc_coherent(dev->dev, size,
-					 &dmah->busaddr,
-					 GFP_KERNEL);
-
-	if (dmah->vaddr == NULL) {
-		kfree(dmah);
-		return NULL;
-	}
-
-	return dmah;
-}
-EXPORT_SYMBOL(drm_pci_alloc);
-
-/**
- * drm_pci_free - Free a PCI consistent memory block
- * @dev: DRM device
- * @dmah: handle to memory block
- *
- * FIXME: This is a needless abstraction of the Linux dma-api and should be
- * removed.
- */
-void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
-{
-	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr,
-			  dmah->busaddr);
-	kfree(dmah);
-}
-
-EXPORT_SYMBOL(drm_pci_free);
 #endif
 
 static int drm_get_pci_domain(struct drm_device *dev)
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index 8ed04e9be997..faf64319be76 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -194,10 +194,6 @@ void drm_legacy_idlelock_release(struct drm_lock_data *lock);
 
 #ifdef CONFIG_PCI
 
-struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
-				     size_t align);
-void drm_pci_free(struct drm_device *dev, struct drm_dma_handle *dmah);
-
 int drm_legacy_pci_init(const struct drm_driver *driver,
 			struct pci_driver *pdriver);
 void drm_legacy_pci_exit(const struct drm_driver *driver,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
