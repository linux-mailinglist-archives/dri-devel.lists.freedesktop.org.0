Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD5172683
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14FD6ED0E;
	Thu, 27 Feb 2020 18:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC57882AF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:15:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t23so443150wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yswXnJx/KLRKLZ1EcnAm/PS8U8nl4TZHDp7JDN4HCfc=;
 b=lgBRqQmHuSh6dsIAJA560eGP/2omnqxKLiKLi1L5HtPZzbKXtPS2I358Im3ASg+xvt
 nxPjhr8yp6j1mcVYn9DqWF9/u0qQbHhSpm9wcUkp5cSDGRy+/7TLL4LLbwQ7VZbgoMvG
 ShuqxJU7VhIP+SCAVxVXocT2oXwrgYzfuqZaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yswXnJx/KLRKLZ1EcnAm/PS8U8nl4TZHDp7JDN4HCfc=;
 b=Hhx5g/6SoqYyAFhTNhaYf4hQxTLu9F0IlzMQVHxCaiM1Yvwo9yFK2XOP/qoamh3ufq
 d3zgsd7t1wJj5s5bOuiog1hL9Op2b6hYctNPzHnqEV3WOonn9mFaiE831d0KCs8cBiPc
 p5TFHgJBGwz3ZpMliFRrw2h/JZR0ozQeKUL0FVMSAFdDNNkwPgY0XtxSxp/ZFlQUWfX3
 0hxNRBSTQ7FksvEAnV4veBmRhGCgWSZCUdymS8ewJewjPdDXP2lS50AtqiFP2ZUkFGKX
 I2Id7jk56tYc56QdoTPB6jzfy7CP1n0tJXNGn4ST6LXi7XaWugHyGcwI71Kt5f1MqXxx
 TkQw==
X-Gm-Message-State: APjAAAUJ8dgQ0mPdlQQtDw4hadidcj9kfdL/QDjSyLbakb02iwx1dz8F
 gKE2s4af++Ta470iJQfJwGxXM/2Tky8=
X-Google-Smtp-Source: APXvYqyZNSTGTkS0qN50MTykvPvz6q4JuMttCXD01JXvMcFxc7/QASw5gHpDxnu0Gb479sYA3pfm3g==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr9070wmc.111.1582827354979;
 Thu, 27 Feb 2020 10:15:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:54 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/51] drm: Handle dev->unique with drmm_
Date: Thu, 27 Feb 2020 19:14:51 +0100
Message-Id: <20200227181522.2711142-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
 m.felsch@pengutronix.de
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
index 1ee606b4a4f9..782fd5d6f8b2 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -777,7 +777,6 @@ void drm_dev_fini(struct drm_device *dev)
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
 	drm_legacy_destroy_members(dev);
-	kfree(dev->unique);
 }
 EXPORT_SYMBOL(drm_dev_fini);
 
@@ -1063,8 +1062,8 @@ EXPORT_SYMBOL(drm_dev_unregister);
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
index a36d4604ee18..cc917187a723 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -149,6 +149,22 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
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
