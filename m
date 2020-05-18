Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6801D730C
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 10:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1355C89DBD;
	Mon, 18 May 2020 08:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101CC89DBD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:36:05 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h4so8362287wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYwCW3+gtoBjSJWhsbQrcog+7mDhuNYi3hxgW1ofTpU=;
 b=cVWsbfI6mqenC3puxkDouPz9dnDq/tudPbHSEsks++66yoCSIuzaF5N7nxDt5fcbP2
 mNyTFjTBVcehFG0VL6P+aG5PY88vfIvJvnNaZOI7tRNX5EXhEHDg0bGqwKLK4lBWV2zq
 0icTDFG3jViChNrPLx6NHQ0tHKa7v5N84SZmEqqNMX0imjHoxb+ynnnhm/J7HShIFjgS
 obsVKZ3S76J2VksL0D3dAKYQTDBKAHVlv5rwiGpwDDhyTugKhHW/e1b7FJtl+c7/qdg9
 vn3c0huPBMWOSHpLvAc92PQVfKODl1b61J3vRkz5I0O3MFAVj1NCvitWqREvY6+bFhAK
 Amsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYwCW3+gtoBjSJWhsbQrcog+7mDhuNYi3hxgW1ofTpU=;
 b=NJIYh8aex74d9K+KHFn9eKImu+JwyejGr4HtCF5EOPgCGgZ914ogrL5INLeIxJOcwO
 PyyvnJg5eTjB47YBVjFcnl/5UZSqfgKYSa1XbtzyIxIZWQ8o1Eminc8GsLaHhEDO+Vwu
 rxTpzuT+jXuCgXg2tTju0rPyEfNOG2img+q2ssSWX2HEtbjzRmNxhbJsovosOdGPGzSN
 NSzERjSkiLyQDNza24KENDQLhne9DKl6zyXx8LJLEO8WcBa5aAGQKi2Y4VLesT5a8rFu
 KWtsXuAJK9lE9h9uBeNDJgOhqVxF+xhOF1PwhTqmbenC22+vwxU0OsKU/6PmSXqVpOal
 dHkg==
X-Gm-Message-State: AOAM533aKd16TPbtcUlfEp6ozMhfWhspzoOugKy7z7xoZrlsklyCLfsI
 ug8mVBmw7T0nf95p73heso+zJ5BZ
X-Google-Smtp-Source: ABdhPJxdD2ML9+qNJ04eHI6bfE57V3+eEWf20AS0P6ruj6AUOH+txmkoCL03KBHjvTY6/WA4AzSAow==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr18286730wmd.95.1589790963439; 
 Mon, 18 May 2020 01:36:03 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id z124sm14311414wmg.20.2020.05.18.01.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 01:36:02 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: print the current->comm alongside the pid
Date: Mon, 18 May 2020 09:33:15 +0100
Message-Id: <20200518083315.129948-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Bob Beckett <bob.beckett@collabora.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Mauro Rossi <issor.oruam@gmail.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

The question of "what process is this pid" keeps on popping up, so lets
print the process name alongside the pid.

Cc: Mauro Rossi <issor.oruam@gmail.com>
Cc: Bob Beckett <bob.beckett@collabora.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_file.c  |  7 ++++---
 drivers/gpu/drm/drm_ioc32.c |  4 ++--
 drivers/gpu/drm/drm_ioctl.c | 11 ++++++-----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7194e67e78bd..9b79bfc60ad7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -253,8 +253,8 @@ void drm_file_free(struct drm_file *file)
 
 	dev = file->minor->dev;
 
-	DRM_DEBUG("pid = %d, device = 0x%lx, open_count = %d\n",
-		  task_pid_nr(current),
+	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, open_count=%d\n",
+		  current->comm, task_pid_nr(current),
 		  (long)old_encode_dev(file->minor->kdev->devt),
 		  atomic_read(&dev->open_count));
 
@@ -345,7 +345,8 @@ static int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	if (dev->switch_power_state != DRM_SWITCH_POWER_ON && dev->switch_power_state != DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return -EINVAL;
 
-	DRM_DEBUG("pid = %d, minor = %d\n", task_pid_nr(current), minor->index);
+	DRM_DEBUG("comm=\"%s\", pid=%d, minor=%d\n", current->comm,
+		  task_pid_nr(current), minor->index);
 
 	priv = drm_file_alloc(minor);
 	if (IS_ERR(priv))
diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 22c7fd7196c8..ff5d40036e21 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -985,8 +985,8 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	if (!fn)
 		return drm_ioctl(filp, cmd, arg);
 
-	DRM_DEBUG("pid=%d, dev=0x%lx, auth=%d, %s\n",
-		  task_pid_nr(current),
+	DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",
+		  current->comm, task_pid_nr(current),
 		  (long)old_encode_dev(file_priv->minor->kdev->devt),
 		  file_priv->authenticated,
 		  drm_compat_ioctls[nr].name);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 73e31dd4e442..b03c34fb4467 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -852,8 +852,8 @@ long drm_ioctl(struct file *filp,
 		out_size = 0;
 	ksize = max(max(in_size, out_size), drv_size);
 
-	DRM_DEBUG("pid=%d, dev=0x%lx, auth=%d, %s\n",
-		  task_pid_nr(current),
+	DRM_DEBUG("comm=\"%s\" pid=%d, dev=0x%lx, auth=%d, %s\n",
+		  current->comm, task_pid_nr(current),
 		  (long)old_encode_dev(file_priv->minor->kdev->devt),
 		  file_priv->authenticated, ioctl->name);
 
@@ -890,15 +890,16 @@ long drm_ioctl(struct file *filp,
 
       err_i1:
 	if (!ioctl)
-		DRM_DEBUG("invalid ioctl: pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
-			  task_pid_nr(current),
+		DRM_DEBUG("invalid ioctl: comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, cmd=0x%02x, nr=0x%02x\n",
+			  current->comm, task_pid_nr(current),
 			  (long)old_encode_dev(file_priv->minor->kdev->devt),
 			  file_priv->authenticated, cmd, nr);
 
 	if (kdata != stack_kdata)
 		kfree(kdata);
 	if (retcode)
-		DRM_DEBUG("pid=%d, ret = %d\n", task_pid_nr(current), retcode);
+		DRM_DEBUG("comm=\"%s\", pid=%d, ret = %d\n", current->comm,
+			  task_pid_nr(current), retcode);
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
