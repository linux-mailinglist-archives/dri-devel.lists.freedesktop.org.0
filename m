Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C57014E88E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 06:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFE36FA74;
	Fri, 31 Jan 2020 05:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3DF6E942
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 05:59:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so7240329wrq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 21:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHOlRZtFBQ5wM1g1FaAtJgUmwljd+E+iomsSReCmsIg=;
 b=g3JSIiJO3R4pOVcHrPos6OYLfcrv/JmLMUozYsB/lCZYVFBab3iWmRpVS1hDpvi8fH
 kkBuIeLsGrziOZ0aRKjLNHpO6e6s3CyqR5VHhPUxExGR1i8nIYuXlwjTN82AQCvySx7F
 JaCShzB+OOxCTZ5StfYxD6vNp4UKOOqccOs+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHOlRZtFBQ5wM1g1FaAtJgUmwljd+E+iomsSReCmsIg=;
 b=U1EifIxDaYR8IflnlLTYg63sIsyM5ILY6txafHIIyiu1IxOKctkK4jARtAeYHTxOfP
 iI20hIY4AFA3y2Tc9gRwQapQLbGTkC77iE3q1IrYurWbD5PGUbRrV8hCrNY7Lf568Vql
 12kOEjzFArHMkPewyc4kt+dOjrqCMeLx8a33gEt+QJIaDrlQfBVQQgz+VrQ6cXg8IhkS
 Zg1xFHZ7QrJkpSnYU9RfsiIwnfDYPOjRjA5ZOVc0g5Q7B0G8+/psGXB7dfmfN5RJnDj4
 LYkYPxpYVN5cfe+eHyW++QuLgBBVhqkxHtDLZdXod1qnIrfxpV+2wSS4vLdQfj4YxJQf
 j3xQ==
X-Gm-Message-State: APjAAAXLuw+UFIYgVbqx4WY27slDIkZTq8i6UwXTYOeUHJjgycBkZByg
 6BV9UUCI7f5GssiRnLLWkqJ2W2hOxATYvg==
X-Google-Smtp-Source: APXvYqzrTYZatzAxZKLNj/5DBsChB7DSu/7En3wg+FEFHkK0JXNISqUAXdq51+LgtLllvya1qra0VA==
X-Received: by 2002:adf:bc87:: with SMTP id g7mr10065387wrh.121.1580450352904; 
 Thu, 30 Jan 2020 21:59:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a8sm9863798wmc.20.2020.01.30.21.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 21:59:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Push drm_global_mutex locking in drm_open
Date: Fri, 31 Jan 2020 06:59:02 +0100
Message-Id: <20200131055902.1821218-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129082410.1691996-5-daniel.vetter@ffwll.ch>
References: <20200129082410.1691996-5-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to only take the BKL on crap drivers, but to know whether
we have a crap driver we first need to look it up. Split this shuffle
out from the main BKL-disabling patch, for more clarity. Historical
aside: When the kernel-wide BKL was removed, it was replaced by
drm_global_mutex within the scope of the drm subsystem hence why these
two things are (almost) interchangeable as concepts here.

Since the minors are refcounted drm_minor_acquire is purely internal
and this does not have a driver visible effect.

v2: Push the locking even further into drm_open(), suggested by Chris.
This gives us more symmetry with drm_release(), and maybe a futuer
avenue where we make drm_global_mutex locking (partially) opt-in like
with drm_release_noglobal().

v3:
- Actually push this stuff correctly, don't unlock twice (Chris)
- Fix typo on commit message, plus explain why BKL = drm_global_mutex
  (Sam)

Cc: Sam Ravnborg <sam@ravnborg.org>
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
index 1075b3a8b5b1..80d556402ab4 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -378,6 +378,8 @@ int drm_open(struct inode *inode, struct file *filp)
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
+	mutex_lock(&drm_global_mutex);
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
