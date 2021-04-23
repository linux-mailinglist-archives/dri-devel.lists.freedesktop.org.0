Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64448368D19
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 08:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59D76E09E;
	Fri, 23 Apr 2021 06:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7996C6EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 02:03:47 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id f29so34147592pgm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 19:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pjxat++qid3Snrnv9iGB86a7fL2TIKbO8d9d/vb9leA=;
 b=uSMoZqinrID/ieHXwKegfwYKAseNeYetW4oKipjMDtL7lt96m6nkhdJvXR14ZADRXG
 nnXq+MAfnd8XUyyOaYF2QVKvMoFDBH4nWAMBLJwhBF7PJIs7uqIr8lcITTF78Wr89k7b
 ytRh1NkCjYVAeFsTKhFY3oLtVIW2J++Yudi641j746Tnv8j8l0WT3m2NCClMbCBjiQaF
 f4xO8XsYfhnQRu72jgGXxhITeFxGdKcYRyFHYRt/S48zPTfcimkLtUsGSGM5ss0Zoc1A
 heMH2FKNOWpW8QecS/Xw3tul+sQI+WlCcSezPOZmVzvZONM1m/ui1SWtmimA8kVjzM4p
 /hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pjxat++qid3Snrnv9iGB86a7fL2TIKbO8d9d/vb9leA=;
 b=ZS0JFeNJPPU+A+rRHg2uiCORtKRpFyEIR2poAtg/cqXoItYMMi0SOcHgHq+cuLh3L9
 dbklJf1QXF5vaD9osPEFImMyaOYsS/5Y6uyUtogTY3xk0L0VydmSpeq2RyGEKCEbSjSJ
 xGJpAtzbmThpfAJoExyysieJiih+Xy4OusJKYCE/v4hVfsIVr6WGsuxL5wRZPQDEUPTJ
 MMRmjUirSmMgTvCbTeXO0zEZ5lH4z7b2FnmkGPIWixD2jHs1XMr5Ra+4dnIA0omxErQZ
 7el/pSjTv06PawG8JCgOgTLQoL3DrvnOMZBJp1WFFGBwjRZ3suyK3svuGa+fXyh4mWjb
 rZLg==
X-Gm-Message-State: AOAM533xuWV04d3NQWyDmvKko04XrKRRQkii1av34LnBcGCF8Lf6N2B4
 IMsdCSvB7l0Vnid9qUAJyAkOhXZ8ckybBQKC
X-Google-Smtp-Source: ABdhPJyUxN5+Xro+cKXAV0dg3AGpybmeTsnMPdRYlEH91ytAHk49COs6fwJMH9a3LWNVHs4i9a02kA==
X-Received: by 2002:a63:f451:: with SMTP id p17mr1537169pgk.150.1619143426734; 
 Thu, 22 Apr 2021 19:03:46 -0700 (PDT)
Received: from localhost.localdomain (097-094-025-122.res.spectrum.com.
 [97.94.25.122])
 by smtp.gmail.com with ESMTPSA id u25sm3067793pgk.34.2021.04.22.19.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 19:03:46 -0700 (PDT)
From: Joseph Kogut <joseph.kogut@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: remove usage of drm_pci_alloc/free
Date: Thu, 22 Apr 2021 19:02:43 -0700
Message-Id: <20210423020248.3427369-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove usage of legacy dma-api abstraction in preparation for removal

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Checkpatch warns here that r128 is marked obsolete, and asks for no
unnecessary modifications.

This series aims to address the FIXME in drivers/gpu/drm/drm_pci.c
explaining that drm_pci_alloc/free is a needless abstraction of the
dma-api, and it should be removed. Unfortunately, doing this requires
removing the usage from an obsolete driver as well.

