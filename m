Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0011A946F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769C66E878;
	Wed, 15 Apr 2020 07:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232476E876
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t14so4646806wrw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ejJhDqFg6YHQyosh1BjnOkzQcytd8MwBo8cRG7rrBmc=;
 b=SW2g5wlDJBHwK30GY9PKnnTP4vhHghaKXbEofA4X5TEjSc/WPgT0pS5CvCOzrtzSXL
 maxF0KwWgltEQCIjRBXFZ0cMibsQUntKnQ71dedd/1uTgacNj9MOj7Sml0aaDjAQhNPx
 3hJyS+7xxZVMI+J8WLEAo8Ju9bBboY2yx7fiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ejJhDqFg6YHQyosh1BjnOkzQcytd8MwBo8cRG7rrBmc=;
 b=ebdwhg5eUqadSQJymv8QxHEybiLgi0Rgcu6ey2Eq6Tl1jKOoNawxBaqVxCaNsu87h0
 wJ4gqMorv/R1EV1t2ay7T9jWLIcHb+e0W6/oLeAv0Bub+7SJdi18+MnavQoEp7h8AjCD
 T3koT/JvKhd6INO9KZob9ASDWaRjveB5+VwADfMzssLnegfFsTdYcgWpeaQfIAOo2mTg
 SmkXhzwGIoV4jpMBq7DSAiqeynpscemA6L4iWR//dGCU9GoGyKCYU7B8RLxSqea4AiST
 CJtp2wcoAHu76jxxsm9Gr+TI6A7o4ir4HPxFcJAJlAz3isMyIyLX9910nM9bJan2Bz6z
 mboA==
X-Gm-Message-State: AGi0PuYXEX5MDVN2QquT6FmvO0Xp9VzckStnnzoJT9m3ZCqUDKlbtMo8
 a3/qM7RksmMesn+0viNgw52q7g==
X-Google-Smtp-Source: APiQypL24yGVe3WceaEB3Y/nQ353jmS7PJAKTFPQBZUfJt/9FJhFHG3LPTMXIqWv5EXzFet3Sv6y/A==
X-Received: by 2002:a5d:45cf:: with SMTP id b15mr38313wrs.78.1586936445817;
 Wed, 15 Apr 2020 00:40:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 05/59] drm/vboxvidoe: use managed pci functions
Date: Wed, 15 Apr 2020 09:39:40 +0200
Message-Id: <20200415074034.175360-6-daniel.vetter@ffwll.ch>
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
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows us to drop the cleanup code on the floor.

Sam noticed in his review:
> With this change we avoid calling pci_disable_device()
> twise in case vbox_mm_init() fails.
> Once in vbox_hw_fini() and once in the error path.

v2: Include Sam's review remarks

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c  | 6 ++----
 drivers/gpu/drm/vboxvideo/vbox_main.c | 7 +------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index cfa4639c5142..cf2e3e6a2388 100644
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
@@ -91,8 +91,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
