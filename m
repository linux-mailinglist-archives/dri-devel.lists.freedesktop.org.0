Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B21766EE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7656E865;
	Mon,  2 Mar 2020 22:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC8F6E864
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:26:47 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q8so1875294wrm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pkhX6oUV54jak2I+fxKSDh5HLmzzdLCuXZmwWLfZmfI=;
 b=fDTQWcpO27n1txwbnh0F5V7ooNqS7Mthcd0f2gQcrezZmtJjlyF0DEZVBYjrGcI5kB
 jzbI1/PbR13yKf2Xv1319sdw8nXqAooukFPmL4pAIiU4GZy4WbgFkYu355M9j7Ymc5Ol
 251Ceai1ynFMdeUCgnwXyvdFofuz7I+vE091A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pkhX6oUV54jak2I+fxKSDh5HLmzzdLCuXZmwWLfZmfI=;
 b=FQsgKYv4CPSodVhlZcmYIPUapxpXovMcDfEDM0HL5sFhs0redVdXHocQ1ws5h+UdC5
 saNm4voIulylnUEL3aOZdpTj9LUDAheOgU21d4MlQ6LKRRLAAPVSG+wqPo0siGP04N/v
 OTrCW43jcx9+VRVWrd12nmSBpIGGA/zwZAi90ZYqLPEn+frXrRZ/Tqnzlbz5xypNdsNJ
 Ee1OEwy7VpRz3KCZSMEOr5z3ApVJGR7mU8hMWxu7HEq0MrCGl6QIbGtGP5RcXrLs2EzZ
 j4x/KydqdpWlOpXfCeDDSn865wTaK607WS9GWHOhQJG5lWb+iobhYKymzINA1lab70eM
 EE0w==
X-Gm-Message-State: ANhLgQ3F9x9wKeHahSW77Q10x9CBmwaUlFiLxScYY6y2j/0B0cidgAEn
 s8Fjh+o/0N+CsSOQunMLomDNHMSMQcY=
X-Google-Smtp-Source: ADFU+vtrZk/HHbRtnp3SmgT+OD4tT1XHyorYZDXPvumXYrgTybM88i7mt8+5OfQpaBjIDKv9Xj027Q==
X-Received: by 2002:adf:f751:: with SMTP id z17mr1668784wrp.207.1583188006282; 
 Mon, 02 Mar 2020 14:26:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:45 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
Date: Mon,  2 Mar 2020 23:25:44 +0100
Message-Id: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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

Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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
index 153050fc926c..7b84ee8a5eb5 100644
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
