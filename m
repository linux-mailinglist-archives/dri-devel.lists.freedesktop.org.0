Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D51A946E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083A86E875;
	Wed, 15 Apr 2020 07:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8926E873
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v8so14256129wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Edar0dJgASsuiNacXP5y3gT+G+sfZKS1INHqXKgta1c=;
 b=iOlbo5IODl5oJibVyA+BMkzBoKPwtRFcNDsX+kK/R0PbP8EKrbu0pAQDJyXpvk1tBJ
 8RQRUN3ai55VeCZqB+zBxkmpXnH1ceRgtLfOgygkQ98QEVxYqWTgJG9jZu+x15oTNWPQ
 LPUgsO6Ay3LL3QRzC1Siv3jOuBkh+4pOZGVDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Edar0dJgASsuiNacXP5y3gT+G+sfZKS1INHqXKgta1c=;
 b=docABE1u8HvjlfeJrBpksPkbFtUgy92EJGNrCxNS46a9Iba64cyEWLAwqveo75tJqI
 s16wAmuQbpfNz49QevKLGoISR/rHAdH0wVHMw0q6yI7b8HkgvmlNkfXwoZ+E3R3394Kv
 apEddaiDEmy9pH2Mbp1YYHSfaoU4r88bBKLI0ixDcfBQ7xQUdqBdOutwY1Of9cfSZTFO
 TPI4VejhQxZxVdQWpWDeyOPNJLQ1SoDHavcsUGqq4Swn6Mh+pMy3z29xAU22TUcvx4QO
 /JNwLwlOGjywxtLsoPRy9ms3dduivr54tgCtynRrizYVeqvzYUT77dRHp9Eyf0+nJ2fq
 RKlg==
X-Gm-Message-State: AGi0PuZVngWBSg6W6G1Nisvq3RjyGC61KL71+C1dkExRSmDZshsWX/d7
 nlIj7pTMTojJMxE5fPYnnjs3Fg==
X-Google-Smtp-Source: APiQypJ+8USxF4F+YfbP4YCK9Z2PcrCzJP//mPnmKu6If5zMkAOYr4r9KfYP4ztfkFKbX5HIqRwiQQ==
X-Received: by 2002:a05:600c:a:: with SMTP id
 g10mr3847157wmc.153.1586936443498; 
 Wed, 15 Apr 2020 00:40:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 03/59] drm/vboxvideo: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:38 +0200
Message-Id: <20200415074034.175360-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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
index 282348e071fe..7dd25c7a3768 100644
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
@@ -100,8 +94,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	vbox_hw_fini(vbox);
 err_pci_disable:
 	pci_disable_device(pdev);
-err_dev_put:
-	drm_dev_put(&vbox->ddev);
 	return ret;
 }
 
@@ -114,7 +106,6 @@ static void vbox_pci_remove(struct pci_dev *pdev)
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
