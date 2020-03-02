Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9A217671B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B0D6E89F;
	Mon,  2 Mar 2020 22:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54556E892
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q8so1876282wrm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1AHaQvhN2ion1uFEUr1XcIxdeUJfypsRlQhvEHgQjY=;
 b=JaEoqB0adT53UtWCgSAZO9uQtvNoj6C7Gj9sBYMu4trKLgISu9DE+hUUg0rV48Mlep
 tdic976YpuUlTMMIt5sGfbPjEr1VI5C237EJf+0X+LRUfEr6srZLzoxhV9UpKawiZHfz
 wWfk4JE2UEwsVOaFXbcqOg1uHoXwMlotkBuKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1AHaQvhN2ion1uFEUr1XcIxdeUJfypsRlQhvEHgQjY=;
 b=nI2so1wez3nIxbGFLacXE4kKqFxdBV5ofISvA8N7bGjzEivUExpWWVRuNWXAdEGevG
 abAhygaCFcFEEOqmNhp4kxxKn+ovYULox2XZyEKLZaQxCZbN0eazaFSMa0TYucIAdivZ
 5s3tvarnXp208qqobAT2SGX7J2p6mu11qmQBovx+JRGkvYpTgp3bNYxjOwr1B9miKQau
 1vhN9aqdLHl94iqY6C/7XkbY5gs/ZYoMCOTuVsBpZB/Q1grmJjkYc+VAGW8DpfX/eUtW
 0DVnQC4iHBlfsNBGPzxcG1ko+bJgGbfp8ClBV2Pq1k0lATA4IFLh/rhP4U+ZRftMNz5x
 OcMg==
X-Gm-Message-State: ANhLgQ2I7DEKX51wmY9f0wQv9orL9b5IJH6f+Bj7sPFUSQIkHbzAtd02
 XtYixqBQrWGpRJN/M76CYW51/Vc2zB8=
X-Google-Smtp-Source: ADFU+vt5sSwD7uAFSOT/9moFiufHOw4jt41eCGj1wv1GoSUB5Qr/yKj/i5Q8VI2B2kI+mKptj0mzRg==
X-Received: by 2002:a5d:4b03:: with SMTP id v3mr1732586wrq.81.1583188025348;
 Mon, 02 Mar 2020 14:27:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:04 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
Date: Mon,  2 Mar 2020 23:25:59 +0100
Message-Id: <20200302222631.3861340-20-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few things:
- Update the example driver in the documentation.
- We can drop the old kfree in drm_dev_release.
- Add a WARN_ON check in drm_dev_register to make sure everyone calls
  drmm_add_final_kfree and there's no leaks.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7b84ee8a5eb5..1a048325f30e 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -297,8 +297,6 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		drm_mode_config_cleanup(drm);
  *		drm_dev_fini(drm);
- *		kfree(priv->userspace_facing);
- *		kfree(priv);
  *	}
  *
  *	static struct drm_driver driver_drm_driver = {
@@ -326,10 +324,11 @@ void drm_minor_release(struct drm_minor *minor)
  *			kfree(drm);
  *			return ret;
  *		}
+ *		drmm_add_final_kfree(drm, priv);
  *
  *		drm_mode_config_init(drm);
  *
- *		priv->userspace_facing = kzalloc(..., GFP_KERNEL);
+ *		priv->userspace_facing = drmm_kzalloc(..., GFP_KERNEL);
  *		if (!priv->userspace_facing)
  *			return -ENOMEM;
  *
@@ -961,6 +960,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	struct drm_driver *driver = dev->driver;
 	int ret;
 
+	WARN_ON(!dev->managed.final_kfree);
+
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
