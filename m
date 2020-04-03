Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89A19D827
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB276EBAB;
	Fri,  3 Apr 2020 13:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060106EBA5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s8so6518346wrt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VPlpRsmw85fTY/StivObzsyoZLT+kiXiHykfsxrmGkw=;
 b=ZKGe/jBNwtfokKBDF1Yst6ZDGZdLdnh59WIUCxhS1JV+XyyobK0riWlDncpbHlyUYn
 kSz/ZMNTYcOElfr21IS5w/PcqEaKWWHgYzZtUmbLTgvyLt/exilsMpCzctXR0LY8y7a7
 tfynOXCMVNUGbEBOF4d9KnOZD03NvDd1v1IF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VPlpRsmw85fTY/StivObzsyoZLT+kiXiHykfsxrmGkw=;
 b=nUroUDxJDXoM9W3nNUdFLG7vdwYbZ5Ocl8F9QdsINa4PdnLHcwrgEPYHSy2O3QryKd
 T9y42AZFTM9t/6W7SR75QifZ3+pqHoY4+hc94Q8kzB92lSMl3djqYWLXXTdrsvTFmJnA
 cmvhrlrdkQQpxNGz0BSp+Z3zou2XRxXKDw/bJOVV+AXXZMN7i6hJadZU4FG5pFmvkaEu
 6FNyib/ooj4ChUZh0W8d3OfaWrnJhgNjskC9s15xFLQ6MsiBebRLNi3HlvwzyQISt7Bp
 uZ16uR8apt38GQ11CvdCUF9e397QudsWVNfmOeCBUBjaAi8yWKpcF+Kda+GFxQmOernS
 0r8A==
X-Gm-Message-State: AGi0Pubu2mebbErT6wc0NITHo7o6wAy5r+cl501ffMvWiE4Y4YaZvNI1
 QguLWcd+HtfxvVgn5GqA2IjTPRZCIJGRHQ==
X-Google-Smtp-Source: APiQypK5nBxHoZUceuv5hVGwzpTPMQynC9KjjDzHIaszjyvK+FnZFYgn2yIdSuyTuf6A9e21+DL4hQ==
X-Received: by 2002:a05:6000:a:: with SMTP id
 h10mr9747847wrx.226.1585922326181; 
 Fri, 03 Apr 2020 06:58:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/44] drm/vboxvidoe: use managed pci functions
Date: Fri,  3 Apr 2020 15:57:53 +0200
Message-Id: <20200403135828.2542770-10-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows us to drop the cleanup code on the floor.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c  | 6 ++----
 drivers/gpu/drm/vboxvideo/vbox_main.c | 7 +------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index d34cddd809fd..c80695c2f6c0 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -55,13 +55,13 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, vbox);
 	mutex_init(&vbox->hw_mutex);
 
-	ret = pci_enable_device(pdev);
+	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
 
 	ret = vbox_hw_init(vbox);
 	if (ret)
-		goto err_pci_disable;
+		return ret;
 
 	ret = vbox_mm_init(vbox);
 	if (ret)
@@ -93,8 +93,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	vbox_mm_fini(vbox);
 err_hw_fini:
 	vbox_hw_fini(vbox);
-err_pci_disable:
-	pci_disable_device(pdev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index 9dcab115a261..1336ab9795fc 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -71,8 +71,6 @@ static void vbox_accel_fini(struct vbox_private *vbox)
 
 	for (i = 0; i < vbox->num_crtcs; ++i)
 		vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
-
-	pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
 }
 
 /* Do we support the 4.3 plus mode hint reporting interface? */
@@ -125,7 +123,7 @@ int vbox_hw_init(struct vbox_private *vbox)
 	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
 	vbox->guest_pool = gen_pool_create(4, -1);
 	if (!vbox->guest_pool)
-		goto err_unmap_guest_heap;
+		return -ENOMEM;
 
 	ret = gen_pool_add_virt(vbox->guest_pool,
 				(unsigned long)vbox->guest_heap,
@@ -168,8 +166,6 @@ int vbox_hw_init(struct vbox_private *vbox)
 
 err_destroy_guest_pool:
 	gen_pool_destroy(vbox->guest_pool);
-err_unmap_guest_heap:
-	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
 	return ret;
 }
 
@@ -177,5 +173,4 @@ void vbox_hw_fini(struct vbox_private *vbox)
 {
 	vbox_accel_fini(vbox);
 	gen_pool_destroy(vbox->guest_pool);
-	pci_iounmap(vbox->ddev.pdev, vbox->guest_heap);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
