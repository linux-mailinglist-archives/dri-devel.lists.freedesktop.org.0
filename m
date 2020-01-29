Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9764D14C762
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828B6F48C;
	Wed, 29 Jan 2020 08:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7266F48D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 08:24:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so19038581wrl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 00:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eg3fDR5VispgYeOao22kfgLqHLdVyylrWybH877xNM=;
 b=FVPTkFgvY1puRuk3/i6d2Za9ans+S2JXCFlhIyS0+yVSzukxrgEtWln0nLphxOGpAH
 YZu8bK5jde2s3ops2fdGXuZmPf3bhmjroarJbEZ2EcYlWErg1fKBrO0W6P18PTtO1Rtu
 XY6PNMw3tKhUmsL4qCaiVq9ZrVsfusioHliyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eg3fDR5VispgYeOao22kfgLqHLdVyylrWybH877xNM=;
 b=CF1f7IZ7RbVmjGGVoW2fXCYc6/TeKMY2c2PLuIW5TIE9ZChVGIWxpxNTrvjVCj1zpm
 ne1Fuv6uIrVmOL+9ljTOEb2N+jHgWHIRBW+BOfU2MldqjzI/9FgKMqzvYsq6UlehuYUA
 inj99bAYnYLXqT7nAt7swYtGJgP/aCJCLD035CjcazfPGDvbMhJh/9JJw5p1ypYaCOuC
 NxmAUmep0k9njoEAPTh9T8rpdlIcf23G7HKrj+PDosumX16KyvBL5GI2YgDsqgIzQE+8
 Dd8eScbS9Yl9HiPDD+njfta+beRLV4WeGGOMHt5GcvEdDKNTdlf5PH+9El8mWH0Zv9Kx
 2UFw==
X-Gm-Message-State: APjAAAWvvamidNuYK20ajmlhx40gEGws4utNIDZLiYjN3I/jerDLgEzC
 wBkd0nX01US6YudVEAXt9kYrVmEihQntTw==
X-Google-Smtp-Source: APXvYqxf6y4uUmP+RtjUzj9NZYmPz7jamiIttJcUz1MEhiaux0UOBda9dUS/OrPeeysvoJUMZjWhog==
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr32492822wrs.424.1580286259920; 
 Wed, 29 Jan 2020 00:24:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n14sm1351931wmi.26.2020.01.29.00.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 00:24:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm: Push drm_global_mutex locking in drm_open
Date: Wed, 29 Jan 2020 09:24:09 +0100
Message-Id: <20200129082410.1691996-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
References: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to only take the BKL on crap drivers, but to know whether
we have a crap driver we first need to look it up. Split this shuffle
out from the main BKL-disabling patch, for more clarity.

Since the minors are refcounted drm_minor_acquire is purely internal
and this does not have a driver visible effect.

v2: Push the locking even further into drm_open(), suggested by Chris.
This gives us more symmetry with drm_release(), and maybe a futuer
avenue where we make drm_globale_mutex locking (partially) opt-in like
with drm_release_noglobal().

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c  | 14 +++++---------
 drivers/gpu/drm/drm_file.c |  6 ++++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8deff75b484c..05bdf0b9d2b3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1085,17 +1085,14 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 
 	DRM_DEBUG("\n");
 
-	mutex_lock(&drm_global_mutex);
 	minor = drm_minor_acquire(iminor(inode));
-	if (IS_ERR(minor)) {
-		err = PTR_ERR(minor);
-		goto out_unlock;
-	}
+	if (IS_ERR(minor))
+		return PTR_ERR(minor);
 
 	new_fops = fops_get(minor->dev->driver->fops);
 	if (!new_fops) {
 		err = -ENODEV;
-		goto out_release;
+		goto out;
 	}
 
 	replace_fops(filp, new_fops);
@@ -1104,10 +1101,9 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 	else
 		err = 0;
 
-out_release:
+out:
 	drm_minor_release(minor);
-out_unlock:
-	mutex_unlock(&drm_global_mutex);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 1075b3a8b5b1..d36cb74ebe0c 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -378,6 +378,8 @@ int drm_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
+	mutex_unlock(&drm_global_mutex);
+
 	dev = minor->dev;
 	if (!atomic_fetch_inc(&dev->open_count))
 		need_setup = 1;
@@ -395,10 +397,14 @@ int drm_open(struct inode *inode, struct file *filp)
 			goto err_undo;
 		}
 	}
+
+	mutex_unlock(&drm_global_mutex);
+
 	return 0;
 
 err_undo:
 	atomic_dec(&dev->open_count);
+	mutex_unlock(&drm_global_mutex);
 	drm_minor_release(minor);
 	return retcode;
 }
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