If this patch is rejected for modifying an obsolete driver, would it be
appropriate to follow up removing the FIXME from drm_pci?

 drivers/gpu/drm/drm_bufs.c         | 19 ++++++++++++++++---
 drivers/gpu/drm/drm_dma.c          |  8 +++++++-
 drivers/gpu/drm/r128/ati_pcigart.c | 22 ++++++++++++++++++----
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index e3d77dfefb0a..94bc1f6049c9 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -674,12 +674,17 @@ int drm_legacy_rmmap_ioctl(struct drm_device *dev, void *data,
 static void drm_cleanup_buf_error(struct drm_device *dev,
 				  struct drm_buf_entry *entry)
 {
+	drm_dma_handle_t *dmah;
 	int i;
 
 	if (entry->seg_count) {
 		for (i = 0; i < entry->seg_count; i++) {
 			if (entry->seglist[i]) {
-				drm_pci_free(dev, entry->seglist[i]);
+				dmah = entry->seglist[i];
+				dma_free_coherent(dev->dev,
+						  dmah->size,
+						  dmah->vaddr,
+						  dmah->busaddr);
 			}
 		}
 		kfree(entry->seglist);
@@ -978,10 +983,18 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 	page_count = 0;
 
 	while (entry->buf_count < count) {
+		dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
+		if (!dmah)
+			return -ENOMEM;
 
-		dmah = drm_pci_alloc(dev, PAGE_SIZE << page_order, 0x1000);
+		dmah->size = total;
+		dmah->vaddr = dma_alloc_coherent(dev->dev,
+						 dmah->size,
+						 &dmah->busaddr,
+						 GFP_KERNEL);
+		if (!dmah->vaddr) {
+			kfree(dmah);
 
-		if (!dmah) {
 			/* Set count correctly so we free the proper amount. */
 			entry->buf_count = count;
 			entry->seg_count = count;
diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
index d07ba54ec945..eb6b741a6f99 100644
--- a/drivers/gpu/drm/drm_dma.c
+++ b/drivers/gpu/drm/drm_dma.c
@@ -81,6 +81,7 @@ int drm_legacy_dma_setup(struct drm_device *dev)
 void drm_legacy_dma_takedown(struct drm_device *dev)
 {
 	struct drm_device_dma *dma = dev->dma;
+	drm_dma_handle_t *dmah;
 	int i, j;
 
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA) ||
@@ -100,7 +101,12 @@ void drm_legacy_dma_takedown(struct drm_device *dev)
 				  dma->bufs[i].seg_count);
 			for (j = 0; j < dma->bufs[i].seg_count; j++) {
 				if (dma->bufs[i].seglist[j]) {
-					drm_pci_free(dev, dma->bufs[i].seglist[j]);
+					dmah = dma->bufs[i].seglist[j];
+					dma_free_coherent(dev->dev,
+							  dmah->size,
+							  dmah->vaddr,
+							  dmah->busaddr);
+					kfree(dmah);
 				}
 			}
 			kfree(dma->bufs[i].seglist);
diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
index 1234ec60c0af..fbb0cfd79758 100644
--- a/drivers/gpu/drm/r128/ati_pcigart.c
+++ b/drivers/gpu/drm/r128/ati_pcigart.c
@@ -45,18 +45,32 @@
 static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
 				       struct drm_ati_pcigart_info *gart_info)
 {
-	gart_info->table_handle = drm_pci_alloc(dev, gart_info->table_size,
-						PAGE_SIZE);
-	if (gart_info->table_handle == NULL)
+	drm_dma_handle_t *dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
+
+	if (!dmah)
+		return -ENOMEM;
+
+	dmah->size = gart_info->table_size;
+	dmah->vaddr = dma_alloc_coherent(dev->dev,
+					 dmah->size,
+					 &dmah->busaddr,
+					 GFP_KERNEL);
+
+	if (!dmah->vaddr) {
+		kfree(dmah);
 		return -ENOMEM;
+	}
 
+	gart_info->table_handle = dmah;
 	return 0;
 }
 
 static void drm_ati_free_pcigart_table(struct drm_device *dev,
 				       struct drm_ati_pcigart_info *gart_info)
 {
-	drm_pci_free(dev, gart_info->table_handle);
+	drm_dma_handle_t *dmah = gart_info->table_handle;
+
+	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr, dmah->busaddr);
 	gart_info->table_handle = NULL;
 }
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
