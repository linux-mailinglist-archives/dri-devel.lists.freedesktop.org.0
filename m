Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3516416E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90D76EB15;
	Wed, 19 Feb 2020 10:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BB16E9E0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:37 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id z3so27594733wru.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k6zIgeMcsuUzQ60x1RzHf+FyAXyxdU+K1JmA2p/vHpM=;
 b=QOof3Vy3lDNa77QfdX9xFGvpVUnliadmxLnliLKB1FcpNUwa7J1F7JSbzMamc1EwYF
 pXD/VfXhrk+7ia9sJ9ZzmfdMM8h/qd5oJ1DmPlPVTOQ8qQT1tpJPud56f0kP89IOOKW9
 5dk49FUMQg9RbQt67tYWzlIaWriPs0CS96uNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6zIgeMcsuUzQ60x1RzHf+FyAXyxdU+K1JmA2p/vHpM=;
 b=LSCJigV82vDwY8OCPfCv7ij+bGdUvpenRDigveLN/gaQF3wxTQWVSG2QBVkeWcdZQ0
 jP3ztaVyehDArHJCWCdlt+bRYu4teLS6j9DDo7XdeaoTeCJcgaDGKIvck90OXfIvWtX2
 DPYe+rlYyOdfFhyXVcD6FTr6Hpkckp/6VjbXpJU3lBCzmoelzRuGBisUZ4n4PsTZF+vL
 qasvvHcHzKP+b1V+5+r185AdUjprlxqncaYCZmtBqYBhxtNZUIF4u6gMutDVTRD+nxgP
 HUoidMObFy00HpNwq24P2pHSndrPxiTeBo7TzUj5B8NOWLquBCd54NMOx9t8xiSRNywI
 znqQ==
X-Gm-Message-State: APjAAAWwNMNPyMTkQGipRL9ix0fgmJsW8aiYpjGuRyS7KAfdBE1avnpq
 aKxvKVObJzQwfWJ39QFJ/DwsVvCadHQ=
X-Google-Smtp-Source: APXvYqxoGad2E0cR331h17OfopLNCwl+JCHX21vpORxGTmdF7o9ixk77hhlCdFMX8d/iuD3VbmXySQ==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr33819647wrf.385.1582107696170; 
 Wed, 19 Feb 2020 02:21:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:35 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
Date: Wed, 19 Feb 2020 11:20:34 +0100
Message-Id: <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I also did a full review of all callers, and only the xen driver
forgot to call drm_dev_put in the failure path. Fix that up too.

v2: I noticed that xen has a drm_driver.release hook, and uses
drm_dev_alloc(). We need to remove the kfree from
xen_drm_drv_release().

bochs also has a release hook, but leaked the drm_device ever since

commit 0a6659bdc5e8221da99eebb176fd9591435e38de
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Dec 17 18:04:46 2013 +0100

    drm/bochs: new driver

This patch here fixes that leak.

Same for virtio, started leaking with

commit b1df3a2b24a917f8853d43fe9683c0e360d2c33a
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Tue Feb 11 14:58:04 2020 +0100

    drm/virtio: add drm_driver.release callback.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
---
 drivers/gpu/drm/drm_drv.c           | 3 +++
 drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3e5627d6eba6..9e62e28bbc62 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -39,6 +39,7 @@
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
 
@@ -819,6 +820,8 @@ struct drm_device *drm_dev_alloc(struct drm_driver *driver,
 		return ERR_PTR(ret);
 	}
 
+	drmm_add_final_kfree(dev, dev);
+
 	return dev;
 }
 EXPORT_SYMBOL(drm_dev_alloc);
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 4be49c1aef51..d22b5da38935 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -461,7 +461,6 @@ static void xen_drm_drv_release(struct drm_device *dev)
 	drm_mode_config_cleanup(dev);
 
 	drm_dev_fini(dev);
-	kfree(dev);
 
 	if (front_info->cfg.be_alloc)
 		xenbus_switch_state(front_info->xb_dev,
@@ -561,6 +560,7 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 fail_modeset:
 	drm_kms_helper_poll_fini(drm_dev);
 	drm_mode_config_cleanup(drm_dev);
+	drm_dev_put(drm_dev);
 fail:
 	kfree(drm_info);
 	return ret;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
