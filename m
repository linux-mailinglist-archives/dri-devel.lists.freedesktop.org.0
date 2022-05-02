Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E414517181
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E1210ECA6;
	Mon,  2 May 2022 14:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BD310EBD3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:26:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B137C210EE;
 Mon,  2 May 2022 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651501528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2ED1eATtmVmsRI7X1td6FP/tXFWey4l7ybes0CKHPQ=;
 b=aKcGD2FdXC21A3cJduens8q7pTnm7IPiUmKDhdJEHNXX7DiPQq9BfFA0JscCdtf+BdYUJ0
 ETSBlqUKMdw8gToj9LzplaFHdD/LlRsM7z/4qe6oj4HiQc1b9ygZ3p0+Jxs0uWjYQNd9A8
 ws90oiW0Fv79/mLj/koHsFwVwgz2o5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651501528;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2ED1eATtmVmsRI7X1td6FP/tXFWey4l7ybes0CKHPQ=;
 b=xgz0o7XCJb+2fNs9GP3kAifSMOwQX0kXdK1ClmyFMfyXxR4sHKDMFuBWQkSRQUEQSkIWhl
 bZfEvIdmxxs08oAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E91513B0C;
 Mon,  2 May 2022 14:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GDkPItjpb2J4MgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 May 2022 14:25:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 1/3] drm: Add DRM-managed mutex_init()
Date: Mon,  2 May 2022 16:25:12 +0200
Message-Id: <20220502142514.2174-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502142514.2174-1-tzimmermann@suse.de>
References: <20220502142514.2174-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drmm_mutex_init(), a helper that provides managed mutex cleanup. The
mutex will be destroyed with the final reference of the DRM device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_managed.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 37d7db6223be6..4cf214de50c40 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -262,3 +263,29 @@ void drmm_kfree(struct drm_device *dev, void *data)
 	free_dr(dr_match);
 }
 EXPORT_SYMBOL(drmm_kfree);
+
+static void drmm_mutex_release(struct drm_device *dev, void *res)
+{
+	struct mutex *lock = res;
+
+	mutex_destroy(lock);
+}
+
+/**
+ * drmm_mutex_init - &drm_device-managed mutex_init()
+ * @dev: DRM device
+ * @lock: lock to be initialized
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ *
+ * This is a &drm_device-managed version of mutex_init(). The initialized
+ * lock is automatically destroyed on the final drm_dev_put().
+ */
+int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
+{
+	mutex_init(lock);
+
+	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
+}
+EXPORT_SYMBOL(drmm_mutex_init);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index b45c6fbf53ac4..359883942612e 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 
 struct drm_device;
+struct mutex;
 
 typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
 
@@ -104,4 +105,6 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
 void drmm_kfree(struct drm_device *dev, void *data);
 
+int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
+
 #endif
-- 
2.36.0

