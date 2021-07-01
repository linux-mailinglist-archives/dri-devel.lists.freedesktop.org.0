Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315573B94F3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 18:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B286EB5E;
	Thu,  1 Jul 2021 16:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E341A6EB5E;
 Thu,  1 Jul 2021 16:54:53 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id j24so6398408pfi.12;
 Thu, 01 Jul 2021 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/frhO6FmtYyjDjb4pEipIaBwOJXfhDMByIQ78NnCHs=;
 b=TCW+FmOiZG+i+Z/ZlOr4Z4hcJh9xukuhv0/R3u0l56bjD/mt47x8ru3BiFnaysVube
 BOUcvz1JQgMxOHNt0IWw3jlnPvMxWXA1DfutI6KdoBQhgOpDF3ctqkcr+4i+xDB4xu5b
 yYgdSENSWRrO1Auokd1gD8y1w94GkqMSBdWRsTXZuJqY3x9dtRRLYuZ5nCZBiN2LiT/w
 9Rfo9A9aw1K0zLKHVq5WupUS16wTSTwPpmesf8COEpqYZULJvGvTyrK1CnWv/V+OaPvC
 mWaDw6zsuAuTEjutPfyaN3GDLdFd/GuWlGJ1zdqrLedQT3+rppzgkjbzWV+C+xPnWSL+
 xZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/frhO6FmtYyjDjb4pEipIaBwOJXfhDMByIQ78NnCHs=;
 b=LKv880jHGyluvawQY4y6u1zMON0/YnYW4cH9MonVPpQHUePVTlNkk9tNgKGYBsMQnF
 ea+DH/LikxpvTZmYTbOzoww8mlWV6YiAxjhLflv1tF2oAY7E0dk+T0qqSwik7bdU3nlJ
 wbYgxW7jTq8wj61sUNyz8wv3QBS/jN8ahdKtXiTI1dLG4z5E5lVtnQgzgW0zEkamr2S/
 FCUdd05ScqQYvTwXbY+XbDywumCIJBE0DnUcFfuLVhVvhZjjk2bbBSkpx7Ik7L8AT1VH
 hARNc7qpQw81FuI+6on4lYKd8llVCmiaLw0WohJvD1tCAfh9emxmgFnp6Iu23D0HgNrU
 A8xA==
X-Gm-Message-State: AOAM5308SXZQddAlQZ0RfXPOmhiJFqX1SXJfgCJcEy0PuhQjV3f81X4i
 saQPhTuY6g6qeNxzoX/TepI=
X-Google-Smtp-Source: ABdhPJwE3OxMy8uOFmjcS/bajY7yrTC64aL5hOZ8sTBWSSVzlSL/vKTNf2leR7iswBH2WOcYCpq88g==
X-Received: by 2002:a63:65c5:: with SMTP id z188mr555583pgb.174.1625158493587; 
 Thu, 01 Jul 2021 09:54:53 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 09:54:53 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v7 4/5] drm: serialize drm_file.master with a master lock
Date: Fri,  2 Jul 2021 00:53:57 +0800
Message-Id: <20210701165358.19053-5-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701165358.19053-1-desmondcheongzx@gmail.com>
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, drm_file.master pointers should be protected by
drm_device.master_mutex when being dereferenced. This is because
drm_file.master is not invariant for the lifetime of drm_file. If
drm_file is not the creator of master, then drm_file.is_master is
false, and a call to drm_setmaster_ioctl will invoke
drm_new_set_master, which then allocates a new master for drm_file and
puts the old master.

Thus, without holding drm_device.master_mutex, the old value of
drm_file.master could be freed while it is being used by another
concurrent process.

However, it is not always possible to lock drm_device.master_mutex to
dereference drm_file.master. Through the fbdev emulation code, this
might occur in a deep nest of other locks. But drm_device.master_mutex
is also the outermost lock in the nesting hierarchy, so this leads to
potential deadlocks.

To address this, we introduce a new mutex at the bottom of the lock
hierarchy that only serializes drm_file.master. With this change, the
value of drm_file.master changes only when both
drm_device.master_mutex and drm_file.master_lock are held. Hence, any
process holding either of those locks can ensure that the value of
drm_file.master will not change concurrently.

Since no lock depends on the new drm_file.master_lock, when
drm_file.master is dereferenced, but drm_device.master_mutex cannot be
held, we can safely protect the master pointer with
drm_file.master_lock.

Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

Since our lock inversions were a result of dev->master_mutex being
used to serialize many other things, perhaps a finer grained lock will
solve the lockdep issues.

 drivers/gpu/drm/drm_auth.c | 10 ++++++++--
 drivers/gpu/drm/drm_file.c |  1 +
 include/drm/drm_file.h     | 12 +++++++++---
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index ab1863c5a5a0..fe5b6adc6133 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -169,11 +169,14 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 
 	WARN_ON(fpriv->is_master);
 	old_master = fpriv->master;
+	mutex_lock(&fpriv->master_lock);
 	fpriv->master = drm_master_create(dev);
 	if (!fpriv->master) {
 		fpriv->master = old_master;
+		mutex_unlock(&fpriv->master_lock);
 		return -ENOMEM;
 	}
+	mutex_unlock(&fpriv->master_lock);
 
 	fpriv->is_master = 1;
 	fpriv->authenticated = 1;
@@ -332,10 +335,13 @@ int drm_master_open(struct drm_file *file_priv)
 	 * any master object for render clients
 	 */
 	mutex_lock(&dev->master_mutex);
-	if (!dev->master)
+	if (!dev->master) {
 		ret = drm_new_set_master(dev, file_priv);
-	else
+	} else {
+		mutex_lock(&file_priv->master_lock);
 		file_priv->master = drm_master_get(dev->master);
+		mutex_unlock(&file_priv->master_lock);
+	}
 	mutex_unlock(&dev->master_mutex);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index d4f0bac6f8f8..8ccadfa1c752 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -176,6 +176,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
+	mutex_init(&file->master_lock);
 	mutex_init(&file->event_read_lock);
 
 	if (drm_core_check_feature(dev, DRIVER_GEM))
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index b81b3bfb08c8..88539f93fc8e 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -226,15 +226,21 @@ struct drm_file {
 	/**
 	 * @master:
 	 *
-	 * Master this node is currently associated with. Only relevant if
-	 * drm_is_primary_client() returns true. Note that this only
-	 * matches &drm_device.master if the master is the currently active one.
+	 * Master this node is currently associated with. Protected by struct
+	 * &drm_device.master_mutex, and serialized by @master_lock.
+	 *
+	 * Only relevant if drm_is_primary_client() returns true. Note that
+	 * this only matches &drm_device.master if the master is the currently
+	 * active one.
 	 *
 	 * See also @authentication and @is_master and the :ref:`section on
 	 * primary nodes and authentication <drm_primary_node>`.
 	 */
 	struct drm_master *master;
 
+	/** @master_lock: Serializes @master. */
+	struct mutex master_lock;
+
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
-- 
2.25.1

