Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6A19D822
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4976EBA1;
	Fri,  3 Apr 2020 13:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECC66EBA1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:45 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a81so7788992wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ta+qglq+qQI6w7vmxbA0+tBj5egUuycQBmilnPhHhh0=;
 b=ALeivzVpvbROVopK0SX+l2FRiwz1R9CsKc+T86R9bXDhzW9t656h+D8qS5UBssPYz1
 Au4ZD/NvVvdVXhUUxCSvpSrthph/FxPlUcn/HTB8RInq3N4VHhKkebTADhYOXZPjo2aU
 86dzo34xsrpKfRVkfrV1sAD2ceuZAZPcGeR28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ta+qglq+qQI6w7vmxbA0+tBj5egUuycQBmilnPhHhh0=;
 b=PYNO30wL9gPKjuHS9KxqNsxIJ3OPYts+e8INCXcYIox5zONaKHp7T1mm+Fbz/rdT+2
 aFLPcS0udQuQFGhP2H8QrItAdRRgzASo7qP8sDmdhS7PpgTAnMxrAwbNjKGgb6gdTvN5
 Vc0zr55GxNgsQy7StvDJD95/BOxJshpzEHIq7crVC04IxqjqULlSTqfe980bbSH5ZuvW
 RzFlyjVlr4SWmqtcJgUUxZrQo9zL9vyiP9p/zA+b/2ecVCekoYX2f2SD2njtNc0BSCnL
 MvKClhC4Aapj2ZCAzBJFCkTkLn0CkCS9aD+2Dk9OVc/SpYa0hZZ+gVtraZxDXo6kmeCh
 B1Ng==
X-Gm-Message-State: AGi0PuYBgWs3h5TyjfiEztRt01dTKSuS4PDOXqaIDxVTnd6GyX2lWMrH
 JPjaK1FzTRy0wtMVHgIy/FpXh2x0LyobwA==
X-Google-Smtp-Source: APiQypIwBgWlaDwBlAGWvEsSEwY7KK3DRzPSa6kb49xgtUHYoaj6GTLtuf1HOMXdof7HYP50Q6nEdA==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr9174511wmh.174.1585922323769; 
 Fri, 03 Apr 2020 06:58:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/44] drm/vboxvideo: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:57:51 +0200
Message-Id: <20200403135828.2542770-8-daniel.vetter@ffwll.ch>
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

Straightforward conversion.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index d685ec197fa0..be0600b22cf5 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -46,25 +46,19 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	vbox = kzalloc(sizeof(*vbox), GFP_KERNEL);
-	if (!vbox)
-		return -ENOMEM;
-
-	ret = drm_dev_init(&vbox->ddev, &driver, &pdev->dev);
-	if (ret) {
-		kfree(vbox);
-		return ret;
-	}
+	vbox = devm_drm_dev_alloc(&pdev->dev, &driver,
+				  struct vbox_private, ddev);
+	if (IS_ERR(vbox))
+		return PTR_ERR(vbox);
 
 	vbox->ddev.pdev = pdev;
 	vbox->ddev.dev_private = vbox;
 	pci_set_drvdata(pdev, vbox);
-	drmm_add_final_kfree(&vbox->ddev, vbox);
 	mutex_init(&vbox->hw_mutex);
 
 	ret = pci_enable_device(pdev);
 	if (ret)
-		goto err_dev_put;
+		return ret;
 
 	ret = vbox_hw_init(vbox);
 	if (ret)
@@ -102,8 +96,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	vbox_hw_fini(vbox);
 err_pci_disable:
 	pci_disable_device(pdev);
-err_dev_put:
-	drm_dev_put(&vbox->ddev);
 	return ret;
 }
 
@@ -116,7 +108,6 @@ static void vbox_pci_remove(struct pci_dev *pdev)
 	vbox_mode_fini(vbox);
 	vbox_mm_fini(vbox);
 	vbox_hw_fini(vbox);
-	drm_dev_put(&vbox->ddev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
