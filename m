Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A60176716
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3646E898;
	Mon,  2 Mar 2020 22:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138FD6E892
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v2so1793880wrp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tblK/u9nBjJ5R7hevjSpwiPWMaL0E7vrW1c3srgkTWw=;
 b=Fzxi7lGpSOzgbK28vvMO0OU9iRPO81bGKysVS5XFGOFj23kopO0Vg4IlgdlTLA06sL
 UPrWNd1rgZ7FcZ1qnmgmL5fVCKvu35vI6fxwciSF7C7KaJVYajL7knibMxDH7F5BVqU/
 N7xcjZprgPQADGvuw4EsHw9OB6RLBf8lCwhIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tblK/u9nBjJ5R7hevjSpwiPWMaL0E7vrW1c3srgkTWw=;
 b=kiaCx3lv8XJtCByzFFCld97I3BJVAr1mo7KJ8YwkcHDRj+9HuV7odvvqjVli66ll8s
 UHqYb9owBDlJm5ePLPGvidTphTr1GNzOiGj1wZL+zDLyBDkoH8C6F0RNUzKu09qd0DED
 XzZ9hb0W5H/oko+NJNRlMhP1Ya4cRdahWbX1jonsFcIgWlWrXO3gjtt4Wq7qr2JaJyAr
 RPsOwo1dw3A3MuBAypy84jGBcf/YVmWYVzAz9TpE6KAaSWzA+LStdL4maN3oI/HWs35K
 zHjIfGnKYnZ/QowZKAuDWoFpMf7JN8U5e1CguXQ+/exxnkziP9ZFs7/s6zLNj2Ei/gtP
 owJg==
X-Gm-Message-State: ANhLgQ1xrD6TWoonQXbqQEaAH0zQ3PZP1tckdHy7qV581Nyy3zFI1BVf
 au+Ni/K8a3Od4pCi4YGue4vJoLVxHvI=
X-Google-Smtp-Source: ADFU+vtyKpmYlH88ixjzauTx25dgxjP0BG0l/nEbQZBTZJ9N6/Yfmef8vMcjS6AYTS4jNdMOmC8q5w==
X-Received: by 2002:adf:f751:: with SMTP id z17mr1669836wrp.207.1583188026446; 
 Mon, 02 Mar 2020 14:27:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:05 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/51] drm: Handle dev->unique with drmm_
Date: Mon,  2 Mar 2020 23:26:00 +0100
Message-Id: <20200302222631.3861340-21-daniel.vetter@ffwll.ch>
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

We need to add a drmm_kstrdup for this, but let's start somewhere.

This is not exactly perfect onion unwinding, but it's jsut a kfree so
doesn't really matter at all.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_drv.c     |  5 ++---
 drivers/gpu/drm/drm_managed.c | 16 ++++++++++++++++
 include/drm/drm_managed.h     |  1 +
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 1a048325f30e..ef79c03e311c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -777,7 +777,6 @@ void drm_dev_fini(struct drm_device *dev)
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
 	drm_legacy_destroy_members(dev);
-	kfree(dev->unique);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
@@ -1068,8 +1067,8 @@ EXPORT_SYMBOL(drm_dev_unregister);
  */
 int drm_dev_set_unique(struct drm_device *dev, const char *name)
 {
-	kfree(dev->unique);
-	dev->unique = kstrdup(name, GFP_KERNEL);
+	drmm_kfree(dev, dev->unique);
+	dev->unique = drmm_kstrdup(dev, name, GFP_KERNEL);
 
 	return dev->unique ? 0 : -ENOMEM;
 }
diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 57dc79fa90af..514d5bd42446 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -160,6 +160,22 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 }
 EXPORT_SYMBOL(drmm_kmalloc);
 
+char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
+{
+	size_t size;
+	char *buf;
+
+	if (!s)
+		return NULL;
+
+	size = strlen(s) + 1;
+	buf = drmm_kmalloc(dev, size, gfp);
+	if (buf)
+		memcpy(buf, s, size);
+	return buf;
+}
+EXPORT_SYMBOL_GPL(drmm_kstrdup);
+
 void drmm_kfree(struct drm_device *dev, void *data)
 {
 	struct drmres *dr_match = NULL, *dr;
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 7b5df7d09b19..89e6fce9f689 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -24,6 +24,7 @@ static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 {
 	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
 }
+char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
 void drmm_kfree(struct drm_device *dev, void *data);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
